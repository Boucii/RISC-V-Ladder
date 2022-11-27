package cpu
import Chisel._

class BPU extends Module
{
    val io = new Bundle{
        val i_branch_presolve_pack = new branch_presolve_pack().asInput
        val i_branch_resolve_pack = new branch_resolve_pack().asInput

        val o_branch_predict_pack = Valid(new branch_predict_pack()).asOutput
    }
    o_branch_predict_pack.valid := 0.toBool()
    o_branch_predict_pack.taken := 0.toBool()
    o_branch_predict_pack.target := 0.U
    o_branch_predict_pack.type[0] := 0.toBool()
    o_branch_predict_pack.type[1] := 0.toBool()
}
