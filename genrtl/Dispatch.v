module Dispatch(
  input         clock,
  input         reset,
  input         io_i_rename_packs_0_valid,
  input  [31:0] io_i_rename_packs_0_pc,
  input  [31:0] io_i_rename_packs_0_inst,
  input  [6:0]  io_i_rename_packs_0_func_code,
  input         io_i_rename_packs_0_branch_predict_pack_valid,
  input  [63:0] io_i_rename_packs_0_branch_predict_pack_target,
  input         io_i_rename_packs_0_branch_predict_pack_taken,
  input  [6:0]  io_i_rename_packs_0_phy_dst,
  input  [6:0]  io_i_rename_packs_0_stale_dst,
  input  [4:0]  io_i_rename_packs_0_arch_dst,
  input         io_i_rename_packs_0_src1_valid,
  input  [6:0]  io_i_rename_packs_0_phy_rs1,
  input         io_i_rename_packs_0_src2_valid,
  input  [6:0]  io_i_rename_packs_0_phy_rs2,
  input  [63:0] io_i_rename_packs_0_imm,
  input  [63:0] io_i_rename_packs_0_src1_value,
  input  [63:0] io_i_rename_packs_0_src2_value,
  input  [2:0]  io_i_rename_packs_0_op1_sel,
  input  [2:0]  io_i_rename_packs_0_op2_sel,
  input  [4:0]  io_i_rename_packs_0_alu_sel,
  input  [2:0]  io_i_rename_packs_0_branch_type,
  input  [1:0]  io_i_rename_packs_0_mem_type,
  input         io_i_rename_packs_1_valid,
  input  [31:0] io_i_rename_packs_1_pc,
  input  [31:0] io_i_rename_packs_1_inst,
  input  [6:0]  io_i_rename_packs_1_func_code,
  input         io_i_rename_packs_1_branch_predict_pack_valid,
  input  [63:0] io_i_rename_packs_1_branch_predict_pack_target,
  input         io_i_rename_packs_1_branch_predict_pack_taken,
  input  [6:0]  io_i_rename_packs_1_phy_dst,
  input  [6:0]  io_i_rename_packs_1_stale_dst,
  input  [4:0]  io_i_rename_packs_1_arch_dst,
  input         io_i_rename_packs_1_src1_valid,
  input  [6:0]  io_i_rename_packs_1_phy_rs1,
  input         io_i_rename_packs_1_src2_valid,
  input  [6:0]  io_i_rename_packs_1_phy_rs2,
  input  [63:0] io_i_rename_packs_1_imm,
  input  [63:0] io_i_rename_packs_1_src1_value,
  input  [63:0] io_i_rename_packs_1_src2_value,
  input  [2:0]  io_i_rename_packs_1_op1_sel,
  input  [2:0]  io_i_rename_packs_1_op2_sel,
  input  [4:0]  io_i_rename_packs_1_alu_sel,
  input  [2:0]  io_i_rename_packs_1_branch_type,
  input  [1:0]  io_i_rename_packs_1_mem_type,
  input  [6:0]  io_i_rob_allocation_ress_0_rob_idx,
  input  [6:0]  io_i_rob_allocation_ress_1_rob_idx,
  input         io_i_reservation_station_full,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  output        io_o_rob_allocation_reqs_0_valid,
  output [31:0] io_o_rob_allocation_reqs_0_uop_pc,
  output [31:0] io_o_rob_allocation_reqs_0_uop_inst,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_func_code,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_phy_dst,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_stale_dst,
  output [4:0]  io_o_rob_allocation_reqs_0_uop_arch_dst,
  output [63:0] io_o_rob_allocation_reqs_0_uop_src1_value,
  output [4:0]  io_o_rob_allocation_reqs_0_uop_alu_sel,
  output        io_o_rob_allocation_reqs_1_valid,
  output [31:0] io_o_rob_allocation_reqs_1_uop_pc,
  output [31:0] io_o_rob_allocation_reqs_1_uop_inst,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_func_code,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_phy_dst,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_stale_dst,
  output [4:0]  io_o_rob_allocation_reqs_1_uop_arch_dst,
  output [63:0] io_o_rob_allocation_reqs_1_uop_src1_value,
  output [4:0]  io_o_rob_allocation_reqs_1_uop_alu_sel,
  output        io_o_dispatch_packs_0_valid,
  output [31:0] io_o_dispatch_packs_0_pc,
  output [31:0] io_o_dispatch_packs_0_inst,
  output [6:0]  io_o_dispatch_packs_0_func_code,
  output        io_o_dispatch_packs_0_branch_predict_pack_valid,
  output [63:0] io_o_dispatch_packs_0_branch_predict_pack_target,
  output        io_o_dispatch_packs_0_branch_predict_pack_taken,
  output [6:0]  io_o_dispatch_packs_0_phy_dst,
  output [6:0]  io_o_dispatch_packs_0_stale_dst,
  output [4:0]  io_o_dispatch_packs_0_arch_dst,
  output        io_o_dispatch_packs_0_src1_valid,
  output [6:0]  io_o_dispatch_packs_0_phy_rs1,
  output        io_o_dispatch_packs_0_src2_valid,
  output [6:0]  io_o_dispatch_packs_0_phy_rs2,
  output [6:0]  io_o_dispatch_packs_0_rob_idx,
  output [63:0] io_o_dispatch_packs_0_imm,
  output [63:0] io_o_dispatch_packs_0_src1_value,
  output [63:0] io_o_dispatch_packs_0_src2_value,
  output [2:0]  io_o_dispatch_packs_0_op1_sel,
  output [2:0]  io_o_dispatch_packs_0_op2_sel,
  output [4:0]  io_o_dispatch_packs_0_alu_sel,
  output [2:0]  io_o_dispatch_packs_0_branch_type,
  output [1:0]  io_o_dispatch_packs_0_mem_type,
  output        io_o_dispatch_packs_1_valid,
  output [31:0] io_o_dispatch_packs_1_pc,
  output [31:0] io_o_dispatch_packs_1_inst,
  output [6:0]  io_o_dispatch_packs_1_func_code,
  output        io_o_dispatch_packs_1_branch_predict_pack_valid,
  output [63:0] io_o_dispatch_packs_1_branch_predict_pack_target,
  output        io_o_dispatch_packs_1_branch_predict_pack_taken,
  output [6:0]  io_o_dispatch_packs_1_phy_dst,
  output [6:0]  io_o_dispatch_packs_1_stale_dst,
  output [4:0]  io_o_dispatch_packs_1_arch_dst,
  output        io_o_dispatch_packs_1_src1_valid,
  output [6:0]  io_o_dispatch_packs_1_phy_rs1,
  output        io_o_dispatch_packs_1_src2_valid,
  output [6:0]  io_o_dispatch_packs_1_phy_rs2,
  output [6:0]  io_o_dispatch_packs_1_rob_idx,
  output [63:0] io_o_dispatch_packs_1_imm,
  output [63:0] io_o_dispatch_packs_1_src1_value,
  output [63:0] io_o_dispatch_packs_1_src2_value,
  output [2:0]  io_o_dispatch_packs_1_op1_sel,
  output [2:0]  io_o_dispatch_packs_1_op2_sel,
  output [4:0]  io_o_dispatch_packs_1_alu_sel,
  output [2:0]  io_o_dispatch_packs_1_branch_type,
  output [1:0]  io_o_dispatch_packs_1_mem_type,
  input         io_i_exception
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
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
`endif // RANDOMIZE_REG_INIT
  reg  uops_0_valid; // @[dispatch.scala 31:21]
  reg [31:0] uops_0_pc; // @[dispatch.scala 31:21]
  reg [31:0] uops_0_inst; // @[dispatch.scala 31:21]
  reg [6:0] uops_0_func_code; // @[dispatch.scala 31:21]
  reg  uops_0_branch_predict_pack_valid; // @[dispatch.scala 31:21]
  reg [63:0] uops_0_branch_predict_pack_target; // @[dispatch.scala 31:21]
  reg  uops_0_branch_predict_pack_taken; // @[dispatch.scala 31:21]
  reg [6:0] uops_0_phy_dst; // @[dispatch.scala 31:21]
  reg [6:0] uops_0_stale_dst; // @[dispatch.scala 31:21]
  reg [4:0] uops_0_arch_dst; // @[dispatch.scala 31:21]
  reg  uops_0_src1_valid; // @[dispatch.scala 31:21]
  reg [6:0] uops_0_phy_rs1; // @[dispatch.scala 31:21]
  reg  uops_0_src2_valid; // @[dispatch.scala 31:21]
  reg [6:0] uops_0_phy_rs2; // @[dispatch.scala 31:21]
  reg [63:0] uops_0_imm; // @[dispatch.scala 31:21]
  reg [63:0] uops_0_src1_value; // @[dispatch.scala 31:21]
  reg [63:0] uops_0_src2_value; // @[dispatch.scala 31:21]
  reg [2:0] uops_0_op1_sel; // @[dispatch.scala 31:21]
  reg [2:0] uops_0_op2_sel; // @[dispatch.scala 31:21]
  reg [4:0] uops_0_alu_sel; // @[dispatch.scala 31:21]
  reg [2:0] uops_0_branch_type; // @[dispatch.scala 31:21]
  reg [1:0] uops_0_mem_type; // @[dispatch.scala 31:21]
  reg  uops_1_valid; // @[dispatch.scala 31:21]
  reg [31:0] uops_1_pc; // @[dispatch.scala 31:21]
  reg [31:0] uops_1_inst; // @[dispatch.scala 31:21]
  reg [6:0] uops_1_func_code; // @[dispatch.scala 31:21]
  reg  uops_1_branch_predict_pack_valid; // @[dispatch.scala 31:21]
  reg [63:0] uops_1_branch_predict_pack_target; // @[dispatch.scala 31:21]
  reg  uops_1_branch_predict_pack_taken; // @[dispatch.scala 31:21]
  reg [6:0] uops_1_phy_dst; // @[dispatch.scala 31:21]
  reg [6:0] uops_1_stale_dst; // @[dispatch.scala 31:21]
  reg [4:0] uops_1_arch_dst; // @[dispatch.scala 31:21]
  reg  uops_1_src1_valid; // @[dispatch.scala 31:21]
  reg [6:0] uops_1_phy_rs1; // @[dispatch.scala 31:21]
  reg  uops_1_src2_valid; // @[dispatch.scala 31:21]
  reg [6:0] uops_1_phy_rs2; // @[dispatch.scala 31:21]
  reg [63:0] uops_1_imm; // @[dispatch.scala 31:21]
  reg [63:0] uops_1_src1_value; // @[dispatch.scala 31:21]
  reg [63:0] uops_1_src2_value; // @[dispatch.scala 31:21]
  reg [2:0] uops_1_op1_sel; // @[dispatch.scala 31:21]
  reg [2:0] uops_1_op2_sel; // @[dispatch.scala 31:21]
  reg [4:0] uops_1_alu_sel; // @[dispatch.scala 31:21]
  reg [2:0] uops_1_branch_type; // @[dispatch.scala 31:21]
  reg [1:0] uops_1_mem_type; // @[dispatch.scala 31:21]
  wire  _io_o_rob_allocation_reqs_0_valid_T = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred; // @[dispatch.scala 38:109]
  wire  _io_o_rob_allocation_reqs_0_valid_T_1 = io_i_reservation_station_full | io_i_branch_resolve_pack_valid &
    io_i_branch_resolve_pack_mispred; // @[dispatch.scala 38:74]
  assign io_o_rob_allocation_reqs_0_valid = io_i_reservation_station_full | io_i_branch_resolve_pack_valid &
    io_i_branch_resolve_pack_mispred ? 1'h0 : uops_0_valid; // @[dispatch.scala 38:43]
  assign io_o_rob_allocation_reqs_0_uop_pc = uops_0_pc; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_inst = uops_0_inst; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_func_code = uops_0_func_code; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_phy_dst = uops_0_phy_dst; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_stale_dst = uops_0_stale_dst; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_arch_dst = uops_0_arch_dst; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_src1_value = uops_0_src1_value; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_0_uop_alu_sel = uops_0_alu_sel; // @[dispatch.scala 41:37]
  assign io_o_rob_allocation_reqs_1_valid = _io_o_rob_allocation_reqs_0_valid_T_1 ? 1'h0 : uops_1_valid; // @[dispatch.scala 39:43]
  assign io_o_rob_allocation_reqs_1_uop_pc = uops_1_pc; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_inst = uops_1_inst; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_func_code = uops_1_func_code; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_phy_dst = uops_1_phy_dst; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_stale_dst = uops_1_stale_dst; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_arch_dst = uops_1_arch_dst; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_src1_value = uops_1_src1_value; // @[dispatch.scala 42:37]
  assign io_o_rob_allocation_reqs_1_uop_alu_sel = uops_1_alu_sel; // @[dispatch.scala 42:37]
  assign io_o_dispatch_packs_0_valid = _io_o_rob_allocation_reqs_0_valid_T | io_i_reservation_station_full ? 1'h0 :
    uops_0_valid; // @[dispatch.scala 44:28 46:84 47:37]
  assign io_o_dispatch_packs_0_pc = uops_0_pc; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_inst = uops_0_inst; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_func_code = uops_0_func_code; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_valid = uops_0_branch_predict_pack_valid; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_target = uops_0_branch_predict_pack_target; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_taken = uops_0_branch_predict_pack_taken; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_phy_dst = uops_0_phy_dst; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_stale_dst = uops_0_stale_dst; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_arch_dst = uops_0_arch_dst; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_src1_valid = uops_0_src1_valid; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_phy_rs1 = uops_0_phy_rs1; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_src2_valid = uops_0_src2_valid; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_phy_rs2 = uops_0_phy_rs2; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_rob_idx = io_i_rob_allocation_ress_0_rob_idx; // @[dispatch.scala 50:35]
  assign io_o_dispatch_packs_0_imm = uops_0_imm; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_src1_value = uops_0_src1_value; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_src2_value = uops_0_src2_value; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_op1_sel = uops_0_op1_sel; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_op2_sel = uops_0_op2_sel; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_alu_sel = uops_0_alu_sel; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_branch_type = uops_0_branch_type; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_0_mem_type = uops_0_mem_type; // @[dispatch.scala 44:28]
  assign io_o_dispatch_packs_1_valid = _io_o_rob_allocation_reqs_0_valid_T | io_i_reservation_station_full ? 1'h0 :
    uops_1_valid; // @[dispatch.scala 45:28 46:84 48:37]
  assign io_o_dispatch_packs_1_pc = uops_1_pc; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_inst = uops_1_inst; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_func_code = uops_1_func_code; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_valid = uops_1_branch_predict_pack_valid; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_target = uops_1_branch_predict_pack_target; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_taken = uops_1_branch_predict_pack_taken; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_phy_dst = uops_1_phy_dst; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_stale_dst = uops_1_stale_dst; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_arch_dst = uops_1_arch_dst; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_src1_valid = uops_1_src1_valid; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_phy_rs1 = uops_1_phy_rs1; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_src2_valid = uops_1_src2_valid; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_phy_rs2 = uops_1_phy_rs2; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_rob_idx = io_i_rob_allocation_ress_1_rob_idx; // @[dispatch.scala 51:35]
  assign io_o_dispatch_packs_1_imm = uops_1_imm; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_src1_value = uops_1_src1_value; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_src2_value = uops_1_src2_value; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_op1_sel = uops_1_op1_sel; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_op2_sel = uops_1_op2_sel; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_alu_sel = uops_1_alu_sel; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_branch_type = uops_1_branch_type; // @[dispatch.scala 45:28]
  assign io_o_dispatch_packs_1_mem_type = uops_1_mem_type; // @[dispatch.scala 45:28]
  always @(posedge clock) begin
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (io_i_exception) begin // @[dispatch.scala 33:25]
      uops_0_valid <= 1'h0; // @[dispatch.scala 34:22]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_valid <= io_i_rename_packs_0_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_pc <= 32'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_pc <= io_i_rename_packs_0_pc;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_inst <= 32'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_inst <= io_i_rename_packs_0_inst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_func_code <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_func_code <= io_i_rename_packs_0_func_code;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_branch_predict_pack_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_branch_predict_pack_valid <= io_i_rename_packs_0_branch_predict_pack_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_branch_predict_pack_target <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_branch_predict_pack_target <= io_i_rename_packs_0_branch_predict_pack_target;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_branch_predict_pack_taken <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_branch_predict_pack_taken <= io_i_rename_packs_0_branch_predict_pack_taken;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_phy_dst <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_phy_dst <= io_i_rename_packs_0_phy_dst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_stale_dst <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_stale_dst <= io_i_rename_packs_0_stale_dst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_arch_dst <= 5'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_arch_dst <= io_i_rename_packs_0_arch_dst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_src1_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_src1_valid <= io_i_rename_packs_0_src1_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_phy_rs1 <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_phy_rs1 <= io_i_rename_packs_0_phy_rs1;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_src2_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_src2_valid <= io_i_rename_packs_0_src2_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_phy_rs2 <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_phy_rs2 <= io_i_rename_packs_0_phy_rs2;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_imm <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_imm <= io_i_rename_packs_0_imm;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_src1_value <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_src1_value <= io_i_rename_packs_0_src1_value;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_src2_value <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_src2_value <= io_i_rename_packs_0_src2_value;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_op1_sel <= 3'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_op1_sel <= io_i_rename_packs_0_op1_sel;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_op2_sel <= 3'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_op2_sel <= io_i_rename_packs_0_op2_sel;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_alu_sel <= 5'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_alu_sel <= io_i_rename_packs_0_alu_sel;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_branch_type <= 3'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_branch_type <= io_i_rename_packs_0_branch_type;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_0_mem_type <= 2'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_0_mem_type <= io_i_rename_packs_0_mem_type;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (io_i_exception) begin // @[dispatch.scala 33:25]
      uops_1_valid <= 1'h0; // @[dispatch.scala 35:22]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_valid <= io_i_rename_packs_1_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_pc <= 32'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_pc <= io_i_rename_packs_1_pc;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_inst <= 32'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_inst <= io_i_rename_packs_1_inst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_func_code <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_func_code <= io_i_rename_packs_1_func_code;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_branch_predict_pack_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_branch_predict_pack_valid <= io_i_rename_packs_1_branch_predict_pack_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_branch_predict_pack_target <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_branch_predict_pack_target <= io_i_rename_packs_1_branch_predict_pack_target;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_branch_predict_pack_taken <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_branch_predict_pack_taken <= io_i_rename_packs_1_branch_predict_pack_taken;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_phy_dst <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_phy_dst <= io_i_rename_packs_1_phy_dst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_stale_dst <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_stale_dst <= io_i_rename_packs_1_stale_dst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_arch_dst <= 5'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_arch_dst <= io_i_rename_packs_1_arch_dst;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_src1_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_src1_valid <= io_i_rename_packs_1_src1_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_phy_rs1 <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_phy_rs1 <= io_i_rename_packs_1_phy_rs1;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_src2_valid <= 1'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_src2_valid <= io_i_rename_packs_1_src2_valid;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_phy_rs2 <= 7'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_phy_rs2 <= io_i_rename_packs_1_phy_rs2;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_imm <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_imm <= io_i_rename_packs_1_imm;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_src1_value <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_src1_value <= io_i_rename_packs_1_src1_value;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_src2_value <= 64'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_src2_value <= io_i_rename_packs_1_src2_value;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_op1_sel <= 3'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_op1_sel <= io_i_rename_packs_1_op1_sel;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_op2_sel <= 3'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_op2_sel <= io_i_rename_packs_1_op2_sel;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_alu_sel <= 5'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_alu_sel <= io_i_rename_packs_1_alu_sel;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_branch_type <= 3'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_branch_type <= io_i_rename_packs_1_branch_type;
    end
    if (reset) begin // @[dispatch.scala 31:21]
      uops_1_mem_type <= 2'h0; // @[dispatch.scala 31:21]
    end else if (!(io_i_reservation_station_full)) begin // @[dispatch.scala 32:14]
      uops_1_mem_type <= io_i_rename_packs_1_mem_type;
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
  uops_0_phy_dst = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  uops_0_stale_dst = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_arch_dst = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  uops_0_src1_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_phy_rs1 = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  uops_0_src2_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  uops_0_phy_rs2 = _RAND_13[6:0];
  _RAND_14 = {2{`RANDOM}};
  uops_0_imm = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  uops_0_src1_value = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  uops_0_src2_value = _RAND_16[63:0];
  _RAND_17 = {1{`RANDOM}};
  uops_0_op1_sel = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  uops_0_op2_sel = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  uops_0_alu_sel = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  uops_0_branch_type = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  uops_0_mem_type = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  uops_1_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uops_1_pc = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  uops_1_inst = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  uops_1_func_code = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  uops_1_branch_predict_pack_valid = _RAND_26[0:0];
  _RAND_27 = {2{`RANDOM}};
  uops_1_branch_predict_pack_target = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  uops_1_branch_predict_pack_taken = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uops_1_phy_dst = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  uops_1_stale_dst = _RAND_30[6:0];
  _RAND_31 = {1{`RANDOM}};
  uops_1_arch_dst = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  uops_1_src1_valid = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  uops_1_phy_rs1 = _RAND_33[6:0];
  _RAND_34 = {1{`RANDOM}};
  uops_1_src2_valid = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  uops_1_phy_rs2 = _RAND_35[6:0];
  _RAND_36 = {2{`RANDOM}};
  uops_1_imm = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  uops_1_src1_value = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  uops_1_src2_value = _RAND_38[63:0];
  _RAND_39 = {1{`RANDOM}};
  uops_1_op1_sel = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  uops_1_op2_sel = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  uops_1_alu_sel = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  uops_1_branch_type = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  uops_1_mem_type = _RAND_43[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
