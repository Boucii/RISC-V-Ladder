package Ladder

import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Reservation_Station_Slot extends Module with consts{
    val io=IO(new Bundle{
        val o_valid = Output(Bool()) //is this slot occupied
        val o_ready_to_issue = Output(Bool())

        val i_allocated_idx = Input(UInt(1.W)) //if allocated two insts, is this slot the 1 or 2? 0 stands for 1st allocated,1 for second
        val i_issue_granted = Input(Bool())//???
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        val i_exception = Input(Bool())

        val i_write_slot = Input(Bool())
        //val i_wakeup_ports =  Input(Vec(2,Valid(UInt(128.W)))).flip//number of pregs, TODO:make it paramed,this really need valid?
        val i_wakeup_port = Input(UInt(128.W))
        val i_uop = Input(new uop())
        val o_uop = Output(new uop())

        val i_exe_dst1 = Input(UInt(7.W))
        val i_exe_dst2 = Input(UInt(7.W))

        val i_exe_value1 = Input(UInt(64.W))
        val i_exe_value2 = Input(UInt(64.W))


        val cond = Output(Bool())

        val i_ROB_first_entry = Input(UInt(rob_idx_len.W))
    })

    val uop = RegInit(0.U.asTypeOf(new uop()))
    io.o_uop := uop

    val valid = RegInit(false.B)
    io.o_valid := valid

    val flush = Wire(Bool())
    flush := io.i_exception ||
            (valid && (io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred &&
              ((io.i_branch_resolve_pack.rob_idx(rob_idx_len-1) === uop.rob_idx(rob_idx_len-1) && io.i_branch_resolve_pack.rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0))||
            (io.i_branch_resolve_pack.rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_branch_resolve_pack.rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))) 
    val src1_ready = RegInit(false.B)
    val next_src1_ready =Wire(Bool())
    src1_ready:=next_src1_ready
    val src2_ready = RegInit(false.B)
    val next_src2_ready = Wire(Bool())
    src2_ready:=next_src2_ready

    //rewrite using mux?
    //output logic
    when(flush){
        uop.valid:=false.B 
    }.elsewhen(io.i_write_slot){
        uop:= io.i_uop
    }

    //change uop src_valid to uop src_acquired
    val next_src1_acquired = Wire(Bool())
    uop.src1_valid := next_src1_acquired 
    val next_src2_acquired = Wire(Bool())
    uop.src2_valid := next_src2_acquired
    val next_src1_value = Wire(UInt(64.W))
    uop.src1_value := next_src1_value
    val next_src2_value = Wire(UInt(64.W))
    uop.src2_value := next_src2_value

    io.o_uop.src1_valid := next_src1_acquired
    io.o_uop.src2_valid := next_src2_acquired
    io.o_uop.src1_value := next_src1_value
    io.o_uop.src2_value := next_src2_value


    assert(((!io.i_uop.op1_sel===SRC_RS)===io.i_uop.src1_valid),"src valid wrong")
    assert(((!io.i_uop.op2_sel===SRC_RS)===io.i_uop.src2_valid),"src valid wrong")

    when(io.i_write_slot){
        next_src1_acquired:=(!(io.i_uop.op1_sel===SRC_RS)) || ((io.i_uop.op1_sel===SRC_RS)&&(io.i_uop.phy_rs1 === 0.U)) || ((io.i_uop.op1_sel===SRC_RS) && ((io.i_exe_dst1===io.i_uop.phy_rs1) || (io.i_exe_dst2===io.i_uop.phy_rs1)))
        next_src1_value := Mux(((io.i_uop.op1_sel===SRC_RS)&&(io.i_uop.phy_rs1 === 0.U)),0.U,MuxCase(io.i_uop.src1_value,Seq(
            ((io.i_exe_dst1===io.i_uop.phy_rs1) && (io.i_uop.op1_sel===SRC_RS))->io.i_exe_value1,
            ((io.i_exe_dst2===io.i_uop.phy_rs1) && (io.i_uop.op1_sel===SRC_RS))->io.i_exe_value2
    )))
    }.elsewhen((io.i_wakeup_port(uop.phy_rs1)===1.U && uop.op1_sel===SRC_RS)){ //bypass from ex_out or writtenback
        next_src1_acquired := uop.src1_valid ||(Mux((io.i_exe_dst1===uop.phy_rs1 || io.i_exe_dst2 === uop.phy_rs1),true.B,false.B) )
        next_src1_value :=Mux((!uop.src1_valid && next_src1_acquired),MuxCase(uop.src1_value,Seq(
            (io.i_exe_dst1===uop.phy_rs1)->io.i_exe_value1,
            (io.i_exe_dst2===uop.phy_rs1)->io.i_exe_value2
        )),uop.src1_value)
    }.otherwise{
        next_src1_acquired := uop.src1_valid
        next_src1_value := uop.src1_value
    }
    when(io.i_write_slot){
        next_src2_acquired:=(!(io.i_uop.op2_sel===SRC_RS))|| ((io.i_uop.op2_sel===SRC_RS)&&(io.i_uop.phy_rs2 === 0.U))  || ((io.i_uop.op2_sel===SRC_RS) && ((io.i_exe_dst1===io.i_uop.phy_rs2) || (io.i_exe_dst2===io.i_uop.phy_rs2)))
        next_src2_value :=Mux(((io.i_uop.op2_sel===SRC_RS)&&(io.i_uop.phy_rs2 === 0.U)),0.U,MuxCase(io.i_uop.src2_value,Seq(
            ((io.i_exe_dst1===io.i_uop.phy_rs2) && (io.i_uop.op2_sel===SRC_RS))->io.i_exe_value1,
            ((io.i_exe_dst2===io.i_uop.phy_rs2) && (io.i_uop.op2_sel===SRC_RS))->io.i_exe_value2
    )))
    }.elsewhen((io.i_wakeup_port(uop.phy_rs2)===1.U && uop.op2_sel===SRC_RS)){
        next_src2_acquired := uop.src2_valid || (Mux((io.i_exe_dst1===uop.phy_rs2 || io.i_exe_dst2 === uop.phy_rs2),true.B,false.B) )
        next_src2_value :=Mux((!uop.src2_valid && next_src2_acquired),MuxCase(uop.src2_value,Seq(
            (io.i_exe_dst1===uop.phy_rs2)->io.i_exe_value1,
            (io.i_exe_dst2===uop.phy_rs2)->io.i_exe_value2
        )),uop.src2_value)
    }.otherwise{
        next_src2_acquired := uop.src2_valid
        next_src2_value := uop.src2_value
    }

    when(io.i_write_slot){
        next_src1_ready:=(!(io.i_uop.op1_sel===SRC_RS)) || ((io.i_uop.op1_sel===SRC_RS) && io.i_wakeup_port(io.i_uop.phy_rs1)===1.U )
    }.elsewhen(uop.valid && (io.i_wakeup_port(uop.phy_rs1)===1.U && uop.op1_sel===SRC_RS)){
        next_src1_ready:=true.B
    }.otherwise{
        next_src1_ready:=src1_ready
    }

    when(io.i_write_slot){
        next_src2_ready:=(!(io.i_uop.op2_sel===SRC_RS)) || ((io.i_uop.op2_sel===SRC_RS) && io.i_wakeup_port(io.i_uop.phy_rs2)===1.U )
    }.elsewhen(uop.valid && (io.i_wakeup_port(uop.phy_rs2)===1.U && uop.op2_sel===SRC_RS)){
        next_src2_ready:=true.B
    }.otherwise{
        next_src2_ready:=src2_ready
    }

    //valid maintain logic,this is redundent for uop also got a valid, remove it ?
    //能写进来的都是uop.valid=true,并不,能写进来的未必valid
    
    when(flush ||(io.i_issue_granted && !io.i_write_slot) ){
        valid:=false.B
    }.elsewhen((io.i_write_slot)&&(io.i_uop.valid)){
        valid:=true.B
    }
    io.cond:=(flush ||(io.i_issue_granted && !io.i_write_slot))

    //request logic
    val ls_is_the_head_of_ROB = Wire(Bool())
    ls_is_the_head_of_ROB := (io.i_ROB_first_entry === uop.rob_idx && uop.func_code === FU_MEM)|| (uop.func_code=/=FU_MEM)

    when( (valid===true.B) && (next_src1_ready===true.B) && (next_src2_ready===true.B) && (!flush) && ls_is_the_head_of_ROB){//do we need to consider valid? 
        io.o_ready_to_issue := true.B
    }.otherwise{
        io.o_ready_to_issue := false.B
    }


}
