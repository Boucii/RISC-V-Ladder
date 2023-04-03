package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class IcacheIOreg extends Bundle{
    val o_wen = Bool()
    val o_addr = UInt(64.W)
    val o_addr_valid = Bool()
}
class Icache extends Module{
    val io = IO(new Bundle{
        val cpu_if = Flipped(new IcacheIO())
        val mem_master = new AxiLiteMaster(64,128)
    })
//icache pipeline---------------------------------------
//2 way associate cache, 128 sets, 16 bytes per line
//4KB total, 64bits of paddr
//tag: 53 bits, index: 7 bits, offset: 4 bits
val cpu_if1 = RegInit((0.U).asTypeOf(new IcacheIOreg()))
val cpu_if2 = RegInit((0.U).asTypeOf(new IcacheIOreg()))
//val fetch_res_buf = RegInit(0.U(128.W))
//icache components-------------------------------------
val tags0 = RegInit(VecInit(Seq.fill(128)(0.U(53.W))))//tag array
val tags1 = RegInit(VecInit(Seq.fill(128)(0.U(53.W))))//tag array
val valid0 = RegInit(VecInit(Seq.fill(128)(0.U(1.W))))//valid array
val valid1 = RegInit(VecInit(Seq.fill(128)(0.U(1.W))))//valid array
val data_array = Seq.fill(2)(Module(new Data_Array()))
//query the cache---------------------------------------
val tag    = Wire(UInt(53.W))
val index  = Wire(UInt(7.W))
val offset = Wire(UInt(4.W))
val hit_bank    = Wire(Vec(2,Bool()))
val hit_bank2    = Wire(Vec(2,Bool()))
val hit         = Wire(Bool())
val victim = Wire(UInt(1.W))
//-----------------------------------------------
val s_reset :: s_idle :: s_bus :: Nil = Enum(3)
val state = RegInit(s_reset)
val next_state = Wire(UInt(2.W))
//assign the parts
when(io.cpu_if.o_stall1){
    cpu_if1 := cpu_if1
}.otherwise{
    cpu_if1 := io.cpu_if
}
cpu_if2 := Mux(!io.cpu_if.o_stall2,cpu_if1,cpu_if2)
/*
fetch_res_buf := Mux(state===s_bus,io.mem_master.readData.bits.data,fetch_res_buf)
fetch_res_buf := MuxCase(fetch_res_buf, Seq(
    //(!io.cpu_if.o_stall2) -> MuxCase(fetch_res_buf,Seq(
        (state === s_idle) -> MuxCase(0.U,Seq(
            hit_bank(0) -> data_array(0).io.o_rdata,
            hit_bank(1) -> data_array(1).io.o_rdata
            )),
        (state === s_bus) -> io.mem_master.readData.bits.data
    )
)
*/
val last_stall = RegInit(false.B)
val out_reg = RegInit(0.U(128.W))
val dout = Mux(hit_bank2(0),data_array(0).io.o_rdata,data_array(1).io.o_rdata)
val dout2 = Mux(last_stall,out_reg,dout)
val index2 = Wire(UInt(7.W))
val tag2 = Wire(UInt(53.W))
tag2 := cpu_if2.o_addr(63,11)
last_stall := io.cpu_if.o_stall2
out_reg := Mux(state===s_bus,io.mem_master.readData.bits.data,dout2)
io.cpu_if.i_data := Mux(!cpu_if2.o_addr(3), dout2(63,0),dout2(127,64))
io.cpu_if.i_data_valid := (state =/= s_bus)
io.cpu_if.i_addr_ready := (state =/= s_bus)

tag := cpu_if1.o_addr(63,11)
index := cpu_if1.o_addr(10,4)
offset := cpu_if1.o_addr(3,0)
hit_bank(0) := (valid0(index) & (tags0(index) === tag)) 
hit_bank(1) := (valid1(index) & (tags1(index) === tag))
hit_bank2(0) := (valid0(index2) & (tags0(index2) === tag2)) 
hit_bank2(1) := (valid1(index2) & (tags1(index2) === tag2))

hit := hit_bank(0) || hit_bank(1)
victim := MuxCase(0.U,Seq(
    (!valid0(index2).asBool)    -> 0.U,
    (valid0(index2).asBool && !valid1(index2).asBool)    -> 1.U ,
    (valid0(index2).asBool && valid1(index2).asBool)    -> 0.U
  )
)
//victim := ~index(6)
index2 := cpu_if2.o_addr(10,4)
//connect data array
for(i <- 0 to 1){
    data_array(i).io.i_ren := true.B
    data_array(i).io.i_wen := (next_state === s_idle) && (state === s_bus) && (i.U===victim)
    data_array(i).io.i_wstrb := 0xffff.U
    data_array(i).io.i_addr := Mux(state === s_bus,index2,index)
    data_array(i).io.i_wdata := io.mem_master.readData.bits.data
}
when((next_state === s_idle) && (state === s_bus) && (victim === 0.U)){
    valid0(index2) := true.B
    tags0(index2) := cpu_if2.o_addr(63,11)
}
when((next_state === s_idle) && (state === s_bus) && (victim === 1.U)){
    valid1(index2) := true.B
    tags1(index2) := cpu_if2.o_addr(63,11)
}
//state machine-----------------------------------------
state := next_state
next_state := MuxCase(state,Seq(
    (state === s_reset)                                   -> s_idle,
    (state === s_idle && (!hit))                          -> s_bus,
    (state === s_bus && (io.mem_master.readData.valid))   -> s_idle,
    (state === s_idle && (hit))                           -> s_idle
))

//axi control signals
io.mem_master.readAddr.valid := (state === s_bus)
io.mem_master.readAddr.bits.addr := Cat(cpu_if2.o_addr(63,4),0.U(4.W))
io.mem_master.readData.ready := (state === s_bus)

io.mem_master.writeResp.ready := 0.U
io.mem_master.writeAddr.bits.addr := 0.U
io.mem_master.readAddr.bits.prot := 0.U
io.mem_master.writeAddr.valid := 0.U
io.mem_master.writeData.bits.strb := 0.U
io.mem_master.writeData.valid := 0.U
io.mem_master.writeData.bits.data:= 0.U
io.mem_master.writeAddr.bits.prot := 0.U
io.mem_master.writeResp.ready := 0.U
io.mem_master.writeAddr.bits.addr := 0.U
io.mem_master.readAddr.bits.prot := 0.U
}
