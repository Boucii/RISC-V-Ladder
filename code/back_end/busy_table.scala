package ladder

import chisel3._

class Rename_Table extends Module{
    val io=IO(new Bundle{
        val i_allocated_uop=Input(Vec(2, new uop()))
        val o_busy0=Output(Vec(2,(Bool())))
        val o_busy1=Output(Vec(2,Bool()))

        val o_commit_pack=Input(Vec(2, new commit_pack()))//use it 4 both commit and rollback?
    })
    val busy_table = RegInit(0.U(128.W)) 

    val busy_table_next = busy_table || ~UIntToOH(i_commit_pack(0).valid && i_commit_pack(0).pdst) || ~UIntToOH(i_commit_pack(1).valid && i_commit_pack(1).pdst)//perhaps wrong logic

    busy_table := busy_table_next || (i_allocated_uop(0).valid && i_allocated_uop(0).valid && i_allocated_uop.pdst)|| (i_allocated_uop(1).valid && i_allocated_uop(1).valid && i_allocated_uop.pdst)

    //read
    io.o_busy0(0) := busy_table_next(i_allocated_uop(0).psrc0)
    io.o_busy0(1) := busy_table_next(i_allocated_uop(0).psrc1)

    io.o_busy0(0) := busy_table_next(i_allocated_uop(1).psrc0)
    io.o_busy0(1) := busy_table_next(i_allocated_uop(1).psrc1)  
}