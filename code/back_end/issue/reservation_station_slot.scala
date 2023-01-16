package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class age_pack extends Bundle {
  val issue_valid = Vec(2,Bool())
  val max_age = UInt(8.W)
  val issued_ages = Vec(2,UInt(8.W))//by default, age(1)>=age(0)!
}

//TODO: how to add a age scheme?when to release this slot
//2 reservation stations, one for INT, one for MEM
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

        val i_age_pack = Input(new age_pack())
        val o_age = Output(UInt(8.W))

        val cond = Output(Bool())
    })
    val age = RegInit(63.U(6.W))
    io.o_age := age

    val flush = Wire(Bool())
    flush := io.i_exception || (io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred)

    val uop = Reg(new uop())
    io.o_uop := uop


    val valid = RegInit(false.B)
    io.o_valid := valid

    when(flush ){//or mux? when-wlse should be cascaded,so mux is better TODO:make this mux!!!!
        age := 63.U
    }.elsewhen(io.i_write_slot && io.i_uop.valid){//decouple this plz
        age := io.i_age_pack.max_age+io.i_allocated_idx
    }.elsewhen(!io.i_write_slot && io.i_issue_granted){
        age := 63.U//invalid
    }.elsewhen(valid && io.i_age_pack.issue_valid(0) && io.i_age_pack.issue_valid(1)&& age>io.i_age_pack.issued_ages(0) && age<io.i_age_pack.issued_ages(1)){
        age := age-1.U //issued 2 and age in between them
    }.elsewhen(valid && io.i_age_pack.issue_valid(0) && io.i_age_pack.issue_valid(1)&& age>io.i_age_pack.issued_ages(1)){
        age := age-2.U //issued 2 and age larger than both
    }.elsewhen(valid &&io.i_age_pack.issue_valid(0) && !io.i_age_pack.issue_valid(1)&& age>io.i_age_pack.issued_ages(0)){
        age := age-1.U //issued only 1 and larger
    }.otherwise{
        age := age//preserve
    }

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
        next_src1_acquired:=(!(io.i_uop.op1_sel===SRC_RS)) || ((io.i_uop.op1_sel===SRC_RS) && ((io.i_exe_dst1===io.i_uop.phy_rs1) || (io.i_exe_dst2===io.i_uop.phy_rs1)))
        next_src1_value := MuxCase(io.i_uop.src1_value,Seq(
            ((io.i_exe_dst1===io.i_uop.phy_rs1) && (io.i_uop.op1_sel===SRC_RS))->io.i_exe_value1,
            ((io.i_exe_dst2===io.i_uop.phy_rs1) && (io.i_uop.op1_sel===SRC_RS))->io.i_exe_value2
    ))
    }.elsewhen((io.i_wakeup_port(uop.phy_rs1)===1.U && uop.op1_sel===SRC_RS)){ //bypass from ex_out or writtenback
        next_src1_acquired := uop.src1_valid ||(Mux((io.i_exe_dst1===uop.phy_rs1 || io.i_exe_dst2 === uop.phy_rs1),true.B,false.B) )
        next_src1_value :=MuxCase(uop.src1_value,Seq(
            (io.i_exe_dst1===uop.phy_rs1)->io.i_exe_value1,
            (io.i_exe_dst2===uop.phy_rs1)->io.i_exe_value2
        ))
    }.otherwise{
        next_src1_acquired := uop.src1_valid
        next_src1_value := uop.src1_value
    }
    when(io.i_write_slot){
        next_src2_acquired:=(!(io.i_uop.op2_sel===SRC_RS)) || ((io.i_uop.op2_sel===SRC_RS) && ((io.i_exe_dst1===io.i_uop.phy_rs2) || (io.i_exe_dst2===io.i_uop.phy_rs2)))
        next_src2_value :=MuxCase(io.i_uop.src2_value,Seq(
            ((io.i_exe_dst1===io.i_uop.phy_rs2) && (io.i_uop.op2_sel===SRC_RS))->io.i_exe_value1,
            ((io.i_exe_dst2===io.i_uop.phy_rs2) && (io.i_uop.op2_sel===SRC_RS))->io.i_exe_value2
    ))}.elsewhen((io.i_wakeup_port(uop.phy_rs2)===1.U && uop.op2_sel===SRC_RS)){
        next_src2_acquired := uop.src2_valid || (Mux((io.i_exe_dst1===uop.phy_rs2 || io.i_exe_dst2 === uop.phy_rs2),true.B,false.B) )
        next_src2_value := MuxCase(uop.src2_value,Seq(
            (io.i_exe_dst1===uop.phy_rs2)->io.i_exe_value1,
            (io.i_exe_dst2===uop.phy_rs2)->io.i_exe_value2
        ))
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
    when( (valid===true.B) && (next_src1_ready===true.B) && (next_src2_ready===true.B) ){//do we need to consider valid? 
        io.o_ready_to_issue := true.B
    }.otherwise{
        io.o_ready_to_issue := false.B
    }


}