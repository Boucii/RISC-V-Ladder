package Ladder

import chisel3._

//考虑指令uop里的valid
//archdst是0的话,不需要分配
//写回时,协会的寄存器号没有测试
//this is currently unbypassable,can this be bypassed?
//在上层中需要加入,如果不写reg,就不req preg
//TODO:when exception,free 2 pregs per cyc
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3._
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Free_List extends Module{
    val io=IO(new Bundle{
        val i_free_list_reqs=Input(Vec(2, Bool()))
        val o_allocated_pregs=Output(Vec(2,UInt(7.W)))
        val o_empty=Output(Bool())

        val i_commit_packs=Input(Vec(2,new commit_pack()))
        val i_rollback_packs=Input(Vec(2,new rollback_pack()))

        val o_dbg_num = Output(UInt(7.W))
    })
    assert(!((io.i_commit_packs(0).valid || io.i_commit_packs(1).valid) && (io.i_rollback_packs(0).valid || io.i_rollback_packs(1).valid)),
        "rollback and commit cannot happen at the same time")

    val free_queue=Module(new Free_Queue())

    //allocate new pregs to dsts
    io.o_empty:=free_queue.io.o_empty
    io.o_allocated_pregs(0):=free_queue.io.o_phy_dst0//allocate only one for same dsts?
    io.o_allocated_pregs(1):=free_queue.io.o_phy_dst1

    free_queue.io.i_allocate_req0 := io.i_free_list_reqs(0)
    free_queue.io.i_allocate_req1 := io.i_free_list_reqs(1)

    //add to free lists (commit+rollback)
    free_queue.io.i_wen0:= ((io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.arch_dst=/=0.U ) || (io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.arch_dst=/=0.U ) 
        || (io.i_rollback_packs(0).valid && io.i_rollback_packs(0).uop.arch_dst=/=0.U) || (io.i_rollback_packs(1).valid && io.i_rollback_packs(1).uop.arch_dst=/=0.U))
    free_queue.io.i_wen1:=(((io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.arch_dst=/=0.U ) && (io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.arch_dst=/=0.U ) )
        || ((io.i_rollback_packs(0).valid && io.i_rollback_packs(0).uop.arch_dst=/=0.U) && (io.i_rollback_packs(1).valid && io.i_rollback_packs(1).uop.arch_dst=/=0.U)))


    /*
        write_0:                                                            
        1.any flush,then dont write
        3.2rollback && this inst writes preg ->idx0_new
        2.1rollback && this inst writes preg ->idx_new_theonerollback
        5.2commit && this inst writes preg   ->idx0_stale
        4.1commit && this inst writes preg   ->idx_stale_theonecommit
        aka.when theres 0, then 0,when no 0, but there's 1, then 1

        write_1:
        1.any flush,then dont write
        3.2rollback && this inst writes preg ->idx1_new
        2.1rollback && this inst writes preg ->0_new
        5.2commit && this inst writes preg   ->idx1_stale
        4.1commit && this inst writes preg   ->0_stale  
        
    */
    free_queue.io.i_wpregidx0:=MuxCase(0.U,Seq(
            ((io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.arch_dst=/=0.U)) -> io.i_commit_packs(0).uop.phy_dst,
           (!(io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.arch_dst=/=0.U) && (io.i_commit_packs(1).uop.valid && io.i_commit_packs(1).uop.arch_dst=/=0.U)) -> io.i_commit_packs(1).uop.phy_dst,
        ((io.i_rollback_packs(0).valid && io.i_rollback_packs(0).uop.arch_dst=/=0.U)) -> io.i_rollback_packs(0).uop.stale_dst,
       (!(io.i_rollback_packs(0).valid && io.i_rollback_packs(0).uop.arch_dst=/=0.U) && (io.i_rollback_packs(1).uop.valid && io.i_rollback_packs(1).uop.arch_dst=/=0.U)) -> io.i_rollback_packs(1).uop.stale_dst,
        )
    )

    free_queue.io.i_wpregidx1:=MuxCase(0.U,Seq(
            (io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.arch_dst=/=0.U) -> io.i_commit_packs(1).uop.phy_dst,//when only 1, wen1=0
            (io.i_rollback_packs(1).valid && io.i_rollback_packs(1).uop.arch_dst=/=0.U) -> io.i_rollback_packs(1).uop.stale_dst,
        )
    )
}
class Free_Queue extends Module{
    val io=IO(new Bundle{
        val i_wen0=Input(Bool())
        val i_wen1=Input(Bool())

        val i_allocate_req0 = Input(Bool())
        val i_allocate_req1 = Input(Bool())

        val i_wpregidx0=Input(UInt(7.W))
        val i_wpregidx1=Input(UInt(7.W))

        val o_empty=Output(Bool())

        val o_phy_dst0=Output(UInt(7.W))
        val o_phy_dst1=Output(UInt(7.W))
    })
    val queue=RegInit(VecInit.tabulate(127){i=>i.U(7.W)+1.U})
    val head=RegInit(0.U(7.W))
    val tail=RegInit(0.U(7.W))
    val full=RegInit(false.B)
    val allocated_num = RegInit(0.U(7.W))
    val next_allocated_num = Wire(UInt(7.W))

    next_allocated_num := (allocated_num + Mux(io.i_allocate_req0, 1.U, 0.U) + Mux(io.i_allocate_req1, 1.U, 0.U)
        - Mux(io.i_wen0, 1.U, 0.U) - Mux(io.i_wen1, 1.U, 0.U))

    allocated_num := next_allocated_num

    io.o_empty:=(next_allocated_num === 127.U || next_allocated_num === 126.U)
    //allocate
    io.o_phy_dst0:=Mux(io.i_allocate_req0, queue(head) , 0.U)
    io.o_phy_dst1:=MuxCase(0.U,Seq(//Mux(io.i_allocate_req0, queue(head+1.U), queue(head))
        (io.i_allocate_req0     && io.i_allocate_req1) -> queue(head+1.U),
        ((!io.i_allocate_req0)  && io.i_allocate_req1) -> queue(head)
    ))

    when(io.i_allocate_req0 && io.i_allocate_req1){
        head:=head+2.U
    }.elsewhen(io.i_allocate_req0 || io.i_allocate_req1){
        head:=head+1.U
    }

    //i_commit_packsate
    when(io.i_wen0 && io.i_wen1){
        queue(tail):=io.i_wpregidx0
        queue(tail+1.U):=io.i_wpregidx1
        tail:=tail+2.U
    }.elsewhen(io.i_wen1){
        queue(tail):=io.i_wpregidx1
        tail:=tail+1.U
    }
}