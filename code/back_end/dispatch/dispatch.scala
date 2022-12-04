package Ladder

import chisel3._

class Dispatch extends Module{
    val io=IO(new Bundle{
        val i_rename_pack=Input(new rename_pack)
        val i_mispred_flush=Input(new mispred_flush)

        val o_rob_allocate_req=Output(new rob_allocate_req)
    }
}