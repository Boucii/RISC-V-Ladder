module Back_End_With_Decode(
  input         clock,
  input         reset,
  output        io_i_fetch_pack_ready,
  input         io_i_fetch_pack_valid,
  input         io_i_fetch_pack_bits_valids_0,
  input         io_i_fetch_pack_bits_valids_1,
  input  [63:0] io_i_fetch_pack_bits_pc,
  input  [31:0] io_i_fetch_pack_bits_insts_0,
  input  [31:0] io_i_fetch_pack_bits_insts_1,
  input         io_i_fetch_pack_bits_branch_predict_pack_valid,
  input  [63:0] io_i_fetch_pack_bits_branch_predict_pack_target,
  input  [3:0]  io_i_fetch_pack_bits_branch_predict_pack_branch_type,
  input         io_i_fetch_pack_bits_branch_predict_pack_select,
  input         io_i_fetch_pack_bits_branch_predict_pack_taken,
  output        io_o_branch_resolve_pack_valid,
  output        io_o_branch_resolve_pack_mispred,
  output        io_o_branch_resolve_pack_taken,
  output [63:0] io_o_branch_resolve_pack_pc,
  output [63:0] io_o_branch_resolve_pack_target,
  output [6:0]  io_o_branch_resolve_pack_rob_idx,
  output        io_o_branch_resolve_pack_prediction_valid,
  output [2:0]  io_o_branch_resolve_pack_branch_type,
  output        io_o_stall,
  output        io_o_pc_redirect_valid,
  output [63:0] io_o_pc_redirect_target,
  input         io_dcache_io_data_valid,
  output        io_dcache_io_addr_valid,
  input         io_dcache_io_addr_ready,
  output        io_dcache_io_Mwout,
  output [63:0] io_dcache_io_Maddr,
  output        io_dcache_io_Men,
  output [31:0] io_dcache_io_Mlen,
  input  [63:0] io_dcache_io_MdataIn,
  output [63:0] io_dcache_io_MdataOut,
  input         io_i_interrupt,
  output        io_o_dbg_commit_packs_0_valid,
  output        io_o_dbg_commit_packs_0_uop_valid,
  output [31:0] io_o_dbg_commit_packs_0_uop_pc,
  output [31:0] io_o_dbg_commit_packs_0_uop_inst,
  output [6:0]  io_o_dbg_commit_packs_0_uop_func_code,
  output        io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid,
  output [63:0] io_o_dbg_commit_packs_0_uop_branch_predict_pack_target,
  output [3:0]  io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type,
  output        io_o_dbg_commit_packs_0_uop_branch_predict_pack_select,
  output        io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken,
  output [6:0]  io_o_dbg_commit_packs_0_uop_phy_dst,
  output [6:0]  io_o_dbg_commit_packs_0_uop_stale_dst,
  output [4:0]  io_o_dbg_commit_packs_0_uop_arch_dst,
  output [2:0]  io_o_dbg_commit_packs_0_uop_inst_type,
  output        io_o_dbg_commit_packs_0_uop_regWen,
  output        io_o_dbg_commit_packs_0_uop_src1_valid,
  output [6:0]  io_o_dbg_commit_packs_0_uop_phy_rs1,
  output [4:0]  io_o_dbg_commit_packs_0_uop_arch_rs1,
  output        io_o_dbg_commit_packs_0_uop_src2_valid,
  output [6:0]  io_o_dbg_commit_packs_0_uop_phy_rs2,
  output [4:0]  io_o_dbg_commit_packs_0_uop_arch_rs2,
  output [6:0]  io_o_dbg_commit_packs_0_uop_rob_idx,
  output [63:0] io_o_dbg_commit_packs_0_uop_imm,
  output [63:0] io_o_dbg_commit_packs_0_uop_dst_value,
  output [63:0] io_o_dbg_commit_packs_0_uop_src1_value,
  output [63:0] io_o_dbg_commit_packs_0_uop_src2_value,
  output [2:0]  io_o_dbg_commit_packs_0_uop_op1_sel,
  output [2:0]  io_o_dbg_commit_packs_0_uop_op2_sel,
  output [4:0]  io_o_dbg_commit_packs_0_uop_alu_sel,
  output [3:0]  io_o_dbg_commit_packs_0_uop_branch_type,
  output [1:0]  io_o_dbg_commit_packs_0_uop_mem_type,
  output        io_o_dbg_commit_packs_1_valid,
  output        io_o_dbg_commit_packs_1_uop_valid,
  output [31:0] io_o_dbg_commit_packs_1_uop_pc,
  output [31:0] io_o_dbg_commit_packs_1_uop_inst,
  output [6:0]  io_o_dbg_commit_packs_1_uop_func_code,
  output        io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid,
  output [63:0] io_o_dbg_commit_packs_1_uop_branch_predict_pack_target,
  output [3:0]  io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type,
  output        io_o_dbg_commit_packs_1_uop_branch_predict_pack_select,
  output        io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken,
  output [6:0]  io_o_dbg_commit_packs_1_uop_phy_dst,
  output [6:0]  io_o_dbg_commit_packs_1_uop_stale_dst,
  output [4:0]  io_o_dbg_commit_packs_1_uop_arch_dst,
  output [2:0]  io_o_dbg_commit_packs_1_uop_inst_type,
  output        io_o_dbg_commit_packs_1_uop_regWen,
  output        io_o_dbg_commit_packs_1_uop_src1_valid,
  output [6:0]  io_o_dbg_commit_packs_1_uop_phy_rs1,
  output [4:0]  io_o_dbg_commit_packs_1_uop_arch_rs1,
  output        io_o_dbg_commit_packs_1_uop_src2_valid,
  output [6:0]  io_o_dbg_commit_packs_1_uop_phy_rs2,
  output [4:0]  io_o_dbg_commit_packs_1_uop_arch_rs2,
  output [6:0]  io_o_dbg_commit_packs_1_uop_rob_idx,
  output [63:0] io_o_dbg_commit_packs_1_uop_imm,
  output [63:0] io_o_dbg_commit_packs_1_uop_dst_value,
  output [63:0] io_o_dbg_commit_packs_1_uop_src1_value,
  output [63:0] io_o_dbg_commit_packs_1_uop_src2_value,
  output [2:0]  io_o_dbg_commit_packs_1_uop_op1_sel,
  output [2:0]  io_o_dbg_commit_packs_1_uop_op2_sel,
  output [4:0]  io_o_dbg_commit_packs_1_uop_alu_sel,
  output [3:0]  io_o_dbg_commit_packs_1_uop_branch_type,
  output [1:0]  io_o_dbg_commit_packs_1_uop_mem_type,
  output        io_o_dbg_stop,
  output [63:0] io_o_dbg_arch_regs_0,
  output [63:0] io_o_dbg_arch_regs_1,
  output [63:0] io_o_dbg_arch_regs_2,
  output [63:0] io_o_dbg_arch_regs_3,
  output [63:0] io_o_dbg_arch_regs_4,
  output [63:0] io_o_dbg_arch_regs_5,
  output [63:0] io_o_dbg_arch_regs_6,
  output [63:0] io_o_dbg_arch_regs_7,
  output [63:0] io_o_dbg_arch_regs_8,
  output [63:0] io_o_dbg_arch_regs_9,
  output [63:0] io_o_dbg_arch_regs_10,
  output [63:0] io_o_dbg_arch_regs_11,
  output [63:0] io_o_dbg_arch_regs_12,
  output [63:0] io_o_dbg_arch_regs_13,
  output [63:0] io_o_dbg_arch_regs_14,
  output [63:0] io_o_dbg_arch_regs_15,
  output [63:0] io_o_dbg_arch_regs_16,
  output [63:0] io_o_dbg_arch_regs_17,
  output [63:0] io_o_dbg_arch_regs_18,
  output [63:0] io_o_dbg_arch_regs_19,
  output [63:0] io_o_dbg_arch_regs_20,
  output [63:0] io_o_dbg_arch_regs_21,
  output [63:0] io_o_dbg_arch_regs_22,
  output [63:0] io_o_dbg_arch_regs_23,
  output [63:0] io_o_dbg_arch_regs_24,
  output [63:0] io_o_dbg_arch_regs_25,
  output [63:0] io_o_dbg_arch_regs_26,
  output [63:0] io_o_dbg_arch_regs_27,
  output [63:0] io_o_dbg_arch_regs_28,
  output [63:0] io_o_dbg_arch_regs_29,
  output [63:0] io_o_dbg_arch_regs_30,
  output [63:0] io_o_dbg_arch_regs_31
);
  wire  decode_clock; // @[backend_with_decode.scala 39:24]
  wire  decode_reset; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_ready; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_valid; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_bits_valids_0; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_bits_valids_1; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_i_fetch_pack_bits_pc; // @[backend_with_decode.scala 39:24]
  wire [31:0] decode_io_i_fetch_pack_bits_insts_0; // @[backend_with_decode.scala 39:24]
  wire [31:0] decode_io_i_fetch_pack_bits_insts_1; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_bits_branch_predict_pack_valid; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_i_fetch_pack_bits_branch_predict_pack_target; // @[backend_with_decode.scala 39:24]
  wire [3:0] decode_io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_bits_branch_predict_pack_select; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_fetch_pack_bits_branch_predict_pack_taken; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_valid; // @[backend_with_decode.scala 39:24]
  wire [31:0] decode_io_o_decode_packs_0_pc; // @[backend_with_decode.scala 39:24]
  wire [31:0] decode_io_o_decode_packs_0_inst; // @[backend_with_decode.scala 39:24]
  wire [6:0] decode_io_o_decode_packs_0_func_code; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 39:24]
  wire [3:0] decode_io_o_decode_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_0_arch_dst; // @[backend_with_decode.scala 39:24]
  wire [2:0] decode_io_o_decode_packs_0_inst_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_regWen; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_src1_valid; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_0_arch_rs1; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_0_src2_valid; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_0_arch_rs2; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_0_imm; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_0_src1_value; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_0_src2_value; // @[backend_with_decode.scala 39:24]
  wire [2:0] decode_io_o_decode_packs_0_op1_sel; // @[backend_with_decode.scala 39:24]
  wire [2:0] decode_io_o_decode_packs_0_op2_sel; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_0_alu_sel; // @[backend_with_decode.scala 39:24]
  wire [3:0] decode_io_o_decode_packs_0_branch_type; // @[backend_with_decode.scala 39:24]
  wire [1:0] decode_io_o_decode_packs_0_mem_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_valid; // @[backend_with_decode.scala 39:24]
  wire [31:0] decode_io_o_decode_packs_1_pc; // @[backend_with_decode.scala 39:24]
  wire [31:0] decode_io_o_decode_packs_1_inst; // @[backend_with_decode.scala 39:24]
  wire [6:0] decode_io_o_decode_packs_1_func_code; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 39:24]
  wire [3:0] decode_io_o_decode_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_1_arch_dst; // @[backend_with_decode.scala 39:24]
  wire [2:0] decode_io_o_decode_packs_1_inst_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_regWen; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_src1_valid; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_1_arch_rs1; // @[backend_with_decode.scala 39:24]
  wire  decode_io_o_decode_packs_1_src2_valid; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_1_arch_rs2; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_1_imm; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_1_src1_value; // @[backend_with_decode.scala 39:24]
  wire [63:0] decode_io_o_decode_packs_1_src2_value; // @[backend_with_decode.scala 39:24]
  wire [2:0] decode_io_o_decode_packs_1_op1_sel; // @[backend_with_decode.scala 39:24]
  wire [2:0] decode_io_o_decode_packs_1_op2_sel; // @[backend_with_decode.scala 39:24]
  wire [4:0] decode_io_o_decode_packs_1_alu_sel; // @[backend_with_decode.scala 39:24]
  wire [3:0] decode_io_o_decode_packs_1_branch_type; // @[backend_with_decode.scala 39:24]
  wire [1:0] decode_io_o_decode_packs_1_mem_type; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_exception; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_branch_resolve_pack_valid; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_branch_resolve_pack_mispred; // @[backend_with_decode.scala 39:24]
  wire  decode_io_i_stall; // @[backend_with_decode.scala 39:24]
  wire  rename_clock; // @[backend_with_decode.scala 40:25]
  wire  rename_reset; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_valid; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_i_decode_packs_0_pc; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_i_decode_packs_0_inst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_decode_packs_0_func_code; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_i_decode_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_0_arch_dst; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_i_decode_packs_0_inst_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_regWen; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_src1_valid; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_0_arch_rs1; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_0_src2_valid; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_0_arch_rs2; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_0_imm; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_0_src1_value; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_0_src2_value; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_i_decode_packs_0_op1_sel; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_i_decode_packs_0_op2_sel; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_0_alu_sel; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_i_decode_packs_0_branch_type; // @[backend_with_decode.scala 40:25]
  wire [1:0] rename_io_i_decode_packs_0_mem_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_valid; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_i_decode_packs_1_pc; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_i_decode_packs_1_inst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_decode_packs_1_func_code; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_i_decode_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_1_arch_dst; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_i_decode_packs_1_inst_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_regWen; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_src1_valid; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_1_arch_rs1; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_decode_packs_1_src2_valid; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_1_arch_rs2; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_1_imm; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_1_src1_value; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_i_decode_packs_1_src2_value; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_i_decode_packs_1_op1_sel; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_i_decode_packs_1_op2_sel; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_decode_packs_1_alu_sel; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_i_decode_packs_1_branch_type; // @[backend_with_decode.scala 40:25]
  wire [1:0] rename_io_i_decode_packs_1_mem_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_commit_packs_0_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_commit_packs_0_uop_phy_dst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_commit_packs_0_uop_stale_dst; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_commit_packs_0_uop_arch_dst; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_commit_packs_1_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_commit_packs_1_uop_phy_dst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_commit_packs_1_uop_stale_dst; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_commit_packs_1_uop_arch_dst; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_rollback_packs_0_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_rollback_packs_0_uop_phy_dst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_rollback_packs_0_uop_stale_dst; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_rollback_packs_0_uop_arch_dst; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_rollback_packs_1_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_rollback_packs_1_uop_phy_dst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_i_rollback_packs_1_uop_stale_dst; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_i_rollback_packs_1_uop_arch_dst; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_flush_for_branch; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_free_list_empty; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_valid; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_o_rename_packs_0_pc; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_o_rename_packs_0_inst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_0_func_code; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_o_rename_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_0_phy_dst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_0_stale_dst; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_0_arch_dst; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_o_rename_packs_0_inst_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_regWen; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_src1_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_0_phy_rs1; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_0_arch_rs1; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_0_src2_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_0_phy_rs2; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_0_arch_rs2; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_0_imm; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_0_src1_value; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_0_src2_value; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_o_rename_packs_0_op1_sel; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_o_rename_packs_0_op2_sel; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_0_alu_sel; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_o_rename_packs_0_branch_type; // @[backend_with_decode.scala 40:25]
  wire [1:0] rename_io_o_rename_packs_0_mem_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_valid; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_o_rename_packs_1_pc; // @[backend_with_decode.scala 40:25]
  wire [31:0] rename_io_o_rename_packs_1_inst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_1_func_code; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_o_rename_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_1_phy_dst; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_1_stale_dst; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_1_arch_dst; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_o_rename_packs_1_inst_type; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_regWen; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_src1_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_1_phy_rs1; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_1_arch_rs1; // @[backend_with_decode.scala 40:25]
  wire  rename_io_o_rename_packs_1_src2_valid; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_rename_packs_1_phy_rs2; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_1_arch_rs2; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_1_imm; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_1_src1_value; // @[backend_with_decode.scala 40:25]
  wire [63:0] rename_io_o_rename_packs_1_src2_value; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_o_rename_packs_1_op1_sel; // @[backend_with_decode.scala 40:25]
  wire [2:0] rename_io_o_rename_packs_1_op2_sel; // @[backend_with_decode.scala 40:25]
  wire [4:0] rename_io_o_rename_packs_1_alu_sel; // @[backend_with_decode.scala 40:25]
  wire [3:0] rename_io_o_rename_packs_1_branch_type; // @[backend_with_decode.scala 40:25]
  wire [1:0] rename_io_o_rename_packs_1_mem_type; // @[backend_with_decode.scala 40:25]
  wire [127:0] rename_io_o_written_back_table; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_exception; // @[backend_with_decode.scala 40:25]
  wire  rename_io_i_stall; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_0; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_1; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_2; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_3; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_4; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_5; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_6; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_7; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_8; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_9; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_10; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_11; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_12; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_13; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_14; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_15; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_16; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_17; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_18; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_19; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_20; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_21; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_22; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_23; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_24; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_25; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_26; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_27; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_28; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_29; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_30; // @[backend_with_decode.scala 40:25]
  wire [6:0] rename_io_o_commit_rename_table_31; // @[backend_with_decode.scala 40:25]
  wire  dispatch_clock; // @[backend_with_decode.scala 41:26]
  wire  dispatch_reset; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_valid; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_i_rename_packs_0_pc; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_i_rename_packs_0_inst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_0_func_code; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_i_rename_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_0_phy_dst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_0_stale_dst; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_0_arch_dst; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_i_rename_packs_0_inst_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_regWen; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_src1_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_0_phy_rs1; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_0_arch_rs1; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_0_src2_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_0_phy_rs2; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_0_arch_rs2; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_0_imm; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_0_src1_value; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_0_src2_value; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_i_rename_packs_0_op1_sel; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_i_rename_packs_0_op2_sel; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_0_alu_sel; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_i_rename_packs_0_branch_type; // @[backend_with_decode.scala 41:26]
  wire [1:0] dispatch_io_i_rename_packs_0_mem_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_valid; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_i_rename_packs_1_pc; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_i_rename_packs_1_inst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_1_func_code; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_i_rename_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_1_phy_dst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_1_stale_dst; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_1_arch_dst; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_i_rename_packs_1_inst_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_regWen; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_src1_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_1_phy_rs1; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_1_arch_rs1; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rename_packs_1_src2_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rename_packs_1_phy_rs2; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_1_arch_rs2; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_1_imm; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_1_src1_value; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_i_rename_packs_1_src2_value; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_i_rename_packs_1_op1_sel; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_i_rename_packs_1_op2_sel; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_i_rename_packs_1_alu_sel; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_i_rename_packs_1_branch_type; // @[backend_with_decode.scala 41:26]
  wire [1:0] dispatch_io_i_rename_packs_1_mem_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_rob_busy; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rob_allocation_ress_0_rob_idx; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_i_rob_allocation_ress_1_rob_idx; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_reservation_station_full; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_branch_resolve_pack_valid; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_branch_resolve_pack_mispred; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_valid; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_valid; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_rob_allocation_reqs_0_uop_pc; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_rob_allocation_reqs_0_uop_inst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_0_uop_func_code; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_0_uop_phy_dst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_0_uop_stale_dst; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_0_uop_arch_dst; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_rob_allocation_reqs_0_uop_inst_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_regWen; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_src1_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_0_uop_phy_rs1; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_0_uop_arch_rs1; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_0_uop_src2_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_0_uop_phy_rs2; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_0_uop_arch_rs2; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_0_uop_imm; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_0_uop_src1_value; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_0_uop_src2_value; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_rob_allocation_reqs_0_uop_op1_sel; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_rob_allocation_reqs_0_uop_op2_sel; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_0_uop_alu_sel; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_rob_allocation_reqs_0_uop_branch_type; // @[backend_with_decode.scala 41:26]
  wire [1:0] dispatch_io_o_rob_allocation_reqs_0_uop_mem_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_valid; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_valid; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_rob_allocation_reqs_1_uop_pc; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_rob_allocation_reqs_1_uop_inst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_1_uop_func_code; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_1_uop_phy_dst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_1_uop_stale_dst; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_1_uop_arch_dst; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_rob_allocation_reqs_1_uop_inst_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_regWen; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_src1_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_1_uop_phy_rs1; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_1_uop_arch_rs1; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_rob_allocation_reqs_1_uop_src2_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_rob_allocation_reqs_1_uop_phy_rs2; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_1_uop_arch_rs2; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_1_uop_imm; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_1_uop_src1_value; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_rob_allocation_reqs_1_uop_src2_value; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_rob_allocation_reqs_1_uop_op1_sel; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_rob_allocation_reqs_1_uop_op2_sel; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_rob_allocation_reqs_1_uop_alu_sel; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_rob_allocation_reqs_1_uop_branch_type; // @[backend_with_decode.scala 41:26]
  wire [1:0] dispatch_io_o_rob_allocation_reqs_1_uop_mem_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_valid; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_dispatch_packs_0_pc; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_dispatch_packs_0_inst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_0_func_code; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_dispatch_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_0_phy_dst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_0_stale_dst; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_0_arch_dst; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_dispatch_packs_0_inst_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_regWen; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_src1_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_0_phy_rs1; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_0_arch_rs1; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_0_src2_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_0_phy_rs2; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_0_arch_rs2; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_0_rob_idx; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_0_imm; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_0_src1_value; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_0_src2_value; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_dispatch_packs_0_op1_sel; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_dispatch_packs_0_op2_sel; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_0_alu_sel; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_dispatch_packs_0_branch_type; // @[backend_with_decode.scala 41:26]
  wire [1:0] dispatch_io_o_dispatch_packs_0_mem_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_valid; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_dispatch_packs_1_pc; // @[backend_with_decode.scala 41:26]
  wire [31:0] dispatch_io_o_dispatch_packs_1_inst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_1_func_code; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_dispatch_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_1_phy_dst; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_1_stale_dst; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_1_arch_dst; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_dispatch_packs_1_inst_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_regWen; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_src1_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_1_phy_rs1; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_1_arch_rs1; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_o_dispatch_packs_1_src2_valid; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_1_phy_rs2; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_1_arch_rs2; // @[backend_with_decode.scala 41:26]
  wire [6:0] dispatch_io_o_dispatch_packs_1_rob_idx; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_1_imm; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_1_src1_value; // @[backend_with_decode.scala 41:26]
  wire [63:0] dispatch_io_o_dispatch_packs_1_src2_value; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_dispatch_packs_1_op1_sel; // @[backend_with_decode.scala 41:26]
  wire [2:0] dispatch_io_o_dispatch_packs_1_op2_sel; // @[backend_with_decode.scala 41:26]
  wire [4:0] dispatch_io_o_dispatch_packs_1_alu_sel; // @[backend_with_decode.scala 41:26]
  wire [3:0] dispatch_io_o_dispatch_packs_1_branch_type; // @[backend_with_decode.scala 41:26]
  wire [1:0] dispatch_io_o_dispatch_packs_1_mem_type; // @[backend_with_decode.scala 41:26]
  wire  dispatch_io_i_exception; // @[backend_with_decode.scala 41:26]
  wire  reservation_station_clock; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_reset; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_valid; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_i_dispatch_packs_0_pc; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_i_dispatch_packs_0_inst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_0_func_code; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_i_dispatch_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_0_phy_dst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_0_stale_dst; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_0_arch_dst; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_i_dispatch_packs_0_inst_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_regWen; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_src1_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_0_phy_rs1; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_0_arch_rs1; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_0_src2_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_0_phy_rs2; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_0_arch_rs2; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_0_rob_idx; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_0_imm; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_0_src1_value; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_0_src2_value; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_i_dispatch_packs_0_op1_sel; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_i_dispatch_packs_0_op2_sel; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_0_alu_sel; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_i_dispatch_packs_0_branch_type; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_dispatch_packs_0_mem_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_valid; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_i_dispatch_packs_1_pc; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_i_dispatch_packs_1_inst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_1_func_code; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_1_phy_dst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_1_stale_dst; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_1_arch_dst; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_i_dispatch_packs_1_inst_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_regWen; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_src1_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_1_phy_rs1; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_1_arch_rs1; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_dispatch_packs_1_src2_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_1_phy_rs2; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_1_arch_rs2; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_dispatch_packs_1_rob_idx; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_1_imm; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_1_src1_value; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_dispatch_packs_1_src2_value; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_i_dispatch_packs_1_op1_sel; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_i_dispatch_packs_1_op2_sel; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_i_dispatch_packs_1_alu_sel; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_i_dispatch_packs_1_branch_type; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_dispatch_packs_1_mem_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_valid; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_o_issue_packs_0_pc; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_o_issue_packs_0_inst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_0_func_code; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_o_issue_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_0_phy_dst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_0_stale_dst; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_0_arch_dst; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_o_issue_packs_0_inst_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_regWen; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_src1_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_0_phy_rs1; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_0_arch_rs1; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_0_src2_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_0_phy_rs2; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_0_arch_rs2; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_0_rob_idx; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_0_imm; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_0_src1_value; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_0_src2_value; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_o_issue_packs_0_op1_sel; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_o_issue_packs_0_op2_sel; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_0_alu_sel; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_o_issue_packs_0_branch_type; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_o_issue_packs_0_mem_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_valid; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_o_issue_packs_1_pc; // @[backend_with_decode.scala 42:37]
  wire [31:0] reservation_station_io_o_issue_packs_1_inst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_1_func_code; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_o_issue_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_1_phy_dst; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_1_stale_dst; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_1_arch_dst; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_o_issue_packs_1_inst_type; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_regWen; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_src1_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_1_phy_rs1; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_1_arch_rs1; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_issue_packs_1_src2_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_1_phy_rs2; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_1_arch_rs2; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_o_issue_packs_1_rob_idx; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_1_imm; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_1_src1_value; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_o_issue_packs_1_src2_value; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_o_issue_packs_1_op1_sel; // @[backend_with_decode.scala 42:37]
  wire [2:0] reservation_station_io_o_issue_packs_1_op2_sel; // @[backend_with_decode.scala 42:37]
  wire [4:0] reservation_station_io_o_issue_packs_1_alu_sel; // @[backend_with_decode.scala 42:37]
  wire [3:0] reservation_station_io_o_issue_packs_1_branch_type; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_o_issue_packs_1_mem_type; // @[backend_with_decode.scala 42:37]
  wire [127:0] reservation_station_io_i_wakeup_port; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_ex_res_packs_0_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_ex_res_packs_0_uop_func_code; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_ex_res_packs_0_uop_phy_dst; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_ex_res_packs_0_uop_dst_value; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_ex_res_packs_1_valid; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_ex_res_packs_1_uop_func_code; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_ex_res_packs_1_uop_phy_dst; // @[backend_with_decode.scala 42:37]
  wire [63:0] reservation_station_io_i_ex_res_packs_1_uop_dst_value; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_branch_resolve_pack_valid; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_branch_resolve_pack_mispred; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_branch_resolve_pack_rob_idx; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_o_full; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_exception; // @[backend_with_decode.scala 42:37]
  wire  reservation_station_io_i_rollback_valid; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_available_funcs_0; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_available_funcs_1; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_available_funcs_2; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_available_funcs_3; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_available_funcs_4; // @[backend_with_decode.scala 42:37]
  wire [1:0] reservation_station_io_i_available_funcs_5; // @[backend_with_decode.scala 42:37]
  wire [6:0] reservation_station_io_i_ROB_first_entry; // @[backend_with_decode.scala 42:37]
  wire  regfile_clock; // @[backend_with_decode.scala 43:25]
  wire  regfile_reset; // @[backend_with_decode.scala 43:25]
  wire [6:0] regfile_io_i_raddr1; // @[backend_with_decode.scala 43:25]
  wire [6:0] regfile_io_i_raddr2; // @[backend_with_decode.scala 43:25]
  wire [6:0] regfile_io_i_raddr3; // @[backend_with_decode.scala 43:25]
  wire [6:0] regfile_io_i_raddr4; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_rdata1; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_rdata2; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_rdata3; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_rdata4; // @[backend_with_decode.scala 43:25]
  wire [6:0] regfile_io_i_waddr1; // @[backend_with_decode.scala 43:25]
  wire [6:0] regfile_io_i_waddr2; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_i_wdata1; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_i_wdata2; // @[backend_with_decode.scala 43:25]
  wire  regfile_io_i_wenable1; // @[backend_with_decode.scala 43:25]
  wire  regfile_io_i_wenable2; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_0; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_1; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_2; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_3; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_4; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_5; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_6; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_7; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_8; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_9; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_10; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_11; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_12; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_13; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_14; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_15; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_16; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_17; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_18; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_19; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_20; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_21; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_22; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_23; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_24; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_25; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_26; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_27; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_28; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_29; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_30; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_31; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_32; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_33; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_34; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_35; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_36; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_37; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_38; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_39; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_40; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_41; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_42; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_43; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_44; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_45; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_46; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_47; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_48; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_49; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_50; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_51; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_52; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_53; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_54; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_55; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_56; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_57; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_58; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_59; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_60; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_61; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_62; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_63; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_64; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_65; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_66; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_67; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_68; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_69; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_70; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_71; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_72; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_73; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_74; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_75; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_76; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_77; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_78; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_79; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_80; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_81; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_82; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_83; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_84; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_85; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_86; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_87; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_88; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_89; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_90; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_91; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_92; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_93; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_94; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_95; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_96; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_97; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_98; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_99; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_100; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_101; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_102; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_103; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_104; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_105; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_106; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_107; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_108; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_109; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_110; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_111; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_112; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_113; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_114; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_115; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_116; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_117; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_118; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_119; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_120; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_121; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_122; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_123; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_124; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_125; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_126; // @[backend_with_decode.scala 43:25]
  wire [63:0] regfile_io_o_pregs_127; // @[backend_with_decode.scala 43:25]
  wire  execute_clock; // @[backend_with_decode.scala 44:24]
  wire  execute_reset; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_valid; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_i_issue_res_packs_0_pc; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_i_issue_res_packs_0_inst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_0_func_code; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_i_issue_res_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_0_phy_dst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_0_stale_dst; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_0_arch_dst; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_i_issue_res_packs_0_inst_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_regWen; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_src1_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_0_phy_rs1; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_0_arch_rs1; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_0_src2_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_0_phy_rs2; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_0_arch_rs2; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_0_rob_idx; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_0_imm; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_0_src1_value; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_0_src2_value; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_i_issue_res_packs_0_op1_sel; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_i_issue_res_packs_0_op2_sel; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_0_alu_sel; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_i_issue_res_packs_0_branch_type; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_i_issue_res_packs_0_mem_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_valid; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_i_issue_res_packs_1_pc; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_i_issue_res_packs_1_inst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_1_func_code; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_i_issue_res_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_1_phy_dst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_1_stale_dst; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_1_arch_dst; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_i_issue_res_packs_1_inst_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_regWen; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_src1_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_1_phy_rs1; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_1_arch_rs1; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_issue_res_packs_1_src2_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_1_phy_rs2; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_1_arch_rs2; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_issue_res_packs_1_rob_idx; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_1_imm; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_1_src1_value; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_i_issue_res_packs_1_src2_value; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_i_issue_res_packs_1_op1_sel; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_i_issue_res_packs_1_op2_sel; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_i_issue_res_packs_1_alu_sel; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_i_issue_res_packs_1_branch_type; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_i_issue_res_packs_1_mem_type; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_available_funcs_0; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_available_funcs_1; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_available_funcs_2; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_available_funcs_3; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_available_funcs_4; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_available_funcs_5; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_valid; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_valid; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_o_ex_res_packs_0_uop_pc; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_o_ex_res_packs_0_uop_inst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_0_uop_func_code; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_o_ex_res_packs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_0_uop_phy_dst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_0_uop_stale_dst; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_0_uop_arch_dst; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_ex_res_packs_0_uop_inst_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_regWen; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_src1_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_0_uop_phy_rs1; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_0_uop_arch_rs1; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_0_uop_src2_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_0_uop_phy_rs2; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_0_uop_arch_rs2; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_0_uop_rob_idx; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_0_uop_imm; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_0_uop_dst_value; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_0_uop_src1_value; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_0_uop_src2_value; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_ex_res_packs_0_uop_op1_sel; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_ex_res_packs_0_uop_op2_sel; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_0_uop_alu_sel; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_o_ex_res_packs_0_uop_branch_type; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_ex_res_packs_0_uop_mem_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_valid; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_valid; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_o_ex_res_packs_1_uop_pc; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_o_ex_res_packs_1_uop_inst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_1_uop_func_code; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_o_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_1_uop_phy_dst; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_1_uop_stale_dst; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_1_uop_arch_dst; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_ex_res_packs_1_uop_inst_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_regWen; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_src1_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_1_uop_phy_rs1; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_1_uop_arch_rs1; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_ex_res_packs_1_uop_src2_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_1_uop_phy_rs2; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_1_uop_arch_rs2; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_ex_res_packs_1_uop_rob_idx; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_1_uop_imm; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_1_uop_dst_value; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_1_uop_src1_value; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_ex_res_packs_1_uop_src2_value; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_ex_res_packs_1_uop_op1_sel; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_ex_res_packs_1_uop_op2_sel; // @[backend_with_decode.scala 44:24]
  wire [4:0] execute_io_o_ex_res_packs_1_uop_alu_sel; // @[backend_with_decode.scala 44:24]
  wire [3:0] execute_io_o_ex_res_packs_1_uop_branch_type; // @[backend_with_decode.scala 44:24]
  wire [1:0] execute_io_o_ex_res_packs_1_uop_mem_type; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_i_ROB_first_entry; // @[backend_with_decode.scala 44:24]
  wire  execute_io_dcache_io_data_valid; // @[backend_with_decode.scala 44:24]
  wire  execute_io_dcache_io_addr_valid; // @[backend_with_decode.scala 44:24]
  wire  execute_io_dcache_io_addr_ready; // @[backend_with_decode.scala 44:24]
  wire  execute_io_dcache_io_Mwout; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_dcache_io_Maddr; // @[backend_with_decode.scala 44:24]
  wire  execute_io_dcache_io_Men; // @[backend_with_decode.scala 44:24]
  wire [31:0] execute_io_dcache_io_Mlen; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_dcache_io_MdataIn; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_dcache_io_MdataOut; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_branch_resolve_pack_valid; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_branch_resolve_pack_taken; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_branch_resolve_pack_pc; // @[backend_with_decode.scala 44:24]
  wire [63:0] execute_io_o_branch_resolve_pack_target; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_branch_resolve_pack_rob_idx; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_branch_resolve_pack_prediction_valid; // @[backend_with_decode.scala 44:24]
  wire [2:0] execute_io_o_branch_resolve_pack_branch_type; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_exception; // @[backend_with_decode.scala 44:24]
  wire  execute_io_i_rollback_valid; // @[backend_with_decode.scala 44:24]
  wire  execute_io_o_lsu_uop_valid; // @[backend_with_decode.scala 44:24]
  wire [6:0] execute_io_o_lsu_uop_rob_idx; // @[backend_with_decode.scala 44:24]
  wire  rob_clock; // @[backend_with_decode.scala 45:21]
  wire  rob_reset; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_full; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_valid; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_rob_allocation_reqs_0_uop_pc; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_rob_allocation_reqs_0_uop_inst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_0_uop_func_code; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_0_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_0_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_0_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_rob_allocation_reqs_0_uop_inst_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_regWen; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_src1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_0_uop_phy_rs1; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_0_uop_arch_rs1; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_0_uop_src2_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_0_uop_phy_rs2; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_0_uop_arch_rs2; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_0_uop_imm; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_0_uop_src1_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_0_uop_src2_value; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_rob_allocation_reqs_0_uop_op1_sel; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_rob_allocation_reqs_0_uop_op2_sel; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_0_uop_alu_sel; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_rob_allocation_reqs_0_uop_branch_type; // @[backend_with_decode.scala 45:21]
  wire [1:0] rob_io_i_rob_allocation_reqs_0_uop_mem_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_valid; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_rob_allocation_reqs_1_uop_pc; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_rob_allocation_reqs_1_uop_inst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_1_uop_func_code; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_1_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_1_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_1_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_rob_allocation_reqs_1_uop_inst_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_regWen; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_src1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_1_uop_phy_rs1; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_1_uop_arch_rs1; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_rob_allocation_reqs_1_uop_src2_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_rob_allocation_reqs_1_uop_phy_rs2; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_1_uop_arch_rs2; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_1_uop_imm; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_1_uop_src1_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_rob_allocation_reqs_1_uop_src2_value; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_rob_allocation_reqs_1_uop_op1_sel; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_rob_allocation_reqs_1_uop_op2_sel; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_rob_allocation_reqs_1_uop_alu_sel; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_rob_allocation_reqs_1_uop_branch_type; // @[backend_with_decode.scala 45:21]
  wire [1:0] rob_io_i_rob_allocation_reqs_1_uop_mem_type; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rob_allocation_ress_0_rob_idx; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rob_allocation_ress_1_rob_idx; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_rollback_packs_0_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rollback_packs_0_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rollback_packs_0_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_rollback_packs_0_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_rollback_packs_1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rollback_packs_1_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rollback_packs_1_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_rollback_packs_1_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_valid; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_ex_res_packs_0_uop_pc; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_ex_res_packs_0_uop_inst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_0_uop_func_code; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_0_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_0_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_0_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_ex_res_packs_0_uop_inst_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_regWen; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_src1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_0_uop_phy_rs1; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_0_uop_arch_rs1; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_0_uop_src2_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_0_uop_phy_rs2; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_0_uop_arch_rs2; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_0_uop_rob_idx; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_0_uop_imm; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_0_uop_dst_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_0_uop_src1_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_0_uop_src2_value; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_ex_res_packs_0_uop_op1_sel; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_ex_res_packs_0_uop_op2_sel; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_0_uop_alu_sel; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_ex_res_packs_0_uop_branch_type; // @[backend_with_decode.scala 45:21]
  wire [1:0] rob_io_i_ex_res_packs_0_uop_mem_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_valid; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_ex_res_packs_1_uop_pc; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_i_ex_res_packs_1_uop_inst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_1_uop_func_code; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_1_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_1_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_1_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_ex_res_packs_1_uop_inst_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_regWen; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_src1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_1_uop_phy_rs1; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_1_uop_arch_rs1; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_ex_res_packs_1_uop_src2_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_1_uop_phy_rs2; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_1_uop_arch_rs2; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_ex_res_packs_1_uop_rob_idx; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_1_uop_imm; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_1_uop_dst_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_1_uop_src1_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_i_ex_res_packs_1_uop_src2_value; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_ex_res_packs_1_uop_op1_sel; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_i_ex_res_packs_1_uop_op2_sel; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_i_ex_res_packs_1_uop_alu_sel; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_i_ex_res_packs_1_uop_branch_type; // @[backend_with_decode.scala 45:21]
  wire [1:0] rob_io_i_ex_res_packs_1_uop_mem_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_branch_resolve_pack_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_branch_resolve_pack_mispred; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_i_branch_resolve_pack_rob_idx; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_valid; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_o_commit_packs_0_uop_pc; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_o_commit_packs_0_uop_inst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_0_uop_func_code; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_o_commit_packs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_0_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_0_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_0_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_o_commit_packs_0_uop_inst_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_regWen; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_src1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_0_uop_phy_rs1; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_0_uop_arch_rs1; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_0_uop_src2_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_0_uop_phy_rs2; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_0_uop_arch_rs2; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_0_uop_rob_idx; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_0_uop_imm; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_0_uop_dst_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_0_uop_src1_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_0_uop_src2_value; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_o_commit_packs_0_uop_op1_sel; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_o_commit_packs_0_uop_op2_sel; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_0_uop_alu_sel; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_o_commit_packs_0_uop_branch_type; // @[backend_with_decode.scala 45:21]
  wire [1:0] rob_io_o_commit_packs_0_uop_mem_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_valid; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_valid; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_o_commit_packs_1_uop_pc; // @[backend_with_decode.scala 45:21]
  wire [31:0] rob_io_o_commit_packs_1_uop_inst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_1_uop_func_code; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_o_commit_packs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_1_uop_phy_dst; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_1_uop_stale_dst; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_1_uop_arch_dst; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_o_commit_packs_1_uop_inst_type; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_regWen; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_src1_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_1_uop_phy_rs1; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_1_uop_arch_rs1; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_commit_packs_1_uop_src2_valid; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_1_uop_phy_rs2; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_1_uop_arch_rs2; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_commit_packs_1_uop_rob_idx; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_1_uop_imm; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_1_uop_dst_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_1_uop_src1_value; // @[backend_with_decode.scala 45:21]
  wire [63:0] rob_io_o_commit_packs_1_uop_src2_value; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_o_commit_packs_1_uop_op1_sel; // @[backend_with_decode.scala 45:21]
  wire [2:0] rob_io_o_commit_packs_1_uop_op2_sel; // @[backend_with_decode.scala 45:21]
  wire [4:0] rob_io_o_commit_packs_1_uop_alu_sel; // @[backend_with_decode.scala 45:21]
  wire [3:0] rob_io_o_commit_packs_1_uop_branch_type; // @[backend_with_decode.scala 45:21]
  wire [1:0] rob_io_o_commit_packs_1_uop_mem_type; // @[backend_with_decode.scala 45:21]
  wire [6:0] rob_io_o_rob_head; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_interrupt; // @[backend_with_decode.scala 45:21]
  wire  rob_io_i_csr_pc_redirect; // @[backend_with_decode.scala 45:21]
  wire  rob_io_o_exception; // @[backend_with_decode.scala 45:21]
  wire  csr_clock; // @[backend_with_decode.scala 46:21]
  wire  csr_reset; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_interrupt; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_valid; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_valid; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_i_commit_packs_0_uop_pc; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_i_commit_packs_0_uop_inst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_0_uop_func_code; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_i_commit_packs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_0_uop_phy_dst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_0_uop_stale_dst; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_0_uop_arch_dst; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_i_commit_packs_0_uop_inst_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_regWen; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_src1_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_0_uop_phy_rs1; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_0_uop_arch_rs1; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_0_uop_src2_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_0_uop_phy_rs2; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_0_uop_arch_rs2; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_0_uop_rob_idx; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_0_uop_imm; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_0_uop_dst_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_0_uop_src1_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_0_uop_src2_value; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_i_commit_packs_0_uop_op1_sel; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_i_commit_packs_0_uop_op2_sel; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_0_uop_alu_sel; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_i_commit_packs_0_uop_branch_type; // @[backend_with_decode.scala 46:21]
  wire [1:0] csr_io_i_commit_packs_0_uop_mem_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_valid; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_valid; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_i_commit_packs_1_uop_pc; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_i_commit_packs_1_uop_inst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_1_uop_func_code; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_i_commit_packs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_1_uop_phy_dst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_1_uop_stale_dst; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_1_uop_arch_dst; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_i_commit_packs_1_uop_inst_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_regWen; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_src1_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_1_uop_phy_rs1; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_1_uop_arch_rs1; // @[backend_with_decode.scala 46:21]
  wire  csr_io_i_commit_packs_1_uop_src2_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_1_uop_phy_rs2; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_1_uop_arch_rs2; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_i_commit_packs_1_uop_rob_idx; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_1_uop_imm; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_1_uop_dst_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_1_uop_src1_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_i_commit_packs_1_uop_src2_value; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_i_commit_packs_1_uop_op1_sel; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_i_commit_packs_1_uop_op2_sel; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_i_commit_packs_1_uop_alu_sel; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_i_commit_packs_1_uop_branch_type; // @[backend_with_decode.scala 46:21]
  wire [1:0] csr_io_i_commit_packs_1_uop_mem_type; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_pc_redirect_target; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_valid; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_valid; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_o_commit_packs_modified_0_uop_pc; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_o_commit_packs_modified_0_uop_inst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_0_uop_func_code; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_0_uop_phy_dst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_0_uop_stale_dst; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_0_uop_arch_dst; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_o_commit_packs_modified_0_uop_inst_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_regWen; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_src1_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_0_uop_phy_rs1; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_0_uop_arch_rs1; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_0_uop_src2_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_0_uop_phy_rs2; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_0_uop_arch_rs2; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_0_uop_rob_idx; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_0_uop_imm; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_0_uop_dst_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_0_uop_src1_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_0_uop_src2_value; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_o_commit_packs_modified_0_uop_op1_sel; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_o_commit_packs_modified_0_uop_op2_sel; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_0_uop_alu_sel; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_o_commit_packs_modified_0_uop_branch_type; // @[backend_with_decode.scala 46:21]
  wire [1:0] csr_io_o_commit_packs_modified_0_uop_mem_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_valid; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_valid; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_o_commit_packs_modified_1_uop_pc; // @[backend_with_decode.scala 46:21]
  wire [31:0] csr_io_o_commit_packs_modified_1_uop_inst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_1_uop_func_code; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_1_uop_phy_dst; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_1_uop_stale_dst; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_1_uop_arch_dst; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_o_commit_packs_modified_1_uop_inst_type; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_regWen; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_src1_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_1_uop_phy_rs1; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_1_uop_arch_rs1; // @[backend_with_decode.scala 46:21]
  wire  csr_io_o_commit_packs_modified_1_uop_src2_valid; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_1_uop_phy_rs2; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_1_uop_arch_rs2; // @[backend_with_decode.scala 46:21]
  wire [6:0] csr_io_o_commit_packs_modified_1_uop_rob_idx; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_1_uop_imm; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_1_uop_dst_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_1_uop_src1_value; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_commit_packs_modified_1_uop_src2_value; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_o_commit_packs_modified_1_uop_op1_sel; // @[backend_with_decode.scala 46:21]
  wire [2:0] csr_io_o_commit_packs_modified_1_uop_op2_sel; // @[backend_with_decode.scala 46:21]
  wire [4:0] csr_io_o_commit_packs_modified_1_uop_alu_sel; // @[backend_with_decode.scala 46:21]
  wire [3:0] csr_io_o_commit_packs_modified_1_uop_branch_type; // @[backend_with_decode.scala 46:21]
  wire [1:0] csr_io_o_commit_packs_modified_1_uop_mem_type; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_mepc; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_mtvec; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_mcause; // @[backend_with_decode.scala 46:21]
  wire [63:0] csr_io_o_mstatus; // @[backend_with_decode.scala 46:21]
  wire  interrupt_mask_clock; // @[backend_with_decode.scala 47:32]
  wire  interrupt_mask_reset; // @[backend_with_decode.scala 47:32]
  wire  interrupt_mask_io_i_lsu_uop_valid; // @[backend_with_decode.scala 47:32]
  wire [6:0] interrupt_mask_io_i_rob_idx; // @[backend_with_decode.scala 47:32]
  wire [6:0] interrupt_mask_io_i_lsu_uop_rob_idx; // @[backend_with_decode.scala 47:32]
  wire  interrupt_mask_io_i_interrupt; // @[backend_with_decode.scala 47:32]
  wire  interrupt_mask_io_o_interrupt_with_mask; // @[backend_with_decode.scala 47:32]
  wire [63:0] arch_regs_io_i_pregs_0; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_1; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_2; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_3; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_4; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_5; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_6; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_7; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_8; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_9; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_10; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_11; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_12; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_13; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_14; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_15; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_16; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_17; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_18; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_19; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_20; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_21; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_22; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_23; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_24; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_25; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_26; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_27; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_28; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_29; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_30; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_31; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_32; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_33; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_34; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_35; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_36; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_37; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_38; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_39; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_40; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_41; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_42; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_43; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_44; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_45; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_46; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_47; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_48; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_49; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_50; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_51; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_52; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_53; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_54; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_55; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_56; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_57; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_58; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_59; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_60; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_61; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_62; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_63; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_64; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_65; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_66; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_67; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_68; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_69; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_70; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_71; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_72; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_73; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_74; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_75; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_76; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_77; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_78; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_79; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_80; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_81; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_82; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_83; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_84; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_85; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_86; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_87; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_88; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_89; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_90; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_91; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_92; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_93; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_94; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_95; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_96; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_97; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_98; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_99; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_100; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_101; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_102; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_103; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_104; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_105; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_106; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_107; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_108; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_109; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_110; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_111; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_112; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_113; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_114; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_115; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_116; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_117; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_118; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_119; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_120; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_121; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_122; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_123; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_124; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_125; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_126; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_pregs_127; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_0; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_1; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_2; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_3; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_4; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_5; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_6; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_7; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_8; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_9; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_10; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_11; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_12; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_13; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_14; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_15; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_16; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_17; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_18; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_19; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_20; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_21; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_22; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_23; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_24; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_25; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_26; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_27; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_28; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_29; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_30; // @[backend_with_decode.scala 160:27]
  wire [6:0] arch_regs_io_i_rename_table_31; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_csrs_0; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_csrs_1; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_csrs_2; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_i_csrs_3; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_0; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_1; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_2; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_3; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_4; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_5; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_6; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_7; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_8; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_9; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_10; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_11; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_12; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_13; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_14; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_15; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_16; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_17; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_18; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_19; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_20; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_21; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_22; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_23; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_24; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_25; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_26; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_27; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_28; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_29; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_30; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_arch_regs_31; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_csr_regs_0; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_csr_regs_1; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_csr_regs_2; // @[backend_with_decode.scala 160:27]
  wire [63:0] arch_regs_io_o_csr_regs_3; // @[backend_with_decode.scala 160:27]
  wire  _rename_io_i_stall_T = rob_io_o_full | reservation_station_io_o_full; // @[backend_with_decode.scala 61:52]
  wire [6:0] _written_back_table_with_bypass_T_1 = execute_io_o_ex_res_packs_0_valid ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [6:0] _written_back_table_with_bypass_T_2 = execute_io_o_ex_res_packs_0_uop_phy_dst &
    _written_back_table_with_bypass_T_1; // @[backend_with_decode.scala 75:66]
  wire  _written_back_table_with_bypass_T_3 = execute_io_o_ex_res_packs_0_uop_func_code != 7'h20; // @[backend_with_decode.scala 75:178]
  wire [6:0] _written_back_table_with_bypass_T_5 = _written_back_table_with_bypass_T_3 ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [6:0] _written_back_table_with_bypass_T_6 = _written_back_table_with_bypass_T_2 &
    _written_back_table_with_bypass_T_5; // @[backend_with_decode.scala 75:124]
  wire [127:0] _written_back_table_with_bypass_T_7 = 128'h1 << _written_back_table_with_bypass_T_6; // @[OneHot.scala 57:35]
  wire [127:0] _written_back_table_with_bypass_T_8 = rename_io_o_written_back_table |
    _written_back_table_with_bypass_T_7; // @[backend_with_decode.scala 74:70]
  wire [6:0] _written_back_table_with_bypass_T_10 = execute_io_o_ex_res_packs_1_valid ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [6:0] _written_back_table_with_bypass_T_11 = execute_io_o_ex_res_packs_1_uop_phy_dst &
    _written_back_table_with_bypass_T_10; // @[backend_with_decode.scala 76:66]
  wire  _written_back_table_with_bypass_T_12 = execute_io_o_ex_res_packs_1_uop_func_code != 7'h20; // @[backend_with_decode.scala 76:178]
  wire [6:0] _written_back_table_with_bypass_T_14 = _written_back_table_with_bypass_T_12 ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [6:0] _written_back_table_with_bypass_T_15 = _written_back_table_with_bypass_T_11 &
    _written_back_table_with_bypass_T_14; // @[backend_with_decode.scala 76:124]
  wire [127:0] _written_back_table_with_bypass_T_16 = 128'h1 << _written_back_table_with_bypass_T_15; // @[OneHot.scala 57:35]
  wire [63:0] arch_regs_output_0 = arch_regs_io_o_arch_regs_0; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_1 = arch_regs_io_o_arch_regs_1; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_2 = arch_regs_io_o_arch_regs_2; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_3 = arch_regs_io_o_arch_regs_3; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_4 = arch_regs_io_o_arch_regs_4; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_5 = arch_regs_io_o_arch_regs_5; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_6 = arch_regs_io_o_arch_regs_6; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_7 = arch_regs_io_o_arch_regs_7; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_8 = arch_regs_io_o_arch_regs_8; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_9 = arch_regs_io_o_arch_regs_9; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_10 = arch_regs_io_o_arch_regs_10; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_11 = arch_regs_io_o_arch_regs_11; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_12 = arch_regs_io_o_arch_regs_12; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_13 = arch_regs_io_o_arch_regs_13; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_14 = arch_regs_io_o_arch_regs_14; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_15 = arch_regs_io_o_arch_regs_15; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_16 = arch_regs_io_o_arch_regs_16; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_17 = arch_regs_io_o_arch_regs_17; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_18 = arch_regs_io_o_arch_regs_18; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_19 = arch_regs_io_o_arch_regs_19; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_20 = arch_regs_io_o_arch_regs_20; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_21 = arch_regs_io_o_arch_regs_21; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_22 = arch_regs_io_o_arch_regs_22; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_23 = arch_regs_io_o_arch_regs_23; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_24 = arch_regs_io_o_arch_regs_24; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_25 = arch_regs_io_o_arch_regs_25; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_26 = arch_regs_io_o_arch_regs_26; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_27 = arch_regs_io_o_arch_regs_27; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_28 = arch_regs_io_o_arch_regs_28; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_29 = arch_regs_io_o_arch_regs_29; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_30 = arch_regs_io_o_arch_regs_30; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] arch_regs_output_31 = arch_regs_io_o_arch_regs_31; // @[backend_with_decode.scala 161:32 169:22]
  wire [63:0] csr_regs_output_0 = arch_regs_io_o_csr_regs_0; // @[backend_with_decode.scala 162:31 170:21]
  wire [63:0] csr_regs_output_1 = arch_regs_io_o_csr_regs_1; // @[backend_with_decode.scala 162:31 170:21]
  wire [63:0] csr_regs_output_2 = arch_regs_io_o_csr_regs_2; // @[backend_with_decode.scala 162:31 170:21]
  wire [63:0] csr_regs_output_3 = arch_regs_io_o_csr_regs_3; // @[backend_with_decode.scala 162:31 170:21]
  Decoder decode ( // @[backend_with_decode.scala 39:24]
    .clock(decode_clock),
    .reset(decode_reset),
    .io_i_fetch_pack_ready(decode_io_i_fetch_pack_ready),
    .io_i_fetch_pack_valid(decode_io_i_fetch_pack_valid),
    .io_i_fetch_pack_bits_valids_0(decode_io_i_fetch_pack_bits_valids_0),
    .io_i_fetch_pack_bits_valids_1(decode_io_i_fetch_pack_bits_valids_1),
    .io_i_fetch_pack_bits_pc(decode_io_i_fetch_pack_bits_pc),
    .io_i_fetch_pack_bits_insts_0(decode_io_i_fetch_pack_bits_insts_0),
    .io_i_fetch_pack_bits_insts_1(decode_io_i_fetch_pack_bits_insts_1),
    .io_i_fetch_pack_bits_branch_predict_pack_valid(decode_io_i_fetch_pack_bits_branch_predict_pack_valid),
    .io_i_fetch_pack_bits_branch_predict_pack_target(decode_io_i_fetch_pack_bits_branch_predict_pack_target),
    .io_i_fetch_pack_bits_branch_predict_pack_branch_type(decode_io_i_fetch_pack_bits_branch_predict_pack_branch_type),
    .io_i_fetch_pack_bits_branch_predict_pack_select(decode_io_i_fetch_pack_bits_branch_predict_pack_select),
    .io_i_fetch_pack_bits_branch_predict_pack_taken(decode_io_i_fetch_pack_bits_branch_predict_pack_taken),
    .io_o_decode_packs_0_valid(decode_io_o_decode_packs_0_valid),
    .io_o_decode_packs_0_pc(decode_io_o_decode_packs_0_pc),
    .io_o_decode_packs_0_inst(decode_io_o_decode_packs_0_inst),
    .io_o_decode_packs_0_func_code(decode_io_o_decode_packs_0_func_code),
    .io_o_decode_packs_0_branch_predict_pack_valid(decode_io_o_decode_packs_0_branch_predict_pack_valid),
    .io_o_decode_packs_0_branch_predict_pack_target(decode_io_o_decode_packs_0_branch_predict_pack_target),
    .io_o_decode_packs_0_branch_predict_pack_branch_type(decode_io_o_decode_packs_0_branch_predict_pack_branch_type),
    .io_o_decode_packs_0_branch_predict_pack_select(decode_io_o_decode_packs_0_branch_predict_pack_select),
    .io_o_decode_packs_0_branch_predict_pack_taken(decode_io_o_decode_packs_0_branch_predict_pack_taken),
    .io_o_decode_packs_0_arch_dst(decode_io_o_decode_packs_0_arch_dst),
    .io_o_decode_packs_0_inst_type(decode_io_o_decode_packs_0_inst_type),
    .io_o_decode_packs_0_regWen(decode_io_o_decode_packs_0_regWen),
    .io_o_decode_packs_0_src1_valid(decode_io_o_decode_packs_0_src1_valid),
    .io_o_decode_packs_0_arch_rs1(decode_io_o_decode_packs_0_arch_rs1),
    .io_o_decode_packs_0_src2_valid(decode_io_o_decode_packs_0_src2_valid),
    .io_o_decode_packs_0_arch_rs2(decode_io_o_decode_packs_0_arch_rs2),
    .io_o_decode_packs_0_imm(decode_io_o_decode_packs_0_imm),
    .io_o_decode_packs_0_src1_value(decode_io_o_decode_packs_0_src1_value),
    .io_o_decode_packs_0_src2_value(decode_io_o_decode_packs_0_src2_value),
    .io_o_decode_packs_0_op1_sel(decode_io_o_decode_packs_0_op1_sel),
    .io_o_decode_packs_0_op2_sel(decode_io_o_decode_packs_0_op2_sel),
    .io_o_decode_packs_0_alu_sel(decode_io_o_decode_packs_0_alu_sel),
    .io_o_decode_packs_0_branch_type(decode_io_o_decode_packs_0_branch_type),
    .io_o_decode_packs_0_mem_type(decode_io_o_decode_packs_0_mem_type),
    .io_o_decode_packs_1_valid(decode_io_o_decode_packs_1_valid),
    .io_o_decode_packs_1_pc(decode_io_o_decode_packs_1_pc),
    .io_o_decode_packs_1_inst(decode_io_o_decode_packs_1_inst),
    .io_o_decode_packs_1_func_code(decode_io_o_decode_packs_1_func_code),
    .io_o_decode_packs_1_branch_predict_pack_valid(decode_io_o_decode_packs_1_branch_predict_pack_valid),
    .io_o_decode_packs_1_branch_predict_pack_target(decode_io_o_decode_packs_1_branch_predict_pack_target),
    .io_o_decode_packs_1_branch_predict_pack_branch_type(decode_io_o_decode_packs_1_branch_predict_pack_branch_type),
    .io_o_decode_packs_1_branch_predict_pack_select(decode_io_o_decode_packs_1_branch_predict_pack_select),
    .io_o_decode_packs_1_branch_predict_pack_taken(decode_io_o_decode_packs_1_branch_predict_pack_taken),
    .io_o_decode_packs_1_arch_dst(decode_io_o_decode_packs_1_arch_dst),
    .io_o_decode_packs_1_inst_type(decode_io_o_decode_packs_1_inst_type),
    .io_o_decode_packs_1_regWen(decode_io_o_decode_packs_1_regWen),
    .io_o_decode_packs_1_src1_valid(decode_io_o_decode_packs_1_src1_valid),
    .io_o_decode_packs_1_arch_rs1(decode_io_o_decode_packs_1_arch_rs1),
    .io_o_decode_packs_1_src2_valid(decode_io_o_decode_packs_1_src2_valid),
    .io_o_decode_packs_1_arch_rs2(decode_io_o_decode_packs_1_arch_rs2),
    .io_o_decode_packs_1_imm(decode_io_o_decode_packs_1_imm),
    .io_o_decode_packs_1_src1_value(decode_io_o_decode_packs_1_src1_value),
    .io_o_decode_packs_1_src2_value(decode_io_o_decode_packs_1_src2_value),
    .io_o_decode_packs_1_op1_sel(decode_io_o_decode_packs_1_op1_sel),
    .io_o_decode_packs_1_op2_sel(decode_io_o_decode_packs_1_op2_sel),
    .io_o_decode_packs_1_alu_sel(decode_io_o_decode_packs_1_alu_sel),
    .io_o_decode_packs_1_branch_type(decode_io_o_decode_packs_1_branch_type),
    .io_o_decode_packs_1_mem_type(decode_io_o_decode_packs_1_mem_type),
    .io_i_exception(decode_io_i_exception),
    .io_i_branch_resolve_pack_valid(decode_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(decode_io_i_branch_resolve_pack_mispred),
    .io_i_stall(decode_io_i_stall)
  );
  Rename rename ( // @[backend_with_decode.scala 40:25]
    .clock(rename_clock),
    .reset(rename_reset),
    .io_i_decode_packs_0_valid(rename_io_i_decode_packs_0_valid),
    .io_i_decode_packs_0_pc(rename_io_i_decode_packs_0_pc),
    .io_i_decode_packs_0_inst(rename_io_i_decode_packs_0_inst),
    .io_i_decode_packs_0_func_code(rename_io_i_decode_packs_0_func_code),
    .io_i_decode_packs_0_branch_predict_pack_valid(rename_io_i_decode_packs_0_branch_predict_pack_valid),
    .io_i_decode_packs_0_branch_predict_pack_target(rename_io_i_decode_packs_0_branch_predict_pack_target),
    .io_i_decode_packs_0_branch_predict_pack_branch_type(rename_io_i_decode_packs_0_branch_predict_pack_branch_type),
    .io_i_decode_packs_0_branch_predict_pack_select(rename_io_i_decode_packs_0_branch_predict_pack_select),
    .io_i_decode_packs_0_branch_predict_pack_taken(rename_io_i_decode_packs_0_branch_predict_pack_taken),
    .io_i_decode_packs_0_arch_dst(rename_io_i_decode_packs_0_arch_dst),
    .io_i_decode_packs_0_inst_type(rename_io_i_decode_packs_0_inst_type),
    .io_i_decode_packs_0_regWen(rename_io_i_decode_packs_0_regWen),
    .io_i_decode_packs_0_src1_valid(rename_io_i_decode_packs_0_src1_valid),
    .io_i_decode_packs_0_arch_rs1(rename_io_i_decode_packs_0_arch_rs1),
    .io_i_decode_packs_0_src2_valid(rename_io_i_decode_packs_0_src2_valid),
    .io_i_decode_packs_0_arch_rs2(rename_io_i_decode_packs_0_arch_rs2),
    .io_i_decode_packs_0_imm(rename_io_i_decode_packs_0_imm),
    .io_i_decode_packs_0_src1_value(rename_io_i_decode_packs_0_src1_value),
    .io_i_decode_packs_0_src2_value(rename_io_i_decode_packs_0_src2_value),
    .io_i_decode_packs_0_op1_sel(rename_io_i_decode_packs_0_op1_sel),
    .io_i_decode_packs_0_op2_sel(rename_io_i_decode_packs_0_op2_sel),
    .io_i_decode_packs_0_alu_sel(rename_io_i_decode_packs_0_alu_sel),
    .io_i_decode_packs_0_branch_type(rename_io_i_decode_packs_0_branch_type),
    .io_i_decode_packs_0_mem_type(rename_io_i_decode_packs_0_mem_type),
    .io_i_decode_packs_1_valid(rename_io_i_decode_packs_1_valid),
    .io_i_decode_packs_1_pc(rename_io_i_decode_packs_1_pc),
    .io_i_decode_packs_1_inst(rename_io_i_decode_packs_1_inst),
    .io_i_decode_packs_1_func_code(rename_io_i_decode_packs_1_func_code),
    .io_i_decode_packs_1_branch_predict_pack_valid(rename_io_i_decode_packs_1_branch_predict_pack_valid),
    .io_i_decode_packs_1_branch_predict_pack_target(rename_io_i_decode_packs_1_branch_predict_pack_target),
    .io_i_decode_packs_1_branch_predict_pack_branch_type(rename_io_i_decode_packs_1_branch_predict_pack_branch_type),
    .io_i_decode_packs_1_branch_predict_pack_select(rename_io_i_decode_packs_1_branch_predict_pack_select),
    .io_i_decode_packs_1_branch_predict_pack_taken(rename_io_i_decode_packs_1_branch_predict_pack_taken),
    .io_i_decode_packs_1_arch_dst(rename_io_i_decode_packs_1_arch_dst),
    .io_i_decode_packs_1_inst_type(rename_io_i_decode_packs_1_inst_type),
    .io_i_decode_packs_1_regWen(rename_io_i_decode_packs_1_regWen),
    .io_i_decode_packs_1_src1_valid(rename_io_i_decode_packs_1_src1_valid),
    .io_i_decode_packs_1_arch_rs1(rename_io_i_decode_packs_1_arch_rs1),
    .io_i_decode_packs_1_src2_valid(rename_io_i_decode_packs_1_src2_valid),
    .io_i_decode_packs_1_arch_rs2(rename_io_i_decode_packs_1_arch_rs2),
    .io_i_decode_packs_1_imm(rename_io_i_decode_packs_1_imm),
    .io_i_decode_packs_1_src1_value(rename_io_i_decode_packs_1_src1_value),
    .io_i_decode_packs_1_src2_value(rename_io_i_decode_packs_1_src2_value),
    .io_i_decode_packs_1_op1_sel(rename_io_i_decode_packs_1_op1_sel),
    .io_i_decode_packs_1_op2_sel(rename_io_i_decode_packs_1_op2_sel),
    .io_i_decode_packs_1_alu_sel(rename_io_i_decode_packs_1_alu_sel),
    .io_i_decode_packs_1_branch_type(rename_io_i_decode_packs_1_branch_type),
    .io_i_decode_packs_1_mem_type(rename_io_i_decode_packs_1_mem_type),
    .io_i_commit_packs_0_valid(rename_io_i_commit_packs_0_valid),
    .io_i_commit_packs_0_uop_phy_dst(rename_io_i_commit_packs_0_uop_phy_dst),
    .io_i_commit_packs_0_uop_stale_dst(rename_io_i_commit_packs_0_uop_stale_dst),
    .io_i_commit_packs_0_uop_arch_dst(rename_io_i_commit_packs_0_uop_arch_dst),
    .io_i_commit_packs_1_valid(rename_io_i_commit_packs_1_valid),
    .io_i_commit_packs_1_uop_phy_dst(rename_io_i_commit_packs_1_uop_phy_dst),
    .io_i_commit_packs_1_uop_stale_dst(rename_io_i_commit_packs_1_uop_stale_dst),
    .io_i_commit_packs_1_uop_arch_dst(rename_io_i_commit_packs_1_uop_arch_dst),
    .io_i_rollback_packs_0_valid(rename_io_i_rollback_packs_0_valid),
    .io_i_rollback_packs_0_uop_phy_dst(rename_io_i_rollback_packs_0_uop_phy_dst),
    .io_i_rollback_packs_0_uop_stale_dst(rename_io_i_rollback_packs_0_uop_stale_dst),
    .io_i_rollback_packs_0_uop_arch_dst(rename_io_i_rollback_packs_0_uop_arch_dst),
    .io_i_rollback_packs_1_valid(rename_io_i_rollback_packs_1_valid),
    .io_i_rollback_packs_1_uop_phy_dst(rename_io_i_rollback_packs_1_uop_phy_dst),
    .io_i_rollback_packs_1_uop_stale_dst(rename_io_i_rollback_packs_1_uop_stale_dst),
    .io_i_rollback_packs_1_uop_arch_dst(rename_io_i_rollback_packs_1_uop_arch_dst),
    .io_i_flush_for_branch(rename_io_i_flush_for_branch),
    .io_o_free_list_empty(rename_io_o_free_list_empty),
    .io_o_rename_packs_0_valid(rename_io_o_rename_packs_0_valid),
    .io_o_rename_packs_0_pc(rename_io_o_rename_packs_0_pc),
    .io_o_rename_packs_0_inst(rename_io_o_rename_packs_0_inst),
    .io_o_rename_packs_0_func_code(rename_io_o_rename_packs_0_func_code),
    .io_o_rename_packs_0_branch_predict_pack_valid(rename_io_o_rename_packs_0_branch_predict_pack_valid),
    .io_o_rename_packs_0_branch_predict_pack_target(rename_io_o_rename_packs_0_branch_predict_pack_target),
    .io_o_rename_packs_0_branch_predict_pack_branch_type(rename_io_o_rename_packs_0_branch_predict_pack_branch_type),
    .io_o_rename_packs_0_branch_predict_pack_select(rename_io_o_rename_packs_0_branch_predict_pack_select),
    .io_o_rename_packs_0_branch_predict_pack_taken(rename_io_o_rename_packs_0_branch_predict_pack_taken),
    .io_o_rename_packs_0_phy_dst(rename_io_o_rename_packs_0_phy_dst),
    .io_o_rename_packs_0_stale_dst(rename_io_o_rename_packs_0_stale_dst),
    .io_o_rename_packs_0_arch_dst(rename_io_o_rename_packs_0_arch_dst),
    .io_o_rename_packs_0_inst_type(rename_io_o_rename_packs_0_inst_type),
    .io_o_rename_packs_0_regWen(rename_io_o_rename_packs_0_regWen),
    .io_o_rename_packs_0_src1_valid(rename_io_o_rename_packs_0_src1_valid),
    .io_o_rename_packs_0_phy_rs1(rename_io_o_rename_packs_0_phy_rs1),
    .io_o_rename_packs_0_arch_rs1(rename_io_o_rename_packs_0_arch_rs1),
    .io_o_rename_packs_0_src2_valid(rename_io_o_rename_packs_0_src2_valid),
    .io_o_rename_packs_0_phy_rs2(rename_io_o_rename_packs_0_phy_rs2),
    .io_o_rename_packs_0_arch_rs2(rename_io_o_rename_packs_0_arch_rs2),
    .io_o_rename_packs_0_imm(rename_io_o_rename_packs_0_imm),
    .io_o_rename_packs_0_src1_value(rename_io_o_rename_packs_0_src1_value),
    .io_o_rename_packs_0_src2_value(rename_io_o_rename_packs_0_src2_value),
    .io_o_rename_packs_0_op1_sel(rename_io_o_rename_packs_0_op1_sel),
    .io_o_rename_packs_0_op2_sel(rename_io_o_rename_packs_0_op2_sel),
    .io_o_rename_packs_0_alu_sel(rename_io_o_rename_packs_0_alu_sel),
    .io_o_rename_packs_0_branch_type(rename_io_o_rename_packs_0_branch_type),
    .io_o_rename_packs_0_mem_type(rename_io_o_rename_packs_0_mem_type),
    .io_o_rename_packs_1_valid(rename_io_o_rename_packs_1_valid),
    .io_o_rename_packs_1_pc(rename_io_o_rename_packs_1_pc),
    .io_o_rename_packs_1_inst(rename_io_o_rename_packs_1_inst),
    .io_o_rename_packs_1_func_code(rename_io_o_rename_packs_1_func_code),
    .io_o_rename_packs_1_branch_predict_pack_valid(rename_io_o_rename_packs_1_branch_predict_pack_valid),
    .io_o_rename_packs_1_branch_predict_pack_target(rename_io_o_rename_packs_1_branch_predict_pack_target),
    .io_o_rename_packs_1_branch_predict_pack_branch_type(rename_io_o_rename_packs_1_branch_predict_pack_branch_type),
    .io_o_rename_packs_1_branch_predict_pack_select(rename_io_o_rename_packs_1_branch_predict_pack_select),
    .io_o_rename_packs_1_branch_predict_pack_taken(rename_io_o_rename_packs_1_branch_predict_pack_taken),
    .io_o_rename_packs_1_phy_dst(rename_io_o_rename_packs_1_phy_dst),
    .io_o_rename_packs_1_stale_dst(rename_io_o_rename_packs_1_stale_dst),
    .io_o_rename_packs_1_arch_dst(rename_io_o_rename_packs_1_arch_dst),
    .io_o_rename_packs_1_inst_type(rename_io_o_rename_packs_1_inst_type),
    .io_o_rename_packs_1_regWen(rename_io_o_rename_packs_1_regWen),
    .io_o_rename_packs_1_src1_valid(rename_io_o_rename_packs_1_src1_valid),
    .io_o_rename_packs_1_phy_rs1(rename_io_o_rename_packs_1_phy_rs1),
    .io_o_rename_packs_1_arch_rs1(rename_io_o_rename_packs_1_arch_rs1),
    .io_o_rename_packs_1_src2_valid(rename_io_o_rename_packs_1_src2_valid),
    .io_o_rename_packs_1_phy_rs2(rename_io_o_rename_packs_1_phy_rs2),
    .io_o_rename_packs_1_arch_rs2(rename_io_o_rename_packs_1_arch_rs2),
    .io_o_rename_packs_1_imm(rename_io_o_rename_packs_1_imm),
    .io_o_rename_packs_1_src1_value(rename_io_o_rename_packs_1_src1_value),
    .io_o_rename_packs_1_src2_value(rename_io_o_rename_packs_1_src2_value),
    .io_o_rename_packs_1_op1_sel(rename_io_o_rename_packs_1_op1_sel),
    .io_o_rename_packs_1_op2_sel(rename_io_o_rename_packs_1_op2_sel),
    .io_o_rename_packs_1_alu_sel(rename_io_o_rename_packs_1_alu_sel),
    .io_o_rename_packs_1_branch_type(rename_io_o_rename_packs_1_branch_type),
    .io_o_rename_packs_1_mem_type(rename_io_o_rename_packs_1_mem_type),
    .io_o_written_back_table(rename_io_o_written_back_table),
    .io_i_exception(rename_io_i_exception),
    .io_i_stall(rename_io_i_stall),
    .io_o_commit_rename_table_0(rename_io_o_commit_rename_table_0),
    .io_o_commit_rename_table_1(rename_io_o_commit_rename_table_1),
    .io_o_commit_rename_table_2(rename_io_o_commit_rename_table_2),
    .io_o_commit_rename_table_3(rename_io_o_commit_rename_table_3),
    .io_o_commit_rename_table_4(rename_io_o_commit_rename_table_4),
    .io_o_commit_rename_table_5(rename_io_o_commit_rename_table_5),
    .io_o_commit_rename_table_6(rename_io_o_commit_rename_table_6),
    .io_o_commit_rename_table_7(rename_io_o_commit_rename_table_7),
    .io_o_commit_rename_table_8(rename_io_o_commit_rename_table_8),
    .io_o_commit_rename_table_9(rename_io_o_commit_rename_table_9),
    .io_o_commit_rename_table_10(rename_io_o_commit_rename_table_10),
    .io_o_commit_rename_table_11(rename_io_o_commit_rename_table_11),
    .io_o_commit_rename_table_12(rename_io_o_commit_rename_table_12),
    .io_o_commit_rename_table_13(rename_io_o_commit_rename_table_13),
    .io_o_commit_rename_table_14(rename_io_o_commit_rename_table_14),
    .io_o_commit_rename_table_15(rename_io_o_commit_rename_table_15),
    .io_o_commit_rename_table_16(rename_io_o_commit_rename_table_16),
    .io_o_commit_rename_table_17(rename_io_o_commit_rename_table_17),
    .io_o_commit_rename_table_18(rename_io_o_commit_rename_table_18),
    .io_o_commit_rename_table_19(rename_io_o_commit_rename_table_19),
    .io_o_commit_rename_table_20(rename_io_o_commit_rename_table_20),
    .io_o_commit_rename_table_21(rename_io_o_commit_rename_table_21),
    .io_o_commit_rename_table_22(rename_io_o_commit_rename_table_22),
    .io_o_commit_rename_table_23(rename_io_o_commit_rename_table_23),
    .io_o_commit_rename_table_24(rename_io_o_commit_rename_table_24),
    .io_o_commit_rename_table_25(rename_io_o_commit_rename_table_25),
    .io_o_commit_rename_table_26(rename_io_o_commit_rename_table_26),
    .io_o_commit_rename_table_27(rename_io_o_commit_rename_table_27),
    .io_o_commit_rename_table_28(rename_io_o_commit_rename_table_28),
    .io_o_commit_rename_table_29(rename_io_o_commit_rename_table_29),
    .io_o_commit_rename_table_30(rename_io_o_commit_rename_table_30),
    .io_o_commit_rename_table_31(rename_io_o_commit_rename_table_31)
  );
  Dispatch dispatch ( // @[backend_with_decode.scala 41:26]
    .clock(dispatch_clock),
    .reset(dispatch_reset),
    .io_i_rename_packs_0_valid(dispatch_io_i_rename_packs_0_valid),
    .io_i_rename_packs_0_pc(dispatch_io_i_rename_packs_0_pc),
    .io_i_rename_packs_0_inst(dispatch_io_i_rename_packs_0_inst),
    .io_i_rename_packs_0_func_code(dispatch_io_i_rename_packs_0_func_code),
    .io_i_rename_packs_0_branch_predict_pack_valid(dispatch_io_i_rename_packs_0_branch_predict_pack_valid),
    .io_i_rename_packs_0_branch_predict_pack_target(dispatch_io_i_rename_packs_0_branch_predict_pack_target),
    .io_i_rename_packs_0_branch_predict_pack_branch_type(dispatch_io_i_rename_packs_0_branch_predict_pack_branch_type),
    .io_i_rename_packs_0_branch_predict_pack_select(dispatch_io_i_rename_packs_0_branch_predict_pack_select),
    .io_i_rename_packs_0_branch_predict_pack_taken(dispatch_io_i_rename_packs_0_branch_predict_pack_taken),
    .io_i_rename_packs_0_phy_dst(dispatch_io_i_rename_packs_0_phy_dst),
    .io_i_rename_packs_0_stale_dst(dispatch_io_i_rename_packs_0_stale_dst),
    .io_i_rename_packs_0_arch_dst(dispatch_io_i_rename_packs_0_arch_dst),
    .io_i_rename_packs_0_inst_type(dispatch_io_i_rename_packs_0_inst_type),
    .io_i_rename_packs_0_regWen(dispatch_io_i_rename_packs_0_regWen),
    .io_i_rename_packs_0_src1_valid(dispatch_io_i_rename_packs_0_src1_valid),
    .io_i_rename_packs_0_phy_rs1(dispatch_io_i_rename_packs_0_phy_rs1),
    .io_i_rename_packs_0_arch_rs1(dispatch_io_i_rename_packs_0_arch_rs1),
    .io_i_rename_packs_0_src2_valid(dispatch_io_i_rename_packs_0_src2_valid),
    .io_i_rename_packs_0_phy_rs2(dispatch_io_i_rename_packs_0_phy_rs2),
    .io_i_rename_packs_0_arch_rs2(dispatch_io_i_rename_packs_0_arch_rs2),
    .io_i_rename_packs_0_imm(dispatch_io_i_rename_packs_0_imm),
    .io_i_rename_packs_0_src1_value(dispatch_io_i_rename_packs_0_src1_value),
    .io_i_rename_packs_0_src2_value(dispatch_io_i_rename_packs_0_src2_value),
    .io_i_rename_packs_0_op1_sel(dispatch_io_i_rename_packs_0_op1_sel),
    .io_i_rename_packs_0_op2_sel(dispatch_io_i_rename_packs_0_op2_sel),
    .io_i_rename_packs_0_alu_sel(dispatch_io_i_rename_packs_0_alu_sel),
    .io_i_rename_packs_0_branch_type(dispatch_io_i_rename_packs_0_branch_type),
    .io_i_rename_packs_0_mem_type(dispatch_io_i_rename_packs_0_mem_type),
    .io_i_rename_packs_1_valid(dispatch_io_i_rename_packs_1_valid),
    .io_i_rename_packs_1_pc(dispatch_io_i_rename_packs_1_pc),
    .io_i_rename_packs_1_inst(dispatch_io_i_rename_packs_1_inst),
    .io_i_rename_packs_1_func_code(dispatch_io_i_rename_packs_1_func_code),
    .io_i_rename_packs_1_branch_predict_pack_valid(dispatch_io_i_rename_packs_1_branch_predict_pack_valid),
    .io_i_rename_packs_1_branch_predict_pack_target(dispatch_io_i_rename_packs_1_branch_predict_pack_target),
    .io_i_rename_packs_1_branch_predict_pack_branch_type(dispatch_io_i_rename_packs_1_branch_predict_pack_branch_type),
    .io_i_rename_packs_1_branch_predict_pack_select(dispatch_io_i_rename_packs_1_branch_predict_pack_select),
    .io_i_rename_packs_1_branch_predict_pack_taken(dispatch_io_i_rename_packs_1_branch_predict_pack_taken),
    .io_i_rename_packs_1_phy_dst(dispatch_io_i_rename_packs_1_phy_dst),
    .io_i_rename_packs_1_stale_dst(dispatch_io_i_rename_packs_1_stale_dst),
    .io_i_rename_packs_1_arch_dst(dispatch_io_i_rename_packs_1_arch_dst),
    .io_i_rename_packs_1_inst_type(dispatch_io_i_rename_packs_1_inst_type),
    .io_i_rename_packs_1_regWen(dispatch_io_i_rename_packs_1_regWen),
    .io_i_rename_packs_1_src1_valid(dispatch_io_i_rename_packs_1_src1_valid),
    .io_i_rename_packs_1_phy_rs1(dispatch_io_i_rename_packs_1_phy_rs1),
    .io_i_rename_packs_1_arch_rs1(dispatch_io_i_rename_packs_1_arch_rs1),
    .io_i_rename_packs_1_src2_valid(dispatch_io_i_rename_packs_1_src2_valid),
    .io_i_rename_packs_1_phy_rs2(dispatch_io_i_rename_packs_1_phy_rs2),
    .io_i_rename_packs_1_arch_rs2(dispatch_io_i_rename_packs_1_arch_rs2),
    .io_i_rename_packs_1_imm(dispatch_io_i_rename_packs_1_imm),
    .io_i_rename_packs_1_src1_value(dispatch_io_i_rename_packs_1_src1_value),
    .io_i_rename_packs_1_src2_value(dispatch_io_i_rename_packs_1_src2_value),
    .io_i_rename_packs_1_op1_sel(dispatch_io_i_rename_packs_1_op1_sel),
    .io_i_rename_packs_1_op2_sel(dispatch_io_i_rename_packs_1_op2_sel),
    .io_i_rename_packs_1_alu_sel(dispatch_io_i_rename_packs_1_alu_sel),
    .io_i_rename_packs_1_branch_type(dispatch_io_i_rename_packs_1_branch_type),
    .io_i_rename_packs_1_mem_type(dispatch_io_i_rename_packs_1_mem_type),
    .io_i_rob_busy(dispatch_io_i_rob_busy),
    .io_i_rob_allocation_ress_0_rob_idx(dispatch_io_i_rob_allocation_ress_0_rob_idx),
    .io_i_rob_allocation_ress_1_rob_idx(dispatch_io_i_rob_allocation_ress_1_rob_idx),
    .io_i_reservation_station_full(dispatch_io_i_reservation_station_full),
    .io_i_branch_resolve_pack_valid(dispatch_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(dispatch_io_i_branch_resolve_pack_mispred),
    .io_o_rob_allocation_reqs_0_valid(dispatch_io_o_rob_allocation_reqs_0_valid),
    .io_o_rob_allocation_reqs_0_uop_valid(dispatch_io_o_rob_allocation_reqs_0_uop_valid),
    .io_o_rob_allocation_reqs_0_uop_pc(dispatch_io_o_rob_allocation_reqs_0_uop_pc),
    .io_o_rob_allocation_reqs_0_uop_inst(dispatch_io_o_rob_allocation_reqs_0_uop_inst),
    .io_o_rob_allocation_reqs_0_uop_func_code(dispatch_io_o_rob_allocation_reqs_0_uop_func_code),
    .io_o_rob_allocation_reqs_0_uop_branch_predict_pack_valid(
      dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_valid),
    .io_o_rob_allocation_reqs_0_uop_branch_predict_pack_target(
      dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_target),
    .io_o_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type(
      dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type),
    .io_o_rob_allocation_reqs_0_uop_branch_predict_pack_select(
      dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_select),
    .io_o_rob_allocation_reqs_0_uop_branch_predict_pack_taken(
      dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_taken),
    .io_o_rob_allocation_reqs_0_uop_phy_dst(dispatch_io_o_rob_allocation_reqs_0_uop_phy_dst),
    .io_o_rob_allocation_reqs_0_uop_stale_dst(dispatch_io_o_rob_allocation_reqs_0_uop_stale_dst),
    .io_o_rob_allocation_reqs_0_uop_arch_dst(dispatch_io_o_rob_allocation_reqs_0_uop_arch_dst),
    .io_o_rob_allocation_reqs_0_uop_inst_type(dispatch_io_o_rob_allocation_reqs_0_uop_inst_type),
    .io_o_rob_allocation_reqs_0_uop_regWen(dispatch_io_o_rob_allocation_reqs_0_uop_regWen),
    .io_o_rob_allocation_reqs_0_uop_src1_valid(dispatch_io_o_rob_allocation_reqs_0_uop_src1_valid),
    .io_o_rob_allocation_reqs_0_uop_phy_rs1(dispatch_io_o_rob_allocation_reqs_0_uop_phy_rs1),
    .io_o_rob_allocation_reqs_0_uop_arch_rs1(dispatch_io_o_rob_allocation_reqs_0_uop_arch_rs1),
    .io_o_rob_allocation_reqs_0_uop_src2_valid(dispatch_io_o_rob_allocation_reqs_0_uop_src2_valid),
    .io_o_rob_allocation_reqs_0_uop_phy_rs2(dispatch_io_o_rob_allocation_reqs_0_uop_phy_rs2),
    .io_o_rob_allocation_reqs_0_uop_arch_rs2(dispatch_io_o_rob_allocation_reqs_0_uop_arch_rs2),
    .io_o_rob_allocation_reqs_0_uop_imm(dispatch_io_o_rob_allocation_reqs_0_uop_imm),
    .io_o_rob_allocation_reqs_0_uop_src1_value(dispatch_io_o_rob_allocation_reqs_0_uop_src1_value),
    .io_o_rob_allocation_reqs_0_uop_src2_value(dispatch_io_o_rob_allocation_reqs_0_uop_src2_value),
    .io_o_rob_allocation_reqs_0_uop_op1_sel(dispatch_io_o_rob_allocation_reqs_0_uop_op1_sel),
    .io_o_rob_allocation_reqs_0_uop_op2_sel(dispatch_io_o_rob_allocation_reqs_0_uop_op2_sel),
    .io_o_rob_allocation_reqs_0_uop_alu_sel(dispatch_io_o_rob_allocation_reqs_0_uop_alu_sel),
    .io_o_rob_allocation_reqs_0_uop_branch_type(dispatch_io_o_rob_allocation_reqs_0_uop_branch_type),
    .io_o_rob_allocation_reqs_0_uop_mem_type(dispatch_io_o_rob_allocation_reqs_0_uop_mem_type),
    .io_o_rob_allocation_reqs_1_valid(dispatch_io_o_rob_allocation_reqs_1_valid),
    .io_o_rob_allocation_reqs_1_uop_valid(dispatch_io_o_rob_allocation_reqs_1_uop_valid),
    .io_o_rob_allocation_reqs_1_uop_pc(dispatch_io_o_rob_allocation_reqs_1_uop_pc),
    .io_o_rob_allocation_reqs_1_uop_inst(dispatch_io_o_rob_allocation_reqs_1_uop_inst),
    .io_o_rob_allocation_reqs_1_uop_func_code(dispatch_io_o_rob_allocation_reqs_1_uop_func_code),
    .io_o_rob_allocation_reqs_1_uop_branch_predict_pack_valid(
      dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_valid),
    .io_o_rob_allocation_reqs_1_uop_branch_predict_pack_target(
      dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_target),
    .io_o_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type(
      dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type),
    .io_o_rob_allocation_reqs_1_uop_branch_predict_pack_select(
      dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_select),
    .io_o_rob_allocation_reqs_1_uop_branch_predict_pack_taken(
      dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_taken),
    .io_o_rob_allocation_reqs_1_uop_phy_dst(dispatch_io_o_rob_allocation_reqs_1_uop_phy_dst),
    .io_o_rob_allocation_reqs_1_uop_stale_dst(dispatch_io_o_rob_allocation_reqs_1_uop_stale_dst),
    .io_o_rob_allocation_reqs_1_uop_arch_dst(dispatch_io_o_rob_allocation_reqs_1_uop_arch_dst),
    .io_o_rob_allocation_reqs_1_uop_inst_type(dispatch_io_o_rob_allocation_reqs_1_uop_inst_type),
    .io_o_rob_allocation_reqs_1_uop_regWen(dispatch_io_o_rob_allocation_reqs_1_uop_regWen),
    .io_o_rob_allocation_reqs_1_uop_src1_valid(dispatch_io_o_rob_allocation_reqs_1_uop_src1_valid),
    .io_o_rob_allocation_reqs_1_uop_phy_rs1(dispatch_io_o_rob_allocation_reqs_1_uop_phy_rs1),
    .io_o_rob_allocation_reqs_1_uop_arch_rs1(dispatch_io_o_rob_allocation_reqs_1_uop_arch_rs1),
    .io_o_rob_allocation_reqs_1_uop_src2_valid(dispatch_io_o_rob_allocation_reqs_1_uop_src2_valid),
    .io_o_rob_allocation_reqs_1_uop_phy_rs2(dispatch_io_o_rob_allocation_reqs_1_uop_phy_rs2),
    .io_o_rob_allocation_reqs_1_uop_arch_rs2(dispatch_io_o_rob_allocation_reqs_1_uop_arch_rs2),
    .io_o_rob_allocation_reqs_1_uop_imm(dispatch_io_o_rob_allocation_reqs_1_uop_imm),
    .io_o_rob_allocation_reqs_1_uop_src1_value(dispatch_io_o_rob_allocation_reqs_1_uop_src1_value),
    .io_o_rob_allocation_reqs_1_uop_src2_value(dispatch_io_o_rob_allocation_reqs_1_uop_src2_value),
    .io_o_rob_allocation_reqs_1_uop_op1_sel(dispatch_io_o_rob_allocation_reqs_1_uop_op1_sel),
    .io_o_rob_allocation_reqs_1_uop_op2_sel(dispatch_io_o_rob_allocation_reqs_1_uop_op2_sel),
    .io_o_rob_allocation_reqs_1_uop_alu_sel(dispatch_io_o_rob_allocation_reqs_1_uop_alu_sel),
    .io_o_rob_allocation_reqs_1_uop_branch_type(dispatch_io_o_rob_allocation_reqs_1_uop_branch_type),
    .io_o_rob_allocation_reqs_1_uop_mem_type(dispatch_io_o_rob_allocation_reqs_1_uop_mem_type),
    .io_o_dispatch_packs_0_valid(dispatch_io_o_dispatch_packs_0_valid),
    .io_o_dispatch_packs_0_pc(dispatch_io_o_dispatch_packs_0_pc),
    .io_o_dispatch_packs_0_inst(dispatch_io_o_dispatch_packs_0_inst),
    .io_o_dispatch_packs_0_func_code(dispatch_io_o_dispatch_packs_0_func_code),
    .io_o_dispatch_packs_0_branch_predict_pack_valid(dispatch_io_o_dispatch_packs_0_branch_predict_pack_valid),
    .io_o_dispatch_packs_0_branch_predict_pack_target(dispatch_io_o_dispatch_packs_0_branch_predict_pack_target),
    .io_o_dispatch_packs_0_branch_predict_pack_branch_type(
      dispatch_io_o_dispatch_packs_0_branch_predict_pack_branch_type),
    .io_o_dispatch_packs_0_branch_predict_pack_select(dispatch_io_o_dispatch_packs_0_branch_predict_pack_select),
    .io_o_dispatch_packs_0_branch_predict_pack_taken(dispatch_io_o_dispatch_packs_0_branch_predict_pack_taken),
    .io_o_dispatch_packs_0_phy_dst(dispatch_io_o_dispatch_packs_0_phy_dst),
    .io_o_dispatch_packs_0_stale_dst(dispatch_io_o_dispatch_packs_0_stale_dst),
    .io_o_dispatch_packs_0_arch_dst(dispatch_io_o_dispatch_packs_0_arch_dst),
    .io_o_dispatch_packs_0_inst_type(dispatch_io_o_dispatch_packs_0_inst_type),
    .io_o_dispatch_packs_0_regWen(dispatch_io_o_dispatch_packs_0_regWen),
    .io_o_dispatch_packs_0_src1_valid(dispatch_io_o_dispatch_packs_0_src1_valid),
    .io_o_dispatch_packs_0_phy_rs1(dispatch_io_o_dispatch_packs_0_phy_rs1),
    .io_o_dispatch_packs_0_arch_rs1(dispatch_io_o_dispatch_packs_0_arch_rs1),
    .io_o_dispatch_packs_0_src2_valid(dispatch_io_o_dispatch_packs_0_src2_valid),
    .io_o_dispatch_packs_0_phy_rs2(dispatch_io_o_dispatch_packs_0_phy_rs2),
    .io_o_dispatch_packs_0_arch_rs2(dispatch_io_o_dispatch_packs_0_arch_rs2),
    .io_o_dispatch_packs_0_rob_idx(dispatch_io_o_dispatch_packs_0_rob_idx),
    .io_o_dispatch_packs_0_imm(dispatch_io_o_dispatch_packs_0_imm),
    .io_o_dispatch_packs_0_src1_value(dispatch_io_o_dispatch_packs_0_src1_value),
    .io_o_dispatch_packs_0_src2_value(dispatch_io_o_dispatch_packs_0_src2_value),
    .io_o_dispatch_packs_0_op1_sel(dispatch_io_o_dispatch_packs_0_op1_sel),
    .io_o_dispatch_packs_0_op2_sel(dispatch_io_o_dispatch_packs_0_op2_sel),
    .io_o_dispatch_packs_0_alu_sel(dispatch_io_o_dispatch_packs_0_alu_sel),
    .io_o_dispatch_packs_0_branch_type(dispatch_io_o_dispatch_packs_0_branch_type),
    .io_o_dispatch_packs_0_mem_type(dispatch_io_o_dispatch_packs_0_mem_type),
    .io_o_dispatch_packs_1_valid(dispatch_io_o_dispatch_packs_1_valid),
    .io_o_dispatch_packs_1_pc(dispatch_io_o_dispatch_packs_1_pc),
    .io_o_dispatch_packs_1_inst(dispatch_io_o_dispatch_packs_1_inst),
    .io_o_dispatch_packs_1_func_code(dispatch_io_o_dispatch_packs_1_func_code),
    .io_o_dispatch_packs_1_branch_predict_pack_valid(dispatch_io_o_dispatch_packs_1_branch_predict_pack_valid),
    .io_o_dispatch_packs_1_branch_predict_pack_target(dispatch_io_o_dispatch_packs_1_branch_predict_pack_target),
    .io_o_dispatch_packs_1_branch_predict_pack_branch_type(
      dispatch_io_o_dispatch_packs_1_branch_predict_pack_branch_type),
    .io_o_dispatch_packs_1_branch_predict_pack_select(dispatch_io_o_dispatch_packs_1_branch_predict_pack_select),
    .io_o_dispatch_packs_1_branch_predict_pack_taken(dispatch_io_o_dispatch_packs_1_branch_predict_pack_taken),
    .io_o_dispatch_packs_1_phy_dst(dispatch_io_o_dispatch_packs_1_phy_dst),
    .io_o_dispatch_packs_1_stale_dst(dispatch_io_o_dispatch_packs_1_stale_dst),
    .io_o_dispatch_packs_1_arch_dst(dispatch_io_o_dispatch_packs_1_arch_dst),
    .io_o_dispatch_packs_1_inst_type(dispatch_io_o_dispatch_packs_1_inst_type),
    .io_o_dispatch_packs_1_regWen(dispatch_io_o_dispatch_packs_1_regWen),
    .io_o_dispatch_packs_1_src1_valid(dispatch_io_o_dispatch_packs_1_src1_valid),
    .io_o_dispatch_packs_1_phy_rs1(dispatch_io_o_dispatch_packs_1_phy_rs1),
    .io_o_dispatch_packs_1_arch_rs1(dispatch_io_o_dispatch_packs_1_arch_rs1),
    .io_o_dispatch_packs_1_src2_valid(dispatch_io_o_dispatch_packs_1_src2_valid),
    .io_o_dispatch_packs_1_phy_rs2(dispatch_io_o_dispatch_packs_1_phy_rs2),
    .io_o_dispatch_packs_1_arch_rs2(dispatch_io_o_dispatch_packs_1_arch_rs2),
    .io_o_dispatch_packs_1_rob_idx(dispatch_io_o_dispatch_packs_1_rob_idx),
    .io_o_dispatch_packs_1_imm(dispatch_io_o_dispatch_packs_1_imm),
    .io_o_dispatch_packs_1_src1_value(dispatch_io_o_dispatch_packs_1_src1_value),
    .io_o_dispatch_packs_1_src2_value(dispatch_io_o_dispatch_packs_1_src2_value),
    .io_o_dispatch_packs_1_op1_sel(dispatch_io_o_dispatch_packs_1_op1_sel),
    .io_o_dispatch_packs_1_op2_sel(dispatch_io_o_dispatch_packs_1_op2_sel),
    .io_o_dispatch_packs_1_alu_sel(dispatch_io_o_dispatch_packs_1_alu_sel),
    .io_o_dispatch_packs_1_branch_type(dispatch_io_o_dispatch_packs_1_branch_type),
    .io_o_dispatch_packs_1_mem_type(dispatch_io_o_dispatch_packs_1_mem_type),
    .io_i_exception(dispatch_io_i_exception)
  );
  Reservation_Station reservation_station ( // @[backend_with_decode.scala 42:37]
    .clock(reservation_station_clock),
    .reset(reservation_station_reset),
    .io_i_dispatch_packs_0_valid(reservation_station_io_i_dispatch_packs_0_valid),
    .io_i_dispatch_packs_0_pc(reservation_station_io_i_dispatch_packs_0_pc),
    .io_i_dispatch_packs_0_inst(reservation_station_io_i_dispatch_packs_0_inst),
    .io_i_dispatch_packs_0_func_code(reservation_station_io_i_dispatch_packs_0_func_code),
    .io_i_dispatch_packs_0_branch_predict_pack_valid(reservation_station_io_i_dispatch_packs_0_branch_predict_pack_valid
      ),
    .io_i_dispatch_packs_0_branch_predict_pack_target(
      reservation_station_io_i_dispatch_packs_0_branch_predict_pack_target),
    .io_i_dispatch_packs_0_branch_predict_pack_branch_type(
      reservation_station_io_i_dispatch_packs_0_branch_predict_pack_branch_type),
    .io_i_dispatch_packs_0_branch_predict_pack_select(
      reservation_station_io_i_dispatch_packs_0_branch_predict_pack_select),
    .io_i_dispatch_packs_0_branch_predict_pack_taken(reservation_station_io_i_dispatch_packs_0_branch_predict_pack_taken
      ),
    .io_i_dispatch_packs_0_phy_dst(reservation_station_io_i_dispatch_packs_0_phy_dst),
    .io_i_dispatch_packs_0_stale_dst(reservation_station_io_i_dispatch_packs_0_stale_dst),
    .io_i_dispatch_packs_0_arch_dst(reservation_station_io_i_dispatch_packs_0_arch_dst),
    .io_i_dispatch_packs_0_inst_type(reservation_station_io_i_dispatch_packs_0_inst_type),
    .io_i_dispatch_packs_0_regWen(reservation_station_io_i_dispatch_packs_0_regWen),
    .io_i_dispatch_packs_0_src1_valid(reservation_station_io_i_dispatch_packs_0_src1_valid),
    .io_i_dispatch_packs_0_phy_rs1(reservation_station_io_i_dispatch_packs_0_phy_rs1),
    .io_i_dispatch_packs_0_arch_rs1(reservation_station_io_i_dispatch_packs_0_arch_rs1),
    .io_i_dispatch_packs_0_src2_valid(reservation_station_io_i_dispatch_packs_0_src2_valid),
    .io_i_dispatch_packs_0_phy_rs2(reservation_station_io_i_dispatch_packs_0_phy_rs2),
    .io_i_dispatch_packs_0_arch_rs2(reservation_station_io_i_dispatch_packs_0_arch_rs2),
    .io_i_dispatch_packs_0_rob_idx(reservation_station_io_i_dispatch_packs_0_rob_idx),
    .io_i_dispatch_packs_0_imm(reservation_station_io_i_dispatch_packs_0_imm),
    .io_i_dispatch_packs_0_src1_value(reservation_station_io_i_dispatch_packs_0_src1_value),
    .io_i_dispatch_packs_0_src2_value(reservation_station_io_i_dispatch_packs_0_src2_value),
    .io_i_dispatch_packs_0_op1_sel(reservation_station_io_i_dispatch_packs_0_op1_sel),
    .io_i_dispatch_packs_0_op2_sel(reservation_station_io_i_dispatch_packs_0_op2_sel),
    .io_i_dispatch_packs_0_alu_sel(reservation_station_io_i_dispatch_packs_0_alu_sel),
    .io_i_dispatch_packs_0_branch_type(reservation_station_io_i_dispatch_packs_0_branch_type),
    .io_i_dispatch_packs_0_mem_type(reservation_station_io_i_dispatch_packs_0_mem_type),
    .io_i_dispatch_packs_1_valid(reservation_station_io_i_dispatch_packs_1_valid),
    .io_i_dispatch_packs_1_pc(reservation_station_io_i_dispatch_packs_1_pc),
    .io_i_dispatch_packs_1_inst(reservation_station_io_i_dispatch_packs_1_inst),
    .io_i_dispatch_packs_1_func_code(reservation_station_io_i_dispatch_packs_1_func_code),
    .io_i_dispatch_packs_1_branch_predict_pack_valid(reservation_station_io_i_dispatch_packs_1_branch_predict_pack_valid
      ),
    .io_i_dispatch_packs_1_branch_predict_pack_target(
      reservation_station_io_i_dispatch_packs_1_branch_predict_pack_target),
    .io_i_dispatch_packs_1_branch_predict_pack_branch_type(
      reservation_station_io_i_dispatch_packs_1_branch_predict_pack_branch_type),
    .io_i_dispatch_packs_1_branch_predict_pack_select(
      reservation_station_io_i_dispatch_packs_1_branch_predict_pack_select),
    .io_i_dispatch_packs_1_branch_predict_pack_taken(reservation_station_io_i_dispatch_packs_1_branch_predict_pack_taken
      ),
    .io_i_dispatch_packs_1_phy_dst(reservation_station_io_i_dispatch_packs_1_phy_dst),
    .io_i_dispatch_packs_1_stale_dst(reservation_station_io_i_dispatch_packs_1_stale_dst),
    .io_i_dispatch_packs_1_arch_dst(reservation_station_io_i_dispatch_packs_1_arch_dst),
    .io_i_dispatch_packs_1_inst_type(reservation_station_io_i_dispatch_packs_1_inst_type),
    .io_i_dispatch_packs_1_regWen(reservation_station_io_i_dispatch_packs_1_regWen),
    .io_i_dispatch_packs_1_src1_valid(reservation_station_io_i_dispatch_packs_1_src1_valid),
    .io_i_dispatch_packs_1_phy_rs1(reservation_station_io_i_dispatch_packs_1_phy_rs1),
    .io_i_dispatch_packs_1_arch_rs1(reservation_station_io_i_dispatch_packs_1_arch_rs1),
    .io_i_dispatch_packs_1_src2_valid(reservation_station_io_i_dispatch_packs_1_src2_valid),
    .io_i_dispatch_packs_1_phy_rs2(reservation_station_io_i_dispatch_packs_1_phy_rs2),
    .io_i_dispatch_packs_1_arch_rs2(reservation_station_io_i_dispatch_packs_1_arch_rs2),
    .io_i_dispatch_packs_1_rob_idx(reservation_station_io_i_dispatch_packs_1_rob_idx),
    .io_i_dispatch_packs_1_imm(reservation_station_io_i_dispatch_packs_1_imm),
    .io_i_dispatch_packs_1_src1_value(reservation_station_io_i_dispatch_packs_1_src1_value),
    .io_i_dispatch_packs_1_src2_value(reservation_station_io_i_dispatch_packs_1_src2_value),
    .io_i_dispatch_packs_1_op1_sel(reservation_station_io_i_dispatch_packs_1_op1_sel),
    .io_i_dispatch_packs_1_op2_sel(reservation_station_io_i_dispatch_packs_1_op2_sel),
    .io_i_dispatch_packs_1_alu_sel(reservation_station_io_i_dispatch_packs_1_alu_sel),
    .io_i_dispatch_packs_1_branch_type(reservation_station_io_i_dispatch_packs_1_branch_type),
    .io_i_dispatch_packs_1_mem_type(reservation_station_io_i_dispatch_packs_1_mem_type),
    .io_o_issue_packs_0_valid(reservation_station_io_o_issue_packs_0_valid),
    .io_o_issue_packs_0_pc(reservation_station_io_o_issue_packs_0_pc),
    .io_o_issue_packs_0_inst(reservation_station_io_o_issue_packs_0_inst),
    .io_o_issue_packs_0_func_code(reservation_station_io_o_issue_packs_0_func_code),
    .io_o_issue_packs_0_branch_predict_pack_valid(reservation_station_io_o_issue_packs_0_branch_predict_pack_valid),
    .io_o_issue_packs_0_branch_predict_pack_target(reservation_station_io_o_issue_packs_0_branch_predict_pack_target),
    .io_o_issue_packs_0_branch_predict_pack_branch_type(
      reservation_station_io_o_issue_packs_0_branch_predict_pack_branch_type),
    .io_o_issue_packs_0_branch_predict_pack_select(reservation_station_io_o_issue_packs_0_branch_predict_pack_select),
    .io_o_issue_packs_0_branch_predict_pack_taken(reservation_station_io_o_issue_packs_0_branch_predict_pack_taken),
    .io_o_issue_packs_0_phy_dst(reservation_station_io_o_issue_packs_0_phy_dst),
    .io_o_issue_packs_0_stale_dst(reservation_station_io_o_issue_packs_0_stale_dst),
    .io_o_issue_packs_0_arch_dst(reservation_station_io_o_issue_packs_0_arch_dst),
    .io_o_issue_packs_0_inst_type(reservation_station_io_o_issue_packs_0_inst_type),
    .io_o_issue_packs_0_regWen(reservation_station_io_o_issue_packs_0_regWen),
    .io_o_issue_packs_0_src1_valid(reservation_station_io_o_issue_packs_0_src1_valid),
    .io_o_issue_packs_0_phy_rs1(reservation_station_io_o_issue_packs_0_phy_rs1),
    .io_o_issue_packs_0_arch_rs1(reservation_station_io_o_issue_packs_0_arch_rs1),
    .io_o_issue_packs_0_src2_valid(reservation_station_io_o_issue_packs_0_src2_valid),
    .io_o_issue_packs_0_phy_rs2(reservation_station_io_o_issue_packs_0_phy_rs2),
    .io_o_issue_packs_0_arch_rs2(reservation_station_io_o_issue_packs_0_arch_rs2),
    .io_o_issue_packs_0_rob_idx(reservation_station_io_o_issue_packs_0_rob_idx),
    .io_o_issue_packs_0_imm(reservation_station_io_o_issue_packs_0_imm),
    .io_o_issue_packs_0_src1_value(reservation_station_io_o_issue_packs_0_src1_value),
    .io_o_issue_packs_0_src2_value(reservation_station_io_o_issue_packs_0_src2_value),
    .io_o_issue_packs_0_op1_sel(reservation_station_io_o_issue_packs_0_op1_sel),
    .io_o_issue_packs_0_op2_sel(reservation_station_io_o_issue_packs_0_op2_sel),
    .io_o_issue_packs_0_alu_sel(reservation_station_io_o_issue_packs_0_alu_sel),
    .io_o_issue_packs_0_branch_type(reservation_station_io_o_issue_packs_0_branch_type),
    .io_o_issue_packs_0_mem_type(reservation_station_io_o_issue_packs_0_mem_type),
    .io_o_issue_packs_1_valid(reservation_station_io_o_issue_packs_1_valid),
    .io_o_issue_packs_1_pc(reservation_station_io_o_issue_packs_1_pc),
    .io_o_issue_packs_1_inst(reservation_station_io_o_issue_packs_1_inst),
    .io_o_issue_packs_1_func_code(reservation_station_io_o_issue_packs_1_func_code),
    .io_o_issue_packs_1_branch_predict_pack_valid(reservation_station_io_o_issue_packs_1_branch_predict_pack_valid),
    .io_o_issue_packs_1_branch_predict_pack_target(reservation_station_io_o_issue_packs_1_branch_predict_pack_target),
    .io_o_issue_packs_1_branch_predict_pack_branch_type(
      reservation_station_io_o_issue_packs_1_branch_predict_pack_branch_type),
    .io_o_issue_packs_1_branch_predict_pack_select(reservation_station_io_o_issue_packs_1_branch_predict_pack_select),
    .io_o_issue_packs_1_branch_predict_pack_taken(reservation_station_io_o_issue_packs_1_branch_predict_pack_taken),
    .io_o_issue_packs_1_phy_dst(reservation_station_io_o_issue_packs_1_phy_dst),
    .io_o_issue_packs_1_stale_dst(reservation_station_io_o_issue_packs_1_stale_dst),
    .io_o_issue_packs_1_arch_dst(reservation_station_io_o_issue_packs_1_arch_dst),
    .io_o_issue_packs_1_inst_type(reservation_station_io_o_issue_packs_1_inst_type),
    .io_o_issue_packs_1_regWen(reservation_station_io_o_issue_packs_1_regWen),
    .io_o_issue_packs_1_src1_valid(reservation_station_io_o_issue_packs_1_src1_valid),
    .io_o_issue_packs_1_phy_rs1(reservation_station_io_o_issue_packs_1_phy_rs1),
    .io_o_issue_packs_1_arch_rs1(reservation_station_io_o_issue_packs_1_arch_rs1),
    .io_o_issue_packs_1_src2_valid(reservation_station_io_o_issue_packs_1_src2_valid),
    .io_o_issue_packs_1_phy_rs2(reservation_station_io_o_issue_packs_1_phy_rs2),
    .io_o_issue_packs_1_arch_rs2(reservation_station_io_o_issue_packs_1_arch_rs2),
    .io_o_issue_packs_1_rob_idx(reservation_station_io_o_issue_packs_1_rob_idx),
    .io_o_issue_packs_1_imm(reservation_station_io_o_issue_packs_1_imm),
    .io_o_issue_packs_1_src1_value(reservation_station_io_o_issue_packs_1_src1_value),
    .io_o_issue_packs_1_src2_value(reservation_station_io_o_issue_packs_1_src2_value),
    .io_o_issue_packs_1_op1_sel(reservation_station_io_o_issue_packs_1_op1_sel),
    .io_o_issue_packs_1_op2_sel(reservation_station_io_o_issue_packs_1_op2_sel),
    .io_o_issue_packs_1_alu_sel(reservation_station_io_o_issue_packs_1_alu_sel),
    .io_o_issue_packs_1_branch_type(reservation_station_io_o_issue_packs_1_branch_type),
    .io_o_issue_packs_1_mem_type(reservation_station_io_o_issue_packs_1_mem_type),
    .io_i_wakeup_port(reservation_station_io_i_wakeup_port),
    .io_i_ex_res_packs_0_valid(reservation_station_io_i_ex_res_packs_0_valid),
    .io_i_ex_res_packs_0_uop_func_code(reservation_station_io_i_ex_res_packs_0_uop_func_code),
    .io_i_ex_res_packs_0_uop_phy_dst(reservation_station_io_i_ex_res_packs_0_uop_phy_dst),
    .io_i_ex_res_packs_0_uop_dst_value(reservation_station_io_i_ex_res_packs_0_uop_dst_value),
    .io_i_ex_res_packs_1_valid(reservation_station_io_i_ex_res_packs_1_valid),
    .io_i_ex_res_packs_1_uop_func_code(reservation_station_io_i_ex_res_packs_1_uop_func_code),
    .io_i_ex_res_packs_1_uop_phy_dst(reservation_station_io_i_ex_res_packs_1_uop_phy_dst),
    .io_i_ex_res_packs_1_uop_dst_value(reservation_station_io_i_ex_res_packs_1_uop_dst_value),
    .io_i_branch_resolve_pack_valid(reservation_station_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_io_i_branch_resolve_pack_rob_idx),
    .io_o_full(reservation_station_io_o_full),
    .io_i_exception(reservation_station_io_i_exception),
    .io_i_rollback_valid(reservation_station_io_i_rollback_valid),
    .io_i_available_funcs_0(reservation_station_io_i_available_funcs_0),
    .io_i_available_funcs_1(reservation_station_io_i_available_funcs_1),
    .io_i_available_funcs_2(reservation_station_io_i_available_funcs_2),
    .io_i_available_funcs_3(reservation_station_io_i_available_funcs_3),
    .io_i_available_funcs_4(reservation_station_io_i_available_funcs_4),
    .io_i_available_funcs_5(reservation_station_io_i_available_funcs_5),
    .io_i_ROB_first_entry(reservation_station_io_i_ROB_first_entry)
  );
  RegFile regfile ( // @[backend_with_decode.scala 43:25]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_i_raddr1(regfile_io_i_raddr1),
    .io_i_raddr2(regfile_io_i_raddr2),
    .io_i_raddr3(regfile_io_i_raddr3),
    .io_i_raddr4(regfile_io_i_raddr4),
    .io_o_rdata1(regfile_io_o_rdata1),
    .io_o_rdata2(regfile_io_o_rdata2),
    .io_o_rdata3(regfile_io_o_rdata3),
    .io_o_rdata4(regfile_io_o_rdata4),
    .io_i_waddr1(regfile_io_i_waddr1),
    .io_i_waddr2(regfile_io_i_waddr2),
    .io_i_wdata1(regfile_io_i_wdata1),
    .io_i_wdata2(regfile_io_i_wdata2),
    .io_i_wenable1(regfile_io_i_wenable1),
    .io_i_wenable2(regfile_io_i_wenable2),
    .io_o_pregs_0(regfile_io_o_pregs_0),
    .io_o_pregs_1(regfile_io_o_pregs_1),
    .io_o_pregs_2(regfile_io_o_pregs_2),
    .io_o_pregs_3(regfile_io_o_pregs_3),
    .io_o_pregs_4(regfile_io_o_pregs_4),
    .io_o_pregs_5(regfile_io_o_pregs_5),
    .io_o_pregs_6(regfile_io_o_pregs_6),
    .io_o_pregs_7(regfile_io_o_pregs_7),
    .io_o_pregs_8(regfile_io_o_pregs_8),
    .io_o_pregs_9(regfile_io_o_pregs_9),
    .io_o_pregs_10(regfile_io_o_pregs_10),
    .io_o_pregs_11(regfile_io_o_pregs_11),
    .io_o_pregs_12(regfile_io_o_pregs_12),
    .io_o_pregs_13(regfile_io_o_pregs_13),
    .io_o_pregs_14(regfile_io_o_pregs_14),
    .io_o_pregs_15(regfile_io_o_pregs_15),
    .io_o_pregs_16(regfile_io_o_pregs_16),
    .io_o_pregs_17(regfile_io_o_pregs_17),
    .io_o_pregs_18(regfile_io_o_pregs_18),
    .io_o_pregs_19(regfile_io_o_pregs_19),
    .io_o_pregs_20(regfile_io_o_pregs_20),
    .io_o_pregs_21(regfile_io_o_pregs_21),
    .io_o_pregs_22(regfile_io_o_pregs_22),
    .io_o_pregs_23(regfile_io_o_pregs_23),
    .io_o_pregs_24(regfile_io_o_pregs_24),
    .io_o_pregs_25(regfile_io_o_pregs_25),
    .io_o_pregs_26(regfile_io_o_pregs_26),
    .io_o_pregs_27(regfile_io_o_pregs_27),
    .io_o_pregs_28(regfile_io_o_pregs_28),
    .io_o_pregs_29(regfile_io_o_pregs_29),
    .io_o_pregs_30(regfile_io_o_pregs_30),
    .io_o_pregs_31(regfile_io_o_pregs_31),
    .io_o_pregs_32(regfile_io_o_pregs_32),
    .io_o_pregs_33(regfile_io_o_pregs_33),
    .io_o_pregs_34(regfile_io_o_pregs_34),
    .io_o_pregs_35(regfile_io_o_pregs_35),
    .io_o_pregs_36(regfile_io_o_pregs_36),
    .io_o_pregs_37(regfile_io_o_pregs_37),
    .io_o_pregs_38(regfile_io_o_pregs_38),
    .io_o_pregs_39(regfile_io_o_pregs_39),
    .io_o_pregs_40(regfile_io_o_pregs_40),
    .io_o_pregs_41(regfile_io_o_pregs_41),
    .io_o_pregs_42(regfile_io_o_pregs_42),
    .io_o_pregs_43(regfile_io_o_pregs_43),
    .io_o_pregs_44(regfile_io_o_pregs_44),
    .io_o_pregs_45(regfile_io_o_pregs_45),
    .io_o_pregs_46(regfile_io_o_pregs_46),
    .io_o_pregs_47(regfile_io_o_pregs_47),
    .io_o_pregs_48(regfile_io_o_pregs_48),
    .io_o_pregs_49(regfile_io_o_pregs_49),
    .io_o_pregs_50(regfile_io_o_pregs_50),
    .io_o_pregs_51(regfile_io_o_pregs_51),
    .io_o_pregs_52(regfile_io_o_pregs_52),
    .io_o_pregs_53(regfile_io_o_pregs_53),
    .io_o_pregs_54(regfile_io_o_pregs_54),
    .io_o_pregs_55(regfile_io_o_pregs_55),
    .io_o_pregs_56(regfile_io_o_pregs_56),
    .io_o_pregs_57(regfile_io_o_pregs_57),
    .io_o_pregs_58(regfile_io_o_pregs_58),
    .io_o_pregs_59(regfile_io_o_pregs_59),
    .io_o_pregs_60(regfile_io_o_pregs_60),
    .io_o_pregs_61(regfile_io_o_pregs_61),
    .io_o_pregs_62(regfile_io_o_pregs_62),
    .io_o_pregs_63(regfile_io_o_pregs_63),
    .io_o_pregs_64(regfile_io_o_pregs_64),
    .io_o_pregs_65(regfile_io_o_pregs_65),
    .io_o_pregs_66(regfile_io_o_pregs_66),
    .io_o_pregs_67(regfile_io_o_pregs_67),
    .io_o_pregs_68(regfile_io_o_pregs_68),
    .io_o_pregs_69(regfile_io_o_pregs_69),
    .io_o_pregs_70(regfile_io_o_pregs_70),
    .io_o_pregs_71(regfile_io_o_pregs_71),
    .io_o_pregs_72(regfile_io_o_pregs_72),
    .io_o_pregs_73(regfile_io_o_pregs_73),
    .io_o_pregs_74(regfile_io_o_pregs_74),
    .io_o_pregs_75(regfile_io_o_pregs_75),
    .io_o_pregs_76(regfile_io_o_pregs_76),
    .io_o_pregs_77(regfile_io_o_pregs_77),
    .io_o_pregs_78(regfile_io_o_pregs_78),
    .io_o_pregs_79(regfile_io_o_pregs_79),
    .io_o_pregs_80(regfile_io_o_pregs_80),
    .io_o_pregs_81(regfile_io_o_pregs_81),
    .io_o_pregs_82(regfile_io_o_pregs_82),
    .io_o_pregs_83(regfile_io_o_pregs_83),
    .io_o_pregs_84(regfile_io_o_pregs_84),
    .io_o_pregs_85(regfile_io_o_pregs_85),
    .io_o_pregs_86(regfile_io_o_pregs_86),
    .io_o_pregs_87(regfile_io_o_pregs_87),
    .io_o_pregs_88(regfile_io_o_pregs_88),
    .io_o_pregs_89(regfile_io_o_pregs_89),
    .io_o_pregs_90(regfile_io_o_pregs_90),
    .io_o_pregs_91(regfile_io_o_pregs_91),
    .io_o_pregs_92(regfile_io_o_pregs_92),
    .io_o_pregs_93(regfile_io_o_pregs_93),
    .io_o_pregs_94(regfile_io_o_pregs_94),
    .io_o_pregs_95(regfile_io_o_pregs_95),
    .io_o_pregs_96(regfile_io_o_pregs_96),
    .io_o_pregs_97(regfile_io_o_pregs_97),
    .io_o_pregs_98(regfile_io_o_pregs_98),
    .io_o_pregs_99(regfile_io_o_pregs_99),
    .io_o_pregs_100(regfile_io_o_pregs_100),
    .io_o_pregs_101(regfile_io_o_pregs_101),
    .io_o_pregs_102(regfile_io_o_pregs_102),
    .io_o_pregs_103(regfile_io_o_pregs_103),
    .io_o_pregs_104(regfile_io_o_pregs_104),
    .io_o_pregs_105(regfile_io_o_pregs_105),
    .io_o_pregs_106(regfile_io_o_pregs_106),
    .io_o_pregs_107(regfile_io_o_pregs_107),
    .io_o_pregs_108(regfile_io_o_pregs_108),
    .io_o_pregs_109(regfile_io_o_pregs_109),
    .io_o_pregs_110(regfile_io_o_pregs_110),
    .io_o_pregs_111(regfile_io_o_pregs_111),
    .io_o_pregs_112(regfile_io_o_pregs_112),
    .io_o_pregs_113(regfile_io_o_pregs_113),
    .io_o_pregs_114(regfile_io_o_pregs_114),
    .io_o_pregs_115(regfile_io_o_pregs_115),
    .io_o_pregs_116(regfile_io_o_pregs_116),
    .io_o_pregs_117(regfile_io_o_pregs_117),
    .io_o_pregs_118(regfile_io_o_pregs_118),
    .io_o_pregs_119(regfile_io_o_pregs_119),
    .io_o_pregs_120(regfile_io_o_pregs_120),
    .io_o_pregs_121(regfile_io_o_pregs_121),
    .io_o_pregs_122(regfile_io_o_pregs_122),
    .io_o_pregs_123(regfile_io_o_pregs_123),
    .io_o_pregs_124(regfile_io_o_pregs_124),
    .io_o_pregs_125(regfile_io_o_pregs_125),
    .io_o_pregs_126(regfile_io_o_pregs_126),
    .io_o_pregs_127(regfile_io_o_pregs_127)
  );
  Execute execute ( // @[backend_with_decode.scala 44:24]
    .clock(execute_clock),
    .reset(execute_reset),
    .io_i_issue_res_packs_0_valid(execute_io_i_issue_res_packs_0_valid),
    .io_i_issue_res_packs_0_pc(execute_io_i_issue_res_packs_0_pc),
    .io_i_issue_res_packs_0_inst(execute_io_i_issue_res_packs_0_inst),
    .io_i_issue_res_packs_0_func_code(execute_io_i_issue_res_packs_0_func_code),
    .io_i_issue_res_packs_0_branch_predict_pack_valid(execute_io_i_issue_res_packs_0_branch_predict_pack_valid),
    .io_i_issue_res_packs_0_branch_predict_pack_target(execute_io_i_issue_res_packs_0_branch_predict_pack_target),
    .io_i_issue_res_packs_0_branch_predict_pack_branch_type(
      execute_io_i_issue_res_packs_0_branch_predict_pack_branch_type),
    .io_i_issue_res_packs_0_branch_predict_pack_select(execute_io_i_issue_res_packs_0_branch_predict_pack_select),
    .io_i_issue_res_packs_0_branch_predict_pack_taken(execute_io_i_issue_res_packs_0_branch_predict_pack_taken),
    .io_i_issue_res_packs_0_phy_dst(execute_io_i_issue_res_packs_0_phy_dst),
    .io_i_issue_res_packs_0_stale_dst(execute_io_i_issue_res_packs_0_stale_dst),
    .io_i_issue_res_packs_0_arch_dst(execute_io_i_issue_res_packs_0_arch_dst),
    .io_i_issue_res_packs_0_inst_type(execute_io_i_issue_res_packs_0_inst_type),
    .io_i_issue_res_packs_0_regWen(execute_io_i_issue_res_packs_0_regWen),
    .io_i_issue_res_packs_0_src1_valid(execute_io_i_issue_res_packs_0_src1_valid),
    .io_i_issue_res_packs_0_phy_rs1(execute_io_i_issue_res_packs_0_phy_rs1),
    .io_i_issue_res_packs_0_arch_rs1(execute_io_i_issue_res_packs_0_arch_rs1),
    .io_i_issue_res_packs_0_src2_valid(execute_io_i_issue_res_packs_0_src2_valid),
    .io_i_issue_res_packs_0_phy_rs2(execute_io_i_issue_res_packs_0_phy_rs2),
    .io_i_issue_res_packs_0_arch_rs2(execute_io_i_issue_res_packs_0_arch_rs2),
    .io_i_issue_res_packs_0_rob_idx(execute_io_i_issue_res_packs_0_rob_idx),
    .io_i_issue_res_packs_0_imm(execute_io_i_issue_res_packs_0_imm),
    .io_i_issue_res_packs_0_src1_value(execute_io_i_issue_res_packs_0_src1_value),
    .io_i_issue_res_packs_0_src2_value(execute_io_i_issue_res_packs_0_src2_value),
    .io_i_issue_res_packs_0_op1_sel(execute_io_i_issue_res_packs_0_op1_sel),
    .io_i_issue_res_packs_0_op2_sel(execute_io_i_issue_res_packs_0_op2_sel),
    .io_i_issue_res_packs_0_alu_sel(execute_io_i_issue_res_packs_0_alu_sel),
    .io_i_issue_res_packs_0_branch_type(execute_io_i_issue_res_packs_0_branch_type),
    .io_i_issue_res_packs_0_mem_type(execute_io_i_issue_res_packs_0_mem_type),
    .io_i_issue_res_packs_1_valid(execute_io_i_issue_res_packs_1_valid),
    .io_i_issue_res_packs_1_pc(execute_io_i_issue_res_packs_1_pc),
    .io_i_issue_res_packs_1_inst(execute_io_i_issue_res_packs_1_inst),
    .io_i_issue_res_packs_1_func_code(execute_io_i_issue_res_packs_1_func_code),
    .io_i_issue_res_packs_1_branch_predict_pack_valid(execute_io_i_issue_res_packs_1_branch_predict_pack_valid),
    .io_i_issue_res_packs_1_branch_predict_pack_target(execute_io_i_issue_res_packs_1_branch_predict_pack_target),
    .io_i_issue_res_packs_1_branch_predict_pack_branch_type(
      execute_io_i_issue_res_packs_1_branch_predict_pack_branch_type),
    .io_i_issue_res_packs_1_branch_predict_pack_select(execute_io_i_issue_res_packs_1_branch_predict_pack_select),
    .io_i_issue_res_packs_1_branch_predict_pack_taken(execute_io_i_issue_res_packs_1_branch_predict_pack_taken),
    .io_i_issue_res_packs_1_phy_dst(execute_io_i_issue_res_packs_1_phy_dst),
    .io_i_issue_res_packs_1_stale_dst(execute_io_i_issue_res_packs_1_stale_dst),
    .io_i_issue_res_packs_1_arch_dst(execute_io_i_issue_res_packs_1_arch_dst),
    .io_i_issue_res_packs_1_inst_type(execute_io_i_issue_res_packs_1_inst_type),
    .io_i_issue_res_packs_1_regWen(execute_io_i_issue_res_packs_1_regWen),
    .io_i_issue_res_packs_1_src1_valid(execute_io_i_issue_res_packs_1_src1_valid),
    .io_i_issue_res_packs_1_phy_rs1(execute_io_i_issue_res_packs_1_phy_rs1),
    .io_i_issue_res_packs_1_arch_rs1(execute_io_i_issue_res_packs_1_arch_rs1),
    .io_i_issue_res_packs_1_src2_valid(execute_io_i_issue_res_packs_1_src2_valid),
    .io_i_issue_res_packs_1_phy_rs2(execute_io_i_issue_res_packs_1_phy_rs2),
    .io_i_issue_res_packs_1_arch_rs2(execute_io_i_issue_res_packs_1_arch_rs2),
    .io_i_issue_res_packs_1_rob_idx(execute_io_i_issue_res_packs_1_rob_idx),
    .io_i_issue_res_packs_1_imm(execute_io_i_issue_res_packs_1_imm),
    .io_i_issue_res_packs_1_src1_value(execute_io_i_issue_res_packs_1_src1_value),
    .io_i_issue_res_packs_1_src2_value(execute_io_i_issue_res_packs_1_src2_value),
    .io_i_issue_res_packs_1_op1_sel(execute_io_i_issue_res_packs_1_op1_sel),
    .io_i_issue_res_packs_1_op2_sel(execute_io_i_issue_res_packs_1_op2_sel),
    .io_i_issue_res_packs_1_alu_sel(execute_io_i_issue_res_packs_1_alu_sel),
    .io_i_issue_res_packs_1_branch_type(execute_io_i_issue_res_packs_1_branch_type),
    .io_i_issue_res_packs_1_mem_type(execute_io_i_issue_res_packs_1_mem_type),
    .io_o_available_funcs_0(execute_io_o_available_funcs_0),
    .io_o_available_funcs_1(execute_io_o_available_funcs_1),
    .io_o_available_funcs_2(execute_io_o_available_funcs_2),
    .io_o_available_funcs_3(execute_io_o_available_funcs_3),
    .io_o_available_funcs_4(execute_io_o_available_funcs_4),
    .io_o_available_funcs_5(execute_io_o_available_funcs_5),
    .io_o_ex_res_packs_0_valid(execute_io_o_ex_res_packs_0_valid),
    .io_o_ex_res_packs_0_uop_valid(execute_io_o_ex_res_packs_0_uop_valid),
    .io_o_ex_res_packs_0_uop_pc(execute_io_o_ex_res_packs_0_uop_pc),
    .io_o_ex_res_packs_0_uop_inst(execute_io_o_ex_res_packs_0_uop_inst),
    .io_o_ex_res_packs_0_uop_func_code(execute_io_o_ex_res_packs_0_uop_func_code),
    .io_o_ex_res_packs_0_uop_branch_predict_pack_valid(execute_io_o_ex_res_packs_0_uop_branch_predict_pack_valid),
    .io_o_ex_res_packs_0_uop_branch_predict_pack_target(execute_io_o_ex_res_packs_0_uop_branch_predict_pack_target),
    .io_o_ex_res_packs_0_uop_branch_predict_pack_branch_type(
      execute_io_o_ex_res_packs_0_uop_branch_predict_pack_branch_type),
    .io_o_ex_res_packs_0_uop_branch_predict_pack_select(execute_io_o_ex_res_packs_0_uop_branch_predict_pack_select),
    .io_o_ex_res_packs_0_uop_branch_predict_pack_taken(execute_io_o_ex_res_packs_0_uop_branch_predict_pack_taken),
    .io_o_ex_res_packs_0_uop_phy_dst(execute_io_o_ex_res_packs_0_uop_phy_dst),
    .io_o_ex_res_packs_0_uop_stale_dst(execute_io_o_ex_res_packs_0_uop_stale_dst),
    .io_o_ex_res_packs_0_uop_arch_dst(execute_io_o_ex_res_packs_0_uop_arch_dst),
    .io_o_ex_res_packs_0_uop_inst_type(execute_io_o_ex_res_packs_0_uop_inst_type),
    .io_o_ex_res_packs_0_uop_regWen(execute_io_o_ex_res_packs_0_uop_regWen),
    .io_o_ex_res_packs_0_uop_src1_valid(execute_io_o_ex_res_packs_0_uop_src1_valid),
    .io_o_ex_res_packs_0_uop_phy_rs1(execute_io_o_ex_res_packs_0_uop_phy_rs1),
    .io_o_ex_res_packs_0_uop_arch_rs1(execute_io_o_ex_res_packs_0_uop_arch_rs1),
    .io_o_ex_res_packs_0_uop_src2_valid(execute_io_o_ex_res_packs_0_uop_src2_valid),
    .io_o_ex_res_packs_0_uop_phy_rs2(execute_io_o_ex_res_packs_0_uop_phy_rs2),
    .io_o_ex_res_packs_0_uop_arch_rs2(execute_io_o_ex_res_packs_0_uop_arch_rs2),
    .io_o_ex_res_packs_0_uop_rob_idx(execute_io_o_ex_res_packs_0_uop_rob_idx),
    .io_o_ex_res_packs_0_uop_imm(execute_io_o_ex_res_packs_0_uop_imm),
    .io_o_ex_res_packs_0_uop_dst_value(execute_io_o_ex_res_packs_0_uop_dst_value),
    .io_o_ex_res_packs_0_uop_src1_value(execute_io_o_ex_res_packs_0_uop_src1_value),
    .io_o_ex_res_packs_0_uop_src2_value(execute_io_o_ex_res_packs_0_uop_src2_value),
    .io_o_ex_res_packs_0_uop_op1_sel(execute_io_o_ex_res_packs_0_uop_op1_sel),
    .io_o_ex_res_packs_0_uop_op2_sel(execute_io_o_ex_res_packs_0_uop_op2_sel),
    .io_o_ex_res_packs_0_uop_alu_sel(execute_io_o_ex_res_packs_0_uop_alu_sel),
    .io_o_ex_res_packs_0_uop_branch_type(execute_io_o_ex_res_packs_0_uop_branch_type),
    .io_o_ex_res_packs_0_uop_mem_type(execute_io_o_ex_res_packs_0_uop_mem_type),
    .io_o_ex_res_packs_1_valid(execute_io_o_ex_res_packs_1_valid),
    .io_o_ex_res_packs_1_uop_valid(execute_io_o_ex_res_packs_1_uop_valid),
    .io_o_ex_res_packs_1_uop_pc(execute_io_o_ex_res_packs_1_uop_pc),
    .io_o_ex_res_packs_1_uop_inst(execute_io_o_ex_res_packs_1_uop_inst),
    .io_o_ex_res_packs_1_uop_func_code(execute_io_o_ex_res_packs_1_uop_func_code),
    .io_o_ex_res_packs_1_uop_branch_predict_pack_valid(execute_io_o_ex_res_packs_1_uop_branch_predict_pack_valid),
    .io_o_ex_res_packs_1_uop_branch_predict_pack_target(execute_io_o_ex_res_packs_1_uop_branch_predict_pack_target),
    .io_o_ex_res_packs_1_uop_branch_predict_pack_branch_type(
      execute_io_o_ex_res_packs_1_uop_branch_predict_pack_branch_type),
    .io_o_ex_res_packs_1_uop_branch_predict_pack_select(execute_io_o_ex_res_packs_1_uop_branch_predict_pack_select),
    .io_o_ex_res_packs_1_uop_branch_predict_pack_taken(execute_io_o_ex_res_packs_1_uop_branch_predict_pack_taken),
    .io_o_ex_res_packs_1_uop_phy_dst(execute_io_o_ex_res_packs_1_uop_phy_dst),
    .io_o_ex_res_packs_1_uop_stale_dst(execute_io_o_ex_res_packs_1_uop_stale_dst),
    .io_o_ex_res_packs_1_uop_arch_dst(execute_io_o_ex_res_packs_1_uop_arch_dst),
    .io_o_ex_res_packs_1_uop_inst_type(execute_io_o_ex_res_packs_1_uop_inst_type),
    .io_o_ex_res_packs_1_uop_regWen(execute_io_o_ex_res_packs_1_uop_regWen),
    .io_o_ex_res_packs_1_uop_src1_valid(execute_io_o_ex_res_packs_1_uop_src1_valid),
    .io_o_ex_res_packs_1_uop_phy_rs1(execute_io_o_ex_res_packs_1_uop_phy_rs1),
    .io_o_ex_res_packs_1_uop_arch_rs1(execute_io_o_ex_res_packs_1_uop_arch_rs1),
    .io_o_ex_res_packs_1_uop_src2_valid(execute_io_o_ex_res_packs_1_uop_src2_valid),
    .io_o_ex_res_packs_1_uop_phy_rs2(execute_io_o_ex_res_packs_1_uop_phy_rs2),
    .io_o_ex_res_packs_1_uop_arch_rs2(execute_io_o_ex_res_packs_1_uop_arch_rs2),
    .io_o_ex_res_packs_1_uop_rob_idx(execute_io_o_ex_res_packs_1_uop_rob_idx),
    .io_o_ex_res_packs_1_uop_imm(execute_io_o_ex_res_packs_1_uop_imm),
    .io_o_ex_res_packs_1_uop_dst_value(execute_io_o_ex_res_packs_1_uop_dst_value),
    .io_o_ex_res_packs_1_uop_src1_value(execute_io_o_ex_res_packs_1_uop_src1_value),
    .io_o_ex_res_packs_1_uop_src2_value(execute_io_o_ex_res_packs_1_uop_src2_value),
    .io_o_ex_res_packs_1_uop_op1_sel(execute_io_o_ex_res_packs_1_uop_op1_sel),
    .io_o_ex_res_packs_1_uop_op2_sel(execute_io_o_ex_res_packs_1_uop_op2_sel),
    .io_o_ex_res_packs_1_uop_alu_sel(execute_io_o_ex_res_packs_1_uop_alu_sel),
    .io_o_ex_res_packs_1_uop_branch_type(execute_io_o_ex_res_packs_1_uop_branch_type),
    .io_o_ex_res_packs_1_uop_mem_type(execute_io_o_ex_res_packs_1_uop_mem_type),
    .io_i_ROB_first_entry(execute_io_i_ROB_first_entry),
    .io_dcache_io_data_valid(execute_io_dcache_io_data_valid),
    .io_dcache_io_addr_valid(execute_io_dcache_io_addr_valid),
    .io_dcache_io_addr_ready(execute_io_dcache_io_addr_ready),
    .io_dcache_io_Mwout(execute_io_dcache_io_Mwout),
    .io_dcache_io_Maddr(execute_io_dcache_io_Maddr),
    .io_dcache_io_Men(execute_io_dcache_io_Men),
    .io_dcache_io_Mlen(execute_io_dcache_io_Mlen),
    .io_dcache_io_MdataIn(execute_io_dcache_io_MdataIn),
    .io_dcache_io_MdataOut(execute_io_dcache_io_MdataOut),
    .io_o_branch_resolve_pack_valid(execute_io_o_branch_resolve_pack_valid),
    .io_o_branch_resolve_pack_mispred(execute_io_o_branch_resolve_pack_mispred),
    .io_o_branch_resolve_pack_taken(execute_io_o_branch_resolve_pack_taken),
    .io_o_branch_resolve_pack_pc(execute_io_o_branch_resolve_pack_pc),
    .io_o_branch_resolve_pack_target(execute_io_o_branch_resolve_pack_target),
    .io_o_branch_resolve_pack_rob_idx(execute_io_o_branch_resolve_pack_rob_idx),
    .io_o_branch_resolve_pack_prediction_valid(execute_io_o_branch_resolve_pack_prediction_valid),
    .io_o_branch_resolve_pack_branch_type(execute_io_o_branch_resolve_pack_branch_type),
    .io_i_exception(execute_io_i_exception),
    .io_i_rollback_valid(execute_io_i_rollback_valid),
    .io_o_lsu_uop_valid(execute_io_o_lsu_uop_valid),
    .io_o_lsu_uop_rob_idx(execute_io_o_lsu_uop_rob_idx)
  );
  Reorder_Buffer rob ( // @[backend_with_decode.scala 45:21]
    .clock(rob_clock),
    .reset(rob_reset),
    .io_o_full(rob_io_o_full),
    .io_i_rob_allocation_reqs_0_valid(rob_io_i_rob_allocation_reqs_0_valid),
    .io_i_rob_allocation_reqs_0_uop_valid(rob_io_i_rob_allocation_reqs_0_uop_valid),
    .io_i_rob_allocation_reqs_0_uop_pc(rob_io_i_rob_allocation_reqs_0_uop_pc),
    .io_i_rob_allocation_reqs_0_uop_inst(rob_io_i_rob_allocation_reqs_0_uop_inst),
    .io_i_rob_allocation_reqs_0_uop_func_code(rob_io_i_rob_allocation_reqs_0_uop_func_code),
    .io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid(
      rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid),
    .io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target(
      rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target),
    .io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type(
      rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type),
    .io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select(
      rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select),
    .io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken(
      rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken),
    .io_i_rob_allocation_reqs_0_uop_phy_dst(rob_io_i_rob_allocation_reqs_0_uop_phy_dst),
    .io_i_rob_allocation_reqs_0_uop_stale_dst(rob_io_i_rob_allocation_reqs_0_uop_stale_dst),
    .io_i_rob_allocation_reqs_0_uop_arch_dst(rob_io_i_rob_allocation_reqs_0_uop_arch_dst),
    .io_i_rob_allocation_reqs_0_uop_inst_type(rob_io_i_rob_allocation_reqs_0_uop_inst_type),
    .io_i_rob_allocation_reqs_0_uop_regWen(rob_io_i_rob_allocation_reqs_0_uop_regWen),
    .io_i_rob_allocation_reqs_0_uop_src1_valid(rob_io_i_rob_allocation_reqs_0_uop_src1_valid),
    .io_i_rob_allocation_reqs_0_uop_phy_rs1(rob_io_i_rob_allocation_reqs_0_uop_phy_rs1),
    .io_i_rob_allocation_reqs_0_uop_arch_rs1(rob_io_i_rob_allocation_reqs_0_uop_arch_rs1),
    .io_i_rob_allocation_reqs_0_uop_src2_valid(rob_io_i_rob_allocation_reqs_0_uop_src2_valid),
    .io_i_rob_allocation_reqs_0_uop_phy_rs2(rob_io_i_rob_allocation_reqs_0_uop_phy_rs2),
    .io_i_rob_allocation_reqs_0_uop_arch_rs2(rob_io_i_rob_allocation_reqs_0_uop_arch_rs2),
    .io_i_rob_allocation_reqs_0_uop_imm(rob_io_i_rob_allocation_reqs_0_uop_imm),
    .io_i_rob_allocation_reqs_0_uop_src1_value(rob_io_i_rob_allocation_reqs_0_uop_src1_value),
    .io_i_rob_allocation_reqs_0_uop_src2_value(rob_io_i_rob_allocation_reqs_0_uop_src2_value),
    .io_i_rob_allocation_reqs_0_uop_op1_sel(rob_io_i_rob_allocation_reqs_0_uop_op1_sel),
    .io_i_rob_allocation_reqs_0_uop_op2_sel(rob_io_i_rob_allocation_reqs_0_uop_op2_sel),
    .io_i_rob_allocation_reqs_0_uop_alu_sel(rob_io_i_rob_allocation_reqs_0_uop_alu_sel),
    .io_i_rob_allocation_reqs_0_uop_branch_type(rob_io_i_rob_allocation_reqs_0_uop_branch_type),
    .io_i_rob_allocation_reqs_0_uop_mem_type(rob_io_i_rob_allocation_reqs_0_uop_mem_type),
    .io_i_rob_allocation_reqs_1_valid(rob_io_i_rob_allocation_reqs_1_valid),
    .io_i_rob_allocation_reqs_1_uop_valid(rob_io_i_rob_allocation_reqs_1_uop_valid),
    .io_i_rob_allocation_reqs_1_uop_pc(rob_io_i_rob_allocation_reqs_1_uop_pc),
    .io_i_rob_allocation_reqs_1_uop_inst(rob_io_i_rob_allocation_reqs_1_uop_inst),
    .io_i_rob_allocation_reqs_1_uop_func_code(rob_io_i_rob_allocation_reqs_1_uop_func_code),
    .io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid(
      rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid),
    .io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target(
      rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target),
    .io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type(
      rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type),
    .io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select(
      rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select),
    .io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken(
      rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken),
    .io_i_rob_allocation_reqs_1_uop_phy_dst(rob_io_i_rob_allocation_reqs_1_uop_phy_dst),
    .io_i_rob_allocation_reqs_1_uop_stale_dst(rob_io_i_rob_allocation_reqs_1_uop_stale_dst),
    .io_i_rob_allocation_reqs_1_uop_arch_dst(rob_io_i_rob_allocation_reqs_1_uop_arch_dst),
    .io_i_rob_allocation_reqs_1_uop_inst_type(rob_io_i_rob_allocation_reqs_1_uop_inst_type),
    .io_i_rob_allocation_reqs_1_uop_regWen(rob_io_i_rob_allocation_reqs_1_uop_regWen),
    .io_i_rob_allocation_reqs_1_uop_src1_valid(rob_io_i_rob_allocation_reqs_1_uop_src1_valid),
    .io_i_rob_allocation_reqs_1_uop_phy_rs1(rob_io_i_rob_allocation_reqs_1_uop_phy_rs1),
    .io_i_rob_allocation_reqs_1_uop_arch_rs1(rob_io_i_rob_allocation_reqs_1_uop_arch_rs1),
    .io_i_rob_allocation_reqs_1_uop_src2_valid(rob_io_i_rob_allocation_reqs_1_uop_src2_valid),
    .io_i_rob_allocation_reqs_1_uop_phy_rs2(rob_io_i_rob_allocation_reqs_1_uop_phy_rs2),
    .io_i_rob_allocation_reqs_1_uop_arch_rs2(rob_io_i_rob_allocation_reqs_1_uop_arch_rs2),
    .io_i_rob_allocation_reqs_1_uop_imm(rob_io_i_rob_allocation_reqs_1_uop_imm),
    .io_i_rob_allocation_reqs_1_uop_src1_value(rob_io_i_rob_allocation_reqs_1_uop_src1_value),
    .io_i_rob_allocation_reqs_1_uop_src2_value(rob_io_i_rob_allocation_reqs_1_uop_src2_value),
    .io_i_rob_allocation_reqs_1_uop_op1_sel(rob_io_i_rob_allocation_reqs_1_uop_op1_sel),
    .io_i_rob_allocation_reqs_1_uop_op2_sel(rob_io_i_rob_allocation_reqs_1_uop_op2_sel),
    .io_i_rob_allocation_reqs_1_uop_alu_sel(rob_io_i_rob_allocation_reqs_1_uop_alu_sel),
    .io_i_rob_allocation_reqs_1_uop_branch_type(rob_io_i_rob_allocation_reqs_1_uop_branch_type),
    .io_i_rob_allocation_reqs_1_uop_mem_type(rob_io_i_rob_allocation_reqs_1_uop_mem_type),
    .io_o_rob_allocation_ress_0_rob_idx(rob_io_o_rob_allocation_ress_0_rob_idx),
    .io_o_rob_allocation_ress_1_rob_idx(rob_io_o_rob_allocation_ress_1_rob_idx),
    .io_o_rollback_packs_0_valid(rob_io_o_rollback_packs_0_valid),
    .io_o_rollback_packs_0_uop_phy_dst(rob_io_o_rollback_packs_0_uop_phy_dst),
    .io_o_rollback_packs_0_uop_stale_dst(rob_io_o_rollback_packs_0_uop_stale_dst),
    .io_o_rollback_packs_0_uop_arch_dst(rob_io_o_rollback_packs_0_uop_arch_dst),
    .io_o_rollback_packs_1_valid(rob_io_o_rollback_packs_1_valid),
    .io_o_rollback_packs_1_uop_phy_dst(rob_io_o_rollback_packs_1_uop_phy_dst),
    .io_o_rollback_packs_1_uop_stale_dst(rob_io_o_rollback_packs_1_uop_stale_dst),
    .io_o_rollback_packs_1_uop_arch_dst(rob_io_o_rollback_packs_1_uop_arch_dst),
    .io_i_ex_res_packs_0_valid(rob_io_i_ex_res_packs_0_valid),
    .io_i_ex_res_packs_0_uop_valid(rob_io_i_ex_res_packs_0_uop_valid),
    .io_i_ex_res_packs_0_uop_pc(rob_io_i_ex_res_packs_0_uop_pc),
    .io_i_ex_res_packs_0_uop_inst(rob_io_i_ex_res_packs_0_uop_inst),
    .io_i_ex_res_packs_0_uop_func_code(rob_io_i_ex_res_packs_0_uop_func_code),
    .io_i_ex_res_packs_0_uop_branch_predict_pack_valid(rob_io_i_ex_res_packs_0_uop_branch_predict_pack_valid),
    .io_i_ex_res_packs_0_uop_branch_predict_pack_target(rob_io_i_ex_res_packs_0_uop_branch_predict_pack_target),
    .io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type(rob_io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type
      ),
    .io_i_ex_res_packs_0_uop_branch_predict_pack_select(rob_io_i_ex_res_packs_0_uop_branch_predict_pack_select),
    .io_i_ex_res_packs_0_uop_branch_predict_pack_taken(rob_io_i_ex_res_packs_0_uop_branch_predict_pack_taken),
    .io_i_ex_res_packs_0_uop_phy_dst(rob_io_i_ex_res_packs_0_uop_phy_dst),
    .io_i_ex_res_packs_0_uop_stale_dst(rob_io_i_ex_res_packs_0_uop_stale_dst),
    .io_i_ex_res_packs_0_uop_arch_dst(rob_io_i_ex_res_packs_0_uop_arch_dst),
    .io_i_ex_res_packs_0_uop_inst_type(rob_io_i_ex_res_packs_0_uop_inst_type),
    .io_i_ex_res_packs_0_uop_regWen(rob_io_i_ex_res_packs_0_uop_regWen),
    .io_i_ex_res_packs_0_uop_src1_valid(rob_io_i_ex_res_packs_0_uop_src1_valid),
    .io_i_ex_res_packs_0_uop_phy_rs1(rob_io_i_ex_res_packs_0_uop_phy_rs1),
    .io_i_ex_res_packs_0_uop_arch_rs1(rob_io_i_ex_res_packs_0_uop_arch_rs1),
    .io_i_ex_res_packs_0_uop_src2_valid(rob_io_i_ex_res_packs_0_uop_src2_valid),
    .io_i_ex_res_packs_0_uop_phy_rs2(rob_io_i_ex_res_packs_0_uop_phy_rs2),
    .io_i_ex_res_packs_0_uop_arch_rs2(rob_io_i_ex_res_packs_0_uop_arch_rs2),
    .io_i_ex_res_packs_0_uop_rob_idx(rob_io_i_ex_res_packs_0_uop_rob_idx),
    .io_i_ex_res_packs_0_uop_imm(rob_io_i_ex_res_packs_0_uop_imm),
    .io_i_ex_res_packs_0_uop_dst_value(rob_io_i_ex_res_packs_0_uop_dst_value),
    .io_i_ex_res_packs_0_uop_src1_value(rob_io_i_ex_res_packs_0_uop_src1_value),
    .io_i_ex_res_packs_0_uop_src2_value(rob_io_i_ex_res_packs_0_uop_src2_value),
    .io_i_ex_res_packs_0_uop_op1_sel(rob_io_i_ex_res_packs_0_uop_op1_sel),
    .io_i_ex_res_packs_0_uop_op2_sel(rob_io_i_ex_res_packs_0_uop_op2_sel),
    .io_i_ex_res_packs_0_uop_alu_sel(rob_io_i_ex_res_packs_0_uop_alu_sel),
    .io_i_ex_res_packs_0_uop_branch_type(rob_io_i_ex_res_packs_0_uop_branch_type),
    .io_i_ex_res_packs_0_uop_mem_type(rob_io_i_ex_res_packs_0_uop_mem_type),
    .io_i_ex_res_packs_1_valid(rob_io_i_ex_res_packs_1_valid),
    .io_i_ex_res_packs_1_uop_valid(rob_io_i_ex_res_packs_1_uop_valid),
    .io_i_ex_res_packs_1_uop_pc(rob_io_i_ex_res_packs_1_uop_pc),
    .io_i_ex_res_packs_1_uop_inst(rob_io_i_ex_res_packs_1_uop_inst),
    .io_i_ex_res_packs_1_uop_func_code(rob_io_i_ex_res_packs_1_uop_func_code),
    .io_i_ex_res_packs_1_uop_branch_predict_pack_valid(rob_io_i_ex_res_packs_1_uop_branch_predict_pack_valid),
    .io_i_ex_res_packs_1_uop_branch_predict_pack_target(rob_io_i_ex_res_packs_1_uop_branch_predict_pack_target),
    .io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type(rob_io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type
      ),
    .io_i_ex_res_packs_1_uop_branch_predict_pack_select(rob_io_i_ex_res_packs_1_uop_branch_predict_pack_select),
    .io_i_ex_res_packs_1_uop_branch_predict_pack_taken(rob_io_i_ex_res_packs_1_uop_branch_predict_pack_taken),
    .io_i_ex_res_packs_1_uop_phy_dst(rob_io_i_ex_res_packs_1_uop_phy_dst),
    .io_i_ex_res_packs_1_uop_stale_dst(rob_io_i_ex_res_packs_1_uop_stale_dst),
    .io_i_ex_res_packs_1_uop_arch_dst(rob_io_i_ex_res_packs_1_uop_arch_dst),
    .io_i_ex_res_packs_1_uop_inst_type(rob_io_i_ex_res_packs_1_uop_inst_type),
    .io_i_ex_res_packs_1_uop_regWen(rob_io_i_ex_res_packs_1_uop_regWen),
    .io_i_ex_res_packs_1_uop_src1_valid(rob_io_i_ex_res_packs_1_uop_src1_valid),
    .io_i_ex_res_packs_1_uop_phy_rs1(rob_io_i_ex_res_packs_1_uop_phy_rs1),
    .io_i_ex_res_packs_1_uop_arch_rs1(rob_io_i_ex_res_packs_1_uop_arch_rs1),
    .io_i_ex_res_packs_1_uop_src2_valid(rob_io_i_ex_res_packs_1_uop_src2_valid),
    .io_i_ex_res_packs_1_uop_phy_rs2(rob_io_i_ex_res_packs_1_uop_phy_rs2),
    .io_i_ex_res_packs_1_uop_arch_rs2(rob_io_i_ex_res_packs_1_uop_arch_rs2),
    .io_i_ex_res_packs_1_uop_rob_idx(rob_io_i_ex_res_packs_1_uop_rob_idx),
    .io_i_ex_res_packs_1_uop_imm(rob_io_i_ex_res_packs_1_uop_imm),
    .io_i_ex_res_packs_1_uop_dst_value(rob_io_i_ex_res_packs_1_uop_dst_value),
    .io_i_ex_res_packs_1_uop_src1_value(rob_io_i_ex_res_packs_1_uop_src1_value),
    .io_i_ex_res_packs_1_uop_src2_value(rob_io_i_ex_res_packs_1_uop_src2_value),
    .io_i_ex_res_packs_1_uop_op1_sel(rob_io_i_ex_res_packs_1_uop_op1_sel),
    .io_i_ex_res_packs_1_uop_op2_sel(rob_io_i_ex_res_packs_1_uop_op2_sel),
    .io_i_ex_res_packs_1_uop_alu_sel(rob_io_i_ex_res_packs_1_uop_alu_sel),
    .io_i_ex_res_packs_1_uop_branch_type(rob_io_i_ex_res_packs_1_uop_branch_type),
    .io_i_ex_res_packs_1_uop_mem_type(rob_io_i_ex_res_packs_1_uop_mem_type),
    .io_i_branch_resolve_pack_valid(rob_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(rob_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(rob_io_i_branch_resolve_pack_rob_idx),
    .io_o_commit_packs_0_valid(rob_io_o_commit_packs_0_valid),
    .io_o_commit_packs_0_uop_valid(rob_io_o_commit_packs_0_uop_valid),
    .io_o_commit_packs_0_uop_pc(rob_io_o_commit_packs_0_uop_pc),
    .io_o_commit_packs_0_uop_inst(rob_io_o_commit_packs_0_uop_inst),
    .io_o_commit_packs_0_uop_func_code(rob_io_o_commit_packs_0_uop_func_code),
    .io_o_commit_packs_0_uop_branch_predict_pack_valid(rob_io_o_commit_packs_0_uop_branch_predict_pack_valid),
    .io_o_commit_packs_0_uop_branch_predict_pack_target(rob_io_o_commit_packs_0_uop_branch_predict_pack_target),
    .io_o_commit_packs_0_uop_branch_predict_pack_branch_type(rob_io_o_commit_packs_0_uop_branch_predict_pack_branch_type
      ),
    .io_o_commit_packs_0_uop_branch_predict_pack_select(rob_io_o_commit_packs_0_uop_branch_predict_pack_select),
    .io_o_commit_packs_0_uop_branch_predict_pack_taken(rob_io_o_commit_packs_0_uop_branch_predict_pack_taken),
    .io_o_commit_packs_0_uop_phy_dst(rob_io_o_commit_packs_0_uop_phy_dst),
    .io_o_commit_packs_0_uop_stale_dst(rob_io_o_commit_packs_0_uop_stale_dst),
    .io_o_commit_packs_0_uop_arch_dst(rob_io_o_commit_packs_0_uop_arch_dst),
    .io_o_commit_packs_0_uop_inst_type(rob_io_o_commit_packs_0_uop_inst_type),
    .io_o_commit_packs_0_uop_regWen(rob_io_o_commit_packs_0_uop_regWen),
    .io_o_commit_packs_0_uop_src1_valid(rob_io_o_commit_packs_0_uop_src1_valid),
    .io_o_commit_packs_0_uop_phy_rs1(rob_io_o_commit_packs_0_uop_phy_rs1),
    .io_o_commit_packs_0_uop_arch_rs1(rob_io_o_commit_packs_0_uop_arch_rs1),
    .io_o_commit_packs_0_uop_src2_valid(rob_io_o_commit_packs_0_uop_src2_valid),
    .io_o_commit_packs_0_uop_phy_rs2(rob_io_o_commit_packs_0_uop_phy_rs2),
    .io_o_commit_packs_0_uop_arch_rs2(rob_io_o_commit_packs_0_uop_arch_rs2),
    .io_o_commit_packs_0_uop_rob_idx(rob_io_o_commit_packs_0_uop_rob_idx),
    .io_o_commit_packs_0_uop_imm(rob_io_o_commit_packs_0_uop_imm),
    .io_o_commit_packs_0_uop_dst_value(rob_io_o_commit_packs_0_uop_dst_value),
    .io_o_commit_packs_0_uop_src1_value(rob_io_o_commit_packs_0_uop_src1_value),
    .io_o_commit_packs_0_uop_src2_value(rob_io_o_commit_packs_0_uop_src2_value),
    .io_o_commit_packs_0_uop_op1_sel(rob_io_o_commit_packs_0_uop_op1_sel),
    .io_o_commit_packs_0_uop_op2_sel(rob_io_o_commit_packs_0_uop_op2_sel),
    .io_o_commit_packs_0_uop_alu_sel(rob_io_o_commit_packs_0_uop_alu_sel),
    .io_o_commit_packs_0_uop_branch_type(rob_io_o_commit_packs_0_uop_branch_type),
    .io_o_commit_packs_0_uop_mem_type(rob_io_o_commit_packs_0_uop_mem_type),
    .io_o_commit_packs_1_valid(rob_io_o_commit_packs_1_valid),
    .io_o_commit_packs_1_uop_valid(rob_io_o_commit_packs_1_uop_valid),
    .io_o_commit_packs_1_uop_pc(rob_io_o_commit_packs_1_uop_pc),
    .io_o_commit_packs_1_uop_inst(rob_io_o_commit_packs_1_uop_inst),
    .io_o_commit_packs_1_uop_func_code(rob_io_o_commit_packs_1_uop_func_code),
    .io_o_commit_packs_1_uop_branch_predict_pack_valid(rob_io_o_commit_packs_1_uop_branch_predict_pack_valid),
    .io_o_commit_packs_1_uop_branch_predict_pack_target(rob_io_o_commit_packs_1_uop_branch_predict_pack_target),
    .io_o_commit_packs_1_uop_branch_predict_pack_branch_type(rob_io_o_commit_packs_1_uop_branch_predict_pack_branch_type
      ),
    .io_o_commit_packs_1_uop_branch_predict_pack_select(rob_io_o_commit_packs_1_uop_branch_predict_pack_select),
    .io_o_commit_packs_1_uop_branch_predict_pack_taken(rob_io_o_commit_packs_1_uop_branch_predict_pack_taken),
    .io_o_commit_packs_1_uop_phy_dst(rob_io_o_commit_packs_1_uop_phy_dst),
    .io_o_commit_packs_1_uop_stale_dst(rob_io_o_commit_packs_1_uop_stale_dst),
    .io_o_commit_packs_1_uop_arch_dst(rob_io_o_commit_packs_1_uop_arch_dst),
    .io_o_commit_packs_1_uop_inst_type(rob_io_o_commit_packs_1_uop_inst_type),
    .io_o_commit_packs_1_uop_regWen(rob_io_o_commit_packs_1_uop_regWen),
    .io_o_commit_packs_1_uop_src1_valid(rob_io_o_commit_packs_1_uop_src1_valid),
    .io_o_commit_packs_1_uop_phy_rs1(rob_io_o_commit_packs_1_uop_phy_rs1),
    .io_o_commit_packs_1_uop_arch_rs1(rob_io_o_commit_packs_1_uop_arch_rs1),
    .io_o_commit_packs_1_uop_src2_valid(rob_io_o_commit_packs_1_uop_src2_valid),
    .io_o_commit_packs_1_uop_phy_rs2(rob_io_o_commit_packs_1_uop_phy_rs2),
    .io_o_commit_packs_1_uop_arch_rs2(rob_io_o_commit_packs_1_uop_arch_rs2),
    .io_o_commit_packs_1_uop_rob_idx(rob_io_o_commit_packs_1_uop_rob_idx),
    .io_o_commit_packs_1_uop_imm(rob_io_o_commit_packs_1_uop_imm),
    .io_o_commit_packs_1_uop_dst_value(rob_io_o_commit_packs_1_uop_dst_value),
    .io_o_commit_packs_1_uop_src1_value(rob_io_o_commit_packs_1_uop_src1_value),
    .io_o_commit_packs_1_uop_src2_value(rob_io_o_commit_packs_1_uop_src2_value),
    .io_o_commit_packs_1_uop_op1_sel(rob_io_o_commit_packs_1_uop_op1_sel),
    .io_o_commit_packs_1_uop_op2_sel(rob_io_o_commit_packs_1_uop_op2_sel),
    .io_o_commit_packs_1_uop_alu_sel(rob_io_o_commit_packs_1_uop_alu_sel),
    .io_o_commit_packs_1_uop_branch_type(rob_io_o_commit_packs_1_uop_branch_type),
    .io_o_commit_packs_1_uop_mem_type(rob_io_o_commit_packs_1_uop_mem_type),
    .io_o_rob_head(rob_io_o_rob_head),
    .io_i_interrupt(rob_io_i_interrupt),
    .io_i_csr_pc_redirect(rob_io_i_csr_pc_redirect),
    .io_o_exception(rob_io_o_exception)
  );
  CSR csr ( // @[backend_with_decode.scala 46:21]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_i_interrupt(csr_io_i_interrupt),
    .io_i_commit_packs_0_valid(csr_io_i_commit_packs_0_valid),
    .io_i_commit_packs_0_uop_valid(csr_io_i_commit_packs_0_uop_valid),
    .io_i_commit_packs_0_uop_pc(csr_io_i_commit_packs_0_uop_pc),
    .io_i_commit_packs_0_uop_inst(csr_io_i_commit_packs_0_uop_inst),
    .io_i_commit_packs_0_uop_func_code(csr_io_i_commit_packs_0_uop_func_code),
    .io_i_commit_packs_0_uop_branch_predict_pack_valid(csr_io_i_commit_packs_0_uop_branch_predict_pack_valid),
    .io_i_commit_packs_0_uop_branch_predict_pack_target(csr_io_i_commit_packs_0_uop_branch_predict_pack_target),
    .io_i_commit_packs_0_uop_branch_predict_pack_branch_type(csr_io_i_commit_packs_0_uop_branch_predict_pack_branch_type
      ),
    .io_i_commit_packs_0_uop_branch_predict_pack_select(csr_io_i_commit_packs_0_uop_branch_predict_pack_select),
    .io_i_commit_packs_0_uop_branch_predict_pack_taken(csr_io_i_commit_packs_0_uop_branch_predict_pack_taken),
    .io_i_commit_packs_0_uop_phy_dst(csr_io_i_commit_packs_0_uop_phy_dst),
    .io_i_commit_packs_0_uop_stale_dst(csr_io_i_commit_packs_0_uop_stale_dst),
    .io_i_commit_packs_0_uop_arch_dst(csr_io_i_commit_packs_0_uop_arch_dst),
    .io_i_commit_packs_0_uop_inst_type(csr_io_i_commit_packs_0_uop_inst_type),
    .io_i_commit_packs_0_uop_regWen(csr_io_i_commit_packs_0_uop_regWen),
    .io_i_commit_packs_0_uop_src1_valid(csr_io_i_commit_packs_0_uop_src1_valid),
    .io_i_commit_packs_0_uop_phy_rs1(csr_io_i_commit_packs_0_uop_phy_rs1),
    .io_i_commit_packs_0_uop_arch_rs1(csr_io_i_commit_packs_0_uop_arch_rs1),
    .io_i_commit_packs_0_uop_src2_valid(csr_io_i_commit_packs_0_uop_src2_valid),
    .io_i_commit_packs_0_uop_phy_rs2(csr_io_i_commit_packs_0_uop_phy_rs2),
    .io_i_commit_packs_0_uop_arch_rs2(csr_io_i_commit_packs_0_uop_arch_rs2),
    .io_i_commit_packs_0_uop_rob_idx(csr_io_i_commit_packs_0_uop_rob_idx),
    .io_i_commit_packs_0_uop_imm(csr_io_i_commit_packs_0_uop_imm),
    .io_i_commit_packs_0_uop_dst_value(csr_io_i_commit_packs_0_uop_dst_value),
    .io_i_commit_packs_0_uop_src1_value(csr_io_i_commit_packs_0_uop_src1_value),
    .io_i_commit_packs_0_uop_src2_value(csr_io_i_commit_packs_0_uop_src2_value),
    .io_i_commit_packs_0_uop_op1_sel(csr_io_i_commit_packs_0_uop_op1_sel),
    .io_i_commit_packs_0_uop_op2_sel(csr_io_i_commit_packs_0_uop_op2_sel),
    .io_i_commit_packs_0_uop_alu_sel(csr_io_i_commit_packs_0_uop_alu_sel),
    .io_i_commit_packs_0_uop_branch_type(csr_io_i_commit_packs_0_uop_branch_type),
    .io_i_commit_packs_0_uop_mem_type(csr_io_i_commit_packs_0_uop_mem_type),
    .io_i_commit_packs_1_valid(csr_io_i_commit_packs_1_valid),
    .io_i_commit_packs_1_uop_valid(csr_io_i_commit_packs_1_uop_valid),
    .io_i_commit_packs_1_uop_pc(csr_io_i_commit_packs_1_uop_pc),
    .io_i_commit_packs_1_uop_inst(csr_io_i_commit_packs_1_uop_inst),
    .io_i_commit_packs_1_uop_func_code(csr_io_i_commit_packs_1_uop_func_code),
    .io_i_commit_packs_1_uop_branch_predict_pack_valid(csr_io_i_commit_packs_1_uop_branch_predict_pack_valid),
    .io_i_commit_packs_1_uop_branch_predict_pack_target(csr_io_i_commit_packs_1_uop_branch_predict_pack_target),
    .io_i_commit_packs_1_uop_branch_predict_pack_branch_type(csr_io_i_commit_packs_1_uop_branch_predict_pack_branch_type
      ),
    .io_i_commit_packs_1_uop_branch_predict_pack_select(csr_io_i_commit_packs_1_uop_branch_predict_pack_select),
    .io_i_commit_packs_1_uop_branch_predict_pack_taken(csr_io_i_commit_packs_1_uop_branch_predict_pack_taken),
    .io_i_commit_packs_1_uop_phy_dst(csr_io_i_commit_packs_1_uop_phy_dst),
    .io_i_commit_packs_1_uop_stale_dst(csr_io_i_commit_packs_1_uop_stale_dst),
    .io_i_commit_packs_1_uop_arch_dst(csr_io_i_commit_packs_1_uop_arch_dst),
    .io_i_commit_packs_1_uop_inst_type(csr_io_i_commit_packs_1_uop_inst_type),
    .io_i_commit_packs_1_uop_regWen(csr_io_i_commit_packs_1_uop_regWen),
    .io_i_commit_packs_1_uop_src1_valid(csr_io_i_commit_packs_1_uop_src1_valid),
    .io_i_commit_packs_1_uop_phy_rs1(csr_io_i_commit_packs_1_uop_phy_rs1),
    .io_i_commit_packs_1_uop_arch_rs1(csr_io_i_commit_packs_1_uop_arch_rs1),
    .io_i_commit_packs_1_uop_src2_valid(csr_io_i_commit_packs_1_uop_src2_valid),
    .io_i_commit_packs_1_uop_phy_rs2(csr_io_i_commit_packs_1_uop_phy_rs2),
    .io_i_commit_packs_1_uop_arch_rs2(csr_io_i_commit_packs_1_uop_arch_rs2),
    .io_i_commit_packs_1_uop_rob_idx(csr_io_i_commit_packs_1_uop_rob_idx),
    .io_i_commit_packs_1_uop_imm(csr_io_i_commit_packs_1_uop_imm),
    .io_i_commit_packs_1_uop_dst_value(csr_io_i_commit_packs_1_uop_dst_value),
    .io_i_commit_packs_1_uop_src1_value(csr_io_i_commit_packs_1_uop_src1_value),
    .io_i_commit_packs_1_uop_src2_value(csr_io_i_commit_packs_1_uop_src2_value),
    .io_i_commit_packs_1_uop_op1_sel(csr_io_i_commit_packs_1_uop_op1_sel),
    .io_i_commit_packs_1_uop_op2_sel(csr_io_i_commit_packs_1_uop_op2_sel),
    .io_i_commit_packs_1_uop_alu_sel(csr_io_i_commit_packs_1_uop_alu_sel),
    .io_i_commit_packs_1_uop_branch_type(csr_io_i_commit_packs_1_uop_branch_type),
    .io_i_commit_packs_1_uop_mem_type(csr_io_i_commit_packs_1_uop_mem_type),
    .io_o_pc_redirect_target(csr_io_o_pc_redirect_target),
    .io_o_pc_redirect_valid(csr_io_o_pc_redirect_valid),
    .io_o_commit_packs_modified_0_valid(csr_io_o_commit_packs_modified_0_valid),
    .io_o_commit_packs_modified_0_uop_valid(csr_io_o_commit_packs_modified_0_uop_valid),
    .io_o_commit_packs_modified_0_uop_pc(csr_io_o_commit_packs_modified_0_uop_pc),
    .io_o_commit_packs_modified_0_uop_inst(csr_io_o_commit_packs_modified_0_uop_inst),
    .io_o_commit_packs_modified_0_uop_func_code(csr_io_o_commit_packs_modified_0_uop_func_code),
    .io_o_commit_packs_modified_0_uop_branch_predict_pack_valid(
      csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_valid),
    .io_o_commit_packs_modified_0_uop_branch_predict_pack_target(
      csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_target),
    .io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type(
      csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type),
    .io_o_commit_packs_modified_0_uop_branch_predict_pack_select(
      csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_select),
    .io_o_commit_packs_modified_0_uop_branch_predict_pack_taken(
      csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_taken),
    .io_o_commit_packs_modified_0_uop_phy_dst(csr_io_o_commit_packs_modified_0_uop_phy_dst),
    .io_o_commit_packs_modified_0_uop_stale_dst(csr_io_o_commit_packs_modified_0_uop_stale_dst),
    .io_o_commit_packs_modified_0_uop_arch_dst(csr_io_o_commit_packs_modified_0_uop_arch_dst),
    .io_o_commit_packs_modified_0_uop_inst_type(csr_io_o_commit_packs_modified_0_uop_inst_type),
    .io_o_commit_packs_modified_0_uop_regWen(csr_io_o_commit_packs_modified_0_uop_regWen),
    .io_o_commit_packs_modified_0_uop_src1_valid(csr_io_o_commit_packs_modified_0_uop_src1_valid),
    .io_o_commit_packs_modified_0_uop_phy_rs1(csr_io_o_commit_packs_modified_0_uop_phy_rs1),
    .io_o_commit_packs_modified_0_uop_arch_rs1(csr_io_o_commit_packs_modified_0_uop_arch_rs1),
    .io_o_commit_packs_modified_0_uop_src2_valid(csr_io_o_commit_packs_modified_0_uop_src2_valid),
    .io_o_commit_packs_modified_0_uop_phy_rs2(csr_io_o_commit_packs_modified_0_uop_phy_rs2),
    .io_o_commit_packs_modified_0_uop_arch_rs2(csr_io_o_commit_packs_modified_0_uop_arch_rs2),
    .io_o_commit_packs_modified_0_uop_rob_idx(csr_io_o_commit_packs_modified_0_uop_rob_idx),
    .io_o_commit_packs_modified_0_uop_imm(csr_io_o_commit_packs_modified_0_uop_imm),
    .io_o_commit_packs_modified_0_uop_dst_value(csr_io_o_commit_packs_modified_0_uop_dst_value),
    .io_o_commit_packs_modified_0_uop_src1_value(csr_io_o_commit_packs_modified_0_uop_src1_value),
    .io_o_commit_packs_modified_0_uop_src2_value(csr_io_o_commit_packs_modified_0_uop_src2_value),
    .io_o_commit_packs_modified_0_uop_op1_sel(csr_io_o_commit_packs_modified_0_uop_op1_sel),
    .io_o_commit_packs_modified_0_uop_op2_sel(csr_io_o_commit_packs_modified_0_uop_op2_sel),
    .io_o_commit_packs_modified_0_uop_alu_sel(csr_io_o_commit_packs_modified_0_uop_alu_sel),
    .io_o_commit_packs_modified_0_uop_branch_type(csr_io_o_commit_packs_modified_0_uop_branch_type),
    .io_o_commit_packs_modified_0_uop_mem_type(csr_io_o_commit_packs_modified_0_uop_mem_type),
    .io_o_commit_packs_modified_1_valid(csr_io_o_commit_packs_modified_1_valid),
    .io_o_commit_packs_modified_1_uop_valid(csr_io_o_commit_packs_modified_1_uop_valid),
    .io_o_commit_packs_modified_1_uop_pc(csr_io_o_commit_packs_modified_1_uop_pc),
    .io_o_commit_packs_modified_1_uop_inst(csr_io_o_commit_packs_modified_1_uop_inst),
    .io_o_commit_packs_modified_1_uop_func_code(csr_io_o_commit_packs_modified_1_uop_func_code),
    .io_o_commit_packs_modified_1_uop_branch_predict_pack_valid(
      csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_valid),
    .io_o_commit_packs_modified_1_uop_branch_predict_pack_target(
      csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_target),
    .io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type(
      csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type),
    .io_o_commit_packs_modified_1_uop_branch_predict_pack_select(
      csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_select),
    .io_o_commit_packs_modified_1_uop_branch_predict_pack_taken(
      csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_taken),
    .io_o_commit_packs_modified_1_uop_phy_dst(csr_io_o_commit_packs_modified_1_uop_phy_dst),
    .io_o_commit_packs_modified_1_uop_stale_dst(csr_io_o_commit_packs_modified_1_uop_stale_dst),
    .io_o_commit_packs_modified_1_uop_arch_dst(csr_io_o_commit_packs_modified_1_uop_arch_dst),
    .io_o_commit_packs_modified_1_uop_inst_type(csr_io_o_commit_packs_modified_1_uop_inst_type),
    .io_o_commit_packs_modified_1_uop_regWen(csr_io_o_commit_packs_modified_1_uop_regWen),
    .io_o_commit_packs_modified_1_uop_src1_valid(csr_io_o_commit_packs_modified_1_uop_src1_valid),
    .io_o_commit_packs_modified_1_uop_phy_rs1(csr_io_o_commit_packs_modified_1_uop_phy_rs1),
    .io_o_commit_packs_modified_1_uop_arch_rs1(csr_io_o_commit_packs_modified_1_uop_arch_rs1),
    .io_o_commit_packs_modified_1_uop_src2_valid(csr_io_o_commit_packs_modified_1_uop_src2_valid),
    .io_o_commit_packs_modified_1_uop_phy_rs2(csr_io_o_commit_packs_modified_1_uop_phy_rs2),
    .io_o_commit_packs_modified_1_uop_arch_rs2(csr_io_o_commit_packs_modified_1_uop_arch_rs2),
    .io_o_commit_packs_modified_1_uop_rob_idx(csr_io_o_commit_packs_modified_1_uop_rob_idx),
    .io_o_commit_packs_modified_1_uop_imm(csr_io_o_commit_packs_modified_1_uop_imm),
    .io_o_commit_packs_modified_1_uop_dst_value(csr_io_o_commit_packs_modified_1_uop_dst_value),
    .io_o_commit_packs_modified_1_uop_src1_value(csr_io_o_commit_packs_modified_1_uop_src1_value),
    .io_o_commit_packs_modified_1_uop_src2_value(csr_io_o_commit_packs_modified_1_uop_src2_value),
    .io_o_commit_packs_modified_1_uop_op1_sel(csr_io_o_commit_packs_modified_1_uop_op1_sel),
    .io_o_commit_packs_modified_1_uop_op2_sel(csr_io_o_commit_packs_modified_1_uop_op2_sel),
    .io_o_commit_packs_modified_1_uop_alu_sel(csr_io_o_commit_packs_modified_1_uop_alu_sel),
    .io_o_commit_packs_modified_1_uop_branch_type(csr_io_o_commit_packs_modified_1_uop_branch_type),
    .io_o_commit_packs_modified_1_uop_mem_type(csr_io_o_commit_packs_modified_1_uop_mem_type),
    .io_o_mepc(csr_io_o_mepc),
    .io_o_mtvec(csr_io_o_mtvec),
    .io_o_mcause(csr_io_o_mcause),
    .io_o_mstatus(csr_io_o_mstatus)
  );
  Interrupt_Mask interrupt_mask ( // @[backend_with_decode.scala 47:32]
    .clock(interrupt_mask_clock),
    .reset(interrupt_mask_reset),
    .io_i_lsu_uop_valid(interrupt_mask_io_i_lsu_uop_valid),
    .io_i_rob_idx(interrupt_mask_io_i_rob_idx),
    .io_i_lsu_uop_rob_idx(interrupt_mask_io_i_lsu_uop_rob_idx),
    .io_i_interrupt(interrupt_mask_io_i_interrupt),
    .io_o_interrupt_with_mask(interrupt_mask_io_o_interrupt_with_mask)
  );
  Arch_RegFile arch_regs ( // @[backend_with_decode.scala 160:27]
    .io_i_pregs_0(arch_regs_io_i_pregs_0),
    .io_i_pregs_1(arch_regs_io_i_pregs_1),
    .io_i_pregs_2(arch_regs_io_i_pregs_2),
    .io_i_pregs_3(arch_regs_io_i_pregs_3),
    .io_i_pregs_4(arch_regs_io_i_pregs_4),
    .io_i_pregs_5(arch_regs_io_i_pregs_5),
    .io_i_pregs_6(arch_regs_io_i_pregs_6),
    .io_i_pregs_7(arch_regs_io_i_pregs_7),
    .io_i_pregs_8(arch_regs_io_i_pregs_8),
    .io_i_pregs_9(arch_regs_io_i_pregs_9),
    .io_i_pregs_10(arch_regs_io_i_pregs_10),
    .io_i_pregs_11(arch_regs_io_i_pregs_11),
    .io_i_pregs_12(arch_regs_io_i_pregs_12),
    .io_i_pregs_13(arch_regs_io_i_pregs_13),
    .io_i_pregs_14(arch_regs_io_i_pregs_14),
    .io_i_pregs_15(arch_regs_io_i_pregs_15),
    .io_i_pregs_16(arch_regs_io_i_pregs_16),
    .io_i_pregs_17(arch_regs_io_i_pregs_17),
    .io_i_pregs_18(arch_regs_io_i_pregs_18),
    .io_i_pregs_19(arch_regs_io_i_pregs_19),
    .io_i_pregs_20(arch_regs_io_i_pregs_20),
    .io_i_pregs_21(arch_regs_io_i_pregs_21),
    .io_i_pregs_22(arch_regs_io_i_pregs_22),
    .io_i_pregs_23(arch_regs_io_i_pregs_23),
    .io_i_pregs_24(arch_regs_io_i_pregs_24),
    .io_i_pregs_25(arch_regs_io_i_pregs_25),
    .io_i_pregs_26(arch_regs_io_i_pregs_26),
    .io_i_pregs_27(arch_regs_io_i_pregs_27),
    .io_i_pregs_28(arch_regs_io_i_pregs_28),
    .io_i_pregs_29(arch_regs_io_i_pregs_29),
    .io_i_pregs_30(arch_regs_io_i_pregs_30),
    .io_i_pregs_31(arch_regs_io_i_pregs_31),
    .io_i_pregs_32(arch_regs_io_i_pregs_32),
    .io_i_pregs_33(arch_regs_io_i_pregs_33),
    .io_i_pregs_34(arch_regs_io_i_pregs_34),
    .io_i_pregs_35(arch_regs_io_i_pregs_35),
    .io_i_pregs_36(arch_regs_io_i_pregs_36),
    .io_i_pregs_37(arch_regs_io_i_pregs_37),
    .io_i_pregs_38(arch_regs_io_i_pregs_38),
    .io_i_pregs_39(arch_regs_io_i_pregs_39),
    .io_i_pregs_40(arch_regs_io_i_pregs_40),
    .io_i_pregs_41(arch_regs_io_i_pregs_41),
    .io_i_pregs_42(arch_regs_io_i_pregs_42),
    .io_i_pregs_43(arch_regs_io_i_pregs_43),
    .io_i_pregs_44(arch_regs_io_i_pregs_44),
    .io_i_pregs_45(arch_regs_io_i_pregs_45),
    .io_i_pregs_46(arch_regs_io_i_pregs_46),
    .io_i_pregs_47(arch_regs_io_i_pregs_47),
    .io_i_pregs_48(arch_regs_io_i_pregs_48),
    .io_i_pregs_49(arch_regs_io_i_pregs_49),
    .io_i_pregs_50(arch_regs_io_i_pregs_50),
    .io_i_pregs_51(arch_regs_io_i_pregs_51),
    .io_i_pregs_52(arch_regs_io_i_pregs_52),
    .io_i_pregs_53(arch_regs_io_i_pregs_53),
    .io_i_pregs_54(arch_regs_io_i_pregs_54),
    .io_i_pregs_55(arch_regs_io_i_pregs_55),
    .io_i_pregs_56(arch_regs_io_i_pregs_56),
    .io_i_pregs_57(arch_regs_io_i_pregs_57),
    .io_i_pregs_58(arch_regs_io_i_pregs_58),
    .io_i_pregs_59(arch_regs_io_i_pregs_59),
    .io_i_pregs_60(arch_regs_io_i_pregs_60),
    .io_i_pregs_61(arch_regs_io_i_pregs_61),
    .io_i_pregs_62(arch_regs_io_i_pregs_62),
    .io_i_pregs_63(arch_regs_io_i_pregs_63),
    .io_i_pregs_64(arch_regs_io_i_pregs_64),
    .io_i_pregs_65(arch_regs_io_i_pregs_65),
    .io_i_pregs_66(arch_regs_io_i_pregs_66),
    .io_i_pregs_67(arch_regs_io_i_pregs_67),
    .io_i_pregs_68(arch_regs_io_i_pregs_68),
    .io_i_pregs_69(arch_regs_io_i_pregs_69),
    .io_i_pregs_70(arch_regs_io_i_pregs_70),
    .io_i_pregs_71(arch_regs_io_i_pregs_71),
    .io_i_pregs_72(arch_regs_io_i_pregs_72),
    .io_i_pregs_73(arch_regs_io_i_pregs_73),
    .io_i_pregs_74(arch_regs_io_i_pregs_74),
    .io_i_pregs_75(arch_regs_io_i_pregs_75),
    .io_i_pregs_76(arch_regs_io_i_pregs_76),
    .io_i_pregs_77(arch_regs_io_i_pregs_77),
    .io_i_pregs_78(arch_regs_io_i_pregs_78),
    .io_i_pregs_79(arch_regs_io_i_pregs_79),
    .io_i_pregs_80(arch_regs_io_i_pregs_80),
    .io_i_pregs_81(arch_regs_io_i_pregs_81),
    .io_i_pregs_82(arch_regs_io_i_pregs_82),
    .io_i_pregs_83(arch_regs_io_i_pregs_83),
    .io_i_pregs_84(arch_regs_io_i_pregs_84),
    .io_i_pregs_85(arch_regs_io_i_pregs_85),
    .io_i_pregs_86(arch_regs_io_i_pregs_86),
    .io_i_pregs_87(arch_regs_io_i_pregs_87),
    .io_i_pregs_88(arch_regs_io_i_pregs_88),
    .io_i_pregs_89(arch_regs_io_i_pregs_89),
    .io_i_pregs_90(arch_regs_io_i_pregs_90),
    .io_i_pregs_91(arch_regs_io_i_pregs_91),
    .io_i_pregs_92(arch_regs_io_i_pregs_92),
    .io_i_pregs_93(arch_regs_io_i_pregs_93),
    .io_i_pregs_94(arch_regs_io_i_pregs_94),
    .io_i_pregs_95(arch_regs_io_i_pregs_95),
    .io_i_pregs_96(arch_regs_io_i_pregs_96),
    .io_i_pregs_97(arch_regs_io_i_pregs_97),
    .io_i_pregs_98(arch_regs_io_i_pregs_98),
    .io_i_pregs_99(arch_regs_io_i_pregs_99),
    .io_i_pregs_100(arch_regs_io_i_pregs_100),
    .io_i_pregs_101(arch_regs_io_i_pregs_101),
    .io_i_pregs_102(arch_regs_io_i_pregs_102),
    .io_i_pregs_103(arch_regs_io_i_pregs_103),
    .io_i_pregs_104(arch_regs_io_i_pregs_104),
    .io_i_pregs_105(arch_regs_io_i_pregs_105),
    .io_i_pregs_106(arch_regs_io_i_pregs_106),
    .io_i_pregs_107(arch_regs_io_i_pregs_107),
    .io_i_pregs_108(arch_regs_io_i_pregs_108),
    .io_i_pregs_109(arch_regs_io_i_pregs_109),
    .io_i_pregs_110(arch_regs_io_i_pregs_110),
    .io_i_pregs_111(arch_regs_io_i_pregs_111),
    .io_i_pregs_112(arch_regs_io_i_pregs_112),
    .io_i_pregs_113(arch_regs_io_i_pregs_113),
    .io_i_pregs_114(arch_regs_io_i_pregs_114),
    .io_i_pregs_115(arch_regs_io_i_pregs_115),
    .io_i_pregs_116(arch_regs_io_i_pregs_116),
    .io_i_pregs_117(arch_regs_io_i_pregs_117),
    .io_i_pregs_118(arch_regs_io_i_pregs_118),
    .io_i_pregs_119(arch_regs_io_i_pregs_119),
    .io_i_pregs_120(arch_regs_io_i_pregs_120),
    .io_i_pregs_121(arch_regs_io_i_pregs_121),
    .io_i_pregs_122(arch_regs_io_i_pregs_122),
    .io_i_pregs_123(arch_regs_io_i_pregs_123),
    .io_i_pregs_124(arch_regs_io_i_pregs_124),
    .io_i_pregs_125(arch_regs_io_i_pregs_125),
    .io_i_pregs_126(arch_regs_io_i_pregs_126),
    .io_i_pregs_127(arch_regs_io_i_pregs_127),
    .io_i_rename_table_0(arch_regs_io_i_rename_table_0),
    .io_i_rename_table_1(arch_regs_io_i_rename_table_1),
    .io_i_rename_table_2(arch_regs_io_i_rename_table_2),
    .io_i_rename_table_3(arch_regs_io_i_rename_table_3),
    .io_i_rename_table_4(arch_regs_io_i_rename_table_4),
    .io_i_rename_table_5(arch_regs_io_i_rename_table_5),
    .io_i_rename_table_6(arch_regs_io_i_rename_table_6),
    .io_i_rename_table_7(arch_regs_io_i_rename_table_7),
    .io_i_rename_table_8(arch_regs_io_i_rename_table_8),
    .io_i_rename_table_9(arch_regs_io_i_rename_table_9),
    .io_i_rename_table_10(arch_regs_io_i_rename_table_10),
    .io_i_rename_table_11(arch_regs_io_i_rename_table_11),
    .io_i_rename_table_12(arch_regs_io_i_rename_table_12),
    .io_i_rename_table_13(arch_regs_io_i_rename_table_13),
    .io_i_rename_table_14(arch_regs_io_i_rename_table_14),
    .io_i_rename_table_15(arch_regs_io_i_rename_table_15),
    .io_i_rename_table_16(arch_regs_io_i_rename_table_16),
    .io_i_rename_table_17(arch_regs_io_i_rename_table_17),
    .io_i_rename_table_18(arch_regs_io_i_rename_table_18),
    .io_i_rename_table_19(arch_regs_io_i_rename_table_19),
    .io_i_rename_table_20(arch_regs_io_i_rename_table_20),
    .io_i_rename_table_21(arch_regs_io_i_rename_table_21),
    .io_i_rename_table_22(arch_regs_io_i_rename_table_22),
    .io_i_rename_table_23(arch_regs_io_i_rename_table_23),
    .io_i_rename_table_24(arch_regs_io_i_rename_table_24),
    .io_i_rename_table_25(arch_regs_io_i_rename_table_25),
    .io_i_rename_table_26(arch_regs_io_i_rename_table_26),
    .io_i_rename_table_27(arch_regs_io_i_rename_table_27),
    .io_i_rename_table_28(arch_regs_io_i_rename_table_28),
    .io_i_rename_table_29(arch_regs_io_i_rename_table_29),
    .io_i_rename_table_30(arch_regs_io_i_rename_table_30),
    .io_i_rename_table_31(arch_regs_io_i_rename_table_31),
    .io_i_csrs_0(arch_regs_io_i_csrs_0),
    .io_i_csrs_1(arch_regs_io_i_csrs_1),
    .io_i_csrs_2(arch_regs_io_i_csrs_2),
    .io_i_csrs_3(arch_regs_io_i_csrs_3),
    .io_o_arch_regs_0(arch_regs_io_o_arch_regs_0),
    .io_o_arch_regs_1(arch_regs_io_o_arch_regs_1),
    .io_o_arch_regs_2(arch_regs_io_o_arch_regs_2),
    .io_o_arch_regs_3(arch_regs_io_o_arch_regs_3),
    .io_o_arch_regs_4(arch_regs_io_o_arch_regs_4),
    .io_o_arch_regs_5(arch_regs_io_o_arch_regs_5),
    .io_o_arch_regs_6(arch_regs_io_o_arch_regs_6),
    .io_o_arch_regs_7(arch_regs_io_o_arch_regs_7),
    .io_o_arch_regs_8(arch_regs_io_o_arch_regs_8),
    .io_o_arch_regs_9(arch_regs_io_o_arch_regs_9),
    .io_o_arch_regs_10(arch_regs_io_o_arch_regs_10),
    .io_o_arch_regs_11(arch_regs_io_o_arch_regs_11),
    .io_o_arch_regs_12(arch_regs_io_o_arch_regs_12),
    .io_o_arch_regs_13(arch_regs_io_o_arch_regs_13),
    .io_o_arch_regs_14(arch_regs_io_o_arch_regs_14),
    .io_o_arch_regs_15(arch_regs_io_o_arch_regs_15),
    .io_o_arch_regs_16(arch_regs_io_o_arch_regs_16),
    .io_o_arch_regs_17(arch_regs_io_o_arch_regs_17),
    .io_o_arch_regs_18(arch_regs_io_o_arch_regs_18),
    .io_o_arch_regs_19(arch_regs_io_o_arch_regs_19),
    .io_o_arch_regs_20(arch_regs_io_o_arch_regs_20),
    .io_o_arch_regs_21(arch_regs_io_o_arch_regs_21),
    .io_o_arch_regs_22(arch_regs_io_o_arch_regs_22),
    .io_o_arch_regs_23(arch_regs_io_o_arch_regs_23),
    .io_o_arch_regs_24(arch_regs_io_o_arch_regs_24),
    .io_o_arch_regs_25(arch_regs_io_o_arch_regs_25),
    .io_o_arch_regs_26(arch_regs_io_o_arch_regs_26),
    .io_o_arch_regs_27(arch_regs_io_o_arch_regs_27),
    .io_o_arch_regs_28(arch_regs_io_o_arch_regs_28),
    .io_o_arch_regs_29(arch_regs_io_o_arch_regs_29),
    .io_o_arch_regs_30(arch_regs_io_o_arch_regs_30),
    .io_o_arch_regs_31(arch_regs_io_o_arch_regs_31),
    .io_o_csr_regs_0(arch_regs_io_o_csr_regs_0),
    .io_o_csr_regs_1(arch_regs_io_o_csr_regs_1),
    .io_o_csr_regs_2(arch_regs_io_o_csr_regs_2),
    .io_o_csr_regs_3(arch_regs_io_o_csr_regs_3)
  );
  assign io_i_fetch_pack_ready = decode_io_i_fetch_pack_ready; // @[backend_with_decode.scala 50:28]
  assign io_o_branch_resolve_pack_valid = execute_io_o_branch_resolve_pack_valid; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_mispred = execute_io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_taken = execute_io_o_branch_resolve_pack_taken; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_pc = execute_io_o_branch_resolve_pack_pc; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_target = execute_io_o_branch_resolve_pack_target; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_rob_idx = execute_io_o_branch_resolve_pack_rob_idx; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_prediction_valid = execute_io_o_branch_resolve_pack_prediction_valid; // @[backend_with_decode.scala 154:30]
  assign io_o_branch_resolve_pack_branch_type = execute_io_o_branch_resolve_pack_branch_type; // @[backend_with_decode.scala 154:30]
  assign io_o_stall = _rename_io_i_stall_T | rename_io_o_free_list_empty; // @[backend_with_decode.scala 155:66]
  assign io_o_pc_redirect_valid = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 156:28]
  assign io_o_pc_redirect_target = csr_io_o_pc_redirect_target; // @[backend_with_decode.scala 157:29]
  assign io_dcache_io_addr_valid = execute_io_dcache_io_addr_valid; // @[backend_with_decode.scala 111:38]
  assign io_dcache_io_Mwout = execute_io_dcache_io_Mwout; // @[backend_with_decode.scala 115:37]
  assign io_dcache_io_Maddr = execute_io_dcache_io_Maddr; // @[backend_with_decode.scala 116:37]
  assign io_dcache_io_Men = execute_io_dcache_io_Men; // @[backend_with_decode.scala 117:37]
  assign io_dcache_io_Mlen = execute_io_dcache_io_Mlen; // @[backend_with_decode.scala 118:37]
  assign io_dcache_io_MdataOut = execute_io_dcache_io_MdataOut; // @[backend_with_decode.scala 119:37]
  assign io_o_dbg_commit_packs_0_valid = csr_io_o_commit_packs_modified_0_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_valid = csr_io_o_commit_packs_modified_0_uop_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_pc = csr_io_o_commit_packs_modified_0_uop_pc; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_inst = csr_io_o_commit_packs_modified_0_uop_inst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_func_code = csr_io_o_commit_packs_modified_0_uop_func_code; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid =
    csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_target =
    csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type =
    csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_select =
    csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken =
    csr_io_o_commit_packs_modified_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_phy_dst = csr_io_o_commit_packs_modified_0_uop_phy_dst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_stale_dst = csr_io_o_commit_packs_modified_0_uop_stale_dst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_arch_dst = csr_io_o_commit_packs_modified_0_uop_arch_dst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_inst_type = csr_io_o_commit_packs_modified_0_uop_inst_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_regWen = csr_io_o_commit_packs_modified_0_uop_regWen; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_src1_valid = csr_io_o_commit_packs_modified_0_uop_src1_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_phy_rs1 = csr_io_o_commit_packs_modified_0_uop_phy_rs1; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_arch_rs1 = csr_io_o_commit_packs_modified_0_uop_arch_rs1; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_src2_valid = csr_io_o_commit_packs_modified_0_uop_src2_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_phy_rs2 = csr_io_o_commit_packs_modified_0_uop_phy_rs2; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_arch_rs2 = csr_io_o_commit_packs_modified_0_uop_arch_rs2; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_rob_idx = csr_io_o_commit_packs_modified_0_uop_rob_idx; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_imm = csr_io_o_commit_packs_modified_0_uop_imm; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_dst_value = csr_io_o_commit_packs_modified_0_uop_dst_value; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_src1_value = csr_io_o_commit_packs_modified_0_uop_src1_value; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_src2_value = csr_io_o_commit_packs_modified_0_uop_src2_value; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_op1_sel = csr_io_o_commit_packs_modified_0_uop_op1_sel; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_op2_sel = csr_io_o_commit_packs_modified_0_uop_op2_sel; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_alu_sel = csr_io_o_commit_packs_modified_0_uop_alu_sel; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_branch_type = csr_io_o_commit_packs_modified_0_uop_branch_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_0_uop_mem_type = csr_io_o_commit_packs_modified_0_uop_mem_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_valid = csr_io_o_commit_packs_modified_1_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_valid = csr_io_o_commit_packs_modified_1_uop_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_pc = csr_io_o_commit_packs_modified_1_uop_pc; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_inst = csr_io_o_commit_packs_modified_1_uop_inst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_func_code = csr_io_o_commit_packs_modified_1_uop_func_code; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid =
    csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_target =
    csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type =
    csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_select =
    csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken =
    csr_io_o_commit_packs_modified_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_phy_dst = csr_io_o_commit_packs_modified_1_uop_phy_dst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_stale_dst = csr_io_o_commit_packs_modified_1_uop_stale_dst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_arch_dst = csr_io_o_commit_packs_modified_1_uop_arch_dst; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_inst_type = csr_io_o_commit_packs_modified_1_uop_inst_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_regWen = csr_io_o_commit_packs_modified_1_uop_regWen; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_src1_valid = csr_io_o_commit_packs_modified_1_uop_src1_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_phy_rs1 = csr_io_o_commit_packs_modified_1_uop_phy_rs1; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_arch_rs1 = csr_io_o_commit_packs_modified_1_uop_arch_rs1; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_src2_valid = csr_io_o_commit_packs_modified_1_uop_src2_valid; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_phy_rs2 = csr_io_o_commit_packs_modified_1_uop_phy_rs2; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_arch_rs2 = csr_io_o_commit_packs_modified_1_uop_arch_rs2; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_rob_idx = csr_io_o_commit_packs_modified_1_uop_rob_idx; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_imm = csr_io_o_commit_packs_modified_1_uop_imm; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_dst_value = csr_io_o_commit_packs_modified_1_uop_dst_value; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_src1_value = csr_io_o_commit_packs_modified_1_uop_src1_value; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_src2_value = csr_io_o_commit_packs_modified_1_uop_src2_value; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_op1_sel = csr_io_o_commit_packs_modified_1_uop_op1_sel; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_op2_sel = csr_io_o_commit_packs_modified_1_uop_op2_sel; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_alu_sel = csr_io_o_commit_packs_modified_1_uop_alu_sel; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_branch_type = csr_io_o_commit_packs_modified_1_uop_branch_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_commit_packs_1_uop_mem_type = csr_io_o_commit_packs_modified_1_uop_mem_type; // @[backend_with_decode.scala 174:27]
  assign io_o_dbg_stop = csr_io_o_commit_packs_modified_0_valid & csr_io_o_commit_packs_modified_0_uop_inst == 32'h100073
    ; // @[backend_with_decode.scala 176:62]
  assign io_o_dbg_arch_regs_0 = arch_regs_output_0; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_1 = arch_regs_output_1; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_2 = arch_regs_output_2; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_3 = arch_regs_output_3; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_4 = arch_regs_output_4; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_5 = arch_regs_output_5; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_6 = arch_regs_output_6; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_7 = arch_regs_output_7; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_8 = arch_regs_output_8; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_9 = arch_regs_output_9; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_10 = arch_regs_output_10; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_11 = arch_regs_output_11; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_12 = arch_regs_output_12; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_13 = arch_regs_output_13; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_14 = arch_regs_output_14; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_15 = arch_regs_output_15; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_16 = arch_regs_output_16; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_17 = arch_regs_output_17; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_18 = arch_regs_output_18; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_19 = arch_regs_output_19; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_20 = arch_regs_output_20; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_21 = arch_regs_output_21; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_22 = arch_regs_output_22; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_23 = arch_regs_output_23; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_24 = arch_regs_output_24; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_25 = arch_regs_output_25; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_26 = arch_regs_output_26; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_27 = arch_regs_output_27; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_28 = arch_regs_output_28; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_29 = arch_regs_output_29; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_30 = arch_regs_output_30; // @[backend_with_decode.scala 177:24]
  assign io_o_dbg_arch_regs_31 = arch_regs_output_31; // @[backend_with_decode.scala 177:24]
  assign decode_clock = clock;
  assign decode_reset = reset;
  assign decode_io_i_fetch_pack_valid = io_i_fetch_pack_valid; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_valids_0 = io_i_fetch_pack_bits_valids_0; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_valids_1 = io_i_fetch_pack_bits_valids_1; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_pc = io_i_fetch_pack_bits_pc; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_insts_0 = io_i_fetch_pack_bits_insts_0; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_insts_1 = io_i_fetch_pack_bits_insts_1; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_branch_predict_pack_valid = io_i_fetch_pack_bits_branch_predict_pack_valid; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_branch_predict_pack_target = io_i_fetch_pack_bits_branch_predict_pack_target; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_branch_predict_pack_branch_type =
    io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_branch_predict_pack_select = io_i_fetch_pack_bits_branch_predict_pack_select; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_fetch_pack_bits_branch_predict_pack_taken = io_i_fetch_pack_bits_branch_predict_pack_taken; // @[backend_with_decode.scala 50:28]
  assign decode_io_i_exception = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 51:27]
  assign decode_io_i_branch_resolve_pack_valid = io_o_branch_resolve_pack_valid; // @[backend_with_decode.scala 52:37]
  assign decode_io_i_branch_resolve_pack_mispred = io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 52:37]
  assign decode_io_i_stall = io_o_stall; // @[backend_with_decode.scala 53:23]
  assign rename_clock = clock;
  assign rename_reset = reset;
  assign rename_io_i_decode_packs_0_valid = decode_io_o_decode_packs_0_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_pc = decode_io_o_decode_packs_0_pc; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_inst = decode_io_o_decode_packs_0_inst; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_func_code = decode_io_o_decode_packs_0_func_code; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_branch_predict_pack_valid = decode_io_o_decode_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_branch_predict_pack_target = decode_io_o_decode_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_branch_predict_pack_branch_type =
    decode_io_o_decode_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_branch_predict_pack_select = decode_io_o_decode_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_branch_predict_pack_taken = decode_io_o_decode_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_arch_dst = decode_io_o_decode_packs_0_arch_dst; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_inst_type = decode_io_o_decode_packs_0_inst_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_regWen = decode_io_o_decode_packs_0_regWen; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_src1_valid = decode_io_o_decode_packs_0_src1_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_arch_rs1 = decode_io_o_decode_packs_0_arch_rs1; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_src2_valid = decode_io_o_decode_packs_0_src2_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_arch_rs2 = decode_io_o_decode_packs_0_arch_rs2; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_imm = decode_io_o_decode_packs_0_imm; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_src1_value = decode_io_o_decode_packs_0_src1_value; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_src2_value = decode_io_o_decode_packs_0_src2_value; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_op1_sel = decode_io_o_decode_packs_0_op1_sel; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_op2_sel = decode_io_o_decode_packs_0_op2_sel; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_alu_sel = decode_io_o_decode_packs_0_alu_sel; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_branch_type = decode_io_o_decode_packs_0_branch_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_0_mem_type = decode_io_o_decode_packs_0_mem_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_valid = decode_io_o_decode_packs_1_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_pc = decode_io_o_decode_packs_1_pc; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_inst = decode_io_o_decode_packs_1_inst; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_func_code = decode_io_o_decode_packs_1_func_code; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_branch_predict_pack_valid = decode_io_o_decode_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_branch_predict_pack_target = decode_io_o_decode_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_branch_predict_pack_branch_type =
    decode_io_o_decode_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_branch_predict_pack_select = decode_io_o_decode_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_branch_predict_pack_taken = decode_io_o_decode_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_arch_dst = decode_io_o_decode_packs_1_arch_dst; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_inst_type = decode_io_o_decode_packs_1_inst_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_regWen = decode_io_o_decode_packs_1_regWen; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_src1_valid = decode_io_o_decode_packs_1_src1_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_arch_rs1 = decode_io_o_decode_packs_1_arch_rs1; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_src2_valid = decode_io_o_decode_packs_1_src2_valid; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_arch_rs2 = decode_io_o_decode_packs_1_arch_rs2; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_imm = decode_io_o_decode_packs_1_imm; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_src1_value = decode_io_o_decode_packs_1_src1_value; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_src2_value = decode_io_o_decode_packs_1_src2_value; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_op1_sel = decode_io_o_decode_packs_1_op1_sel; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_op2_sel = decode_io_o_decode_packs_1_op2_sel; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_alu_sel = decode_io_o_decode_packs_1_alu_sel; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_branch_type = decode_io_o_decode_packs_1_branch_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_decode_packs_1_mem_type = decode_io_o_decode_packs_1_mem_type; // @[backend_with_decode.scala 56:35]
  assign rename_io_i_commit_packs_0_valid = csr_io_o_commit_packs_modified_0_valid; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_0_uop_phy_dst = csr_io_o_commit_packs_modified_0_uop_phy_dst; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_0_uop_stale_dst = csr_io_o_commit_packs_modified_0_uop_stale_dst; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_0_uop_arch_dst = csr_io_o_commit_packs_modified_0_uop_arch_dst; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_1_valid = csr_io_o_commit_packs_modified_1_valid; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_1_uop_phy_dst = csr_io_o_commit_packs_modified_1_uop_phy_dst; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_1_uop_stale_dst = csr_io_o_commit_packs_modified_1_uop_stale_dst; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_commit_packs_1_uop_arch_dst = csr_io_o_commit_packs_modified_1_uop_arch_dst; // @[backend_with_decode.scala 57:35]
  assign rename_io_i_rollback_packs_0_valid = rob_io_o_rollback_packs_0_valid; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_0_uop_phy_dst = rob_io_o_rollback_packs_0_uop_phy_dst; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_0_uop_stale_dst = rob_io_o_rollback_packs_0_uop_stale_dst; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_0_uop_arch_dst = rob_io_o_rollback_packs_0_uop_arch_dst; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_1_valid = rob_io_o_rollback_packs_1_valid; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_1_uop_phy_dst = rob_io_o_rollback_packs_1_uop_phy_dst; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_1_uop_stale_dst = rob_io_o_rollback_packs_1_uop_stale_dst; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_rollback_packs_1_uop_arch_dst = rob_io_o_rollback_packs_1_uop_arch_dst; // @[backend_with_decode.scala 58:35]
  assign rename_io_i_flush_for_branch = execute_io_o_branch_resolve_pack_valid &
    execute_io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 59:77]
  assign rename_io_i_exception = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 60:35]
  assign rename_io_i_stall = rob_io_o_full | reservation_station_io_o_full; // @[backend_with_decode.scala 61:52]
  assign dispatch_clock = clock;
  assign dispatch_reset = reset;
  assign dispatch_io_i_rename_packs_0_valid = rename_io_o_rename_packs_0_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_pc = rename_io_o_rename_packs_0_pc; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_inst = rename_io_o_rename_packs_0_inst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_func_code = rename_io_o_rename_packs_0_func_code; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_branch_predict_pack_valid = rename_io_o_rename_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_branch_predict_pack_target = rename_io_o_rename_packs_0_branch_predict_pack_target
    ; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_branch_predict_pack_branch_type =
    rename_io_o_rename_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_branch_predict_pack_select = rename_io_o_rename_packs_0_branch_predict_pack_select
    ; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_branch_predict_pack_taken = rename_io_o_rename_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_phy_dst = rename_io_o_rename_packs_0_phy_dst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_stale_dst = rename_io_o_rename_packs_0_stale_dst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_arch_dst = rename_io_o_rename_packs_0_arch_dst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_inst_type = rename_io_o_rename_packs_0_inst_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_regWen = rename_io_o_rename_packs_0_regWen; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_src1_valid = rename_io_o_rename_packs_0_src1_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_phy_rs1 = rename_io_o_rename_packs_0_phy_rs1; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_arch_rs1 = rename_io_o_rename_packs_0_arch_rs1; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_src2_valid = rename_io_o_rename_packs_0_src2_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_phy_rs2 = rename_io_o_rename_packs_0_phy_rs2; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_arch_rs2 = rename_io_o_rename_packs_0_arch_rs2; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_imm = rename_io_o_rename_packs_0_imm; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_src1_value = rename_io_o_rename_packs_0_src1_value; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_src2_value = rename_io_o_rename_packs_0_src2_value; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_op1_sel = rename_io_o_rename_packs_0_op1_sel; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_op2_sel = rename_io_o_rename_packs_0_op2_sel; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_alu_sel = rename_io_o_rename_packs_0_alu_sel; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_branch_type = rename_io_o_rename_packs_0_branch_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_0_mem_type = rename_io_o_rename_packs_0_mem_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_valid = rename_io_o_rename_packs_1_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_pc = rename_io_o_rename_packs_1_pc; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_inst = rename_io_o_rename_packs_1_inst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_func_code = rename_io_o_rename_packs_1_func_code; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_branch_predict_pack_valid = rename_io_o_rename_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_branch_predict_pack_target = rename_io_o_rename_packs_1_branch_predict_pack_target
    ; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_branch_predict_pack_branch_type =
    rename_io_o_rename_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_branch_predict_pack_select = rename_io_o_rename_packs_1_branch_predict_pack_select
    ; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_branch_predict_pack_taken = rename_io_o_rename_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_phy_dst = rename_io_o_rename_packs_1_phy_dst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_stale_dst = rename_io_o_rename_packs_1_stale_dst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_arch_dst = rename_io_o_rename_packs_1_arch_dst; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_inst_type = rename_io_o_rename_packs_1_inst_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_regWen = rename_io_o_rename_packs_1_regWen; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_src1_valid = rename_io_o_rename_packs_1_src1_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_phy_rs1 = rename_io_o_rename_packs_1_phy_rs1; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_arch_rs1 = rename_io_o_rename_packs_1_arch_rs1; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_src2_valid = rename_io_o_rename_packs_1_src2_valid; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_phy_rs2 = rename_io_o_rename_packs_1_phy_rs2; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_arch_rs2 = rename_io_o_rename_packs_1_arch_rs2; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_imm = rename_io_o_rename_packs_1_imm; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_src1_value = rename_io_o_rename_packs_1_src1_value; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_src2_value = rename_io_o_rename_packs_1_src2_value; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_op1_sel = rename_io_o_rename_packs_1_op1_sel; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_op2_sel = rename_io_o_rename_packs_1_op2_sel; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_alu_sel = rename_io_o_rename_packs_1_alu_sel; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_branch_type = rename_io_o_rename_packs_1_branch_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rename_packs_1_mem_type = rename_io_o_rename_packs_1_mem_type; // @[backend_with_decode.scala 64:45]
  assign dispatch_io_i_rob_busy = rob_io_o_full; // @[backend_with_decode.scala 65:45]
  assign dispatch_io_i_rob_allocation_ress_0_rob_idx = rob_io_o_rob_allocation_ress_0_rob_idx; // @[backend_with_decode.scala 66:45]
  assign dispatch_io_i_rob_allocation_ress_1_rob_idx = rob_io_o_rob_allocation_ress_1_rob_idx; // @[backend_with_decode.scala 66:45]
  assign dispatch_io_i_reservation_station_full = reservation_station_io_o_full; // @[backend_with_decode.scala 67:45]
  assign dispatch_io_i_branch_resolve_pack_valid = execute_io_o_branch_resolve_pack_valid; // @[backend_with_decode.scala 68:45]
  assign dispatch_io_i_branch_resolve_pack_mispred = execute_io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 68:45]
  assign dispatch_io_i_exception = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 69:45]
  assign reservation_station_clock = clock;
  assign reservation_station_reset = reset;
  assign reservation_station_io_i_dispatch_packs_0_valid = dispatch_io_o_dispatch_packs_0_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_pc = dispatch_io_o_dispatch_packs_0_pc; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_inst = dispatch_io_o_dispatch_packs_0_inst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_func_code = dispatch_io_o_dispatch_packs_0_func_code; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_branch_predict_pack_valid =
    dispatch_io_o_dispatch_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_branch_predict_pack_target =
    dispatch_io_o_dispatch_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_branch_predict_pack_branch_type =
    dispatch_io_o_dispatch_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_branch_predict_pack_select =
    dispatch_io_o_dispatch_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_branch_predict_pack_taken =
    dispatch_io_o_dispatch_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_phy_dst = dispatch_io_o_dispatch_packs_0_phy_dst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_stale_dst = dispatch_io_o_dispatch_packs_0_stale_dst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_arch_dst = dispatch_io_o_dispatch_packs_0_arch_dst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_inst_type = dispatch_io_o_dispatch_packs_0_inst_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_regWen = dispatch_io_o_dispatch_packs_0_regWen; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_src1_valid = dispatch_io_o_dispatch_packs_0_src1_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_phy_rs1 = dispatch_io_o_dispatch_packs_0_phy_rs1; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_arch_rs1 = dispatch_io_o_dispatch_packs_0_arch_rs1; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_src2_valid = dispatch_io_o_dispatch_packs_0_src2_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_phy_rs2 = dispatch_io_o_dispatch_packs_0_phy_rs2; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_arch_rs2 = dispatch_io_o_dispatch_packs_0_arch_rs2; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_rob_idx = dispatch_io_o_dispatch_packs_0_rob_idx; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_imm = dispatch_io_o_dispatch_packs_0_imm; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_src1_value = dispatch_io_o_dispatch_packs_0_src1_value; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_src2_value = dispatch_io_o_dispatch_packs_0_src2_value; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_op1_sel = dispatch_io_o_dispatch_packs_0_op1_sel; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_op2_sel = dispatch_io_o_dispatch_packs_0_op2_sel; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_alu_sel = dispatch_io_o_dispatch_packs_0_alu_sel; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_branch_type = dispatch_io_o_dispatch_packs_0_branch_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_0_mem_type = dispatch_io_o_dispatch_packs_0_mem_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_valid = dispatch_io_o_dispatch_packs_1_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_pc = dispatch_io_o_dispatch_packs_1_pc; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_inst = dispatch_io_o_dispatch_packs_1_inst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_func_code = dispatch_io_o_dispatch_packs_1_func_code; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_branch_predict_pack_valid =
    dispatch_io_o_dispatch_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_branch_predict_pack_target =
    dispatch_io_o_dispatch_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_branch_predict_pack_branch_type =
    dispatch_io_o_dispatch_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_branch_predict_pack_select =
    dispatch_io_o_dispatch_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_branch_predict_pack_taken =
    dispatch_io_o_dispatch_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_phy_dst = dispatch_io_o_dispatch_packs_1_phy_dst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_stale_dst = dispatch_io_o_dispatch_packs_1_stale_dst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_arch_dst = dispatch_io_o_dispatch_packs_1_arch_dst; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_inst_type = dispatch_io_o_dispatch_packs_1_inst_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_regWen = dispatch_io_o_dispatch_packs_1_regWen; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_src1_valid = dispatch_io_o_dispatch_packs_1_src1_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_phy_rs1 = dispatch_io_o_dispatch_packs_1_phy_rs1; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_arch_rs1 = dispatch_io_o_dispatch_packs_1_arch_rs1; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_src2_valid = dispatch_io_o_dispatch_packs_1_src2_valid; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_phy_rs2 = dispatch_io_o_dispatch_packs_1_phy_rs2; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_arch_rs2 = dispatch_io_o_dispatch_packs_1_arch_rs2; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_rob_idx = dispatch_io_o_dispatch_packs_1_rob_idx; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_imm = dispatch_io_o_dispatch_packs_1_imm; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_src1_value = dispatch_io_o_dispatch_packs_1_src1_value; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_src2_value = dispatch_io_o_dispatch_packs_1_src2_value; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_op1_sel = dispatch_io_o_dispatch_packs_1_op1_sel; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_op2_sel = dispatch_io_o_dispatch_packs_1_op2_sel; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_alu_sel = dispatch_io_o_dispatch_packs_1_alu_sel; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_branch_type = dispatch_io_o_dispatch_packs_1_branch_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_dispatch_packs_1_mem_type = dispatch_io_o_dispatch_packs_1_mem_type; // @[backend_with_decode.scala 77:45]
  assign reservation_station_io_i_wakeup_port = _written_back_table_with_bypass_T_8 |
    _written_back_table_with_bypass_T_16; // @[backend_with_decode.scala 75:204]
  assign reservation_station_io_i_ex_res_packs_0_valid = execute_io_o_ex_res_packs_0_valid; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_0_uop_func_code = execute_io_o_ex_res_packs_0_uop_func_code; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_0_uop_phy_dst = execute_io_o_ex_res_packs_0_uop_phy_dst; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_0_uop_dst_value = execute_io_o_ex_res_packs_0_uop_dst_value; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_1_valid = execute_io_o_ex_res_packs_1_valid; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_1_uop_func_code = execute_io_o_ex_res_packs_1_uop_func_code; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_1_uop_phy_dst = execute_io_o_ex_res_packs_1_uop_phy_dst; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_ex_res_packs_1_uop_dst_value = execute_io_o_ex_res_packs_1_uop_dst_value; // @[backend_with_decode.scala 82:43]
  assign reservation_station_io_i_branch_resolve_pack_valid = execute_io_o_branch_resolve_pack_valid; // @[backend_with_decode.scala 79:50]
  assign reservation_station_io_i_branch_resolve_pack_mispred = execute_io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 79:50]
  assign reservation_station_io_i_branch_resolve_pack_rob_idx = execute_io_o_branch_resolve_pack_rob_idx; // @[backend_with_decode.scala 79:50]
  assign reservation_station_io_i_exception = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 80:40]
  assign reservation_station_io_i_rollback_valid = rob_io_o_rollback_packs_0_valid | rob_io_o_rollback_packs_1_valid; // @[backend_with_decode.scala 84:81]
  assign reservation_station_io_i_available_funcs_0 = execute_io_o_available_funcs_0; // @[backend_with_decode.scala 81:46]
  assign reservation_station_io_i_available_funcs_1 = execute_io_o_available_funcs_1; // @[backend_with_decode.scala 81:46]
  assign reservation_station_io_i_available_funcs_2 = execute_io_o_available_funcs_2; // @[backend_with_decode.scala 81:46]
  assign reservation_station_io_i_available_funcs_3 = execute_io_o_available_funcs_3; // @[backend_with_decode.scala 81:46]
  assign reservation_station_io_i_available_funcs_4 = execute_io_o_available_funcs_4; // @[backend_with_decode.scala 81:46]
  assign reservation_station_io_i_available_funcs_5 = execute_io_o_available_funcs_5; // @[backend_with_decode.scala 81:46]
  assign reservation_station_io_i_ROB_first_entry = rob_io_o_rob_head; // @[backend_with_decode.scala 83:46]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_i_raddr1 = reservation_station_io_o_issue_packs_0_phy_rs1; // @[backend_with_decode.scala 140:25]
  assign regfile_io_i_raddr2 = reservation_station_io_o_issue_packs_0_phy_rs2; // @[backend_with_decode.scala 141:25]
  assign regfile_io_i_raddr3 = reservation_station_io_o_issue_packs_1_phy_rs1; // @[backend_with_decode.scala 142:25]
  assign regfile_io_i_raddr4 = reservation_station_io_o_issue_packs_1_phy_rs2; // @[backend_with_decode.scala 143:25]
  assign regfile_io_i_waddr1 = csr_io_o_commit_packs_modified_0_uop_phy_dst; // @[backend_with_decode.scala 145:29]
  assign regfile_io_i_waddr2 = csr_io_o_commit_packs_modified_1_uop_phy_dst; // @[backend_with_decode.scala 146:29]
  assign regfile_io_i_wdata1 = csr_io_o_commit_packs_modified_0_uop_dst_value; // @[backend_with_decode.scala 147:29]
  assign regfile_io_i_wdata2 = csr_io_o_commit_packs_modified_1_uop_dst_value; // @[backend_with_decode.scala 148:29]
  assign regfile_io_i_wenable1 = csr_io_o_commit_packs_modified_0_valid & csr_io_o_commit_packs_modified_0_uop_arch_dst
     != 5'h0; // @[backend_with_decode.scala 150:72]
  assign regfile_io_i_wenable2 = csr_io_o_commit_packs_modified_1_valid & csr_io_o_commit_packs_modified_1_uop_arch_dst
     != 5'h0; // @[backend_with_decode.scala 151:72]
  assign execute_clock = clock;
  assign execute_reset = reset;
  assign execute_io_i_issue_res_packs_0_valid = reservation_station_io_o_issue_packs_0_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_pc = reservation_station_io_o_issue_packs_0_pc; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_inst = reservation_station_io_o_issue_packs_0_inst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_func_code = reservation_station_io_o_issue_packs_0_func_code; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_branch_predict_pack_valid =
    reservation_station_io_o_issue_packs_0_branch_predict_pack_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_branch_predict_pack_target =
    reservation_station_io_o_issue_packs_0_branch_predict_pack_target; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_branch_predict_pack_branch_type =
    reservation_station_io_o_issue_packs_0_branch_predict_pack_branch_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_branch_predict_pack_select =
    reservation_station_io_o_issue_packs_0_branch_predict_pack_select; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_branch_predict_pack_taken =
    reservation_station_io_o_issue_packs_0_branch_predict_pack_taken; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_phy_dst = reservation_station_io_o_issue_packs_0_phy_dst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_stale_dst = reservation_station_io_o_issue_packs_0_stale_dst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_arch_dst = reservation_station_io_o_issue_packs_0_arch_dst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_inst_type = reservation_station_io_o_issue_packs_0_inst_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_regWen = reservation_station_io_o_issue_packs_0_regWen; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_src1_valid = reservation_station_io_o_issue_packs_0_src1_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_phy_rs1 = reservation_station_io_o_issue_packs_0_phy_rs1; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_arch_rs1 = reservation_station_io_o_issue_packs_0_arch_rs1; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_src2_valid = reservation_station_io_o_issue_packs_0_src2_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_phy_rs2 = reservation_station_io_o_issue_packs_0_phy_rs2; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_arch_rs2 = reservation_station_io_o_issue_packs_0_arch_rs2; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_rob_idx = reservation_station_io_o_issue_packs_0_rob_idx; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_imm = reservation_station_io_o_issue_packs_0_imm; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_src1_value = execute_io_i_issue_res_packs_0_op1_sel == 3'h0 & ~
    execute_io_i_issue_res_packs_0_src1_valid ? regfile_io_o_rdata1 : reservation_station_io_o_issue_packs_0_src1_value; // @[backend_with_decode.scala 95:110 90:34 96:52]
  assign execute_io_i_issue_res_packs_0_src2_value = execute_io_i_issue_res_packs_0_op2_sel == 3'h0 & ~
    execute_io_i_issue_res_packs_0_src2_valid ? regfile_io_o_rdata2 : reservation_station_io_o_issue_packs_0_src2_value; // @[backend_with_decode.scala 98:110 90:34 99:52]
  assign execute_io_i_issue_res_packs_0_op1_sel = reservation_station_io_o_issue_packs_0_op1_sel; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_op2_sel = reservation_station_io_o_issue_packs_0_op2_sel; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_alu_sel = reservation_station_io_o_issue_packs_0_alu_sel; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_branch_type = reservation_station_io_o_issue_packs_0_branch_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_0_mem_type = reservation_station_io_o_issue_packs_0_mem_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_valid = reservation_station_io_o_issue_packs_1_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_pc = reservation_station_io_o_issue_packs_1_pc; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_inst = reservation_station_io_o_issue_packs_1_inst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_func_code = reservation_station_io_o_issue_packs_1_func_code; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_branch_predict_pack_valid =
    reservation_station_io_o_issue_packs_1_branch_predict_pack_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_branch_predict_pack_target =
    reservation_station_io_o_issue_packs_1_branch_predict_pack_target; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_branch_predict_pack_branch_type =
    reservation_station_io_o_issue_packs_1_branch_predict_pack_branch_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_branch_predict_pack_select =
    reservation_station_io_o_issue_packs_1_branch_predict_pack_select; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_branch_predict_pack_taken =
    reservation_station_io_o_issue_packs_1_branch_predict_pack_taken; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_phy_dst = reservation_station_io_o_issue_packs_1_phy_dst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_stale_dst = reservation_station_io_o_issue_packs_1_stale_dst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_arch_dst = reservation_station_io_o_issue_packs_1_arch_dst; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_inst_type = reservation_station_io_o_issue_packs_1_inst_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_regWen = reservation_station_io_o_issue_packs_1_regWen; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_src1_valid = reservation_station_io_o_issue_packs_1_src1_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_phy_rs1 = reservation_station_io_o_issue_packs_1_phy_rs1; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_arch_rs1 = reservation_station_io_o_issue_packs_1_arch_rs1; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_src2_valid = reservation_station_io_o_issue_packs_1_src2_valid; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_phy_rs2 = reservation_station_io_o_issue_packs_1_phy_rs2; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_arch_rs2 = reservation_station_io_o_issue_packs_1_arch_rs2; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_rob_idx = reservation_station_io_o_issue_packs_1_rob_idx; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_imm = reservation_station_io_o_issue_packs_1_imm; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_src1_value = execute_io_i_issue_res_packs_1_op1_sel == 3'h0 & ~
    execute_io_i_issue_res_packs_1_src1_valid ? regfile_io_o_rdata3 : reservation_station_io_o_issue_packs_1_src1_value; // @[backend_with_decode.scala 101:110 102:52 90:34]
  assign execute_io_i_issue_res_packs_1_src2_value = execute_io_i_issue_res_packs_1_op2_sel == 3'h0 & ~
    execute_io_i_issue_res_packs_1_src2_valid ? regfile_io_o_rdata4 : reservation_station_io_o_issue_packs_1_src2_value; // @[backend_with_decode.scala 104:110 105:52 90:34]
  assign execute_io_i_issue_res_packs_1_op1_sel = reservation_station_io_o_issue_packs_1_op1_sel; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_op2_sel = reservation_station_io_o_issue_packs_1_op2_sel; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_alu_sel = reservation_station_io_o_issue_packs_1_alu_sel; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_branch_type = reservation_station_io_o_issue_packs_1_branch_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_issue_res_packs_1_mem_type = reservation_station_io_o_issue_packs_1_mem_type; // @[backend_with_decode.scala 90:34]
  assign execute_io_i_ROB_first_entry = rob_io_o_rob_head; // @[backend_with_decode.scala 91:34]
  assign execute_io_dcache_io_data_valid = io_dcache_io_data_valid; // @[backend_with_decode.scala 109:38]
  assign execute_io_dcache_io_addr_ready = io_dcache_io_addr_ready; // @[backend_with_decode.scala 113:37]
  assign execute_io_dcache_io_MdataIn = io_dcache_io_MdataIn; // @[backend_with_decode.scala 110:38]
  assign execute_io_i_exception = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 89:28]
  assign execute_io_i_rollback_valid = rob_io_o_rollback_packs_0_valid | rob_io_o_rollback_packs_1_valid; // @[backend_with_decode.scala 92:69]
  assign rob_clock = clock;
  assign rob_reset = reset;
  assign rob_io_i_rob_allocation_reqs_0_valid = dispatch_io_o_rob_allocation_reqs_0_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_valid = dispatch_io_o_rob_allocation_reqs_0_uop_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_pc = dispatch_io_o_rob_allocation_reqs_0_uop_pc; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_inst = dispatch_io_o_rob_allocation_reqs_0_uop_inst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_func_code = dispatch_io_o_rob_allocation_reqs_0_uop_func_code; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid =
    dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target =
    dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type =
    dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select =
    dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken =
    dispatch_io_o_rob_allocation_reqs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_phy_dst = dispatch_io_o_rob_allocation_reqs_0_uop_phy_dst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_stale_dst = dispatch_io_o_rob_allocation_reqs_0_uop_stale_dst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_arch_dst = dispatch_io_o_rob_allocation_reqs_0_uop_arch_dst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_inst_type = dispatch_io_o_rob_allocation_reqs_0_uop_inst_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_regWen = dispatch_io_o_rob_allocation_reqs_0_uop_regWen; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_src1_valid = dispatch_io_o_rob_allocation_reqs_0_uop_src1_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_phy_rs1 = dispatch_io_o_rob_allocation_reqs_0_uop_phy_rs1; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_arch_rs1 = dispatch_io_o_rob_allocation_reqs_0_uop_arch_rs1; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_src2_valid = dispatch_io_o_rob_allocation_reqs_0_uop_src2_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_phy_rs2 = dispatch_io_o_rob_allocation_reqs_0_uop_phy_rs2; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_arch_rs2 = dispatch_io_o_rob_allocation_reqs_0_uop_arch_rs2; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_imm = dispatch_io_o_rob_allocation_reqs_0_uop_imm; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_src1_value = dispatch_io_o_rob_allocation_reqs_0_uop_src1_value; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_src2_value = dispatch_io_o_rob_allocation_reqs_0_uop_src2_value; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_op1_sel = dispatch_io_o_rob_allocation_reqs_0_uop_op1_sel; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_op2_sel = dispatch_io_o_rob_allocation_reqs_0_uop_op2_sel; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_alu_sel = dispatch_io_o_rob_allocation_reqs_0_uop_alu_sel; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_branch_type = dispatch_io_o_rob_allocation_reqs_0_uop_branch_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_0_uop_mem_type = dispatch_io_o_rob_allocation_reqs_0_uop_mem_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_valid = dispatch_io_o_rob_allocation_reqs_1_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_valid = dispatch_io_o_rob_allocation_reqs_1_uop_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_pc = dispatch_io_o_rob_allocation_reqs_1_uop_pc; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_inst = dispatch_io_o_rob_allocation_reqs_1_uop_inst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_func_code = dispatch_io_o_rob_allocation_reqs_1_uop_func_code; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid =
    dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target =
    dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type =
    dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select =
    dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken =
    dispatch_io_o_rob_allocation_reqs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_phy_dst = dispatch_io_o_rob_allocation_reqs_1_uop_phy_dst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_stale_dst = dispatch_io_o_rob_allocation_reqs_1_uop_stale_dst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_arch_dst = dispatch_io_o_rob_allocation_reqs_1_uop_arch_dst; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_inst_type = dispatch_io_o_rob_allocation_reqs_1_uop_inst_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_regWen = dispatch_io_o_rob_allocation_reqs_1_uop_regWen; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_src1_valid = dispatch_io_o_rob_allocation_reqs_1_uop_src1_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_phy_rs1 = dispatch_io_o_rob_allocation_reqs_1_uop_phy_rs1; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_arch_rs1 = dispatch_io_o_rob_allocation_reqs_1_uop_arch_rs1; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_src2_valid = dispatch_io_o_rob_allocation_reqs_1_uop_src2_valid; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_phy_rs2 = dispatch_io_o_rob_allocation_reqs_1_uop_phy_rs2; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_arch_rs2 = dispatch_io_o_rob_allocation_reqs_1_uop_arch_rs2; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_imm = dispatch_io_o_rob_allocation_reqs_1_uop_imm; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_src1_value = dispatch_io_o_rob_allocation_reqs_1_uop_src1_value; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_src2_value = dispatch_io_o_rob_allocation_reqs_1_uop_src2_value; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_op1_sel = dispatch_io_o_rob_allocation_reqs_1_uop_op1_sel; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_op2_sel = dispatch_io_o_rob_allocation_reqs_1_uop_op2_sel; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_alu_sel = dispatch_io_o_rob_allocation_reqs_1_uop_alu_sel; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_branch_type = dispatch_io_o_rob_allocation_reqs_1_uop_branch_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_rob_allocation_reqs_1_uop_mem_type = dispatch_io_o_rob_allocation_reqs_1_uop_mem_type; // @[backend_with_decode.scala 122:34]
  assign rob_io_i_ex_res_packs_0_valid = execute_io_o_ex_res_packs_0_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_valid = execute_io_o_ex_res_packs_0_uop_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_pc = execute_io_o_ex_res_packs_0_uop_pc; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_inst = execute_io_o_ex_res_packs_0_uop_inst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_func_code = execute_io_o_ex_res_packs_0_uop_func_code; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_branch_predict_pack_valid =
    execute_io_o_ex_res_packs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_branch_predict_pack_target =
    execute_io_o_ex_res_packs_0_uop_branch_predict_pack_target; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type =
    execute_io_o_ex_res_packs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_branch_predict_pack_select =
    execute_io_o_ex_res_packs_0_uop_branch_predict_pack_select; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_branch_predict_pack_taken =
    execute_io_o_ex_res_packs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_phy_dst = execute_io_o_ex_res_packs_0_uop_phy_dst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_stale_dst = execute_io_o_ex_res_packs_0_uop_stale_dst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_arch_dst = execute_io_o_ex_res_packs_0_uop_arch_dst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_inst_type = execute_io_o_ex_res_packs_0_uop_inst_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_regWen = execute_io_o_ex_res_packs_0_uop_regWen; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_src1_valid = execute_io_o_ex_res_packs_0_uop_src1_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_phy_rs1 = execute_io_o_ex_res_packs_0_uop_phy_rs1; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_arch_rs1 = execute_io_o_ex_res_packs_0_uop_arch_rs1; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_src2_valid = execute_io_o_ex_res_packs_0_uop_src2_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_phy_rs2 = execute_io_o_ex_res_packs_0_uop_phy_rs2; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_arch_rs2 = execute_io_o_ex_res_packs_0_uop_arch_rs2; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_rob_idx = execute_io_o_ex_res_packs_0_uop_rob_idx; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_imm = execute_io_o_ex_res_packs_0_uop_imm; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_dst_value = execute_io_o_ex_res_packs_0_uop_dst_value; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_src1_value = execute_io_o_ex_res_packs_0_uop_src1_value; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_src2_value = execute_io_o_ex_res_packs_0_uop_src2_value; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_op1_sel = execute_io_o_ex_res_packs_0_uop_op1_sel; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_op2_sel = execute_io_o_ex_res_packs_0_uop_op2_sel; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_alu_sel = execute_io_o_ex_res_packs_0_uop_alu_sel; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_branch_type = execute_io_o_ex_res_packs_0_uop_branch_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_0_uop_mem_type = execute_io_o_ex_res_packs_0_uop_mem_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_valid = execute_io_o_ex_res_packs_1_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_valid = execute_io_o_ex_res_packs_1_uop_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_pc = execute_io_o_ex_res_packs_1_uop_pc; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_inst = execute_io_o_ex_res_packs_1_uop_inst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_func_code = execute_io_o_ex_res_packs_1_uop_func_code; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_branch_predict_pack_valid =
    execute_io_o_ex_res_packs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_branch_predict_pack_target =
    execute_io_o_ex_res_packs_1_uop_branch_predict_pack_target; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type =
    execute_io_o_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_branch_predict_pack_select =
    execute_io_o_ex_res_packs_1_uop_branch_predict_pack_select; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_branch_predict_pack_taken =
    execute_io_o_ex_res_packs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_phy_dst = execute_io_o_ex_res_packs_1_uop_phy_dst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_stale_dst = execute_io_o_ex_res_packs_1_uop_stale_dst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_arch_dst = execute_io_o_ex_res_packs_1_uop_arch_dst; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_inst_type = execute_io_o_ex_res_packs_1_uop_inst_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_regWen = execute_io_o_ex_res_packs_1_uop_regWen; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_src1_valid = execute_io_o_ex_res_packs_1_uop_src1_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_phy_rs1 = execute_io_o_ex_res_packs_1_uop_phy_rs1; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_arch_rs1 = execute_io_o_ex_res_packs_1_uop_arch_rs1; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_src2_valid = execute_io_o_ex_res_packs_1_uop_src2_valid; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_phy_rs2 = execute_io_o_ex_res_packs_1_uop_phy_rs2; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_arch_rs2 = execute_io_o_ex_res_packs_1_uop_arch_rs2; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_rob_idx = execute_io_o_ex_res_packs_1_uop_rob_idx; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_imm = execute_io_o_ex_res_packs_1_uop_imm; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_dst_value = execute_io_o_ex_res_packs_1_uop_dst_value; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_src1_value = execute_io_o_ex_res_packs_1_uop_src1_value; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_src2_value = execute_io_o_ex_res_packs_1_uop_src2_value; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_op1_sel = execute_io_o_ex_res_packs_1_uop_op1_sel; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_op2_sel = execute_io_o_ex_res_packs_1_uop_op2_sel; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_alu_sel = execute_io_o_ex_res_packs_1_uop_alu_sel; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_branch_type = execute_io_o_ex_res_packs_1_uop_branch_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_ex_res_packs_1_uop_mem_type = execute_io_o_ex_res_packs_1_uop_mem_type; // @[backend_with_decode.scala 123:27]
  assign rob_io_i_branch_resolve_pack_valid = execute_io_o_branch_resolve_pack_valid; // @[backend_with_decode.scala 124:34]
  assign rob_io_i_branch_resolve_pack_mispred = execute_io_o_branch_resolve_pack_mispred; // @[backend_with_decode.scala 124:34]
  assign rob_io_i_branch_resolve_pack_rob_idx = execute_io_o_branch_resolve_pack_rob_idx; // @[backend_with_decode.scala 124:34]
  assign rob_io_i_interrupt = interrupt_mask_io_o_interrupt_with_mask; // @[backend_with_decode.scala 125:24]
  assign rob_io_i_csr_pc_redirect = csr_io_o_pc_redirect_valid; // @[backend_with_decode.scala 126:30]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_i_interrupt = interrupt_mask_io_o_interrupt_with_mask; // @[backend_with_decode.scala 130:24]
  assign csr_io_i_commit_packs_0_valid = rob_io_o_commit_packs_0_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_valid = rob_io_o_commit_packs_0_uop_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_pc = rob_io_o_commit_packs_0_uop_pc; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_inst = rob_io_o_commit_packs_0_uop_inst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_func_code = rob_io_o_commit_packs_0_uop_func_code; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_branch_predict_pack_valid = rob_io_o_commit_packs_0_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_branch_predict_pack_target = rob_io_o_commit_packs_0_uop_branch_predict_pack_target
    ; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_branch_predict_pack_branch_type =
    rob_io_o_commit_packs_0_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_branch_predict_pack_select = rob_io_o_commit_packs_0_uop_branch_predict_pack_select
    ; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_branch_predict_pack_taken = rob_io_o_commit_packs_0_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_phy_dst = rob_io_o_commit_packs_0_uop_phy_dst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_stale_dst = rob_io_o_commit_packs_0_uop_stale_dst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_arch_dst = rob_io_o_commit_packs_0_uop_arch_dst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_inst_type = rob_io_o_commit_packs_0_uop_inst_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_regWen = rob_io_o_commit_packs_0_uop_regWen; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_src1_valid = rob_io_o_commit_packs_0_uop_src1_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_phy_rs1 = rob_io_o_commit_packs_0_uop_phy_rs1; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_arch_rs1 = rob_io_o_commit_packs_0_uop_arch_rs1; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_src2_valid = rob_io_o_commit_packs_0_uop_src2_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_phy_rs2 = rob_io_o_commit_packs_0_uop_phy_rs2; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_arch_rs2 = rob_io_o_commit_packs_0_uop_arch_rs2; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_rob_idx = rob_io_o_commit_packs_0_uop_rob_idx; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_imm = rob_io_o_commit_packs_0_uop_imm; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_dst_value = rob_io_o_commit_packs_0_uop_dst_value; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_src1_value = rob_io_o_commit_packs_0_uop_src1_value; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_src2_value = rob_io_o_commit_packs_0_uop_src2_value; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_op1_sel = rob_io_o_commit_packs_0_uop_op1_sel; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_op2_sel = rob_io_o_commit_packs_0_uop_op2_sel; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_alu_sel = rob_io_o_commit_packs_0_uop_alu_sel; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_branch_type = rob_io_o_commit_packs_0_uop_branch_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_0_uop_mem_type = rob_io_o_commit_packs_0_uop_mem_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_valid = rob_io_o_commit_packs_1_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_valid = rob_io_o_commit_packs_1_uop_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_pc = rob_io_o_commit_packs_1_uop_pc; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_inst = rob_io_o_commit_packs_1_uop_inst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_func_code = rob_io_o_commit_packs_1_uop_func_code; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_branch_predict_pack_valid = rob_io_o_commit_packs_1_uop_branch_predict_pack_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_branch_predict_pack_target = rob_io_o_commit_packs_1_uop_branch_predict_pack_target
    ; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_branch_predict_pack_branch_type =
    rob_io_o_commit_packs_1_uop_branch_predict_pack_branch_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_branch_predict_pack_select = rob_io_o_commit_packs_1_uop_branch_predict_pack_select
    ; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_branch_predict_pack_taken = rob_io_o_commit_packs_1_uop_branch_predict_pack_taken; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_phy_dst = rob_io_o_commit_packs_1_uop_phy_dst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_stale_dst = rob_io_o_commit_packs_1_uop_stale_dst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_arch_dst = rob_io_o_commit_packs_1_uop_arch_dst; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_inst_type = rob_io_o_commit_packs_1_uop_inst_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_regWen = rob_io_o_commit_packs_1_uop_regWen; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_src1_valid = rob_io_o_commit_packs_1_uop_src1_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_phy_rs1 = rob_io_o_commit_packs_1_uop_phy_rs1; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_arch_rs1 = rob_io_o_commit_packs_1_uop_arch_rs1; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_src2_valid = rob_io_o_commit_packs_1_uop_src2_valid; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_phy_rs2 = rob_io_o_commit_packs_1_uop_phy_rs2; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_arch_rs2 = rob_io_o_commit_packs_1_uop_arch_rs2; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_rob_idx = rob_io_o_commit_packs_1_uop_rob_idx; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_imm = rob_io_o_commit_packs_1_uop_imm; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_dst_value = rob_io_o_commit_packs_1_uop_dst_value; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_src1_value = rob_io_o_commit_packs_1_uop_src1_value; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_src2_value = rob_io_o_commit_packs_1_uop_src2_value; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_op1_sel = rob_io_o_commit_packs_1_uop_op1_sel; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_op2_sel = rob_io_o_commit_packs_1_uop_op2_sel; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_alu_sel = rob_io_o_commit_packs_1_uop_alu_sel; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_branch_type = rob_io_o_commit_packs_1_uop_branch_type; // @[backend_with_decode.scala 131:27]
  assign csr_io_i_commit_packs_1_uop_mem_type = rob_io_o_commit_packs_1_uop_mem_type; // @[backend_with_decode.scala 131:27]
  assign interrupt_mask_clock = clock;
  assign interrupt_mask_reset = reset;
  assign interrupt_mask_io_i_lsu_uop_valid = execute_io_o_lsu_uop_valid; // @[backend_with_decode.scala 134:39]
  assign interrupt_mask_io_i_rob_idx = rob_io_o_rob_head; // @[backend_with_decode.scala 135:33]
  assign interrupt_mask_io_i_lsu_uop_rob_idx = execute_io_o_lsu_uop_rob_idx; // @[backend_with_decode.scala 136:41]
  assign interrupt_mask_io_i_interrupt = io_i_interrupt; // @[backend_with_decode.scala 137:35]
  assign arch_regs_io_i_pregs_0 = regfile_io_o_pregs_0; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_1 = regfile_io_o_pregs_1; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_2 = regfile_io_o_pregs_2; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_3 = regfile_io_o_pregs_3; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_4 = regfile_io_o_pregs_4; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_5 = regfile_io_o_pregs_5; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_6 = regfile_io_o_pregs_6; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_7 = regfile_io_o_pregs_7; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_8 = regfile_io_o_pregs_8; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_9 = regfile_io_o_pregs_9; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_10 = regfile_io_o_pregs_10; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_11 = regfile_io_o_pregs_11; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_12 = regfile_io_o_pregs_12; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_13 = regfile_io_o_pregs_13; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_14 = regfile_io_o_pregs_14; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_15 = regfile_io_o_pregs_15; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_16 = regfile_io_o_pregs_16; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_17 = regfile_io_o_pregs_17; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_18 = regfile_io_o_pregs_18; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_19 = regfile_io_o_pregs_19; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_20 = regfile_io_o_pregs_20; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_21 = regfile_io_o_pregs_21; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_22 = regfile_io_o_pregs_22; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_23 = regfile_io_o_pregs_23; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_24 = regfile_io_o_pregs_24; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_25 = regfile_io_o_pregs_25; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_26 = regfile_io_o_pregs_26; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_27 = regfile_io_o_pregs_27; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_28 = regfile_io_o_pregs_28; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_29 = regfile_io_o_pregs_29; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_30 = regfile_io_o_pregs_30; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_31 = regfile_io_o_pregs_31; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_32 = regfile_io_o_pregs_32; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_33 = regfile_io_o_pregs_33; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_34 = regfile_io_o_pregs_34; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_35 = regfile_io_o_pregs_35; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_36 = regfile_io_o_pregs_36; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_37 = regfile_io_o_pregs_37; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_38 = regfile_io_o_pregs_38; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_39 = regfile_io_o_pregs_39; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_40 = regfile_io_o_pregs_40; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_41 = regfile_io_o_pregs_41; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_42 = regfile_io_o_pregs_42; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_43 = regfile_io_o_pregs_43; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_44 = regfile_io_o_pregs_44; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_45 = regfile_io_o_pregs_45; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_46 = regfile_io_o_pregs_46; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_47 = regfile_io_o_pregs_47; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_48 = regfile_io_o_pregs_48; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_49 = regfile_io_o_pregs_49; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_50 = regfile_io_o_pregs_50; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_51 = regfile_io_o_pregs_51; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_52 = regfile_io_o_pregs_52; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_53 = regfile_io_o_pregs_53; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_54 = regfile_io_o_pregs_54; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_55 = regfile_io_o_pregs_55; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_56 = regfile_io_o_pregs_56; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_57 = regfile_io_o_pregs_57; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_58 = regfile_io_o_pregs_58; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_59 = regfile_io_o_pregs_59; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_60 = regfile_io_o_pregs_60; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_61 = regfile_io_o_pregs_61; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_62 = regfile_io_o_pregs_62; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_63 = regfile_io_o_pregs_63; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_64 = regfile_io_o_pregs_64; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_65 = regfile_io_o_pregs_65; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_66 = regfile_io_o_pregs_66; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_67 = regfile_io_o_pregs_67; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_68 = regfile_io_o_pregs_68; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_69 = regfile_io_o_pregs_69; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_70 = regfile_io_o_pregs_70; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_71 = regfile_io_o_pregs_71; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_72 = regfile_io_o_pregs_72; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_73 = regfile_io_o_pregs_73; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_74 = regfile_io_o_pregs_74; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_75 = regfile_io_o_pregs_75; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_76 = regfile_io_o_pregs_76; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_77 = regfile_io_o_pregs_77; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_78 = regfile_io_o_pregs_78; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_79 = regfile_io_o_pregs_79; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_80 = regfile_io_o_pregs_80; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_81 = regfile_io_o_pregs_81; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_82 = regfile_io_o_pregs_82; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_83 = regfile_io_o_pregs_83; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_84 = regfile_io_o_pregs_84; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_85 = regfile_io_o_pregs_85; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_86 = regfile_io_o_pregs_86; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_87 = regfile_io_o_pregs_87; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_88 = regfile_io_o_pregs_88; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_89 = regfile_io_o_pregs_89; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_90 = regfile_io_o_pregs_90; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_91 = regfile_io_o_pregs_91; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_92 = regfile_io_o_pregs_92; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_93 = regfile_io_o_pregs_93; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_94 = regfile_io_o_pregs_94; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_95 = regfile_io_o_pregs_95; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_96 = regfile_io_o_pregs_96; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_97 = regfile_io_o_pregs_97; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_98 = regfile_io_o_pregs_98; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_99 = regfile_io_o_pregs_99; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_100 = regfile_io_o_pregs_100; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_101 = regfile_io_o_pregs_101; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_102 = regfile_io_o_pregs_102; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_103 = regfile_io_o_pregs_103; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_104 = regfile_io_o_pregs_104; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_105 = regfile_io_o_pregs_105; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_106 = regfile_io_o_pregs_106; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_107 = regfile_io_o_pregs_107; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_108 = regfile_io_o_pregs_108; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_109 = regfile_io_o_pregs_109; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_110 = regfile_io_o_pregs_110; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_111 = regfile_io_o_pregs_111; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_112 = regfile_io_o_pregs_112; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_113 = regfile_io_o_pregs_113; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_114 = regfile_io_o_pregs_114; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_115 = regfile_io_o_pregs_115; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_116 = regfile_io_o_pregs_116; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_117 = regfile_io_o_pregs_117; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_118 = regfile_io_o_pregs_118; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_119 = regfile_io_o_pregs_119; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_120 = regfile_io_o_pregs_120; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_121 = regfile_io_o_pregs_121; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_122 = regfile_io_o_pregs_122; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_123 = regfile_io_o_pregs_123; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_124 = regfile_io_o_pregs_124; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_125 = regfile_io_o_pregs_125; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_126 = regfile_io_o_pregs_126; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_pregs_127 = regfile_io_o_pregs_127; // @[backend_with_decode.scala 163:26]
  assign arch_regs_io_i_rename_table_0 = rename_io_o_commit_rename_table_0; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_1 = rename_io_o_commit_rename_table_1; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_2 = rename_io_o_commit_rename_table_2; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_3 = rename_io_o_commit_rename_table_3; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_4 = rename_io_o_commit_rename_table_4; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_5 = rename_io_o_commit_rename_table_5; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_6 = rename_io_o_commit_rename_table_6; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_7 = rename_io_o_commit_rename_table_7; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_8 = rename_io_o_commit_rename_table_8; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_9 = rename_io_o_commit_rename_table_9; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_10 = rename_io_o_commit_rename_table_10; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_11 = rename_io_o_commit_rename_table_11; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_12 = rename_io_o_commit_rename_table_12; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_13 = rename_io_o_commit_rename_table_13; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_14 = rename_io_o_commit_rename_table_14; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_15 = rename_io_o_commit_rename_table_15; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_16 = rename_io_o_commit_rename_table_16; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_17 = rename_io_o_commit_rename_table_17; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_18 = rename_io_o_commit_rename_table_18; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_19 = rename_io_o_commit_rename_table_19; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_20 = rename_io_o_commit_rename_table_20; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_21 = rename_io_o_commit_rename_table_21; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_22 = rename_io_o_commit_rename_table_22; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_23 = rename_io_o_commit_rename_table_23; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_24 = rename_io_o_commit_rename_table_24; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_25 = rename_io_o_commit_rename_table_25; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_26 = rename_io_o_commit_rename_table_26; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_27 = rename_io_o_commit_rename_table_27; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_28 = rename_io_o_commit_rename_table_28; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_29 = rename_io_o_commit_rename_table_29; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_30 = rename_io_o_commit_rename_table_30; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_rename_table_31 = rename_io_o_commit_rename_table_31; // @[backend_with_decode.scala 164:33]
  assign arch_regs_io_i_csrs_0 = csr_io_o_mepc; // @[backend_with_decode.scala 165:28]
  assign arch_regs_io_i_csrs_1 = csr_io_o_mtvec; // @[backend_with_decode.scala 166:28]
  assign arch_regs_io_i_csrs_2 = csr_io_o_mcause; // @[backend_with_decode.scala 167:28]
  assign arch_regs_io_i_csrs_3 = csr_io_o_mstatus; // @[backend_with_decode.scala 168:28]
endmodule
