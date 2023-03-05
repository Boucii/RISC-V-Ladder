package Ladder
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class PC_Gen extends Module
{
    val io=IO(new Bundle{
        val i_stall = Input(Bool())
        val i_pc_redirect_valid = Input(new Bool())
        val i_pc_redirect_target = Input(UInt(64.W))

        val i_branch_predict_pack = Input(new branch_predict_pack())
        val i_branch_presolve_pack = Input(new branch_presolve_pack())
        val i_branch_resolve_pack = Input(new branch_resolve_pack())

        val o_pc = Output(UInt(64.W))
    })

    val pc = RegInit(0x80000000L.U(64.W));
    val npc = Wire(UInt(64.W)); 

    //o_pc is not guaranteed to aligned to fetch pack address
    //addr passed to icache is guaranteed to aligned to it
    //and the pc passed to later stages are not aligned to fetch address
    //so they can tell if the first inst of the fetchres is valid
    io.o_pc := pc 
    when(io.i_pc_redirect_valid){//interrupt, exception or ecall, mret
        npc := io.i_pc_redirect_target
    }.elsewhen(io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred){//branch mispredict
        npc := io.i_branch_resolve_pack.target
    }.elsewhen(io.i_branch_presolve_pack.valid && io.i_branch_presolve_pack.taken){//mispred a non-br as br and tk,redirect
    //why do we add 8 when pc(2)==1?
    //when valid mispred on 1st of a fetchpack, it means it mispred a non-br to a br.
    //the presolver then tells to mark the 2nd inst valid, so the inst after the 1st of the fetch pack is already fetched.
        npc := io.i_branch_presolve_pack.pc + Mux(io.i_branch_presolve_pack.pc(2),4.U,8.U)
    }.elsewhen(io.i_stall){
        npc := pc
    //when made prediction about the first of a fetch pack, but pc is the second one, ignore prediction
    }.elsewhen(io.i_branch_predict_pack.valid && io.i_branch_predict_pack.taken && !(io.i_branch_predict_pack.select === 0.U && pc(2) === 1.U)){
        npc := io.i_branch_predict_pack.target
    }.otherwise{
        npc := pc + Mux(pc(2),4.U(64.W),8.U(64.W))
    }
    
        pc := npc;

}
