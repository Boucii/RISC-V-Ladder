module Ladder(
  input         clock,
  input         reset,
  output        io_icache_io_o_wen,
  output [63:0] io_icache_io_o_addr,
  input  [63:0] io_icache_io_i_data,
  input         io_icache_io_i_addr_ready,
  output        io_icache_io_o_addr_valid,
  input         io_icache_io_i_data_valid,
  output        io_icache_io_o_stall1,
  output        io_icache_io_o_stall2,
  input  [63:0] io_icache_io_dbg_i_addr2,
  input  [63:0] io_icache_io_dbg_i_addr3,
  input         io_dcache_io_data_valid,
  output        io_dcache_io_data_ready,
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
  output [5:0]  io_o_dbg_commit_packs_0_uop_rob_idx,
  output [63:0] io_o_dbg_commit_packs_0_uop_imm,
  output [63:0] io_o_dbg_commit_packs_0_uop_dst_value,
  output [63:0] io_o_dbg_commit_packs_0_uop_src1_value,
  output [63:0] io_o_dbg_commit_packs_0_uop_src2_value,
  output        io_o_dbg_commit_packs_0_uop_exception,
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
  output [5:0]  io_o_dbg_commit_packs_1_uop_rob_idx,
  output [63:0] io_o_dbg_commit_packs_1_uop_imm,
  output [63:0] io_o_dbg_commit_packs_1_uop_dst_value,
  output [63:0] io_o_dbg_commit_packs_1_uop_src1_value,
  output [63:0] io_o_dbg_commit_packs_1_uop_src2_value,
  output        io_o_dbg_commit_packs_1_uop_exception,
  output [2:0]  io_o_dbg_commit_packs_1_uop_op1_sel,
  output [2:0]  io_o_dbg_commit_packs_1_uop_op2_sel,
  output [4:0]  io_o_dbg_commit_packs_1_uop_alu_sel,
  output [3:0]  io_o_dbg_commit_packs_1_uop_branch_type,
  output [1:0]  io_o_dbg_commit_packs_1_uop_mem_type
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  front_end_clock; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_reset; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_icache_io_o_addr; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_icache_io_i_data; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_icache_io_i_addr_ready; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_icache_io_o_addr_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_icache_io_i_data_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_icache_io_o_stall1; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_icache_io_o_stall2; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_i_branch_resolve_pack_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_i_branch_resolve_pack_mispred; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_i_branch_resolve_pack_taken; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_i_branch_resolve_pack_pc; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_i_branch_resolve_pack_target; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_i_branch_resolve_pack_prediction_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire [2:0] front_end_io_i_branch_resolve_pack_branch_type; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_i_pc_redirect_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_i_pc_redirect_target; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_ready; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_bits_valids_0; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_bits_valids_1; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_o_fetch_pack_bits_pc; // @[CPU_top_with_dpic.scala 22:25]
  wire [31:0] front_end_io_o_fetch_pack_bits_insts_0; // @[CPU_top_with_dpic.scala 22:25]
  wire [31:0] front_end_io_o_fetch_pack_bits_insts_1; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 22:25]
  wire [63:0] front_end_io_o_fetch_pack_bits_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 22:25]
  wire [3:0] front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 22:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 22:25]
  wire  back_end_clock; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_reset; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_ready; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_bits_valids_0; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_bits_valids_1; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_i_fetch_pack_bits_pc; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_i_fetch_pack_bits_insts_0; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_i_fetch_pack_bits_insts_1; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_i_fetch_pack_bits_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 23:24]
  wire [3:0] back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_branch_resolve_pack_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_branch_resolve_pack_mispred; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_branch_resolve_pack_taken; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_branch_resolve_pack_pc; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_branch_resolve_pack_target; // @[CPU_top_with_dpic.scala 23:24]
  wire [5:0] back_end_io_o_branch_resolve_pack_rob_idx; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_branch_resolve_pack_prediction_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_branch_resolve_pack_branch_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_stall; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_pc_redirect_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_pc_redirect_target; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_dcache_io_data_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_dcache_io_addr_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_dcache_io_addr_ready; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_dcache_io_Mwout; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_dcache_io_Maddr; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_dcache_io_Men; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_dcache_io_Mlen; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_dcache_io_MdataIn; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_dcache_io_MdataOut; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_i_interrupt; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_0_uop_pc; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_0_uop_inst; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_func_code; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 23:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_phy_dst; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_stale_dst; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_arch_dst; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_inst_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_regWen; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_src1_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_phy_rs1; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_arch_rs1; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_src2_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_phy_rs2; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_arch_rs2; // @[CPU_top_with_dpic.scala 23:24]
  wire [5:0] back_end_io_o_dbg_commit_packs_0_uop_rob_idx; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_imm; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_dst_value; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_src1_value; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_src2_value; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_op1_sel; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_op2_sel; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_alu_sel; // @[CPU_top_with_dpic.scala 23:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_0_uop_branch_type; // @[CPU_top_with_dpic.scala 23:24]
  wire [1:0] back_end_io_o_dbg_commit_packs_0_uop_mem_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_1_uop_pc; // @[CPU_top_with_dpic.scala 23:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_1_uop_inst; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_func_code; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 23:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_phy_dst; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_stale_dst; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_arch_dst; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_inst_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_regWen; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_src1_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_phy_rs1; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_arch_rs1; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_src2_valid; // @[CPU_top_with_dpic.scala 23:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_phy_rs2; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_arch_rs2; // @[CPU_top_with_dpic.scala 23:24]
  wire [5:0] back_end_io_o_dbg_commit_packs_1_uop_rob_idx; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_imm; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_dst_value; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_src1_value; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_src2_value; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_op1_sel; // @[CPU_top_with_dpic.scala 23:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_op2_sel; // @[CPU_top_with_dpic.scala 23:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_alu_sel; // @[CPU_top_with_dpic.scala 23:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_1_uop_branch_type; // @[CPU_top_with_dpic.scala 23:24]
  wire [1:0] back_end_io_o_dbg_commit_packs_1_uop_mem_type; // @[CPU_top_with_dpic.scala 23:24]
  wire  back_end_io_o_dbg_stop; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_0; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_1; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_2; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_3; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_4; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_5; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_6; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_7; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_8; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_9; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_10; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_11; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_12; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_13; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_14; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_15; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_16; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_17; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_18; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_19; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_20; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_21; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_22; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_23; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_24; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_25; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_26; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_27; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_28; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_29; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_30; // @[CPU_top_with_dpic.scala 23:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_31; // @[CPU_top_with_dpic.scala 23:24]
  wire  dpic_clk; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_stop; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_data_valid; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_data_ready; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_addr_ready; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_addr_valid; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_Mwout; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_Maddr; // @[CPU_top_with_dpic.scala 24:20]
  wire  dpic_Men; // @[CPU_top_with_dpic.scala 24:20]
  wire [31:0] dpic_Mlen; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_MdataIn; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_MdataOut; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs0; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs1; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs2; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs3; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs4; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs5; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs6; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs7; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs8; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs9; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs10; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs11; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs12; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs13; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs14; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs15; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs16; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs17; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs18; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs19; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs20; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs21; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs22; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs23; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs24; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs25; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs26; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs27; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs28; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs29; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs30; // @[CPU_top_with_dpic.scala 24:20]
  wire [63:0] dpic_regs31; // @[CPU_top_with_dpic.scala 24:20]
  reg  last_branch_resolve_pack_valid; // @[CPU_top_with_dpic.scala 27:41]
  reg  last_branch_resolve_pack_mispred; // @[CPU_top_with_dpic.scala 27:41]
  reg  last_branch_resolve_pack_taken; // @[CPU_top_with_dpic.scala 27:41]
  reg [63:0] last_branch_resolve_pack_pc; // @[CPU_top_with_dpic.scala 27:41]
  reg [63:0] last_branch_resolve_pack_target; // @[CPU_top_with_dpic.scala 27:41]
  reg [5:0] last_branch_resolve_pack_rob_idx; // @[CPU_top_with_dpic.scala 27:41]
  reg  last_branch_resolve_pack_prediction_valid; // @[CPU_top_with_dpic.scala 27:41]
  reg [2:0] last_branch_resolve_pack_branch_type; // @[CPU_top_with_dpic.scala 27:41]
  wire [140:0] _front_end_io_i_branch_resolve_pack_T = {last_branch_resolve_pack_valid,last_branch_resolve_pack_mispred,
    last_branch_resolve_pack_taken,last_branch_resolve_pack_pc,last_branch_resolve_pack_target,
    last_branch_resolve_pack_rob_idx,last_branch_resolve_pack_prediction_valid,last_branch_resolve_pack_branch_type}; // @[CPU_top_with_dpic.scala 30:70]
  wire [140:0] _front_end_io_i_branch_resolve_pack_T_1 = {back_end_io_o_branch_resolve_pack_valid,
    back_end_io_o_branch_resolve_pack_mispred,back_end_io_o_branch_resolve_pack_taken,
    back_end_io_o_branch_resolve_pack_pc,back_end_io_o_branch_resolve_pack_target,
    back_end_io_o_branch_resolve_pack_rob_idx,back_end_io_o_branch_resolve_pack_prediction_valid,
    back_end_io_o_branch_resolve_pack_branch_type}; // @[CPU_top_with_dpic.scala 30:115]
  Front_End front_end ( // @[CPU_top_with_dpic.scala 22:25]
    .clock(front_end_clock),
    .reset(front_end_reset),
    .io_icache_io_o_addr(front_end_io_icache_io_o_addr),
    .io_icache_io_i_data(front_end_io_icache_io_i_data),
    .io_icache_io_i_addr_ready(front_end_io_icache_io_i_addr_ready),
    .io_icache_io_o_addr_valid(front_end_io_icache_io_o_addr_valid),
    .io_icache_io_i_data_valid(front_end_io_icache_io_i_data_valid),
    .io_icache_io_o_stall1(front_end_io_icache_io_o_stall1),
    .io_icache_io_o_stall2(front_end_io_icache_io_o_stall2),
    .io_i_branch_resolve_pack_valid(front_end_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(front_end_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_taken(front_end_io_i_branch_resolve_pack_taken),
    .io_i_branch_resolve_pack_pc(front_end_io_i_branch_resolve_pack_pc),
    .io_i_branch_resolve_pack_target(front_end_io_i_branch_resolve_pack_target),
    .io_i_branch_resolve_pack_prediction_valid(front_end_io_i_branch_resolve_pack_prediction_valid),
    .io_i_branch_resolve_pack_branch_type(front_end_io_i_branch_resolve_pack_branch_type),
    .io_i_pc_redirect_valid(front_end_io_i_pc_redirect_valid),
    .io_i_pc_redirect_target(front_end_io_i_pc_redirect_target),
    .io_o_fetch_pack_ready(front_end_io_o_fetch_pack_ready),
    .io_o_fetch_pack_valid(front_end_io_o_fetch_pack_valid),
    .io_o_fetch_pack_bits_valids_0(front_end_io_o_fetch_pack_bits_valids_0),
    .io_o_fetch_pack_bits_valids_1(front_end_io_o_fetch_pack_bits_valids_1),
    .io_o_fetch_pack_bits_pc(front_end_io_o_fetch_pack_bits_pc),
    .io_o_fetch_pack_bits_insts_0(front_end_io_o_fetch_pack_bits_insts_0),
    .io_o_fetch_pack_bits_insts_1(front_end_io_o_fetch_pack_bits_insts_1),
    .io_o_fetch_pack_bits_branch_predict_pack_valid(front_end_io_o_fetch_pack_bits_branch_predict_pack_valid),
    .io_o_fetch_pack_bits_branch_predict_pack_target(front_end_io_o_fetch_pack_bits_branch_predict_pack_target),
    .io_o_fetch_pack_bits_branch_predict_pack_branch_type(front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type
      ),
    .io_o_fetch_pack_bits_branch_predict_pack_select(front_end_io_o_fetch_pack_bits_branch_predict_pack_select),
    .io_o_fetch_pack_bits_branch_predict_pack_taken(front_end_io_o_fetch_pack_bits_branch_predict_pack_taken)
  );
  Back_End_With_Decode back_end ( // @[CPU_top_with_dpic.scala 23:24]
    .clock(back_end_clock),
    .reset(back_end_reset),
    .io_i_fetch_pack_ready(back_end_io_i_fetch_pack_ready),
    .io_i_fetch_pack_valid(back_end_io_i_fetch_pack_valid),
    .io_i_fetch_pack_bits_valids_0(back_end_io_i_fetch_pack_bits_valids_0),
    .io_i_fetch_pack_bits_valids_1(back_end_io_i_fetch_pack_bits_valids_1),
    .io_i_fetch_pack_bits_pc(back_end_io_i_fetch_pack_bits_pc),
    .io_i_fetch_pack_bits_insts_0(back_end_io_i_fetch_pack_bits_insts_0),
    .io_i_fetch_pack_bits_insts_1(back_end_io_i_fetch_pack_bits_insts_1),
    .io_i_fetch_pack_bits_branch_predict_pack_valid(back_end_io_i_fetch_pack_bits_branch_predict_pack_valid),
    .io_i_fetch_pack_bits_branch_predict_pack_target(back_end_io_i_fetch_pack_bits_branch_predict_pack_target),
    .io_i_fetch_pack_bits_branch_predict_pack_branch_type(back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type)
      ,
    .io_i_fetch_pack_bits_branch_predict_pack_select(back_end_io_i_fetch_pack_bits_branch_predict_pack_select),
    .io_i_fetch_pack_bits_branch_predict_pack_taken(back_end_io_i_fetch_pack_bits_branch_predict_pack_taken),
    .io_o_branch_resolve_pack_valid(back_end_io_o_branch_resolve_pack_valid),
    .io_o_branch_resolve_pack_mispred(back_end_io_o_branch_resolve_pack_mispred),
    .io_o_branch_resolve_pack_taken(back_end_io_o_branch_resolve_pack_taken),
    .io_o_branch_resolve_pack_pc(back_end_io_o_branch_resolve_pack_pc),
    .io_o_branch_resolve_pack_target(back_end_io_o_branch_resolve_pack_target),
    .io_o_branch_resolve_pack_rob_idx(back_end_io_o_branch_resolve_pack_rob_idx),
    .io_o_branch_resolve_pack_prediction_valid(back_end_io_o_branch_resolve_pack_prediction_valid),
    .io_o_branch_resolve_pack_branch_type(back_end_io_o_branch_resolve_pack_branch_type),
    .io_o_stall(back_end_io_o_stall),
    .io_o_pc_redirect_valid(back_end_io_o_pc_redirect_valid),
    .io_o_pc_redirect_target(back_end_io_o_pc_redirect_target),
    .io_dcache_io_data_valid(back_end_io_dcache_io_data_valid),
    .io_dcache_io_addr_valid(back_end_io_dcache_io_addr_valid),
    .io_dcache_io_addr_ready(back_end_io_dcache_io_addr_ready),
    .io_dcache_io_Mwout(back_end_io_dcache_io_Mwout),
    .io_dcache_io_Maddr(back_end_io_dcache_io_Maddr),
    .io_dcache_io_Men(back_end_io_dcache_io_Men),
    .io_dcache_io_Mlen(back_end_io_dcache_io_Mlen),
    .io_dcache_io_MdataIn(back_end_io_dcache_io_MdataIn),
    .io_dcache_io_MdataOut(back_end_io_dcache_io_MdataOut),
    .io_i_interrupt(back_end_io_i_interrupt),
    .io_o_dbg_commit_packs_0_valid(back_end_io_o_dbg_commit_packs_0_valid),
    .io_o_dbg_commit_packs_0_uop_valid(back_end_io_o_dbg_commit_packs_0_uop_valid),
    .io_o_dbg_commit_packs_0_uop_pc(back_end_io_o_dbg_commit_packs_0_uop_pc),
    .io_o_dbg_commit_packs_0_uop_inst(back_end_io_o_dbg_commit_packs_0_uop_inst),
    .io_o_dbg_commit_packs_0_uop_func_code(back_end_io_o_dbg_commit_packs_0_uop_func_code),
    .io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid(
      back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid),
    .io_o_dbg_commit_packs_0_uop_branch_predict_pack_target(
      back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_target),
    .io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type(
      back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type),
    .io_o_dbg_commit_packs_0_uop_branch_predict_pack_select(
      back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_select),
    .io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken(
      back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken),
    .io_o_dbg_commit_packs_0_uop_phy_dst(back_end_io_o_dbg_commit_packs_0_uop_phy_dst),
    .io_o_dbg_commit_packs_0_uop_stale_dst(back_end_io_o_dbg_commit_packs_0_uop_stale_dst),
    .io_o_dbg_commit_packs_0_uop_arch_dst(back_end_io_o_dbg_commit_packs_0_uop_arch_dst),
    .io_o_dbg_commit_packs_0_uop_inst_type(back_end_io_o_dbg_commit_packs_0_uop_inst_type),
    .io_o_dbg_commit_packs_0_uop_regWen(back_end_io_o_dbg_commit_packs_0_uop_regWen),
    .io_o_dbg_commit_packs_0_uop_src1_valid(back_end_io_o_dbg_commit_packs_0_uop_src1_valid),
    .io_o_dbg_commit_packs_0_uop_phy_rs1(back_end_io_o_dbg_commit_packs_0_uop_phy_rs1),
    .io_o_dbg_commit_packs_0_uop_arch_rs1(back_end_io_o_dbg_commit_packs_0_uop_arch_rs1),
    .io_o_dbg_commit_packs_0_uop_src2_valid(back_end_io_o_dbg_commit_packs_0_uop_src2_valid),
    .io_o_dbg_commit_packs_0_uop_phy_rs2(back_end_io_o_dbg_commit_packs_0_uop_phy_rs2),
    .io_o_dbg_commit_packs_0_uop_arch_rs2(back_end_io_o_dbg_commit_packs_0_uop_arch_rs2),
    .io_o_dbg_commit_packs_0_uop_rob_idx(back_end_io_o_dbg_commit_packs_0_uop_rob_idx),
    .io_o_dbg_commit_packs_0_uop_imm(back_end_io_o_dbg_commit_packs_0_uop_imm),
    .io_o_dbg_commit_packs_0_uop_dst_value(back_end_io_o_dbg_commit_packs_0_uop_dst_value),
    .io_o_dbg_commit_packs_0_uop_src1_value(back_end_io_o_dbg_commit_packs_0_uop_src1_value),
    .io_o_dbg_commit_packs_0_uop_src2_value(back_end_io_o_dbg_commit_packs_0_uop_src2_value),
    .io_o_dbg_commit_packs_0_uop_op1_sel(back_end_io_o_dbg_commit_packs_0_uop_op1_sel),
    .io_o_dbg_commit_packs_0_uop_op2_sel(back_end_io_o_dbg_commit_packs_0_uop_op2_sel),
    .io_o_dbg_commit_packs_0_uop_alu_sel(back_end_io_o_dbg_commit_packs_0_uop_alu_sel),
    .io_o_dbg_commit_packs_0_uop_branch_type(back_end_io_o_dbg_commit_packs_0_uop_branch_type),
    .io_o_dbg_commit_packs_0_uop_mem_type(back_end_io_o_dbg_commit_packs_0_uop_mem_type),
    .io_o_dbg_commit_packs_1_valid(back_end_io_o_dbg_commit_packs_1_valid),
    .io_o_dbg_commit_packs_1_uop_valid(back_end_io_o_dbg_commit_packs_1_uop_valid),
    .io_o_dbg_commit_packs_1_uop_pc(back_end_io_o_dbg_commit_packs_1_uop_pc),
    .io_o_dbg_commit_packs_1_uop_inst(back_end_io_o_dbg_commit_packs_1_uop_inst),
    .io_o_dbg_commit_packs_1_uop_func_code(back_end_io_o_dbg_commit_packs_1_uop_func_code),
    .io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid(
      back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid),
    .io_o_dbg_commit_packs_1_uop_branch_predict_pack_target(
      back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_target),
    .io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type(
      back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type),
    .io_o_dbg_commit_packs_1_uop_branch_predict_pack_select(
      back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_select),
    .io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken(
      back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken),
    .io_o_dbg_commit_packs_1_uop_phy_dst(back_end_io_o_dbg_commit_packs_1_uop_phy_dst),
    .io_o_dbg_commit_packs_1_uop_stale_dst(back_end_io_o_dbg_commit_packs_1_uop_stale_dst),
    .io_o_dbg_commit_packs_1_uop_arch_dst(back_end_io_o_dbg_commit_packs_1_uop_arch_dst),
    .io_o_dbg_commit_packs_1_uop_inst_type(back_end_io_o_dbg_commit_packs_1_uop_inst_type),
    .io_o_dbg_commit_packs_1_uop_regWen(back_end_io_o_dbg_commit_packs_1_uop_regWen),
    .io_o_dbg_commit_packs_1_uop_src1_valid(back_end_io_o_dbg_commit_packs_1_uop_src1_valid),
    .io_o_dbg_commit_packs_1_uop_phy_rs1(back_end_io_o_dbg_commit_packs_1_uop_phy_rs1),
    .io_o_dbg_commit_packs_1_uop_arch_rs1(back_end_io_o_dbg_commit_packs_1_uop_arch_rs1),
    .io_o_dbg_commit_packs_1_uop_src2_valid(back_end_io_o_dbg_commit_packs_1_uop_src2_valid),
    .io_o_dbg_commit_packs_1_uop_phy_rs2(back_end_io_o_dbg_commit_packs_1_uop_phy_rs2),
    .io_o_dbg_commit_packs_1_uop_arch_rs2(back_end_io_o_dbg_commit_packs_1_uop_arch_rs2),
    .io_o_dbg_commit_packs_1_uop_rob_idx(back_end_io_o_dbg_commit_packs_1_uop_rob_idx),
    .io_o_dbg_commit_packs_1_uop_imm(back_end_io_o_dbg_commit_packs_1_uop_imm),
    .io_o_dbg_commit_packs_1_uop_dst_value(back_end_io_o_dbg_commit_packs_1_uop_dst_value),
    .io_o_dbg_commit_packs_1_uop_src1_value(back_end_io_o_dbg_commit_packs_1_uop_src1_value),
    .io_o_dbg_commit_packs_1_uop_src2_value(back_end_io_o_dbg_commit_packs_1_uop_src2_value),
    .io_o_dbg_commit_packs_1_uop_op1_sel(back_end_io_o_dbg_commit_packs_1_uop_op1_sel),
    .io_o_dbg_commit_packs_1_uop_op2_sel(back_end_io_o_dbg_commit_packs_1_uop_op2_sel),
    .io_o_dbg_commit_packs_1_uop_alu_sel(back_end_io_o_dbg_commit_packs_1_uop_alu_sel),
    .io_o_dbg_commit_packs_1_uop_branch_type(back_end_io_o_dbg_commit_packs_1_uop_branch_type),
    .io_o_dbg_commit_packs_1_uop_mem_type(back_end_io_o_dbg_commit_packs_1_uop_mem_type),
    .io_o_dbg_stop(back_end_io_o_dbg_stop),
    .io_o_dbg_arch_regs_0(back_end_io_o_dbg_arch_regs_0),
    .io_o_dbg_arch_regs_1(back_end_io_o_dbg_arch_regs_1),
    .io_o_dbg_arch_regs_2(back_end_io_o_dbg_arch_regs_2),
    .io_o_dbg_arch_regs_3(back_end_io_o_dbg_arch_regs_3),
    .io_o_dbg_arch_regs_4(back_end_io_o_dbg_arch_regs_4),
    .io_o_dbg_arch_regs_5(back_end_io_o_dbg_arch_regs_5),
    .io_o_dbg_arch_regs_6(back_end_io_o_dbg_arch_regs_6),
    .io_o_dbg_arch_regs_7(back_end_io_o_dbg_arch_regs_7),
    .io_o_dbg_arch_regs_8(back_end_io_o_dbg_arch_regs_8),
    .io_o_dbg_arch_regs_9(back_end_io_o_dbg_arch_regs_9),
    .io_o_dbg_arch_regs_10(back_end_io_o_dbg_arch_regs_10),
    .io_o_dbg_arch_regs_11(back_end_io_o_dbg_arch_regs_11),
    .io_o_dbg_arch_regs_12(back_end_io_o_dbg_arch_regs_12),
    .io_o_dbg_arch_regs_13(back_end_io_o_dbg_arch_regs_13),
    .io_o_dbg_arch_regs_14(back_end_io_o_dbg_arch_regs_14),
    .io_o_dbg_arch_regs_15(back_end_io_o_dbg_arch_regs_15),
    .io_o_dbg_arch_regs_16(back_end_io_o_dbg_arch_regs_16),
    .io_o_dbg_arch_regs_17(back_end_io_o_dbg_arch_regs_17),
    .io_o_dbg_arch_regs_18(back_end_io_o_dbg_arch_regs_18),
    .io_o_dbg_arch_regs_19(back_end_io_o_dbg_arch_regs_19),
    .io_o_dbg_arch_regs_20(back_end_io_o_dbg_arch_regs_20),
    .io_o_dbg_arch_regs_21(back_end_io_o_dbg_arch_regs_21),
    .io_o_dbg_arch_regs_22(back_end_io_o_dbg_arch_regs_22),
    .io_o_dbg_arch_regs_23(back_end_io_o_dbg_arch_regs_23),
    .io_o_dbg_arch_regs_24(back_end_io_o_dbg_arch_regs_24),
    .io_o_dbg_arch_regs_25(back_end_io_o_dbg_arch_regs_25),
    .io_o_dbg_arch_regs_26(back_end_io_o_dbg_arch_regs_26),
    .io_o_dbg_arch_regs_27(back_end_io_o_dbg_arch_regs_27),
    .io_o_dbg_arch_regs_28(back_end_io_o_dbg_arch_regs_28),
    .io_o_dbg_arch_regs_29(back_end_io_o_dbg_arch_regs_29),
    .io_o_dbg_arch_regs_30(back_end_io_o_dbg_arch_regs_30),
    .io_o_dbg_arch_regs_31(back_end_io_o_dbg_arch_regs_31)
  );
  dpic dpic ( // @[CPU_top_with_dpic.scala 24:20]
    .clk(dpic_clk),
    .stop(dpic_stop),
    .data_valid(dpic_data_valid),
    .data_ready(dpic_data_ready),
    .addr_ready(dpic_addr_ready),
    .addr_valid(dpic_addr_valid),
    .Mwout(dpic_Mwout),
    .Maddr(dpic_Maddr),
    .Men(dpic_Men),
    .Mlen(dpic_Mlen),
    .MdataIn(dpic_MdataIn),
    .MdataOut(dpic_MdataOut),
    .regs0(dpic_regs0),
    .regs1(dpic_regs1),
    .regs2(dpic_regs2),
    .regs3(dpic_regs3),
    .regs4(dpic_regs4),
    .regs5(dpic_regs5),
    .regs6(dpic_regs6),
    .regs7(dpic_regs7),
    .regs8(dpic_regs8),
    .regs9(dpic_regs9),
    .regs10(dpic_regs10),
    .regs11(dpic_regs11),
    .regs12(dpic_regs12),
    .regs13(dpic_regs13),
    .regs14(dpic_regs14),
    .regs15(dpic_regs15),
    .regs16(dpic_regs16),
    .regs17(dpic_regs17),
    .regs18(dpic_regs18),
    .regs19(dpic_regs19),
    .regs20(dpic_regs20),
    .regs21(dpic_regs21),
    .regs22(dpic_regs22),
    .regs23(dpic_regs23),
    .regs24(dpic_regs24),
    .regs25(dpic_regs25),
    .regs26(dpic_regs26),
    .regs27(dpic_regs27),
    .regs28(dpic_regs28),
    .regs29(dpic_regs29),
    .regs30(dpic_regs30),
    .regs31(dpic_regs31)
  );
  assign io_icache_io_o_wen = 1'h0; // @[CPU_top_with_dpic.scala 37:22]
  assign io_icache_io_o_addr = front_end_io_icache_io_o_addr; // @[CPU_top_with_dpic.scala 38:23]
  assign io_icache_io_o_addr_valid = front_end_io_icache_io_o_addr_valid; // @[CPU_top_with_dpic.scala 39:29]
  assign io_icache_io_o_stall1 = front_end_io_icache_io_o_stall1; // @[CPU_top_with_dpic.scala 40:25]
  assign io_icache_io_o_stall2 = front_end_io_icache_io_o_stall2; // @[CPU_top_with_dpic.scala 41:25]
  assign io_dcache_io_data_ready = 1'h1; // @[CPU_top_with_dpic.scala 56:36]
  assign io_dcache_io_addr_valid = back_end_io_dcache_io_addr_valid; // @[CPU_top_with_dpic.scala 55:36]
  assign io_dcache_io_Mwout = back_end_io_dcache_io_Mwout; // @[CPU_top_with_dpic.scala 59:35]
  assign io_dcache_io_Maddr = back_end_io_dcache_io_Maddr; // @[CPU_top_with_dpic.scala 60:35]
  assign io_dcache_io_Men = back_end_io_dcache_io_Men; // @[CPU_top_with_dpic.scala 61:35]
  assign io_dcache_io_Mlen = back_end_io_dcache_io_Mlen; // @[CPU_top_with_dpic.scala 62:35]
  assign io_dcache_io_MdataOut = back_end_io_dcache_io_MdataOut; // @[CPU_top_with_dpic.scala 63:35]
  assign io_o_dbg_commit_packs_0_valid = back_end_io_o_dbg_commit_packs_0_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_valid = back_end_io_o_dbg_commit_packs_0_uop_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_pc = back_end_io_o_dbg_commit_packs_0_uop_pc; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_inst = back_end_io_o_dbg_commit_packs_0_uop_inst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_func_code = back_end_io_o_dbg_commit_packs_0_uop_func_code; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_target =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_select =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_phy_dst = back_end_io_o_dbg_commit_packs_0_uop_phy_dst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_stale_dst = back_end_io_o_dbg_commit_packs_0_uop_stale_dst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_arch_dst = back_end_io_o_dbg_commit_packs_0_uop_arch_dst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_inst_type = back_end_io_o_dbg_commit_packs_0_uop_inst_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_regWen = back_end_io_o_dbg_commit_packs_0_uop_regWen; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_src1_valid = back_end_io_o_dbg_commit_packs_0_uop_src1_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_phy_rs1 = back_end_io_o_dbg_commit_packs_0_uop_phy_rs1; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_arch_rs1 = back_end_io_o_dbg_commit_packs_0_uop_arch_rs1; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_src2_valid = back_end_io_o_dbg_commit_packs_0_uop_src2_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_phy_rs2 = back_end_io_o_dbg_commit_packs_0_uop_phy_rs2; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_arch_rs2 = back_end_io_o_dbg_commit_packs_0_uop_arch_rs2; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_rob_idx = back_end_io_o_dbg_commit_packs_0_uop_rob_idx; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_imm = back_end_io_o_dbg_commit_packs_0_uop_imm; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_dst_value = back_end_io_o_dbg_commit_packs_0_uop_dst_value; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_src1_value = back_end_io_o_dbg_commit_packs_0_uop_src1_value; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_src2_value = back_end_io_o_dbg_commit_packs_0_uop_src2_value; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_exception = 1'h0; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_op1_sel = back_end_io_o_dbg_commit_packs_0_uop_op1_sel; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_op2_sel = back_end_io_o_dbg_commit_packs_0_uop_op2_sel; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_alu_sel = back_end_io_o_dbg_commit_packs_0_uop_alu_sel; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_branch_type = back_end_io_o_dbg_commit_packs_0_uop_branch_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_0_uop_mem_type = back_end_io_o_dbg_commit_packs_0_uop_mem_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_valid = back_end_io_o_dbg_commit_packs_1_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_valid = back_end_io_o_dbg_commit_packs_1_uop_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_pc = back_end_io_o_dbg_commit_packs_1_uop_pc; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_inst = back_end_io_o_dbg_commit_packs_1_uop_inst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_func_code = back_end_io_o_dbg_commit_packs_1_uop_func_code; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_target =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_select =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_phy_dst = back_end_io_o_dbg_commit_packs_1_uop_phy_dst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_stale_dst = back_end_io_o_dbg_commit_packs_1_uop_stale_dst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_arch_dst = back_end_io_o_dbg_commit_packs_1_uop_arch_dst; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_inst_type = back_end_io_o_dbg_commit_packs_1_uop_inst_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_regWen = back_end_io_o_dbg_commit_packs_1_uop_regWen; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_src1_valid = back_end_io_o_dbg_commit_packs_1_uop_src1_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_phy_rs1 = back_end_io_o_dbg_commit_packs_1_uop_phy_rs1; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_arch_rs1 = back_end_io_o_dbg_commit_packs_1_uop_arch_rs1; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_src2_valid = back_end_io_o_dbg_commit_packs_1_uop_src2_valid; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_phy_rs2 = back_end_io_o_dbg_commit_packs_1_uop_phy_rs2; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_arch_rs2 = back_end_io_o_dbg_commit_packs_1_uop_arch_rs2; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_rob_idx = back_end_io_o_dbg_commit_packs_1_uop_rob_idx; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_imm = back_end_io_o_dbg_commit_packs_1_uop_imm; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_dst_value = back_end_io_o_dbg_commit_packs_1_uop_dst_value; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_src1_value = back_end_io_o_dbg_commit_packs_1_uop_src1_value; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_src2_value = back_end_io_o_dbg_commit_packs_1_uop_src2_value; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_exception = 1'h0; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_op1_sel = back_end_io_o_dbg_commit_packs_1_uop_op1_sel; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_op2_sel = back_end_io_o_dbg_commit_packs_1_uop_op2_sel; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_alu_sel = back_end_io_o_dbg_commit_packs_1_uop_alu_sel; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_branch_type = back_end_io_o_dbg_commit_packs_1_uop_branch_type; // @[CPU_top_with_dpic.scala 65:25]
  assign io_o_dbg_commit_packs_1_uop_mem_type = back_end_io_o_dbg_commit_packs_1_uop_mem_type; // @[CPU_top_with_dpic.scala 65:25]
  assign front_end_clock = clock;
  assign front_end_reset = reset;
  assign front_end_io_icache_io_i_data = io_icache_io_i_data; // @[CPU_top_with_dpic.scala 42:33]
  assign front_end_io_icache_io_i_addr_ready = io_icache_io_i_addr_ready; // @[CPU_top_with_dpic.scala 35:39]
  assign front_end_io_icache_io_i_data_valid = io_icache_io_i_data_valid; // @[CPU_top_with_dpic.scala 36:39]
  assign front_end_io_i_branch_resolve_pack_valid = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_valid; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_branch_resolve_pack_mispred = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_mispred; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_branch_resolve_pack_taken = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_taken; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_branch_resolve_pack_pc = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 64'h0 : back_end_io_o_branch_resolve_pack_pc; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_branch_resolve_pack_target = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 64'h0 : back_end_io_o_branch_resolve_pack_target; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_branch_resolve_pack_prediction_valid = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_prediction_valid; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_branch_resolve_pack_branch_type = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 3'h0 : back_end_io_o_branch_resolve_pack_branch_type; // @[CPU_top_with_dpic.scala 30:44]
  assign front_end_io_i_pc_redirect_valid = back_end_io_o_pc_redirect_valid; // @[CPU_top_with_dpic.scala 32:36]
  assign front_end_io_i_pc_redirect_target = back_end_io_o_pc_redirect_target; // @[CPU_top_with_dpic.scala 33:37]
  assign front_end_io_o_fetch_pack_ready = back_end_io_i_fetch_pack_ready; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_clock = clock;
  assign back_end_reset = reset;
  assign back_end_io_i_fetch_pack_valid = front_end_io_o_fetch_pack_valid; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_valids_0 = front_end_io_o_fetch_pack_bits_valids_0; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_valids_1 = front_end_io_o_fetch_pack_bits_valids_1; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_pc = front_end_io_o_fetch_pack_bits_pc; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_insts_0 = front_end_io_o_fetch_pack_bits_insts_0; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_insts_1 = front_end_io_o_fetch_pack_bits_insts_1; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_valid =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_target =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_target; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_select =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_select; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_taken =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[CPU_top_with_dpic.scala 50:28]
  assign back_end_io_dcache_io_data_valid = dpic_data_valid; // @[CPU_top_with_dpic.scala 53:37]
  assign back_end_io_dcache_io_addr_ready = dpic_addr_ready; // @[CPU_top_with_dpic.scala 57:36]
  assign back_end_io_dcache_io_MdataIn = dpic_MdataIn; // @[CPU_top_with_dpic.scala 54:37]
  assign back_end_io_i_interrupt = io_i_interrupt; // @[CPU_top_with_dpic.scala 51:27]
  assign dpic_clk = clock; // @[CPU_top_with_dpic.scala 68:15]
  assign dpic_stop = back_end_io_o_dbg_stop; // @[CPU_top_with_dpic.scala 69:16]
  assign dpic_data_ready = 1'h1; // @[CPU_top_with_dpic.scala 70:22]
  assign dpic_addr_valid = back_end_io_dcache_io_addr_valid; // @[CPU_top_with_dpic.scala 71:22]
  assign dpic_Mwout = back_end_io_dcache_io_Mwout; // @[CPU_top_with_dpic.scala 72:17]
  assign dpic_Maddr = back_end_io_dcache_io_Maddr; // @[CPU_top_with_dpic.scala 73:17]
  assign dpic_Men = back_end_io_dcache_io_Men; // @[CPU_top_with_dpic.scala 74:19]
  assign dpic_Mlen = back_end_io_dcache_io_Mlen; // @[CPU_top_with_dpic.scala 75:21]
  assign dpic_MdataOut = back_end_io_dcache_io_MdataOut; // @[CPU_top_with_dpic.scala 76:21]
  assign dpic_regs0 = back_end_io_o_dbg_arch_regs_0; // @[CPU_top_with_dpic.scala 78:18]
  assign dpic_regs1 = back_end_io_o_dbg_arch_regs_1; // @[CPU_top_with_dpic.scala 79:18]
  assign dpic_regs2 = back_end_io_o_dbg_arch_regs_2; // @[CPU_top_with_dpic.scala 80:18]
  assign dpic_regs3 = back_end_io_o_dbg_arch_regs_3; // @[CPU_top_with_dpic.scala 81:18]
  assign dpic_regs4 = back_end_io_o_dbg_arch_regs_4; // @[CPU_top_with_dpic.scala 82:18]
  assign dpic_regs5 = back_end_io_o_dbg_arch_regs_5; // @[CPU_top_with_dpic.scala 83:18]
  assign dpic_regs6 = back_end_io_o_dbg_arch_regs_6; // @[CPU_top_with_dpic.scala 84:18]
  assign dpic_regs7 = back_end_io_o_dbg_arch_regs_7; // @[CPU_top_with_dpic.scala 85:18]
  assign dpic_regs8 = back_end_io_o_dbg_arch_regs_8; // @[CPU_top_with_dpic.scala 86:18]
  assign dpic_regs9 = back_end_io_o_dbg_arch_regs_9; // @[CPU_top_with_dpic.scala 87:18]
  assign dpic_regs10 = back_end_io_o_dbg_arch_regs_10; // @[CPU_top_with_dpic.scala 88:18]
  assign dpic_regs11 = back_end_io_o_dbg_arch_regs_11; // @[CPU_top_with_dpic.scala 89:18]
  assign dpic_regs12 = back_end_io_o_dbg_arch_regs_12; // @[CPU_top_with_dpic.scala 90:18]
  assign dpic_regs13 = back_end_io_o_dbg_arch_regs_13; // @[CPU_top_with_dpic.scala 91:18]
  assign dpic_regs14 = back_end_io_o_dbg_arch_regs_14; // @[CPU_top_with_dpic.scala 92:18]
  assign dpic_regs15 = back_end_io_o_dbg_arch_regs_15; // @[CPU_top_with_dpic.scala 93:18]
  assign dpic_regs16 = back_end_io_o_dbg_arch_regs_16; // @[CPU_top_with_dpic.scala 94:18]
  assign dpic_regs17 = back_end_io_o_dbg_arch_regs_17; // @[CPU_top_with_dpic.scala 95:18]
  assign dpic_regs18 = back_end_io_o_dbg_arch_regs_18; // @[CPU_top_with_dpic.scala 96:18]
  assign dpic_regs19 = back_end_io_o_dbg_arch_regs_19; // @[CPU_top_with_dpic.scala 97:18]
  assign dpic_regs20 = back_end_io_o_dbg_arch_regs_20; // @[CPU_top_with_dpic.scala 98:18]
  assign dpic_regs21 = back_end_io_o_dbg_arch_regs_21; // @[CPU_top_with_dpic.scala 99:18]
  assign dpic_regs22 = back_end_io_o_dbg_arch_regs_22; // @[CPU_top_with_dpic.scala 100:18]
  assign dpic_regs23 = back_end_io_o_dbg_arch_regs_23; // @[CPU_top_with_dpic.scala 101:18]
  assign dpic_regs24 = back_end_io_o_dbg_arch_regs_24; // @[CPU_top_with_dpic.scala 102:18]
  assign dpic_regs25 = back_end_io_o_dbg_arch_regs_25; // @[CPU_top_with_dpic.scala 103:18]
  assign dpic_regs26 = back_end_io_o_dbg_arch_regs_26; // @[CPU_top_with_dpic.scala 104:18]
  assign dpic_regs27 = back_end_io_o_dbg_arch_regs_27; // @[CPU_top_with_dpic.scala 105:18]
  assign dpic_regs28 = back_end_io_o_dbg_arch_regs_28; // @[CPU_top_with_dpic.scala 106:18]
  assign dpic_regs29 = back_end_io_o_dbg_arch_regs_29; // @[CPU_top_with_dpic.scala 107:18]
  assign dpic_regs30 = back_end_io_o_dbg_arch_regs_30; // @[CPU_top_with_dpic.scala 108:18]
  assign dpic_regs31 = back_end_io_o_dbg_arch_regs_31; // @[CPU_top_with_dpic.scala 109:18]
  always @(posedge clock) begin
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_valid <= 1'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_valid <= back_end_io_o_branch_resolve_pack_valid; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_mispred <= 1'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_mispred <= back_end_io_o_branch_resolve_pack_mispred; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_taken <= 1'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_taken <= back_end_io_o_branch_resolve_pack_taken; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_pc <= 64'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_pc <= back_end_io_o_branch_resolve_pack_pc; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_target <= 64'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_target <= back_end_io_o_branch_resolve_pack_target; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_rob_idx <= 6'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_rob_idx <= back_end_io_o_branch_resolve_pack_rob_idx; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_prediction_valid <= 1'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_prediction_valid <= back_end_io_o_branch_resolve_pack_prediction_valid; // @[CPU_top_with_dpic.scala 28:28]
    end
    if (reset) begin // @[CPU_top_with_dpic.scala 27:41]
      last_branch_resolve_pack_branch_type <= 3'h0; // @[CPU_top_with_dpic.scala 27:41]
    end else begin
      last_branch_resolve_pack_branch_type <= back_end_io_o_branch_resolve_pack_branch_type; // @[CPU_top_with_dpic.scala 28:28]
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
  last_branch_resolve_pack_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  last_branch_resolve_pack_mispred = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  last_branch_resolve_pack_taken = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  last_branch_resolve_pack_pc = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  last_branch_resolve_pack_target = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  last_branch_resolve_pack_rob_idx = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  last_branch_resolve_pack_prediction_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  last_branch_resolve_pack_branch_type = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
