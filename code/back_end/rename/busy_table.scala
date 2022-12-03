package ladder

import chisel3._

//modify for rollback
class Rename_Table extends Module{
    val io=IO(new Bundle{
        val i_allocated_uops=Input(Vec(2, new uop()))
        val i_commit_packs=Input(Vec(2, new commit_pack()))//use it 4 both commit and rollback?
        val o_busy_table=Output(UInt(128.W))
    })
    val busy_table = RegInit(0.U(128.W)) 

    //write newly allocated preg to busy table
    //and clear the commited preg 
    val busy_table_next = busy_table || ~UIntToOH(i_commit_packs(0).valid && i_commit_packs(0).pdst) +
        || ~UIntToOH(i_commit_packs(1).valid && i_commit_packs(1).pdst|| (i_allocated_uops(0).valid && i_allocated_uops(0).valid && i_allocated_uops.pdst)|| (i_allocated_uops(1).valid && i_allocated_uops(1).valid && i_allocated_uops.pdst))//perhaps wrong logic

    busy_table := busy_table_next 

    //read
    io.o_busy_table := busy_table_next
}