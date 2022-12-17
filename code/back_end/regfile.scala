package Ladder

import Chisel3._

//64bit regfile with 4 read ports, 2 write ports,with write to read bypass
class RegFile extends Module {
  val io = IO(new Bundle {
    val raddr1 = Input(UInt(7.W))
    val raddr2 = Input(UInt(7.W))
    val raddr3 = Input(UInt(7.W))
    val raddr4 = Input(UInt(7.W))

    val rdata1 = Output(UInt(64.W))
    val rdata2 = Output(UInt(64.W))
    val rdata3 = Output(UInt(64.W))
    val rdata4 = Output(UInt(64.W))

    val waddr1 = Input(UInt(7.W))
    val waddr2 = Input(UInt(7.W))

    val wdata1 = Input(UInt(64.W))
    val wdata2 = Input(UInt(64.W))

    val wenable1 = Input(Bool())
    val wenable2 = Input(Bool())
  })

  val regfile = RegInit(128, UInt(64.W))

  when(io.wenable1) {
    regfile(io.waddr1) := io.wdata1
  }

  when(io.wenable2) {
    regfile(io.waddr2) := io.wdata2
  }

  io.rdata1 := MuxCase(regfile(io.raddr1),Seq(
    io.wenable1 && io.waddr1 === io.raddr1 -> io.wdata1
    io.wenable2 && io.waddr2 === io.raddr1 -> io.wdata2
  ))
  io.rdata2 := MuxCase(regfile(io.raddr2),Seq(
    io.wenable1 && io.waddr1 === io.raddr2 -> io.wdata1
    io.wenable2 && io.waddr2 === io.raddr2 -> io.wdata2
  ))
  io.rdata3 := MuxCase(regfile(io.raddr3),Seq(
    io.wenable1 && io.waddr1 === io.raddr3 -> io.wdata1
    io.wenable2 && io.waddr2 === io.raddr3 -> io.wdata2
  ))
  io.rdata4 := MuxCase(regfile(io.raddr4),Seq(
    io.wenable1 && io.waddr1 === io.raddr4 -> io.wdata1
    io.wenable2 && io.waddr2 === io.raddr4 -> io.wdata2
  ))
}