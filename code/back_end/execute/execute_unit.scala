package Ladder

class DcacheIO extends Bundle{
    val valid = Input(Bool())
    val ready = Output(Bool())

    val Mwout=Output((UInt(1.W)))
    val Maddr=Output(UInt(64.W))
    val Men=Output(Bool())
    val Mlen=Output(UInt(32.W))
    val MdataIn=Input(UInt(64.W))
    val MdataOut=Output(UInt(64.W))
}

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

        val i_ROB_first_entry = if(is_lsu) Input(UInt(7.W)) else null
        val dcache_io = if(is_lsu) new DcacheIO() else null
    })
    /*
    val io=IO(new Bundle{
        val i_uop=Input(new uop())
        val i_select=Input(Bool())//select the function unit aka ready from input
        val i_select_to_commit=Input(Bool())//aka valid from output

        val o_func_idx=Output(UInt(5.W))
        val o_ex_res_pack=Output(new valid_uop_pack())//include a valid(ready bit) TODO:decouple this
    })    
    val uop = RegInit(new uop())//null uop
        when(io.i_select){
        uop:=io.i_uop
    }*/

}
class ALU() extends Function_Unit(
    is_bru = false,
    is_lsu = false
){
    val uop = Reg(new uop())//null uop
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    uop:=next_uop
    when(io.i_select_to_commit && !io.i_select){
        uop.valid:=false.B
    }

    assert(uop.func_code ===FU_ALU || uop.func_code===0.U,"funccode is not alu")

    io.o_func_idx:=FU_ALU
    io.o_ex_res_pack.uop := uop
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

    io.o_ex_res_pack.uop.dst_value :=MuxCase(0.U,Seq(
        (uop.alu_sel === ALU_ADD) -> (opr1 + opr2),
        (uop.alu_sel === ALU_SUB) -> (opr1 - opr2),

        (uop.alu_sel === ALU_AND) -> (opr1 & opr2),
        (uop.alu_sel === ALU_OR) -> (opr1 | opr2),
        (uop.alu_sel === ALU_XOR) -> (opr1 ^ opr2),

        (uop.alu_sel === ALU_SL) -> (opr1 << opr2(4,0)),
        (uop.alu_sel === ALU_SRL) -> (opr1 >> opr2(4,0)),
        (uop.alu_sel === ALU_SRA) -> (opr1.asSInt >> opr2(4,0)).asUInt,

        (uop.alu_sel === ALU_SLT) -> (opr1.asSInt < opr2.asSInt).asUInt,
        (uop.alu_sel === ALU_SLTU) -> (opr1 < opr2).asUInt
        //(uop.alu_sel === ALU_X) -> 0.U
    )
    )

    val s_FREE :: s_BUSY ::  Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    next_state := MuxCase(state,Seq(
        ((state === s_FREE) && (io.i_select && !io.i_select_to_commit)) -> s_BUSY,
        ((state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))

    io.o_available := Mux(state === s_BUSY, false.B,true.B)
    io.o_ex_res_pack.valid := uop.valid
    printf("src1=%d\n",uop.src1_value)
    printf("src2=%d\n",uop.src2_value)
    printf("dstvalue=%d\n",io.o_ex_res_pack.uop.dst_value)
}

class BRU extends Function_Unit(
    is_bru = true,
    is_lsu = false
){
    io.o_func_idx := FU_BRU

    val uop = Reg(new uop())//null uop
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    uop:=next_uop
    when(io.i_select_to_commit && !io.i_select){
        uop.valid:=false.B
    }

    io.o_ex_res_pack.uop := uop
    val branch_predict_pack = uop.branch_predict_pack

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

  val mispredict = Wire(Bool())
  mispredict := !(is_taken^uop.branch_predict_pack.taken) || (target_address =/= uop.branch_predict_pack.target)

  val branch_resolve_pack = Wire(new branch_resolve_pack())
  val next_valid = Reg(Bool())
  next_valid := io.i_select

  branch_resolve_pack.valid             := next_valid
  branch_resolve_pack.mispred           := mispredict
  branch_resolve_pack.taken             := is_taken
  branch_resolve_pack.target            := target_address
  io.o_branch_resolve_pack := branch_resolve_pack


    val s_FREE :: s_BUSY :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    next_state := MuxCase(state,Seq(
        ((state === s_FREE) && (io.i_select && !io.i_select_to_commit)) -> s_BUSY,
        ((state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))
    io.o_available := Mux(state === s_BUSY, false.B,true.B)
    io.o_ex_res_pack.valid := uop.valid
}
//lsu that only has one load/store in flight

class LSU extends Function_Unit(
    is_bru = false,
    is_lsu = true
){

    io.o_func_idx:=FU_MEM
    val uop = Reg(new uop())//null uop
    val next_uop = Wire(new uop())
    next_uop := Mux(io.i_select,io.i_uop,uop)
    uop:=next_uop

    val len = Wire(UInt(32.W))
    len := MuxCase(0.U, Seq(
        (uop.inst(13,12) === "b00".U) -> 1.U,
        (uop.inst(13,12) === "b01".U) -> 2.U,
        (uop.inst(13,12) === "b10".U) -> 4.U,
        (uop.inst(13,12) === "b00".U) -> 8.U,
    ))
    val loadu = Wire(Bool())
    loadu := (uop.inst(14)=== "b1".U)

    val addr = Wire(UInt(64.W))
    addr := Mux(uop.mem_type === MEM_R,uop.src1_value+uop.src2_value,uop.src1_value+uop.imm)

    //dcache io
    io.o_ex_res_pack.uop.dst_value := MuxCase(io.dcache_io.MdataIn,Seq(
        (!loadu && len===1.U) -> Mux((io.dcache_io.MdataIn)(7)=/=1.U, (io.dcache_io.MdataIn)(7,0),Cat(0xffffffffffffL.U, (io.dcache_io.MdataIn(7,0)))),
        (!loadu && len===2.U) -> Mux((io.dcache_io.MdataIn)(15)=/=1.U,(io.dcache_io.MdataIn)(15,0),Cat(0xffffffffffffL.U,(io.dcache_io.MdataIn(15,0)))),
        (!loadu && len===4.U) -> Mux((io.dcache_io.MdataIn)(31)=/=1.U,(io.dcache_io.MdataIn)(31,0),Cat(0xffffffffL.U,    (io.dcache_io.MdataIn(31,0)))),
        (!loadu && len===8.U) -> io.dcache_io.MdataIn
    ))
    io.dcache_io.ready:= (io.i_select && uop.mem_type===MEM_R) || (uop.mem_type === MEM_W && io.i_ROB_first_entry === uop.rob_idx)
    io.dcache_io.Maddr:= addr
    io.dcache_io.Mwout := uop.mem_type === MEM_W
    io.dcache_io.Men := !(uop.mem_type === MEM_N)
    io.dcache_io.Mlen := len
    io.dcache_io.MdataOut := uop.src2_value
    //----------------------------------
    io.o_ex_res_pack.uop := uop
    io.o_ex_res_pack.uop.dst_value := io.dcache_io.MdataIn

    val s_FREE :: s_BUSY  :: Nil = Enum(2)
    val state = RegInit(s_FREE)
    val next_state = Wire(UInt(2.W))
    state := next_state

    next_state := MuxCase(state,Seq(
        ((state === s_FREE) && (io.i_select )) -> s_BUSY,
        ((state === s_BUSY) && (io.i_select_to_commit)) -> s_FREE
    ))


    val ready_to_commit = RegInit(false.B)
    val next_ready_to_commit = Wire(Bool())
    ready_to_commit:=next_ready_to_commit

    next_ready_to_commit:=Mux((state===s_BUSY && io.dcache_io.valid),true.B,ready_to_commit)
    next_ready_to_commit:=MuxCase(ready_to_commit,Seq(
        (state===s_BUSY && io.dcache_io.valid)->true.B,
        (state===s_FREE) ->false.B 
    ))
    io.o_ex_res_pack.valid := next_ready_to_commit
    io.o_available := Mux(state === s_BUSY, false.B,true.B)

   printf("nextstate=%d\n",next_ready_to_commit)
   printf("nextstate=%d\n",state)
}