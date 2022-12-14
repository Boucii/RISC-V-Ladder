class DecodeInfo extends Bundle with consts{
    val valid=Bool()
    val func_unit=UInt(7.W)//TODO: change to enum
    val regWen=Bool()
    val inst_type = UInt(7.W)
    val op1_sel = UInt(2.W)
    val op2_sel = UInt(3.W)//
    val alu_sel = UInt(3.W)//??select alu functions
    val branch_type = UInt(3.W)
    val mem_type = UInt(2.W)

    def decode(inst: UInt, table: Iterable[(BitPat, List[BitPat])]) = {
    val decoder = decoder(QMCMinimizer,inst,table)
    val sigs =
      Seq(valid, func_unit, regWen, inst_type, op1_sel, op2_sel, alu_sel, branch_type, mem_type)
      sigs zip decoder map {case(s,d) => s := d}
      this
  }
}

class Decoder extends Module{
    val io = IO(new Bundle {
        val i_fetch_pack = Decoupled(new fetchpack)
        val o_decode_packs = Output(Vec(2,new decode_pack()))
    })
    val uops = Reg(Vec(2,new decode_pack()))//aka uop
    val inst0 = uops(0).inst
    val inst1 = uops(1).inst

    val immI0=Mux(inst0(31)=/=1.U,inst0(31,20),Cat(0xfffffffffffffL.U,inst0(31,20)))
    val immS0=Mux(inst0(31)=/=1.U,Cat(inst0(31,25),inst0(11,7)),Cat(Cat(0xffffffffL.U,inst0(31,25)),inst0(11,7)))
    val immU0=inst0(31,12)<<12
    val immJ0=(Mux(inst0(31)===1.U,0xfffffffffffL.U,inst0(31,31))<<20).asUInt+(inst0(19,12)<<12).asUInt+(inst0(20,20)<<11).asUInt+(inst0(30,21)<<1).asUInt //optimization?
    val immB0=(Mux(inst0(31)=/=1.U,inst0(31,31),0xfffffffffffL.U)<<12).asUInt+(inst0(7,7)<<11).asUInt+(inst0(30,25)<<5).asUInt+(inst0(11,8)<<1).asUInt

    val immI1=Mux(inst1(31)=/=1.U,inst1(31,20),Cat(0xfffffffffffffL.U,inst1(31,20)))
    val immS1=Mux(inst1(31)=/=1.U,Cat(inst1(31,25),inst1(11,7)),Cat(Cat(0xffffffffL.U,inst1(31,25)),inst(11,7)))
    val immU1=inst1(31,12)<<12
    val immJ1=(Mux(inst1(31)===1.U,0xfffffffffffL.U,inst1(31,31))<<20).asUInt+(inst1(19,12)<<12).asUInt+(inst1(20,20)<<11).asUInt+(inst1(30,21)<<1).asUInt //optimization?
    val immB1=(Mux(inst1(31)=/=1.U,inst1(31,31),0xfffffffffffL.U)<<12).asUInt+(inst1(7,7)<<11).asUInt+(inst1(30,25)<<5).asUInt+(inst1(11,8)<<1).asUInt
    //IOs
    io.o_decode_packs:=uops
   var table=decode_table.table 

   for(i <- 0 until 2){
       uops(i).pc:=io.i_fetch_pack.bits.pc
       uops(i).inst:=io.i_fetch_pack.bits.inst
       uops(i).uop:= wire(new ).decode(inst0,table)  
       uops(i).op1_sel := Muxcase(SRC_RS,uop.inst_type,seq(//change for pc
          I_TYPE->SRC_RS,
          U_TYPE->SRC_IMM,
          S_TYPE ->OP1_RS1,
          J_TYPE->OP1_IMM,
          B_TYPE ->OP1_RS1,
          R_TYPE ->OP1_RS1,
       ))
       uops(i).op2_sel := Muxcase(OP2_RS2,uop.inst_type,seq(//change for pc
          I_TYPE->OP1_IMM,
          U_TYPE->OP1_IMM,
          S_TYPE ->OP1_RS1,
          J_TYPE->OP1_IMM,
          B_TYPE ->OP1_RS1,
          R_TYPE ->OP1_RS1,
       ))
      uops(i).imm := Muxcase(0.U,uop.inst_type,seq(
          I_TYPE->IMM_I,
          U_TYPE->IMM_U,
          S_TYPE ->IMM_S,
          J_TYPE->IMM_J,
          B_TYPE ->IMM_B,
          R_TYPE ->0.U,
      ))
      uops(i).arch_rs1:= inst(i)(19,15)
      uops(i).arch_rs2:= inst(i)(24,20)
      uops(i).arch_dst:= Muxcase(inst(i)(11,7),uop(i).inst_type,seq(
          S_TYPE ->IMM_S,
          B_TYPE ->IMM_B,
      ))
      uops(i).src1_valid:=Muxcase(false.B,uop(i).op1_sel,seq(
        OP_RS -> false.B,
        OP_IMM ->true.B,
        OP_PC ->true.B,
        OP_ZERO -> true.B,
        OP_N -> true.B,
      ))
      uops(i).src2_valid:=Muxcase(false.B,uop(i).op2_sel,seq(
        OP_RS -> false.B,
        OP_IMM ->true.B,
        OP_PC ->true.B,
        OP_ZERO -> true.B,
        OP_N -> true.B,
      ))
      uops(i).src1_value:=Muxcase(0.U,uop(i).op1_sel,seq(
        OP_IMM ->uop(i).imm,
        OP_PC ->uop(i).pc,
      ))
      uops(i).src2_value:=Muxcase(0.U,uop(i).op2_sel,seq(
        OP_IMM ->uop(i).imm,
        OP_PC ->uop(i).pc,
      ))
   }
}