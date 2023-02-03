module Rename(
  input          clock,
  input          reset,
  input          io_i_decode_packs_0_valid,
  input  [31:0]  io_i_decode_packs_0_pc,
  input  [31:0]  io_i_decode_packs_0_inst,
  input  [6:0]   io_i_decode_packs_0_func_code,
  input          io_i_decode_packs_0_branch_predict_pack_valid,
  input  [63:0]  io_i_decode_packs_0_branch_predict_pack_target,
  input          io_i_decode_packs_0_branch_predict_pack_taken,
  input  [4:0]   io_i_decode_packs_0_arch_dst,
  input          io_i_decode_packs_0_src1_valid,
  input  [4:0]   io_i_decode_packs_0_arch_rs1,
  input          io_i_decode_packs_0_src2_valid,
  input  [4:0]   io_i_decode_packs_0_arch_rs2,
  input  [63:0]  io_i_decode_packs_0_imm,
  input  [63:0]  io_i_decode_packs_0_src1_value,
  input  [63:0]  io_i_decode_packs_0_src2_value,
  input  [2:0]   io_i_decode_packs_0_op1_sel,
  input  [2:0]   io_i_decode_packs_0_op2_sel,
  input  [4:0]   io_i_decode_packs_0_alu_sel,
  input  [2:0]   io_i_decode_packs_0_branch_type,
  input  [1:0]   io_i_decode_packs_0_mem_type,
  input          io_i_decode_packs_1_valid,
  input  [31:0]  io_i_decode_packs_1_pc,
  input  [31:0]  io_i_decode_packs_1_inst,
  input  [6:0]   io_i_decode_packs_1_func_code,
  input          io_i_decode_packs_1_branch_predict_pack_valid,
  input  [63:0]  io_i_decode_packs_1_branch_predict_pack_target,
  input          io_i_decode_packs_1_branch_predict_pack_taken,
  input  [4:0]   io_i_decode_packs_1_arch_dst,
  input          io_i_decode_packs_1_src1_valid,
  input  [4:0]   io_i_decode_packs_1_arch_rs1,
  input          io_i_decode_packs_1_src2_valid,
  input  [4:0]   io_i_decode_packs_1_arch_rs2,
  input  [63:0]  io_i_decode_packs_1_imm,
  input  [63:0]  io_i_decode_packs_1_src1_value,
  input  [63:0]  io_i_decode_packs_1_src2_value,
  input  [2:0]   io_i_decode_packs_1_op1_sel,
  input  [2:0]   io_i_decode_packs_1_op2_sel,
  input  [4:0]   io_i_decode_packs_1_alu_sel,
  input  [2:0]   io_i_decode_packs_1_branch_type,
  input  [1:0]   io_i_decode_packs_1_mem_type,
  input          io_i_commit_packs_0_valid,
  input  [6:0]   io_i_commit_packs_0_uop_phy_dst,
  input  [6:0]   io_i_commit_packs_0_uop_stale_dst,
  input  [4:0]   io_i_commit_packs_0_uop_arch_dst,
  input          io_i_commit_packs_1_valid,
  input  [6:0]   io_i_commit_packs_1_uop_phy_dst,
  input  [6:0]   io_i_commit_packs_1_uop_stale_dst,
  input  [4:0]   io_i_commit_packs_1_uop_arch_dst,
  input          io_i_rollback_packs_0_valid,
  input  [6:0]   io_i_rollback_packs_0_uop_phy_dst,
  input  [6:0]   io_i_rollback_packs_0_uop_stale_dst,
  input  [4:0]   io_i_rollback_packs_0_uop_arch_dst,
  input          io_i_rollback_packs_1_valid,
  input  [6:0]   io_i_rollback_packs_1_uop_phy_dst,
  input  [6:0]   io_i_rollback_packs_1_uop_stale_dst,
  input  [4:0]   io_i_rollback_packs_1_uop_arch_dst,
  output         io_o_free_list_empty,
  output         io_o_rename_packs_0_valid,
  output [31:0]  io_o_rename_packs_0_pc,
  output [31:0]  io_o_rename_packs_0_inst,
  output [6:0]   io_o_rename_packs_0_func_code,
  output         io_o_rename_packs_0_branch_predict_pack_valid,
  output [63:0]  io_o_rename_packs_0_branch_predict_pack_target,
  output         io_o_rename_packs_0_branch_predict_pack_taken,
  output [6:0]   io_o_rename_packs_0_phy_dst,
  output [6:0]   io_o_rename_packs_0_stale_dst,
  output [4:0]   io_o_rename_packs_0_arch_dst,
  output         io_o_rename_packs_0_src1_valid,
  output [6:0]   io_o_rename_packs_0_phy_rs1,
  output         io_o_rename_packs_0_src2_valid,
  output [6:0]   io_o_rename_packs_0_phy_rs2,
  output [63:0]  io_o_rename_packs_0_imm,
  output [63:0]  io_o_rename_packs_0_src1_value,
  output [63:0]  io_o_rename_packs_0_src2_value,
  output [2:0]   io_o_rename_packs_0_op1_sel,
  output [2:0]   io_o_rename_packs_0_op2_sel,
  output [4:0]   io_o_rename_packs_0_alu_sel,
  output [2:0]   io_o_rename_packs_0_branch_type,
  output [1:0]   io_o_rename_packs_0_mem_type,
  output         io_o_rename_packs_1_valid,
  output [31:0]  io_o_rename_packs_1_pc,
  output [31:0]  io_o_rename_packs_1_inst,
  output [6:0]   io_o_rename_packs_1_func_code,
  output         io_o_rename_packs_1_branch_predict_pack_valid,
  output [63:0]  io_o_rename_packs_1_branch_predict_pack_target,
  output         io_o_rename_packs_1_branch_predict_pack_taken,
  output [6:0]   io_o_rename_packs_1_phy_dst,
  output [6:0]   io_o_rename_packs_1_stale_dst,
  output [4:0]   io_o_rename_packs_1_arch_dst,
  output         io_o_rename_packs_1_src1_valid,
  output [6:0]   io_o_rename_packs_1_phy_rs1,
  output         io_o_rename_packs_1_src2_valid,
  output [6:0]   io_o_rename_packs_1_phy_rs2,
  output [63:0]  io_o_rename_packs_1_imm,
  output [63:0]  io_o_rename_packs_1_src1_value,
  output [63:0]  io_o_rename_packs_1_src2_value,
  output [2:0]   io_o_rename_packs_1_op1_sel,
  output [2:0]   io_o_rename_packs_1_op2_sel,
  output [4:0]   io_o_rename_packs_1_alu_sel,
  output [2:0]   io_o_rename_packs_1_branch_type,
  output [1:0]   io_o_rename_packs_1_mem_type,
  output [127:0] io_o_written_back_table,
  input          io_i_exception,
  input          io_i_stall,
  output [6:0]   io_o_commit_rename_table_0,
  output [6:0]   io_o_commit_rename_table_1,
  output [6:0]   io_o_commit_rename_table_2,
  output [6:0]   io_o_commit_rename_table_3,
  output [6:0]   io_o_commit_rename_table_4,
  output [6:0]   io_o_commit_rename_table_5,
  output [6:0]   io_o_commit_rename_table_6,
  output [6:0]   io_o_commit_rename_table_7,
  output [6:0]   io_o_commit_rename_table_8,
  output [6:0]   io_o_commit_rename_table_9,
  output [6:0]   io_o_commit_rename_table_10,
  output [6:0]   io_o_commit_rename_table_11,
  output [6:0]   io_o_commit_rename_table_12,
  output [6:0]   io_o_commit_rename_table_13,
  output [6:0]   io_o_commit_rename_table_14,
  output [6:0]   io_o_commit_rename_table_15,
  output [6:0]   io_o_commit_rename_table_16,
  output [6:0]   io_o_commit_rename_table_17,
  output [6:0]   io_o_commit_rename_table_18,
  output [6:0]   io_o_commit_rename_table_19,
  output [6:0]   io_o_commit_rename_table_20,
  output [6:0]   io_o_commit_rename_table_21,
  output [6:0]   io_o_commit_rename_table_22,
  output [6:0]   io_o_commit_rename_table_23,
  output [6:0]   io_o_commit_rename_table_24,
  output [6:0]   io_o_commit_rename_table_25,
  output [6:0]   io_o_commit_rename_table_26,
  output [6:0]   io_o_commit_rename_table_27,
  output [6:0]   io_o_commit_rename_table_28,
  output [6:0]   io_o_commit_rename_table_29,
  output [6:0]   io_o_commit_rename_table_30,
  output [6:0]   io_o_commit_rename_table_31
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
`endif // RANDOMIZE_REG_INIT
  wire  rename_table_clock; // @[rename.scala 26:28]
  wire  rename_table_reset; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rename_req_packs_0_arch_rs1; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rename_req_packs_0_arch_rs2; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rename_req_packs_0_arch_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rename_req_packs_1_arch_rs1; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rename_req_packs_1_arch_rs2; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rename_req_packs_1_arch_dst; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_rename_res_packs_0_phy_rs1; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_rename_res_packs_0_phy_rs2; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_rename_res_packs_0_phy_dst; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_rename_res_packs_1_phy_rs1; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_rename_res_packs_1_phy_rs2; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_rename_res_packs_1_phy_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_allocation_pack_0_valid; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_i_allocation_pack_0_phy_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_allocation_pack_0_arch_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_allocation_pack_1_valid; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_i_allocation_pack_1_phy_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_allocation_pack_1_arch_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_commit_packs_0_valid; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_i_commit_packs_0_uop_phy_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_commit_packs_0_uop_arch_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_commit_packs_1_valid; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_i_commit_packs_1_uop_phy_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_commit_packs_1_uop_arch_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_rollback_packs_0_valid; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_i_rollback_packs_0_uop_stale_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rollback_packs_0_uop_arch_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_rollback_packs_1_valid; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_i_rollback_packs_1_uop_stale_dst; // @[rename.scala 26:28]
  wire [4:0] rename_table_io_i_rollback_packs_1_uop_arch_dst; // @[rename.scala 26:28]
  wire  rename_table_io_i_exception; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_0; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_1; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_2; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_3; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_4; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_5; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_6; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_7; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_8; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_9; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_10; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_11; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_12; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_13; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_14; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_15; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_16; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_17; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_18; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_19; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_20; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_21; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_22; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_23; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_24; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_25; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_26; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_27; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_28; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_29; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_30; // @[rename.scala 26:28]
  wire [6:0] rename_table_io_o_commit_rename_table_31; // @[rename.scala 26:28]
  wire  busy_table_clock; // @[rename.scala 28:26]
  wire  busy_table_reset; // @[rename.scala 28:26]
  wire  busy_table_io_i_free_list_reqs_0; // @[rename.scala 28:26]
  wire  busy_table_io_i_free_list_reqs_1; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_o_allocated_pregs_0; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_o_allocated_pregs_1; // @[rename.scala 28:26]
  wire  busy_table_io_o_empty; // @[rename.scala 28:26]
  wire  busy_table_io_i_allocated_uops_0_valid; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_allocated_uops_0_phy_dst; // @[rename.scala 28:26]
  wire  busy_table_io_i_allocated_uops_1_valid; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_allocated_uops_1_phy_dst; // @[rename.scala 28:26]
  wire  busy_table_io_i_commit_packs_0_valid; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_commit_packs_0_uop_phy_dst; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_commit_packs_0_uop_stale_dst; // @[rename.scala 28:26]
  wire  busy_table_io_i_commit_packs_1_valid; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_commit_packs_1_uop_phy_dst; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_commit_packs_1_uop_stale_dst; // @[rename.scala 28:26]
  wire  busy_table_io_i_rollback_packs_0_valid; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_rollback_packs_0_uop_phy_dst; // @[rename.scala 28:26]
  wire  busy_table_io_i_rollback_packs_1_valid; // @[rename.scala 28:26]
  wire [6:0] busy_table_io_i_rollback_packs_1_uop_phy_dst; // @[rename.scala 28:26]
  wire [127:0] busy_table_io_o_written_back; // @[rename.scala 28:26]
  wire  busy_table_io_i_exception; // @[rename.scala 28:26]
  reg  uops_0_valid; // @[rename.scala 33:23]
  reg [31:0] uops_0_pc; // @[rename.scala 33:23]
  reg [31:0] uops_0_inst; // @[rename.scala 33:23]
  reg [6:0] uops_0_func_code; // @[rename.scala 33:23]
  reg  uops_0_branch_predict_pack_valid; // @[rename.scala 33:23]
  reg [63:0] uops_0_branch_predict_pack_target; // @[rename.scala 33:23]
  reg  uops_0_branch_predict_pack_taken; // @[rename.scala 33:23]
  reg [4:0] uops_0_arch_dst; // @[rename.scala 33:23]
  reg  uops_0_src1_valid; // @[rename.scala 33:23]
  reg [4:0] uops_0_arch_rs1; // @[rename.scala 33:23]
  reg  uops_0_src2_valid; // @[rename.scala 33:23]
  reg [4:0] uops_0_arch_rs2; // @[rename.scala 33:23]
  reg [63:0] uops_0_imm; // @[rename.scala 33:23]
  reg [63:0] uops_0_src1_value; // @[rename.scala 33:23]
  reg [63:0] uops_0_src2_value; // @[rename.scala 33:23]
  reg [2:0] uops_0_op1_sel; // @[rename.scala 33:23]
  reg [2:0] uops_0_op2_sel; // @[rename.scala 33:23]
  reg [4:0] uops_0_alu_sel; // @[rename.scala 33:23]
  reg [2:0] uops_0_branch_type; // @[rename.scala 33:23]
  reg [1:0] uops_0_mem_type; // @[rename.scala 33:23]
  reg  uops_1_valid; // @[rename.scala 33:23]
  reg [31:0] uops_1_pc; // @[rename.scala 33:23]
  reg [31:0] uops_1_inst; // @[rename.scala 33:23]
  reg [6:0] uops_1_func_code; // @[rename.scala 33:23]
  reg  uops_1_branch_predict_pack_valid; // @[rename.scala 33:23]
  reg [63:0] uops_1_branch_predict_pack_target; // @[rename.scala 33:23]
  reg  uops_1_branch_predict_pack_taken; // @[rename.scala 33:23]
  reg [4:0] uops_1_arch_dst; // @[rename.scala 33:23]
  reg  uops_1_src1_valid; // @[rename.scala 33:23]
  reg [4:0] uops_1_arch_rs1; // @[rename.scala 33:23]
  reg  uops_1_src2_valid; // @[rename.scala 33:23]
  reg [4:0] uops_1_arch_rs2; // @[rename.scala 33:23]
  reg [63:0] uops_1_imm; // @[rename.scala 33:23]
  reg [63:0] uops_1_src1_value; // @[rename.scala 33:23]
  reg [63:0] uops_1_src2_value; // @[rename.scala 33:23]
  reg [2:0] uops_1_op1_sel; // @[rename.scala 33:23]
  reg [2:0] uops_1_op2_sel; // @[rename.scala 33:23]
  reg [4:0] uops_1_alu_sel; // @[rename.scala 33:23]
  reg [2:0] uops_1_branch_type; // @[rename.scala 33:23]
  reg [1:0] uops_1_mem_type; // @[rename.scala 33:23]
  wire  _uops_0_T_1 = ~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid; // @[rename.scala 34:74]
  wire  _io_o_rename_packs_0_valid_T_1 = io_i_exception | io_i_rollback_packs_0_valid | io_i_rollback_packs_1_valid; // @[rename.scala 58:87]
  Rename_Table rename_table ( // @[rename.scala 26:28]
    .clock(rename_table_clock),
    .reset(rename_table_reset),
    .io_i_rename_req_packs_0_arch_rs1(rename_table_io_i_rename_req_packs_0_arch_rs1),
    .io_i_rename_req_packs_0_arch_rs2(rename_table_io_i_rename_req_packs_0_arch_rs2),
    .io_i_rename_req_packs_0_arch_dst(rename_table_io_i_rename_req_packs_0_arch_dst),
    .io_i_rename_req_packs_1_arch_rs1(rename_table_io_i_rename_req_packs_1_arch_rs1),
    .io_i_rename_req_packs_1_arch_rs2(rename_table_io_i_rename_req_packs_1_arch_rs2),
    .io_i_rename_req_packs_1_arch_dst(rename_table_io_i_rename_req_packs_1_arch_dst),
    .io_o_rename_res_packs_0_phy_rs1(rename_table_io_o_rename_res_packs_0_phy_rs1),
    .io_o_rename_res_packs_0_phy_rs2(rename_table_io_o_rename_res_packs_0_phy_rs2),
    .io_o_rename_res_packs_0_phy_dst(rename_table_io_o_rename_res_packs_0_phy_dst),
    .io_o_rename_res_packs_1_phy_rs1(rename_table_io_o_rename_res_packs_1_phy_rs1),
    .io_o_rename_res_packs_1_phy_rs2(rename_table_io_o_rename_res_packs_1_phy_rs2),
    .io_o_rename_res_packs_1_phy_dst(rename_table_io_o_rename_res_packs_1_phy_dst),
    .io_i_allocation_pack_0_valid(rename_table_io_i_allocation_pack_0_valid),
    .io_i_allocation_pack_0_phy_dst(rename_table_io_i_allocation_pack_0_phy_dst),
    .io_i_allocation_pack_0_arch_dst(rename_table_io_i_allocation_pack_0_arch_dst),
    .io_i_allocation_pack_1_valid(rename_table_io_i_allocation_pack_1_valid),
    .io_i_allocation_pack_1_phy_dst(rename_table_io_i_allocation_pack_1_phy_dst),
    .io_i_allocation_pack_1_arch_dst(rename_table_io_i_allocation_pack_1_arch_dst),
    .io_i_commit_packs_0_valid(rename_table_io_i_commit_packs_0_valid),
    .io_i_commit_packs_0_uop_phy_dst(rename_table_io_i_commit_packs_0_uop_phy_dst),
    .io_i_commit_packs_0_uop_arch_dst(rename_table_io_i_commit_packs_0_uop_arch_dst),
    .io_i_commit_packs_1_valid(rename_table_io_i_commit_packs_1_valid),
    .io_i_commit_packs_1_uop_phy_dst(rename_table_io_i_commit_packs_1_uop_phy_dst),
    .io_i_commit_packs_1_uop_arch_dst(rename_table_io_i_commit_packs_1_uop_arch_dst),
    .io_i_rollback_packs_0_valid(rename_table_io_i_rollback_packs_0_valid),
    .io_i_rollback_packs_0_uop_stale_dst(rename_table_io_i_rollback_packs_0_uop_stale_dst),
    .io_i_rollback_packs_0_uop_arch_dst(rename_table_io_i_rollback_packs_0_uop_arch_dst),
    .io_i_rollback_packs_1_valid(rename_table_io_i_rollback_packs_1_valid),
    .io_i_rollback_packs_1_uop_stale_dst(rename_table_io_i_rollback_packs_1_uop_stale_dst),
    .io_i_rollback_packs_1_uop_arch_dst(rename_table_io_i_rollback_packs_1_uop_arch_dst),
    .io_i_exception(rename_table_io_i_exception),
    .io_o_commit_rename_table_0(rename_table_io_o_commit_rename_table_0),
    .io_o_commit_rename_table_1(rename_table_io_o_commit_rename_table_1),
    .io_o_commit_rename_table_2(rename_table_io_o_commit_rename_table_2),
    .io_o_commit_rename_table_3(rename_table_io_o_commit_rename_table_3),
    .io_o_commit_rename_table_4(rename_table_io_o_commit_rename_table_4),
    .io_o_commit_rename_table_5(rename_table_io_o_commit_rename_table_5),
    .io_o_commit_rename_table_6(rename_table_io_o_commit_rename_table_6),
    .io_o_commit_rename_table_7(rename_table_io_o_commit_rename_table_7),
    .io_o_commit_rename_table_8(rename_table_io_o_commit_rename_table_8),
    .io_o_commit_rename_table_9(rename_table_io_o_commit_rename_table_9),
    .io_o_commit_rename_table_10(rename_table_io_o_commit_rename_table_10),
    .io_o_commit_rename_table_11(rename_table_io_o_commit_rename_table_11),
    .io_o_commit_rename_table_12(rename_table_io_o_commit_rename_table_12),
    .io_o_commit_rename_table_13(rename_table_io_o_commit_rename_table_13),
    .io_o_commit_rename_table_14(rename_table_io_o_commit_rename_table_14),
    .io_o_commit_rename_table_15(rename_table_io_o_commit_rename_table_15),
    .io_o_commit_rename_table_16(rename_table_io_o_commit_rename_table_16),
    .io_o_commit_rename_table_17(rename_table_io_o_commit_rename_table_17),
    .io_o_commit_rename_table_18(rename_table_io_o_commit_rename_table_18),
    .io_o_commit_rename_table_19(rename_table_io_o_commit_rename_table_19),
    .io_o_commit_rename_table_20(rename_table_io_o_commit_rename_table_20),
    .io_o_commit_rename_table_21(rename_table_io_o_commit_rename_table_21),
    .io_o_commit_rename_table_22(rename_table_io_o_commit_rename_table_22),
    .io_o_commit_rename_table_23(rename_table_io_o_commit_rename_table_23),
    .io_o_commit_rename_table_24(rename_table_io_o_commit_rename_table_24),
    .io_o_commit_rename_table_25(rename_table_io_o_commit_rename_table_25),
    .io_o_commit_rename_table_26(rename_table_io_o_commit_rename_table_26),
    .io_o_commit_rename_table_27(rename_table_io_o_commit_rename_table_27),
    .io_o_commit_rename_table_28(rename_table_io_o_commit_rename_table_28),
    .io_o_commit_rename_table_29(rename_table_io_o_commit_rename_table_29),
    .io_o_commit_rename_table_30(rename_table_io_o_commit_rename_table_30),
    .io_o_commit_rename_table_31(rename_table_io_o_commit_rename_table_31)
  );
  Busy_Table busy_table ( // @[rename.scala 28:26]
    .clock(busy_table_clock),
    .reset(busy_table_reset),
    .io_i_free_list_reqs_0(busy_table_io_i_free_list_reqs_0),
    .io_i_free_list_reqs_1(busy_table_io_i_free_list_reqs_1),
    .io_o_allocated_pregs_0(busy_table_io_o_allocated_pregs_0),
    .io_o_allocated_pregs_1(busy_table_io_o_allocated_pregs_1),
    .io_o_empty(busy_table_io_o_empty),
    .io_i_allocated_uops_0_valid(busy_table_io_i_allocated_uops_0_valid),
    .io_i_allocated_uops_0_phy_dst(busy_table_io_i_allocated_uops_0_phy_dst),
    .io_i_allocated_uops_1_valid(busy_table_io_i_allocated_uops_1_valid),
    .io_i_allocated_uops_1_phy_dst(busy_table_io_i_allocated_uops_1_phy_dst),
    .io_i_commit_packs_0_valid(busy_table_io_i_commit_packs_0_valid),
    .io_i_commit_packs_0_uop_phy_dst(busy_table_io_i_commit_packs_0_uop_phy_dst),
    .io_i_commit_packs_0_uop_stale_dst(busy_table_io_i_commit_packs_0_uop_stale_dst),
    .io_i_commit_packs_1_valid(busy_table_io_i_commit_packs_1_valid),
    .io_i_commit_packs_1_uop_phy_dst(busy_table_io_i_commit_packs_1_uop_phy_dst),
    .io_i_commit_packs_1_uop_stale_dst(busy_table_io_i_commit_packs_1_uop_stale_dst),
    .io_i_rollback_packs_0_valid(busy_table_io_i_rollback_packs_0_valid),
    .io_i_rollback_packs_0_uop_phy_dst(busy_table_io_i_rollback_packs_0_uop_phy_dst),
    .io_i_rollback_packs_1_valid(busy_table_io_i_rollback_packs_1_valid),
    .io_i_rollback_packs_1_uop_phy_dst(busy_table_io_i_rollback_packs_1_uop_phy_dst),
    .io_o_written_back(busy_table_io_o_written_back),
    .io_i_exception(busy_table_io_i_exception)
  );
  assign io_o_free_list_empty = busy_table_io_o_empty; // @[rename.scala 60:26]
  assign io_o_rename_packs_0_valid = io_i_exception | io_i_rollback_packs_0_valid | io_i_rollback_packs_1_valid ? 1'h0
     : uops_0_valid; // @[rename.scala 58:38]
  assign io_o_rename_packs_0_pc = uops_0_pc; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_inst = uops_0_inst; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_func_code = uops_0_func_code; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_branch_predict_pack_valid = uops_0_branch_predict_pack_valid; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_branch_predict_pack_target = uops_0_branch_predict_pack_target; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_branch_predict_pack_taken = uops_0_branch_predict_pack_taken; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_phy_dst = busy_table_io_o_allocated_pregs_0; // @[rename.scala 65:34]
  assign io_o_rename_packs_0_stale_dst = rename_table_io_o_rename_res_packs_0_phy_dst; // @[rename.scala 64:36]
  assign io_o_rename_packs_0_arch_dst = uops_0_arch_dst; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_src1_valid = uops_0_src1_valid; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_phy_rs1 = rename_table_io_o_rename_res_packs_0_phy_rs1; // @[rename.scala 62:34]
  assign io_o_rename_packs_0_src2_valid = uops_0_src2_valid; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_phy_rs2 = rename_table_io_o_rename_res_packs_0_phy_rs2; // @[rename.scala 63:34]
  assign io_o_rename_packs_0_imm = uops_0_imm; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_src1_value = uops_0_src1_value; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_src2_value = uops_0_src2_value; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_op1_sel = uops_0_op1_sel; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_op2_sel = uops_0_op2_sel; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_alu_sel = uops_0_alu_sel; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_branch_type = uops_0_branch_type; // @[rename.scala 57:23]
  assign io_o_rename_packs_0_mem_type = uops_0_mem_type; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_valid = _io_o_rename_packs_0_valid_T_1 ? 1'h0 : uops_1_valid; // @[rename.scala 59:38]
  assign io_o_rename_packs_1_pc = uops_1_pc; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_inst = uops_1_inst; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_func_code = uops_1_func_code; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_branch_predict_pack_valid = uops_1_branch_predict_pack_valid; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_branch_predict_pack_target = uops_1_branch_predict_pack_target; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_branch_predict_pack_taken = uops_1_branch_predict_pack_taken; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_phy_dst = busy_table_io_o_allocated_pregs_1; // @[rename.scala 70:34]
  assign io_o_rename_packs_1_stale_dst = uops_0_arch_dst == uops_1_arch_dst ? busy_table_io_o_allocated_pregs_0 :
    rename_table_io_o_rename_res_packs_1_phy_dst; // @[rename.scala 69:42]
  assign io_o_rename_packs_1_arch_dst = uops_1_arch_dst; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_src1_valid = uops_1_src1_valid; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_phy_rs1 = uops_0_arch_dst == uops_1_arch_rs1 ? busy_table_io_o_allocated_pregs_0 :
    rename_table_io_o_rename_res_packs_1_phy_rs1; // @[rename.scala 67:40]
  assign io_o_rename_packs_1_src2_valid = uops_1_src2_valid; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_phy_rs2 = uops_0_arch_dst == uops_1_arch_rs2 ? busy_table_io_o_allocated_pregs_0 :
    rename_table_io_o_rename_res_packs_1_phy_rs2; // @[rename.scala 68:40]
  assign io_o_rename_packs_1_imm = uops_1_imm; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_src1_value = uops_1_src1_value; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_src2_value = uops_1_src2_value; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_op1_sel = uops_1_op1_sel; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_op2_sel = uops_1_op2_sel; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_alu_sel = uops_1_alu_sel; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_branch_type = uops_1_branch_type; // @[rename.scala 57:23]
  assign io_o_rename_packs_1_mem_type = uops_1_mem_type; // @[rename.scala 57:23]
  assign io_o_written_back_table = busy_table_io_o_written_back; // @[rename.scala 80:29]
  assign io_o_commit_rename_table_0 = rename_table_io_o_commit_rename_table_0; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_1 = rename_table_io_o_commit_rename_table_1; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_2 = rename_table_io_o_commit_rename_table_2; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_3 = rename_table_io_o_commit_rename_table_3; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_4 = rename_table_io_o_commit_rename_table_4; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_5 = rename_table_io_o_commit_rename_table_5; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_6 = rename_table_io_o_commit_rename_table_6; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_7 = rename_table_io_o_commit_rename_table_7; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_8 = rename_table_io_o_commit_rename_table_8; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_9 = rename_table_io_o_commit_rename_table_9; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_10 = rename_table_io_o_commit_rename_table_10; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_11 = rename_table_io_o_commit_rename_table_11; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_12 = rename_table_io_o_commit_rename_table_12; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_13 = rename_table_io_o_commit_rename_table_13; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_14 = rename_table_io_o_commit_rename_table_14; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_15 = rename_table_io_o_commit_rename_table_15; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_16 = rename_table_io_o_commit_rename_table_16; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_17 = rename_table_io_o_commit_rename_table_17; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_18 = rename_table_io_o_commit_rename_table_18; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_19 = rename_table_io_o_commit_rename_table_19; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_20 = rename_table_io_o_commit_rename_table_20; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_21 = rename_table_io_o_commit_rename_table_21; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_22 = rename_table_io_o_commit_rename_table_22; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_23 = rename_table_io_o_commit_rename_table_23; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_24 = rename_table_io_o_commit_rename_table_24; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_25 = rename_table_io_o_commit_rename_table_25; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_26 = rename_table_io_o_commit_rename_table_26; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_27 = rename_table_io_o_commit_rename_table_27; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_28 = rename_table_io_o_commit_rename_table_28; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_29 = rename_table_io_o_commit_rename_table_29; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_30 = rename_table_io_o_commit_rename_table_30; // @[rename.scala 30:30]
  assign io_o_commit_rename_table_31 = rename_table_io_o_commit_rename_table_31; // @[rename.scala 30:30]
  assign rename_table_clock = clock;
  assign rename_table_reset = reset;
  assign rename_table_io_i_rename_req_packs_0_arch_rs1 = uops_0_valid ? uops_0_arch_rs1 : 5'h0; // @[rename.scala 39:62]
  assign rename_table_io_i_rename_req_packs_0_arch_rs2 = uops_0_valid ? uops_0_arch_rs2 : 5'h0; // @[rename.scala 40:62]
  assign rename_table_io_i_rename_req_packs_0_arch_dst = uops_0_valid ? uops_0_arch_dst : 5'h0; // @[rename.scala 41:62]
  assign rename_table_io_i_rename_req_packs_1_arch_rs1 = uops_1_valid ? uops_1_arch_rs1 : 5'h0; // @[rename.scala 39:62]
  assign rename_table_io_i_rename_req_packs_1_arch_rs2 = uops_1_valid ? uops_1_arch_rs2 : 5'h0; // @[rename.scala 40:62]
  assign rename_table_io_i_rename_req_packs_1_arch_dst = uops_1_valid ? uops_1_arch_dst : 5'h0; // @[rename.scala 41:62]
  assign rename_table_io_i_allocation_pack_0_valid = io_o_rename_packs_0_valid; // @[rename.scala 45:38]
  assign rename_table_io_i_allocation_pack_0_phy_dst = io_o_rename_packs_0_phy_dst; // @[rename.scala 45:38]
  assign rename_table_io_i_allocation_pack_0_arch_dst = io_o_rename_packs_0_arch_dst; // @[rename.scala 45:38]
  assign rename_table_io_i_allocation_pack_1_valid = io_o_rename_packs_1_valid; // @[rename.scala 45:38]
  assign rename_table_io_i_allocation_pack_1_phy_dst = io_o_rename_packs_1_phy_dst; // @[rename.scala 45:38]
  assign rename_table_io_i_allocation_pack_1_arch_dst = io_o_rename_packs_1_arch_dst; // @[rename.scala 45:38]
  assign rename_table_io_i_commit_packs_0_valid = io_i_commit_packs_0_valid; // @[rename.scala 43:36]
  assign rename_table_io_i_commit_packs_0_uop_phy_dst = io_i_commit_packs_0_uop_phy_dst; // @[rename.scala 43:36]
  assign rename_table_io_i_commit_packs_0_uop_arch_dst = io_i_commit_packs_0_uop_arch_dst; // @[rename.scala 43:36]
  assign rename_table_io_i_commit_packs_1_valid = io_i_commit_packs_1_valid; // @[rename.scala 43:36]
  assign rename_table_io_i_commit_packs_1_uop_phy_dst = io_i_commit_packs_1_uop_phy_dst; // @[rename.scala 43:36]
  assign rename_table_io_i_commit_packs_1_uop_arch_dst = io_i_commit_packs_1_uop_arch_dst; // @[rename.scala 43:36]
  assign rename_table_io_i_rollback_packs_0_valid = io_i_rollback_packs_0_valid; // @[rename.scala 44:38]
  assign rename_table_io_i_rollback_packs_0_uop_stale_dst = io_i_rollback_packs_0_uop_stale_dst; // @[rename.scala 44:38]
  assign rename_table_io_i_rollback_packs_0_uop_arch_dst = io_i_rollback_packs_0_uop_arch_dst; // @[rename.scala 44:38]
  assign rename_table_io_i_rollback_packs_1_valid = io_i_rollback_packs_1_valid; // @[rename.scala 44:38]
  assign rename_table_io_i_rollback_packs_1_uop_stale_dst = io_i_rollback_packs_1_uop_stale_dst; // @[rename.scala 44:38]
  assign rename_table_io_i_rollback_packs_1_uop_arch_dst = io_i_rollback_packs_1_uop_arch_dst; // @[rename.scala 44:38]
  assign rename_table_io_i_exception = io_i_exception; // @[rename.scala 47:32]
  assign busy_table_clock = clock;
  assign busy_table_reset = reset;
  assign busy_table_io_i_free_list_reqs_0 = uops_0_valid & uops_0_arch_dst != 5'h0; // @[rename.scala 76:55]
  assign busy_table_io_i_free_list_reqs_1 = uops_1_valid & uops_1_arch_dst != 5'h0; // @[rename.scala 77:55]
  assign busy_table_io_i_allocated_uops_0_valid = io_o_rename_packs_0_valid; // @[rename.scala 73:36]
  assign busy_table_io_i_allocated_uops_0_phy_dst = io_o_rename_packs_0_phy_dst; // @[rename.scala 73:36]
  assign busy_table_io_i_allocated_uops_1_valid = io_o_rename_packs_1_valid; // @[rename.scala 73:36]
  assign busy_table_io_i_allocated_uops_1_phy_dst = io_o_rename_packs_1_phy_dst; // @[rename.scala 73:36]
  assign busy_table_io_i_commit_packs_0_valid = io_i_commit_packs_0_valid; // @[rename.scala 74:34]
  assign busy_table_io_i_commit_packs_0_uop_phy_dst = io_i_commit_packs_0_uop_phy_dst; // @[rename.scala 74:34]
  assign busy_table_io_i_commit_packs_0_uop_stale_dst = io_i_commit_packs_0_uop_stale_dst; // @[rename.scala 74:34]
  assign busy_table_io_i_commit_packs_1_valid = io_i_commit_packs_1_valid; // @[rename.scala 74:34]
  assign busy_table_io_i_commit_packs_1_uop_phy_dst = io_i_commit_packs_1_uop_phy_dst; // @[rename.scala 74:34]
  assign busy_table_io_i_commit_packs_1_uop_stale_dst = io_i_commit_packs_1_uop_stale_dst; // @[rename.scala 74:34]
  assign busy_table_io_i_rollback_packs_0_valid = io_i_rollback_packs_0_valid; // @[rename.scala 75:36]
  assign busy_table_io_i_rollback_packs_0_uop_phy_dst = io_i_rollback_packs_0_uop_phy_dst; // @[rename.scala 75:36]
  assign busy_table_io_i_rollback_packs_1_valid = io_i_rollback_packs_1_valid; // @[rename.scala 75:36]
  assign busy_table_io_i_rollback_packs_1_uop_phy_dst = io_i_rollback_packs_1_uop_phy_dst; // @[rename.scala 75:36]
  assign busy_table_io_i_exception = io_i_exception; // @[rename.scala 78:31]
  always @(posedge clock) begin
    if (reset) begin // @[rename.scala 33:23]
      uops_0_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_valid <= io_i_decode_packs_1_valid;
      end else begin
        uops_0_valid <= io_i_decode_packs_0_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_pc <= 32'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_pc <= io_i_decode_packs_1_pc;
      end else begin
        uops_0_pc <= io_i_decode_packs_0_pc;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_inst <= 32'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_inst <= io_i_decode_packs_1_inst;
      end else begin
        uops_0_inst <= io_i_decode_packs_0_inst;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_func_code <= 7'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_func_code <= io_i_decode_packs_1_func_code;
      end else begin
        uops_0_func_code <= io_i_decode_packs_0_func_code;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_branch_predict_pack_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_branch_predict_pack_valid <= io_i_decode_packs_1_branch_predict_pack_valid;
      end else begin
        uops_0_branch_predict_pack_valid <= io_i_decode_packs_0_branch_predict_pack_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_branch_predict_pack_target <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_branch_predict_pack_target <= io_i_decode_packs_1_branch_predict_pack_target;
      end else begin
        uops_0_branch_predict_pack_target <= io_i_decode_packs_0_branch_predict_pack_target;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_branch_predict_pack_taken <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_branch_predict_pack_taken <= io_i_decode_packs_1_branch_predict_pack_taken;
      end else begin
        uops_0_branch_predict_pack_taken <= io_i_decode_packs_0_branch_predict_pack_taken;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_arch_dst <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_arch_dst <= io_i_decode_packs_1_arch_dst;
      end else begin
        uops_0_arch_dst <= io_i_decode_packs_0_arch_dst;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_src1_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_src1_valid <= io_i_decode_packs_1_src1_valid;
      end else begin
        uops_0_src1_valid <= io_i_decode_packs_0_src1_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_arch_rs1 <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_arch_rs1 <= io_i_decode_packs_1_arch_rs1;
      end else begin
        uops_0_arch_rs1 <= io_i_decode_packs_0_arch_rs1;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_src2_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_src2_valid <= io_i_decode_packs_1_src2_valid;
      end else begin
        uops_0_src2_valid <= io_i_decode_packs_0_src2_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_arch_rs2 <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_arch_rs2 <= io_i_decode_packs_1_arch_rs2;
      end else begin
        uops_0_arch_rs2 <= io_i_decode_packs_0_arch_rs2;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_imm <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_imm <= io_i_decode_packs_1_imm;
      end else begin
        uops_0_imm <= io_i_decode_packs_0_imm;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_src1_value <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_src1_value <= io_i_decode_packs_1_src1_value;
      end else begin
        uops_0_src1_value <= io_i_decode_packs_0_src1_value;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_src2_value <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_src2_value <= io_i_decode_packs_1_src2_value;
      end else begin
        uops_0_src2_value <= io_i_decode_packs_0_src2_value;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_op1_sel <= 3'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_op1_sel <= io_i_decode_packs_1_op1_sel;
      end else begin
        uops_0_op1_sel <= io_i_decode_packs_0_op1_sel;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_op2_sel <= 3'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_op2_sel <= io_i_decode_packs_1_op2_sel;
      end else begin
        uops_0_op2_sel <= io_i_decode_packs_0_op2_sel;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_alu_sel <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_alu_sel <= io_i_decode_packs_1_alu_sel;
      end else begin
        uops_0_alu_sel <= io_i_decode_packs_0_alu_sel;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_branch_type <= 3'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_branch_type <= io_i_decode_packs_1_branch_type;
      end else begin
        uops_0_branch_type <= io_i_decode_packs_0_branch_type;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_0_mem_type <= 2'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 34:19]
      if (~io_i_decode_packs_0_valid & io_i_decode_packs_1_valid) begin // @[rename.scala 34:44]
        uops_0_mem_type <= io_i_decode_packs_1_mem_type;
      end else begin
        uops_0_mem_type <= io_i_decode_packs_0_mem_type;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_valid <= io_i_decode_packs_0_valid;
      end else begin
        uops_1_valid <= io_i_decode_packs_1_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_pc <= 32'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_pc <= io_i_decode_packs_0_pc;
      end else begin
        uops_1_pc <= io_i_decode_packs_1_pc;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_inst <= 32'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_inst <= io_i_decode_packs_0_inst;
      end else begin
        uops_1_inst <= io_i_decode_packs_1_inst;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_func_code <= 7'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_func_code <= io_i_decode_packs_0_func_code;
      end else begin
        uops_1_func_code <= io_i_decode_packs_1_func_code;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_branch_predict_pack_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_branch_predict_pack_valid <= io_i_decode_packs_0_branch_predict_pack_valid;
      end else begin
        uops_1_branch_predict_pack_valid <= io_i_decode_packs_1_branch_predict_pack_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_branch_predict_pack_target <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_branch_predict_pack_target <= io_i_decode_packs_0_branch_predict_pack_target;
      end else begin
        uops_1_branch_predict_pack_target <= io_i_decode_packs_1_branch_predict_pack_target;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_branch_predict_pack_taken <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_branch_predict_pack_taken <= io_i_decode_packs_0_branch_predict_pack_taken;
      end else begin
        uops_1_branch_predict_pack_taken <= io_i_decode_packs_1_branch_predict_pack_taken;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_arch_dst <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_arch_dst <= io_i_decode_packs_0_arch_dst;
      end else begin
        uops_1_arch_dst <= io_i_decode_packs_1_arch_dst;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_src1_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_src1_valid <= io_i_decode_packs_0_src1_valid;
      end else begin
        uops_1_src1_valid <= io_i_decode_packs_1_src1_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_arch_rs1 <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_arch_rs1 <= io_i_decode_packs_0_arch_rs1;
      end else begin
        uops_1_arch_rs1 <= io_i_decode_packs_1_arch_rs1;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_src2_valid <= 1'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_src2_valid <= io_i_decode_packs_0_src2_valid;
      end else begin
        uops_1_src2_valid <= io_i_decode_packs_1_src2_valid;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_arch_rs2 <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_arch_rs2 <= io_i_decode_packs_0_arch_rs2;
      end else begin
        uops_1_arch_rs2 <= io_i_decode_packs_1_arch_rs2;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_imm <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_imm <= io_i_decode_packs_0_imm;
      end else begin
        uops_1_imm <= io_i_decode_packs_1_imm;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_src1_value <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_src1_value <= io_i_decode_packs_0_src1_value;
      end else begin
        uops_1_src1_value <= io_i_decode_packs_1_src1_value;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_src2_value <= 64'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_src2_value <= io_i_decode_packs_0_src2_value;
      end else begin
        uops_1_src2_value <= io_i_decode_packs_1_src2_value;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_op1_sel <= 3'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_op1_sel <= io_i_decode_packs_0_op1_sel;
      end else begin
        uops_1_op1_sel <= io_i_decode_packs_1_op1_sel;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_op2_sel <= 3'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_op2_sel <= io_i_decode_packs_0_op2_sel;
      end else begin
        uops_1_op2_sel <= io_i_decode_packs_1_op2_sel;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_alu_sel <= 5'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_alu_sel <= io_i_decode_packs_0_alu_sel;
      end else begin
        uops_1_alu_sel <= io_i_decode_packs_1_alu_sel;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_branch_type <= 3'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_branch_type <= io_i_decode_packs_0_branch_type;
      end else begin
        uops_1_branch_type <= io_i_decode_packs_1_branch_type;
      end
    end
    if (reset) begin // @[rename.scala 33:23]
      uops_1_mem_type <= 2'h0; // @[rename.scala 33:23]
    end else if (!(io_i_stall)) begin // @[rename.scala 35:19]
      if (_uops_0_T_1) begin // @[rename.scala 35:44]
        uops_1_mem_type <= io_i_decode_packs_0_mem_type;
      end else begin
        uops_1_mem_type <= io_i_decode_packs_1_mem_type;
      end
    end
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
  _RAND_0 = {1{`RANDOM}};
  uops_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  uops_0_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  uops_0_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  uops_0_func_code = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  uops_0_branch_predict_pack_valid = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  uops_0_branch_predict_pack_target = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  uops_0_branch_predict_pack_taken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  uops_0_arch_dst = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  uops_0_src1_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_arch_rs1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  uops_0_src2_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_arch_rs2 = _RAND_11[4:0];
  _RAND_12 = {2{`RANDOM}};
  uops_0_imm = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  uops_0_src1_value = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  uops_0_src2_value = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  uops_0_op1_sel = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  uops_0_op2_sel = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  uops_0_alu_sel = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  uops_0_branch_type = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  uops_0_mem_type = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  uops_1_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uops_1_pc = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  uops_1_inst = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  uops_1_func_code = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  uops_1_branch_predict_pack_valid = _RAND_24[0:0];
  _RAND_25 = {2{`RANDOM}};
  uops_1_branch_predict_pack_target = _RAND_25[63:0];
  _RAND_26 = {1{`RANDOM}};
  uops_1_branch_predict_pack_taken = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uops_1_arch_dst = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  uops_1_src1_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uops_1_arch_rs1 = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  uops_1_src2_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uops_1_arch_rs2 = _RAND_31[4:0];
  _RAND_32 = {2{`RANDOM}};
  uops_1_imm = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  uops_1_src1_value = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  uops_1_src2_value = _RAND_34[63:0];
  _RAND_35 = {1{`RANDOM}};
  uops_1_op1_sel = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  uops_1_op2_sel = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  uops_1_alu_sel = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  uops_1_branch_type = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  uops_1_mem_type = _RAND_39[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
