package Ladder

import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

abstract class Function_Unit (
    val is_bru :Boolean = false,
    val is_lsu :Boolean = false
)extends Module with consts{
        val io=IO(new Bundle{
        val o_branch_resolve_pack = if (is_bru)  Output(new branch_resolve_pack()) else null

        val i_uop=Input(new uop())
        val i_select=Input(Bool())//select the function unit aka ready from input
        val i_select_to_commit=Input(Bool())//aka valid from output

        val o_func_idx=Output(UInt(5.W))
        val o_ex_res_pack=Output(new valid_uop_pack())//include a valid(ready bit) TODO:decouple this

        val o_available = Output(Bool())
        val o_this_available = Output(Bool())

        val i_ROB_first_entry = if(is_lsu) Input(UInt(rob_idx_len.W)) else null
        val dcache_io = if(is_lsu) new DcacheIO() else null
        val o_lsu_uop_valid = if(is_lsu) Output(Bool()) else null
        val o_lsu_uop_rob_idx = if(is_lsu) Output(UInt(rob_idx_len.W)) else null

        val i_exception = Input(Bool())

        val i_rollback_valid = Input(Bool())
        val i_rollback_rob_idx = Input(UInt(rob_idx_len.W)) //the rob idx of the mispred inst
    })
}
//alu can be changed into decode the imm inside it, saves wire
class ALU() extends Function_Unit(
    is_bru = false,
    is_lsu = false
){
    io.o_this_available := false.B
    val s_FREE :: s_BUSY ::  Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state
    val uop = RegInit(0.U.asTypeOf(new uop()))//null uop
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)

    when((io.i_select_to_commit && !io.i_select)||io.i_exception ||
        ((io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
              (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1))))))){
        next_uop.valid:=false.B
    }

    uop:=next_uop

    assert(uop.func_code ===FU_ALU || uop.func_code===0.U,"funccode is not alu")

    io.o_func_idx:=FU_ALU
    io.o_ex_res_pack.uop := uop
    io.o_ex_res_pack.valid := uop.valid
    /*
    val opr1 = Muxcase(0.U,Seq(
        (io.i_uop.op1_sel === OP1_RS1) -> io.i_uop.src1_value,
        (io.i_uop.op1_sel === OP1_ZERO) -> 0.U,
        (io.i_uop.op1_sel === OP1_IMM) -> io.i_uop.imm,
    ))
    val opr2 = Muxcase(0.U,Seq(
        (io.i_uop.op2_sel === OP2_RS2) -> io.i_uop.src2_value,
        (io.i_uop.op2_sel === OP2_IMM) -> io.i_uop.imm,
        (io.i_uop.op2_sel === OP2_ZERO) -> 0.U
    ))*/
    val opr1 = Wire(UInt(64.W))
    val opr2 = Wire(UInt(64.W))
    opr1 := uop.src1_value
    opr2 := uop.src2_value

    val intermediate = Wire(UInt(64.W))
    intermediate := MuxCase(0.U,Seq(
        (uop.alu_sel === ALU_ADDIW  ) -> ((opr1+opr2)(31,0))  ,
        (uop.alu_sel === ALU_SLLIW  ) -> ((opr1(31,0).asUInt<<opr2(4,0)).asUInt)  ,
        (uop.alu_sel === ALU_SRLIW  ) -> ((opr1(31,0).asUInt>>opr2(4,0)).asUInt)  ,
        (uop.alu_sel === ALU_SRAIW  ) -> ((opr1(31,0).asSInt>>opr2(4,0)).asUInt)  ,
        (uop.alu_sel === ALU_SLLW   ) -> ((opr1(63,0)<<opr2(4,0))(31,0)) ,
        (uop.alu_sel === ALU_SRLW   ) -> ((opr1(31,0).asUInt>>opr2(4,0)).asUInt)   ,
      ))

    io.o_ex_res_pack.uop.dst_value := MuxCase(0.U,Seq(
        (uop.alu_sel === ALU_NONE   ) -> 0.U  ,
        (uop.alu_sel === ALU_AUIPC  ) -> (opr1 + opr2)    ,
        (uop.alu_sel === ALU_ADDI   ) -> (opr1 + opr2)    ,
        (uop.alu_sel === ALU_SLTI   ) -> (Mux(opr1.asSInt>=opr2.asSInt,0.U,1.U)).asUInt    ,
        (uop.alu_sel === ALU_SLTIU  ) -> Mux(opr1>=opr2,0.U,1.U)    ,
        (uop.alu_sel === ALU_XORI   ) -> (opr1^opr2 )    ,
        (uop.alu_sel === ALU_ORI    ) -> (opr1|opr2 )    ,
        (uop.alu_sel === ALU_ANDI   ) -> (opr1&opr2 )    ,
        (uop.alu_sel === ALU_ADDIW  ) -> Mux(intermediate(31)=/=1.U,intermediate(31,0),Cat(0xffffffffL.U,intermediate(31,0)))    ,
        (uop.alu_sel === ALU_SLLI   ) -> (opr1(63,0)<<opr2(5,0))   ,
        (uop.alu_sel === ALU_SRLI   ) -> (opr1(63,0).asUInt>>opr2(5,0)).asUInt    ,
        (uop.alu_sel === ALU_SRAI   ) -> (opr1(63,0).asSInt>>opr2(5,0)).asUInt    ,
        (uop.alu_sel === ALU_SLLIW  ) -> Mux(intermediate(31)===1.U,Cat(0xffffffffL.U,intermediate(31,0)),intermediate(31,0))   ,
        (uop.alu_sel === ALU_SRLIW  ) -> Mux(intermediate(31)===1.U,Cat(0xffffffffL.U,intermediate(31,0)),intermediate(31,0))   ,
        (uop.alu_sel === ALU_SRAIW  ) -> Mux(intermediate(31)===1.U,Cat(0xffffffffL.U,intermediate(31,0)),intermediate(31,0))   ,
        (uop.alu_sel === ALU_ADD    ) -> (opr1+opr2)    ,
        (uop.alu_sel === ALU_SUB    ) -> (opr1-opr2)    ,
        (uop.alu_sel === ALU_SLL    ) -> (opr1(63,0)<<opr2(4,0))    ,
        (uop.alu_sel === ALU_SLT    ) -> Mux(opr1.asSInt>=opr2.asSInt,0.U,1.U).asUInt    ,
        (uop.alu_sel === ALU_SLTU   ) -> Mux(opr1.asUInt>=opr2.asUInt,0.U,1.U)     ,
        (uop.alu_sel === ALU_XOR    ) -> (opr1^opr2)    ,
        (uop.alu_sel === ALU_SRL    ) -> (opr1.asUInt>>opr2(4,0).asUInt),
        (uop.alu_sel === ALU_SRA    ) -> (opr1.asSInt>>opr2(4,0).asUInt).asUInt    ,
        (uop.alu_sel === ALU_OR     ) -> (opr1|opr2 )  ,
        (uop.alu_sel === ALU_AND    ) -> (opr1&opr2 )   ,
        (uop.alu_sel === ALU_ADDW   ) -> Mux((opr1+opr2)(31)=/=1.U,(opr1+opr2)(31,0),Cat(0xffffffffL.U,(opr1+opr2)(31,0)))    ,
        (uop.alu_sel === ALU_SUBW   ) -> Mux((opr1-opr2)(31)=/=1.U,(opr1-opr2)(31,0),Cat(0xffffffffL.U,(opr1-opr2)(31,0)))    ,
        (uop.alu_sel === ALU_SLLW   ) -> Mux(intermediate(31)=/=1.U,intermediate(31,0),Cat(0xffffffffL.U,intermediate(31,0)))    ,
        (uop.alu_sel === ALU_SRLW   ) -> Mux(intermediate(31)=/=1.U,intermediate(31,0),Cat(0xffffffffL.U,intermediate(31,0)))    ,
        (uop.alu_sel === ALU_SRAW   ) -> ((opr1.asSInt>>opr2(4,0)).asUInt),
        (uop.alu_sel === ALU_LUI    ) -> (opr1)
    ))
    
    next_state := MuxCase(state,Seq(
        (io.i_exception) -> s_FREE,
        (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
              (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))-> s_FREE,//TODO:rob被套圈怎么判断
        (!(io.i_exception) && (state === s_FREE) && (uop.valid && !io.i_select_to_commit)) -> s_BUSY,
        (!(io.i_exception) && (state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))

    io.o_available := Mux(state === s_BUSY, false.B,true.B) && ((io.i_select_to_commit && uop.valid) || !uop.valid)

    //printf("src1=%d\n",uop.src1_value)
    //printf("src2=%d\n",uop.src2_value)
    //printf("dstvalue=%d\n",io.o_ex_res_pack.uop.dst_value)
}

class BRU extends Function_Unit(
    is_bru = true,
    is_lsu = false
){
    io.o_this_available := false.B
    io.o_func_idx := FU_BRU

    val s_FREE :: s_BUSY :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    val uop =  RegInit(0.U.asTypeOf(new uop()))//null uop//null uop
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    uop:=next_uop

    when((io.i_select_to_commit && !io.i_select)||io.i_exception){
        next_uop.valid:=false.B
    }

    io.o_ex_res_pack.uop := uop
    io.o_ex_res_pack.uop.dst_value := uop.pc + 4.U

    val rs1=uop.src1_value
    val rs2=uop.src2_value

    val br_eq =(rs1 === rs2)
    val br_ltu = (rs1.asUInt < rs2.asUInt)
    val br_lt  = (~(rs1(63) ^ rs2(63)) & br_ltu |
                rs1(63) & ~rs2(63)).asBool

    //val jalr_target_base = io.req.bits.rs1_data.asSInt
    //val target_offset = uop.imm(20,0).asSInt
    val jalr_target= Wire(UInt(64.W))
    jalr_target := (uop.src1_value.asSInt + uop.imm.asSInt).asUInt

    val PC_PLUS4 = 0.U(2.W)
    val PC_BRJMP = 1.U(2.W)
    val PC_JALR  = 2.U(2.W)

  val pc_sel = MuxCase(PC_PLUS4,
                 Seq(  (uop.branch_type === BR_N  )   -> PC_PLUS4,
                       (uop.branch_type === BR_NE )   -> Mux(!br_eq,  PC_BRJMP, PC_PLUS4),
                       (uop.branch_type === BR_EQ )   -> Mux( br_eq,  PC_BRJMP, PC_PLUS4),
                       (uop.branch_type ===  BR_GE)   -> Mux(!br_lt,  PC_BRJMP, PC_PLUS4),
                       (uop.branch_type === BR_GEU)   -> Mux(!br_ltu, PC_BRJMP, PC_PLUS4),
                       (uop.branch_type === BR_LT )   -> Mux( br_lt,  PC_BRJMP, PC_PLUS4),
                       (uop.branch_type === BR_LTU)   -> Mux( br_ltu, PC_BRJMP, PC_PLUS4),
                       (uop.branch_type === BR_J  )   -> PC_BRJMP,
                       (uop.branch_type === BR_JR )   -> PC_JALR
                        ))

  val is_taken = Wire(Bool())
  is_taken := (pc_sel =/= PC_PLUS4)
  val target_address = Wire(UInt(32.W))
  target_address := MuxCase(uop.pc+4.U, Seq(
    (pc_sel === PC_BRJMP)     -> (uop.imm.asSInt+uop.pc.asSInt).asUInt,
    (pc_sel === PC_JALR)    -> (uop.src1_value.asSInt + uop.src2_value.asSInt).asUInt,
    (pc_sel === PC_PLUS4)   -> (uop.pc+4.U(32.W))
  ))

/*
mispred scenarios:
1.predict valid , and mispred taken and not taken.
2.predict vallid, and predict taken, actually taken, but the predicted address is wrong
3.predict not valid, but taken
*/
  val valid_prediction = Wire(Bool())
  valid_prediction := (uop.pc(2) === uop.branch_predict_pack.select) && uop.branch_predict_pack.valid
  val mispredict = Wire(Bool())

  mispredict := ((valid_prediction) && (is_taken^uop.branch_predict_pack.taken)) || 
                (valid_prediction) && (is_taken && uop.branch_predict_pack.taken && (target_address =/= uop.branch_predict_pack.target)) ||
                (!valid_prediction && is_taken)

/*
  mispredict := ((uop.branch_predict_pack.valid) && (is_taken^uop.branch_predict_pack.taken)) || 
                (uop.branch_predict_pack.valid) && (is_taken && uop.branch_predict_pack.taken && (target_address =/= uop.branch_predict_pack.target)) ||
                (!uop.branch_predict_pack.valid && is_taken)
*/

  val branch_resolve_pack = Wire(new branch_resolve_pack())

  branch_resolve_pack.valid             := uop.valid
  branch_resolve_pack.pc                := uop.pc
  branch_resolve_pack.mispred           := mispredict
  branch_resolve_pack.taken             := is_taken
  branch_resolve_pack.target            := target_address
  branch_resolve_pack.rob_idx           := uop.rob_idx
  branch_resolve_pack.branch_type       := uop.branch_type
  //if the btb tag has the idx inside fetchpack, modify this
  branch_resolve_pack.prediction_valid  := uop.branch_predict_pack.valid
  io.o_branch_resolve_pack := branch_resolve_pack

/*
    next_state := MuxCase(state,Seq(
        (io.i_exception) -> s_FREE,
        (!(io.i_exception) && ((state === s_FREE) && (io.i_select && !io.i_select_to_commit))) -> s_BUSY,
        (!(io.i_exception) && ((state === s_BUSY) && (io.i_select_to_commit))) -> s_FREE
    ))
    */
    next_state := MuxCase(state,Seq(
        (io.i_exception) -> s_FREE,
        (!(io.i_exception) && (state === s_FREE) && (uop.valid && !io.i_select_to_commit)) -> s_BUSY,
        (!(io.i_exception) && (state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))

    //io.o_available := Mux(!(io.i_exception) && (state === s_FREE) && (uop.valid && !io.i_select_to_commit),false.B,true.B)
    io.o_available := (next_state=/=s_BUSY)
    io.o_ex_res_pack.valid := uop.valid
}
//lsu that only has one load/store in flight

class LSU extends Function_Unit(
    is_bru = false,
    is_lsu = true
){
    io.o_this_available := false.B
    io.o_func_idx:=FU_MEM

    val s_FREE :: s_BUSY  :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    val exception_occured = RegInit(false.B)
    val rollback_occured = RegInit(false.B)
    val next_rollback_occured = Wire(Bool())
    val uop =  RegInit(0.U.asTypeOf(new uop()))
    val ready_to_commit = RegInit(false.B)
    val next_ready_to_commit = Wire(Bool())
    rollback_occured := next_rollback_occured
    next_rollback_occured := MuxCase(rollback_occured,Seq(
        (next_state === s_FREE) -> false.B,
        (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
            (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1))))) -> true.B,
    ))
    when(io.i_exception && state === s_BUSY){
        exception_occured := true.B
    }.elsewhen(next_state === s_FREE){
        exception_occured := false.B
    }
    state := next_state
    next_state := MuxCase(state,Seq(
        ((state === s_FREE) && (io.i_select)) -> s_BUSY,
        ((state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE,                                                                         
        ((state === s_BUSY) && (next_ready_to_commit) && (rollback_occured || (exception_occured && uop.mem_type === MEM_R))) -> s_FREE
    ))
    val len = Wire(UInt(4.W))
    val loadu = Wire(Bool())
    val addr = Wire(UInt(64.W))


    uop := Mux(io.i_select,io.i_uop,uop)
    uop.dst_value := MuxCase(uop.dst_value,Seq(
        (loadu && len===1.U && io.dcache_io.data_valid) -> Cat(0.U(56.W),io.dcache_io.MdataIn(7,0)),
        (loadu && len===2.U && io.dcache_io.data_valid) -> Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
        (loadu && len===4.U && io.dcache_io.data_valid) ->Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
        (loadu && len===8.U && io.dcache_io.data_valid) ->io.dcache_io.MdataIn(31,0),
        (!loadu && len===1.U(4.W) && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U(4.W) && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U(4.W) && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U(4.W) && io.dcache_io.data_valid) -> io.dcache_io.MdataIn
    ))
    len := MuxCase(0.U, Seq(
        (uop.inst(13,12) === "b00".U) -> 1.U,
        (uop.inst(13,12) === "b01".U) -> 2.U,
        (uop.inst(13,12) === "b10".U) -> 4.U,
        (uop.inst(13,12) === "b11".U) -> 8.U,
    ))
    loadu := (uop.inst(14)=== "b1".U)
    addr := Mux(uop.mem_type === MEM_R,uop.src1_value+uop.src2_value,uop.src1_value+uop.imm)
    when((io.i_select_to_commit && !io.i_select || next_state === s_FREE)){
        uop.valid:=false.B
    }
    io.o_ex_res_pack.uop := uop
    io.o_ex_res_pack.valid := next_ready_to_commit && !rollback_occured && !(exception_occured && uop.mem_type === MEM_R)
    io.o_ex_res_pack.uop.dst_value := MuxCase(uop.dst_value,Seq(
        (loadu && io.dcache_io.data_valid) -> MuxCase(io.dcache_io.MdataIn,Seq(
            (len === 1.U) ->  Cat(0.U(56.W),io.dcache_io.MdataIn(7,0)),
            (len === 2.U) ->  Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
            (len === 4.U) ->  Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
          )),                                                                        
        (!loadu && len===1.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U && io.dcache_io.data_valid) -> io.dcache_io.MdataIn
    ))
    //io.dcache_io.addr_valid:= (!io.i_exception && ((io.i_select && uop.mem_type===MEM_R)) || (uop.mem_type === MEM_W && io.i_ROB_first_entry === uop.rob_idx))
    //use addr_given to limit addr valid in one cycle.
    //this is under the assumption that cache is always ready. change the logic when adding cache.
    val addr_given = RegInit(false.B)
    addr_given := MuxCase(addr_given,Seq(
      ((io.dcache_io.addr_valid) && !io.i_select_to_commit)->true.B,
      (next_state === s_FREE)->false.B
    ))
    val next_mem_type = Wire(UInt(2.W))
    next_mem_type := Mux(io.i_select,io.i_uop.mem_type,uop.mem_type)
    io.dcache_io.addr_valid := (uop.valid && !addr_given && next_mem_type === MEM_R) || (uop.valid && !addr_given && uop.mem_type === MEM_W && io.i_ROB_first_entry === uop.rob_idx)
    io.dcache_io.data_ready := true.B
    io.dcache_io.Maddr:= addr
    io.dcache_io.Mwout := uop.mem_type === MEM_W
    io.dcache_io.Men := !(uop.mem_type === MEM_N)
    io.dcache_io.Mlen := len
    io.dcache_io.MdataOut := uop.src2_value



    ready_to_commit:=next_ready_to_commit
    next_ready_to_commit:=MuxCase(ready_to_commit,Seq(
        (state===s_BUSY && io.dcache_io.addr_ready && uop.mem_type===MEM_W && addr_given)->true.B,
        (state===s_BUSY && io.dcache_io.data_valid && uop.mem_type===MEM_R && addr_given)->true.B,
        (state===s_FREE) ->false.B 
    ))
    io.o_available := Mux(state === s_BUSY, false.B,true.B) && ((io.i_select_to_commit && uop.valid) || !uop.valid)
    io.o_lsu_uop_valid := state === s_BUSY &&  uop.mem_type === MEM_W
    io.o_lsu_uop_rob_idx := uop.rob_idx
}

/*
class LSU extends Function_Unit(
    is_bru = false,
    is_lsu = true
){
    io.o_this_available := false.B

    io.o_func_idx:=FU_MEM

    val s_FREE :: s_BUSY  :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    val uop =  RegInit(0.U.asTypeOf(new uop()))
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    dontTouch(next_uop)
    when((io.i_select_to_commit && !io.i_select || next_state === s_FREE)){
        next_uop.valid:=false.B
    }
    io.o_ex_res_pack.uop := uop

    val exception_occured = RegInit(false.B)
    when(io.i_exception && state === s_BUSY){
        exception_occured := true.B
    }
    when(next_state === s_FREE){
        exception_occured := false.B
    }

    val len = Wire(UInt(32.W))
    len := MuxCase(0.U, Seq(
        (uop.inst(13,12) === "b00".U) -> 1.U,
        (uop.inst(13,12) === "b01".U) -> 2.U,
        (uop.inst(13,12) === "b10".U) -> 4.U,
        (uop.inst(13,12) === "b11".U) -> 8.U,
    ))
    val loadu = Wire(Bool())
    loadu := (uop.inst(14)=== "b1".U)

    val addr = Wire(UInt(64.W))
    addr := Mux(uop.mem_type === MEM_R,uop.src1_value+uop.src2_value,uop.src1_value+uop.imm)

    val dbg_dst_val = RegInit(0.U(64.W))
    dontTouch(dbg_dst_val)
    dbg_dst_val := MuxCase(dbg_dst_val,Seq(
        (loadu && io.dcache_io.data_valid) -> MuxCase(io.dcache_io.MdataIn,Seq(
            (len === 1.U) ->  Cat(0.U(56.W),io.dcache_io.MdataIn(7,0)),
            (len === 2.U) ->  Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
            (len === 4.U) ->  Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
          )),                                                                        
        (!loadu && len===1.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U && io.dcache_io.data_valid) -> io.dcache_io.MdataIn
    ))

    //dcache io
    io.o_ex_res_pack.uop.dst_value := MuxCase(uop.dst_value,Seq(
        (loadu && io.dcache_io.data_valid) -> MuxCase(io.dcache_io.MdataIn,Seq(
            (len === 1.U) ->  Cat(0.U(56.W),io.dcache_io.MdataIn(7,0)),
            (len === 2.U) ->  Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
            (len === 4.U) ->  Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
          )),                                                                        
        (!loadu && len===1.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U && io.dcache_io.data_valid) -> io.dcache_io.MdataIn
    ))
    val condd = Wire(Bool())
    condd := (loadu && len===1.U && io.dcache_io.data_valid)
    dontTouch(condd)
    val condd2 = Wire(Bool())
    condd2 := (loadu && io.dcache_io.data_valid)
    dontTouch(condd2)
    val condd3 = Wire(Bool())
    condd3 := (!loadu && io.dcache_io.data_valid)
    dontTouch(condd3)
    val condd4 = Wire(Bool())
    condd4 := (!loadu && len===1.U && io.dcache_io.data_valid)
    dontTouch(condd4)
    val condd5 = Wire(Bool())
    condd5 := (!loadu && len===2.U && io.dcache_io.data_valid)
    dontTouch(condd5)
    val condd6 = Wire(Bool())
    condd6 := (!loadu && len===4.U && io.dcache_io.data_valid)
    dontTouch(condd6)

    val temptest = RegInit(0.U(64.W))
    val temptest2 = RegInit(0.U(64.W))
    when(condd)
    {
    //temptest := (io.dcache_io.MdataIn(7,0))
    temptest := (io.dcache_io.MdataIn)
    }
    temptest2 := (io.dcache_io.MdataIn)
    dontTouch(temptest)
    dontTouch(temptest2)


    //this is incorrect if the inst can be issued the cycle data_valid turns true
    next_uop.dst_value := MuxCase(uop.dst_value,Seq(
        //(loadu && (len===1.U) && io.dcache_io.data_valid) -> Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
        //(loadu && (len===2.U) && io.dcache_io.data_valid) -> Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
        //(loadu && (len===4.U) && io.dcache_io.data_valid) -> Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
        //(loadu && (len===8.U) && io.dcache_io.data_valid) -> io.dcache_io.MdataIn,
        /*
        (loadu && io.dcache_io.data_valid) -> (io.dcache_io.MdataIn & MuxCase(0xffffffffffffffffL.U(64.W),Seq(
            (len === 1.U) -> 0xffffffffffffff00L.U,
            (len === 2.U) -> 0xffffffffffff0000L.U,
            (len === 4.U) -> 0xffffffff00000000L.U,
          ))),*/
        (loadu && io.dcache_io.data_valid) -> MuxCase(io.dcache_io.MdataIn,Seq(
            (len === 1.U) ->  Cat(0.U(56.W),io.dcache_io.MdataIn(7,0)),
            (len === 2.U) ->  Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
            (len === 4.U) ->  Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
          )),


        (!loadu && len===1.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U && io.dcache_io.data_valid) -> io.dcache_io.MdataIn
    ))
    //io.dcache_io.addr_valid:= (!io.i_exception && ((io.i_select && uop.mem_type===MEM_R)) || (uop.mem_type === MEM_W && io.i_ROB_first_entry === uop.rob_idx))
    //use addr_given to limit addr valid in one cycle.
    //this is under the assumption that cache is always ready. change the logic when adding cache.
    val addr_given = RegInit(false.B)
    addr_given := MuxCase(addr_given,Seq(
      ((io.dcache_io.addr_valid) && !io.i_select_to_commit)->true.B,
      (next_state === s_FREE)->false.B
      ))
    //addr_given := Mux(io.dcache_io.addr_valid && (uop.mem_type===MEM_W), true.B, false.B)
    io.dcache_io.addr_valid := (uop.valid && !addr_given && next_uop.mem_type === MEM_R) || (uop.valid && !addr_given && uop.mem_type === MEM_W && io.i_ROB_first_entry === uop.rob_idx)
    io.dcache_io.data_ready := true.B
    io.dcache_io.Maddr:= addr
    io.dcache_io.Mwout := uop.mem_type === MEM_W
    io.dcache_io.Men := !(uop.mem_type === MEM_N)
    io.dcache_io.Mlen := len
    io.dcache_io.MdataOut := uop.src2_value
    //----------------------------------

    val ready_to_commit = RegInit(false.B)
    val next_ready_to_commit = Wire(Bool())
    ready_to_commit:=next_ready_to_commit

    val rollback_occured = RegInit(false.B)
    val next_rollback_occured = Wire(Bool())
    rollback_occured := next_rollback_occured

    next_rollback_occured := MuxCase(rollback_occured,Seq(
        (next_state === s_FREE) -> false.B,
        (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
            (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1))))) -> true.B,
    ))

    next_state := MuxCase(state,Seq(
        ((state === s_FREE) && (io.i_select)) -> s_BUSY,
        ((state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE,
        //((state === s_BUSY) && (uop.mem_type === MEM_R) && exception_occured) -> s_FREE,
        ((state === s_BUSY) && (next_ready_to_commit) && (rollback_occured || (exception_occured && uop.mem_type === MEM_R))) -> s_FREE
    ))

    next_ready_to_commit:=MuxCase(ready_to_commit,Seq(
        (state===s_BUSY && io.dcache_io.addr_ready && uop.mem_type===MEM_W && addr_given)->true.B,
        (state===s_BUSY && io.dcache_io.data_valid && uop.mem_type===MEM_R && addr_given)->true.B,
        (state===s_FREE) ->false.B 
    ))
    io.o_ex_res_pack.valid := next_ready_to_commit && !rollback_occured && !(exception_occured && uop.mem_type === MEM_R)
    io.o_available := Mux(state === s_BUSY, false.B,true.B) && ((io.i_select_to_commit && uop.valid) || !uop.valid)

    io.o_lsu_uop_valid := state === s_BUSY &&  uop.mem_type === MEM_W
    io.o_lsu_uop_rob_idx := uop.rob_idx

    uop:=next_uop
    uop.dst_value := MuxCase(uop.dst_value,Seq(
        (loadu && io.dcache_io.data_valid) -> MuxCase(io.dcache_io.MdataIn,Seq(
            (len === 1.U) ->  Cat(0.U(56.W),io.dcache_io.MdataIn(7,0)),
            (len === 2.U) ->  Cat(0.U(48.W),io.dcache_io.MdataIn(15,0)),
            (len === 4.U) ->  Cat(0.U(31.W),io.dcache_io.MdataIn(31,0)),
          )),


        (!loadu && len===1.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U && io.dcache_io.data_valid) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U && io.dcache_io.data_valid) -> io.dcache_io.MdataIn
    ))

}
*/

