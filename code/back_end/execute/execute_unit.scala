abstract class Function_Unit extends Module{
    val io=IO(new Bundle{
        val i_uop=Input(new uop)
        val i_select=Input(Bool())//select the function unit
        val i_select_to_commit=Input(Bool())

        val o_func_idx=Output(UInt(5.W))
        val o_ex_res_pack=Output(new ex_result_pack())
    })    
    val uop = RegInit(new uop())//null uop
        when(io.i_select){
        uop:=io.i_uop
    }

    o_ex_res_pack.uop := uop
}
class ALU extends Function_Unit{
    io.o_func_idx:=FU_ALU

    val opr1 = Muxcase(0.U,Seq(
        (io.i_uop.op1_sel === OP1_RS1) -> io.i_uop.src1_value,
        (io.i_uop.op1_sel === OP1_ZERO) -> 0.U,
        (io.i_uop.op1_sel === OP1_IMZ) -> io.i_uop.imm,
    ))
    val opr2 = Muxcase(0.U,Seq(
        (io.i_uop.op2_sel === OP2_RS2) -> io.i_uop.src2_value,
        (io.i_uop.op2_sel === OP2_IMM) -> io.i_uop.imm,
        (io.i_uop.op2_sel === OP2_ZERO) -> 0.U
    ))
    uop.dst_value :=Muxcase(0.U,Seq(
        (io.i_uop.alu_sel === ALU_ADD) -> (opr1 + opr2),
        (io.i_uop.alu_sel === ALU_SUB) -> (opr1 - opr2),
        (io.i_uop.alu_sel === ALU_AND) -> (opr1 & opr2),
        (io.i_uop.alu_sel === ALU_OR) -> (opr1 | opr2),
        (io.i_uop.alu_sel === ALU_XOR) -> (opr1 ^ opr2),
        (io.i_uop.alu_sel === ALU_SLL) -> (opr1 << opr2(4,0)),
        (io.i_uop.alu_sel === ALU_SRL) -> (opr1 >> opr2(4,0)),
        (io.i_uop.alu_sel === ALU_SRA) -> (opr1.asSInt >> opr2(4,0)).asUInt,
        (io.i_uop.alu_sel === ALU_SLT) -> (opr1.asSInt < opr2.asSInt).asUInt,
        (io.i_uop.alu_sel === ALU_SLTU) -> (opr1 < opr2).asUInt,
        (io.i_uop.alu_sel === ALU_COPY1) -> opr1,
        (io.i_uop.alu_sel === ALU_COPY2) -> opr2,
        (io.i_uop.alu_sel === ALU_X) -> 0.U
    )
    )
    when(io.i_select){
        o_ex_res_pack.valid := true
    }.otherwise{
        o_ex_res_pack.valid := false
    }

}

class BRU extends Function_Unit{
    val io=IO(new Bundle{
        val o_prediction_resolve_pack = Output(new prediction_resolve_pack())
    })
    val branch_predict_pack = uop.branch_predict_pack

    val rs1=io.i_uop.src1_value
    val rs2=io.i_uop.src2_value

    val br_eq =(rs1 === rs2)
    val br_ltu = (rs1.asUInt < rs2.asUInt)
    val br_lt  = (~(rs1(63) ^ rs2(63)) & br_ltu |
                rs1(63) & ~rs2(63)).asBool

    val jalr_target_base = io.req.bits.rs1_data.asSInt
    val target_offset = uop.imm(20,0).asSInt
    val jalr_target= Wire(UInt(64.W))
    jalr_target := (jalr_target_base + target_offset).asUInt

  val pc_sel = MuxLookup(uop.br_type, PC_PLUS4,
                 Seq(   BR_N   -> PC_PLUS4,
                        BR_NE  -> Mux(!br_eq,  PC_BRJMP, PC_PLUS4),
                        BR_EQ  -> Mux( br_eq,  PC_BRJMP, PC_PLUS4),
                        BR_GE  -> Mux(!br_lt,  PC_BRJMP, PC_PLUS4),
                        BR_GEU -> Mux(!br_ltu, PC_BRJMP, PC_PLUS4),
                        BR_LT  -> Mux( br_lt,  PC_BRJMP, PC_PLUS4),
                        BR_LTU -> Mux( br_ltu, PC_BRJMP, PC_PLUS4),
                        BR_J   -> PC_BRJMP,
                        BR_JR  -> PC_JALR
                        ))

  val is_taken = (pc_sel =/= PC_PLUS4)
  val mispredict = WireInit(false.B)

  val target_address = Muxcase(pc_plus4, Seq(
    (pc_sel === PC_BRJ) -> uop.imm.asSInt+uop.pc.asSInt,
    (pc_sel === PC_JALR)  -> uop.src1_value,//????
    (pc_sel === PC_PLUS4)  -> uop.pc+4.U
  ))
  mispredict := !(is_taken^uop.branch_predict_pack.taken) || (target_address =!= uop.branch_predict_pack.target)

  val branch_resolve_pack = new branch_resolve_pack
  io.o_branch_resolve_pack := branch_resolve_pack

  branch_resolve_pack.is_branch      := io.select
  branch_resolve_pack.mispredict     := mispredict
  branch_resolve_pack.taken          := is_taken
  branch_resolve_pack.target         := target_address
}