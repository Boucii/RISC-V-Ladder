package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class allocation_res_pack extends Bundle{
    val rob_idx = UInt(7.W)
    val valid = Bool()
}
class Reorder_Buffer extends Module{
    val io =IO(new Bundle{
        //val i_flush = Input(Bool())
        val o_empty = Output(Bool())
        val o_full =Output(Bool())

        //from and to decode stage
        val i_rob_allocation_reqs = Input(Vec(2, new rob_allocation_req_pack()))
        val o_rob_allocation_ress = Output(Vec(2,new allocation_res_pack()))

        //to rename stage 
        val o_rollback_packs = Output(Vec(2,new valid_uop_pack()))
        //from exe stage
        val i_ex_res_packs = Input(Vec(2,new valid_uop_pack()))
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        //commit stage
        val o_commit_packs = Output(Vec(2,new valid_uop_pack()))
        //output to load/store
        val o_rob_head = Output(UInt(7.W))

        val o_exception = Output(Bool())
        val o_rolling_back = Output(Bool())

        //for debug
        val dbg_commit_ptr = Output(UInt(7.W))
        val dbg_allocate_ptr = Output(UInt(7.W))
        //val rob_state = Output(s_normal.asUInt())
    })

    val commit_ptr = RegInit(0.U(7.W))//rob head
    val allocate_ptr = RegInit(0.U(7.W))//rob tail

    //commit_ptr:=0.U
    //allocate_ptr:=0.U

    val s_reset :: s_normal :: s_rollback :: s_full :: Nil = Enum(4)//modify this FULL added make 1 slot available also full
    val rob_state = RegInit(s_normal)
    val next_rob_state = Wire(UInt(2.W))
    rob_state:=next_rob_state
    next_rob_state := 1.U//initialize,but not good,rewrite with muxcase to change the state

    io.dbg_commit_ptr:=commit_ptr
    io.dbg_allocate_ptr:=allocate_ptr

    //io.rob_state:=rob_state

    val last_num_to_roll_back = RegInit(0.U(7.W))
    val this_num_to_roll_back = Wire(UInt(7.W))

    last_num_to_roll_back := this_num_to_roll_back

    //!!!!!!改了branchresolvepakc的结果
    //判定要用下个周期的allocateptr而不是这个周期的
    //robstate也应该要看robstatenext
    this_num_to_roll_back := MuxCase(0.U,Seq(
      (next_rob_state === s_rollback && (allocate_ptr -2.U) > io.i_branch_resolve_pack.uop.rob_idx) ->2.U,
      (next_rob_state === s_rollback && (allocate_ptr -2.U) === io.i_branch_resolve_pack.uop.rob_idx)->1.U,
      (next_rob_state === s_rollback && (allocate_ptr -1.U) === io.i_branch_resolve_pack.uop.rob_idx) ->0.U
    )) 
    io.o_rob_head := commit_ptr

    //rob entries: should we wrap this in module or bundle?
    val rob_valid = RegInit(VecInit(Seq.fill(64){false.B}))
    val rob_uop = RegInit(0.U.asTypeOf(Vec(64, new uop())))
    val rob_exception = RegInit(0.U.asTypeOf(Vec(64, Bool())))
    val rob_done = RegInit(0.U.asTypeOf(Vec(64, Bool()))) // is this instr written back and ready to commit? is this necessary

    val will_commit = RegInit(0.U.asTypeOf(Vec(2,Bool())))
    val next_will_commit = Wire(Vec(2,Bool()))
    will_commit := next_will_commit
    val can_commit = RegInit(0.U.asTypeOf(Vec(2,Bool())))
    val next_can_commit = Wire(Vec(2,Bool()))
    can_commit := next_can_commit

    next_can_commit(0) := (rob_valid(commit_ptr)) && (rob_done(commit_ptr))
    next_can_commit(1) := rob_valid(commit_ptr+1.U) && rob_done(commit_ptr+1.U)

    next_will_commit(0) := rob_exception(commit_ptr)=/=0.U && next_can_commit(0) && (next_rob_state===s_normal || next_rob_state===s_full )
    next_will_commit(1) := rob_exception(commit_ptr)=/=0.U && rob_exception(commit_ptr+1.U)=/=0.U && next_can_commit(0) && next_can_commit(1) && (next_rob_state===s_normal || next_rob_state===s_full)

    //dispatch unit TODO:ptr pass 127??consider full???consider exception
      io.o_commit_packs(0).valid :=  (next_will_commit(0))&& (next_rob_state===s_normal || next_rob_state===s_full )
      io.o_commit_packs(1).valid :=  (next_will_commit(1))&&(next_will_commit(0))&& (next_rob_state===s_normal || next_rob_state===s_full )
      io.o_commit_packs(0).uop := (rob_uop(commit_ptr))
      io.o_commit_packs(1).uop := (rob_uop(commit_ptr+1.U))

      io.o_rob_allocation_ress(0).valid := !(next_rob_state===s_rollback || next_rob_state===s_full ) && io.i_rob_allocation_reqs(0).valid
      io.o_rob_allocation_ress(1).valid := !(next_rob_state===s_rollback || next_rob_state===s_full ) && io.i_rob_allocation_reqs(1).valid && io.i_rob_allocation_reqs(0).valid //dispatch 会req1 而不req0吗
      
