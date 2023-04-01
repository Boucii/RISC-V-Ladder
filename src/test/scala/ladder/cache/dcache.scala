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
val VGA_MEM_BLK_E     =   0xa1000000L.U(64.W) + (400.U * 300.U)
//dcache-----------------------------------------------
//2 way associate cache, 128 sets, 16 bytes per line
//4KB total, 64bits of paddr
//tag: 53 bits, index: 7 bits, offset: 4 bits
val cpu_mem = RegInit((0.U).asTypeOf(new DcacheIOreg()))
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
//----------------------------------------------------------------
val s_reset :: s_idle :: s_bus :: Nil = Enum(3)
val state = RegInit(s_reset)
val next_state = Wire(UInt(2.W))
val should_write_back = Wire(Bool())
should_write_back := (state === s_bus && io.mem_master.readData.ready && !uncache &&
    Mux(victim.asBool(), valid1(index).asBool(), valid0(index).asBool()) && Mux(victim.asBool, dirty1(index), dirty0(index)))

//assign the parts
cpu_mem := io.cpu_mem
io.cpu_mem.MdataIn := MuxCase(0.U,Seq(
    (state === s_idle) -> MuxCase(0.U,Seq(
        hit_bank(0) -> data_array(0).io.o_rdata,
        hit_bank(1) -> data_array(1).io.o_rdata
    )),
    (state === s_bus) ->io.mem_master.readData.bits.data
    )
)
io.cpu_mem.data_valid := (state =/= s_bus)
io.cpu_mem.addr_ready := (state === s_idle)

tag := cpu_mem.Maddr(63,11)
index := cpu_mem.Maddr(10,4)
offset := cpu_mem.Maddr(3,0)
hit_bank(0) := (valid0(index) & (tags0(index) === tag))
hit_bank(1) := (valid1(index) & (tags1(index) === tag))
hit := (hit_bank(0) || hit_bank(1)) && !uncache
victim := MuxCase(0.U,Seq(
    (valid0(index).asBool)    -> 0.U,
    (!valid0(index).asBool && valid1(index).asBool)    -> 1.U ,
    (!valid0(index).asBool && !valid1(index).asBool)    -> 0.U
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
for(i <- 0 to 1){
    data_array(i).io.i_ren := true.B
    data_array(i).io.i_wen := cpu_mem.Mwout.asBool && hit
    data_array(i).io.i_wstrb := Mux(hit,strb,0xffff.U)
    data_array(i).io.i_addr := index
    data_array(i).io.i_wdata := Mux(hit,cpu_mem.MdataOut,io.mem_master.readData.bits.data)
}
//when there's a read that didnot hit, read mem and replace victim
when((next_state === s_idle) && (state === s_bus) && (victim === 0.U) && (!cpu_mem.Mwout)){
    valid0(index) := true.B
    dirty0(index) := false.B
    tags0(index) := cpu_mem.Maddr(63,11)
}
when((next_state === s_idle) && (state === s_bus) && (victim === 1.U) && (!cpu_mem.Mwout)){
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
//state machine-----------------------------------------
val write_done = (io.mem_master.writeResp.valid && io.mem_master.writeResp.ready)
val read_done = (io.mem_master.readData.valid && io.mem_master.readData.ready)
state := next_state
next_state := MuxCase(state,Seq(
    (state === s_reset)                                                         -> s_idle,
    (state === s_idle && (!hit))                                                -> s_bus, 
    (state === s_bus && write_done) -> s_idle,
    (state === s_bus && read_done && !(should_write_back)) -> s_idle,
    (state === s_bus && read_done && (should_write_back))  -> s_bus
))
//state machine for memwrite---------------------------
//using not-write allocate, and write back policies,
//we only write back to mem on a read not hit, after the read data being fetched 
val s_wreset :: s_bus_addr :: s_bus_data :: s_bus_resp :: s_widle :: Nil = Enum(5)
val write_state = RegInit(s_wreset)
val next_write_state = Wire(UInt(3.W))

write_state := next_write_state
next_write_state := MuxCase(s_widle,Seq(
    (write_state === s_wreset)                                                  -> s_widle,
    (write_state === s_bus_addr && (io.mem_master.writeAddr.ready))             -> s_bus_data,
    (write_state === s_bus_data && (io.mem_master.writeData.ready))             -> s_bus_resp,
    (write_state === s_bus_resp && (io.mem_master.writeResp.valid))             -> s_widle,
    (write_state === s_widle && (next_state =/= s_bus))                         -> s_widle,
    (write_state === s_widle && !hit && cpu_mem.Mwout.asBool)                   -> s_bus_addr,
    (write_state === s_widle && should_write_back)                              -> s_bus_addr
))
//axi control signals
io.mem_master.readAddr.valid := (state === s_bus) && (!cpu_mem.Mwout) && (cpu_mem.Men)
io.mem_master.readAddr.bits.addr := Cat(cpu_mem.Maddr(63,4),0.U(4.W))
io.mem_master.readData.ready := (state === s_bus)

io.mem_master.writeAddr.valid := (write_state === s_bus_addr)||(write_state === s_bus_addr)
io.mem_master.writeAddr.bits.addr := Mux(!cpu_mem.Mwout,Mux(!victim.asBool,Cat(tags0(index),0.U(11.W)),Cat(tags1(index),0.U(11.W))),cpu_mem.Maddr)
io.mem_master.writeData.valid := (write_state === s_bus_addr)||(write_state === s_bus_data)
io.mem_master.writeData.bits.data := Mux(!cpu_mem.Mwout, Mux(victim.asBool,data_array(1).io.o_rdata,data_array(0).io.o_rdata) ,cpu_mem.MdataOut)
io.mem_master.writeData.bits.strb := Mux(!cpu_mem.Mwout,0xffff.U,strb)
io.mem_master.writeResp.ready := (write_state === s_bus_resp)

io.mem_master.readAddr.bits.prot := 0.U
io.mem_master.writeAddr.bits.prot := 0.U
}
