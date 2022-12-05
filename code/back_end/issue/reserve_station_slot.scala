package ladder

import Chisel._

class age_pack extends Bundle {
  val issue_valid = Vec(2,Bool())
  val max_age = UInt(8.W)
  val allocated_idx = UInt(1.W) //0 stands for 1st allocated,1 for second
  val issued_ages = Vec(2,UInt(8.W))
}

//TODO: how to add a age scheme?when to release this slot
//2 reservation stations, one for INT, one for MEM
class Reservation_Station_Slot extends Module{
    val io=IO(new Bundle{
        val o_valid = Output(Bool()) //is this slot occupied
        val o_ready_to_issue = Output(Bool())

        val i_issue_granted = Input(Bool())//???
        val i_flush = Input(Bool())

        val i_write_slot = Input(Bool())
        val i_wakeup_ports =  Input(Vec(2,Valid(UInt(128.W)))).flip//number of pregs, TODO:make it paramed
        val i_in_uop_pack = Input(new MicroOp())
        val o_out_uop_pack = Output(new MicroOp())

        val i_age_pack = Input(new age_pack())
        val o_age = Output(UInt(8.W))
    })
    val age = RegInit(0.U(8.W))
    o_age = age
    when(io.flush){//or mux? when-wlse should be cascaded,so mux is better TODO:make this mux!!!!
        age := 0.U
    }.elsewhen(io.write_slot && io.issue_granted){
        age := max_age+i_age_pack.allocatedidx
    }.elsewhen(!io.write_slot && io.issue_granted){
        age := 255.U//invalid
    }.elsewhen(io.i_age_pack.issue_valid(0) && io.i_age_pack.issue_valid(1)&& age>i_age_pack.issued_ages(0) && age<i_age_pack.issued_ages(1)){
        age := age-1.U //issued 2 and age in between them
    }.elsewhen(io.i_age_pack.issue_valid(0) && io.i_age_pack.issue_valid(1)&& age>i_age_pack.issued_ages(1)){
        age := age-2.U //issued 2 and age larger than both
    }.elsewhen(io.i_age_pack.issue_valid(0) && !io.i_age_pack.issue_valid(1)&& age>i_age_pack.issued_ages(0) && age<i_age_pack.issued_ages(1)){
        age := age-1.U //issued only 1 and larger
    }.otherwise{
        age := age//preserve
    }

    val uop_pack = RegInit(NullMicroOp)
    io.out_uop_pack := uop_pack
    val valid = RegInit(false.B)
    io.o_valid := Mux((!io.flush || (io.i_issue_granted && io.i_write_slot) || !(io.i_issue_granted && !io.i_write_slot)),true.B,false.B)//is this correct

    //rewrite using mux?
    //output logic
    when(io.i_flush){
        uop_pack:= NullMicroOp
    }.elsewhen(io.i_write_slot){
        uop_pack:= io.i_in_uop_pack
    }

    //update the uop according to the wakeupsignals
    //TODO: uop here
    for(i <- 0 util 2){
        when (io.wakeup_ports(i).valid && (io.wakeup_ports(i).bits.dst === uop_pack.rs1)){
            uop.p1 := true.B
        }
        when (io.wakeup_ports(i).valid && (io.wakeup_ports(i).bits.dst === uop_pack.rs2)){
            uop.p2 := true.B
        }
    }

    //valid maintain logic
    when(io.i_flush){
        valid := false.B
    }.elsewhen(io.i_write_slot){
        valid := true.B
    }

    //request logic
    when(valid && uop.p1===true.B && uop.p2===true.B ){//do we need to consider valid? 
        io.o_ready_to_issue := true.B
    }.otherwise{
        io.o_ready_to_issue := false.B
    }
}