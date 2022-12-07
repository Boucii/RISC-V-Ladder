class Decoder extends Module{
    val io = IO(new Bundle {
        val i_fetch_pack = Decoupled(new fetchpack)
        val o_decode_packs = Output(Vec(2,new decode_pack()))
    })
    val uops = Reg(Vec(2,new decode_pack()))//aka uop
    //IOs
    uops(0).pc:=io.i_fetch_pack.bits.pc
    uops(0).inst:=io.i_fetch_pack.bits.inst
    uops(1).pc:=io.i_fetch_pack.bits.pc
    uops(1).inst:=io.i_fetch_pack.bits.inst
    io.o_decode_packs:=uops

   var table=decode_table.table 
   val inst0=io.i_fetch_pack.bits.inst
   val inst1=io.i_fetch_pack.bits.inst

   uops(0).uop:= wire(new ).decode(inst0,table)  
   uops(1).uop:= Wire(new ).decode(inst1,table)
}
//just occupy the place, replace it with actual table complying to my uop
abstract trait defalut_decode_table{
  def decode_default: List[BitPat] = //follow the format of the uop
              List(N, X, uopX    , IQT_INT, FU_X   , RT_X  , DC2    ,DC2    ,X, IS_X, X, X, X, X, N, M_X,   DC2, X, X, N, N, X, CSR.X)
  val table: Array[(BitPat, List[BitPat])]
}
object decode_table extends defalut_decode_table
{
           //                                                                 frs3_en                        wakeup_delay
           //     is val inst?                                                |  imm sel                     |    bypassable (aka, known/fixed latency)
           //     |                                                           |  |     uses_ldq              |    |  is_br
           //     |    is single-prec?                        rs1 regtype     |  |     |  uses_stq           |    |  |
           //     |    |  micro-code                          |       rs2 type|  |     |  |  is_amo          |    |  |
           //     |    |  |         iq-type  func unit        |       |       |  |     |  |  |  is_fence     |    |  |
           //     |    |  |         |        |                |       |       |  |     |  |  |  |  is_fencei |    |  |  is breakpoint or ecall?
           //     |    |  |         |        |        dst     |       |       |  |     |  |  |  |  |  mem    |    |  |  |  is unique? (clear pipeline for it)
           //     |    |  |         |        |        regtype |       |       |  |     |  |  |  |  |  cmd    |    |  |  |  |  flush on commit
           //     |    |  |         |        |        |       |       |       |  |     |  |  |  |  |  |      |    |  |  |  |  |  csr cmd
  val table: Array[(BitPat, List[BitPat])] = Array(// |       |       |       |  |     |  |  |  |  |  |      |    |  |  |  |  |  |
  LW      -> List(Y, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3.U, N, N, N, N, N, CSR.N),
  LH      -> List(Y, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3.U, N, N, N, N, N, CSR.N),
  LHU     -> List(Y, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3.U, N, N, N, N, N, CSR.N),
  LB      -> List(Y, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3.U, N, N, N, N, N, CSR.N),
  LBU     -> List(Y, X, uopLD   , IQT_MEM, FU_MEM , RT_FIX, RT_FIX, RT_X  , N, IS_I, Y, N, N, N, N, M_XRD, 3.U, N, N, N, N, N, CSR.N),
            
  SW      -> List(Y, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0.U, N, N, N, N, N, CSR.N),
  SH      -> List(Y, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0.U, N, N, N, N, N, CSR.N),
  SB      -> List(Y, X, uopSTA  , IQT_MEM, FU_MEM , RT_X  , RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0.U, N, N, N, N, N, CSR.N),
            
  LUI     -> List(Y, X, uopLUI  , IQT_INT, FU_ALU , RT_FIX, RT_X  , RT_X  , N, IS_U, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
            
  ADDI    -> List(Y, X, uopADDI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  ANDI    -> List(Y, X, uopANDI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  ORI     -> List(Y, X, uopORI  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  XORI    -> List(Y, X, uopXORI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SLTI    -> List(Y, X, uopSLTI , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SLTIU   -> List(Y, X, uopSLTIU, IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_X  , N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
            
  SLL     -> List(Y, X, uopSLL  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  ADD     -> List(Y, X, uopADD  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SUB     -> List(Y, X, uopSUB  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SLT     -> List(Y, X, uopSLT  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SLTU    -> List(Y, X, uopSLTU , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  AND     -> List(Y, X, uopAND  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  OR      -> List(Y, X, uopOR   , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  XOR     -> List(Y, X, uopXOR  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SRA     -> List(Y, X, uopSRA  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
  SRL     -> List(Y, X, uopSRL  , IQT_INT, FU_ALU , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 1.U, Y, N, N, N, N, CSR.N),
            
  MUL     -> List(Y, X, uopMUL  , IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  MULH    -> List(Y, X, uopMULH , IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  MULHU   -> List(Y, X, uopMULHU, IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  MULHSU  -> List(Y, X, uopMULHSU,IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  MULW    -> List(Y, X, uopMULW , IQT_INT, FU_MUL , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
            
  DIV     -> List(Y, X, uopDIV  , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  DIVU    -> List(Y, X, uopDIVU , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  REM     -> List(Y, X, uopREM  , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  REMU    -> List(Y, X, uopREMU , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  DIVW    -> List(Y, X, uopDIVW , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  DIVUW   -> List(Y, X, uopDIVUW, IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  REMW    -> List(Y, X, uopREMW , IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  REMUW   -> List(Y, X, uopREMUW, IQT_INT, FU_DIV , RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X  , 0.U, N, N, N, N, N, CSR.N),
  )
}