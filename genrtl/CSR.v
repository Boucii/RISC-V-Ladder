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
  input  [6:0]  io_i_commit_packs_0_uop_rob_idx,
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
  input  [6:0]  io_i_commit_packs_1_uop_rob_idx,
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
  output [6:0]  io_o_commit_packs_modified_0_uop_rob_idx,
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
  output [6:0]  io_o_commit_packs_modified_1_uop_rob_idx,
  output [63:0] io_o_commit_packs_modified_1_uop_imm,
  output [63:0] io_o_commit_packs_modified_1_uop_dst_value,
  output [63:0] io_o_commit_packs_modified_1_uop_src1_value,
  output [63:0] io_o_commit_packs_modified_1_uop_src2_value,
  output [2:0]  io_o_commit_packs_modified_1_uop_op1_sel,
  output [2:0]  io_o_commit_packs_modified_1_uop_op2_sel,
  output [4:0]  io_o_commit_packs_modified_1_uop_alu_sel,
  output [3:0]  io_o_commit_packs_modified_1_uop_branch_type,
  output [1:0]  io_o_commit_packs_modified_1_uop_mem_type
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mepc; // @[csr.scala 22:26]
  reg [63:0] mtvec; // @[csr.scala 23:26]
  reg [63:0] mcause; // @[csr.scala 24:26]
  reg [63:0] mstatus; // @[csr.scala 25:26]
  wire  _commit0_is_csr_rw_T = io_i_commit_packs_0_uop_func_code == 7'h20; // @[csr.scala 37:48]
  wire  _commit0_is_csr_rw_T_1 = io_i_commit_packs_0_valid & _commit0_is_csr_rw_T; // @[csr.scala 36:53]
  wire  _commit0_is_csr_rw_T_2 = io_i_commit_packs_0_uop_alu_sel == 5'h1; // @[csr.scala 38:46]
  wire  _commit0_is_csr_rw_T_3 = io_i_commit_packs_0_uop_alu_sel == 5'h2; // @[csr.scala 39:46]
  wire  _commit0_is_csr_rw_T_4 = io_i_commit_packs_0_uop_alu_sel == 5'h1 | _commit0_is_csr_rw_T_3; // @[csr.scala 38:60]
  wire  _commit0_is_csr_rw_T_5 = io_i_commit_packs_0_uop_alu_sel == 5'h3; // @[csr.scala 40:46]
  wire  _commit0_is_csr_rw_T_6 = _commit0_is_csr_rw_T_4 | _commit0_is_csr_rw_T_5; // @[csr.scala 39:60]
  wire  commit0_is_csr_rw = _commit0_is_csr_rw_T_1 & _commit0_is_csr_rw_T_6; // @[csr.scala 37:59]
  wire  _commit1_is_csr_rw_T = io_i_commit_packs_1_uop_func_code == 7'h20; // @[csr.scala 43:48]
  wire  _commit1_is_csr_rw_T_1 = io_i_commit_packs_1_valid & _commit1_is_csr_rw_T; // @[csr.scala 42:53]
  wire  _commit1_is_csr_rw_T_2 = io_i_commit_packs_1_uop_alu_sel == 5'h1; // @[csr.scala 44:46]
  wire  _commit1_is_csr_rw_T_3 = io_i_commit_packs_1_uop_alu_sel == 5'h2; // @[csr.scala 45:46]
  wire  _commit1_is_csr_rw_T_4 = io_i_commit_packs_1_uop_alu_sel == 5'h1 | _commit1_is_csr_rw_T_3; // @[csr.scala 44:60]
  wire  _commit1_is_csr_rw_T_5 = io_i_commit_packs_1_uop_alu_sel == 5'h3; // @[csr.scala 46:46]
  wire  _commit1_is_csr_rw_T_6 = _commit1_is_csr_rw_T_4 | _commit1_is_csr_rw_T_5; // @[csr.scala 45:60]
  wire  commit1_is_csr_rw = _commit1_is_csr_rw_T_1 & _commit1_is_csr_rw_T_6; // @[csr.scala 43:59]
  wire [11:0] csr_addr = commit0_is_csr_rw ? io_i_commit_packs_0_uop_inst[31:20] : io_i_commit_packs_1_uop_inst[31:20]; // @[csr.scala 48:20]
  wire  _csr_rdata_T = csr_addr == 12'h300; // @[csr.scala 50:19]
  wire  _csr_rdata_T_1 = csr_addr == 12'h342; // @[csr.scala 51:19]
  wire  _csr_rdata_T_2 = csr_addr == 12'h341; // @[csr.scala 52:19]
  wire  _csr_rdata_T_3 = csr_addr == 12'h305; // @[csr.scala 53:19]
  wire [63:0] _csr_rdata_T_4 = _csr_rdata_T_3 ? mtvec : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _csr_rdata_T_5 = _csr_rdata_T_2 ? mepc : _csr_rdata_T_4; // @[Mux.scala 101:16]
  wire [63:0] _csr_rdata_T_6 = _csr_rdata_T_1 ? mcause : _csr_rdata_T_5; // @[Mux.scala 101:16]
  wire [63:0] csr_rdata = _csr_rdata_T ? mstatus : _csr_rdata_T_6; // @[Mux.scala 101:16]
  wire  _csr_wdata_T_1 = commit0_is_csr_rw & _commit0_is_csr_rw_T_2; // @[csr.scala 56:28]
  wire [63:0] _csr_wdata_T_2 = ~io_i_commit_packs_0_uop_src1_value; // @[csr.scala 56:96]
  wire [63:0] _csr_wdata_T_3 = csr_rdata & _csr_wdata_T_2; // @[csr.scala 56:93]
  wire  _csr_wdata_T_5 = commit0_is_csr_rw & _commit0_is_csr_rw_T_3; // @[csr.scala 57:28]
  wire  _csr_wdata_T_7 = commit0_is_csr_rw & _commit0_is_csr_rw_T_5; // @[csr.scala 58:28]
  wire [63:0] _csr_wdata_T_8 = csr_rdata | io_i_commit_packs_0_uop_src1_value; // @[csr.scala 58:93]
  wire  _csr_wdata_T_10 = commit1_is_csr_rw & _commit1_is_csr_rw_T_2; // @[csr.scala 59:28]
  wire [63:0] _csr_wdata_T_11 = ~io_i_commit_packs_1_uop_src1_value; // @[csr.scala 59:96]
  wire [63:0] _csr_wdata_T_12 = csr_rdata & _csr_wdata_T_11; // @[csr.scala 59:93]
  wire  _csr_wdata_T_14 = commit1_is_csr_rw & _commit1_is_csr_rw_T_3; // @[csr.scala 60:28]
  wire  _csr_wdata_T_16 = commit1_is_csr_rw & _commit1_is_csr_rw_T_5; // @[csr.scala 61:28]
  wire [63:0] _csr_wdata_T_17 = csr_rdata | io_i_commit_packs_1_uop_src1_value; // @[csr.scala 61:93]
  wire [63:0] _csr_wdata_T_18 = _csr_wdata_T_16 ? _csr_wdata_T_17 : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_19 = _csr_wdata_T_14 ? io_i_commit_packs_1_uop_src1_value : _csr_wdata_T_18; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_20 = _csr_wdata_T_10 ? _csr_wdata_T_12 : _csr_wdata_T_19; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_21 = _csr_wdata_T_7 ? _csr_wdata_T_8 : _csr_wdata_T_20; // @[Mux.scala 101:16]
  wire [63:0] _csr_wdata_T_22 = _csr_wdata_T_5 ? io_i_commit_packs_0_uop_src1_value : _csr_wdata_T_21; // @[Mux.scala 101:16]
  wire [63:0] csr_wdata = _csr_wdata_T_1 ? _csr_wdata_T_3 : _csr_wdata_T_22; // @[Mux.scala 101:16]
  wire [63:0] _GEN_0 = _csr_rdata_T_3 ? csr_wdata : mtvec; // @[csr.scala 73:39 74:19 23:26]
  wire [63:0] _GEN_1 = _csr_rdata_T_2 ? csr_wdata : mepc; // @[csr.scala 71:39 72:18 22:26]
  wire [63:0] _GEN_2 = _csr_rdata_T_2 ? mtvec : _GEN_0; // @[csr.scala 23:26 71:39]
  wire  _T_10 = io_i_commit_packs_0_uop_alu_sel == 5'h4; // @[csr.scala 76:70]
  wire  _io_o_pc_redirect_valid_T_4 = _commit0_is_csr_rw_T_1 & _T_10; // @[csr.scala 93:90]
  wire  _io_o_pc_redirect_valid_T_5 = io_i_interrupt | _io_o_pc_redirect_valid_T_4; // @[csr.scala 92:64]
  wire  _io_o_pc_redirect_valid_T_9 = _commit1_is_csr_rw_T_1 & io_i_commit_packs_1_uop_alu_sel == 5'h4; // @[csr.scala 93:220]
  wire  _io_o_pc_redirect_valid_T_14 = _commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h6; // @[csr.scala 94:90]
  wire  _io_o_pc_redirect_valid_T_15 = _io_o_pc_redirect_valid_T_5 | _commit1_is_csr_rw_T_1 &
    io_i_commit_packs_1_uop_alu_sel == 5'h4 | _io_o_pc_redirect_valid_T_14; // @[csr.scala 93:270]
  wire  _io_o_pc_redirect_valid_T_24 = _commit0_is_csr_rw_T_1 & io_i_commit_packs_0_uop_alu_sel == 5'h5; // @[csr.scala 95:90]
  wire  _io_o_pc_redirect_valid_T_25 = _io_o_pc_redirect_valid_T_15 | _commit1_is_csr_rw_T_1 &
    io_i_commit_packs_1_uop_alu_sel == 5'h6 | _io_o_pc_redirect_valid_T_24; // @[csr.scala 94:271]
  wire  _io_o_pc_redirect_valid_T_29 = _commit1_is_csr_rw_T_1 & io_i_commit_packs_1_uop_alu_sel == 5'h5; // @[csr.scala 95:220]
  wire  _io_o_pc_redirect_target_T_8 = _io_o_pc_redirect_valid_T_4 | _io_o_pc_redirect_valid_T_9; // @[csr.scala 99:137]
  wire  _io_o_pc_redirect_target_T_17 = _io_o_pc_redirect_valid_T_24 | _io_o_pc_redirect_valid_T_29; // @[csr.scala 100:136]
  wire [63:0] _io_o_pc_redirect_target_T_18 = _io_o_pc_redirect_target_T_17 ? mepc : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_pc_redirect_target_T_19 = _io_o_pc_redirect_target_T_8 ? mtvec : _io_o_pc_redirect_target_T_18; // @[Mux.scala 101:16]
  assign io_o_pc_redirect_target = io_i_interrupt ? 64'h0 : _io_o_pc_redirect_target_T_19; // @[Mux.scala 101:16]
  assign io_o_pc_redirect_valid = _io_o_pc_redirect_valid_T_25 | _commit1_is_csr_rw_T_1 &
    io_i_commit_packs_1_uop_alu_sel == 5'h5; // @[csr.scala 95:139]
  assign io_o_commit_packs_modified_0_valid = io_i_commit_packs_0_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_valid = io_i_commit_packs_0_uop_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_pc = io_i_commit_packs_0_uop_pc; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_inst = io_i_commit_packs_0_uop_inst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_func_code = io_i_commit_packs_0_uop_func_code; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_valid = io_i_commit_packs_0_uop_branch_predict_pack_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_target =
    io_i_commit_packs_0_uop_branch_predict_pack_target; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type =
    io_i_commit_packs_0_uop_branch_predict_pack_branch_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_select =
    io_i_commit_packs_0_uop_branch_predict_pack_select; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_branch_predict_pack_taken = io_i_commit_packs_0_uop_branch_predict_pack_taken; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_phy_dst = io_i_commit_packs_0_uop_phy_dst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_stale_dst = io_i_commit_packs_0_uop_stale_dst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_arch_dst = io_i_commit_packs_0_uop_arch_dst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_inst_type = io_i_commit_packs_0_uop_inst_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_regWen = io_i_commit_packs_0_uop_regWen; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_src1_valid = io_i_commit_packs_0_uop_src1_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_phy_rs1 = io_i_commit_packs_0_uop_phy_rs1; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_arch_rs1 = io_i_commit_packs_0_uop_arch_rs1; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_src2_valid = io_i_commit_packs_0_uop_src2_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_phy_rs2 = io_i_commit_packs_0_uop_phy_rs2; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_arch_rs2 = io_i_commit_packs_0_uop_arch_rs2; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_rob_idx = io_i_commit_packs_0_uop_rob_idx; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_imm = io_i_commit_packs_0_uop_imm; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_dst_value = commit0_is_csr_rw ? csr_rdata : io_i_commit_packs_0_uop_dst_value; // @[csr.scala 82:28 81:32 83:53]
  assign io_o_commit_packs_modified_0_uop_src1_value = io_i_commit_packs_0_uop_src1_value; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_src2_value = io_i_commit_packs_0_uop_src2_value; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_op1_sel = io_i_commit_packs_0_uop_op1_sel; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_op2_sel = io_i_commit_packs_0_uop_op2_sel; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_alu_sel = io_i_commit_packs_0_uop_alu_sel; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_branch_type = io_i_commit_packs_0_uop_branch_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_0_uop_mem_type = io_i_commit_packs_0_uop_mem_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_valid = io_i_commit_packs_1_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_valid = io_i_commit_packs_1_uop_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_pc = io_i_commit_packs_1_uop_pc; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_inst = io_i_commit_packs_1_uop_inst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_func_code = io_i_commit_packs_1_uop_func_code; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_valid = io_i_commit_packs_1_uop_branch_predict_pack_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_target =
    io_i_commit_packs_1_uop_branch_predict_pack_target; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type =
    io_i_commit_packs_1_uop_branch_predict_pack_branch_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_select =
    io_i_commit_packs_1_uop_branch_predict_pack_select; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_branch_predict_pack_taken = io_i_commit_packs_1_uop_branch_predict_pack_taken; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_phy_dst = io_i_commit_packs_1_uop_phy_dst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_stale_dst = io_i_commit_packs_1_uop_stale_dst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_arch_dst = io_i_commit_packs_1_uop_arch_dst; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_inst_type = io_i_commit_packs_1_uop_inst_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_regWen = io_i_commit_packs_1_uop_regWen; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_src1_valid = io_i_commit_packs_1_uop_src1_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_phy_rs1 = io_i_commit_packs_1_uop_phy_rs1; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_arch_rs1 = io_i_commit_packs_1_uop_arch_rs1; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_src2_valid = io_i_commit_packs_1_uop_src2_valid; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_phy_rs2 = io_i_commit_packs_1_uop_phy_rs2; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_arch_rs2 = io_i_commit_packs_1_uop_arch_rs2; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_rob_idx = io_i_commit_packs_1_uop_rob_idx; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_imm = io_i_commit_packs_1_uop_imm; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_dst_value = commit1_is_csr_rw ? csr_rdata : io_i_commit_packs_1_uop_dst_value; // @[csr.scala 85:28 81:32 86:53]
  assign io_o_commit_packs_modified_1_uop_src1_value = io_i_commit_packs_1_uop_src1_value; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_src2_value = io_i_commit_packs_1_uop_src2_value; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_op1_sel = io_i_commit_packs_1_uop_op1_sel; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_op2_sel = io_i_commit_packs_1_uop_op2_sel; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_alu_sel = io_i_commit_packs_1_uop_alu_sel; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_branch_type = io_i_commit_packs_1_uop_branch_type; // @[csr.scala 81:32]
  assign io_o_commit_packs_modified_1_uop_mem_type = io_i_commit_packs_1_uop_mem_type; // @[csr.scala 81:32]
  always @(posedge clock) begin
    if (reset) begin // @[csr.scala 22:26]
      mepc <= 64'h0; // @[csr.scala 22:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 66:49]
      if (!(_csr_rdata_T)) begin // @[csr.scala 67:33]
        if (!(_csr_rdata_T_1)) begin // @[csr.scala 69:39]
          mepc <= _GEN_1;
        end
      end
    end else if (commit0_is_csr_rw & io_i_commit_packs_0_uop_alu_sel == 5'h4) begin // @[csr.scala 76:84]
      mepc <= {{32'd0}, io_i_commit_packs_0_uop_pc}; // @[csr.scala 78:14]
    end
    if (reset) begin // @[csr.scala 23:26]
      mtvec <= 64'h0; // @[csr.scala 23:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 66:49]
      if (!(_csr_rdata_T)) begin // @[csr.scala 67:33]
        if (!(_csr_rdata_T_1)) begin // @[csr.scala 69:39]
          mtvec <= _GEN_2;
        end
      end
    end
    if (reset) begin // @[csr.scala 24:26]
      mcause <= 64'h0; // @[csr.scala 24:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 66:49]
      if (!(_csr_rdata_T)) begin // @[csr.scala 67:33]
        if (_csr_rdata_T_1) begin // @[csr.scala 69:39]
          mcause <= csr_wdata; // @[csr.scala 70:20]
        end
      end
    end else if (commit0_is_csr_rw & io_i_commit_packs_0_uop_alu_sel == 5'h4) begin // @[csr.scala 76:84]
      mcause <= 64'hb; // @[csr.scala 77:16]
    end
    if (reset) begin // @[csr.scala 25:26]
      mstatus <= 64'ha00001800; // @[csr.scala 25:26]
    end else if (commit0_is_csr_rw | commit1_is_csr_rw) begin // @[csr.scala 66:49]
      if (_csr_rdata_T) begin // @[csr.scala 67:33]
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
            "Assertion failed: cmt 0 and 1 are all csr insts\n\n    at csr.scala:64 assert(!(commit0_is_csr_rw && commit1_is_csr_rw),\"cmt 0 and 1 are all csr insts\\n\")\n"
            ); // @[csr.scala 64:11]
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
          $fatal; // @[csr.scala 64:11]
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
