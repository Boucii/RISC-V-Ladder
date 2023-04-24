module Reservation_Station(
  input          clock,
  input          reset,
  input          io_i_dispatch_packs_0_valid,
  input  [31:0]  io_i_dispatch_packs_0_pc,
  input  [31:0]  io_i_dispatch_packs_0_inst,
  input  [6:0]   io_i_dispatch_packs_0_func_code,
  input          io_i_dispatch_packs_0_branch_predict_pack_valid,
  input  [63:0]  io_i_dispatch_packs_0_branch_predict_pack_target,
  input  [3:0]   io_i_dispatch_packs_0_branch_predict_pack_branch_type,
  input          io_i_dispatch_packs_0_branch_predict_pack_select,
  input          io_i_dispatch_packs_0_branch_predict_pack_taken,
  input  [6:0]   io_i_dispatch_packs_0_phy_dst,
  input  [6:0]   io_i_dispatch_packs_0_stale_dst,
  input  [4:0]   io_i_dispatch_packs_0_arch_dst,
  input  [2:0]   io_i_dispatch_packs_0_inst_type,
  input          io_i_dispatch_packs_0_regWen,
  input          io_i_dispatch_packs_0_src1_valid,
  input  [6:0]   io_i_dispatch_packs_0_phy_rs1,
  input  [4:0]   io_i_dispatch_packs_0_arch_rs1,
  input          io_i_dispatch_packs_0_src2_valid,
  input  [6:0]   io_i_dispatch_packs_0_phy_rs2,
  input  [4:0]   io_i_dispatch_packs_0_arch_rs2,
  input  [3:0]   io_i_dispatch_packs_0_rob_idx,
  input  [63:0]  io_i_dispatch_packs_0_imm,
  input  [63:0]  io_i_dispatch_packs_0_src1_value,
  input  [63:0]  io_i_dispatch_packs_0_src2_value,
  input  [2:0]   io_i_dispatch_packs_0_op1_sel,
  input  [2:0]   io_i_dispatch_packs_0_op2_sel,
  input  [4:0]   io_i_dispatch_packs_0_alu_sel,
  input  [3:0]   io_i_dispatch_packs_0_branch_type,
  input  [2:0]   io_i_dispatch_packs_0_mem_type,
  input          io_i_dispatch_packs_1_valid,
  input  [31:0]  io_i_dispatch_packs_1_pc,
  input  [31:0]  io_i_dispatch_packs_1_inst,
  input  [6:0]   io_i_dispatch_packs_1_func_code,
  input          io_i_dispatch_packs_1_branch_predict_pack_valid,
  input  [63:0]  io_i_dispatch_packs_1_branch_predict_pack_target,
  input  [3:0]   io_i_dispatch_packs_1_branch_predict_pack_branch_type,
  input          io_i_dispatch_packs_1_branch_predict_pack_select,
  input          io_i_dispatch_packs_1_branch_predict_pack_taken,
  input  [6:0]   io_i_dispatch_packs_1_phy_dst,
  input  [6:0]   io_i_dispatch_packs_1_stale_dst,
  input  [4:0]   io_i_dispatch_packs_1_arch_dst,
  input  [2:0]   io_i_dispatch_packs_1_inst_type,
  input          io_i_dispatch_packs_1_regWen,
  input          io_i_dispatch_packs_1_src1_valid,
  input  [6:0]   io_i_dispatch_packs_1_phy_rs1,
  input  [4:0]   io_i_dispatch_packs_1_arch_rs1,
  input          io_i_dispatch_packs_1_src2_valid,
  input  [6:0]   io_i_dispatch_packs_1_phy_rs2,
  input  [4:0]   io_i_dispatch_packs_1_arch_rs2,
  input  [3:0]   io_i_dispatch_packs_1_rob_idx,
  input  [63:0]  io_i_dispatch_packs_1_imm,
  input  [63:0]  io_i_dispatch_packs_1_src1_value,
  input  [63:0]  io_i_dispatch_packs_1_src2_value,
  input  [2:0]   io_i_dispatch_packs_1_op1_sel,
  input  [2:0]   io_i_dispatch_packs_1_op2_sel,
  input  [4:0]   io_i_dispatch_packs_1_alu_sel,
  input  [3:0]   io_i_dispatch_packs_1_branch_type,
  input  [2:0]   io_i_dispatch_packs_1_mem_type,
  output         io_o_issue_packs_0_valid,
  output [31:0]  io_o_issue_packs_0_pc,
  output [31:0]  io_o_issue_packs_0_inst,
  output [6:0]   io_o_issue_packs_0_func_code,
  output         io_o_issue_packs_0_branch_predict_pack_valid,
  output [63:0]  io_o_issue_packs_0_branch_predict_pack_target,
  output [3:0]   io_o_issue_packs_0_branch_predict_pack_branch_type,
  output         io_o_issue_packs_0_branch_predict_pack_select,
  output         io_o_issue_packs_0_branch_predict_pack_taken,
  output [6:0]   io_o_issue_packs_0_phy_dst,
  output [6:0]   io_o_issue_packs_0_stale_dst,
  output [4:0]   io_o_issue_packs_0_arch_dst,
  output [2:0]   io_o_issue_packs_0_inst_type,
  output         io_o_issue_packs_0_regWen,
  output         io_o_issue_packs_0_src1_valid,
  output [6:0]   io_o_issue_packs_0_phy_rs1,
  output [4:0]   io_o_issue_packs_0_arch_rs1,
  output         io_o_issue_packs_0_src2_valid,
  output [6:0]   io_o_issue_packs_0_phy_rs2,
  output [4:0]   io_o_issue_packs_0_arch_rs2,
  output [3:0]   io_o_issue_packs_0_rob_idx,
  output [63:0]  io_o_issue_packs_0_imm,
  output [63:0]  io_o_issue_packs_0_src1_value,
  output [63:0]  io_o_issue_packs_0_src2_value,
  output [2:0]   io_o_issue_packs_0_op1_sel,
  output [2:0]   io_o_issue_packs_0_op2_sel,
  output [4:0]   io_o_issue_packs_0_alu_sel,
  output [3:0]   io_o_issue_packs_0_branch_type,
  output [2:0]   io_o_issue_packs_0_mem_type,
  output         io_o_issue_packs_1_valid,
  output [31:0]  io_o_issue_packs_1_pc,
  output [31:0]  io_o_issue_packs_1_inst,
  output [6:0]   io_o_issue_packs_1_func_code,
  output         io_o_issue_packs_1_branch_predict_pack_valid,
  output [63:0]  io_o_issue_packs_1_branch_predict_pack_target,
  output [3:0]   io_o_issue_packs_1_branch_predict_pack_branch_type,
  output         io_o_issue_packs_1_branch_predict_pack_select,
  output         io_o_issue_packs_1_branch_predict_pack_taken,
  output [6:0]   io_o_issue_packs_1_phy_dst,
  output [6:0]   io_o_issue_packs_1_stale_dst,
  output [4:0]   io_o_issue_packs_1_arch_dst,
  output [2:0]   io_o_issue_packs_1_inst_type,
  output         io_o_issue_packs_1_regWen,
  output         io_o_issue_packs_1_src1_valid,
  output [6:0]   io_o_issue_packs_1_phy_rs1,
  output [4:0]   io_o_issue_packs_1_arch_rs1,
  output         io_o_issue_packs_1_src2_valid,
  output [6:0]   io_o_issue_packs_1_phy_rs2,
  output [4:0]   io_o_issue_packs_1_arch_rs2,
  output [3:0]   io_o_issue_packs_1_rob_idx,
  output [63:0]  io_o_issue_packs_1_imm,
  output [63:0]  io_o_issue_packs_1_src1_value,
  output [63:0]  io_o_issue_packs_1_src2_value,
  output [2:0]   io_o_issue_packs_1_op1_sel,
  output [2:0]   io_o_issue_packs_1_op2_sel,
  output [4:0]   io_o_issue_packs_1_alu_sel,
  output [3:0]   io_o_issue_packs_1_branch_type,
  output [2:0]   io_o_issue_packs_1_mem_type,
  input  [127:0] io_i_wakeup_port,
  input          io_i_ex_res_packs_0_valid,
  input  [6:0]   io_i_ex_res_packs_0_uop_func_code,
  input  [6:0]   io_i_ex_res_packs_0_uop_phy_dst,
  input  [63:0]  io_i_ex_res_packs_0_uop_dst_value,
  input          io_i_ex_res_packs_1_valid,
  input  [6:0]   io_i_ex_res_packs_1_uop_func_code,
  input  [6:0]   io_i_ex_res_packs_1_uop_phy_dst,
  input  [63:0]  io_i_ex_res_packs_1_uop_dst_value,
  input          io_i_branch_resolve_pack_valid,
  input          io_i_branch_resolve_pack_mispred,
  input  [3:0]   io_i_branch_resolve_pack_rob_idx,
  output         io_o_full,
  input          io_i_exception,
  input          io_i_rollback_valid,
  input  [1:0]   io_i_available_funcs_0,
  input  [1:0]   io_i_available_funcs_1,
  input  [1:0]   io_i_available_funcs_2,
  input  [1:0]   io_i_available_funcs_3,
  input  [1:0]   io_i_available_funcs_4,
  input  [1:0]   io_i_available_funcs_5,
  input  [3:0]   io_i_ROB_first_entry
);
  wire  reservation_station_0_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_0_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_0_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_0_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_0_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_0_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_0_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_0_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_0_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_0_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_0_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_0_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_1_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_1_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_1_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_1_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_1_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_1_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_1_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_1_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_1_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_1_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_1_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_2_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_2_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_2_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_2_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_2_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_2_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_2_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_2_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_2_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_2_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_2_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_3_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_3_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_3_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_3_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_3_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_3_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_3_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_3_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_3_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_3_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_3_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_4_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_4_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_4_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_4_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_4_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_4_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_4_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_4_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_4_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_4_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_4_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_5_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_5_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_5_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_5_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_5_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_5_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_5_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_5_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_5_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_5_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_5_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_6_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_6_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_6_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_6_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_6_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_6_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_6_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_6_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_6_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_6_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_6_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_clock; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_reset; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_ready_to_issue; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_issue_granted; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_branch_resolve_pack_valid; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_exception; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_write_slot; // @[reservation_station.scala 39:56]
  wire [127:0] reservation_station_7_io_i_wakeup_port; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_valid; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_7_io_i_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_7_io_i_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_i_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_i_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_i_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_i_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_i_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_i_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_i_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_i_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_i_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_i_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_i_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_i_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_i_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_i_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_i_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_i_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_7_io_o_uop_pc; // @[reservation_station.scala 39:56]
  wire [31:0] reservation_station_7_io_o_uop_inst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_o_uop_func_code; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_uop_branch_predict_pack_valid; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_o_uop_branch_predict_pack_target; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_o_uop_branch_predict_pack_branch_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_uop_branch_predict_pack_select; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_uop_branch_predict_pack_taken; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_o_uop_phy_dst; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_o_uop_stale_dst; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_o_uop_arch_dst; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_o_uop_inst_type; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_uop_regWen; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_uop_src1_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_o_uop_phy_rs1; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_o_uop_arch_rs1; // @[reservation_station.scala 39:56]
  wire  reservation_station_7_io_o_uop_src2_valid; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_o_uop_phy_rs2; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_o_uop_arch_rs2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_o_uop_rob_idx; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_o_uop_imm; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_o_uop_src1_value; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_o_uop_src2_value; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_o_uop_op1_sel; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_o_uop_op2_sel; // @[reservation_station.scala 39:56]
  wire [4:0] reservation_station_7_io_o_uop_alu_sel; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_o_uop_branch_type; // @[reservation_station.scala 39:56]
  wire [2:0] reservation_station_7_io_o_uop_mem_type; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_exe_dst1; // @[reservation_station.scala 39:56]
  wire [6:0] reservation_station_7_io_i_exe_dst2; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_i_exe_value1; // @[reservation_station.scala 39:56]
  wire [63:0] reservation_station_7_io_i_exe_value2; // @[reservation_station.scala 39:56]
  wire [3:0] reservation_station_7_io_i_ROB_first_entry; // @[reservation_station.scala 39:56]
  wire  temp_1 = reservation_station_1_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_0 = reservation_station_0_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_3 = reservation_station_3_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_2 = reservation_station_2_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_5 = reservation_station_5_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_4 = reservation_station_4_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_7 = reservation_station_7_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire  temp_6 = reservation_station_6_io_o_valid; // @[reservation_station.scala 42:21 44:16]
  wire [7:0] reservation_station_valid = {temp_7,temp_6,temp_5,temp_4,temp_3,temp_2,temp_1,temp_0}; // @[reservation_station.scala 49:46]
  wire [7:0] _write_idx1_T = ~reservation_station_valid; // @[reservation_station.scala 50:34]
  wire [2:0] _write_idx1_T_9 = _write_idx1_T[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _write_idx1_T_10 = _write_idx1_T[5] ? 3'h5 : _write_idx1_T_9; // @[Mux.scala 47:70]
  wire [2:0] _write_idx1_T_11 = _write_idx1_T[4] ? 3'h4 : _write_idx1_T_10; // @[Mux.scala 47:70]
  wire [2:0] _write_idx1_T_12 = _write_idx1_T[3] ? 3'h3 : _write_idx1_T_11; // @[Mux.scala 47:70]
  wire [2:0] _write_idx1_T_13 = _write_idx1_T[2] ? 3'h2 : _write_idx1_T_12; // @[Mux.scala 47:70]
  wire [2:0] _write_idx1_T_14 = _write_idx1_T[1] ? 3'h1 : _write_idx1_T_13; // @[Mux.scala 47:70]
  wire [2:0] write_idx1 = _write_idx1_T[0] ? 3'h0 : _write_idx1_T_14; // @[Mux.scala 47:70]
  wire [7:0] _reservation_station_valid_withmask_T = 8'h1 << write_idx1; // @[OneHot.scala 57:35]
  wire [7:0] reservation_station_valid_withmask = reservation_station_valid | _reservation_station_valid_withmask_T; // @[reservation_station.scala 51:69]
  wire [7:0] _write_idx2_T = ~reservation_station_valid_withmask; // @[reservation_station.scala 52:34]
  wire [2:0] _write_idx2_T_9 = _write_idx2_T[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _write_idx2_T_10 = _write_idx2_T[5] ? 3'h5 : _write_idx2_T_9; // @[Mux.scala 47:70]
  wire [2:0] _write_idx2_T_11 = _write_idx2_T[4] ? 3'h4 : _write_idx2_T_10; // @[Mux.scala 47:70]
  wire [2:0] _write_idx2_T_12 = _write_idx2_T[3] ? 3'h3 : _write_idx2_T_11; // @[Mux.scala 47:70]
  wire [2:0] _write_idx2_T_13 = _write_idx2_T[2] ? 3'h2 : _write_idx2_T_12; // @[Mux.scala 47:70]
  wire [2:0] _write_idx2_T_14 = _write_idx2_T[1] ? 3'h1 : _write_idx2_T_13; // @[Mux.scala 47:70]
  wire [2:0] write_idx2 = _write_idx2_T[0] ? 3'h0 : _write_idx2_T_14; // @[Mux.scala 47:70]
  wire  temp2_0 = |io_i_available_funcs_0; // @[reservation_station.scala 60:44]
  wire  temp2_1 = |io_i_available_funcs_1; // @[reservation_station.scala 60:44]
  wire  temp2_2 = |io_i_available_funcs_2; // @[reservation_station.scala 60:44]
  wire  temp2_3 = |io_i_available_funcs_3; // @[reservation_station.scala 60:44]
  wire  temp2_4 = |io_i_available_funcs_4; // @[reservation_station.scala 60:44]
  wire  temp2_5 = |io_i_available_funcs_5; // @[reservation_station.scala 60:44]
  wire [6:0] available_funcs = {1'h0,temp2_5,temp2_4,temp2_3,temp2_2,temp2_1,temp2_0}; // @[reservation_station.scala 62:37]
  wire [6:0] _slots_can_issue_T = reservation_station_0_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_0 = reservation_station_0_io_o_ready_to_issue & |_slots_can_issue_T; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_4 = reservation_station_1_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_1 = reservation_station_1_io_o_ready_to_issue & |_slots_can_issue_T_4; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_8 = reservation_station_2_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_2 = reservation_station_2_io_o_ready_to_issue & |_slots_can_issue_T_8; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_12 = reservation_station_3_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_3 = reservation_station_3_io_o_ready_to_issue & |_slots_can_issue_T_12; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_16 = reservation_station_4_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_4 = reservation_station_4_io_o_ready_to_issue & |_slots_can_issue_T_16; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_20 = reservation_station_5_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_5 = reservation_station_5_io_o_ready_to_issue & |_slots_can_issue_T_20; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_24 = reservation_station_6_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_6 = reservation_station_6_io_o_ready_to_issue & |_slots_can_issue_T_24; // @[reservation_station.scala 64:103]
  wire [6:0] _slots_can_issue_T_28 = reservation_station_7_io_o_uop_func_code & available_funcs; // @[reservation_station.scala 64:150]
  wire  slots_can_issue_7 = reservation_station_7_io_o_ready_to_issue & |_slots_can_issue_T_28; // @[reservation_station.scala 64:103]
  wire [7:0] _issue1_idx_T = {slots_can_issue_7,slots_can_issue_6,slots_can_issue_5,slots_can_issue_4,slots_can_issue_3,
    slots_can_issue_2,slots_can_issue_1,slots_can_issue_0}; // @[reservation_station.scala 66:58]
  wire [2:0] _issue1_idx_T_9 = _issue1_idx_T[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _issue1_idx_T_10 = _issue1_idx_T[5] ? 3'h5 : _issue1_idx_T_9; // @[Mux.scala 47:70]
  wire [2:0] _issue1_idx_T_11 = _issue1_idx_T[4] ? 3'h4 : _issue1_idx_T_10; // @[Mux.scala 47:70]
  wire [2:0] _issue1_idx_T_12 = _issue1_idx_T[3] ? 3'h3 : _issue1_idx_T_11; // @[Mux.scala 47:70]
  wire [2:0] _issue1_idx_T_13 = _issue1_idx_T[2] ? 3'h2 : _issue1_idx_T_12; // @[Mux.scala 47:70]
  wire [2:0] _issue1_idx_T_14 = _issue1_idx_T[1] ? 3'h1 : _issue1_idx_T_13; // @[Mux.scala 47:70]
  wire [2:0] issue1_idx = _issue1_idx_T[0] ? 3'h0 : _issue1_idx_T_14; // @[Mux.scala 47:70]
  wire  _issue1_func_code_T = 3'h0 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_1 = 3'h1 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_2 = 3'h2 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_3 = 3'h3 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_4 = 3'h4 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_5 = 3'h5 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_6 = 3'h6 == issue1_idx; // @[reservation_station.scala 69:85]
  wire  _issue1_func_code_T_7 = 3'h7 == issue1_idx; // @[reservation_station.scala 69:85]
  wire [6:0] _issue1_func_code_T_8 = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_func_code : 7'h40; // @[Mux.scala 101:16]
  wire [6:0] _issue1_func_code_T_9 = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_func_code :
    _issue1_func_code_T_8; // @[Mux.scala 101:16]
  wire [6:0] _issue1_func_code_T_10 = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_func_code :
    _issue1_func_code_T_9; // @[Mux.scala 101:16]
  wire [6:0] _issue1_func_code_T_11 = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_func_code :
    _issue1_func_code_T_10; // @[Mux.scala 101:16]
  wire [6:0] _issue1_func_code_T_12 = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_func_code :
    _issue1_func_code_T_11; // @[Mux.scala 101:16]
  wire [6:0] _issue1_func_code_T_13 = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_func_code :
    _issue1_func_code_T_12; // @[Mux.scala 101:16]
  wire [6:0] _issue1_func_code_T_14 = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_func_code :
    _issue1_func_code_T_13; // @[Mux.scala 101:16]
  wire [6:0] issue1_func_code = _issue1_func_code_T ? reservation_station_0_io_o_uop_func_code : _issue1_func_code_T_14; // @[Mux.scala 101:16]
  wire [2:0] hi = issue1_func_code[6:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo = issue1_func_code[3:0]; // @[OneHot.scala 31:18]
  wire  _T = |hi; // @[OneHot.scala 32:14]
  wire [3:0] _GEN_14 = {{1'd0}, hi}; // @[OneHot.scala 32:28]
  wire [3:0] _T_1 = _GEN_14 | lo; // @[OneHot.scala 32:28]
  wire [1:0] hi_1 = _T_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_1 = _T_1[1:0]; // @[OneHot.scala 31:18]
  wire  _T_2 = |hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _T_3 = hi_1 | lo_1; // @[OneHot.scala 32:28]
  wire [2:0] _T_6 = {_T,_T_2,_T_3[1]}; // @[Cat.scala 33:92]
  wire [1:0] _GEN_1 = 3'h1 == _T_6 ? io_i_available_funcs_1 : io_i_available_funcs_0; // @[reservation_station.scala 72:{109,109}]
  wire [1:0] _GEN_2 = 3'h2 == _T_6 ? io_i_available_funcs_2 : _GEN_1; // @[reservation_station.scala 72:{109,109}]
  wire [1:0] _GEN_3 = 3'h3 == _T_6 ? io_i_available_funcs_3 : _GEN_2; // @[reservation_station.scala 72:{109,109}]
  wire [1:0] _GEN_4 = 3'h4 == _T_6 ? io_i_available_funcs_4 : _GEN_3; // @[reservation_station.scala 72:{109,109}]
  wire [1:0] _GEN_5 = 3'h5 == _T_6 ? io_i_available_funcs_5 : _GEN_4; // @[reservation_station.scala 72:{109,109}]
  wire [1:0] _GEN_6 = 3'h6 == _T_6 ? 2'h0 : _GEN_5; // @[reservation_station.scala 72:{109,109}]
  wire [1:0] _available_funcs_with_mask_T_8 = _GEN_6 - 2'h1; // @[reservation_station.scala 72:109]
  wire [1:0] available_funcs_with_mask_0 = 3'h0 == _T_6 ? _available_funcs_with_mask_T_8 : io_i_available_funcs_0; // @[reservation_station.scala 71:31 72:{59,59}]
  wire [1:0] available_funcs_with_mask_1 = 3'h1 == _T_6 ? _available_funcs_with_mask_T_8 : io_i_available_funcs_1; // @[reservation_station.scala 71:31 72:{59,59}]
  wire [1:0] available_funcs_with_mask_2 = 3'h2 == _T_6 ? _available_funcs_with_mask_T_8 : io_i_available_funcs_2; // @[reservation_station.scala 71:31 72:{59,59}]
  wire [1:0] available_funcs_with_mask_3 = 3'h3 == _T_6 ? _available_funcs_with_mask_T_8 : io_i_available_funcs_3; // @[reservation_station.scala 71:31 72:{59,59}]
  wire [1:0] available_funcs_with_mask_4 = 3'h4 == _T_6 ? _available_funcs_with_mask_T_8 : io_i_available_funcs_4; // @[reservation_station.scala 71:31 72:{59,59}]
  wire [1:0] available_funcs_with_mask_5 = 3'h5 == _T_6 ? _available_funcs_with_mask_T_8 : io_i_available_funcs_5; // @[reservation_station.scala 71:31 72:{59,59}]
  wire [1:0] available_funcs_with_mask_6 = 3'h6 == _T_6 ? _available_funcs_with_mask_T_8 : 2'h0; // @[reservation_station.scala 71:31 72:{59,59}]
  wire  temp3_0 = |available_funcs_with_mask_0; // @[reservation_station.scala 76:49]
  wire  temp3_1 = |available_funcs_with_mask_1; // @[reservation_station.scala 76:49]
  wire  temp3_2 = |available_funcs_with_mask_2; // @[reservation_station.scala 76:49]
  wire  temp3_3 = |available_funcs_with_mask_3; // @[reservation_station.scala 76:49]
  wire  temp3_4 = |available_funcs_with_mask_4; // @[reservation_station.scala 76:49]
  wire  temp3_5 = |available_funcs_with_mask_5; // @[reservation_station.scala 76:49]
  wire  temp3_6 = |available_funcs_with_mask_6; // @[reservation_station.scala 76:49]
  wire [6:0] available_funcs2_bits = {temp3_6,temp3_5,temp3_4,temp3_3,temp3_2,temp3_1,temp3_0}; // @[reservation_station.scala 79:46]
  wire [6:0] _slots_can_issue2_T_2 = reservation_station_0_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_3 = |_slots_can_issue2_T_2; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_0 = slots_can_issue_0 & 3'h0 != issue1_idx & _slots_can_issue2_T_3; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_8 = reservation_station_1_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_9 = |_slots_can_issue2_T_8; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_1 = slots_can_issue_1 & 3'h1 != issue1_idx & _slots_can_issue2_T_9; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_14 = reservation_station_2_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_15 = |_slots_can_issue2_T_14; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_2 = slots_can_issue_2 & 3'h2 != issue1_idx & _slots_can_issue2_T_15; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_20 = reservation_station_3_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_21 = |_slots_can_issue2_T_20; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_3 = slots_can_issue_3 & 3'h3 != issue1_idx & _slots_can_issue2_T_21; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_26 = reservation_station_4_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_27 = |_slots_can_issue2_T_26; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_4 = slots_can_issue_4 & 3'h4 != issue1_idx & _slots_can_issue2_T_27; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_32 = reservation_station_5_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_33 = |_slots_can_issue2_T_32; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_5 = slots_can_issue_5 & 3'h5 != issue1_idx & _slots_can_issue2_T_33; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_38 = reservation_station_6_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_39 = |_slots_can_issue2_T_38; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_6 = slots_can_issue_6 & 3'h6 != issue1_idx & _slots_can_issue2_T_39; // @[reservation_station.scala 80:104]
  wire [6:0] _slots_can_issue2_T_44 = reservation_station_7_io_o_uop_func_code & available_funcs2_bits; // @[reservation_station.scala 81:55]
  wire  _slots_can_issue2_T_45 = |_slots_can_issue2_T_44; // @[reservation_station.scala 81:80]
  wire  slots_can_issue2_7 = slots_can_issue_7 & 3'h7 != issue1_idx & _slots_can_issue2_T_45; // @[reservation_station.scala 80:104]
  wire [7:0] _issue2_idx_T = {slots_can_issue2_7,slots_can_issue2_6,slots_can_issue2_5,slots_can_issue2_4,
    slots_can_issue2_3,slots_can_issue2_2,slots_can_issue2_1,slots_can_issue2_0}; // @[reservation_station.scala 84:53]
  wire [2:0] _issue2_idx_T_9 = _issue2_idx_T[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _issue2_idx_T_10 = _issue2_idx_T[5] ? 3'h5 : _issue2_idx_T_9; // @[Mux.scala 47:70]
  wire [2:0] _issue2_idx_T_11 = _issue2_idx_T[4] ? 3'h4 : _issue2_idx_T_10; // @[Mux.scala 47:70]
  wire [2:0] _issue2_idx_T_12 = _issue2_idx_T[3] ? 3'h3 : _issue2_idx_T_11; // @[Mux.scala 47:70]
  wire [2:0] _issue2_idx_T_13 = _issue2_idx_T[2] ? 3'h2 : _issue2_idx_T_12; // @[Mux.scala 47:70]
  wire [2:0] _issue2_idx_T_14 = _issue2_idx_T[1] ? 3'h1 : _issue2_idx_T_13; // @[Mux.scala 47:70]
  wire [2:0] issue2_idx = _issue2_idx_T[0] ? 3'h0 : _issue2_idx_T_14; // @[Mux.scala 47:70]
  wire  _issue_num_T = issue1_idx == 3'h7; // @[reservation_station.scala 88:21]
  wire  _issue_num_T_1 = issue2_idx == 3'h7; // @[reservation_station.scala 88:53]
  wire  _issue_num_T_2 = issue1_idx == 3'h7 & issue2_idx == 3'h7; // @[reservation_station.scala 88:40]
  wire  _issue_num_T_4 = issue2_idx != 3'h7; // @[reservation_station.scala 89:52]
  wire  _issue_num_T_6 = issue1_idx != 3'h7; // @[reservation_station.scala 89:84]
  wire  _issue_num_T_9 = _issue_num_T & issue2_idx != 3'h7 | issue1_idx != 3'h7 & _issue_num_T_1; // @[reservation_station.scala 89:70]
  wire  _issue_num_T_12 = _issue_num_T_6 & _issue_num_T_4; // @[reservation_station.scala 90:38]
  wire [1:0] _issue_num_T_13 = _issue_num_T_12 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _issue_num_T_14 = _issue_num_T_9 ? 2'h1 : _issue_num_T_13; // @[Mux.scala 101:16]
  wire [1:0] issue_num = _issue_num_T_2 ? 2'h0 : _issue_num_T_14; // @[Mux.scala 101:16]
  wire  _write_num_T = write_idx1 == 3'h7; // @[reservation_station.scala 99:21]
  wire  _write_num_T_1 = write_idx2 == 3'h7; // @[reservation_station.scala 99:51]
  wire [31:0] _io_o_issue_packs_0_T_8_pc = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_pc :
    reservation_station_0_io_o_uop_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_8_inst = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_inst :
    reservation_station_0_io_o_uop_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_8_func_code = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_func_code :
    reservation_station_0_io_o_uop_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_8_branch_predict_pack_valid = _issue1_func_code_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_valid : reservation_station_0_io_o_uop_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_8_branch_predict_pack_target = _issue1_func_code_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_target :
    reservation_station_0_io_o_uop_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_8_branch_predict_pack_branch_type = _issue1_func_code_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_branch_type :
    reservation_station_0_io_o_uop_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_8_branch_predict_pack_select = _issue1_func_code_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_select :
    reservation_station_0_io_o_uop_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_8_branch_predict_pack_taken = _issue1_func_code_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_taken : reservation_station_0_io_o_uop_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_8_phy_dst = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_phy_dst :
    reservation_station_0_io_o_uop_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_8_stale_dst = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_stale_dst :
    reservation_station_0_io_o_uop_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_8_arch_dst = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_arch_dst :
    reservation_station_0_io_o_uop_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_8_inst_type = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_inst_type :
    reservation_station_0_io_o_uop_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_8_regWen = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_regWen :
    reservation_station_0_io_o_uop_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_8_src1_valid = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_src1_valid :
    reservation_station_0_io_o_uop_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_8_phy_rs1 = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_phy_rs1 :
    reservation_station_0_io_o_uop_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_8_arch_rs1 = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_arch_rs1 :
    reservation_station_0_io_o_uop_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_8_src2_valid = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_src2_valid :
    reservation_station_0_io_o_uop_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_8_phy_rs2 = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_phy_rs2 :
    reservation_station_0_io_o_uop_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_8_arch_rs2 = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_arch_rs2 :
    reservation_station_0_io_o_uop_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_8_rob_idx = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_rob_idx :
    reservation_station_0_io_o_uop_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_8_imm = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_imm :
    reservation_station_0_io_o_uop_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_8_src1_value = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_src1_value :
    reservation_station_0_io_o_uop_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_8_src2_value = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_src2_value :
    reservation_station_0_io_o_uop_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_8_op1_sel = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_op1_sel :
    reservation_station_0_io_o_uop_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_8_op2_sel = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_op2_sel :
    reservation_station_0_io_o_uop_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_8_alu_sel = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_alu_sel :
    reservation_station_0_io_o_uop_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_8_branch_type = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_branch_type :
    reservation_station_0_io_o_uop_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_8_mem_type = _issue1_func_code_T_7 ? reservation_station_7_io_o_uop_mem_type :
    reservation_station_0_io_o_uop_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_9_pc = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_pc :
    _io_o_issue_packs_0_T_8_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_9_inst = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_inst :
    _io_o_issue_packs_0_T_8_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_9_func_code = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_func_code :
    _io_o_issue_packs_0_T_8_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_9_branch_predict_pack_valid = _issue1_func_code_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_8_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_9_branch_predict_pack_target = _issue1_func_code_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_8_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_9_branch_predict_pack_branch_type = _issue1_func_code_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_8_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_9_branch_predict_pack_select = _issue1_func_code_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_8_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_9_branch_predict_pack_taken = _issue1_func_code_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_8_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_9_phy_dst = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_8_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_9_stale_dst = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_8_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_9_arch_dst = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_8_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_9_inst_type = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_8_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_9_regWen = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_regWen :
    _io_o_issue_packs_0_T_8_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_9_src1_valid = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_8_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_9_phy_rs1 = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_8_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_9_arch_rs1 = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_8_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_9_src2_valid = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_8_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_9_phy_rs2 = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_8_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_9_arch_rs2 = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_8_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_9_rob_idx = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_8_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_9_imm = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_imm :
    _io_o_issue_packs_0_T_8_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_9_src1_value = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_8_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_9_src2_value = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_8_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_9_op1_sel = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_8_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_9_op2_sel = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_8_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_9_alu_sel = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_8_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_9_branch_type = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_branch_type :
    _io_o_issue_packs_0_T_8_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_9_mem_type = _issue1_func_code_T_6 ? reservation_station_6_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_8_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_10_pc = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_pc :
    _io_o_issue_packs_0_T_9_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_10_inst = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_inst :
    _io_o_issue_packs_0_T_9_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_10_func_code = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_func_code :
    _io_o_issue_packs_0_T_9_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_10_branch_predict_pack_valid = _issue1_func_code_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_9_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_10_branch_predict_pack_target = _issue1_func_code_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_9_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_10_branch_predict_pack_branch_type = _issue1_func_code_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_9_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_10_branch_predict_pack_select = _issue1_func_code_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_9_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_10_branch_predict_pack_taken = _issue1_func_code_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_9_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_10_phy_dst = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_9_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_10_stale_dst = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_9_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_10_arch_dst = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_9_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_10_inst_type = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_9_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_10_regWen = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_regWen :
    _io_o_issue_packs_0_T_9_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_10_src1_valid = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_9_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_10_phy_rs1 = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_9_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_10_arch_rs1 = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_9_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_10_src2_valid = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_9_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_10_phy_rs2 = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_9_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_10_arch_rs2 = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_9_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_10_rob_idx = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_9_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_10_imm = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_imm :
    _io_o_issue_packs_0_T_9_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_10_src1_value = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_9_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_10_src2_value = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_9_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_10_op1_sel = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_9_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_10_op2_sel = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_9_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_10_alu_sel = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_9_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_10_branch_type = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_branch_type
     : _io_o_issue_packs_0_T_9_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_10_mem_type = _issue1_func_code_T_5 ? reservation_station_5_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_9_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_11_pc = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_pc :
    _io_o_issue_packs_0_T_10_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_11_inst = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_inst :
    _io_o_issue_packs_0_T_10_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_11_func_code = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_func_code :
    _io_o_issue_packs_0_T_10_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_11_branch_predict_pack_valid = _issue1_func_code_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_10_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_11_branch_predict_pack_target = _issue1_func_code_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_10_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_11_branch_predict_pack_branch_type = _issue1_func_code_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_10_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_11_branch_predict_pack_select = _issue1_func_code_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_10_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_11_branch_predict_pack_taken = _issue1_func_code_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_10_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_11_phy_dst = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_10_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_11_stale_dst = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_10_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_11_arch_dst = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_10_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_11_inst_type = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_10_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_11_regWen = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_regWen :
    _io_o_issue_packs_0_T_10_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_11_src1_valid = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_10_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_11_phy_rs1 = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_10_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_11_arch_rs1 = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_10_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_11_src2_valid = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_10_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_11_phy_rs2 = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_10_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_11_arch_rs2 = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_10_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_11_rob_idx = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_10_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_11_imm = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_imm :
    _io_o_issue_packs_0_T_10_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_11_src1_value = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_10_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_11_src2_value = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_10_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_11_op1_sel = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_10_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_11_op2_sel = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_10_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_11_alu_sel = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_10_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_11_branch_type = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_branch_type
     : _io_o_issue_packs_0_T_10_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_11_mem_type = _issue1_func_code_T_4 ? reservation_station_4_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_10_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_12_pc = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_pc :
    _io_o_issue_packs_0_T_11_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_12_inst = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_inst :
    _io_o_issue_packs_0_T_11_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_12_func_code = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_func_code :
    _io_o_issue_packs_0_T_11_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_12_branch_predict_pack_valid = _issue1_func_code_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_11_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_12_branch_predict_pack_target = _issue1_func_code_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_11_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_12_branch_predict_pack_branch_type = _issue1_func_code_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_11_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_12_branch_predict_pack_select = _issue1_func_code_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_11_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_12_branch_predict_pack_taken = _issue1_func_code_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_11_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_12_phy_dst = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_11_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_12_stale_dst = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_11_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_12_arch_dst = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_11_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_12_inst_type = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_11_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_12_regWen = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_regWen :
    _io_o_issue_packs_0_T_11_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_12_src1_valid = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_11_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_12_phy_rs1 = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_11_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_12_arch_rs1 = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_11_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_12_src2_valid = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_11_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_12_phy_rs2 = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_11_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_12_arch_rs2 = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_11_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_12_rob_idx = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_11_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_12_imm = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_imm :
    _io_o_issue_packs_0_T_11_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_12_src1_value = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_11_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_12_src2_value = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_11_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_12_op1_sel = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_11_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_12_op2_sel = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_11_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_12_alu_sel = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_11_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_12_branch_type = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_branch_type
     : _io_o_issue_packs_0_T_11_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_12_mem_type = _issue1_func_code_T_3 ? reservation_station_3_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_11_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_13_pc = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_pc :
    _io_o_issue_packs_0_T_12_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_13_inst = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_inst :
    _io_o_issue_packs_0_T_12_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_13_func_code = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_func_code :
    _io_o_issue_packs_0_T_12_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_13_branch_predict_pack_valid = _issue1_func_code_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_12_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_13_branch_predict_pack_target = _issue1_func_code_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_12_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_13_branch_predict_pack_branch_type = _issue1_func_code_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_12_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_13_branch_predict_pack_select = _issue1_func_code_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_12_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_13_branch_predict_pack_taken = _issue1_func_code_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_12_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_13_phy_dst = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_12_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_13_stale_dst = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_12_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_13_arch_dst = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_12_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_13_inst_type = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_12_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_13_regWen = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_regWen :
    _io_o_issue_packs_0_T_12_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_13_src1_valid = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_12_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_13_phy_rs1 = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_12_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_13_arch_rs1 = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_12_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_13_src2_valid = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_12_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_13_phy_rs2 = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_12_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_13_arch_rs2 = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_12_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_13_rob_idx = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_12_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_13_imm = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_imm :
    _io_o_issue_packs_0_T_12_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_13_src1_value = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_12_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_13_src2_value = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_12_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_13_op1_sel = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_12_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_13_op2_sel = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_12_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_13_alu_sel = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_12_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_13_branch_type = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_branch_type
     : _io_o_issue_packs_0_T_12_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_13_mem_type = _issue1_func_code_T_2 ? reservation_station_2_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_12_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_14_pc = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_pc :
    _io_o_issue_packs_0_T_13_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_0_T_14_inst = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_inst :
    _io_o_issue_packs_0_T_13_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_14_func_code = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_func_code :
    _io_o_issue_packs_0_T_13_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_14_branch_predict_pack_valid = _issue1_func_code_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_13_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_14_branch_predict_pack_target = _issue1_func_code_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_13_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_14_branch_predict_pack_branch_type = _issue1_func_code_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_13_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_14_branch_predict_pack_select = _issue1_func_code_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_13_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_14_branch_predict_pack_taken = _issue1_func_code_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_13_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_14_phy_dst = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_13_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_14_stale_dst = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_13_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_14_arch_dst = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_13_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_14_inst_type = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_13_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_14_regWen = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_regWen :
    _io_o_issue_packs_0_T_13_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_14_src1_valid = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_13_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_14_phy_rs1 = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_13_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_14_arch_rs1 = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_13_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_0_T_14_src2_valid = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_13_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_0_T_14_phy_rs2 = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_13_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_14_arch_rs2 = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_13_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_14_rob_idx = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_13_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_14_imm = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_imm :
    _io_o_issue_packs_0_T_13_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_14_src1_value = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_13_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_0_T_14_src2_value = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_13_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_14_op1_sel = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_13_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_14_op2_sel = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_13_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_0_T_14_alu_sel = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_13_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_0_T_14_branch_type = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_branch_type
     : _io_o_issue_packs_0_T_13_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_0_T_14_mem_type = _issue1_func_code_T_1 ? reservation_station_1_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_13_mem_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T = 3'h0 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_1 = 3'h1 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_2 = 3'h2 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_3 = 3'h3 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_4 = 3'h4 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_5 = 3'h5 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_6 = 3'h6 == issue2_idx; // @[reservation_station.scala 108:103]
  wire  _io_o_issue_packs_1_T_7 = 3'h7 == issue2_idx; // @[reservation_station.scala 108:103]
  wire [31:0] _io_o_issue_packs_1_T_8_pc = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_pc :
    reservation_station_0_io_o_uop_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_8_inst = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_inst :
    reservation_station_0_io_o_uop_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_8_func_code = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_func_code :
    reservation_station_0_io_o_uop_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_8_branch_predict_pack_valid = _io_o_issue_packs_1_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_valid : reservation_station_0_io_o_uop_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_8_branch_predict_pack_target = _io_o_issue_packs_1_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_target :
    reservation_station_0_io_o_uop_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_8_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_branch_type :
    reservation_station_0_io_o_uop_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_8_branch_predict_pack_select = _io_o_issue_packs_1_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_select :
    reservation_station_0_io_o_uop_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_8_branch_predict_pack_taken = _io_o_issue_packs_1_T_7 ?
    reservation_station_7_io_o_uop_branch_predict_pack_taken : reservation_station_0_io_o_uop_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_8_phy_dst = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_phy_dst :
    reservation_station_0_io_o_uop_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_8_stale_dst = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_stale_dst :
    reservation_station_0_io_o_uop_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_8_arch_dst = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_arch_dst :
    reservation_station_0_io_o_uop_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_8_inst_type = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_inst_type :
    reservation_station_0_io_o_uop_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_8_regWen = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_regWen :
    reservation_station_0_io_o_uop_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_8_src1_valid = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_src1_valid :
    reservation_station_0_io_o_uop_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_8_phy_rs1 = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_phy_rs1 :
    reservation_station_0_io_o_uop_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_8_arch_rs1 = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_arch_rs1 :
    reservation_station_0_io_o_uop_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_8_src2_valid = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_src2_valid :
    reservation_station_0_io_o_uop_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_8_phy_rs2 = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_phy_rs2 :
    reservation_station_0_io_o_uop_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_8_arch_rs2 = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_arch_rs2 :
    reservation_station_0_io_o_uop_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_8_rob_idx = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_rob_idx :
    reservation_station_0_io_o_uop_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_8_imm = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_imm :
    reservation_station_0_io_o_uop_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_8_src1_value = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_src1_value
     : reservation_station_0_io_o_uop_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_8_src2_value = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_src2_value
     : reservation_station_0_io_o_uop_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_8_op1_sel = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_op1_sel :
    reservation_station_0_io_o_uop_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_8_op2_sel = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_op2_sel :
    reservation_station_0_io_o_uop_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_8_alu_sel = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_alu_sel :
    reservation_station_0_io_o_uop_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_8_branch_type = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_branch_type
     : reservation_station_0_io_o_uop_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_8_mem_type = _io_o_issue_packs_1_T_7 ? reservation_station_7_io_o_uop_mem_type :
    reservation_station_0_io_o_uop_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_9_pc = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_pc :
    _io_o_issue_packs_1_T_8_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_9_inst = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_inst :
    _io_o_issue_packs_1_T_8_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_9_func_code = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_func_code :
    _io_o_issue_packs_1_T_8_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_9_branch_predict_pack_valid = _io_o_issue_packs_1_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_8_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_9_branch_predict_pack_target = _io_o_issue_packs_1_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_8_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_9_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_8_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_9_branch_predict_pack_select = _io_o_issue_packs_1_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_8_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_9_branch_predict_pack_taken = _io_o_issue_packs_1_T_6 ?
    reservation_station_6_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_8_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_9_phy_dst = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_8_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_9_stale_dst = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_8_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_9_arch_dst = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_8_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_9_inst_type = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_8_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_9_regWen = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_regWen :
    _io_o_issue_packs_1_T_8_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_9_src1_valid = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_8_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_9_phy_rs1 = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_8_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_9_arch_rs1 = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_8_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_9_src2_valid = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_8_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_9_phy_rs2 = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_8_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_9_arch_rs2 = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_8_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_9_rob_idx = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_8_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_9_imm = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_imm :
    _io_o_issue_packs_1_T_8_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_9_src1_value = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_src1_value
     : _io_o_issue_packs_1_T_8_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_9_src2_value = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_src2_value
     : _io_o_issue_packs_1_T_8_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_9_op1_sel = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_8_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_9_op2_sel = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_8_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_9_alu_sel = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_8_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_9_branch_type = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_branch_type
     : _io_o_issue_packs_1_T_8_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_9_mem_type = _io_o_issue_packs_1_T_6 ? reservation_station_6_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_8_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_10_pc = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_pc :
    _io_o_issue_packs_1_T_9_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_10_inst = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_inst :
    _io_o_issue_packs_1_T_9_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_10_func_code = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_func_code :
    _io_o_issue_packs_1_T_9_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_10_branch_predict_pack_valid = _io_o_issue_packs_1_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_9_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_10_branch_predict_pack_target = _io_o_issue_packs_1_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_9_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_10_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_9_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_10_branch_predict_pack_select = _io_o_issue_packs_1_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_9_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_10_branch_predict_pack_taken = _io_o_issue_packs_1_T_5 ?
    reservation_station_5_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_9_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_10_phy_dst = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_9_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_10_stale_dst = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_9_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_10_arch_dst = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_9_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_10_inst_type = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_9_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_10_regWen = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_regWen :
    _io_o_issue_packs_1_T_9_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_10_src1_valid = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_9_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_10_phy_rs1 = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_9_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_10_arch_rs1 = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_9_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_10_src2_valid = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_9_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_10_phy_rs2 = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_9_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_10_arch_rs2 = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_9_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_10_rob_idx = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_9_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_10_imm = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_imm :
    _io_o_issue_packs_1_T_9_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_10_src1_value = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_src1_value
     : _io_o_issue_packs_1_T_9_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_10_src2_value = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_src2_value
     : _io_o_issue_packs_1_T_9_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_10_op1_sel = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_9_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_10_op2_sel = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_9_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_10_alu_sel = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_9_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_10_branch_type = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_branch_type
     : _io_o_issue_packs_1_T_9_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_10_mem_type = _io_o_issue_packs_1_T_5 ? reservation_station_5_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_9_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_11_pc = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_pc :
    _io_o_issue_packs_1_T_10_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_11_inst = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_inst :
    _io_o_issue_packs_1_T_10_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_11_func_code = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_func_code :
    _io_o_issue_packs_1_T_10_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_11_branch_predict_pack_valid = _io_o_issue_packs_1_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_10_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_11_branch_predict_pack_target = _io_o_issue_packs_1_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_10_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_11_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_10_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_11_branch_predict_pack_select = _io_o_issue_packs_1_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_10_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_11_branch_predict_pack_taken = _io_o_issue_packs_1_T_4 ?
    reservation_station_4_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_10_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_11_phy_dst = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_10_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_11_stale_dst = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_10_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_11_arch_dst = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_10_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_11_inst_type = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_10_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_11_regWen = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_regWen :
    _io_o_issue_packs_1_T_10_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_11_src1_valid = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_10_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_11_phy_rs1 = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_10_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_11_arch_rs1 = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_10_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_11_src2_valid = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_10_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_11_phy_rs2 = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_10_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_11_arch_rs2 = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_10_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_11_rob_idx = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_10_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_11_imm = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_imm :
    _io_o_issue_packs_1_T_10_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_11_src1_value = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_src1_value
     : _io_o_issue_packs_1_T_10_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_11_src2_value = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_src2_value
     : _io_o_issue_packs_1_T_10_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_11_op1_sel = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_10_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_11_op2_sel = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_10_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_11_alu_sel = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_10_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_11_branch_type = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_branch_type
     : _io_o_issue_packs_1_T_10_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_11_mem_type = _io_o_issue_packs_1_T_4 ? reservation_station_4_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_10_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_12_pc = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_pc :
    _io_o_issue_packs_1_T_11_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_12_inst = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_inst :
    _io_o_issue_packs_1_T_11_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_12_func_code = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_func_code :
    _io_o_issue_packs_1_T_11_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_12_branch_predict_pack_valid = _io_o_issue_packs_1_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_11_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_12_branch_predict_pack_target = _io_o_issue_packs_1_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_11_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_12_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_11_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_12_branch_predict_pack_select = _io_o_issue_packs_1_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_11_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_12_branch_predict_pack_taken = _io_o_issue_packs_1_T_3 ?
    reservation_station_3_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_11_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_12_phy_dst = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_11_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_12_stale_dst = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_11_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_12_arch_dst = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_11_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_12_inst_type = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_11_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_12_regWen = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_regWen :
    _io_o_issue_packs_1_T_11_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_12_src1_valid = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_11_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_12_phy_rs1 = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_11_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_12_arch_rs1 = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_11_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_12_src2_valid = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_11_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_12_phy_rs2 = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_11_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_12_arch_rs2 = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_11_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_12_rob_idx = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_11_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_12_imm = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_imm :
    _io_o_issue_packs_1_T_11_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_12_src1_value = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_src1_value
     : _io_o_issue_packs_1_T_11_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_12_src2_value = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_src2_value
     : _io_o_issue_packs_1_T_11_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_12_op1_sel = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_11_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_12_op2_sel = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_11_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_12_alu_sel = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_11_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_12_branch_type = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_branch_type
     : _io_o_issue_packs_1_T_11_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_12_mem_type = _io_o_issue_packs_1_T_3 ? reservation_station_3_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_11_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_13_pc = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_pc :
    _io_o_issue_packs_1_T_12_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_13_inst = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_inst :
    _io_o_issue_packs_1_T_12_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_13_func_code = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_func_code :
    _io_o_issue_packs_1_T_12_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_13_branch_predict_pack_valid = _io_o_issue_packs_1_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_12_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_13_branch_predict_pack_target = _io_o_issue_packs_1_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_12_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_13_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_12_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_13_branch_predict_pack_select = _io_o_issue_packs_1_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_12_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_13_branch_predict_pack_taken = _io_o_issue_packs_1_T_2 ?
    reservation_station_2_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_12_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_13_phy_dst = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_12_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_13_stale_dst = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_12_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_13_arch_dst = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_12_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_13_inst_type = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_12_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_13_regWen = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_regWen :
    _io_o_issue_packs_1_T_12_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_13_src1_valid = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_12_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_13_phy_rs1 = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_12_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_13_arch_rs1 = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_12_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_13_src2_valid = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_12_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_13_phy_rs2 = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_12_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_13_arch_rs2 = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_12_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_13_rob_idx = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_12_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_13_imm = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_imm :
    _io_o_issue_packs_1_T_12_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_13_src1_value = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_src1_value
     : _io_o_issue_packs_1_T_12_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_13_src2_value = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_src2_value
     : _io_o_issue_packs_1_T_12_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_13_op1_sel = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_12_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_13_op2_sel = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_12_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_13_alu_sel = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_12_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_13_branch_type = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_branch_type
     : _io_o_issue_packs_1_T_12_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_13_mem_type = _io_o_issue_packs_1_T_2 ? reservation_station_2_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_12_mem_type; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_14_pc = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_pc :
    _io_o_issue_packs_1_T_13_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_issue_packs_1_T_14_inst = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_inst :
    _io_o_issue_packs_1_T_13_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_14_func_code = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_func_code :
    _io_o_issue_packs_1_T_13_func_code; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_14_branch_predict_pack_valid = _io_o_issue_packs_1_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_13_branch_predict_pack_valid; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_14_branch_predict_pack_target = _io_o_issue_packs_1_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_13_branch_predict_pack_target; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_14_branch_predict_pack_branch_type = _io_o_issue_packs_1_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_13_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_14_branch_predict_pack_select = _io_o_issue_packs_1_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_13_branch_predict_pack_select; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_14_branch_predict_pack_taken = _io_o_issue_packs_1_T_1 ?
    reservation_station_1_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_13_branch_predict_pack_taken; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_14_phy_dst = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_13_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_14_stale_dst = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_13_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_14_arch_dst = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_13_arch_dst; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_14_inst_type = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_13_inst_type; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_14_regWen = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_regWen :
    _io_o_issue_packs_1_T_13_regWen; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_14_src1_valid = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_13_src1_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_14_phy_rs1 = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_13_phy_rs1; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_14_arch_rs1 = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_13_arch_rs1; // @[Mux.scala 101:16]
  wire  _io_o_issue_packs_1_T_14_src2_valid = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_13_src2_valid; // @[Mux.scala 101:16]
  wire [6:0] _io_o_issue_packs_1_T_14_phy_rs2 = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_13_phy_rs2; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_14_arch_rs2 = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_13_arch_rs2; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_14_rob_idx = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_13_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_14_imm = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_imm :
    _io_o_issue_packs_1_T_13_imm; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_14_src1_value = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_src1_value
     : _io_o_issue_packs_1_T_13_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_issue_packs_1_T_14_src2_value = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_src2_value
     : _io_o_issue_packs_1_T_13_src2_value; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_14_op1_sel = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_13_op1_sel; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_14_op2_sel = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_13_op2_sel; // @[Mux.scala 101:16]
  wire [4:0] _io_o_issue_packs_1_T_14_alu_sel = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_13_alu_sel; // @[Mux.scala 101:16]
  wire [3:0] _io_o_issue_packs_1_T_14_branch_type = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_branch_type
     : _io_o_issue_packs_1_T_13_branch_type; // @[Mux.scala 101:16]
  wire [2:0] _io_o_issue_packs_1_T_14_mem_type = _io_o_issue_packs_1_T_1 ? reservation_station_1_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_13_mem_type; // @[Mux.scala 101:16]
  wire  _reservation_station_0_io_i_write_slot_T = 3'h0 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_0_io_i_write_slot_T_2 = 3'h0 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_0_io_i_write_slot_T_5 = 3'h0 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_1_io_i_write_slot_T = 3'h1 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_1_io_i_write_slot_T_2 = 3'h1 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_1_io_i_write_slot_T_5 = 3'h1 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_2_io_i_write_slot_T = 3'h2 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_2_io_i_write_slot_T_2 = 3'h2 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_2_io_i_write_slot_T_5 = 3'h2 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_3_io_i_write_slot_T = 3'h3 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_3_io_i_write_slot_T_2 = 3'h3 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_3_io_i_write_slot_T_5 = 3'h3 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_4_io_i_write_slot_T = 3'h4 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_4_io_i_write_slot_T_2 = 3'h4 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_4_io_i_write_slot_T_5 = 3'h4 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_5_io_i_write_slot_T = 3'h5 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_5_io_i_write_slot_T_2 = 3'h5 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_5_io_i_write_slot_T_5 = 3'h5 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_6_io_i_write_slot_T = 3'h6 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_6_io_i_write_slot_T_2 = 3'h6 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_6_io_i_write_slot_T_5 = 3'h6 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  wire  _reservation_station_7_io_i_write_slot_T = 3'h7 == write_idx1; // @[reservation_station.scala 119:14]
  wire  _reservation_station_7_io_i_write_slot_T_2 = 3'h7 == write_idx1 & write_idx1 != 3'h7; // @[reservation_station.scala 119:29]
  wire  _reservation_station_7_io_i_write_slot_T_5 = 3'h7 == write_idx2 & write_idx2 != 3'h7; // @[reservation_station.scala 120:29]
  Reservation_Station_Slot reservation_station_0 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_0_clock),
    .reset(reservation_station_0_reset),
    .io_o_valid(reservation_station_0_io_o_valid),
    .io_o_ready_to_issue(reservation_station_0_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_0_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_0_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_0_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_0_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_0_io_i_exception),
    .io_i_write_slot(reservation_station_0_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_0_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_0_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_0_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_0_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_0_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_0_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_0_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_0_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_0_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_0_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_0_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_0_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_0_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_0_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_0_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_0_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_0_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_0_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_0_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_0_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_0_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_0_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_0_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_0_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_0_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_0_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_0_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_0_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_0_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_0_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_0_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_0_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_0_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_0_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_0_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_0_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_0_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_0_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_0_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_0_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_0_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_0_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_0_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_0_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_0_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_0_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_0_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_0_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_0_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_0_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_0_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_0_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_0_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_0_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_0_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_0_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_0_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_0_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_0_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_0_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_0_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_0_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_0_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_1 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_1_clock),
    .reset(reservation_station_1_reset),
    .io_o_valid(reservation_station_1_io_o_valid),
    .io_o_ready_to_issue(reservation_station_1_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_1_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_1_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_1_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_1_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_1_io_i_exception),
    .io_i_write_slot(reservation_station_1_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_1_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_1_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_1_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_1_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_1_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_1_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_1_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_1_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_1_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_1_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_1_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_1_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_1_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_1_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_1_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_1_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_1_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_1_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_1_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_1_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_1_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_1_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_1_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_1_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_1_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_1_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_1_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_1_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_1_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_1_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_1_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_1_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_1_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_1_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_1_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_1_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_1_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_1_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_1_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_1_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_1_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_1_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_1_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_1_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_1_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_1_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_1_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_1_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_1_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_1_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_1_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_1_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_1_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_1_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_1_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_1_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_1_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_1_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_1_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_1_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_1_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_1_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_1_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_2 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_2_clock),
    .reset(reservation_station_2_reset),
    .io_o_valid(reservation_station_2_io_o_valid),
    .io_o_ready_to_issue(reservation_station_2_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_2_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_2_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_2_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_2_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_2_io_i_exception),
    .io_i_write_slot(reservation_station_2_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_2_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_2_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_2_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_2_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_2_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_2_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_2_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_2_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_2_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_2_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_2_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_2_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_2_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_2_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_2_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_2_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_2_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_2_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_2_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_2_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_2_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_2_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_2_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_2_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_2_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_2_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_2_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_2_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_2_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_2_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_2_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_2_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_2_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_2_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_2_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_2_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_2_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_2_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_2_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_2_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_2_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_2_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_2_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_2_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_2_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_2_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_2_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_2_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_2_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_2_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_2_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_2_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_2_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_2_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_2_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_2_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_2_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_2_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_2_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_2_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_2_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_2_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_2_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_3 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_3_clock),
    .reset(reservation_station_3_reset),
    .io_o_valid(reservation_station_3_io_o_valid),
    .io_o_ready_to_issue(reservation_station_3_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_3_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_3_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_3_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_3_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_3_io_i_exception),
    .io_i_write_slot(reservation_station_3_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_3_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_3_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_3_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_3_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_3_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_3_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_3_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_3_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_3_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_3_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_3_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_3_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_3_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_3_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_3_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_3_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_3_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_3_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_3_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_3_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_3_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_3_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_3_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_3_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_3_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_3_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_3_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_3_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_3_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_3_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_3_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_3_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_3_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_3_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_3_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_3_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_3_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_3_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_3_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_3_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_3_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_3_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_3_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_3_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_3_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_3_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_3_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_3_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_3_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_3_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_3_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_3_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_3_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_3_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_3_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_3_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_3_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_3_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_3_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_3_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_3_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_3_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_3_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_4 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_4_clock),
    .reset(reservation_station_4_reset),
    .io_o_valid(reservation_station_4_io_o_valid),
    .io_o_ready_to_issue(reservation_station_4_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_4_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_4_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_4_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_4_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_4_io_i_exception),
    .io_i_write_slot(reservation_station_4_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_4_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_4_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_4_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_4_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_4_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_4_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_4_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_4_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_4_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_4_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_4_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_4_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_4_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_4_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_4_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_4_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_4_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_4_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_4_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_4_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_4_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_4_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_4_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_4_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_4_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_4_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_4_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_4_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_4_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_4_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_4_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_4_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_4_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_4_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_4_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_4_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_4_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_4_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_4_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_4_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_4_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_4_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_4_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_4_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_4_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_4_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_4_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_4_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_4_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_4_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_4_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_4_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_4_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_4_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_4_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_4_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_4_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_4_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_4_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_4_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_4_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_4_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_4_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_5 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_5_clock),
    .reset(reservation_station_5_reset),
    .io_o_valid(reservation_station_5_io_o_valid),
    .io_o_ready_to_issue(reservation_station_5_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_5_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_5_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_5_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_5_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_5_io_i_exception),
    .io_i_write_slot(reservation_station_5_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_5_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_5_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_5_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_5_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_5_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_5_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_5_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_5_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_5_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_5_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_5_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_5_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_5_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_5_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_5_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_5_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_5_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_5_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_5_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_5_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_5_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_5_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_5_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_5_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_5_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_5_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_5_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_5_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_5_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_5_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_5_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_5_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_5_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_5_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_5_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_5_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_5_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_5_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_5_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_5_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_5_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_5_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_5_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_5_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_5_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_5_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_5_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_5_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_5_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_5_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_5_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_5_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_5_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_5_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_5_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_5_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_5_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_5_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_5_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_5_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_5_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_5_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_5_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_6 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_6_clock),
    .reset(reservation_station_6_reset),
    .io_o_valid(reservation_station_6_io_o_valid),
    .io_o_ready_to_issue(reservation_station_6_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_6_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_6_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_6_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_6_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_6_io_i_exception),
    .io_i_write_slot(reservation_station_6_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_6_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_6_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_6_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_6_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_6_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_6_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_6_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_6_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_6_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_6_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_6_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_6_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_6_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_6_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_6_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_6_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_6_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_6_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_6_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_6_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_6_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_6_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_6_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_6_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_6_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_6_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_6_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_6_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_6_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_6_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_6_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_6_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_6_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_6_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_6_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_6_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_6_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_6_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_6_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_6_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_6_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_6_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_6_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_6_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_6_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_6_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_6_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_6_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_6_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_6_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_6_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_6_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_6_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_6_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_6_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_6_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_6_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_6_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_6_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_6_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_6_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_6_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_6_io_i_ROB_first_entry)
  );
  Reservation_Station_Slot reservation_station_7 ( // @[reservation_station.scala 39:56]
    .clock(reservation_station_7_clock),
    .reset(reservation_station_7_reset),
    .io_o_valid(reservation_station_7_io_o_valid),
    .io_o_ready_to_issue(reservation_station_7_io_o_ready_to_issue),
    .io_i_issue_granted(reservation_station_7_io_i_issue_granted),
    .io_i_branch_resolve_pack_valid(reservation_station_7_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(reservation_station_7_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_rob_idx(reservation_station_7_io_i_branch_resolve_pack_rob_idx),
    .io_i_exception(reservation_station_7_io_i_exception),
    .io_i_write_slot(reservation_station_7_io_i_write_slot),
    .io_i_wakeup_port(reservation_station_7_io_i_wakeup_port),
    .io_i_uop_valid(reservation_station_7_io_i_uop_valid),
    .io_i_uop_pc(reservation_station_7_io_i_uop_pc),
    .io_i_uop_inst(reservation_station_7_io_i_uop_inst),
    .io_i_uop_func_code(reservation_station_7_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(reservation_station_7_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(reservation_station_7_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_branch_type(reservation_station_7_io_i_uop_branch_predict_pack_branch_type),
    .io_i_uop_branch_predict_pack_select(reservation_station_7_io_i_uop_branch_predict_pack_select),
    .io_i_uop_branch_predict_pack_taken(reservation_station_7_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(reservation_station_7_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(reservation_station_7_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(reservation_station_7_io_i_uop_arch_dst),
    .io_i_uop_inst_type(reservation_station_7_io_i_uop_inst_type),
    .io_i_uop_regWen(reservation_station_7_io_i_uop_regWen),
    .io_i_uop_src1_valid(reservation_station_7_io_i_uop_src1_valid),
    .io_i_uop_phy_rs1(reservation_station_7_io_i_uop_phy_rs1),
    .io_i_uop_arch_rs1(reservation_station_7_io_i_uop_arch_rs1),
    .io_i_uop_src2_valid(reservation_station_7_io_i_uop_src2_valid),
    .io_i_uop_phy_rs2(reservation_station_7_io_i_uop_phy_rs2),
    .io_i_uop_arch_rs2(reservation_station_7_io_i_uop_arch_rs2),
    .io_i_uop_rob_idx(reservation_station_7_io_i_uop_rob_idx),
    .io_i_uop_imm(reservation_station_7_io_i_uop_imm),
    .io_i_uop_src1_value(reservation_station_7_io_i_uop_src1_value),
    .io_i_uop_src2_value(reservation_station_7_io_i_uop_src2_value),
    .io_i_uop_op1_sel(reservation_station_7_io_i_uop_op1_sel),
    .io_i_uop_op2_sel(reservation_station_7_io_i_uop_op2_sel),
    .io_i_uop_alu_sel(reservation_station_7_io_i_uop_alu_sel),
    .io_i_uop_branch_type(reservation_station_7_io_i_uop_branch_type),
    .io_i_uop_mem_type(reservation_station_7_io_i_uop_mem_type),
    .io_o_uop_pc(reservation_station_7_io_o_uop_pc),
    .io_o_uop_inst(reservation_station_7_io_o_uop_inst),
    .io_o_uop_func_code(reservation_station_7_io_o_uop_func_code),
    .io_o_uop_branch_predict_pack_valid(reservation_station_7_io_o_uop_branch_predict_pack_valid),
    .io_o_uop_branch_predict_pack_target(reservation_station_7_io_o_uop_branch_predict_pack_target),
    .io_o_uop_branch_predict_pack_branch_type(reservation_station_7_io_o_uop_branch_predict_pack_branch_type),
    .io_o_uop_branch_predict_pack_select(reservation_station_7_io_o_uop_branch_predict_pack_select),
    .io_o_uop_branch_predict_pack_taken(reservation_station_7_io_o_uop_branch_predict_pack_taken),
    .io_o_uop_phy_dst(reservation_station_7_io_o_uop_phy_dst),
    .io_o_uop_stale_dst(reservation_station_7_io_o_uop_stale_dst),
    .io_o_uop_arch_dst(reservation_station_7_io_o_uop_arch_dst),
    .io_o_uop_inst_type(reservation_station_7_io_o_uop_inst_type),
    .io_o_uop_regWen(reservation_station_7_io_o_uop_regWen),
    .io_o_uop_src1_valid(reservation_station_7_io_o_uop_src1_valid),
    .io_o_uop_phy_rs1(reservation_station_7_io_o_uop_phy_rs1),
    .io_o_uop_arch_rs1(reservation_station_7_io_o_uop_arch_rs1),
    .io_o_uop_src2_valid(reservation_station_7_io_o_uop_src2_valid),
    .io_o_uop_phy_rs2(reservation_station_7_io_o_uop_phy_rs2),
    .io_o_uop_arch_rs2(reservation_station_7_io_o_uop_arch_rs2),
    .io_o_uop_rob_idx(reservation_station_7_io_o_uop_rob_idx),
    .io_o_uop_imm(reservation_station_7_io_o_uop_imm),
    .io_o_uop_src1_value(reservation_station_7_io_o_uop_src1_value),
    .io_o_uop_src2_value(reservation_station_7_io_o_uop_src2_value),
    .io_o_uop_op1_sel(reservation_station_7_io_o_uop_op1_sel),
    .io_o_uop_op2_sel(reservation_station_7_io_o_uop_op2_sel),
    .io_o_uop_alu_sel(reservation_station_7_io_o_uop_alu_sel),
    .io_o_uop_branch_type(reservation_station_7_io_o_uop_branch_type),
    .io_o_uop_mem_type(reservation_station_7_io_o_uop_mem_type),
    .io_i_exe_dst1(reservation_station_7_io_i_exe_dst1),
    .io_i_exe_dst2(reservation_station_7_io_i_exe_dst2),
    .io_i_exe_value1(reservation_station_7_io_i_exe_value1),
    .io_i_exe_value2(reservation_station_7_io_i_exe_value2),
    .io_i_ROB_first_entry(reservation_station_7_io_i_ROB_first_entry)
  );
  assign io_o_issue_packs_0_valid = issue_num == 2'h1 | issue_num == 2'h2; // @[reservation_station.scala 94:38]
  assign io_o_issue_packs_0_pc = _issue1_func_code_T ? reservation_station_0_io_o_uop_pc : _io_o_issue_packs_0_T_14_pc; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_inst = _issue1_func_code_T ? reservation_station_0_io_o_uop_inst :
    _io_o_issue_packs_0_T_14_inst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_func_code = _issue1_func_code_T ? reservation_station_0_io_o_uop_func_code :
    _io_o_issue_packs_0_T_14_func_code; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_branch_predict_pack_valid = _issue1_func_code_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_0_T_14_branch_predict_pack_valid; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_branch_predict_pack_target = _issue1_func_code_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_0_T_14_branch_predict_pack_target; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_branch_predict_pack_branch_type = _issue1_func_code_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_0_T_14_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_branch_predict_pack_select = _issue1_func_code_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_0_T_14_branch_predict_pack_select; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_branch_predict_pack_taken = _issue1_func_code_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_0_T_14_branch_predict_pack_taken; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_phy_dst = _issue1_func_code_T ? reservation_station_0_io_o_uop_phy_dst :
    _io_o_issue_packs_0_T_14_phy_dst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_stale_dst = _issue1_func_code_T ? reservation_station_0_io_o_uop_stale_dst :
    _io_o_issue_packs_0_T_14_stale_dst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_arch_dst = _issue1_func_code_T ? reservation_station_0_io_o_uop_arch_dst :
    _io_o_issue_packs_0_T_14_arch_dst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_inst_type = _issue1_func_code_T ? reservation_station_0_io_o_uop_inst_type :
    _io_o_issue_packs_0_T_14_inst_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_regWen = _issue1_func_code_T ? reservation_station_0_io_o_uop_regWen :
    _io_o_issue_packs_0_T_14_regWen; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_src1_valid = _issue1_func_code_T ? reservation_station_0_io_o_uop_src1_valid :
    _io_o_issue_packs_0_T_14_src1_valid; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_phy_rs1 = _issue1_func_code_T ? reservation_station_0_io_o_uop_phy_rs1 :
    _io_o_issue_packs_0_T_14_phy_rs1; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_arch_rs1 = _issue1_func_code_T ? reservation_station_0_io_o_uop_arch_rs1 :
    _io_o_issue_packs_0_T_14_arch_rs1; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_src2_valid = _issue1_func_code_T ? reservation_station_0_io_o_uop_src2_valid :
    _io_o_issue_packs_0_T_14_src2_valid; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_phy_rs2 = _issue1_func_code_T ? reservation_station_0_io_o_uop_phy_rs2 :
    _io_o_issue_packs_0_T_14_phy_rs2; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_arch_rs2 = _issue1_func_code_T ? reservation_station_0_io_o_uop_arch_rs2 :
    _io_o_issue_packs_0_T_14_arch_rs2; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_rob_idx = _issue1_func_code_T ? reservation_station_0_io_o_uop_rob_idx :
    _io_o_issue_packs_0_T_14_rob_idx; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_imm = _issue1_func_code_T ? reservation_station_0_io_o_uop_imm :
    _io_o_issue_packs_0_T_14_imm; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_src1_value = _issue1_func_code_T ? reservation_station_0_io_o_uop_src1_value :
    _io_o_issue_packs_0_T_14_src1_value; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_src2_value = _issue1_func_code_T ? reservation_station_0_io_o_uop_src2_value :
    _io_o_issue_packs_0_T_14_src2_value; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_op1_sel = _issue1_func_code_T ? reservation_station_0_io_o_uop_op1_sel :
    _io_o_issue_packs_0_T_14_op1_sel; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_op2_sel = _issue1_func_code_T ? reservation_station_0_io_o_uop_op2_sel :
    _io_o_issue_packs_0_T_14_op2_sel; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_alu_sel = _issue1_func_code_T ? reservation_station_0_io_o_uop_alu_sel :
    _io_o_issue_packs_0_T_14_alu_sel; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_branch_type = _issue1_func_code_T ? reservation_station_0_io_o_uop_branch_type :
    _io_o_issue_packs_0_T_14_branch_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_0_mem_type = _issue1_func_code_T ? reservation_station_0_io_o_uop_mem_type :
    _io_o_issue_packs_0_T_14_mem_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_valid = issue_num == 2'h2; // @[reservation_station.scala 95:31]
  assign io_o_issue_packs_1_pc = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_pc : _io_o_issue_packs_1_T_14_pc
    ; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_inst = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_inst :
    _io_o_issue_packs_1_T_14_inst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_func_code = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_func_code :
    _io_o_issue_packs_1_T_14_func_code; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_branch_predict_pack_valid = _io_o_issue_packs_1_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_valid : _io_o_issue_packs_1_T_14_branch_predict_pack_valid; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_branch_predict_pack_target = _io_o_issue_packs_1_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_target : _io_o_issue_packs_1_T_14_branch_predict_pack_target; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_branch_predict_pack_branch_type = _io_o_issue_packs_1_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_branch_type :
    _io_o_issue_packs_1_T_14_branch_predict_pack_branch_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_branch_predict_pack_select = _io_o_issue_packs_1_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_select : _io_o_issue_packs_1_T_14_branch_predict_pack_select; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_branch_predict_pack_taken = _io_o_issue_packs_1_T ?
    reservation_station_0_io_o_uop_branch_predict_pack_taken : _io_o_issue_packs_1_T_14_branch_predict_pack_taken; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_phy_dst = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_phy_dst :
    _io_o_issue_packs_1_T_14_phy_dst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_stale_dst = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_stale_dst :
    _io_o_issue_packs_1_T_14_stale_dst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_arch_dst = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_arch_dst :
    _io_o_issue_packs_1_T_14_arch_dst; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_inst_type = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_inst_type :
    _io_o_issue_packs_1_T_14_inst_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_regWen = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_regWen :
    _io_o_issue_packs_1_T_14_regWen; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_src1_valid = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_src1_valid :
    _io_o_issue_packs_1_T_14_src1_valid; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_phy_rs1 = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_phy_rs1 :
    _io_o_issue_packs_1_T_14_phy_rs1; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_arch_rs1 = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_arch_rs1 :
    _io_o_issue_packs_1_T_14_arch_rs1; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_src2_valid = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_src2_valid :
    _io_o_issue_packs_1_T_14_src2_valid; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_phy_rs2 = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_phy_rs2 :
    _io_o_issue_packs_1_T_14_phy_rs2; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_arch_rs2 = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_arch_rs2 :
    _io_o_issue_packs_1_T_14_arch_rs2; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_rob_idx = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_rob_idx :
    _io_o_issue_packs_1_T_14_rob_idx; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_imm = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_imm :
    _io_o_issue_packs_1_T_14_imm; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_src1_value = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_src1_value :
    _io_o_issue_packs_1_T_14_src1_value; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_src2_value = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_src2_value :
    _io_o_issue_packs_1_T_14_src2_value; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_op1_sel = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_op1_sel :
    _io_o_issue_packs_1_T_14_op1_sel; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_op2_sel = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_op2_sel :
    _io_o_issue_packs_1_T_14_op2_sel; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_alu_sel = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_alu_sel :
    _io_o_issue_packs_1_T_14_alu_sel; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_branch_type = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_branch_type :
    _io_o_issue_packs_1_T_14_branch_type; // @[Mux.scala 101:16]
  assign io_o_issue_packs_1_mem_type = _io_o_issue_packs_1_T ? reservation_station_0_io_o_uop_mem_type :
    _io_o_issue_packs_1_T_14_mem_type; // @[Mux.scala 101:16]
  assign io_o_full = _write_num_T | _write_num_T_1; // @[reservation_station.scala 105:47]
  assign reservation_station_0_clock = clock;
  assign reservation_station_0_reset = reset;
  assign reservation_station_0_io_i_issue_granted = (_issue1_func_code_T | _io_o_issue_packs_1_T) & ~(io_i_exception |
    io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_0_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_0_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_0_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_0_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_0_io_i_write_slot = _reservation_station_0_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_0_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_0_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_0_io_i_uop_valid = _reservation_station_0_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_pc = _reservation_station_0_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_inst = _reservation_station_0_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_func_code = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_branch_predict_pack_valid = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_branch_predict_pack_target = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_branch_predict_pack_branch_type = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_branch_predict_pack_select = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_branch_predict_pack_taken = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_phy_dst = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_stale_dst = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_arch_dst = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_inst_type = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_regWen = _reservation_station_0_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_src1_valid = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_phy_rs1 = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_arch_rs1 = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_src2_valid = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_phy_rs2 = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_arch_rs2 = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_rob_idx = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_imm = _reservation_station_0_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_src1_value = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_src2_value = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_op1_sel = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_op2_sel = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_alu_sel = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_branch_type = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_uop_mem_type = _reservation_station_0_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_0_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_0_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_0_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_0_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_0_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_1_clock = clock;
  assign reservation_station_1_reset = reset;
  assign reservation_station_1_io_i_issue_granted = (_issue1_func_code_T_1 | _io_o_issue_packs_1_T_1) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_1_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_1_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_1_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_1_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_1_io_i_write_slot = _reservation_station_1_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_1_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_1_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_1_io_i_uop_valid = _reservation_station_1_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_pc = _reservation_station_1_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_inst = _reservation_station_1_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_func_code = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_branch_predict_pack_valid = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_branch_predict_pack_target = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_branch_predict_pack_branch_type = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_branch_predict_pack_select = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_branch_predict_pack_taken = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_phy_dst = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_stale_dst = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_arch_dst = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_inst_type = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_regWen = _reservation_station_1_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_src1_valid = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_phy_rs1 = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_arch_rs1 = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_src2_valid = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_phy_rs2 = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_arch_rs2 = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_rob_idx = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_imm = _reservation_station_1_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_src1_value = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_src2_value = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_op1_sel = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_op2_sel = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_alu_sel = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_branch_type = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_uop_mem_type = _reservation_station_1_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_1_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_1_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_1_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_1_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_1_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_2_clock = clock;
  assign reservation_station_2_reset = reset;
  assign reservation_station_2_io_i_issue_granted = (_issue1_func_code_T_2 | _io_o_issue_packs_1_T_2) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_2_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_2_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_2_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_2_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_2_io_i_write_slot = _reservation_station_2_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_2_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_2_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_2_io_i_uop_valid = _reservation_station_2_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_pc = _reservation_station_2_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_inst = _reservation_station_2_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_func_code = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_branch_predict_pack_valid = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_branch_predict_pack_target = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_branch_predict_pack_branch_type = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_branch_predict_pack_select = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_branch_predict_pack_taken = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_phy_dst = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_stale_dst = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_arch_dst = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_inst_type = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_regWen = _reservation_station_2_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_src1_valid = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_phy_rs1 = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_arch_rs1 = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_src2_valid = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_phy_rs2 = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_arch_rs2 = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_rob_idx = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_imm = _reservation_station_2_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_src1_value = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_src2_value = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_op1_sel = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_op2_sel = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_alu_sel = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_branch_type = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_uop_mem_type = _reservation_station_2_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_2_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_2_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_2_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_2_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_2_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_3_clock = clock;
  assign reservation_station_3_reset = reset;
  assign reservation_station_3_io_i_issue_granted = (_issue1_func_code_T_3 | _io_o_issue_packs_1_T_3) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_3_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_3_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_3_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_3_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_3_io_i_write_slot = _reservation_station_3_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_3_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_3_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_3_io_i_uop_valid = _reservation_station_3_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_pc = _reservation_station_3_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_inst = _reservation_station_3_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_func_code = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_branch_predict_pack_valid = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_branch_predict_pack_target = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_branch_predict_pack_branch_type = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_branch_predict_pack_select = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_branch_predict_pack_taken = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_phy_dst = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_stale_dst = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_arch_dst = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_inst_type = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_regWen = _reservation_station_3_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_src1_valid = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_phy_rs1 = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_arch_rs1 = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_src2_valid = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_phy_rs2 = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_arch_rs2 = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_rob_idx = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_imm = _reservation_station_3_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_src1_value = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_src2_value = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_op1_sel = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_op2_sel = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_alu_sel = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_branch_type = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_uop_mem_type = _reservation_station_3_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_3_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_3_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_3_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_3_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_3_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_4_clock = clock;
  assign reservation_station_4_reset = reset;
  assign reservation_station_4_io_i_issue_granted = (_issue1_func_code_T_4 | _io_o_issue_packs_1_T_4) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_4_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_4_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_4_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_4_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_4_io_i_write_slot = _reservation_station_4_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_4_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_4_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_4_io_i_uop_valid = _reservation_station_4_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_pc = _reservation_station_4_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_inst = _reservation_station_4_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_func_code = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_branch_predict_pack_valid = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_branch_predict_pack_target = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_branch_predict_pack_branch_type = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_branch_predict_pack_select = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_branch_predict_pack_taken = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_phy_dst = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_stale_dst = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_arch_dst = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_inst_type = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_regWen = _reservation_station_4_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_src1_valid = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_phy_rs1 = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_arch_rs1 = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_src2_valid = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_phy_rs2 = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_arch_rs2 = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_rob_idx = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_imm = _reservation_station_4_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_src1_value = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_src2_value = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_op1_sel = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_op2_sel = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_alu_sel = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_branch_type = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_uop_mem_type = _reservation_station_4_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_4_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_4_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_4_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_4_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_4_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_5_clock = clock;
  assign reservation_station_5_reset = reset;
  assign reservation_station_5_io_i_issue_granted = (_issue1_func_code_T_5 | _io_o_issue_packs_1_T_5) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_5_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_5_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_5_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_5_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_5_io_i_write_slot = _reservation_station_5_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_5_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_5_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_5_io_i_uop_valid = _reservation_station_5_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_pc = _reservation_station_5_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_inst = _reservation_station_5_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_func_code = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_branch_predict_pack_valid = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_branch_predict_pack_target = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_branch_predict_pack_branch_type = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_branch_predict_pack_select = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_branch_predict_pack_taken = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_phy_dst = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_stale_dst = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_arch_dst = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_inst_type = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_regWen = _reservation_station_5_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_src1_valid = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_phy_rs1 = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_arch_rs1 = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_src2_valid = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_phy_rs2 = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_arch_rs2 = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_rob_idx = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_imm = _reservation_station_5_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_src1_value = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_src2_value = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_op1_sel = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_op2_sel = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_alu_sel = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_branch_type = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_uop_mem_type = _reservation_station_5_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_5_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_5_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_5_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_5_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_5_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_6_clock = clock;
  assign reservation_station_6_reset = reset;
  assign reservation_station_6_io_i_issue_granted = (_issue1_func_code_T_6 | _io_o_issue_packs_1_T_6) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_6_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_6_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_6_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_6_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_6_io_i_write_slot = _reservation_station_6_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_6_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_6_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_6_io_i_uop_valid = _reservation_station_6_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_pc = _reservation_station_6_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_inst = _reservation_station_6_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_func_code = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_branch_predict_pack_valid = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_branch_predict_pack_target = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_branch_predict_pack_branch_type = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_branch_predict_pack_select = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_branch_predict_pack_taken = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_phy_dst = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_stale_dst = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_arch_dst = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_inst_type = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_regWen = _reservation_station_6_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_src1_valid = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_phy_rs1 = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_arch_rs1 = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_src2_valid = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_phy_rs2 = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_arch_rs2 = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_rob_idx = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_imm = _reservation_station_6_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_src1_value = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_src2_value = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_op1_sel = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_op2_sel = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_alu_sel = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_branch_type = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_uop_mem_type = _reservation_station_6_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_6_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_6_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_6_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_6_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_6_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
  assign reservation_station_7_clock = clock;
  assign reservation_station_7_reset = reset;
  assign reservation_station_7_io_i_issue_granted = (_issue1_func_code_T_7 | _io_o_issue_packs_1_T_7) & ~(io_i_exception
     | io_i_rollback_valid); // @[reservation_station.scala 113:94]
  assign reservation_station_7_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[reservation_station.scala 114:54]
  assign reservation_station_7_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[reservation_station.scala 114:54]
  assign reservation_station_7_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[reservation_station.scala 114:54]
  assign reservation_station_7_io_i_exception = io_i_exception; // @[reservation_station.scala 115:44]
  assign reservation_station_7_io_i_write_slot = _reservation_station_7_io_i_write_slot_T_2 ?
    io_i_dispatch_packs_0_valid : _reservation_station_7_io_i_write_slot_T_5 & io_i_dispatch_packs_1_valid; // @[Mux.scala 101:16]
  assign reservation_station_7_io_i_wakeup_port = io_i_wakeup_port; // @[reservation_station.scala 116:46]
  assign reservation_station_7_io_i_uop_valid = _reservation_station_7_io_i_write_slot_T ? io_i_dispatch_packs_0_valid
     : io_i_dispatch_packs_1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_pc = _reservation_station_7_io_i_write_slot_T ? io_i_dispatch_packs_0_pc :
    io_i_dispatch_packs_1_pc; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_inst = _reservation_station_7_io_i_write_slot_T ? io_i_dispatch_packs_0_inst :
    io_i_dispatch_packs_1_inst; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_func_code = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_func_code : io_i_dispatch_packs_1_func_code; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_branch_predict_pack_valid = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_valid : io_i_dispatch_packs_1_branch_predict_pack_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_branch_predict_pack_target = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_target : io_i_dispatch_packs_1_branch_predict_pack_target; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_branch_predict_pack_branch_type = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_branch_type : io_i_dispatch_packs_1_branch_predict_pack_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_branch_predict_pack_select = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_select : io_i_dispatch_packs_1_branch_predict_pack_select; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_branch_predict_pack_taken = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_predict_pack_taken : io_i_dispatch_packs_1_branch_predict_pack_taken; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_phy_dst = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_dst : io_i_dispatch_packs_1_phy_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_stale_dst = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_stale_dst : io_i_dispatch_packs_1_stale_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_arch_dst = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_dst : io_i_dispatch_packs_1_arch_dst; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_inst_type = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_inst_type : io_i_dispatch_packs_1_inst_type; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_regWen = _reservation_station_7_io_i_write_slot_T ? io_i_dispatch_packs_0_regWen
     : io_i_dispatch_packs_1_regWen; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_src1_valid = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_valid : io_i_dispatch_packs_1_src1_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_phy_rs1 = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs1 : io_i_dispatch_packs_1_phy_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_arch_rs1 = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs1 : io_i_dispatch_packs_1_arch_rs1; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_src2_valid = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_valid : io_i_dispatch_packs_1_src2_valid; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_phy_rs2 = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_phy_rs2 : io_i_dispatch_packs_1_phy_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_arch_rs2 = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_arch_rs2 : io_i_dispatch_packs_1_arch_rs2; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_rob_idx = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_rob_idx : io_i_dispatch_packs_1_rob_idx; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_imm = _reservation_station_7_io_i_write_slot_T ? io_i_dispatch_packs_0_imm :
    io_i_dispatch_packs_1_imm; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_src1_value = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src1_value : io_i_dispatch_packs_1_src1_value; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_src2_value = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_src2_value : io_i_dispatch_packs_1_src2_value; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_op1_sel = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op1_sel : io_i_dispatch_packs_1_op1_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_op2_sel = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_op2_sel : io_i_dispatch_packs_1_op2_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_alu_sel = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_alu_sel : io_i_dispatch_packs_1_alu_sel; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_branch_type = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_branch_type : io_i_dispatch_packs_1_branch_type; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_uop_mem_type = _reservation_station_7_io_i_write_slot_T ?
    io_i_dispatch_packs_0_mem_type : io_i_dispatch_packs_1_mem_type; // @[reservation_station.scala 124:44]
  assign reservation_station_7_io_i_exe_dst1 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_0_uop_phy_dst : 7'h0; // @[reservation_station.scala 127:49]
  assign reservation_station_7_io_i_exe_dst2 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_func_code != 7'h20 ?
    io_i_ex_res_packs_1_uop_phy_dst : 7'h0; // @[reservation_station.scala 128:49]
  assign reservation_station_7_io_i_exe_value1 = io_i_ex_res_packs_0_uop_dst_value; // @[reservation_station.scala 130:45]
  assign reservation_station_7_io_i_exe_value2 = io_i_ex_res_packs_1_uop_dst_value; // @[reservation_station.scala 131:45]
  assign reservation_station_7_io_i_ROB_first_entry = io_i_ROB_first_entry; // @[reservation_station.scala 133:50]
endmodule
