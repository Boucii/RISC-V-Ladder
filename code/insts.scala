package Ladder

import chisel3._
import chisel3.util._
import Instructions._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

object decode_table extends consts{
  val table: Array[(BitPat, List[BitPat])] = Array(
    //64bits decode part
    //            valid, funcunit idx,  regwen,               type,           OP1_sel,          OP2_sel2,            alu_sel,         branch_type,              memoty_type(1 for write)
    AUIPC  -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(U_TYPE),   BitPat(SRC_IMM),    BitPat(SRC_PC),   BitPat(ALU_AUIPC),     BitPat(BR_N),             BitPat(MEM_N)), 
    ADDI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_ADDI),     BitPat(BR_N),             BitPat(MEM_N)), 
    JAL    -> List(Y,    BitPat(FU_BRU),       Y,        BitPat(J_TYPE),   BitPat(SRC_IMM),    BitPat(SRC_N),    BitPat(ALU_NONE),    BitPat(BR_J),             BitPat(MEM_N)), 
    JALR   -> List(Y,    BitPat(FU_BRU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_JR),            BitPat(MEM_N)), 
    SLTI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SLTI),     BitPat(BR_N),             BitPat(MEM_N)), 
    SLTIU  -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SLTIU),    BitPat(BR_N),             BitPat(MEM_N)), 
    XORI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_XORI),     BitPat(BR_N),             BitPat(MEM_N)), 
    ORI    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_ORI),      BitPat(BR_N),             BitPat(MEM_N)), 
    ANDI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_ANDI),     BitPat(BR_N),             BitPat(MEM_N)), 
    ADDIW  -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_ADDIW),     BitPat(BR_N),             BitPat(MEM_N)), 
    LB     -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LH     -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LW     -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LBU    -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LHU    -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LWU    -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LD     -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    LUI    -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(U_TYPE),   BitPat(SRC_IMM),    BitPat(SRC_N),    BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_R)), 
    SB     -> List(Y,    BitPat(FU_MEM),       N,        BitPat(S_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_W)), 
    SH     -> List(Y,    BitPat(FU_MEM),       N,        BitPat(S_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_W)), 
    SW     -> List(Y,    BitPat(FU_MEM),       N,        BitPat(S_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_W)), 
    SD     -> List(Y,    BitPat(FU_MEM),       N,        BitPat(S_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_W)), 
    SLLI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SLLI),      BitPat(BR_N),             BitPat(MEM_N)), 
    SRLI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SRLI),     BitPat(BR_N),             BitPat(MEM_N)), 
    SRAI   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SRAI),     BitPat(BR_N),             BitPat(MEM_N)), 
    SLLIW  -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SLLIW),      BitPat(BR_N),             BitPat(MEM_N)), 
    SRLIW  -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SRLIW),     BitPat(BR_N),             BitPat(MEM_N)), 
    SRAIW  -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_SRAIW),     BitPat(BR_N),             BitPat(MEM_N)), 
    ADD    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_ADD),     BitPat(BR_N),             BitPat(MEM_N)), 
    SUB    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SUB),     BitPat(BR_N),             BitPat(MEM_N)), 
    SLL    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SLL),      BitPat(BR_N),             BitPat(MEM_N)), 
    SLT    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SLT),      BitPat(BR_N),             BitPat(MEM_N)), 
    SLTU   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SLTU),      BitPat(BR_N),             BitPat(MEM_N)), 
    XOR    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_XOR),     BitPat(BR_N),             BitPat(MEM_N)), 
    SRL    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SRL),     BitPat(BR_N),             BitPat(MEM_N)), 
    SRA    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SRA),     BitPat(BR_N),             BitPat(MEM_N)), 
    OR     -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_OR),      BitPat(BR_N),             BitPat(MEM_N)), 
    AND    -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_AND),     BitPat(BR_N),             BitPat(MEM_N)), 
