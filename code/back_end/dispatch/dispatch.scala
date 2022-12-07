package Ladder

import chisel3._

class Dispatch extends Module{
    val io=IO(new Bundle{
        val i_rename_pack=Input(new rename_pack)
        val i_mispred_flush=Input(new mispred_flush)

        val o_rob_allocate_req=Output(new rob_allocate_req)
        val i_rob_full=Input(new Bool())
        val o_dispatch_pack=Output(new dispatch_pack())
    })
    val uops=Vec(2, new uop())
    uops:=io.i_rename_pack.uops

    io.o_rob_allocate_req.num_need:=Muxcase(0.U,Seq(
        io.i_rename_pack.uops(0).valid && io.i_rename_pack.uops(1).valid ->2.U,
        io.i_rename_pack.uops(0).valid && !io.i_rename_pack.uops(1).valid ->1.U,
        !io.i_rename_pack.uops(0).valid && io.i_rename_pack.uops(1).valid ->1.U
    ))//consider br,jp,valid
    uops(0).rob_idx:=io.i_rename_pack.rob_idx0
    uops(1).rob_idx:=io.i_rename_pack.rob_idx1

    when(io.i_mispred_flush.valid){
        uops(0).valid:=false.B
        uops(1).valid:=false.B
    }

}