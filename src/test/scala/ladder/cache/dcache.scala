package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class DcacheIOreg extends Bundle{
    val data_ready = Bool()
    val addr_valid = Bool()
    val Mwout   = UInt(1.W)
    val Maddr   = UInt(64.W)
    val Men     = Bool() 
    val Mlen    = UInt(32.W)
    val MdataOut=UInt(64.W)
}
class Dcache extends Module{
    val io = IO(new Bundle{
        val cpu_mem = Flipped(new DcacheIO())
        val mem_master = new AxiLiteMaster(64,128)
    })
//uncache addrs
val RTC_PORT_BASE 	=	0xa0000048L.U(64.W)
val SERIAL_PORT_BASE= 	0xa00003f8L.U(64.W)
val KBD_PORT_BASE 	=	0xa0000060L.U(64.W) 
val VGA_CTL_BASE 	=   0xa0000100L.U(64.W)
val VGA_MEM_BLK_S     =   0xa1000000L.U(64.W)
val VGA_MEM_BLK_E     =   0xa1000000L.U(64.W) + (400.U * 300.U * 4.U)
//dcache-----------------------------------------------
//2 way associate cache, 128 sets, 16 bytes per line
//4KB total, 64bits of paddr
//tag: 53 bits, index: 7 bits, offset: 4 bits
val cpu_mem = RegInit((0.U).asTypeOf(new DcacheIOreg()))
val last_cpumem_w = RegInit(false.B)
val initial_addr = RegInit(0.U(64.W))
val initial_len = RegInit(0.U(32.W))
val last_req = RegInit((0.U).asTypeOf(new DcacheIOreg()))
last_req := Mux(last_cpumem_w,cpu_mem,last_req)
val new_req = !((last_req.Mwout===cpu_mem.Mwout)&&(last_req.Men===cpu_mem.Men)&&(last_req.Maddr===initial_addr)&&
    (last_req.Mlen===initial_len)&&(last_req.MdataOut===cpu_mem.MdataOut))
//the lsu policy is, when write, once give the data to mem, it can go forward, it doesnt has to wait for write to finish.
//if we dont have this signal, if an new req comes before the old one finishes, it will see the datavalid signal of the old, 
//and mistaken is as the new one was done.
//icache components-------------------------------------
val tags0 = RegInit(VecInit(Seq.fill(128)(0.U(53.W))))//tag array
val tags1 = RegInit(VecInit(Seq.fill(128)(0.U(53.W))))//tag array
val valid0 = RegInit(VecInit(Seq.fill(128)(0.U(1.W))))//valid array
val valid1 = RegInit(VecInit(Seq.fill(128)(0.U(1.W))))//valid array
val dirty0 = RegInit(VecInit(Seq.fill(128)(false.B)))//tag array
val dirty1 = RegInit(VecInit(Seq.fill(128)(false.B)))//tag array
val data_array = Seq.fill(2)(Module(new Data_Array()))
//query the cache---------------------------------------
val tag    = Wire(UInt(53.W))
val index  = Wire(UInt(7.W))
val offset = Wire(UInt(4.W))
val hit_bank    = Wire(Vec(2,Bool()))
val hit         = Wire(Bool())
val victim = Reg(UInt(1.W))
val uncache = Wire(Bool())
val read_from_mem_buf = RegInit(0.U(128.W))
val write_back_is_finishing = Wire(Bool())
val read_data = Wire(UInt(128.W))
//crossline cache access---------------------------------------------
val crossline = Wire(Bool())
val crossline_read_buf = Wire(UInt(128.W))
val last_crossline_read_buf = RegInit(0.U(128.W))
val initial_offset = RegInit(0.U(4.W))
val bytes_to_blk_bound = 16.U-offset
val initial_bytes_to_bound = 16.U-initial_offset
val crossline_read_data = Wire(UInt(128.W))
val crossline_buf_cond = Wire(Bool())
val last_crossline_buf_cond = RegInit(false.B)
val last_writeback_cross_done =RegInit(false.B)
val last_cyc_addr = RegInit(0.U(64.W))
//fence.i access-----------------------------------------------------
val flushing = RegInit(false.B)
val should_flush = Wire(Bool())
val flush_counter = RegInit(0.U(8.W))//len(index)+len(waynum)  
//----------------------------------------------------------------
//state machine for memwrite---------------------------
//using not-write allocate, and write back policies,
//we only write back to mem on a read not hit, after the read data being fetched 
val s_wreset :: s_widle :: s_bus_addr :: s_bus_data :: s_bus_resp :: Nil = Enum(5)
val write_state = RegInit(s_wreset)
val next_write_state = Wire(UInt(3.W))

val s_reset :: s_idle :: s_bus :: Nil = Enum(3)
val state = RegInit(s_reset)
val next_state = Wire(UInt(2.W))

val write_done = (io.mem_master.writeResp.valid && io.mem_master.writeResp.ready)
val read_done = (io.mem_master.readData.valid && io.mem_master.readData.ready)

val should_write_back = Wire(Bool())
should_write_back := (state === s_bus && io.mem_master.readData.valid && io.mem_master.readData.ready && //!uncache &&
    Mux(victim.asBool(), valid1(index).asBool(), valid0(index).asBool()) && Mux(victim.asBool, dirty1(index), dirty0(index)))

val newinio=Wire(Bool())
newinio := !((io.cpu_mem.Mwout===cpu_mem.Mwout)&&(io.cpu_mem.Men===cpu_mem.Men)&&(io.cpu_mem.Maddr===initial_addr)&&
    (io.cpu_mem.Mlen===initial_len)&&(io.cpu_mem.MdataOut===cpu_mem.MdataOut))
last_cpumem_w := (next_state===s_idle && !crossline && newinio)
//in current structure, when need to write back victim, the datavalid to lsu will not turn into valid before writeback is finished.
//we can optimize it=> valid fetch before writeback.
//this reg is used to hold the fetched data until writeback of victim is finished, so then we can write the fetched data into the victim dataarray row.
read_from_mem_buf := Mux(io.mem_master.readData.valid,io.mem_master.readData.bits.data,read_from_mem_buf)

crossline_buf_cond := last_crossline_buf_cond || (crossline&&(read_done))
last_crossline_buf_cond := crossline && hit
last_writeback_cross_done := crossline && write_done
crossline := (((offset+cpu_mem.Mlen)&(0x10.U))(4).asBool)&&((offset+cpu_mem.Mlen)(3,0)=/=0.U)&&(!new_req)
last_cyc_addr := cpu_mem.Maddr
val last_hit_bank0 = RegInit(false.B)
last_hit_bank0 := hit_bank(0)
val first_half_data=Wire(UInt(128.W))
first_half_data := Mux(read_done&&crossline,io.mem_master.readData.bits.data,Mux(last_hit_bank0,data_array(0).io.o_rdata,data_array(1).io.o_rdata))
when(crossline_buf_cond){
  crossline_read_buf:=Mux(uncache,first_half_data,first_half_data>>(initial_offset<<3))
}.otherwise{
  crossline_read_buf:=last_crossline_read_buf
}
last_crossline_read_buf := crossline_read_buf

write_back_is_finishing := write_done && !cpu_mem.Mwout && cpu_mem.Men
//assign the parts
when(next_state===s_idle && !crossline && newinio && !flushing){
  cpu_mem := io.cpu_mem
  initial_offset := io.cpu_mem.Maddr(3,0)//duplicate
  initial_len := io.cpu_mem.Mlen
  initial_addr := io.cpu_mem.Maddr
}
//when(crossline && new_req &&(hit||read_done||write_done)){
when(crossline && !should_write_back  &&(hit||read_done||write_done)){
  cpu_mem.Maddr := cpu_mem.Maddr+bytes_to_blk_bound
  cpu_mem.Mlen := cpu_mem.Mlen-bytes_to_blk_bound
}
read_data := MuxCase(0.U,Seq(//this is ugly and coincidental, cause hit readout data next cyc
    (state === s_idle) -> MuxCase(0.U,Seq(
        (!uncache && hit_bank(0)) -> data_array(0).io.o_rdata,
        (!uncache && hit_bank(1)) -> data_array(1).io.o_rdata,
        uncache -> read_from_mem_buf
    )),
    (state === s_bus && io.mem_master.readData.valid) -> io.mem_master.readData.bits.data
    )
)
crossline_read_data := MuxCase(0.U,Seq.tabulate(15)(i=>(i+1)).map(i=>((initial_bytes_to_bound===i.U)->(Cat(read_data,crossline_read_buf(i*8-1,0))))))
io.cpu_mem.MdataIn := Mux(initial_offset=/=cpu_mem.Maddr(3,0),crossline_read_data,Mux(uncache,read_data,read_data>>(cpu_mem.Maddr(3,0)<<3)))
/*
io.cpu_mem.MdataIn := MuxCase(0.U,Seq(
    (state === s_idle) -> MuxCase(0.U,Seq(
        hit_bank(0) -> data_array(0).io.o_rdata,
        hit_bank(1) -> data_array(1).io.o_rdata
    )),
    (state === s_bus) -> Mux(cpu_mem.Maddr(3),io.mem_master.readData.bits.data(127,64),io.mem_master.readData.bits.data(63,0))
    )
)*/
//when write back, only when s_widle, the data is written into the dataarray
io.cpu_mem.data_valid := (next_state =/= s_bus)&&(!new_req)&&(cpu_mem.Men)&&(!cpu_mem.Mwout) && (write_state===s_widle) && (!crossline) && !(last_crossline_buf_cond) && !(last_writeback_cross_done)&&((last_cyc_addr===cpu_mem.Maddr&&hit)||(!hit))
io.cpu_mem.addr_ready := state === s_idle && !crossline

tag := cpu_mem.Maddr(63,11)
index := cpu_mem.Maddr(10,4)
offset := cpu_mem.Maddr(3,0)
hit_bank(0) := ((valid0(index) & (tags0(index) === tag)).asBool() && (!uncache))
hit_bank(1) := ((valid1(index) & (tags1(index) === tag)).asBool() && (!uncache))
hit := (hit_bank(0) || hit_bank(1)) && !uncache
victim := MuxCase(0.U,Seq(
    (!valid0(index).asBool)    -> 0.U,
    (valid0(index).asBool && !valid1(index).asBool)    -> 1.U ,
    (valid0(index).asBool && valid1(index).asBool)    -> 0.U
)
)
uncache := Mux(
    (cpu_mem.Maddr === RTC_PORT_BASE)||
    (cpu_mem.Maddr === RTC_PORT_BASE+4.U)||
    (cpu_mem.Maddr === KBD_PORT_BASE)||
    (cpu_mem.Maddr === VGA_CTL_BASE)||
    (cpu_mem.Maddr === VGA_CTL_BASE+2.U)||
    (cpu_mem.Maddr === VGA_CTL_BASE+4.U)||
    ((cpu_mem.Maddr >= VGA_MEM_BLK_S)&&(cpu_mem.Maddr < VGA_MEM_BLK_E)),
    true.B,false.B
)
when(io.cpu_mem.flush && !flushing && (!io.cpu_mem.flush_done)){
  flushing := true.B
}.elsewhen(flush_counter=== 0xff.U && (write_done||(!should_flush))){
  flushing := false.B
}.otherwise{
  flushing := flushing
}
should_flush := Mux(flush_counter(0).asBool(), valid1(flush_counter(7,1)).asBool(), valid0(flush_counter(7,1)).asBool()) && Mux(flush_counter(0).asBool, dirty1(flush_counter(7,1)), dirty0(flush_counter(7,1)))
when((write_done||(!should_flush)) && flushing){
  flush_counter:=flush_counter+1.U
}
io.cpu_mem.flush_done := (flush_counter===0xff.U && (write_done||(!should_flush)))

//connect data array
val strb = Wire(UInt(16.W))
strb := MuxCase(0.U,Seq(
    (cpu_mem.Mlen === 1.U )-> 0x0001.U,
    (cpu_mem.Mlen === 2.U )-> 0x0003.U,
    (cpu_mem.Mlen === 3.U )-> 0x0007.U,
    (cpu_mem.Mlen === 4.U )-> 0x000f.U,
    (cpu_mem.Mlen === 8.U )-> 0x00ff.U,
    (cpu_mem.Mlen === 16.U) -> 0xffff.U
))
val strb_aligned = Wire(UInt(16.W))
val smt = Wire(UInt(4.W))
smt := cpu_mem.Maddr(3,0)
    strb_aligned := (strb << smt)
for(i <- 0 to 1){
    data_array(i).io.i_ren := true.B
    data_array(i).io.i_wen := ((cpu_mem.Mwout.asBool && cpu_mem.Men && hit_bank(i))||((!cpu_mem.Mwout.asBool && state===s_bus && next_state===s_idle) && (i.U===victim)))&&(!flushing)
    data_array(i).io.i_wstrb := Mux(flushing,0xffff.U,Mux(hit,strb_aligned,0xffff.U))
    data_array(i).io.i_addr := Mux(flushing,flush_counter(7,1),index)
    data_array(i).io.i_wdata := Mux(write_back_is_finishing,read_from_mem_buf,Mux(hit,(cpu_mem.MdataOut<<(cpu_mem.Maddr(3,0)<<3)),io.mem_master.readData.bits.data))
}
//when there's a read that didnot hit, read mem and replace victim
when(!flushing && (next_state === s_idle) && (state === s_bus) && (victim === 0.U) && (!cpu_mem.Mwout)){
    valid0(index) := true.B
    dirty0(index) := false.B
    tags0(index) := cpu_mem.Maddr(63,11)
}
when(!flushing && ((next_state === s_idle) && (state === s_bus) && (victim === 1.U) && (!cpu_mem.Mwout))){
    valid1(index) := true.B
    dirty1(index) := false.B
    tags1(index) := cpu_mem.Maddr(63,11)
}
when(cpu_mem.Mwout.asBool && hit_bank(0)){
    dirty0(index) := true.B
}
when(cpu_mem.Mwout.asBool && hit_bank(1)){
    dirty1(index) := true.B
}
when(!cpu_mem.Mwout && next_write_state===s_widle && write_state=/=s_widle && hit_bank(0)){
    dirty0(index) := true.B
}
when(!cpu_mem.Mwout && next_write_state===s_widle && write_state=/=s_widle && hit_bank(1)){
    dirty1(index) := true.B
}
when(write_done && flushing && !flush_counter(0)){
    valid0(flush_counter(7,1)) := false.B
    dirty0(flush_counter(7,1)) := false.B
}
when(write_done && flushing && flush_counter(0)){
    valid1(flush_counter(7,1)) := false.B
    dirty1(flush_counter(7,1)) := false.B
}

//state machine-----------------------------------------


state := next_state
next_state := MuxCase(state,Seq(
    (state === s_reset)                                                         -> s_idle,
    //in a write mem, but the write in lsu is not immediately taken away,if we do not include this new req, the state will automatically go to sbus again.
    (state === s_idle && (!hit) && cpu_mem.Men && (new_req||(!new_req&&(cpu_mem.Maddr=/=initial_addr))))                      -> s_bus, 
    (state === s_bus && write_done)                                             -> s_idle,
    (state === s_bus && read_done && !(should_write_back))                      -> s_idle,
    (state === s_bus && read_done && (should_write_back))                       -> s_bus
))

write_state := next_write_state
next_write_state := MuxCase(write_state,Seq(
    (write_state === s_wreset)                                                  -> s_widle,
    (write_state === s_bus_addr && (io.mem_master.writeAddr.ready))             -> s_bus_data,
    (write_state === s_bus_data && (io.mem_master.writeData.ready))             -> s_bus_resp,
    (write_state === s_bus_resp && (io.mem_master.writeResp.valid))             -> s_widle,
    (write_state === s_widle && (next_state =/= s_bus) && (!flushing))          -> s_widle,
    (write_state === s_widle && !hit && cpu_mem.Mwout.asBool)                   -> s_bus_addr,
    (write_state === s_widle && should_write_back)                              -> s_bus_addr,
    (write_state === s_widle && should_flush &&flushing)                        -> s_bus_addr
))
//axi control signals
io.mem_master.readAddr.valid := (state === s_bus) && (!cpu_mem.Mwout) && (cpu_mem.Men) && (write_state===s_widle)
io.mem_master.readAddr.bits.addr := Mux(uncache,cpu_mem.Maddr,Cat(cpu_mem.Maddr(63,4),0.U(4.W)))
io.mem_master.readData.ready := (state === s_bus) && (write_state===s_widle)

io.mem_master.writeAddr.valid := (write_state === s_bus_addr)||(write_state === s_bus_data)
io.mem_master.writeAddr.bits.addr := Mux(flushing,Mux(!flush_counter(0).asBool,Cat(Seq(tags0(flush_counter(7,1)),flush_counter(7,1),0.U(4.W))),Cat(Seq(tags1(flush_counter(7,1)),flush_counter(7,1),0.U(4.W)))),
  Mux(!cpu_mem.Mwout,Mux(!victim.asBool,Cat(Seq(tags0(index),index,0.U(4.W))),Cat(Seq(tags1(index),index,0.U(4.W)))),cpu_mem.Maddr))
io.mem_master.writeData.valid := (write_state === s_bus_addr)||(write_state === s_bus_data)
io.mem_master.writeData.bits.data := Mux(flushing,
  Mux(flush_counter(0).asBool,data_array(1).io.o_rdata,data_array(0).io.o_rdata) ,
  Mux(!cpu_mem.Mwout, Mux(victim.asBool,data_array(1).io.o_rdata,data_array(0).io.o_rdata) ,cpu_mem.MdataOut))
io.mem_master.writeData.bits.strb := Mux(flushing||(!cpu_mem.Mwout),0xffff.U,strb)//???shift
io.mem_master.writeResp.ready := (write_state === s_bus_resp)

io.mem_master.readAddr.bits.prot := 0.U
io.mem_master.writeAddr.bits.prot := 0.U
}
