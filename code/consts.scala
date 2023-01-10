trait consts{
    def X = BitPat("b?")
    def N = BitPat("b0")
    def Y = BitPat("b1")
//SRC_TYPE
    val SRC_RS = 0.U(3.W) 
    val SRC_ZERO = 1.U(3.W)
    val SRC_PC = 2.U(3.W)
    val SRC_IMM = 3.U(3.W)
    val SRC_N = 4.U(3.W)

//Funtion_Code
    val FU_ALU = 1.U(7.W)
    val FU_BRU = 2.U(7.W)
    val FU_MEM = 4.U(7.W)
    val FU_MUL = 8.U(7.W)
    val FU_DIV = 16.U(7.W)
    val FU_CSR = 32.U(7.W)
    val FU_NUL = 64.U(7.W)

//BRANCH_TYPE
    val BR_N   = 0.U(4.W)//none
    val BR_NE  = 1.U(4.W)
    val BR_EQ  = 2.U(4.W)
    val BR_GE  = 3.U(4.W)
    val BR_GEU = 4.U(4.W)
    val BR_LT  = 5.U(4.W)
    val BR_LTU = 6.U(4.W)
    val BR_J   = 7.U(4.W)
    val BR_JR  = 8.U(4.W)

//Mem_Type
    val MEM_N       = 0.U(2.W)
    val MEM_W       = 1.U(2.W)
    val MEM_R       = 2.U(2.W)

//INST_TYPE
    val R_TYPE = 0.U(7.W)
    val I_TYPE = 1.U(7.W)
    val S_TYPE = 2.U(7.W)
    val B_TYPE = 3.U(7.W)
    val U_TYPE = 4.U(7.W)
    val J_TYPE = 5.U(7.W)
    val N_TYPE = 6.U(7.W)

//ALU_SEL
    val ALU_NONE   = 0.U(4.W)
    val ALU_ADD    = 1.U(4.W)
    val ALU_SUB    = 2.U(4.W)
    
    val ALU_AND    = 3.U(4.W)
    val ALU_OR     = 4.U(4.W)
    val ALU_XOR    = 5.U(4.W)
    
    val ALU_SL     = 6.U(4.W)
    val ALU_SRL    = 7.U(4.W)
    val ALU_SRA    = 8.U(4.W)
    
    val ALU_SLT    = 9.U(4.W)
    val ALU_SLTU   = 10.U(4.W)
}