class MUL extends Function_Unit(){
    io.o_this_available := false.B
    val uop =  RegInit(0.U.asTypeOf(new uop()))//null uop//null uop
    val s_FREE :: s_BUSY :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    next_state := MuxCase(state,Seq(
        (io.i_exception) -> s_FREE,
        (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
              (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))-> s_FREE,//TODO:rob被套圈怎么判断
        (!(io.i_exception) && (state === s_FREE) && (io.i_select)) -> s_BUSY,
        (!(io.i_exception) && (state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))

    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    uop:=next_uop
    when(next_state === s_FREE){
        next_uop.valid:=false.B
    }
    val multiplier = Module(new Multiplier())
    multiplier.io.i_flush := next_state === s_FREE
    multiplier.io.i_mulw := (next_uop.inst(6,0)==="b0111011".U)
    multiplier.io.i_mul_signed := MuxCase("b11".U,Seq(
        (next_uop.inst(14,12) === "b000".U) -> "b11".U,
        (next_uop.inst(14,12) === "b001".U) -> "b11".U,
        (next_uop.inst(14,12) === "b010".U) -> "b10".U,
        (next_uop.inst(14,12) === "b011".U) -> "b00".U
    )
    )
    io.o_ex_res_pack.uop := uop
    io.o_ex_res_pack.uop.dst_value := MuxCase(multiplier.io.o_result_lo,Seq(
        (next_uop.inst(14,12) === "b000".U) -> multiplier.io.o_result_lo,
        (next_uop.inst(14,12) === "b001".U) -> multiplier.io.o_result_hi,
        (next_uop.inst(14,12) === "b010".U) -> multiplier.io.o_result_hi,
        (next_uop.inst(14,12) === "b011".U) -> multiplier.io.o_result_hi
    ))
    
    val mul_finished=RegInit(Bool(),false.B)

    mul_finished := MuxCase(mul_finished,Seq(
      //(divider.io.o_out_valid && !io.i_select_to_commit) -> true.B,
      ((io.i_select_to_commit)) -> false.B,
      (io.i_exception) -> false.B,
      (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
      (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))-> false.B,
      (multiplier.io.o_out_valid) -> true.B
      ))
    
    multiplier.io.i_mul_valid := (next_state===s_BUSY) && (!mul_finished) //in case the previous inst is not commited

    io.o_ex_res_pack.valid := mul_finished 

    multiplier.io.i_multiplicand := next_uop.src1_value
    multiplier.io.i_multiplier := next_uop.src2_value

    //io.o_available := Mux(state === s_BUSY, false.B,true.B)
    io.o_available := Mux(state === s_BUSY, false.B,true.B) && ((io.i_select_to_commit && uop.valid) || !uop.valid)
    io.o_func_idx:=FU_MUL //useless
}

class DIV extends Function_Unit(){
    io.o_this_available := false.B
    val uop =  RegInit(0.U.asTypeOf(new uop()))//null uop//null uop
    val s_FREE :: s_BUSY :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    next_state := MuxCase(state,Seq(
        (io.i_exception) -> s_FREE,
        (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
              (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))-> s_FREE,//TODO:rob被套圈怎么判断
        (!(io.i_exception) && (state === s_FREE) && (io.i_select)) -> s_BUSY,
        (!(io.i_exception) && (state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))

    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    uop:=next_uop
    io.o_ex_res_pack.uop := uop
    when(next_state === s_FREE){
        next_uop.valid:=false.B
    }

    val divider = Module(new Divider())
    val div_finished=RegInit(Bool(),false.B)
    val next_div_finished = Wire(Bool())
    div_finished := next_div_finished

    next_div_finished := MuxCase(div_finished,Seq(
      //(divider.io.o_out_valid && !io.i_select_to_commit) -> true.B,
      (io.i_select_to_commit) -> false.B,
      (io.i_exception) -> false.B,
      (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
      (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))-> false.B,
      (divider.io.o_out_valid) -> true.B

      ))
    /*
    when(divider.io.o_out_valid){
        div_finished:=true.B
    }
    when(next_state === s_FREE){
        div_finished:=false.B
    }
    */

    when(next_div_finished && !div_finished){
      next_uop.dst_value:=Mux(next_uop.inst(14,12)=== "b110".U || next_uop.inst(14,12)=== "b111".U, divider.io.o_remainder, divider.io.o_quotient)
    }

    divider.io.i_dividend := next_uop.src1_value
    divider.io.i_divisor := next_uop.src2_value

    divider.io.i_div_valid := (next_state===s_BUSY) && (!div_finished)
    divider.io.i_flush := next_state === s_FREE
    divider.io.i_divw := (uop.inst(6,0)==="b0111011".U)

    divider.io.i_div_signed := Mux(next_uop.inst(14,12)=== "b110".U || next_uop.inst(14,12)=== "b100".U,true.B,false.B)

    //io.o_ex_res_pack.uop.dst_value := Mux(next_uop.inst(14,12)=== "b110".U || next_uop.inst(14,12)=== "b111".U, divider.io.o_remainder, divider.io.o_quotient)
    io.o_ex_res_pack.uop.dst_value := next_uop.dst_value
    //this logic is freaking ugly↓↓↓
    //io.o_ex_res_pack.valid := uop.valid && (div_finished || divider.io.o_out_valid) 
    io.o_ex_res_pack.valid := div_finished
    //io.o_available := Mux(state === s_BUSY, false.B,true.B)
    io.o_available := Mux(state === s_BUSY, false.B,true.B) && ((io.i_select_to_commit && uop.valid) || !uop.valid)
    io.o_func_idx:=FU_DIV //useless
}

//a buffer for csr insts, actually does nothing but buffering, and wil not be bypassed to reservation station
class CSR_BF() extends Function_Unit(
    is_bru = false,
    is_lsu = false
){
    val s_FREE :: s_BUSY ::  Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    val uop = RegInit(0.U.asTypeOf(new uop()))//null uop
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)

    when((io.i_select_to_commit && !io.i_select)||io.i_exception ||
        ((io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
              (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1))))))){
        next_uop.valid:=false.B
    }

