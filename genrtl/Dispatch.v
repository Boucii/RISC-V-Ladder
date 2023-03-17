module Dispatch(
  input         clock,
  input         reset,
  input         io_i_rename_packs_0_valid,
  input  [31:0] io_i_rename_packs_0_pc,
  input  [31:0] io_i_rename_packs_0_inst,
  input  [6:0]  io_i_rename_packs_0_func_code,
  input         io_i_rename_packs_0_branch_predict_pack_valid,
  input  [63:0] io_i_rename_packs_0_branch_predict_pack_target,
  input  [3:0]  io_i_rename_packs_0_branch_predict_pack_branch_type,
  input         io_i_rename_packs_0_branch_predict_pack_select,
  input         io_i_rename_packs_0_branch_predict_pack_taken,
  input  [6:0]  io_i_rename_packs_0_phy_dst,
  input  [6:0]  io_i_rename_packs_0_stale_dst,
  input  [4:0]  io_i_rename_packs_0_arch_dst,
  input  [2:0]  io_i_rename_packs_0_inst_type,
  input         io_i_rename_packs_0_regWen,
  input         io_i_rename_packs_0_src1_valid,
  input  [6:0]  io_i_rename_packs_0_phy_rs1,
  input  [4:0]  io_i_rename_packs_0_arch_rs1,
  input         io_i_rename_packs_0_src2_valid,
  input  [6:0]  io_i_rename_packs_0_phy_rs2,
  input  [4:0]  io_i_rename_packs_0_arch_rs2,
  input  [63:0] io_i_rename_packs_0_imm,
  input  [63:0] io_i_rename_packs_0_src1_value,
  input  [63:0] io_i_rename_packs_0_src2_value,
  input  [2:0]  io_i_rename_packs_0_op1_sel,
  input  [2:0]  io_i_rename_packs_0_op2_sel,
  input  [4:0]  io_i_rename_packs_0_alu_sel,
  input  [3:0]  io_i_rename_packs_0_branch_type,
  input  [1:0]  io_i_rename_packs_0_mem_type,
  input         io_i_rename_packs_1_valid,
  input  [31:0] io_i_rename_packs_1_pc,
  input  [31:0] io_i_rename_packs_1_inst,
  input  [6:0]  io_i_rename_packs_1_func_code,
  input         io_i_rename_packs_1_branch_predict_pack_valid,
  input  [63:0] io_i_rename_packs_1_branch_predict_pack_target,
  input  [3:0]  io_i_rename_packs_1_branch_predict_pack_branch_type,
  input         io_i_rename_packs_1_branch_predict_pack_select,
  input         io_i_rename_packs_1_branch_predict_pack_taken,
  input  [6:0]  io_i_rename_packs_1_phy_dst,
  input  [6:0]  io_i_rename_packs_1_stale_dst,
  input  [4:0]  io_i_rename_packs_1_arch_dst,
  input  [2:0]  io_i_rename_packs_1_inst_type,
  input         io_i_rename_packs_1_regWen,
  input         io_i_rename_packs_1_src1_valid,
  input  [6:0]  io_i_rename_packs_1_phy_rs1,
  input  [4:0]  io_i_rename_packs_1_arch_rs1,
  input         io_i_rename_packs_1_src2_valid,
  input  [6:0]  io_i_rename_packs_1_phy_rs2,
  input  [4:0]  io_i_rename_packs_1_arch_rs2,
  input  [63:0] io_i_rename_packs_1_imm,
  input  [63:0] io_i_rename_packs_1_src1_value,
  input  [63:0] io_i_rename_packs_1_src2_value,
  input  [2:0]  io_i_rename_packs_1_op1_sel,
  input  [2:0]  io_i_rename_packs_1_op2_sel,
  input  [4:0]  io_i_rename_packs_1_alu_sel,
  input  [3:0]  io_i_rename_packs_1_branch_type,
  input  [1:0]  io_i_rename_packs_1_mem_type,
  input         io_i_rob_busy,
  input  [5:0]  io_i_rob_allocation_ress_0_rob_idx,
  input  [5:0]  io_i_rob_allocation_ress_1_rob_idx,
  input         io_i_reservation_station_full,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  output        io_o_rob_allocation_reqs_0_valid,
  output        io_o_rob_allocation_reqs_0_uop_valid,
  output [31:0] io_o_rob_allocation_reqs_0_uop_pc,
  output [31:0] io_o_rob_allocation_reqs_0_uop_inst,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_func_code,
  output        io_o_rob_allocation_reqs_0_uop_branch_predict_pack_valid,
  output [63:0] io_o_rob_allocation_reqs_0_uop_branch_predict_pack_target,
  output [3:0]  io_o_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type,
  output        io_o_rob_allocation_reqs_0_uop_branch_predict_pack_select,
  output        io_o_rob_allocation_reqs_0_uop_branch_predict_pack_taken,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_phy_dst,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_stale_dst,
  output [4:0]  io_o_rob_allocation_reqs_0_uop_arch_dst,
  output [2:0]  io_o_rob_allocation_reqs_0_uop_inst_type,
  output        io_o_rob_allocation_reqs_0_uop_regWen,
  output        io_o_rob_allocation_reqs_0_uop_src1_valid,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_phy_rs1,
  output [4:0]  io_o_rob_allocation_reqs_0_uop_arch_rs1,
  output        io_o_rob_allocation_reqs_0_uop_src2_valid,
  output [6:0]  io_o_rob_allocation_reqs_0_uop_phy_rs2,
  output [4:0]  io_o_rob_allocation_reqs_0_uop_arch_rs2,
  output [63:0] io_o_rob_allocation_reqs_0_uop_imm,
  output [63:0] io_o_rob_allocation_reqs_0_uop_src1_value,
  output [63:0] io_o_rob_allocation_reqs_0_uop_src2_value,
  output [2:0]  io_o_rob_allocation_reqs_0_uop_op1_sel,
  output [2:0]  io_o_rob_allocation_reqs_0_uop_op2_sel,
  output [4:0]  io_o_rob_allocation_reqs_0_uop_alu_sel,
  output [3:0]  io_o_rob_allocation_reqs_0_uop_branch_type,
  output [1:0]  io_o_rob_allocation_reqs_0_uop_mem_type,
  output        io_o_rob_allocation_reqs_1_valid,
  output        io_o_rob_allocation_reqs_1_uop_valid,
  output [31:0] io_o_rob_allocation_reqs_1_uop_pc,
  output [31:0] io_o_rob_allocation_reqs_1_uop_inst,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_func_code,
  output        io_o_rob_allocation_reqs_1_uop_branch_predict_pack_valid,
  output [63:0] io_o_rob_allocation_reqs_1_uop_branch_predict_pack_target,
  output [3:0]  io_o_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type,
  output        io_o_rob_allocation_reqs_1_uop_branch_predict_pack_select,
  output        io_o_rob_allocation_reqs_1_uop_branch_predict_pack_taken,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_phy_dst,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_stale_dst,
  output [4:0]  io_o_rob_allocation_reqs_1_uop_arch_dst,
  output [2:0]  io_o_rob_allocation_reqs_1_uop_inst_type,
  output        io_o_rob_allocation_reqs_1_uop_regWen,
  output        io_o_rob_allocation_reqs_1_uop_src1_valid,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_phy_rs1,
  output [4:0]  io_o_rob_allocation_reqs_1_uop_arch_rs1,
  output        io_o_rob_allocation_reqs_1_uop_src2_valid,
  output [6:0]  io_o_rob_allocation_reqs_1_uop_phy_rs2,
  output [4:0]  io_o_rob_allocation_reqs_1_uop_arch_rs2,
  output [63:0] io_o_rob_allocation_reqs_1_uop_imm,
  output [63:0] io_o_rob_allocation_reqs_1_uop_src1_value,
  output [63:0] io_o_rob_allocation_reqs_1_uop_src2_value,
  output [2:0]  io_o_rob_allocation_reqs_1_uop_op1_sel,
  output [2:0]  io_o_rob_allocation_reqs_1_uop_op2_sel,
  output [4:0]  io_o_rob_allocation_reqs_1_uop_alu_sel,
  output [3:0]  io_o_rob_allocation_reqs_1_uop_branch_type,
  output [1:0]  io_o_rob_allocation_reqs_1_uop_mem_type,
  output        io_o_dispatch_packs_0_valid,
  output [31:0] io_o_dispatch_packs_0_pc,
  output [31:0] io_o_dispatch_packs_0_inst,
  output [6:0]  io_o_dispatch_packs_0_func_code,
  output        io_o_dispatch_packs_0_branch_predict_pack_valid,
  output [63:0] io_o_dispatch_packs_0_branch_predict_pack_target,
  output [3:0]  io_o_dispatch_packs_0_branch_predict_pack_branch_type,
  output        io_o_dispatch_packs_0_branch_predict_pack_select,
  output        io_o_dispatch_packs_0_branch_predict_pack_taken,
  output [6:0]  io_o_dispatch_packs_0_phy_dst,
  output [6:0]  io_o_dispatch_packs_0_stale_dst,
  output [4:0]  io_o_dispatch_packs_0_arch_dst,
  output [2:0]  io_o_dispatch_packs_0_inst_type,
  output        io_o_dispatch_packs_0_regWen,
  output        io_o_dispatch_packs_0_src1_valid,
  output [6:0]  io_o_dispatch_packs_0_phy_rs1,
  output [4:0]  io_o_dispatch_packs_0_arch_rs1,
  output        io_o_dispatch_packs_0_src2_valid,
  output [6:0]  io_o_dispatch_packs_0_phy_rs2,
  output [4:0]  io_o_dispatch_packs_0_arch_rs2,
  output [5:0]  io_o_dispatch_packs_0_rob_idx,
  output [63:0] io_o_dispatch_packs_0_imm,
  output [63:0] io_o_dispatch_packs_0_src1_value,
  output [63:0] io_o_dispatch_packs_0_src2_value,
  output [2:0]  io_o_dispatch_packs_0_op1_sel,
  output [2:0]  io_o_dispatch_packs_0_op2_sel,
  output [4:0]  io_o_dispatch_packs_0_alu_sel,
  output [3:0]  io_o_dispatch_packs_0_branch_type,
  output [1:0]  io_o_dispatch_packs_0_mem_type,
  output        io_o_dispatch_packs_1_valid,
  output [31:0] io_o_dispatch_packs_1_pc,
  output [31:0] io_o_dispatch_packs_1_inst,
  output [6:0]  io_o_dispatch_packs_1_func_code,
  output        io_o_dispatch_packs_1_branch_predict_pack_valid,
  output [63:0] io_o_dispatch_packs_1_branch_predict_pack_target,
  output [3:0]  io_o_dispatch_packs_1_branch_predict_pack_branch_type,
  output        io_o_dispatch_packs_1_branch_predict_pack_select,
  output        io_o_dispatch_packs_1_branch_predict_pack_taken,
  output [6:0]  io_o_dispatch_packs_1_phy_dst,
  output [6:0]  io_o_dispatch_packs_1_stale_dst,
  output [4:0]  io_o_dispatch_packs_1_arch_dst,
  output [2:0]  io_o_dispatch_packs_1_inst_type,
  output        io_o_dispatch_packs_1_regWen,
  output        io_o_dispatch_packs_1_src1_valid,
  output [6:0]  io_o_dispatch_packs_1_phy_rs1,
  output [4:0]  io_o_dispatch_packs_1_arch_rs1,
  output        io_o_dispatch_packs_1_src2_valid,
  output [6:0]  io_o_dispatch_packs_1_phy_rs2,
  output [4:0]  io_o_dispatch_packs_1_arch_rs2,
  output [5:0]  io_o_dispatch_packs_1_rob_idx,
  output [63:0] io_o_dispatch_packs_1_imm,
  output [63:0] io_o_dispatch_packs_1_src1_value,
  output [63:0] io_o_dispatch_packs_1_src2_value,
  output [2:0]  io_o_dispatch_packs_1_op1_sel,
  output [2:0]  io_o_dispatch_packs_1_op2_sel,
  output [4:0]  io_o_dispatch_packs_1_alu_sel,
  output [3:0]  io_o_dispatch_packs_1_branch_type,
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
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
`endif // RANDOMIZE_REG_INIT
  wire  stall = io_i_reservation_station_full | io_i_rob_busy; // @[dispatch.scala 31:47]
  reg  uops_0_valid; // @[dispatch.scala 33:21]
  reg [31:0] uops_0_pc; // @[dispatch.scala 33:21]
  reg [31:0] uops_0_inst; // @[dispatch.scala 33:21]
  reg [6:0] uops_0_func_code; // @[dispatch.scala 33:21]
  reg  uops_0_branch_predict_pack_valid; // @[dispatch.scala 33:21]
  reg [63:0] uops_0_branch_predict_pack_target; // @[dispatch.scala 33:21]
  reg [3:0] uops_0_branch_predict_pack_branch_type; // @[dispatch.scala 33:21]
  reg  uops_0_branch_predict_pack_select; // @[dispatch.scala 33:21]
  reg  uops_0_branch_predict_pack_taken; // @[dispatch.scala 33:21]
  reg [6:0] uops_0_phy_dst; // @[dispatch.scala 33:21]
  reg [6:0] uops_0_stale_dst; // @[dispatch.scala 33:21]
  reg [4:0] uops_0_arch_dst; // @[dispatch.scala 33:21]
  reg [2:0] uops_0_inst_type; // @[dispatch.scala 33:21]
  reg  uops_0_regWen; // @[dispatch.scala 33:21]
  reg  uops_0_src1_valid; // @[dispatch.scala 33:21]
  reg [6:0] uops_0_phy_rs1; // @[dispatch.scala 33:21]
  reg [4:0] uops_0_arch_rs1; // @[dispatch.scala 33:21]
  reg  uops_0_src2_valid; // @[dispatch.scala 33:21]
  reg [6:0] uops_0_phy_rs2; // @[dispatch.scala 33:21]
  reg [4:0] uops_0_arch_rs2; // @[dispatch.scala 33:21]
  reg [63:0] uops_0_imm; // @[dispatch.scala 33:21]
  reg [63:0] uops_0_src1_value; // @[dispatch.scala 33:21]
  reg [63:0] uops_0_src2_value; // @[dispatch.scala 33:21]
  reg [2:0] uops_0_op1_sel; // @[dispatch.scala 33:21]
  reg [2:0] uops_0_op2_sel; // @[dispatch.scala 33:21]
  reg [4:0] uops_0_alu_sel; // @[dispatch.scala 33:21]
  reg [3:0] uops_0_branch_type; // @[dispatch.scala 33:21]
  reg [1:0] uops_0_mem_type; // @[dispatch.scala 33:21]
  reg  uops_1_valid; // @[dispatch.scala 33:21]
  reg [31:0] uops_1_pc; // @[dispatch.scala 33:21]
  reg [31:0] uops_1_inst; // @[dispatch.scala 33:21]
  reg [6:0] uops_1_func_code; // @[dispatch.scala 33:21]
  reg  uops_1_branch_predict_pack_valid; // @[dispatch.scala 33:21]
  reg [63:0] uops_1_branch_predict_pack_target; // @[dispatch.scala 33:21]
  reg [3:0] uops_1_branch_predict_pack_branch_type; // @[dispatch.scala 33:21]
  reg  uops_1_branch_predict_pack_select; // @[dispatch.scala 33:21]
  reg  uops_1_branch_predict_pack_taken; // @[dispatch.scala 33:21]
  reg [6:0] uops_1_phy_dst; // @[dispatch.scala 33:21]
  reg [6:0] uops_1_stale_dst; // @[dispatch.scala 33:21]
  reg [4:0] uops_1_arch_dst; // @[dispatch.scala 33:21]
  reg [2:0] uops_1_inst_type; // @[dispatch.scala 33:21]
  reg  uops_1_regWen; // @[dispatch.scala 33:21]
  reg  uops_1_src1_valid; // @[dispatch.scala 33:21]
  reg [6:0] uops_1_phy_rs1; // @[dispatch.scala 33:21]
  reg [4:0] uops_1_arch_rs1; // @[dispatch.scala 33:21]
  reg  uops_1_src2_valid; // @[dispatch.scala 33:21]
  reg [6:0] uops_1_phy_rs2; // @[dispatch.scala 33:21]
  reg [4:0] uops_1_arch_rs2; // @[dispatch.scala 33:21]
  reg [63:0] uops_1_imm; // @[dispatch.scala 33:21]
  reg [63:0] uops_1_src1_value; // @[dispatch.scala 33:21]
  reg [63:0] uops_1_src2_value; // @[dispatch.scala 33:21]
  reg [2:0] uops_1_op1_sel; // @[dispatch.scala 33:21]
  reg [2:0] uops_1_op2_sel; // @[dispatch.scala 33:21]
  reg [4:0] uops_1_alu_sel; // @[dispatch.scala 33:21]
  reg [3:0] uops_1_branch_type; // @[dispatch.scala 33:21]
  reg [1:0] uops_1_mem_type; // @[dispatch.scala 33:21]
  wire  _T_1 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred; // @[dispatch.scala 36:60]
  wire  _io_o_rob_allocation_reqs_0_valid_T_3 = stall & ~(io_i_branch_resolve_pack_mispred &
    io_i_branch_resolve_pack_valid); // @[dispatch.scala 50:94]
  assign io_o_rob_allocation_reqs_0_valid = stall & ~(io_i_branch_resolve_pack_mispred & io_i_branch_resolve_pack_valid)
     ? 1'h0 : uops_0_valid; // @[dispatch.scala 50:43]
  assign io_o_rob_allocation_reqs_0_uop_valid = uops_0_valid; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_pc = uops_0_pc; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_inst = uops_0_inst; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_func_code = uops_0_func_code; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_branch_predict_pack_valid = uops_0_branch_predict_pack_valid; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_branch_predict_pack_target = uops_0_branch_predict_pack_target; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type = uops_0_branch_predict_pack_branch_type; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_branch_predict_pack_select = uops_0_branch_predict_pack_select; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_branch_predict_pack_taken = uops_0_branch_predict_pack_taken; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_phy_dst = uops_0_phy_dst; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_stale_dst = uops_0_stale_dst; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_arch_dst = uops_0_arch_dst; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_inst_type = uops_0_inst_type; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_regWen = uops_0_regWen; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_src1_valid = uops_0_src1_valid; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_phy_rs1 = uops_0_phy_rs1; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_arch_rs1 = uops_0_arch_rs1; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_src2_valid = uops_0_src2_valid; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_phy_rs2 = uops_0_phy_rs2; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_arch_rs2 = uops_0_arch_rs2; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_imm = uops_0_imm; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_src1_value = uops_0_src1_value; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_src2_value = uops_0_src2_value; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_op1_sel = uops_0_op1_sel; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_op2_sel = uops_0_op2_sel; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_alu_sel = uops_0_alu_sel; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_branch_type = uops_0_branch_type; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_0_uop_mem_type = uops_0_mem_type; // @[dispatch.scala 53:37]
  assign io_o_rob_allocation_reqs_1_valid = _io_o_rob_allocation_reqs_0_valid_T_3 ? 1'h0 : uops_1_valid; // @[dispatch.scala 51:43]
  assign io_o_rob_allocation_reqs_1_uop_valid = uops_1_valid; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_pc = uops_1_pc; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_inst = uops_1_inst; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_func_code = uops_1_func_code; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_branch_predict_pack_valid = uops_1_branch_predict_pack_valid; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_branch_predict_pack_target = uops_1_branch_predict_pack_target; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type = uops_1_branch_predict_pack_branch_type; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_branch_predict_pack_select = uops_1_branch_predict_pack_select; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_branch_predict_pack_taken = uops_1_branch_predict_pack_taken; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_phy_dst = uops_1_phy_dst; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_stale_dst = uops_1_stale_dst; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_arch_dst = uops_1_arch_dst; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_inst_type = uops_1_inst_type; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_regWen = uops_1_regWen; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_src1_valid = uops_1_src1_valid; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_phy_rs1 = uops_1_phy_rs1; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_arch_rs1 = uops_1_arch_rs1; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_src2_valid = uops_1_src2_valid; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_phy_rs2 = uops_1_phy_rs2; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_arch_rs2 = uops_1_arch_rs2; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_imm = uops_1_imm; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_src1_value = uops_1_src1_value; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_src2_value = uops_1_src2_value; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_op1_sel = uops_1_op1_sel; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_op2_sel = uops_1_op2_sel; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_alu_sel = uops_1_alu_sel; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_branch_type = uops_1_branch_type; // @[dispatch.scala 54:37]
  assign io_o_rob_allocation_reqs_1_uop_mem_type = uops_1_mem_type; // @[dispatch.scala 54:37]
  assign io_o_dispatch_packs_0_valid = _T_1 | stall ? 1'h0 : uops_0_valid; // @[dispatch.scala 58:34 60:84 61:37]
  assign io_o_dispatch_packs_0_pc = uops_0_pc; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_inst = uops_0_inst; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_func_code = uops_0_func_code; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_valid = uops_0_branch_predict_pack_valid; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_target = uops_0_branch_predict_pack_target; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_branch_type = uops_0_branch_predict_pack_branch_type; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_select = uops_0_branch_predict_pack_select; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_branch_predict_pack_taken = uops_0_branch_predict_pack_taken; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_phy_dst = uops_0_phy_dst; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_stale_dst = uops_0_stale_dst; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_arch_dst = uops_0_arch_dst; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_inst_type = uops_0_inst_type; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_regWen = uops_0_regWen; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_src1_valid = uops_0_src1_valid; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_phy_rs1 = uops_0_phy_rs1; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_arch_rs1 = uops_0_arch_rs1; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_src2_valid = uops_0_src2_valid; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_phy_rs2 = uops_0_phy_rs2; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_arch_rs2 = uops_0_arch_rs2; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_rob_idx = io_i_rob_allocation_ress_0_rob_idx; // @[dispatch.scala 64:35]
  assign io_o_dispatch_packs_0_imm = uops_0_imm; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_src1_value = uops_0_src1_value; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_src2_value = uops_0_src2_value; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_op1_sel = uops_0_op1_sel; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_op2_sel = uops_0_op2_sel; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_alu_sel = uops_0_alu_sel; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_branch_type = uops_0_branch_type; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_0_mem_type = uops_0_mem_type; // @[dispatch.scala 56:28]
  assign io_o_dispatch_packs_1_valid = _T_1 | stall ? 1'h0 : uops_1_valid; // @[dispatch.scala 59:34 60:84 62:37]
  assign io_o_dispatch_packs_1_pc = uops_1_pc; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_inst = uops_1_inst; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_func_code = uops_1_func_code; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_valid = uops_1_branch_predict_pack_valid; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_target = uops_1_branch_predict_pack_target; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_branch_type = uops_1_branch_predict_pack_branch_type; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_select = uops_1_branch_predict_pack_select; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_branch_predict_pack_taken = uops_1_branch_predict_pack_taken; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_phy_dst = uops_1_phy_dst; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_stale_dst = uops_1_stale_dst; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_arch_dst = uops_1_arch_dst; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_inst_type = uops_1_inst_type; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_regWen = uops_1_regWen; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_src1_valid = uops_1_src1_valid; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_phy_rs1 = uops_1_phy_rs1; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_arch_rs1 = uops_1_arch_rs1; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_src2_valid = uops_1_src2_valid; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_phy_rs2 = uops_1_phy_rs2; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_arch_rs2 = uops_1_arch_rs2; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_rob_idx = io_i_rob_allocation_ress_1_rob_idx; // @[dispatch.scala 65:35]
  assign io_o_dispatch_packs_1_imm = uops_1_imm; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_src1_value = uops_1_src1_value; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_src2_value = uops_1_src2_value; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_op1_sel = uops_1_op1_sel; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_op2_sel = uops_1_op2_sel; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_alu_sel = uops_1_alu_sel; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_branch_type = uops_1_branch_type; // @[dispatch.scala 57:28]
  assign io_o_dispatch_packs_1_mem_type = uops_1_mem_type; // @[dispatch.scala 57:28]
  always @(posedge clock) begin
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (io_i_exception | io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred) begin // @[dispatch.scala 36:97]
      uops_0_valid <= 1'h0; // @[dispatch.scala 37:22]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_valid <= io_i_rename_packs_0_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_pc <= 32'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_pc <= io_i_rename_packs_0_pc;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_inst <= 32'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_inst <= io_i_rename_packs_0_inst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_func_code <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_func_code <= io_i_rename_packs_0_func_code;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_branch_predict_pack_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_branch_predict_pack_valid <= io_i_rename_packs_0_branch_predict_pack_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_branch_predict_pack_target <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_branch_predict_pack_target <= io_i_rename_packs_0_branch_predict_pack_target;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_branch_predict_pack_branch_type <= 4'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_branch_predict_pack_branch_type <= io_i_rename_packs_0_branch_predict_pack_branch_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_branch_predict_pack_select <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_branch_predict_pack_select <= io_i_rename_packs_0_branch_predict_pack_select;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_branch_predict_pack_taken <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_branch_predict_pack_taken <= io_i_rename_packs_0_branch_predict_pack_taken;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_phy_dst <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_phy_dst <= io_i_rename_packs_0_phy_dst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_stale_dst <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_stale_dst <= io_i_rename_packs_0_stale_dst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_arch_dst <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_arch_dst <= io_i_rename_packs_0_arch_dst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_inst_type <= 3'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_inst_type <= io_i_rename_packs_0_inst_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_regWen <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_regWen <= io_i_rename_packs_0_regWen;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_src1_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_src1_valid <= io_i_rename_packs_0_src1_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_phy_rs1 <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_phy_rs1 <= io_i_rename_packs_0_phy_rs1;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_arch_rs1 <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_arch_rs1 <= io_i_rename_packs_0_arch_rs1;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_src2_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_src2_valid <= io_i_rename_packs_0_src2_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_phy_rs2 <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_phy_rs2 <= io_i_rename_packs_0_phy_rs2;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_arch_rs2 <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_arch_rs2 <= io_i_rename_packs_0_arch_rs2;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_imm <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_imm <= io_i_rename_packs_0_imm;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_src1_value <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_src1_value <= io_i_rename_packs_0_src1_value;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_src2_value <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_src2_value <= io_i_rename_packs_0_src2_value;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_op1_sel <= 3'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_op1_sel <= io_i_rename_packs_0_op1_sel;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_op2_sel <= 3'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_op2_sel <= io_i_rename_packs_0_op2_sel;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_alu_sel <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_alu_sel <= io_i_rename_packs_0_alu_sel;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_branch_type <= 4'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_branch_type <= io_i_rename_packs_0_branch_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_0_mem_type <= 2'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_0_mem_type <= io_i_rename_packs_0_mem_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (io_i_exception | io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred) begin // @[dispatch.scala 36:97]
      uops_1_valid <= 1'h0; // @[dispatch.scala 38:22]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_valid <= io_i_rename_packs_1_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_pc <= 32'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_pc <= io_i_rename_packs_1_pc;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_inst <= 32'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_inst <= io_i_rename_packs_1_inst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_func_code <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_func_code <= io_i_rename_packs_1_func_code;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_branch_predict_pack_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_branch_predict_pack_valid <= io_i_rename_packs_1_branch_predict_pack_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_branch_predict_pack_target <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_branch_predict_pack_target <= io_i_rename_packs_1_branch_predict_pack_target;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_branch_predict_pack_branch_type <= 4'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_branch_predict_pack_branch_type <= io_i_rename_packs_1_branch_predict_pack_branch_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_branch_predict_pack_select <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_branch_predict_pack_select <= io_i_rename_packs_1_branch_predict_pack_select;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_branch_predict_pack_taken <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_branch_predict_pack_taken <= io_i_rename_packs_1_branch_predict_pack_taken;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_phy_dst <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_phy_dst <= io_i_rename_packs_1_phy_dst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_stale_dst <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_stale_dst <= io_i_rename_packs_1_stale_dst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_arch_dst <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_arch_dst <= io_i_rename_packs_1_arch_dst;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_inst_type <= 3'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_inst_type <= io_i_rename_packs_1_inst_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_regWen <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_regWen <= io_i_rename_packs_1_regWen;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_src1_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_src1_valid <= io_i_rename_packs_1_src1_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_phy_rs1 <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_phy_rs1 <= io_i_rename_packs_1_phy_rs1;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_arch_rs1 <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_arch_rs1 <= io_i_rename_packs_1_arch_rs1;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_src2_valid <= 1'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_src2_valid <= io_i_rename_packs_1_src2_valid;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_phy_rs2 <= 7'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_phy_rs2 <= io_i_rename_packs_1_phy_rs2;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_arch_rs2 <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_arch_rs2 <= io_i_rename_packs_1_arch_rs2;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_imm <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_imm <= io_i_rename_packs_1_imm;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_src1_value <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_src1_value <= io_i_rename_packs_1_src1_value;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_src2_value <= 64'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_src2_value <= io_i_rename_packs_1_src2_value;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_op1_sel <= 3'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_op1_sel <= io_i_rename_packs_1_op1_sel;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_op2_sel <= 3'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_op2_sel <= io_i_rename_packs_1_op2_sel;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_alu_sel <= 5'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_alu_sel <= io_i_rename_packs_1_alu_sel;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_branch_type <= 4'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
      uops_1_branch_type <= io_i_rename_packs_1_branch_type;
    end
    if (reset) begin // @[dispatch.scala 33:21]
      uops_1_mem_type <= 2'h0; // @[dispatch.scala 33:21]
    end else if (!(stall)) begin // @[dispatch.scala 34:14]
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
  uops_0_branch_predict_pack_branch_type = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  uops_0_branch_predict_pack_select = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  uops_0_branch_predict_pack_taken = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_phy_dst = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  uops_0_stale_dst = _RAND_10[6:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_arch_dst = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  uops_0_inst_type = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  uops_0_regWen = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  uops_0_src1_valid = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uops_0_phy_rs1 = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  uops_0_arch_rs1 = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  uops_0_src2_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  uops_0_phy_rs2 = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  uops_0_arch_rs2 = _RAND_19[4:0];
  _RAND_20 = {2{`RANDOM}};
  uops_0_imm = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  uops_0_src1_value = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  uops_0_src2_value = _RAND_22[63:0];
  _RAND_23 = {1{`RANDOM}};
  uops_0_op1_sel = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  uops_0_op2_sel = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  uops_0_alu_sel = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  uops_0_branch_type = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  uops_0_mem_type = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  uops_1_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uops_1_pc = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  uops_1_inst = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  uops_1_func_code = _RAND_31[6:0];
  _RAND_32 = {1{`RANDOM}};
  uops_1_branch_predict_pack_valid = _RAND_32[0:0];
  _RAND_33 = {2{`RANDOM}};
  uops_1_branch_predict_pack_target = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  uops_1_branch_predict_pack_branch_type = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  uops_1_branch_predict_pack_select = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  uops_1_branch_predict_pack_taken = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uops_1_phy_dst = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  uops_1_stale_dst = _RAND_38[6:0];
  _RAND_39 = {1{`RANDOM}};
  uops_1_arch_dst = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  uops_1_inst_type = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  uops_1_regWen = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  uops_1_src1_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uops_1_phy_rs1 = _RAND_43[6:0];
  _RAND_44 = {1{`RANDOM}};
  uops_1_arch_rs1 = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  uops_1_src2_valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  uops_1_phy_rs2 = _RAND_46[6:0];
  _RAND_47 = {1{`RANDOM}};
  uops_1_arch_rs2 = _RAND_47[4:0];
  _RAND_48 = {2{`RANDOM}};
  uops_1_imm = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  uops_1_src1_value = _RAND_49[63:0];
  _RAND_50 = {2{`RANDOM}};
  uops_1_src2_value = _RAND_50[63:0];
  _RAND_51 = {1{`RANDOM}};
  uops_1_op1_sel = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  uops_1_op2_sel = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  uops_1_alu_sel = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  uops_1_branch_type = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  uops_1_mem_type = _RAND_55[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
