package ladder
import Chisel._

//control signals of bundles are all decoupled
//aka. ready-valid to exchange signals are not in the bundles
//the valid signal is in the bundle stands for the validity of the data 
class branch_predict_pack extends Bundle
{
    //TODO: valid and is_branch?
    val valid = Bool()
    val taken = Bool()
    val target = UInt(32.W)
    //val type = vec(2,Bool())    //type of branch
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
class commit_pack extends Bundle()
{
   val valids     = Vec(2, Bool())
   val uops       = Vec(2, new MicroOp())
}

class ex_res_pack extends BoomBundle()(p)
{
   val uop = new MicroOp()
}

class rollback_pack extends Bundle()
{
   val valids     = Vec(2, Bool())//roll back on this one?
   val uops       = Vec(2, new MicroOp())
}

class rob_allocation_pack extends Bundle()
{
   val valids     = Vec(2, Bool())
   val uops       = Vec(2, new MicroOp())
}
class uop extends Bundle(){
    val valid=Bool()
    val pc=UInt(32.W)
    val inst=UInt(32.W)
    val func_unit=UInt(3.W)//TODO: change to enum

    val branch_predict_pack=new branch_predict_pack

    val dst_valid=Bool()
    val phy_dst=UInt(7.W)
    val stale_dst=UInt(7.W)
    val arch_dst=UInt(5.W)

    val regWen=Bool()

    val src1_valid=Bool()
    val phy_src1=UInt(7.W)
    val arch_src1=UInt(5.W)

    val src2_valid=Bool()
    val phy_src2=UInt(7.W)
    val arch_src2=UInt(5.W)

    val rob_idx = UInt(7.W)
    val imm = UInt(64.W)
    val imm_sel = Bool()

    val dst_value = UInt(64.W)
    val src1_value = UInt(64.W)
    val src2_value = UInt(64.W)

    val exception = Bool()

    val op1_sel = UInt(2.W)
    val op2_sel = UInt(3.W)//
    val imm_sel = UInt(3.W)//??select kind of imm
    val alu_sel = UInt(3.W)//??select alu functions
}
  // RS1 Operand Select Signal
  val OP1_RS1 = 0.U(2.W) // Register Source #1
  val OP1_ZERO= 1.U(2.W)
  val OP1_PC  = 2.U(2.W)
  val OP1_X   = BitPat("b??")

  // RS2 Operand Select Signal
  val OP2_RS2 = 0.U(3.W) // Register Source #2
  val OP2_IMM = 1.U(3.W) // immediate
  val OP2_ZERO= 2.U(3.W) // constant 0
  val OP2_X   = BitPat("b???")

object FuntionCode {
    val ALU = 1.U(6.W)
    val BRU = 2.U(6.W)
    val MEM = 4.U(6.W)
    val MUL = 8.U(6.W)
    val DIV = 16.U(6.W)
    val CSR = 32.U(6.W)
}

