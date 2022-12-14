package Ladder

import chisel3._
import chisel3.util._
object decode_table{
  val table: Array[(BitPat, List[BitPat])] = Array(
    //64bits decode part
    //            valid, funcunit idx,  regwen,   type,     OP1_sel,    OP2_sel2,   branch_type,  memoty_type(1 for write)
    AUIPC,  -> List(Y,    FU_ALU,       Y,        U_TYPE,   OP1_IMM,    OP2_PC,         BR_N,             MEM_N), //???
    ADDI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
  //  EBREAK, -> List(Y,    FU_MEM,       Y,        N_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    JAL,    -> List(Y,    FU_BRU,       Y,        J_TYPE,   OP1_IMM,    OP2_N,         BR_J,             MEM_N), 
    JALR,   -> List(Y,    FU_BRU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_JR,             MEM_N), 
    SLTI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    SLTIU,  -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    XORI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    ORI,    -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    ANDI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    ADDIW,  -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    LB,     -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LH,     -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LW,     -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LBU,    -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LHU,    -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LWU,    -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LD,     -> List(Y,    FU_MEM,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_R), 
    LUI,    -> List(Y,    FU_MEM,       Y,        U_TYPE,   OP1_IMM,    OP2_N,        BR_N,             MEM_R), 
    SB,     -> List(Y,    FU_MEM,       N,        S_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_W), 
    SH,     -> List(Y,    FU_MEM,       N,        S_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_W), 
    SW,     -> List(Y,    FU_MEM,       N,        S_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_W), 
    SD,     -> List(Y,    FU_MEM,       N,        S_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_W), 
    SLLI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    SRLI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    SRAI,   -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    SLLIW,  -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    SRLIW,  -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    SRAIW,  -> List(Y,    FU_ALU,       Y,        I_TYPE,   OP1_RS1,    OP2_IMM,         BR_N,             MEM_N), 
    ADD,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SUB,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SLL,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SLT,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SLTU,   -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    XOR,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SRL,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SRA,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    OR,     -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    AND,    -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
  //  FENCE,  -> List(Y,    FU_MEM,       Y,        N,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  FENCE.I,-> List(Y,    FU_MEM,       Y,        N,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  MUL,    -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  MULH,   -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  MULHSU, -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  MULHU,  -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  DIV,    -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  DIVU,   -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  REM,    -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  REMU,   -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  MULW,   -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  DIVW,   -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  DIVUW,  -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  REMW,   -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  REMUW,  -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
    ADDW,   -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SUBW,   -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SLLW,   -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SRLW,   -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
    SRAW,   -> List(Y,    FU_ALU,       Y,        R_TYPE,   OP1_RS1,    OP2_RS2,         BR_N,             MEM_N), 
  //  MULW.Q, -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  DIVW.Q, -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  DIVUW.Q,-> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  REMW.Q, -> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  REMUW.Q,-> List(Y,    FU_MEM,       Y,        R,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
    J,      -> List(Y,    FU_BRU,       N,        J_TYPE,   OP1_IMM,    OP2_N,         BR_J,             MEM_N), 
    JAL,    -> List(Y,    FU_BRU,       Y,        J_TYPE,   OP1_IMM,    OP2_N,         BR_J,             MEM_N), 
    BEQ,    -> List(Y,    FU_BRU,       N,        B_TYPE,   OP1_RS1,    OP2_RS2,         BR_EQ,             MEM_N), 
    BNE,    -> List(Y,    FU_BRU,       N,        B_TYPE,   OP1_RS1,    OP2_RS2,         BR_NE,             MEM_N), 
    BLT,    -> List(Y,    FU_BRU,       N,        B_TYPE,   OP1_RS1,    OP2_RS2,         BR_LT,             MEM_N), 
    BGE,    -> List(Y,    FU_BRU,       N,        B_TYPE,   OP1_RS1,    OP2_RS2,         BR_GE,             MEM_N), 
    BLTU,   -> List(Y,    FU_BRU,       N,        B_TYPE,   OP1_RS1,    OP2_RS2,         BR_LTU,             MEM_N), 
    BGEU,   -> List(Y,    FU_BRU,       N,        B_TYPE,   OP1_RS1,    OP2_RS2,         BR_GEU,             MEM_N), 
  //  ECALL,  -> List(Y,    FU_MEM,       Y,        N,      OP1_RS1,    OP2_RS2,      BR_N,             MEM_N), 
  //  CSRRW,  -> List(Y,    FU_MEM,       Y,        I,      OP1_RS1,    OP2_IMM,      BR_N,             MEM_N), 
  //  CSRRS,  -> List(Y,    FU_MEM,       Y,        I,      OP1_RS1,    OP2_IMM,      BR_N,             MEM_N), 
  //  CSRRC,  -> List(Y,    FU_MEM,       Y,        I,      OP1_RS1,    OP2_IMM,      BR_N,             MEM_N), 
  //  CSRRWI, -> List(Y,    FU_MEM,       Y,        I,      OP1_RS1,    OP2_IMM,      BR_N,             MEM_N), 
  //  CSRRSI, -> List(Y,    FU_MEM,       Y,        I,      OP1_RS1,    OP2_IMM,      BR_N,             MEM_N), 
  //  CSRRCI, -> List(Y,    FU_MEM,       Y,        I,      OP1_RS1,    OP2_IMM,      BR_N,             MEM_N), 
  )
}
object Instructions {
  def TRAP               = BitPat("b000000000000?????000000001101011")
  def BEQ                = BitPat("b?????????????????000?????1100011")
  def BNE                = BitPat("b?????????????????001?????1100011")
  def BLT                = BitPat("b?????????????????100?????1100011")
  def BGE                = BitPat("b?????????????????101?????1100011")
  def BLTU               = BitPat("b?????????????????110?????1100011")
  def BGEU               = BitPat("b?????????????????111?????1100011")
  def JALR               = BitPat("b?????????????????000?????1100111")
  def JAL                = BitPat("b?????????????????????????1101111")
  def LUI                = BitPat("b?????????????????????????0110111")
  def AUIPC              = BitPat("b?????????????????????????0010111")
  def ADDI               = BitPat("b?????????????????000?????0010011")
  def SLLI               = BitPat("b000000???????????001?????0010011")
  def SLTI               = BitPat("b?????????????????010?????0010011")
  def SLTIU              = BitPat("b?????????????????011?????0010011")
  def XORI               = BitPat("b?????????????????100?????0010011")
  def SRLI               = BitPat("b000000???????????101?????0010011")
  def SRAI               = BitPat("b010000???????????101?????0010011")
  def ORI                = BitPat("b?????????????????110?????0010011")
  def ANDI               = BitPat("b?????????????????111?????0010011")
  def ADD                = BitPat("b0000000??????????000?????0110011")
  def SUB                = BitPat("b0100000??????????000?????0110011")
  def SLL                = BitPat("b0000000??????????001?????0110011")
  def SLT                = BitPat("b0000000??????????010?????0110011")
  def SLTU               = BitPat("b0000000??????????011?????0110011")
  def XOR                = BitPat("b0000000??????????100?????0110011")
  def SRL                = BitPat("b0000000??????????101?????0110011")
  def SRA                = BitPat("b0100000??????????101?????0110011")
  def OR                 = BitPat("b0000000??????????110?????0110011")
  def AND                = BitPat("b0000000??????????111?????0110011")
  def ADDIW              = BitPat("b?????????????????000?????0011011")
  def SLLIW              = BitPat("b0000000??????????001?????0011011")
  def SRLIW              = BitPat("b0000000??????????101?????0011011")
  def SRAIW              = BitPat("b0100000??????????101?????0011011")
  def ADDW               = BitPat("b0000000??????????000?????0111011")
  def SUBW               = BitPat("b0100000??????????000?????0111011")
  def SLLW               = BitPat("b0000000??????????001?????0111011")
  def SRLW               = BitPat("b0000000??????????101?????0111011")
  def SRAW               = BitPat("b0100000??????????101?????0111011")
  def LB                 = BitPat("b?????????????????000?????0000011")
  def LH                 = BitPat("b?????????????????001?????0000011")
  def LW                 = BitPat("b?????????????????010?????0000011")
  def LD                 = BitPat("b?????????????????011?????0000011")
  def LBU                = BitPat("b?????????????????100?????0000011")
  def LHU                = BitPat("b?????????????????101?????0000011")
  def LWU                = BitPat("b?????????????????110?????0000011")
  def SB                 = BitPat("b?????????????????000?????0100011")
  def SH                 = BitPat("b?????????????????001?????0100011")
  def SW                 = BitPat("b?????????????????010?????0100011")
  def SD                 = BitPat("b?????????????????011?????0100011")
  def FENCE              = BitPat("b?????????????????000?????0001111")
  def FENCE_I            = BitPat("b?????????????????001?????0001111")
  def MUL                = BitPat("b0000001??????????000?????0110011")
  def MULH               = BitPat("b0000001??????????001?????0110011")
  def MULHSU             = BitPat("b0000001??????????010?????0110011")
  def MULHU              = BitPat("b0000001??????????011?????0110011")
  def DIV                = BitPat("b0000001??????????100?????0110011")
  def DIVU               = BitPat("b0000001??????????101?????0110011")
  def REM                = BitPat("b0000001??????????110?????0110011")
  def REMU               = BitPat("b0000001??????????111?????0110011")
  def MULW               = BitPat("b0000001??????????000?????0111011")
  def DIVW               = BitPat("b0000001??????????100?????0111011")
  def DIVUW              = BitPat("b0000001??????????101?????0111011")
  def REMW               = BitPat("b0000001??????????110?????0111011")
  def REMUW              = BitPat("b0000001??????????111?????0111011")
}