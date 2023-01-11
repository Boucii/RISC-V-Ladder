package Ladder
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class if2_if3 extends Module
{
    val io=IO(new Bundle{
        val i_stall = Input(Bool())
        val i_flush = Input(Bool())

        val i_pc = Input(UInt(32.W))
        val o_pc = Output(UInt(32.W))

        val i_branch_predict_pack = Input(new branch_predict_pack())
        val o_branch_predict_pack = Output(new branch_predict_pack())
    })

    val pc = Reg(UInt(32.W));
    pc := Mux(io.i_flush, 0.U, Mux(io.i_stall, pc, io.i_pc))
    io.o_pc := pc;

    val branch_predict_pack = Reg(new branch_predict_pack());
    branch_predict_pack.valid := Mux(io.i_flush, false.B, Mux(io.i_stall, branch_predict_pack.valid, io.i_branch_predict_pack.valid))
    branch_predict_pack.taken := Mux(io.i_flush, false.B, Mux(io.i_stall, branch_predict_pack.taken, io.i_branch_predict_pack.taken))
    branch_predict_pack.target := Mux(io.i_flush, 0.U, Mux(io.i_stall, branch_predict_pack.target, io.i_branch_predict_pack.target))
    io.o_branch_predict_pack :=branch_predict_pack
}