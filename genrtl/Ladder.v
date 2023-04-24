module Ladder(
  input          clock,
  input          reset,
  input          io_axi_master_readAddr_ready,
  output         io_axi_master_readAddr_valid,
  output [63:0]  io_axi_master_readAddr_bits_addr,
  output [2:0]   io_axi_master_readAddr_bits_prot,
  output         io_axi_master_readData_ready,
  input          io_axi_master_readData_valid,
  input  [127:0] io_axi_master_readData_bits_data,
  input  [1:0]   io_axi_master_readData_bits_resp,
  input          io_axi_master_writeAddr_ready,
  output         io_axi_master_writeAddr_valid,
  output [63:0]  io_axi_master_writeAddr_bits_addr,
  output [2:0]   io_axi_master_writeAddr_bits_prot,
  input          io_axi_master_writeData_ready,
  output         io_axi_master_writeData_valid,
  output [127:0] io_axi_master_writeData_bits_data,
  output [15:0]  io_axi_master_writeData_bits_strb,
  output         io_axi_master_writeResp_ready,
  input          io_axi_master_writeResp_valid,
  input  [1:0]   io_axi_master_writeResp_bits,
  input          io_i_interrupt,
  output         io_o_dbg_commit_packs_0_valid,
  output         io_o_dbg_commit_packs_0_uop_valid,
  output [31:0]  io_o_dbg_commit_packs_0_uop_pc,
  output [31:0]  io_o_dbg_commit_packs_0_uop_inst,
  output [6:0]   io_o_dbg_commit_packs_0_uop_func_code,
  output         io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid,
  output [63:0]  io_o_dbg_commit_packs_0_uop_branch_predict_pack_target,
  output [3:0]   io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type,
  output         io_o_dbg_commit_packs_0_uop_branch_predict_pack_select,
  output         io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken,
  output [6:0]   io_o_dbg_commit_packs_0_uop_phy_dst,
  output [6:0]   io_o_dbg_commit_packs_0_uop_stale_dst,
  output [4:0]   io_o_dbg_commit_packs_0_uop_arch_dst,
  output [2:0]   io_o_dbg_commit_packs_0_uop_inst_type,
  output         io_o_dbg_commit_packs_0_uop_regWen,
  output         io_o_dbg_commit_packs_0_uop_src1_valid,
  output [6:0]   io_o_dbg_commit_packs_0_uop_phy_rs1,
  output [4:0]   io_o_dbg_commit_packs_0_uop_arch_rs1,
  output         io_o_dbg_commit_packs_0_uop_src2_valid,
  output [6:0]   io_o_dbg_commit_packs_0_uop_phy_rs2,
  output [4:0]   io_o_dbg_commit_packs_0_uop_arch_rs2,
  output [3:0]   io_o_dbg_commit_packs_0_uop_rob_idx,
  output [63:0]  io_o_dbg_commit_packs_0_uop_imm,
  output [63:0]  io_o_dbg_commit_packs_0_uop_dst_value,
  output [63:0]  io_o_dbg_commit_packs_0_uop_src1_value,
  output [63:0]  io_o_dbg_commit_packs_0_uop_src2_value,
  output         io_o_dbg_commit_packs_0_uop_exception,
  output [2:0]   io_o_dbg_commit_packs_0_uop_op1_sel,
  output [2:0]   io_o_dbg_commit_packs_0_uop_op2_sel,
  output [4:0]   io_o_dbg_commit_packs_0_uop_alu_sel,
  output [3:0]   io_o_dbg_commit_packs_0_uop_branch_type,
  output [2:0]   io_o_dbg_commit_packs_0_uop_mem_type,
  output         io_o_dbg_commit_packs_1_valid,
  output         io_o_dbg_commit_packs_1_uop_valid,
  output [31:0]  io_o_dbg_commit_packs_1_uop_pc,
  output [31:0]  io_o_dbg_commit_packs_1_uop_inst,
  output [6:0]   io_o_dbg_commit_packs_1_uop_func_code,
  output         io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid,
  output [63:0]  io_o_dbg_commit_packs_1_uop_branch_predict_pack_target,
  output [3:0]   io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type,
  output         io_o_dbg_commit_packs_1_uop_branch_predict_pack_select,
  output         io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken,
  output [6:0]   io_o_dbg_commit_packs_1_uop_phy_dst,
  output [6:0]   io_o_dbg_commit_packs_1_uop_stale_dst,
  output [4:0]   io_o_dbg_commit_packs_1_uop_arch_dst,
  output [2:0]   io_o_dbg_commit_packs_1_uop_inst_type,
  output         io_o_dbg_commit_packs_1_uop_regWen,
  output         io_o_dbg_commit_packs_1_uop_src1_valid,
  output [6:0]   io_o_dbg_commit_packs_1_uop_phy_rs1,
  output [4:0]   io_o_dbg_commit_packs_1_uop_arch_rs1,
  output         io_o_dbg_commit_packs_1_uop_src2_valid,
  output [6:0]   io_o_dbg_commit_packs_1_uop_phy_rs2,
  output [4:0]   io_o_dbg_commit_packs_1_uop_arch_rs2,
  output [3:0]   io_o_dbg_commit_packs_1_uop_rob_idx,
  output [63:0]  io_o_dbg_commit_packs_1_uop_imm,
  output [63:0]  io_o_dbg_commit_packs_1_uop_dst_value,
  output [63:0]  io_o_dbg_commit_packs_1_uop_src1_value,
  output [63:0]  io_o_dbg_commit_packs_1_uop_src2_value,
  output         io_o_dbg_commit_packs_1_uop_exception,
  output [2:0]   io_o_dbg_commit_packs_1_uop_op1_sel,
  output [2:0]   io_o_dbg_commit_packs_1_uop_op2_sel,
  output [4:0]   io_o_dbg_commit_packs_1_uop_alu_sel,
  output [3:0]   io_o_dbg_commit_packs_1_uop_branch_type,
  output [2:0]   io_o_dbg_commit_packs_1_uop_mem_type
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
  wire  front_end_clock; // @[soc_top.scala 19:25]
  wire  front_end_reset; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_icache_io_o_addr; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_icache_io_i_data; // @[soc_top.scala 19:25]
  wire  front_end_io_icache_io_i_addr_ready; // @[soc_top.scala 19:25]
  wire  front_end_io_icache_io_o_addr_valid; // @[soc_top.scala 19:25]
  wire  front_end_io_icache_io_i_data_valid; // @[soc_top.scala 19:25]
  wire  front_end_io_icache_io_o_stall1; // @[soc_top.scala 19:25]
  wire  front_end_io_icache_io_o_stall2; // @[soc_top.scala 19:25]
  wire  front_end_io_i_branch_resolve_pack_valid; // @[soc_top.scala 19:25]
  wire  front_end_io_i_branch_resolve_pack_mispred; // @[soc_top.scala 19:25]
  wire  front_end_io_i_branch_resolve_pack_taken; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_i_branch_resolve_pack_pc; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_i_branch_resolve_pack_target; // @[soc_top.scala 19:25]
  wire  front_end_io_i_branch_resolve_pack_prediction_valid; // @[soc_top.scala 19:25]
  wire [2:0] front_end_io_i_branch_resolve_pack_branch_type; // @[soc_top.scala 19:25]
  wire  front_end_io_i_pc_redirect_valid; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_i_pc_redirect_target; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_ready; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_valid; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_bits_valids_0; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_bits_valids_1; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_o_fetch_pack_bits_pc; // @[soc_top.scala 19:25]
  wire [31:0] front_end_io_o_fetch_pack_bits_insts_0; // @[soc_top.scala 19:25]
  wire [31:0] front_end_io_o_fetch_pack_bits_insts_1; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[soc_top.scala 19:25]
  wire [63:0] front_end_io_o_fetch_pack_bits_branch_predict_pack_target; // @[soc_top.scala 19:25]
  wire [3:0] front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_select; // @[soc_top.scala 19:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[soc_top.scala 19:25]
  wire  back_end_clock; // @[soc_top.scala 20:24]
  wire  back_end_reset; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_ready; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_valid; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_bits_valids_0; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_bits_valids_1; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_i_fetch_pack_bits_pc; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_i_fetch_pack_bits_insts_0; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_i_fetch_pack_bits_insts_1; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_valid; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_i_fetch_pack_bits_branch_predict_pack_target; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_select; // @[soc_top.scala 20:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_taken; // @[soc_top.scala 20:24]
  wire  back_end_io_o_branch_resolve_pack_valid; // @[soc_top.scala 20:24]
  wire  back_end_io_o_branch_resolve_pack_mispred; // @[soc_top.scala 20:24]
  wire  back_end_io_o_branch_resolve_pack_taken; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_branch_resolve_pack_pc; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_branch_resolve_pack_target; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_branch_resolve_pack_rob_idx; // @[soc_top.scala 20:24]
  wire  back_end_io_o_branch_resolve_pack_prediction_valid; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_branch_resolve_pack_branch_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_stall; // @[soc_top.scala 20:24]
  wire  back_end_io_o_pc_redirect_valid; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_pc_redirect_target; // @[soc_top.scala 20:24]
  wire  back_end_io_dcache_io_data_valid; // @[soc_top.scala 20:24]
  wire  back_end_io_dcache_io_addr_ready; // @[soc_top.scala 20:24]
  wire  back_end_io_dcache_io_Mwout; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_dcache_io_Maddr; // @[soc_top.scala 20:24]
  wire  back_end_io_dcache_io_Men; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_dcache_io_Mlen; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_dcache_io_MdataIn; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_dcache_io_MdataOut; // @[soc_top.scala 20:24]
  wire  back_end_io_dcache_io_flush_done; // @[soc_top.scala 20:24]
  wire  back_end_io_dcache_io_flush; // @[soc_top.scala 20:24]
  wire  back_end_io_i_interrupt; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_valid; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_valid; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_0_uop_pc; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_0_uop_inst; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_func_code; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_target; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_select; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_phy_dst; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_stale_dst; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_arch_dst; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_inst_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_regWen; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_src1_valid; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_phy_rs1; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_arch_rs1; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_0_uop_src2_valid; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_0_uop_phy_rs2; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_arch_rs2; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_0_uop_rob_idx; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_imm; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_dst_value; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_src1_value; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_0_uop_src2_value; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_op1_sel; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_op2_sel; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_0_uop_alu_sel; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_0_uop_branch_type; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_0_uop_mem_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_valid; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_valid; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_1_uop_pc; // @[soc_top.scala 20:24]
  wire [31:0] back_end_io_o_dbg_commit_packs_1_uop_inst; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_func_code; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_target; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_select; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_phy_dst; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_stale_dst; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_arch_dst; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_inst_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_regWen; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_src1_valid; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_phy_rs1; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_arch_rs1; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_commit_packs_1_uop_src2_valid; // @[soc_top.scala 20:24]
  wire [6:0] back_end_io_o_dbg_commit_packs_1_uop_phy_rs2; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_arch_rs2; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_1_uop_rob_idx; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_imm; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_dst_value; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_src1_value; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_commit_packs_1_uop_src2_value; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_op1_sel; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_op2_sel; // @[soc_top.scala 20:24]
  wire [4:0] back_end_io_o_dbg_commit_packs_1_uop_alu_sel; // @[soc_top.scala 20:24]
  wire [3:0] back_end_io_o_dbg_commit_packs_1_uop_branch_type; // @[soc_top.scala 20:24]
  wire [2:0] back_end_io_o_dbg_commit_packs_1_uop_mem_type; // @[soc_top.scala 20:24]
  wire  back_end_io_o_dbg_stop; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_0; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_1; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_2; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_3; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_4; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_5; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_6; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_7; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_8; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_9; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_10; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_11; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_12; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_13; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_14; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_15; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_16; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_17; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_18; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_19; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_20; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_21; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_22; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_23; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_24; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_25; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_26; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_27; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_28; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_29; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_30; // @[soc_top.scala 20:24]
  wire [63:0] back_end_io_o_dbg_arch_regs_31; // @[soc_top.scala 20:24]
  wire  icache_clock; // @[soc_top.scala 21:22]
  wire  icache_reset; // @[soc_top.scala 21:22]
  wire  icache_io_cpu_if_o_wen; // @[soc_top.scala 21:22]
  wire [63:0] icache_io_cpu_if_o_addr; // @[soc_top.scala 21:22]
  wire [63:0] icache_io_cpu_if_i_data; // @[soc_top.scala 21:22]
  wire  icache_io_cpu_if_i_addr_ready; // @[soc_top.scala 21:22]
  wire  icache_io_cpu_if_o_addr_valid; // @[soc_top.scala 21:22]
  wire  icache_io_cpu_if_i_data_valid; // @[soc_top.scala 21:22]
  wire  icache_io_cpu_if_o_stall1; // @[soc_top.scala 21:22]
  wire  icache_io_cpu_if_o_stall2; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_readAddr_ready; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_readAddr_valid; // @[soc_top.scala 21:22]
  wire [63:0] icache_io_mem_master_readAddr_bits_addr; // @[soc_top.scala 21:22]
  wire [2:0] icache_io_mem_master_readAddr_bits_prot; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_readData_ready; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_readData_valid; // @[soc_top.scala 21:22]
  wire [127:0] icache_io_mem_master_readData_bits_data; // @[soc_top.scala 21:22]
  wire [1:0] icache_io_mem_master_readData_bits_resp; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_writeAddr_ready; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_writeAddr_valid; // @[soc_top.scala 21:22]
  wire [63:0] icache_io_mem_master_writeAddr_bits_addr; // @[soc_top.scala 21:22]
  wire [2:0] icache_io_mem_master_writeAddr_bits_prot; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_writeData_ready; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_writeData_valid; // @[soc_top.scala 21:22]
  wire [127:0] icache_io_mem_master_writeData_bits_data; // @[soc_top.scala 21:22]
  wire [15:0] icache_io_mem_master_writeData_bits_strb; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_writeResp_ready; // @[soc_top.scala 21:22]
  wire  icache_io_mem_master_writeResp_valid; // @[soc_top.scala 21:22]
  wire [1:0] icache_io_mem_master_writeResp_bits; // @[soc_top.scala 21:22]
  wire  dcache_clock; // @[soc_top.scala 22:22]
  wire  dcache_reset; // @[soc_top.scala 22:22]
  wire  dcache_io_cpu_mem_data_valid; // @[soc_top.scala 22:22]
  wire  dcache_io_cpu_mem_addr_ready; // @[soc_top.scala 22:22]
  wire  dcache_io_cpu_mem_Mwout; // @[soc_top.scala 22:22]
  wire [63:0] dcache_io_cpu_mem_Maddr; // @[soc_top.scala 22:22]
  wire  dcache_io_cpu_mem_Men; // @[soc_top.scala 22:22]
  wire [31:0] dcache_io_cpu_mem_Mlen; // @[soc_top.scala 22:22]
  wire [63:0] dcache_io_cpu_mem_MdataIn; // @[soc_top.scala 22:22]
  wire [63:0] dcache_io_cpu_mem_MdataOut; // @[soc_top.scala 22:22]
  wire  dcache_io_cpu_mem_flush_done; // @[soc_top.scala 22:22]
  wire  dcache_io_cpu_mem_flush; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_readAddr_valid; // @[soc_top.scala 22:22]
  wire [63:0] dcache_io_mem_master_readAddr_bits_addr; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_readData_ready; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_readData_valid; // @[soc_top.scala 22:22]
  wire [127:0] dcache_io_mem_master_readData_bits_data; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_writeAddr_ready; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_writeAddr_valid; // @[soc_top.scala 22:22]
  wire [63:0] dcache_io_mem_master_writeAddr_bits_addr; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_writeData_ready; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_writeData_valid; // @[soc_top.scala 22:22]
  wire [127:0] dcache_io_mem_master_writeData_bits_data; // @[soc_top.scala 22:22]
  wire [15:0] dcache_io_mem_master_writeData_bits_strb; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_writeResp_ready; // @[soc_top.scala 22:22]
  wire  dcache_io_mem_master_writeResp_valid; // @[soc_top.scala 22:22]
  wire  axi_arbiter_clock; // @[soc_top.scala 23:27]
  wire  axi_arbiter_reset; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_readAddr_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_readAddr_valid; // @[soc_top.scala 23:27]
  wire [63:0] axi_arbiter_io_in1_readAddr_bits_addr; // @[soc_top.scala 23:27]
  wire [2:0] axi_arbiter_io_in1_readAddr_bits_prot; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_readData_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_readData_valid; // @[soc_top.scala 23:27]
  wire [127:0] axi_arbiter_io_in1_readData_bits_data; // @[soc_top.scala 23:27]
  wire [1:0] axi_arbiter_io_in1_readData_bits_resp; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_writeAddr_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_writeAddr_valid; // @[soc_top.scala 23:27]
  wire [63:0] axi_arbiter_io_in1_writeAddr_bits_addr; // @[soc_top.scala 23:27]
  wire [2:0] axi_arbiter_io_in1_writeAddr_bits_prot; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_writeData_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_writeData_valid; // @[soc_top.scala 23:27]
  wire [127:0] axi_arbiter_io_in1_writeData_bits_data; // @[soc_top.scala 23:27]
  wire [15:0] axi_arbiter_io_in1_writeData_bits_strb; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_writeResp_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in1_writeResp_valid; // @[soc_top.scala 23:27]
  wire [1:0] axi_arbiter_io_in1_writeResp_bits; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_readAddr_valid; // @[soc_top.scala 23:27]
  wire [63:0] axi_arbiter_io_in2_readAddr_bits_addr; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_readData_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_readData_valid; // @[soc_top.scala 23:27]
  wire [127:0] axi_arbiter_io_in2_readData_bits_data; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_writeAddr_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_writeAddr_valid; // @[soc_top.scala 23:27]
  wire [63:0] axi_arbiter_io_in2_writeAddr_bits_addr; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_writeData_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_writeData_valid; // @[soc_top.scala 23:27]
  wire [127:0] axi_arbiter_io_in2_writeData_bits_data; // @[soc_top.scala 23:27]
  wire [15:0] axi_arbiter_io_in2_writeData_bits_strb; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_writeResp_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_in2_writeResp_valid; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_readAddr_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_readAddr_valid; // @[soc_top.scala 23:27]
  wire [63:0] axi_arbiter_io_out_readAddr_bits_addr; // @[soc_top.scala 23:27]
  wire [2:0] axi_arbiter_io_out_readAddr_bits_prot; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_readData_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_readData_valid; // @[soc_top.scala 23:27]
  wire [127:0] axi_arbiter_io_out_readData_bits_data; // @[soc_top.scala 23:27]
  wire [1:0] axi_arbiter_io_out_readData_bits_resp; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_writeAddr_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_writeAddr_valid; // @[soc_top.scala 23:27]
  wire [63:0] axi_arbiter_io_out_writeAddr_bits_addr; // @[soc_top.scala 23:27]
  wire [2:0] axi_arbiter_io_out_writeAddr_bits_prot; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_writeData_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_writeData_valid; // @[soc_top.scala 23:27]
  wire [127:0] axi_arbiter_io_out_writeData_bits_data; // @[soc_top.scala 23:27]
  wire [15:0] axi_arbiter_io_out_writeData_bits_strb; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_writeResp_ready; // @[soc_top.scala 23:27]
  wire  axi_arbiter_io_out_writeResp_valid; // @[soc_top.scala 23:27]
  wire [1:0] axi_arbiter_io_out_writeResp_bits; // @[soc_top.scala 23:27]
  wire  dpic_clk; // @[soc_top.scala 24:20]
  wire  dpic_rst; // @[soc_top.scala 24:20]
  wire  dpic_stop; // @[soc_top.scala 24:20]
  wire  dpic_axi_readAddr_ready; // @[soc_top.scala 24:20]
  wire  dpic_axi_readAddr_valid; // @[soc_top.scala 24:20]
  wire [63:0] dpic_axi_readAddr_bits_addr; // @[soc_top.scala 24:20]
  wire [2:0] dpic_axi_readAddr_bits_prot; // @[soc_top.scala 24:20]
  wire  dpic_axi_readData_ready; // @[soc_top.scala 24:20]
  wire  dpic_axi_readData_valid; // @[soc_top.scala 24:20]
  wire [127:0] dpic_axi_readData_bits_data; // @[soc_top.scala 24:20]
  wire [1:0] dpic_axi_readData_bits_resp; // @[soc_top.scala 24:20]
  wire  dpic_axi_writeAddr_ready; // @[soc_top.scala 24:20]
  wire  dpic_axi_writeAddr_valid; // @[soc_top.scala 24:20]
  wire [63:0] dpic_axi_writeAddr_bits_addr; // @[soc_top.scala 24:20]
  wire [2:0] dpic_axi_writeAddr_bits_prot; // @[soc_top.scala 24:20]
  wire  dpic_axi_writeData_ready; // @[soc_top.scala 24:20]
  wire  dpic_axi_writeData_valid; // @[soc_top.scala 24:20]
  wire [127:0] dpic_axi_writeData_bits_data; // @[soc_top.scala 24:20]
  wire [15:0] dpic_axi_writeData_bits_strb; // @[soc_top.scala 24:20]
  wire  dpic_axi_writeResp_ready; // @[soc_top.scala 24:20]
  wire  dpic_axi_writeResp_valid; // @[soc_top.scala 24:20]
  wire [1:0] dpic_axi_writeResp_bits; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs0; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs1; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs2; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs3; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs4; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs5; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs6; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs7; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs8; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs9; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs10; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs11; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs12; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs13; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs14; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs15; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs16; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs17; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs18; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs19; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs20; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs21; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs22; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs23; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs24; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs25; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs26; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs27; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs28; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs29; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs30; // @[soc_top.scala 24:20]
  wire [63:0] dpic_regs31; // @[soc_top.scala 24:20]
  reg  last_branch_resolve_pack_valid; // @[soc_top.scala 28:41]
  reg  last_branch_resolve_pack_mispred; // @[soc_top.scala 28:41]
  reg  last_branch_resolve_pack_taken; // @[soc_top.scala 28:41]
  reg [63:0] last_branch_resolve_pack_pc; // @[soc_top.scala 28:41]
  reg [63:0] last_branch_resolve_pack_target; // @[soc_top.scala 28:41]
  reg [3:0] last_branch_resolve_pack_rob_idx; // @[soc_top.scala 28:41]
  reg  last_branch_resolve_pack_prediction_valid; // @[soc_top.scala 28:41]
  reg [2:0] last_branch_resolve_pack_branch_type; // @[soc_top.scala 28:41]
  wire [138:0] _front_end_io_i_branch_resolve_pack_T = {last_branch_resolve_pack_valid,last_branch_resolve_pack_mispred,
    last_branch_resolve_pack_taken,last_branch_resolve_pack_pc,last_branch_resolve_pack_target,
    last_branch_resolve_pack_rob_idx,last_branch_resolve_pack_prediction_valid,last_branch_resolve_pack_branch_type}; // @[soc_top.scala 31:70]
  wire [138:0] _front_end_io_i_branch_resolve_pack_T_1 = {back_end_io_o_branch_resolve_pack_valid,
    back_end_io_o_branch_resolve_pack_mispred,back_end_io_o_branch_resolve_pack_taken,
    back_end_io_o_branch_resolve_pack_pc,back_end_io_o_branch_resolve_pack_target,
    back_end_io_o_branch_resolve_pack_rob_idx,back_end_io_o_branch_resolve_pack_prediction_valid,
    back_end_io_o_branch_resolve_pack_branch_type}; // @[soc_top.scala 31:115]
  Front_End front_end ( // @[soc_top.scala 19:25]
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
  Back_End_With_Decode back_end ( // @[soc_top.scala 20:24]
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
    .io_dcache_io_addr_ready(back_end_io_dcache_io_addr_ready),
    .io_dcache_io_Mwout(back_end_io_dcache_io_Mwout),
    .io_dcache_io_Maddr(back_end_io_dcache_io_Maddr),
    .io_dcache_io_Men(back_end_io_dcache_io_Men),
    .io_dcache_io_Mlen(back_end_io_dcache_io_Mlen),
    .io_dcache_io_MdataIn(back_end_io_dcache_io_MdataIn),
    .io_dcache_io_MdataOut(back_end_io_dcache_io_MdataOut),
    .io_dcache_io_flush_done(back_end_io_dcache_io_flush_done),
    .io_dcache_io_flush(back_end_io_dcache_io_flush),
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
  Icache icache ( // @[soc_top.scala 21:22]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_if_o_wen(icache_io_cpu_if_o_wen),
    .io_cpu_if_o_addr(icache_io_cpu_if_o_addr),
    .io_cpu_if_i_data(icache_io_cpu_if_i_data),
    .io_cpu_if_i_addr_ready(icache_io_cpu_if_i_addr_ready),
    .io_cpu_if_o_addr_valid(icache_io_cpu_if_o_addr_valid),
    .io_cpu_if_i_data_valid(icache_io_cpu_if_i_data_valid),
    .io_cpu_if_o_stall1(icache_io_cpu_if_o_stall1),
    .io_cpu_if_o_stall2(icache_io_cpu_if_o_stall2),
    .io_mem_master_readAddr_ready(icache_io_mem_master_readAddr_ready),
    .io_mem_master_readAddr_valid(icache_io_mem_master_readAddr_valid),
    .io_mem_master_readAddr_bits_addr(icache_io_mem_master_readAddr_bits_addr),
    .io_mem_master_readAddr_bits_prot(icache_io_mem_master_readAddr_bits_prot),
    .io_mem_master_readData_ready(icache_io_mem_master_readData_ready),
    .io_mem_master_readData_valid(icache_io_mem_master_readData_valid),
    .io_mem_master_readData_bits_data(icache_io_mem_master_readData_bits_data),
    .io_mem_master_readData_bits_resp(icache_io_mem_master_readData_bits_resp),
    .io_mem_master_writeAddr_ready(icache_io_mem_master_writeAddr_ready),
    .io_mem_master_writeAddr_valid(icache_io_mem_master_writeAddr_valid),
    .io_mem_master_writeAddr_bits_addr(icache_io_mem_master_writeAddr_bits_addr),
    .io_mem_master_writeAddr_bits_prot(icache_io_mem_master_writeAddr_bits_prot),
    .io_mem_master_writeData_ready(icache_io_mem_master_writeData_ready),
    .io_mem_master_writeData_valid(icache_io_mem_master_writeData_valid),
    .io_mem_master_writeData_bits_data(icache_io_mem_master_writeData_bits_data),
    .io_mem_master_writeData_bits_strb(icache_io_mem_master_writeData_bits_strb),
    .io_mem_master_writeResp_ready(icache_io_mem_master_writeResp_ready),
    .io_mem_master_writeResp_valid(icache_io_mem_master_writeResp_valid),
    .io_mem_master_writeResp_bits(icache_io_mem_master_writeResp_bits)
  );
  Dcache dcache ( // @[soc_top.scala 22:22]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_cpu_mem_data_valid(dcache_io_cpu_mem_data_valid),
    .io_cpu_mem_addr_ready(dcache_io_cpu_mem_addr_ready),
    .io_cpu_mem_Mwout(dcache_io_cpu_mem_Mwout),
    .io_cpu_mem_Maddr(dcache_io_cpu_mem_Maddr),
    .io_cpu_mem_Men(dcache_io_cpu_mem_Men),
    .io_cpu_mem_Mlen(dcache_io_cpu_mem_Mlen),
    .io_cpu_mem_MdataIn(dcache_io_cpu_mem_MdataIn),
    .io_cpu_mem_MdataOut(dcache_io_cpu_mem_MdataOut),
    .io_cpu_mem_flush_done(dcache_io_cpu_mem_flush_done),
    .io_cpu_mem_flush(dcache_io_cpu_mem_flush),
    .io_mem_master_readAddr_valid(dcache_io_mem_master_readAddr_valid),
    .io_mem_master_readAddr_bits_addr(dcache_io_mem_master_readAddr_bits_addr),
    .io_mem_master_readData_ready(dcache_io_mem_master_readData_ready),
    .io_mem_master_readData_valid(dcache_io_mem_master_readData_valid),
    .io_mem_master_readData_bits_data(dcache_io_mem_master_readData_bits_data),
    .io_mem_master_writeAddr_ready(dcache_io_mem_master_writeAddr_ready),
    .io_mem_master_writeAddr_valid(dcache_io_mem_master_writeAddr_valid),
    .io_mem_master_writeAddr_bits_addr(dcache_io_mem_master_writeAddr_bits_addr),
    .io_mem_master_writeData_ready(dcache_io_mem_master_writeData_ready),
    .io_mem_master_writeData_valid(dcache_io_mem_master_writeData_valid),
    .io_mem_master_writeData_bits_data(dcache_io_mem_master_writeData_bits_data),
    .io_mem_master_writeData_bits_strb(dcache_io_mem_master_writeData_bits_strb),
    .io_mem_master_writeResp_ready(dcache_io_mem_master_writeResp_ready),
    .io_mem_master_writeResp_valid(dcache_io_mem_master_writeResp_valid)
  );
  AXI4Lite_Arbiter axi_arbiter ( // @[soc_top.scala 23:27]
    .clock(axi_arbiter_clock),
    .reset(axi_arbiter_reset),
    .io_in1_readAddr_ready(axi_arbiter_io_in1_readAddr_ready),
    .io_in1_readAddr_valid(axi_arbiter_io_in1_readAddr_valid),
    .io_in1_readAddr_bits_addr(axi_arbiter_io_in1_readAddr_bits_addr),
    .io_in1_readAddr_bits_prot(axi_arbiter_io_in1_readAddr_bits_prot),
    .io_in1_readData_ready(axi_arbiter_io_in1_readData_ready),
    .io_in1_readData_valid(axi_arbiter_io_in1_readData_valid),
    .io_in1_readData_bits_data(axi_arbiter_io_in1_readData_bits_data),
    .io_in1_readData_bits_resp(axi_arbiter_io_in1_readData_bits_resp),
    .io_in1_writeAddr_ready(axi_arbiter_io_in1_writeAddr_ready),
    .io_in1_writeAddr_valid(axi_arbiter_io_in1_writeAddr_valid),
    .io_in1_writeAddr_bits_addr(axi_arbiter_io_in1_writeAddr_bits_addr),
    .io_in1_writeAddr_bits_prot(axi_arbiter_io_in1_writeAddr_bits_prot),
    .io_in1_writeData_ready(axi_arbiter_io_in1_writeData_ready),
    .io_in1_writeData_valid(axi_arbiter_io_in1_writeData_valid),
    .io_in1_writeData_bits_data(axi_arbiter_io_in1_writeData_bits_data),
    .io_in1_writeData_bits_strb(axi_arbiter_io_in1_writeData_bits_strb),
    .io_in1_writeResp_ready(axi_arbiter_io_in1_writeResp_ready),
    .io_in1_writeResp_valid(axi_arbiter_io_in1_writeResp_valid),
    .io_in1_writeResp_bits(axi_arbiter_io_in1_writeResp_bits),
    .io_in2_readAddr_valid(axi_arbiter_io_in2_readAddr_valid),
    .io_in2_readAddr_bits_addr(axi_arbiter_io_in2_readAddr_bits_addr),
    .io_in2_readData_ready(axi_arbiter_io_in2_readData_ready),
    .io_in2_readData_valid(axi_arbiter_io_in2_readData_valid),
    .io_in2_readData_bits_data(axi_arbiter_io_in2_readData_bits_data),
    .io_in2_writeAddr_ready(axi_arbiter_io_in2_writeAddr_ready),
    .io_in2_writeAddr_valid(axi_arbiter_io_in2_writeAddr_valid),
    .io_in2_writeAddr_bits_addr(axi_arbiter_io_in2_writeAddr_bits_addr),
    .io_in2_writeData_ready(axi_arbiter_io_in2_writeData_ready),
    .io_in2_writeData_valid(axi_arbiter_io_in2_writeData_valid),
    .io_in2_writeData_bits_data(axi_arbiter_io_in2_writeData_bits_data),
    .io_in2_writeData_bits_strb(axi_arbiter_io_in2_writeData_bits_strb),
    .io_in2_writeResp_ready(axi_arbiter_io_in2_writeResp_ready),
    .io_in2_writeResp_valid(axi_arbiter_io_in2_writeResp_valid),
    .io_out_readAddr_ready(axi_arbiter_io_out_readAddr_ready),
    .io_out_readAddr_valid(axi_arbiter_io_out_readAddr_valid),
    .io_out_readAddr_bits_addr(axi_arbiter_io_out_readAddr_bits_addr),
    .io_out_readAddr_bits_prot(axi_arbiter_io_out_readAddr_bits_prot),
    .io_out_readData_ready(axi_arbiter_io_out_readData_ready),
    .io_out_readData_valid(axi_arbiter_io_out_readData_valid),
    .io_out_readData_bits_data(axi_arbiter_io_out_readData_bits_data),
    .io_out_readData_bits_resp(axi_arbiter_io_out_readData_bits_resp),
    .io_out_writeAddr_ready(axi_arbiter_io_out_writeAddr_ready),
    .io_out_writeAddr_valid(axi_arbiter_io_out_writeAddr_valid),
    .io_out_writeAddr_bits_addr(axi_arbiter_io_out_writeAddr_bits_addr),
    .io_out_writeAddr_bits_prot(axi_arbiter_io_out_writeAddr_bits_prot),
    .io_out_writeData_ready(axi_arbiter_io_out_writeData_ready),
    .io_out_writeData_valid(axi_arbiter_io_out_writeData_valid),
    .io_out_writeData_bits_data(axi_arbiter_io_out_writeData_bits_data),
    .io_out_writeData_bits_strb(axi_arbiter_io_out_writeData_bits_strb),
    .io_out_writeResp_ready(axi_arbiter_io_out_writeResp_ready),
    .io_out_writeResp_valid(axi_arbiter_io_out_writeResp_valid),
    .io_out_writeResp_bits(axi_arbiter_io_out_writeResp_bits)
  );
  dpic_axi_ver dpic ( // @[soc_top.scala 24:20]
    .clk(dpic_clk),
    .rst(dpic_rst),
    .stop(dpic_stop),
    .axi_readAddr_ready(dpic_axi_readAddr_ready),
    .axi_readAddr_valid(dpic_axi_readAddr_valid),
    .axi_readAddr_bits_addr(dpic_axi_readAddr_bits_addr),
    .axi_readAddr_bits_prot(dpic_axi_readAddr_bits_prot),
    .axi_readData_ready(dpic_axi_readData_ready),
    .axi_readData_valid(dpic_axi_readData_valid),
    .axi_readData_bits_data(dpic_axi_readData_bits_data),
    .axi_readData_bits_resp(dpic_axi_readData_bits_resp),
    .axi_writeAddr_ready(dpic_axi_writeAddr_ready),
    .axi_writeAddr_valid(dpic_axi_writeAddr_valid),
    .axi_writeAddr_bits_addr(dpic_axi_writeAddr_bits_addr),
    .axi_writeAddr_bits_prot(dpic_axi_writeAddr_bits_prot),
    .axi_writeData_ready(dpic_axi_writeData_ready),
    .axi_writeData_valid(dpic_axi_writeData_valid),
    .axi_writeData_bits_data(dpic_axi_writeData_bits_data),
    .axi_writeData_bits_strb(dpic_axi_writeData_bits_strb),
    .axi_writeResp_ready(dpic_axi_writeResp_ready),
    .axi_writeResp_valid(dpic_axi_writeResp_valid),
    .axi_writeResp_bits(dpic_axi_writeResp_bits),
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
  assign io_axi_master_readAddr_valid = axi_arbiter_io_out_readAddr_valid; // @[soc_top.scala 78:22]
  assign io_axi_master_readAddr_bits_addr = axi_arbiter_io_out_readAddr_bits_addr; // @[soc_top.scala 78:22]
  assign io_axi_master_readAddr_bits_prot = axi_arbiter_io_out_readAddr_bits_prot; // @[soc_top.scala 78:22]
  assign io_axi_master_readData_ready = axi_arbiter_io_out_readData_ready; // @[soc_top.scala 78:22]
  assign io_axi_master_writeAddr_valid = axi_arbiter_io_out_writeAddr_valid; // @[soc_top.scala 78:22]
  assign io_axi_master_writeAddr_bits_addr = axi_arbiter_io_out_writeAddr_bits_addr; // @[soc_top.scala 78:22]
  assign io_axi_master_writeAddr_bits_prot = axi_arbiter_io_out_writeAddr_bits_prot; // @[soc_top.scala 78:22]
  assign io_axi_master_writeData_valid = axi_arbiter_io_out_writeData_valid; // @[soc_top.scala 78:22]
  assign io_axi_master_writeData_bits_data = axi_arbiter_io_out_writeData_bits_data; // @[soc_top.scala 78:22]
  assign io_axi_master_writeData_bits_strb = axi_arbiter_io_out_writeData_bits_strb; // @[soc_top.scala 78:22]
  assign io_axi_master_writeResp_ready = axi_arbiter_io_out_writeResp_ready; // @[soc_top.scala 78:22]
  assign io_o_dbg_commit_packs_0_valid = back_end_io_o_dbg_commit_packs_0_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_valid = back_end_io_o_dbg_commit_packs_0_uop_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_pc = back_end_io_o_dbg_commit_packs_0_uop_pc; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_inst = back_end_io_o_dbg_commit_packs_0_uop_inst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_func_code = back_end_io_o_dbg_commit_packs_0_uop_func_code; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_target =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_target; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_branch_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_select =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_select; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken =
    back_end_io_o_dbg_commit_packs_0_uop_branch_predict_pack_taken; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_phy_dst = back_end_io_o_dbg_commit_packs_0_uop_phy_dst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_stale_dst = back_end_io_o_dbg_commit_packs_0_uop_stale_dst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_arch_dst = back_end_io_o_dbg_commit_packs_0_uop_arch_dst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_inst_type = back_end_io_o_dbg_commit_packs_0_uop_inst_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_regWen = back_end_io_o_dbg_commit_packs_0_uop_regWen; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_src1_valid = back_end_io_o_dbg_commit_packs_0_uop_src1_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_phy_rs1 = back_end_io_o_dbg_commit_packs_0_uop_phy_rs1; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_arch_rs1 = back_end_io_o_dbg_commit_packs_0_uop_arch_rs1; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_src2_valid = back_end_io_o_dbg_commit_packs_0_uop_src2_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_phy_rs2 = back_end_io_o_dbg_commit_packs_0_uop_phy_rs2; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_arch_rs2 = back_end_io_o_dbg_commit_packs_0_uop_arch_rs2; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_rob_idx = back_end_io_o_dbg_commit_packs_0_uop_rob_idx; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_imm = back_end_io_o_dbg_commit_packs_0_uop_imm; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_dst_value = back_end_io_o_dbg_commit_packs_0_uop_dst_value; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_src1_value = back_end_io_o_dbg_commit_packs_0_uop_src1_value; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_src2_value = back_end_io_o_dbg_commit_packs_0_uop_src2_value; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_exception = 1'h0; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_op1_sel = back_end_io_o_dbg_commit_packs_0_uop_op1_sel; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_op2_sel = back_end_io_o_dbg_commit_packs_0_uop_op2_sel; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_alu_sel = back_end_io_o_dbg_commit_packs_0_uop_alu_sel; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_branch_type = back_end_io_o_dbg_commit_packs_0_uop_branch_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_0_uop_mem_type = back_end_io_o_dbg_commit_packs_0_uop_mem_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_valid = back_end_io_o_dbg_commit_packs_1_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_valid = back_end_io_o_dbg_commit_packs_1_uop_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_pc = back_end_io_o_dbg_commit_packs_1_uop_pc; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_inst = back_end_io_o_dbg_commit_packs_1_uop_inst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_func_code = back_end_io_o_dbg_commit_packs_1_uop_func_code; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_target =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_target; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_branch_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_select =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_select; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken =
    back_end_io_o_dbg_commit_packs_1_uop_branch_predict_pack_taken; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_phy_dst = back_end_io_o_dbg_commit_packs_1_uop_phy_dst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_stale_dst = back_end_io_o_dbg_commit_packs_1_uop_stale_dst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_arch_dst = back_end_io_o_dbg_commit_packs_1_uop_arch_dst; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_inst_type = back_end_io_o_dbg_commit_packs_1_uop_inst_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_regWen = back_end_io_o_dbg_commit_packs_1_uop_regWen; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_src1_valid = back_end_io_o_dbg_commit_packs_1_uop_src1_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_phy_rs1 = back_end_io_o_dbg_commit_packs_1_uop_phy_rs1; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_arch_rs1 = back_end_io_o_dbg_commit_packs_1_uop_arch_rs1; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_src2_valid = back_end_io_o_dbg_commit_packs_1_uop_src2_valid; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_phy_rs2 = back_end_io_o_dbg_commit_packs_1_uop_phy_rs2; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_arch_rs2 = back_end_io_o_dbg_commit_packs_1_uop_arch_rs2; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_rob_idx = back_end_io_o_dbg_commit_packs_1_uop_rob_idx; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_imm = back_end_io_o_dbg_commit_packs_1_uop_imm; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_dst_value = back_end_io_o_dbg_commit_packs_1_uop_dst_value; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_src1_value = back_end_io_o_dbg_commit_packs_1_uop_src1_value; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_src2_value = back_end_io_o_dbg_commit_packs_1_uop_src2_value; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_exception = 1'h0; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_op1_sel = back_end_io_o_dbg_commit_packs_1_uop_op1_sel; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_op2_sel = back_end_io_o_dbg_commit_packs_1_uop_op2_sel; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_alu_sel = back_end_io_o_dbg_commit_packs_1_uop_alu_sel; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_branch_type = back_end_io_o_dbg_commit_packs_1_uop_branch_type; // @[soc_top.scala 68:25]
  assign io_o_dbg_commit_packs_1_uop_mem_type = back_end_io_o_dbg_commit_packs_1_uop_mem_type; // @[soc_top.scala 68:25]
  assign front_end_clock = clock;
  assign front_end_reset = reset;
  assign front_end_io_icache_io_i_data = icache_io_cpu_if_i_data; // @[soc_top.scala 71:20]
  assign front_end_io_icache_io_i_addr_ready = icache_io_cpu_if_i_addr_ready; // @[soc_top.scala 71:20]
  assign front_end_io_icache_io_i_data_valid = icache_io_cpu_if_i_data_valid; // @[soc_top.scala 71:20]
  assign front_end_io_i_branch_resolve_pack_valid = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_valid; // @[soc_top.scala 31:44]
  assign front_end_io_i_branch_resolve_pack_mispred = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_mispred; // @[soc_top.scala 31:44]
  assign front_end_io_i_branch_resolve_pack_taken = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_taken; // @[soc_top.scala 31:44]
  assign front_end_io_i_branch_resolve_pack_pc = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 64'h0 : back_end_io_o_branch_resolve_pack_pc; // @[soc_top.scala 31:44]
  assign front_end_io_i_branch_resolve_pack_target = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 64'h0 : back_end_io_o_branch_resolve_pack_target; // @[soc_top.scala 31:44]
  assign front_end_io_i_branch_resolve_pack_prediction_valid = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 1'h0 : back_end_io_o_branch_resolve_pack_prediction_valid; // @[soc_top.scala 31:44]
  assign front_end_io_i_branch_resolve_pack_branch_type = _front_end_io_i_branch_resolve_pack_T ==
    _front_end_io_i_branch_resolve_pack_T_1 ? 3'h0 : back_end_io_o_branch_resolve_pack_branch_type; // @[soc_top.scala 31:44]
  assign front_end_io_i_pc_redirect_valid = back_end_io_o_pc_redirect_valid; // @[soc_top.scala 33:36]
  assign front_end_io_i_pc_redirect_target = back_end_io_o_pc_redirect_target; // @[soc_top.scala 34:37]
  assign front_end_io_o_fetch_pack_ready = back_end_io_i_fetch_pack_ready; // @[soc_top.scala 53:28]
  assign back_end_clock = clock;
  assign back_end_reset = reset;
  assign back_end_io_i_fetch_pack_valid = front_end_io_o_fetch_pack_valid; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_valids_0 = front_end_io_o_fetch_pack_bits_valids_0; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_valids_1 = front_end_io_o_fetch_pack_bits_valids_1; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_pc = front_end_io_o_fetch_pack_bits_pc; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_insts_0 = front_end_io_o_fetch_pack_bits_insts_0; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_insts_1 = front_end_io_o_fetch_pack_bits_insts_1; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_valid =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_target =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_target; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_select =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_select; // @[soc_top.scala 53:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_taken =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[soc_top.scala 53:28]
  assign back_end_io_dcache_io_data_valid = dcache_io_cpu_mem_data_valid; // @[soc_top.scala 72:21]
  assign back_end_io_dcache_io_addr_ready = dcache_io_cpu_mem_addr_ready; // @[soc_top.scala 72:21]
  assign back_end_io_dcache_io_MdataIn = dcache_io_cpu_mem_MdataIn; // @[soc_top.scala 72:21]
  assign back_end_io_dcache_io_flush_done = dcache_io_cpu_mem_flush_done; // @[soc_top.scala 72:21]
  assign back_end_io_i_interrupt = io_i_interrupt; // @[soc_top.scala 54:27]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_cpu_if_o_wen = 1'h0; // @[soc_top.scala 71:20]
  assign icache_io_cpu_if_o_addr = front_end_io_icache_io_o_addr; // @[soc_top.scala 71:20]
  assign icache_io_cpu_if_o_addr_valid = front_end_io_icache_io_o_addr_valid; // @[soc_top.scala 71:20]
  assign icache_io_cpu_if_o_stall1 = front_end_io_icache_io_o_stall1; // @[soc_top.scala 71:20]
  assign icache_io_cpu_if_o_stall2 = front_end_io_icache_io_o_stall2; // @[soc_top.scala 71:20]
  assign icache_io_mem_master_readAddr_ready = axi_arbiter_io_in1_readAddr_ready; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_readData_valid = axi_arbiter_io_in1_readData_valid; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_readData_bits_data = axi_arbiter_io_in1_readData_bits_data; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_readData_bits_resp = axi_arbiter_io_in1_readData_bits_resp; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_writeAddr_ready = axi_arbiter_io_in1_writeAddr_ready; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_writeData_ready = axi_arbiter_io_in1_writeData_ready; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_writeResp_valid = axi_arbiter_io_in1_writeResp_valid; // @[soc_top.scala 74:22]
  assign icache_io_mem_master_writeResp_bits = axi_arbiter_io_in1_writeResp_bits; // @[soc_top.scala 74:22]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_cpu_mem_Mwout = back_end_io_dcache_io_Mwout; // @[soc_top.scala 72:21]
  assign dcache_io_cpu_mem_Maddr = back_end_io_dcache_io_Maddr; // @[soc_top.scala 72:21]
  assign dcache_io_cpu_mem_Men = back_end_io_dcache_io_Men; // @[soc_top.scala 72:21]
  assign dcache_io_cpu_mem_Mlen = back_end_io_dcache_io_Mlen; // @[soc_top.scala 72:21]
  assign dcache_io_cpu_mem_MdataOut = back_end_io_dcache_io_MdataOut; // @[soc_top.scala 72:21]
  assign dcache_io_cpu_mem_flush = back_end_io_dcache_io_flush; // @[soc_top.scala 72:21]
  assign dcache_io_mem_master_readData_valid = axi_arbiter_io_in2_readData_valid; // @[soc_top.scala 75:22]
  assign dcache_io_mem_master_readData_bits_data = axi_arbiter_io_in2_readData_bits_data; // @[soc_top.scala 75:22]
  assign dcache_io_mem_master_writeAddr_ready = axi_arbiter_io_in2_writeAddr_ready; // @[soc_top.scala 75:22]
  assign dcache_io_mem_master_writeData_ready = axi_arbiter_io_in2_writeData_ready; // @[soc_top.scala 75:22]
  assign dcache_io_mem_master_writeResp_valid = axi_arbiter_io_in2_writeResp_valid; // @[soc_top.scala 75:22]
  assign axi_arbiter_clock = clock;
  assign axi_arbiter_reset = reset;
  assign axi_arbiter_io_in1_readAddr_valid = icache_io_mem_master_readAddr_valid; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_readAddr_bits_addr = icache_io_mem_master_readAddr_bits_addr; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_readAddr_bits_prot = icache_io_mem_master_readAddr_bits_prot; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_readData_ready = icache_io_mem_master_readData_ready; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeAddr_valid = icache_io_mem_master_writeAddr_valid; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeAddr_bits_addr = icache_io_mem_master_writeAddr_bits_addr; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeAddr_bits_prot = icache_io_mem_master_writeAddr_bits_prot; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeData_valid = icache_io_mem_master_writeData_valid; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeData_bits_data = icache_io_mem_master_writeData_bits_data; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeData_bits_strb = icache_io_mem_master_writeData_bits_strb; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in1_writeResp_ready = icache_io_mem_master_writeResp_ready; // @[soc_top.scala 74:22]
  assign axi_arbiter_io_in2_readAddr_valid = dcache_io_mem_master_readAddr_valid; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_readAddr_bits_addr = dcache_io_mem_master_readAddr_bits_addr; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_readData_ready = dcache_io_mem_master_readData_ready; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_writeAddr_valid = dcache_io_mem_master_writeAddr_valid; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_writeAddr_bits_addr = dcache_io_mem_master_writeAddr_bits_addr; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_writeData_valid = dcache_io_mem_master_writeData_valid; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_writeData_bits_data = dcache_io_mem_master_writeData_bits_data; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_writeData_bits_strb = dcache_io_mem_master_writeData_bits_strb; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_in2_writeResp_ready = dcache_io_mem_master_writeResp_ready; // @[soc_top.scala 75:22]
  assign axi_arbiter_io_out_readAddr_ready = dpic_axi_readAddr_ready; // @[soc_top.scala 86:41]
  assign axi_arbiter_io_out_readData_valid = dpic_axi_readData_valid; // @[soc_top.scala 87:41]
  assign axi_arbiter_io_out_readData_bits_data = dpic_axi_readData_bits_data; // @[soc_top.scala 88:41]
  assign axi_arbiter_io_out_readData_bits_resp = dpic_axi_readData_bits_resp; // @[soc_top.scala 89:41]
  assign axi_arbiter_io_out_writeAddr_ready = dpic_axi_writeAddr_ready; // @[soc_top.scala 90:41]
  assign axi_arbiter_io_out_writeData_ready = dpic_axi_writeData_ready; // @[soc_top.scala 91:41]
  assign axi_arbiter_io_out_writeResp_valid = dpic_axi_writeResp_valid; // @[soc_top.scala 92:41]
  assign axi_arbiter_io_out_writeResp_bits = dpic_axi_writeResp_bits; // @[soc_top.scala 93:41]
  assign dpic_clk = clock; // @[soc_top.scala 81:15]
  assign dpic_rst = reset; // @[soc_top.scala 82:15]
  assign dpic_stop = back_end_io_o_dbg_stop; // @[soc_top.scala 83:16]
  assign dpic_axi_readAddr_valid = axi_arbiter_io_out_readAddr_valid; // @[soc_top.scala 95:36]
  assign dpic_axi_readAddr_bits_addr = axi_arbiter_io_out_readAddr_bits_addr; // @[soc_top.scala 96:36]
  assign dpic_axi_readAddr_bits_prot = axi_arbiter_io_out_readAddr_bits_prot; // @[soc_top.scala 97:36]
  assign dpic_axi_readData_ready = axi_arbiter_io_out_readData_ready; // @[soc_top.scala 98:36]
  assign dpic_axi_writeAddr_valid = axi_arbiter_io_out_writeAddr_valid; // @[soc_top.scala 99:36]
  assign dpic_axi_writeAddr_bits_addr = axi_arbiter_io_out_writeAddr_bits_addr; // @[soc_top.scala 100:36]
  assign dpic_axi_writeAddr_bits_prot = axi_arbiter_io_out_writeAddr_bits_prot; // @[soc_top.scala 101:36]
  assign dpic_axi_writeData_valid = axi_arbiter_io_out_writeData_valid; // @[soc_top.scala 102:36]
  assign dpic_axi_writeData_bits_data = axi_arbiter_io_out_writeData_bits_data; // @[soc_top.scala 103:36]
  assign dpic_axi_writeData_bits_strb = axi_arbiter_io_out_writeData_bits_strb; // @[soc_top.scala 104:36]
  assign dpic_axi_writeResp_ready = axi_arbiter_io_out_writeResp_ready; // @[soc_top.scala 105:36]
  assign dpic_regs0 = back_end_io_o_dbg_arch_regs_0; // @[soc_top.scala 115:18]
  assign dpic_regs1 = back_end_io_o_dbg_arch_regs_1; // @[soc_top.scala 116:18]
  assign dpic_regs2 = back_end_io_o_dbg_arch_regs_2; // @[soc_top.scala 117:18]
  assign dpic_regs3 = back_end_io_o_dbg_arch_regs_3; // @[soc_top.scala 118:18]
  assign dpic_regs4 = back_end_io_o_dbg_arch_regs_4; // @[soc_top.scala 119:18]
  assign dpic_regs5 = back_end_io_o_dbg_arch_regs_5; // @[soc_top.scala 120:18]
  assign dpic_regs6 = back_end_io_o_dbg_arch_regs_6; // @[soc_top.scala 121:18]
  assign dpic_regs7 = back_end_io_o_dbg_arch_regs_7; // @[soc_top.scala 122:18]
  assign dpic_regs8 = back_end_io_o_dbg_arch_regs_8; // @[soc_top.scala 123:18]
  assign dpic_regs9 = back_end_io_o_dbg_arch_regs_9; // @[soc_top.scala 124:18]
  assign dpic_regs10 = back_end_io_o_dbg_arch_regs_10; // @[soc_top.scala 125:18]
  assign dpic_regs11 = back_end_io_o_dbg_arch_regs_11; // @[soc_top.scala 126:18]
  assign dpic_regs12 = back_end_io_o_dbg_arch_regs_12; // @[soc_top.scala 127:18]
  assign dpic_regs13 = back_end_io_o_dbg_arch_regs_13; // @[soc_top.scala 128:18]
  assign dpic_regs14 = back_end_io_o_dbg_arch_regs_14; // @[soc_top.scala 129:18]
  assign dpic_regs15 = back_end_io_o_dbg_arch_regs_15; // @[soc_top.scala 130:18]
  assign dpic_regs16 = back_end_io_o_dbg_arch_regs_16; // @[soc_top.scala 131:18]
  assign dpic_regs17 = back_end_io_o_dbg_arch_regs_17; // @[soc_top.scala 132:18]
  assign dpic_regs18 = back_end_io_o_dbg_arch_regs_18; // @[soc_top.scala 133:18]
  assign dpic_regs19 = back_end_io_o_dbg_arch_regs_19; // @[soc_top.scala 134:18]
  assign dpic_regs20 = back_end_io_o_dbg_arch_regs_20; // @[soc_top.scala 135:18]
  assign dpic_regs21 = back_end_io_o_dbg_arch_regs_21; // @[soc_top.scala 136:18]
  assign dpic_regs22 = back_end_io_o_dbg_arch_regs_22; // @[soc_top.scala 137:18]
  assign dpic_regs23 = back_end_io_o_dbg_arch_regs_23; // @[soc_top.scala 138:18]
  assign dpic_regs24 = back_end_io_o_dbg_arch_regs_24; // @[soc_top.scala 139:18]
  assign dpic_regs25 = back_end_io_o_dbg_arch_regs_25; // @[soc_top.scala 140:18]
  assign dpic_regs26 = back_end_io_o_dbg_arch_regs_26; // @[soc_top.scala 141:18]
  assign dpic_regs27 = back_end_io_o_dbg_arch_regs_27; // @[soc_top.scala 142:18]
  assign dpic_regs28 = back_end_io_o_dbg_arch_regs_28; // @[soc_top.scala 143:18]
  assign dpic_regs29 = back_end_io_o_dbg_arch_regs_29; // @[soc_top.scala 144:18]
  assign dpic_regs30 = back_end_io_o_dbg_arch_regs_30; // @[soc_top.scala 145:18]
  assign dpic_regs31 = back_end_io_o_dbg_arch_regs_31; // @[soc_top.scala 146:18]
  always @(posedge clock) begin
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_valid <= 1'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_valid <= back_end_io_o_branch_resolve_pack_valid; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_mispred <= 1'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_mispred <= back_end_io_o_branch_resolve_pack_mispred; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_taken <= 1'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_taken <= back_end_io_o_branch_resolve_pack_taken; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_pc <= 64'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_pc <= back_end_io_o_branch_resolve_pack_pc; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_target <= 64'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_target <= back_end_io_o_branch_resolve_pack_target; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_rob_idx <= 4'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_rob_idx <= back_end_io_o_branch_resolve_pack_rob_idx; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_prediction_valid <= 1'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_prediction_valid <= back_end_io_o_branch_resolve_pack_prediction_valid; // @[soc_top.scala 29:28]
    end
    if (reset) begin // @[soc_top.scala 28:41]
      last_branch_resolve_pack_branch_type <= 3'h0; // @[soc_top.scala 28:41]
    end else begin
      last_branch_resolve_pack_branch_type <= back_end_io_o_branch_resolve_pack_branch_type; // @[soc_top.scala 29:28]
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
  last_branch_resolve_pack_rob_idx = _RAND_5[3:0];
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