      io.o_rollback_packs(0).valid := next_rob_state===s_rollback
      io.o_rollback_packs(1).valid := (this_num_to_roll_back === 2.U) && next_rob_state===s_rollback
      
      io.o_rollback_packs(0).uop:= rob_uop(allocate_ptr-1.U)
      io.o_rollback_packs(1).uop:= rob_uop(allocate_ptr-2.U)

      io.o_rob_allocation_ress(0).rob_idx := allocate_ptr
      io.o_rob_allocation_ress(1).rob_idx := allocate_ptr+1.U

    when(next_rob_state === s_normal){
      when(io.i_rob_allocation_reqs(0).valid && io.i_rob_allocation_reqs(1).valid){
        //rob_uop(allocate_ptr) := io.i_allocate_uops(0) write when write back
        rob_uop(allocate_ptr) := io.i_rob_allocation_reqs(0).uop
        rob_valid(allocate_ptr) := true.B
        rob_done(allocate_ptr) := false.B
        rob_uop(allocate_ptr+1.U) := io.i_rob_allocation_reqs(1).uop
        rob_valid(allocate_ptr+1.U) := true.B
        rob_done(allocate_ptr+1.U) := false.B
        allocate_ptr := allocate_ptr + 2.U 
      }.elsewhen(io.i_rob_allocation_reqs(0).valid || io.i_rob_allocation_reqs(1).valid){
        rob_uop(allocate_ptr) := Mux(io.i_rob_allocation_reqs(0).valid, io.i_rob_allocation_reqs(0).uop, io.i_rob_allocation_reqs(1).uop)
        //rob_uop(allocate_ptr) := io.i_allocate_uops(1)
        rob_valid(allocate_ptr) := true.B
        allocate_ptr := allocate_ptr + 1.U
        rob_done(allocate_ptr) := false.B
      }//otherwise no allocation

      when(io.i_ex_res_packs(0).valid){
        rob_valid(io.i_ex_res_packs(0).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop //modified for just dst value and other necessary info
        rob_exception(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop.exception
        rob_done(io.i_ex_res_packs(0).uop.rob_idx) := true.B
      }
      when(io.i_ex_res_packs(1).valid){
        rob_valid(io.i_ex_res_packs(1).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop
        rob_exception(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop.exception
        rob_done(io.i_ex_res_packs(1).uop.rob_idx) := true.B
      }
      //commit

      when(next_will_commit(0) && next_will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1.U) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(next_will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    when(next_rob_state === s_full){
      //when full cannot allocate ,but can roll back,exe write and commit
      when(io.i_ex_res_packs(0).valid){
        rob_valid(io.i_ex_res_packs(0).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop
        rob_exception(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop.exception
        rob_done(io.i_ex_res_packs(0).uop.rob_idx) := true.B
      }
      when(io.i_ex_res_packs(1).valid){
        rob_valid(io.i_ex_res_packs(1).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop
        rob_exception(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop.exception
        rob_done(io.i_ex_res_packs(1).uop.rob_idx) := true.B
      }
      //commit
      when(next_will_commit(0) && next_will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1.U) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(next_will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    when(next_rob_state === s_rollback){
      //when rollback, no allocation,no exe write, no commit
      allocate_ptr := allocate_ptr - this_num_to_roll_back
    }

/*
    io.o_exception:=(rob_exception(commit_ptr)===true.B && next_will_commit(0)===true.B || 
          (rob_exception(commit_ptr+1.U)===true.B && next_will_commit(0)===true.B && next_will_commit(1)===true.B))
*/
    io.o_exception:= rob_exception(commit_ptr)===true.B 

    val is_full =Wire(Bool()) //consider dynamic action
    is_full := (allocate_ptr + 2.U) === commit_ptr || (allocate_ptr + 1.U) === commit_ptr
    io.o_empty :=  commit_ptr === allocate_ptr  
    io.o_full := is_full
    
    io.o_rolling_back := next_rob_state

    next_rob_state:=MuxCase(rob_state,Seq(
      (rob_state === s_reset) -> s_normal,
      (rob_state === s_normal && is_full) -> s_full,
      ((rob_state ===s_normal) && (io.i_branch_resolve_pack.mispred && io.i_branch_resolve_pack.valid)) -> s_rollback,
      (rob_state === s_rollback && ((io.i_branch_resolve_pack.uop.rob_idx === allocate_ptr-1.U) ||
                   (io.i_branch_resolve_pack.uop.rob_idx === allocate_ptr-2.U) )) -> s_normal,
      (rob_state === s_full && will_commit(0)) -> s_normal
    ))
    //printf("rob_state:%d\n",rob_state)
    //printf("allocate_ptr:%d\n",allocate_ptr)
    //printf("rob_state:%d\n",rob_state)
    //printf("num_to_roll_back:%d\n",num_to_roll_back)
    //printf("\n")
    //printf("allocate_ptr:%d\n",allocate_ptr)
    //printf("can_commit(0):%d\n",io.o_commit_packs(0).valid)
    //printf("can_commit(1):%d\n",io.o_commit_packs(1).valid)
    //printf("can_commit(0):%d\n",io.o_commit_packs(0).valid)
    //printf("can_commit(1):%d\n",io.o_commit_packs(1).valid)
}
