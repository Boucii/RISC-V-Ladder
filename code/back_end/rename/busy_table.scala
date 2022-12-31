package Ladder

import chisel3._

class Rename_Table extends Module{
    val io=IO(new Bundle{
        val i_allocated_uops=Input(Vec(2, new uop()))
        val i_commit_packs=Input(Vec(2, new commit_pack()))
        val i_rollback_packs=Input(Vec(2, new i_rollback_pack()))
        val o_written_back=Output(UInt(128.W))
        val o_mapped = Output(UInt(128.W))
    })
    assert(((io.i_commit_packs(0).valid || io.i_commit_packs(1).valid) &&(io.i_rollpack_packs(0).valid || io.i_rollback_packs(1).valid)),
    "rollback and commit cannot happen at the same time")
    val mapped = RegInit(0.U(128.W))
    val written_back = RegInit(0.U(128.W)) 

    //when allocate, set mapped, reset writtenback
    //when rollback, reseet mapped with new_dst
    //when commit, reset mapped with stale_dst, set writtenback

    //write newly allocated preg to busy table
    //and clear the commited preg 

    val next_written_back = Wire(UInt(128.W))
    next_written_back := (written_back | 
        (Fill(128,io.i_commit_packs(0).valid) & UIntToOH(io.i_commit_packs(0).stale_dst)) | 
        (Fill(128,io.i_commit_packs(1).valid) & UIntToOH(io.i_commit_packs(1).stale_dst))) & (
        ~(Fill(128,io.i_allocated_uops(0).valid) & io.i_allocated_uops(0).arch_dst) &
        ~(Fill(128,io.i_allocated_uops(1).valid) & io.i_allocated_uops(1).arch_dst))

    val next_mapped = Wire(UInt(128.W))
    next_mapped := ( mapped |
        (Fill(128,io.i_allocated_uops(0).valid) & io.i_allocated_uops(0).arch_dst) |
        (Fill(128,io.i_allocated_uops(1).valid) & io.i_allocated_uops(1).arch_dst)) & (
        ~(Fill(128,io.i_commit_packs(0).valid) & UIntToOH(io.i_commit_packs(0).stale_dst)) & 
        ~(Fill(128,io.i_commit_packs(1).valid) & UIntToOH(io.i_commit_packs(1).stale_dst)))&(
        ~(Fill(128,io.i_rollback_packs(0).valid) & UIntToOH(io.i_rollback_packs(0).phy_dst)) & 
        ~(Fill(128,io.i_rollback_packs(1).valid) & UIntToOH(io.i_rollback_packs(1).phy_dst)))

    written_back := next_written_back 
    written_back(0) := 0.U
    //read
    mapped := next_mapped
    mapped(0) := 0.U

    io.o_written_back := next_written_back
    io.o_mapped := next_mapped
}