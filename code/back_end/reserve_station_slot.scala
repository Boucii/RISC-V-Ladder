package ladder

import Chisel._

//TODO: how to add a age scheme?when to release this slot
//2 reservation stations, one for INT, one for MEM
class Issue_Slot extends Module{
    val io=IO(new Bundle{
        val o_valid = Output(Bool()) //is this slot occupied
        val o_ready_to_issue = Output(Bool())

        val i_issue_granted = Input(Bool())//???
        val i_flush = Input(Bool())

        val i_write_slot = Input(Bool())
        val i_wakeup_ports =  Input(Vec(2,Valid(UInt(128.W)))).flip//number of pregs, TODO:make it paramed
        val i_in_uop_pack = Input(new MicroOp())
        val o_out_uop_pack = Output(new MicroOp())
    })

    val uop_pack = RegInit(NullMicroOp)
    io.out_uop_pack := uop_pack
    val valid = RegInit(false.B)
    io.o_valid := valid

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