    uop:=next_uop

    io.o_func_idx:=FU_CSR
    io.o_ex_res_pack.uop := uop
    io.o_ex_res_pack.valid := uop.valid

    next_state := MuxCase(state,Seq(
        (io.i_exception) -> s_FREE,
        (io.i_rollback_valid && ((io.i_rollback_rob_idx((rob_idx_len-2),0) < uop.rob_idx((rob_idx_len-2),0) && io.i_rollback_rob_idx(rob_idx_len-1)===uop.rob_idx(rob_idx_len-1))||
              (io.i_rollback_rob_idx((rob_idx_len-2),0) > uop.rob_idx((rob_idx_len-2),0) && (io.i_rollback_rob_idx(rob_idx_len-1) ^ uop.rob_idx(rob_idx_len-1)))))-> s_FREE,//TODO:rob被套圈怎么判断
        (!(io.i_exception) && (state === s_FREE) && (uop.valid && !io.i_select_to_commit)) -> s_BUSY,
        (!(io.i_exception) && (state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))

    //io.o_available := Mux(next_state === s_BUSY, false.B,true.B)
    io.o_available := Mux(state === s_BUSY, false.B,true.B) && ((io.i_select_to_commit && uop.valid) || !uop.valid)
    val available = RegInit(false.B)
    available := io.o_available
    io.o_this_available := available

}
