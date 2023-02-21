package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Fetch_Res extends Module{
    val io =IO( new Bundle{
        val i_pc = Input(UInt(64.W))
        val i_flush = Input(Bool())
        val i_stall = Input(Bool())
        val i_fetch_res = Input(UInt(64.W))
        val i_branch_predict_pack = Input(new branch_predict_pack())

        val o_fetch_pack = Decoupled(new fetch_pack())
   })
    io.o_fetch_pack.valid := (io.o_fetch_pack.bits.valids(0) || io.o_fetch_pack.bits.valids(1))   
    io.o_fetch_pack.bits.valids(0) := !io.i_stall && !io.i_pc(2) && !io.i_flush
    io.o_fetch_pack.bits.valids(1) := !io.i_stall && !io.i_flush
    io.o_fetch_pack.bits.pc := Cat(io.i_pc(63,3),0.U(3.W))
    io.o_fetch_pack.bits.insts(0) := io.i_fetch_res(31,0)
    io.o_fetch_pack.bits.insts(1) := io.i_fetch_res(63,32)
    io.o_fetch_pack.bits.branch_predict_pack := io.i_branch_predict_pack
}
