package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

//one btb_pack is for one fetchpack
class btb_pack extends Bundle{
    val valid = Bool()//per fetchpack
    val tag = UInt(10.W)//fetch_pack address, aligned to 8 bytes
    val branch_type = UInt(4.W)
    val target_address = UInt(64.W)//needs compress,perhaps
    val select = UInt(1.W)//which one of the fetchpack is the branch, if both are,then select 0
    val bht = UInt(2.W)//2 bits counter
}

class BPU extends Module {
    val io = IO(new Bundle{
        val i_addr = Input(UInt(64.W))//addr of the fetch pack,aligned to 8 bytes
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        val i_branch_presolve_pack = Input(new branch_presolve_pack())

        val o_branch_predict_pack = Output(new branch_predict_pack())//two insts in a fetch pack shares the same prediction
    })
    def btb_size = 512
    def idx_len = log2Ceil(btb_size)
    val btb = RegInit(0.U.asTypeOf(Vec(btb_size , new btb_pack())))
    //allocate ptr/victim ptr, consider btb as a queue, allocate from tail, victim from head
    val btb_victim_ptr = RegInit(0.U(idx_len.W))

    io.o_branch_predict_pack.valid := false.B
    io.o_branch_predict_pack.target := 0.U
    io.o_branch_predict_pack.branch_type := 0.U
    io.o_branch_predict_pack.select := 0.U
    io.o_branch_predict_pack.taken := false.B
    for(i <- 0 until btb_size){
        when(btb(i).tag === io.i_addr(12,3)){
            io.o_branch_predict_pack.valid := btb(i).valid
            io.o_branch_predict_pack.target := btb(i).target_address
            io.o_branch_predict_pack.branch_type := btb(i).branch_type
            io.o_branch_predict_pack.select := btb(i).select
            io.o_branch_predict_pack.taken := !btb(i).bht(1).asBool
        }        
    }
    /*
    Branch Resolve Update
    1.when didn't make a prediction(no entry in btb, aka default as not taken), and the branch is taken, then allocate a new entry in btb when resolved.
        (because only when resolved, we know it's target address) 
        the reason why we only add an entry to btb only when taken is this can save space in btb, and partly solves the problems of two br in one fetch packs.
        if given a more carefully designed victim algorithm, we can mark the not takens invalid entry for other entries to use
    2.when made a prediction, and resolved ,update btb
    3.the tag in btb is not full lengrh pc, so there's a chance that a non-branch is predicted as a branch, and 
        in branch presolve, we identify this case , then the entry in btb is marked invalid 
    4.another case is, when a branch is predicted, the entry in the btb is valid, but when resolved, the entry has became a victim
        this case is not happening in this design, cause btb entry num>possible inflight branch num
    */

    //when branch_resolve_pack valid, it is a branch. prediction_valid is false means doesn't has the corresbonding entry in btb
    when(io.i_branch_resolve_pack.valid && !io.i_branch_resolve_pack.prediction_valid && io.i_branch_resolve_pack.taken){
        btb(btb_victim_ptr).valid := true.B
        btb(btb_victim_ptr).tag := io.i_branch_resolve_pack.pc(12,3)//fetchpack address
        btb(btb_victim_ptr).target_address := io.i_branch_resolve_pack.target
        btb(btb_victim_ptr).branch_type := io.i_branch_resolve_pack.branch_type//??
        btb(btb_victim_ptr).select := io.i_branch_resolve_pack.pc(3) //if it's aligned to fetchpack address
        btb(btb_victim_ptr).bht := Mux(io.i_branch_resolve_pack.taken, 1.U(2.W), 0.U(2.W))

        //update victim ptr
        btb_victim_ptr := btb_victim_ptr + 1.U
    }
    //update on a mispredicted branch,暗含valid表示是一个branch,mispred代表即使没有pred,也可能会mispred
    //this entry_found logic is so not "a circuit" but a "program", optimize it later
    val entry_found = Wire(Bool())
    entry_found := false.B
    when(io.i_branch_resolve_pack.valid  && io.i_branch_resolve_pack.prediction_valid){
            for(i <- 0 until btb_size){
                when(btb(i).tag === io.i_branch_resolve_pack.pc(12,3)){
                    entry_found := true.B
                    btb(i).target_address := io.i_branch_resolve_pack.target
                    btb(i).select := io.i_branch_resolve_pack.pc(3) //if it's aligned to fetchpack address
                    btb(i).bht := MuxCase(DontCare,Seq(
                    (io.i_branch_resolve_pack.taken && btb(i).bht === 0.U) -> 1.U(2.W),
                    (io.i_branch_resolve_pack.taken && btb(i).bht === 1.U) -> 3.U(2.W),
                    (io.i_branch_resolve_pack.taken && btb(i).bht === 2.U) -> 3.U(2.W),
                    (io.i_branch_resolve_pack.taken && btb(i).bht === 3.U) -> 3.U(2.W),

                    (!io.i_branch_resolve_pack.taken && btb(i).bht === 0.U) -> 0.U(2.W),
                    (!io.i_branch_resolve_pack.taken && btb(i).bht === 1.U) -> 0.U(2.W),
                    (!io.i_branch_resolve_pack.taken && btb(i).bht === 2.U) -> 0.U(2.W),
                    (!io.i_branch_resolve_pack.taken && btb(i).bht === 3.U) -> 2.U(2.W)
                    ))
                }
            }
    } 
    //update on a branch resolve, but the original entry flushed, allocate a new entry
    when(io.i_branch_resolve_pack.valid  && io.i_branch_resolve_pack.prediction_valid && !entry_found){
        btb(btb_victim_ptr).valid := true.B
        btb(btb_victim_ptr).tag := io.i_branch_resolve_pack.pc(12,3)//fetchpack address
        btb(btb_victim_ptr).target_address := io.i_branch_resolve_pack.target
        btb(btb_victim_ptr).branch_type := io.i_branch_resolve_pack.branch_type//??
        btb(btb_victim_ptr).select := io.i_branch_resolve_pack.pc(3) //if it's aligned to fetchpack address
        btb(btb_victim_ptr).bht := Mux(io.i_branch_resolve_pack.taken, 1.U(2.W), 0.U(2.W))

        //update victim ptr
        btb_victim_ptr := btb_victim_ptr + 1.U
    }
    when(io.i_branch_presolve_pack.valid){
        for(i <- 0 until btb_size){
            when(btb(i).tag === io.i_branch_presolve_pack.pc(12,3)){
                btb(i).valid := false.B
            }
        }
    } 
}