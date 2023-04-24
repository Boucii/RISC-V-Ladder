package Ladder
import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class IF1_IF2 extends Module
{
    val io=IO(new Bundle{
        val i_stall = Input(Bool())
        val i_flush = Input(Bool())
        val o_fetch_valid = Output(Bool())

        val i_pc = Input(UInt(64.W))
        val o_pc = Output(UInt(64.W))

        val i_branch_predict_pack = Input(new branch_predict_pack())
        val o_branch_predict_pack = Output(new branch_predict_pack())

    })
    val pc = RegInit(0.U(64.W));
    pc := Mux(io.i_flush, 0.U, Mux(io.i_stall, pc, io.i_pc))
    //io.o_pc := pc;
    io.o_pc := Mux(io.i_flush||io.i_stall, 0.U ,pc)

    val branch_predict_pack = RegInit(0.U.asTypeOf(new branch_predict_pack()));
    branch_predict_pack := Mux(io.i_flush, 0.U.asTypeOf(new branch_predict_pack()), Mux(io.i_stall, branch_predict_pack, io.i_branch_predict_pack))
    branch_predict_pack.valid := Mux(io.i_flush, false.B, Mux(io.i_stall, branch_predict_pack.valid, io.i_branch_predict_pack.valid))
    io.o_branch_predict_pack :=branch_predict_pack
    io.o_branch_predict_pack.valid := Mux(io.i_flush||io.i_stall, false.B, branch_predict_pack.valid)

    val fetch_valid = RegInit(false.B)
    fetch_valid := Mux(io.i_flush, false.B, Mux(io.i_stall, fetch_valid, true.B))
    io.o_fetch_valid := Mux(io.i_flush||io.i_stall, false.B ,fetch_valid)
}