package cpu
import Chisel._

class branch_predict_pack extends Bundle
{
    //TODO: valid and is_branch?
    val valid = Bool()
    val taken = Bool()
    val target = UInt(32.W)
    val type = vec(2,Bool())    //type of branch
}

class branch_presolve_pack extends Bundle
{
    val mispred = Bool()
    val pc = UInt(32.W)
    //val target = UInt(32.W) //TODO: really needed?correct target
}
//?
class branch_resolve_pack extends Bundle
{
    val mispred = Bool()
    val pc = UInt(32.W)
    val target = UInt(32.W)
}

class fetch_pack extends Bundle
{
    val pc = UInt(32.W)
    val insts = Vec(2,UInt(32.W))
    val branch_predict_pack
}

class imem_fetch_req_interface extends Bundle
{
    val i_pc = UInt(32.W)
    val i_flush_s1 = Bool()
    val i_flush_s2 = Bool()
}

class imem_fetch_res_interface extends Bundle
{
    //val cache_ready = Bool()
    //val stall = Bool()
    val data = UInt(64.W)

}
