class ALU extends Module{
    val io=IO(new Bundle{
        val i_uop=Input(new uop)

        val o_ex_res_pack=Output(new ex_result_pack())
    })
    val uop = new uop()
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
    ))
    io.i_uop.src1_value + io.i_uop.src2_value
    o_ex_res_pack.valid := true
    o_ex_res_pack.uop := uop
}