module CSR(
  input         clock,
  input         reset,
  input         io_i_interrupt,
  input         io_i_commit_packs_0_valid,
  input         io_i_commit_packs_0_uop_valid,
  input  [31:0] io_i_commit_packs_0_uop_pc,
  input  [31:0] io_i_commit_packs_0_uop_inst,
  input  [6:0]  io_i_commit_packs_0_uop_func_code,
  input         io_i_commit_packs_0_uop_branch_predict_pack_valid,
  input  [63:0] io_i_commit_packs_0_uop_branch_predict_pack_target,
  input  [3:0]  io_i_commit_packs_0_uop_branch_predict_pack_branch_type,
  input         io_i_commit_packs_0_uop_branch_predict_pack_select,
  input         io_i_commit_packs_0_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_commit_packs_0_uop_phy_dst,
  input  [6:0]  io_i_commit_packs_0_uop_stale_dst,
  input  [4:0]  io_i_commit_packs_0_uop_arch_dst,
  input  [2:0]  io_i_commit_packs_0_uop_inst_type,
  input         io_i_commit_packs_0_uop_regWen,
  input         io_i_commit_packs_0_uop_src1_valid,
  input  [6:0]  io_i_commit_packs_0_uop_phy_rs1,
  input  [4:0]  io_i_commit_packs_0_uop_arch_rs1,
  input         io_i_commit_packs_0_uop_src2_valid,
  input  [6:0]  io_i_commit_packs_0_uop_phy_rs2,
  input  [4:0]  io_i_commit_packs_0_uop_arch_rs2,
  input  [5:0]  io_i_commit_packs_0_uop_rob_idx,
  input  [63:0] io_i_commit_packs_0_uop_imm,
  input  [63:0] io_i_commit_packs_0_uop_dst_value,
  input  [63:0] io_i_commit_packs_0_uop_src1_value,
  input  [63:0] io_i_commit_packs_0_uop_src2_value,
  input  [2:0]  io_i_commit_packs_0_uop_op1_sel,
  input  [2:0]  io_i_commit_packs_0_uop_op2_sel,
  input  [4:0]  io_i_commit_packs_0_uop_alu_sel,
  input  [3:0]  io_i_commit_packs_0_uop_branch_type,
  input  [1:0]  io_i_commit_packs_0_uop_mem_type,
  input         io_i_commit_packs_1_valid,
  input         io_i_commit_packs_1_uop_valid,
  input  [31:0] io_i_commit_packs_1_uop_pc,
  input  [31:0] io_i_commit_packs_1_uop_inst,
  input  [6:0]  io_i_commit_packs_1_uop_func_code,
  input         io_i_commit_packs_1_uop_branch_predict_pack_valid,
  input  [63:0] io_i_commit_packs_1_uop_branch_predict_pack_target,
  input  [3:0]  io_i_commit_packs_1_uop_branch_predict_pack_branch_type,
  input         io_i_commit_packs_1_uop_branch_predict_pack_select,
  input         io_i_commit_packs_1_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_commit_packs_1_uop_phy_dst,
  input  [6:0]  io_i_commit_packs_1_uop_stale_dst,
  input  [4:0]  io_i_commit_packs_1_uop_arch_dst,
  input  [2:0]  io_i_commit_packs_1_uop_inst_type,
  input         io_i_commit_packs_1_uop_regWen,
  input         io_i_commit_packs_1_uop_src1_valid,
  input  [6:0]  io_i_commit_packs_1_uop_phy_rs1,
  input  [4:0]  io_i_commit_packs_1_uop_arch_rs1,
  input         io_i_commit_packs_1_uop_src2_valid,
  input  [6:0]  io_i_commit_packs_1_uop_phy_rs2,
  input  [4:0]  io_i_commit_packs_1_uop_arch_rs2,
  input  [5:0]  io_i_commit_packs_1_uop_rob_idx,
  input  [63:0] io_i_commit_packs_1_uop_imm,
  input  [63:0] io_i_commit_packs_1_uop_dst_value,
  input  [63:0] io_i_commit_packs_1_uop_src1_value,
  input  [63:0] io_i_commit_packs_1_uop_src2_value,
  input  [2:0]  io_i_commit_packs_1_uop_op1_sel,
  input  [2:0]  io_i_commit_packs_1_uop_op2_sel,
  input  [4:0]  io_i_commit_packs_1_uop_alu_sel,
  input  [3:0]  io_i_commit_packs_1_uop_branch_type,
  input  [1:0]  io_i_commit_packs_1_uop_mem_type,
  output [63:0] io_o_pc_redirect_target,
  output        io_o_pc_redirect_valid,
  output        io_o_commit_packs_modified_0_valid,
  output        io_o_commit_packs_modified_0_uop_valid,
  output [31:0] io_o_commit_packs_modified_0_uop_pc,
  output [31:0] io_o_commit_packs_modified_0_uop_inst,
  output [6:0]  io_o_commit_packs_modified_0_uop_func_code,
  output        io_o_commit_packs_modified_0_uop_branch_predict_pack_valid,
  output [63:0] io_o_commit_packs_modified_0_uop_branch_predict_pack_target,
  output [3:0]  io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type,
  output        io_o_commit_packs_modified_0_uop_branch_predict_pack_select,
  output        io_o_commit_packs_modified_0_uop_branch_predict_pack_taken,
  output [6:0]  io_o_commit_packs_modified_0_uop_phy_dst,
  output [6:0]  io_o_commit_packs_modified_0_uop_stale_dst,
  output [4:0]  io_o_commit_packs_modified_0_uop_arch_dst,
  output [2:0]  io_o_commit_packs_modified_0_uop_inst_type,
  output        io_o_commit_packs_modified_0_uop_regWen,
  output        io_o_commit_packs_modified_0_uop_src1_valid,
  output [6:0]  io_o_commit_packs_modified_0_uop_phy_rs1,
  output [4:0]  io_o_commit_packs_modified_0_uop_arch_rs1,
  output        io_o_commit_packs_modified_0_uop_src2_valid,
  output [6:0]  io_o_commit_packs_modified_0_uop_phy_rs2,
  output [4:0]  io_o_commit_packs_modified_0_uop_arch_rs2,
  output [5:0]  io_o_commit_packs_modified_0_uop_rob_idx,
  output [63:0] io_o_commit_packs_modified_0_uop_imm,
  output [63:0] io_o_commit_packs_modified_0_uop_dst_value,
  output [63:0] io_o_commit_packs_modified_0_uop_src1_value,
  output [63:0] io_o_commit_packs_modified_0_uop_src2_value,
  output [2:0]  io_o_commit_packs_modified_0_uop_op1_sel,
  output [2:0]  io_o_commit_packs_modified_0_uop_op2_sel,
  output [4:0]  io_o_commit_packs_modified_0_uop_alu_sel,
  output [3:0]  io_o_commit_packs_modified_0_uop_branch_type,
  output [1:0]  io_o_commit_packs_modified_0_uop_mem_type,
  output        io_o_commit_packs_modified_1_valid,
  output        io_o_commit_packs_modified_1_uop_valid,
  output [31:0] io_o_commit_packs_modified_1_uop_pc,
  output [31:0] io_o_commit_packs_modified_1_uop_inst,
  output [6:0]  io_o_commit_packs_modified_1_uop_func_code,
  output        io_o_commit_packs_modified_1_uop_branch_predict_pack_valid,
  output [63:0] io_o_commit_packs_modified_1_uop_branch_predict_pack_target,
  output [3:0]  io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type,
  output        io_o_commit_packs_modified_1_uop_branch_predict_pack_select,
  output        io_o_commit_packs_modified_1_uop_branch_predict_pack_taken,
  output [6:0]  io_o_commit_packs_modified_1_uop_phy_dst,
  output [6:0]  io_o_commit_packs_modified_1_uop_stale_dst,
  output [4:0]  io_o_commit_packs_modified_1_uop_arch_dst,
  output [2:0]  io_o_commit_packs_modified_1_uop_inst_type,
  output        io_o_commit_packs_modified_1_uop_regWen,
  output        io_o_commit_packs_modified_1_uop_src1_valid,
  output [6:0]  io_o_commit_packs_modified_1_uop_phy_rs1,
  output [4:0]  io_o_commit_packs_modified_1_uop_arch_rs1,
  output        io_o_commit_packs_modified_1_uop_src2_valid,
  output [6:0]  io_o_commit_packs_modified_1_uop_phy_rs2,
  output [4:0]  io_o_commit_packs_modified_1_uop_arch_rs2,
  output [5:0]  io_o_commit_packs_modified_1_uop_rob_idx,
  output [63:0] io_o_commit_packs_modified_1_uop_imm,
  output [63:0] io_o_commit_packs_modified_1_uop_dst_value,
  output [63:0] io_o_commit_packs_modified_1_uop_src1_value,
  output [63:0] io_o_commit_packs_modified_1_uop_src2_value,
  output [2:0]  io_o_commit_packs_modified_1_uop_op1_sel,
  output [2:0]  io_o_commit_packs_modified_1_uop_op2_sel,
  output [4:0]  io_o_commit_packs_modified_1_uop_alu_sel,
  output [3:0]  io_o_commit_packs_modified_1_uop_branch_type,
  output [1:0]  io_o_commit_packs_modified_1_uop_mem_type,
  output [63:0] io_o_mepc,
  output [63:0] io_o_mtvec,
  output [63:0] io_o_mcause,
  output [63:0] io_o_mstatus
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mepc; // @[csr.scala 28:26]
  reg [63:0] mtvec; // @[csr.scala 29:26]
  reg [63:0] mcause; // @[csr.scala 30:26]
  reg [63:0] mstatus; // @[csr.scala 31:26]
  wire  _commit0_is_csr_rw_T = io_i_commit_packs_0_uop_func_code == 7'h20; // @[csr.scala 48:48]
  wire  _commit0_is_csr_rw_T_1 = io_i_commit_packs_0_valid & _commit0_is_csr_rw_T; // @[csr.scala 47:53]
  wire  _commit0_is_csr_rw_T_2 = io_i_commit_packs_0_uop_alu_sel == 5'h1; // @[csr.scala 49:46]
  wire  _commit0_is_csr_rw_T_3 = io_i_commit_packs_0_uop_alu_sel == 5'h2; // @[csr.scala 50:46]
  wire  _commit0_is_csr_rw_T_4 = io_i_commit_packs_0_uop_alu_sel == 5'h1 | _commit0_is_csr_rw_T_3; // @[csr.scala 49:60]
  wire  _commit0_is_csr_rw_T_5 = io_i_commit_packs_0_uop_alu_sel == 5'h3; // @[csr.scala 51:46]
  wire  _commit0_is_csr_rw_T_6 = _commit0_is_csr_rw_T_4 | _commit0_is_csr_rw_T_5; // @[csr.scala 50:60]
  wire  commit0_is_csr_rw = _commit0_is_csr_rw_T_1 & _commit0_is_csr_rw_T_6; // @[csr.scala 48:59]
  wire  _commit1_is_csr_rw_T = io_i_commit_packs_1_uop_func_code == 7'h20; // @[csr.scala 54:48]
  wire  _commit1_is_csr_rw_T_1 = io_i_commit_packs_1_valid & _commit1_is_csr_rw_T; // @[csr.scala 53:53]
  wire  _commit1_is_csr_rw_T_2 = io_i_commit_packs_1_uop_alu_sel == 5'h1; // @[csr.scala 55:46]
  wire  _commit1_is_csr_rw_T_3 = io_i_commit_packs_1_uop_alu_sel == 5'h2; // @[csr.scala 56:46]
  wire  _commit1_is_csr_rw_T_4 = io_i_commit_packs_1_uop_alu_sel == 5'h1 | _commit1_is_csr_rw_T_3; // @[csr.scala 55:60]
  wire  _commit1_is_csr_rw_T_5 = io_i_commit_packs_1_uop_alu_sel == 5'h3; // @[csr.scala 57:46]
  wire  _commit1_is_csr_rw_T_6 = _commit1_is_csr_rw_T_4 | _commit1_is_csr_rw_T_5; // @[csr.scala 56:60]
  wire  commit1_is_csr_rw = _commit1_is_csr_rw_T_1 & _commit1_is_csr_rw_T_6; // @[csr.scala 54:59]
  wire [11:0] csr_addr = commit0_is_csr_rw ? io_i_commit_packs_0_uop_inst[31:20] : io_i_commit_packs_1_uop_inst[31:20]; // @[csr.scala 59:20]
  wire  _csr_rdata_T = csr_addr == 12'h300; // @[csr.scala 61:19]
  wire  _csr_rdata_T_1 = csr_addr == 12'h342; // @[csr.scala 62:19]
  wire  _csr_rdata_T_2 = csr_addr == 12'h341; // @[csr.scala 63:19]
  wire  _csr_rdata_T_3 = csr_addr == 12'h305; // @[csr.scala 64:19]
  wire [63:0] _csr_rdata_T_4 = _csr_rdata_T_3 ? mtvec : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _csr_rdata_T_5 = _csr_rdata_T_2 ? mepc : _csr_rdata_T_4; // @[Mux.scala 101:16]
  wire [63:0] _csr_rdata_T_6 = _csr_rdata_T_1 ? mcause : _csr_rdata_T_5; // @[Mux.scala 101:16]
  wire [63:0] csr_rdata = _csr_rdata_T ? mstatus : _csr_rdata_T_6; // @[Mux.scala 101:16]
  wire  _csr_wdata_T_1 = commit0_is_csr_rw & _commit0_is_csr_rw_T_2; // @[csr.scala 67:28]
  wire [63:0] _csr_wdata_T_2 = ~io_i_commit_packs_0_uop_src1_value; // @[csr.scala 67:96]
  wire [63:0] _csr_wdata_T_3 = csr_rdata & _csr_wdata_T_2; // @[csr.scala 67:93]
  wire  _csr_wdata_T_5 = commit0_is_csr_rw & _commit0_is_csr_rw_T_3; // @[csr.scala 68:28]
  wire  _csr_wdata_T_7 = commit0_is_csr_rw & _commit0_is_csr_rw_T_5; // @[csr.scala 69:28]
  wire [63:0] _csr_wdata_T_8 = csr_rdata | io_i_commit_packs_0_uop_src1_value; // @[csr.scala 69:93]
  wire  _csr_wdata_T_10 = commit1_is_csr_rw & _commit1_is_csr_rw_T_2; // @[csr.scala 70:28]
  wire [63:0] _csr_wdata_T_11 = ~io_i_commit_packs_1_uop_src1_value; // @[csr.scala 70:96]
  wire [63:0] _csr_wdata_T_12 = csr_rdata & _csr_wdata_T_11; // @[csr.scala 70:93]
  wire  _csr_wdata_T_14 = commit1_is_csr_rw & _commit1_is_csr_rw_T_3; // @[csr.scala 71:28]
  wire  _csr_wdata_T_16 = commit1_is_csr_rw & _commit1_is_csr_rw_T_5; // @[csr.scala 72:28]
  wire [63:0] _csr_wdata_T_17 = csr_rdata | io_i_commit_packs_1_uop_src1_value; // @[csr.scala 72:93]
  wire [63:0] _csr_wdata_T_18 = _csr_wdata_T_16 ? _csr_wdata_T_17 : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_19 = _csr_wdata_T_14 ? io_i_commit_packs_1_uop_src1_value : _csr_wdata_T_18; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_20 = _csr_wdata_T_10 ? _csr_wdata_T_12 : _csr_wdata_T_19; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_21 = _csr_wdata_T_7 ? _csr_wdata_T_8 : _csr_wdata_T_20; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_22 = _csr_wdata_T_5 ? io_i_commit_packs_0_uop_src1_value : _csr_wdata_T_21; // @[Mux.scala 101:16]
  wire [63:0] csr_wdata = _csr_wdata_T_1 ? _csr_wdata_T_3 : _csr_wdata_T_22; // @[Mux.scala 101:16]
  wire [63:0] _GEN_0 = _csr_rdata_T_3 ? csr_wdata : mtvec; // @[csr.scala 84:39 85:19 29:26]
  wire [63:0] _GEN_1 = _csr_rdata_T_2 ? csr_wdata : mepc; // @[csr.scala 82:39 83:18 28:26]
  wire [63:0] _GEN_2 = _csr_rdata_T_2 ? mtvec : _GEN_0; // @[csr.scala 29:26 82:39]
  wire  _T_13 = _commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h4; // @[csr.scala 88:92]
  wire  _io_o_pc_redirect_valid_T_5 = io_i_interrupt | _T_13; // @[csr.scala 104:64]
  wire  _io_o_pc_redirect_valid_T_9 = _commit1_is_csr_rw_T_1 & io_i_commit_packs_1_uop_alu_sel == 5'h4; // @[csr.scala 105:220]
  wire  _io_o_pc_redirect_valid_T_14 = _commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h6; // @[csr.scala 106:90]
  wire  _io_o_pc_redirect_valid_T_15 = _io_o_pc_redirect_valid_T_5 | _commit1_is_csr_rw_T_1 &
    io_i_commit_packs_1_uop_alu_sel == 5'h4 | _io_o_pc_redirect_valid_T_14; // @[csr.scala 105:270]
  wire  _io_o_pc_redirect_valid_T_24 = _commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h5; // @[csr.scala 107:90]
  wire  _io_o_pc_redirect_valid_T_25 = _io_o_pc_redirect_valid_T_15 | _commit1_is_csr_rw_T_1 &
    io_i_commit_packs_1_uop_alu_sel == 5'h6 | _io_o_pc_redirect_valid_T_24; // @[csr.scala 106:271]
  wire  _io_o_pc_redirect_valid_T_29 = _commit1_is_csr_rw_T_1 & io_i_commit_packs_1_uop_alu_sel == 5'h5; // @[csr.scala 107:220]
  wire  _io_o_pc_redirect_target_T_8 = _T_13 | _io_o_pc_redirect_valid_T_9; // @[csr.scala 111:137]
  wire  _io_o_pc_redirect_target_T_17 = _io_o_pc_redirect_valid_T_24 | _io_o_pc_redirect_valid_T_29; // @[csr.scala 112:136]
  wire [63:0] _io_o_pc_redirect_target_T_18 = _io_o_pc_redirect_target_T_17 ? mepc : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_pc_redirect_target_T_19 = _io_o_pc_redirect_target_T_8 ? mtvec : _io_o_pc_redirect_target_T_18; // @[Mux.scala 101:16]
  assign io_o_pc_redirect_target = io_i_interrupt ? 64'h0 : _io_o_pc_redirect_target_T_19; // @[Mux.scala 101:16]
  assign io_o_pc_redirect_valid = _io_o_pc_redirect_valid_T_25 | _commit1_is_csr_rw_T_1 &
    io_i_commit_packs_1_uop_alu_sel == 5'h5; // @[csr.scala 107:139]
  assign io_o_commit_packs_modified_0_valid = io_i_commit_packs_0_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_valid = io_i_commit_packs_0_uop_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_pc = io_i_commit_packs_0_uop_pc; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_inst = io_i_commit_packs_0_uop_inst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_func_code = io_i_commit_packs_0_uop_func_code; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_valid = io_i_commit_packs_0_uop_branch_predict_pack_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_target =
    io_i_commit_packs_0_uop_branch_predict_pack_target; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type =
    io_i_commit_packs_0_uop_branch_predict_pack_branch_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_select =
    io_i_commit_packs_0_uop_branch_predict_pack_select; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_taken = io_i_commit_packs_0_uop_branch_predict_pack_taken; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_phy_dst = io_i_commit_packs_0_uop_phy_dst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_stale_dst = io_i_commit_packs_0_uop_stale_dst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_arch_dst = io_i_commit_packs_0_uop_arch_dst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_inst_type = io_i_commit_packs_0_uop_inst_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_regWen = io_i_commit_packs_0_uop_regWen; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_src1_valid = io_i_commit_packs_0_uop_src1_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_phy_rs1 = io_i_commit_packs_0_uop_phy_rs1; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_arch_rs1 = io_i_commit_packs_0_uop_arch_rs1; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_src2_valid = io_i_commit_packs_0_uop_src2_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_phy_rs2 = io_i_commit_packs_0_uop_phy_rs2; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_arch_rs2 = io_i_commit_packs_0_uop_arch_rs2; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_rob_idx = io_i_commit_packs_0_uop_rob_idx; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_imm = io_i_commit_packs_0_uop_imm; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_dst_value = commit0_is_csr_rw ? csr_rdata : io_i_commit_packs_0_uop_dst_value; // @[csr.scala 94:28 93:32 95:53]
  assign io_o_commit_packs_modified_0_uop_src1_value = io_i_commit_packs_0_uop_src1_value; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_src2_value = io_i_commit_packs_0_uop_src2_value; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_op1_sel = io_i_commit_packs_0_uop_op1_sel; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_op2_sel = io_i_commit_packs_0_uop_op2_sel; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_alu_sel = io_i_commit_packs_0_uop_alu_sel; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_branch_type = io_i_commit_packs_0_uop_branch_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_0_uop_mem_type = io_i_commit_packs_0_uop_mem_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_valid = io_i_commit_packs_1_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_valid = io_i_commit_packs_1_uop_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_pc = io_i_commit_packs_1_uop_pc; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_inst = io_i_commit_packs_1_uop_inst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_func_code = io_i_commit_packs_1_uop_func_code; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_valid = io_i_commit_packs_1_uop_branch_predict_pack_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_target =
    io_i_commit_packs_1_uop_branch_predict_pack_target; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type =
    io_i_commit_packs_1_uop_branch_predict_pack_branch_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_select =
    io_i_commit_packs_1_uop_branch_predict_pack_select; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_taken = io_i_commit_packs_1_uop_branch_predict_pack_taken; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_phy_dst = io_i_commit_packs_1_uop_phy_dst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_stale_dst = io_i_commit_packs_1_uop_stale_dst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_arch_dst = io_i_commit_packs_1_uop_arch_dst; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_inst_type = io_i_commit_packs_1_uop_inst_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_regWen = io_i_commit_packs_1_uop_regWen; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_src1_valid = io_i_commit_packs_1_uop_src1_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_phy_rs1 = io_i_commit_packs_1_uop_phy_rs1; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_arch_rs1 = io_i_commit_packs_1_uop_arch_rs1; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_src2_valid = io_i_commit_packs_1_uop_src2_valid; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_phy_rs2 = io_i_commit_packs_1_uop_phy_rs2; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_arch_rs2 = io_i_commit_packs_1_uop_arch_rs2; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_rob_idx = io_i_commit_packs_1_uop_rob_idx; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_imm = io_i_commit_packs_1_uop_imm; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_dst_value = commit1_is_csr_rw ? csr_rdata : io_i_commit_packs_1_uop_dst_value; // @[csr.scala 97:28 93:32 98:53]
  assign io_o_commit_packs_modified_1_uop_src1_value = io_i_commit_packs_1_uop_src1_value; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_src2_value = io_i_commit_packs_1_uop_src2_value; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_op1_sel = io_i_commit_packs_1_uop_op1_sel; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_op2_sel = io_i_commit_packs_1_uop_op2_sel; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_alu_sel = io_i_commit_packs_1_uop_alu_sel; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_branch_type = io_i_commit_packs_1_uop_branch_type; // @[csr.scala 93:32]
  assign io_o_commit_packs_modified_1_uop_mem_type = io_i_commit_packs_1_uop_mem_type; // @[csr.scala 93:32]
  assign io_o_mepc = mepc; // @[csr.scala 33:15]
  assign io_o_mtvec = mtvec; // @[csr.scala 34:16]
  assign io_o_mcause = mcause; // @[csr.scala 35:17]
  assign io_o_mstatus = mstatus; // @[csr.scala 36:18]
  always @(posedge clock) begin
    if (reset) begin // @[csr.scala 28:26]
      mepc <= 64'h0; // @[csr.scala 28:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 77:49]
      if (!(_csr_rdata_T)) begin // @[csr.scala 78:33]
        if (!(_csr_rdata_T_1)) begin // @[csr.scala 80:39]
          mepc <= _GEN_1;
        end
      end
    end else if (_commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h4) begin // @[csr.scala 88:142]
      mepc <= {{32'd0}, io_i_commit_packs_0_uop_pc}; // @[csr.scala 90:14]
    end
    if (reset) begin // @[csr.scala 29:26]
      mtvec <= 64'h0; // @[csr.scala 29:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 77:49]
      if (!(_csr_rdata_T)) begin // @[csr.scala 78:33]
        if (!(_csr_rdata_T_1)) begin // @[csr.scala 80:39]
          mtvec <= _GEN_2;
        end
      end
    end
    if (reset) begin // @[csr.scala 30:26]
      mcause <= 64'h0; // @[csr.scala 30:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 77:49]
      if (!(_csr_rdata_T)) begin // @[csr.scala 78:33]
        if (_csr_rdata_T_1) begin // @[csr.scala 80:39]
          mcause <= csr_wdata; // @[csr.scala 81:20]
        end
      end
    end else if (_commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h4) begin // @[csr.scala 88:142]
      mcause <= 64'hb; // @[csr.scala 89:16]
    end
    if (reset) begin // @[csr.scala 31:26]
      mstatus <= 64'ha00001800; // @[csr.scala 31:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 77:49]
      if (_csr_rdata_T) begin // @[csr.scala 78:33]
        if (_csr_wdata_T_1) begin // @[Mux.scala 101:16]
          mstatus <= _csr_wdata_T_3;
        end else begin
          mstatus <= _csr_wdata_T_22;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~(commit0_is_csr_rw & commit1_is_csr_rw))) begin
          $fwrite(32'h80000002,
            "Assertion failed: cmt 0 and 1 are all csr insts\n\n    at csr.scala:75 assert(!(commit0_is_csr_rw && commit1_is_csr_rw),\"cmt 0 and 1 are all csr insts\\n\")\n"
            ); // @[csr.scala 75:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(~(commit0_is_csr_rw & commit1_is_csr_rw))) begin
          $fatal; // @[csr.scala 75:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mepc = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mtvec = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mcause = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mstatus = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
