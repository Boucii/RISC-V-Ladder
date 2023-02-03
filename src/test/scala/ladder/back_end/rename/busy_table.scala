package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.experimental.BundleLiterals._
//exception: mark every reg mapped but not writtenback unmapped, and reset writtenback of those bits
//假设这三个input 都是需要写物理寄存器的,如果不写,valid为0
//todo:0号preg恒为0,如果不写preg则置preg域为0
//stall信号,不要重复分配
class Busy_Table extends Module{
    val io=IO(new Bundle{
        val i_free_list_reqs=Input(Vec(2, Bool()))
        val o_allocated_pregs=Output(Vec(2,UInt(7.W)))
        val o_empty=Output(Bool())

        val i_allocated_uops=Input(Vec(2, new uop()))
        val i_commit_packs=Input(Vec(2, new commit_pack()))
        val i_rollback_packs=Input(Vec(2, new rollback_pack()))
        val o_written_back=Output(UInt(128.W))
        val o_mapped = Output(UInt(128.W))

        val i_exception = Input(Bool())
    })
    assert(!((io.i_commit_packs(0).valid || io.i_commit_packs(1).valid) && (io.i_rollback_packs(0).valid || io.i_rollback_packs(1).valid)),
        "rollback and commit cannot happen at the same time")

    val mapped = RegInit(0.U(128.W))
    val written_back = RegInit(0.U(128.W)-1.U) 

    //when allocate, set mapped, reset writtenback
    //when rollback, reseet mapped with new_dst,(set written back with new_dst)
    //when commit, reset mapped with stale_dst, set writtenback

    //write newly allocated preg to busy table
    //and clear the commited preg 

    val next_written_back = Wire(UInt(128.W))
    next_written_back := Mux(io.i_exception, 0.U(128.W)-1.U ,(written_back | 
        (Fill(128,io.i_commit_packs(0).valid) & UIntToOH(io.i_commit_packs(0).uop.phy_dst)) | 
        (Fill(128,io.i_commit_packs(1).valid) & UIntToOH(io.i_commit_packs(1).uop.phy_dst))) & (
        ~(Fill(128,io.i_allocated_uops(0).valid) & UIntToOH(io.i_allocated_uops(0).phy_dst)) &
        ~(Fill(128,io.i_allocated_uops(1).valid) & UIntToOH(io.i_allocated_uops(1).phy_dst))) |(
        (Fill(128,io.i_rollback_packs(0).valid) & UIntToOH(io.i_rollback_packs(0).uop.phy_dst)) | 
        (Fill(128,io.i_rollback_packs(1).valid) & UIntToOH(io.i_rollback_packs(1).uop.phy_dst)))| 1.U(128.W))

    written_back := next_written_back 
    //written_back(0) := 1.U

    val next_mapped = Wire(UInt(128.W))
    next_mapped := Mux(io.i_exception, mapped & written_back ,(mapped |
        (Fill(128,io.i_allocated_uops(0).valid) & UIntToOH(io.i_allocated_uops(0).phy_dst)) |
        (Fill(128,io.i_allocated_uops(1).valid) & UIntToOH(io.i_allocated_uops(1).phy_dst))) & (
        ~(Fill(128,io.i_commit_packs(0).valid) & UIntToOH(io.i_commit_packs(0).uop.stale_dst)) & 
        ~(Fill(128,io.i_commit_packs(1).valid) & UIntToOH(io.i_commit_packs(1).uop.stale_dst)))&(
        ~(Fill(128,io.i_rollback_packs(0).valid) & UIntToOH(io.i_rollback_packs(0).uop.phy_dst)) & 
        ~(Fill(128,io.i_rollback_packs(1).valid) & UIntToOH(io.i_rollback_packs(1).uop.phy_dst))) & (~1.U(128.W)))

    //read
    mapped := next_mapped
    //mapped(0) := 0.U

    io.o_written_back := next_written_back
    io.o_mapped := next_mapped

    val num_allocate =Wire(UInt(2.W))
    val num_rbk = Wire(UInt(2.W))
    val num_cmt_stale = Wire(UInt(2.W))
    val num_cmt_phy = Wire(UInt(2.W))
    num_allocate := Mux(io.i_free_list_reqs(0), 1.U, 0.U) + Mux(io.i_free_list_reqs(1), 1.U, 0.U)
    num_rbk := Mux((io.i_rollback_packs(0).valid)&&(io.i_rollback_packs(0).uop.phy_dst=/=0.U), 1.U, 0.U) + 
               Mux((io.i_rollback_packs(1).valid)&&(io.i_rollback_packs(1).uop.phy_dst=/=0.U), 1.U, 0.U) 
    num_cmt_stale := Mux((io.i_commit_packs(0).valid)&&(io.i_commit_packs(0).uop.stale_dst=/=0.U), 1.U, 0.U) + 
                     Mux((io.i_commit_packs(1).valid)&&(io.i_commit_packs(1).uop.stale_dst=/=0.U), 1.U, 0.U)
    num_cmt_phy := Mux((io.i_commit_packs(0).valid)&&(io.i_commit_packs(0).uop.phy_dst=/=0.U), 1.U, 0.U) +
                   Mux((io.i_commit_packs(1).valid)&&(io.i_commit_packs(1).uop.phy_dst=/=0.U), 1.U, 0.U)

    val num_mapped_not_writtenback = RegInit(0.U(7.W))
    val next_num_mapped_not_writtenback = Wire(UInt(7.W))
    next_num_mapped_not_writtenback := num_mapped_not_writtenback + num_allocate - num_rbk - num_cmt_phy
    num_mapped_not_writtenback := Mux(io.i_exception,0.U,next_num_mapped_not_writtenback)

    val allocated_num = RegInit(0.U(7.W))
    val next_allocated_num = Wire(UInt(7.W))
    next_allocated_num := Mux( io.i_exception, (allocated_num-num_mapped_not_writtenback) , (allocated_num + num_allocate - num_rbk - num_cmt_stale))
    allocated_num := next_allocated_num    

    val available0 = Wire(UInt(7.W))
    val available1 = Wire(UInt(7.W))
    available0 := PriorityEncoder(~mapped(127,1))+1.U
    available1 := 127.U-PriorityEncoder(~Reverse(mapped(127,1)))

    io.o_empty := next_allocated_num === 127.U || next_allocated_num === 126.U

    io.o_allocated_pregs(0) := Mux(io.i_free_list_reqs(0),available0,0.U)
    io.o_allocated_pregs(1) := Mux(io.i_free_list_reqs(1),available1,0.U)

    //printf("writtenback=%x \n",next_written_back)
    //printf("available1=%d\n\n",available1)
}