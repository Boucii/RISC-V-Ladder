package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Fetch_Queue extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(new fetch_pack()))
    val out = Decoupled(new fetch_pack())
    val full = Output(Bool())
    val empty = Output(Bool())
    val i_flush = Input(Bool())
  })
  val queue = Module(new Queue(new fetch_pack(), entries=64))
  queue.reset := reset.asBool()||io.i_flush
  queue.io.enq <> io.in
  io.out <> queue.io.deq

  io.out.bits := queue.io.deq.bits
  io.out.valid := queue.io.deq.valid && (!queue.reset.asBool())
  queue.io.deq.ready := io.out.ready

  io.full := !queue.io.enq.ready
  io.empty := !queue.io.deq.valid
}