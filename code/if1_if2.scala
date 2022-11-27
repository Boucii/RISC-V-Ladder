package cpu
import chisel._

class if2_if3 extends Module
{
    val io=new Bundle{
        val i_stall = Bool(OUTPUT)
        val i_flush = Bool(OUTPUT)

        val i_pc = UInt(INPUT,32.W)
        val o_pc = UInt(OUTPUT, 32.W)

        val i_branch_predict_pack = new branch_predict_pack().asInput
        val o_branch_predict_pack = new branch_predict_pack().asOutput
    }

    val pc = RegNext(32.W,io.i_pc);
    o_pc := pc;

    val branch_predict_pack = RegNext(io.i_branch_predict_pack);
    o_branch_predict_pack := branch_predict_pack;

}