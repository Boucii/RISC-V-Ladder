package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
//TODO: debug branchpresolvepack, add taken,remove target 
//no its actually specify the case that its not a branch but predicted as a branch and taken, and modify pcgen accordingly
class Branch_Presolve extends Module{
    val io=IO(new Bundle{
        val i_fetch_pack = Input(new fetch_pack())
        val o_branch_presolve_pack = Output(new branch_presolve_pack())
    })
    val branch_decoder0 =decoder(QMCMinimizer,io.i_fetch_pack.insts(0),
      TruthTable(Seq( 
            BitPat("b?????????????????000?????1100011") -> BitPat("b0100"),//BEQ
            BitPat("b?????????????????001?????1100011") -> BitPat("b0100"),//BNE
            BitPat("b?????????????????100?????1100011") -> BitPat("b0100"),//BLT
            BitPat("b?????????????????101?????1100011") -> BitPat("b0100"),//BGE
            BitPat("b?????????????????110?????1100011") -> BitPat("b0100"),//BLTU
            BitPat("b?????????????????111?????1100011") -> BitPat("b0100"),//BGEU
            BitPat("b?????????????????000?????1100111") -> BitPat("b1000"),//JALR
            BitPat("b?????????????????????????1101111") -> BitPat("b1000"),//JAL
            //BitPat("b00110000001000000000000000000000") -> BitPat("b0010"),//MRET
    ), BitPat("b0000")))
    
    val branch_decoder1 = decoder(QMCMinimizer , io.i_fetch_pack.insts(1) , TruthTable
        (
            Seq( 
            BitPat("b?????????????????000?????1100011") -> BitPat("b0100"),//BEQ
            BitPat("b?????????????????001?????1100011") -> BitPat("b0100"),//BNE
            BitPat("b?????????????????100?????1100011") -> BitPat("b0100"),//BLT
            BitPat("b?????????????????101?????1100011") -> BitPat("b0100"),//BGE
            BitPat("b?????????????????110?????1100011") -> BitPat("b0100"),//BLTU
            BitPat("b?????????????????111?????1100011") -> BitPat("b0100"),//BGEU
            BitPat("b?????????????????000?????1100111") -> BitPat("b1000"),//JALR
            BitPat("b?????????????????????????1101111") -> BitPat("b1000"),//JAL
            //BitPat("b00110000001000000000000000000000") -> BitPat("b0010")//MRET how to add this and ecall
            ), BitPat("b0000"))//BitPat.dontCare(4))
        )
    val br0 = branch_decoder0(0) || branch_decoder0(1) || branch_decoder0(2) || branch_decoder0(3)
    val br1 = branch_decoder1(0) || branch_decoder1(1) || branch_decoder1(2) || branch_decoder1(3)
    dontTouch(br1)
    dontTouch(io)
    //branch_presolve_valid is mispred, only when mispred a non-br to a br, and taken was predicted, presolve is valid.
    //another case of mispred a br to a non-br can't resolve by presolve if it's really going to take the branch,
    //and according to the bpu policy of only write btb on a branch taken, this case will be ignored now.  
    //other cases actually would not cause a control flow redirect, so will be ignored 
    io.o_branch_presolve_pack.valid := (io.i_fetch_pack.valids(0) && !br0 && io.i_fetch_pack.branch_predict_pack.valid && 
            io.i_fetch_pack.branch_predict_pack.taken && io.i_fetch_pack.branch_predict_pack.select === 0.U) ||
            (io.i_fetch_pack.valids(1) && !br1 && io.i_fetch_pack.branch_predict_pack.valid && 
            io.i_fetch_pack.branch_predict_pack.taken && io.i_fetch_pack.branch_predict_pack.select === 1.U)
    io.o_branch_presolve_pack.pc := Cat(io.i_fetch_pack.pc(63,3),0.U(3.W)) + Mux((io.i_fetch_pack.valids(0) && !br0 && io.i_fetch_pack.branch_predict_pack.valid && 
            io.i_fetch_pack.branch_predict_pack.taken && io.i_fetch_pack.branch_predict_pack.select === 0.U),4.U,8.U)
    io.o_branch_presolve_pack.taken := io.i_fetch_pack.branch_predict_pack.taken // this field seems to be redundent
}
