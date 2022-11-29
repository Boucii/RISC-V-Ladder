package ladder
import chisel._

class PC_Gen extends Module
{
    val io=IO(new Bundle{
        val i_stall = Input(Bool())

        val i_branch_predict_pack = Input(new branch_predict_pack())
        val i_branch_presolve_pack = Input(new branch_presolve_pack())
        val i_branch_resolve_pack = Input(new branch_resolve_pack())

        val o_pc = Output(UInt(32.W))
    })

    val pc = Reg(UInt(32.W));
    val npc = Wire(UInt(32.W)); 

    io.o_pc := pc 

    when(io.i_branch_resolve_pack.mispred){// TODO : resolve should come first than presolve ,perhaps even first than stall
        npc := io.i_branch_resolve_pack.target;
    }.elsewhen(io.i_branch_presolve_pack.mispred){
        npc := io.i_branch_presolve_pack.target;
    }.elsewhen(io.i_branch_predict_pack.valid && io.i_branch_predict_pack.taken){
        npc := io.i_branch_predict_pack.target;
    }.elsewhen(io.i_stall){
        npc := pc;
    }.otherwise{
        npc := pc + 8.U;
    }
    
    when(reset.toBool()){
        pc := 0x80000000L.U;
    }.otherwise{
        pc := npc;
    }

}