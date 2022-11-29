package cpu
import Chisel._

class BPU extends Module
{
    val io = IO(new Bundle{
        val i_branch_presolve_pack = Input(new branch_presolve_pack())
        val i_branch_resolve_pack = Input(new branch_resolve_pack())

        val o_branch_predict_pack = Output(Valid(new branch_predict_pack()))
    })
    o_branch_predict_pack.valid := 0.toBool()
    o_branch_predict_pack.taken := 0.toBool()
    o_branch_predict_pack.target := 0.U
    o_branch_predict_pack.type[0] := 0.toBool()
    o_branch_predict_pack.type[1] := 0.toBool()
}
