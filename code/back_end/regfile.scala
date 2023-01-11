package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

//64bit regfile with 4 read ports, 2 write ports,with write to read bypass
class RegFile extends Module {
  val io = IO(new Bundle {
    val i_raddr1 = Input(UInt(7.W))
    val i_raddr2 = Input(UInt(7.W))
    val i_raddr3 = Input(UInt(7.W))
    val i_raddr4 = Input(UInt(7.W))

    val o_rdata1 = Output(UInt(64.W))
    val o_rdata2 = Output(UInt(64.W))
    val o_rdata3 = Output(UInt(64.W))
    val o_rdata4 = Output(UInt(64.W))

    val i_waddr1 = Input(UInt(7.W))
    val i_waddr2 = Input(UInt(7.W))

    val i_wdata1 = Input(UInt(64.W))
    val i_wdata2 = Input(UInt(64.W))

    val i_wenable1 = Input(Bool())
    val i_wenable2 = Input(Bool())
  })

  val regfile = RegInit(VecInit(0.U(128.W), 0.U(64.W)))

  when(io.i_wenable1) {
    regfile(io.i_waddr1) := io.i_wdata1
  }

  when(io.i_wenable2) {
    regfile(io.i_waddr2) := io.i_wdata2
  }

  io.o_rdata1 := MuxCase(regfile(io.i_raddr1),Seq(
    (io.i_wenable1 && io.i_waddr1 === io.i_raddr1) -> io.i_wdata1,
    (io.i_wenable2 && io.i_waddr2 === io.i_raddr1) -> io.i_wdata2
  ))
  io.o_rdata2 := MuxCase(regfile(io.i_raddr2),Seq(
    (io.i_wenable1 && io.i_waddr1 === io.i_raddr2) -> io.i_wdata1,
    (io.i_wenable2 && io.i_waddr2 === io.i_raddr2) -> io.i_wdata2
  ))
  io.o_rdata3 := MuxCase(regfile(io.i_raddr3),Seq(
    (io.i_wenable1 && io.i_waddr1 === io.i_raddr3) -> io.i_wdata1,
    (io.i_wenable2 && io.i_waddr2 === io.i_raddr3) -> io.i_wdata2
  ))
  io.o_rdata4 := MuxCase(regfile(io.i_raddr4),Seq(
    (io.i_wenable1 && io.i_waddr1 === io.i_raddr4) -> io.i_wdata1,
    (io.i_wenable2 && io.i_waddr2 === io.i_raddr4) -> io.i_wdata2
  ))
}