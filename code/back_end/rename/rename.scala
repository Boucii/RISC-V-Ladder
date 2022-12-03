package Ladder

import chisel3.util_


class Rename extends Module{
    val io=IO(new Bundle{
        val i_decode_packs=Input(Vec(2,new decode_pack))
        val i_commit_packs=Input(Vec(2,new commit pack))
        val i_rollback_packs=Input(Vec(2,new rollback pack))

        val o_free_list_full = Output(Bool())
        val o_rename_pack=Output(Vec(2,new rename_pack))
        val o_busy_table=Output(UInt(128.W))
    })
    val rename_table=Module(new Rename_Table()) 
    val free_list=Module(new Free_List())
    val busy_table=Module(new Busy_Table())

    rename_table.io.i_commit_packs := io.i_commit_packs
    rename_table.io.i_allocated_uops := free_list.io._allocated_packs//???

    free_list.io.i_free_list_reqs := io.i_decode_packs//???
    free_list.io.i_rollback_packs := i_rollback_packs
    free_list.io.i_commit_packs := io.i_commit_packs

    busy_table.io.i_commit_packs := io.i_commit_packs
    busy_table.io.i_allocated_uops := free_list.io._allocated_packs//???

    
    //output 
    io.o_rename_pack := rename_table.io.o_rename_res_packs
    io.o_busy_table := busy_table.io.o_busy_table
}