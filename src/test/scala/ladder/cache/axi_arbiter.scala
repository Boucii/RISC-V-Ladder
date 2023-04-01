package Ladder

import chisel3._
import chisel3.util._

class AXI4Lite_Arbiter extends Module {
  val io = IO(new Bundle {
    val in1 = Flipped(new AxiLiteMaster(64,128))
    val in2 = Flipped(new AxiLiteMaster(64,128))
    val out = new AxiLiteMaster(64,128) 
  })
  val s_idle :: s_in1 :: s_in2 :: Nil = Enum(3) 
  val state = RegInit(0.U(2.W))
  val in1Request = io.in1.writeAddr.valid || io.in1.readAddr.valid
  val in2Request = io.in2.writeAddr.valid || io.in2.readAddr.valid
  val in1done = ((io.in1.writeResp.valid && io.in1.writeResp.ready) || (io.in1.readData.valid && io.in1.readData.ready))
  val in2done = ((io.in2.writeResp.valid && io.in2.writeResp.ready) || (io.in2.readData.valid && io.in2.readData.ready))

  //dcache has a higher priority than icache
  state := MuxCase(state,Seq(
    (state === s_idle && in1Request && in2Request)      -> s_in2,
    (state === s_idle && in1Request && !in2Request)     -> s_in1,
    (state === s_idle && !in1Request && in2Request)     -> s_in2,
    (state === s_in1 && in1done && !in2Request)         -> s_idle,
    (state === s_in1 && in1done && in2Request)          -> s_in2,
    (state === s_in2 && in2done)                        -> s_idle
  ))
  when(state === s_idle){
    io.in1 <> DontCare
    io.in2 <> DontCare
    io.out <> DontCare
  }.elsewhen(state === s_in1){
    io.in1 <> io.out
    io.in2 <> DontCare
  }.elsewhen(state === s_in2){
    io.in2 <> io.out
    io.in1 <> DontCare
  }.otherwise{
    io.in1 <> DontCare
    io.in2 <> DontCare
    io.out <> DontCare
  }
}
/*
import chisel3._
import chisel3.util._

class Axi4LiteArbiter extends Module {
  val io = IO(new Bundle {
    val in1 = Flipped(new Axi4Lite)
    val in2 = Flipped(new Axi4Lite)
    val out = new Axi4Lite
  })

  val in1Request = io.in1.aw.valid || io.in1.ar.valid || io.in1.w.valid
  val in2Request = io.in2.aw.valid || io.in2.ar.valid || io.in2.w.valid

  val arbiter = Module(new Arbiter(UInt(1.W), 2))

  arbiter.io.in(0).valid := io.in1Request
  arbiter.io.in(1).valid := io.in2Request

  io.out.aw.valid := arbiter.io.out.valid && (io.in1.aw.valid && arbiter.io.chosen === 0.U || io.in2.aw.valid && arbiter.io.chosen === 1.U)
  io.out.aw.bits := Mux(io.in2.aw.valid && arbiter.io.chosen === 1.U, io.in2.aw.bits, io.in1.aw.bits)
  io.out.aw.ready := Mux(arbiter.io.chosen === 0.U, io.in1.aw.ready, io.in2.aw.ready)
  io.in1.aw.ready := arbiter.io.out.valid && arbiter.io.chosen === 0.U && io.out.aw.ready
  io.in2.aw.ready := arbiter.io.out.valid && arbiter.io.chosen === 1.U && io.out.aw.ready

  io.out.ar.valid := arbiter.io.out.valid && (io.in1.ar.valid && arbiter.io.chosen === 0.U || io.in2.ar.valid && arbiter.io.chosen === 1.U)
  io.out.ar.bits := Mux(io.in2.ar.valid && arbiter.io.chosen === 1.U, io.in2.ar.bits, io.in1.ar.bits)
  io.out.ar.ready := Mux(arbiter.io.chosen === 0.U, io.in1.ar.ready, io.in2.ar.ready)
  io.in1.ar.ready := arbiter.io.out.valid && arbiter.io.chosen === 0.U && io.out.ar.ready
  io.in2.ar.ready := arbiter.io.out.valid && arbiter.io.chosen === 1.U && io.out.ar.ready

  io.out.w.valid := arbiter.io.out.valid && (io.in1.w.valid && arbiter.io.chosen === 0.U || io.in2.w.valid && arbiter.io.chosen === 1.U)
  io.out.w.bits := Mux(io.in2.w.valid && arbiter.io.chosen === 1.U, io.in2.w.bits, io.in1.w.bits)
  io.out.w.ready := Mux(arbiter.io.chosen === 0.U, io.in1.w.ready, io.in2.w.ready)
  io.in1.w.ready := arbiter.io.out.valid && arbiter.io.chosen === 0.U && io.out.w.ready
  io.in2.w.ready := arbiter.io.out.valid && arbiter.io.chosen === 1.U && io.out.w.ready

  io.out.r.valid := io.in1.r.valid || io.in2.r.valid
 

*/
