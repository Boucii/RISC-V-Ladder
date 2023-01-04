package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3._
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

//假设这三个input 都是需要写物理寄存器的,如果不写,valid为0
//todo:0号preg恒为0,如果不写preg则置preg域为0
//stall信号,不要重复分配
class Busy_Table extends Module{
    val io=IO(new Bundle{
        val i_allocated_uops=Input(Vec(2, new uop()))
        val i_commit_packs=Input(Vec(2, new commit_pack()))
        val i_rollback_packs=Input(Vec(2, new rollback_pack()))
        val o_written_back=Output(UInt(128.W))
        val o_mapped = Output(UInt(128.W))
    })
   assert(!((io.i_commit_packs(0).valid || io.i_commit_packs(1).valid) && (io.i_rollback_packs(0).valid || io.i_rollback_packs(1).valid)),
        "rollback and commit cannot happen at the same time")

    val mapped = RegInit(0.U(128.W))
    val written_back = RegInit(0.U(128.W)-1.U) 

    //when allocate, set mapped, reset writtenback
    //when rollback, reseet mapped with new_dst
    //when commit, reset mapped with stale_dst, set writtenback with phy_dst

    //write newly allocated preg to busy table
    //and clear the commited preg 

    val next_written_back = Wire(UInt(128.W))
    next_written_back := (written_back | 
        (Fill(128,io.i_commit_packs(0).valid) & UIntToOH(io.i_commit_packs(0).uop.phy_dst)) | 
        (Fill(128,io.i_commit_packs(1).valid) & UIntToOH(io.i_commit_packs(1).uop.phy_dst))) & (
        ~(Fill(128,io.i_allocated_uops(0).valid) & UIntToOH(io.i_allocated_uops(0).phy_dst)) &
        ~(Fill(128,io.i_allocated_uops(1).valid) & UIntToOH(io.i_allocated_uops(1).phy_dst))) | 1.U(128.W)

    written_back := next_written_back 
    val next_mapped = Wire(UInt(128.W))
    next_mapped := ( mapped |
        (Fill(128,io.i_allocated_uops(0).valid) & UIntToOH(io.i_allocated_uops(0).phy_dst)) |
        (Fill(128,io.i_allocated_uops(1).valid) & UIntToOH(io.i_allocated_uops(1).phy_dst))) & (
        ~(Fill(128,io.i_commit_packs(0).valid) & UIntToOH(io.i_commit_packs(0).uop.stale_dst)) & 
        ~(Fill(128,io.i_commit_packs(1).valid) & UIntToOH(io.i_commit_packs(1).uop.stale_dst)))&(
        ~(Fill(128,io.i_rollback_packs(0).valid) & UIntToOH(io.i_rollback_packs(0).uop.phy_dst)) & 
        ~(Fill(128,io.i_rollback_packs(1).valid) & UIntToOH(io.i_rollback_packs(1).uop.phy_dst))) & (~1.U(128.W))

    mapped := next_mapped

    io.o_written_back := next_written_back
    io.o_mapped := next_mapped
}