//  FENCE  -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(N,    )    BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
//  FENCE.I-> List(Y,    BitPat(FU_MEM),       Y,        BitPat(N,    )    BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 

    MUL    -> List(Y,    BitPat(FU_MUL),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    MULH   -> List(Y,    BitPat(FU_MUL),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    MULHSU -> List(Y,    BitPat(FU_MUL),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    MULHU  -> List(Y,    BitPat(FU_MUL),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    DIV    -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    DIVU   -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    REM    -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    REMU   -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    MULW   -> List(Y,    BitPat(FU_MUL),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    DIVW   -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    DIVUW  -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    REMW   -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
    REMUW  -> List(Y,    BitPat(FU_DIV),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 

    ADDW   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_ADDW),     BitPat(BR_N),             BitPat(MEM_N)), 
    SUBW   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SUBW),     BitPat(BR_N),             BitPat(MEM_N)), 
    SLLW   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SLLW),      BitPat(BR_N),             BitPat(MEM_N)), 
    SRLW   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SRLW),     BitPat(BR_N),             BitPat(MEM_N)), 
    SRAW   -> List(Y,    BitPat(FU_ALU),       Y,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_SRAW),     BitPat(BR_N),             BitPat(MEM_N)), 

    JAL    -> List(Y,    BitPat(FU_BRU),       Y,        BitPat(J_TYPE),   BitPat(SRC_IMM),    BitPat(SRC_N),    BitPat(ALU_NONE),    BitPat(BR_J),             BitPat(MEM_N)), 
    BEQ    -> List(Y,    BitPat(FU_BRU),       N,        BitPat(B_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_EQ),            BitPat(MEM_N)), 
    BNE    -> List(Y,    BitPat(FU_BRU),       N,        BitPat(B_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_NE),            BitPat(MEM_N)), 
    BLT    -> List(Y,    BitPat(FU_BRU),       N,        BitPat(B_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_LT),            BitPat(MEM_N)), 
    BGE    -> List(Y,    BitPat(FU_BRU),       N,        BitPat(B_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_GE),            BitPat(MEM_N)), 
    BLTU   -> List(Y,    BitPat(FU_BRU),       N,        BitPat(B_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_LTU),           BitPat(MEM_N)), 
    BGEU   -> List(Y,    BitPat(FU_BRU),       N,        BitPat(B_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(ALU_NONE),    BitPat(BR_GEU),           BitPat(MEM_N)) 

    EBREAK -> List(Y,    BitPat(FU_CSR),       N,        BitPat(I_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(CSR_EBREAK),  BitPat(BR_N),             BitPat(MEM_N)), 
    MRET   -> List(Y,    BitPat(FU_CSR),       N,        BitPat(R_TYPE),   BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(CSR_MRET),    BitPat(BR_N),             BitPat(MEM_N)), 
    ECALL  -> List(Y,    BitPat(FU_CSR),       N,        BitPat(I_TYPE)    BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(CSR_ECALL),   BitPat(BR_N),             BitPat(MEM_N)), 
    CSRRC  -> List(Y,    BitPat(FU_CSR),       Y,        BitPat(I_TYPE)    BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(CSR_CSRRC),   BitPat(BR_N),             BitPat(MEM_N)), 
    CSRRW  -> List(Y,    BitPat(FU_CSR),       Y,        BitPat(I_TYPE)    BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(CSR_CSRRW),   BitPat(BR_N),             BitPat(MEM_N)), 
    CSRRS  -> List(Y,    BitPat(FU_CSR),       Y,        BitPat(I_TYPE)    BitPat(SRC_RS),     BitPat(SRC_RS),   BitPat(CSR_CSRRS),   BitPat(BR_N),             BitPat(MEM_N)), 
//  CSRRW  -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I,    )    BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
//  CSRRS  -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I,    )    BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
//  CSRRC  -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I,    )    BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
//  CSRRWI -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I,    )    BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
//  CSRRSI -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I,    )    BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
//  CSRRCI -> List(Y,    BitPat(FU_MEM),       Y,        BitPat(I,    )    BitPat(SRC_RS),     BitPat(SRC_IMM),  BitPat(ALU_NONE),    BitPat(BR_N),             BitPat(MEM_N)), 
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