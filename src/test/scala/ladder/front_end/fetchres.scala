package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
/* Things to do with presolve mispred
 *1.fetch_pc(2)==0, predict.sel==0, if predict wrong(mistaken non-br to br), if pred tk, flush the previous stages, make insts(1) valid. o_predict_pack.valid=false
 *                                                           if pred ntk, do not flush, insts(1) valid, o_predict_pack.valid=false
 *2.fetch_pc(2)==0, predict.sel==1, if predict wrong, if pred tk, flush the previous stages, o_predict_pack.valid=false
 *                                                if pred ntk, do not flush, o_predict_pack.valid=false
 *3.fetch_pc(2)==1,predict.sel==0, disable presolve to avoid control flow change(or modify to make more fine-grained control)
 *4.fetch_pc(2)==1,predict.sel==1,same as above
 *
 * why disable predict pack on a mispred? 
 * because when mispred, the entry in btb will be marked as invalid
 * and when this inst goes into bru, it will add an entry in btb
 */

class Fetch_Res extends Module{
    val io =IO( new Bundle{
        val i_pc = Input(UInt(64.W))
        val i_flush = Input(Bool())
        val i_stall = Input(Bool())
        val i_fetch_res = Input(UInt(64.W))
        val i_branch_predict_pack = Input(new branch_predict_pack())
		val i_branch_presolve_pack = Input(new branch_presolve_pack())

        val o_fetch_pack = Decoupled(new fetch_pack())
        val o_fetch_pack_with_presolve = Decoupled(new fetch_pack())
   })
    io.o_fetch_pack.valid := (io.o_fetch_pack.bits.valids(0) || io.o_fetch_pack.bits.valids(1))   
    io.o_fetch_pack.bits.valids(0) := !io.i_stall && !io.i_pc(2) && !io.i_flush
    io.o_fetch_pack.bits.valids(1) := !io.i_stall && !io.i_flush && 
        !(io.i_branch_predict_pack.valid && io.i_branch_predict_pack.taken && io.i_branch_predict_pack.select === 0.U && io.i_pc(2) === 0.U)
    io.o_fetch_pack.bits.pc := Cat(io.i_pc(63,3),0.U(3.W))
    io.o_fetch_pack.bits.insts(0) := io.i_fetch_res(31,0)
    io.o_fetch_pack.bits.insts(1) := io.i_fetch_res(63,32)
    io.o_fetch_pack.bits.branch_predict_pack := io.i_branch_predict_pack

	io.o_fetch_pack_with_presolve.bits := io.o_fetch_pack.bits
    io.o_fetch_pack_with_presolve.valid := (io.o_fetch_pack_with_presolve.bits.valids(0) || io.o_fetch_pack_with_presolve.bits.valids(1))   
    io.o_fetch_pack_with_presolve.bits.valids(0) := io.o_fetch_pack.bits.valids(0)
    io.o_fetch_pack_with_presolve.bits.valids(1) := !io.i_stall && !io.i_flush && (
        !(io.i_branch_predict_pack.valid && io.i_branch_predict_pack.taken && io.i_branch_predict_pack.select === 0.U && io.i_pc(2) === 0.U) ||
        ((io.i_branch_predict_pack.valid && io.i_branch_predict_pack.taken && io.i_branch_predict_pack.select === 0.U && io.i_pc(2) === 0.U) && 
          (io.i_branch_presolve_pack.valid && io.i_branch_presolve_pack.taken))
    )

    when(io.i_branch_presolve_pack.valid){
      io.o_fetch_pack_with_presolve.bits.branch_predict_pack.valid := false.B
    }
}
