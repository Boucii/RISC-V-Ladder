module Ladder(
  input         clock,
  input         reset,
  output        io_icache_io_o_wen,
  output [63:0] io_icache_io_o_addr,
  input  [63:0] io_icache_io_i_data,
  input         io_icache_io_i_addr_ready,
  output        io_icache_io_o_addr_valid,
  input         io_icache_io_i_data_valid,
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
  input         io_i_interrupt
);
  wire  front_end_clock; // @[CPU_top.scala 18:25]
  wire  front_end_reset; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_icache_io_o_addr; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_icache_io_i_data; // @[CPU_top.scala 18:25]
  wire  front_end_io_icache_io_i_addr_ready; // @[CPU_top.scala 18:25]
  wire  front_end_io_icache_io_o_addr_valid; // @[CPU_top.scala 18:25]
  wire  front_end_io_icache_io_i_data_valid; // @[CPU_top.scala 18:25]
  wire  front_end_io_i_branch_resolve_pack_valid; // @[CPU_top.scala 18:25]
  wire  front_end_io_i_branch_resolve_pack_mispred; // @[CPU_top.scala 18:25]
  wire  front_end_io_i_branch_resolve_pack_taken; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_i_branch_resolve_pack_pc; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_i_branch_resolve_pack_target; // @[CPU_top.scala 18:25]
  wire  front_end_io_i_branch_resolve_pack_prediction_valid; // @[CPU_top.scala 18:25]
  wire  front_end_io_i_pc_redirect_valid; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_i_pc_redirect_target; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_ready; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_valid; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_bits_valids_0; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_bits_valids_1; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_o_fetch_pack_bits_pc; // @[CPU_top.scala 18:25]
  wire [31:0] front_end_io_o_fetch_pack_bits_insts_0; // @[CPU_top.scala 18:25]
  wire [31:0] front_end_io_o_fetch_pack_bits_insts_1; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[CPU_top.scala 18:25]
  wire [63:0] front_end_io_o_fetch_pack_bits_branch_predict_pack_target; // @[CPU_top.scala 18:25]
  wire [3:0] front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_select; // @[CPU_top.scala 18:25]
  wire  front_end_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[CPU_top.scala 18:25]
  wire  back_end_clock; // @[CPU_top.scala 19:24]
  wire  back_end_reset; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_ready; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_valid; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_bits_valids_0; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_bits_valids_1; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_i_fetch_pack_bits_pc; // @[CPU_top.scala 19:24]
  wire [31:0] back_end_io_i_fetch_pack_bits_insts_0; // @[CPU_top.scala 19:24]
  wire [31:0] back_end_io_i_fetch_pack_bits_insts_1; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_valid; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_i_fetch_pack_bits_branch_predict_pack_target; // @[CPU_top.scala 19:24]
  wire [3:0] back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_select; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_fetch_pack_bits_branch_predict_pack_taken; // @[CPU_top.scala 19:24]
  wire  back_end_io_o_branch_resolve_pack_valid; // @[CPU_top.scala 19:24]
  wire  back_end_io_o_branch_resolve_pack_mispred; // @[CPU_top.scala 19:24]
  wire  back_end_io_o_branch_resolve_pack_taken; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_o_branch_resolve_pack_pc; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_o_branch_resolve_pack_target; // @[CPU_top.scala 19:24]
  wire [7:0] back_end_io_o_branch_resolve_pack_rob_idx; // @[CPU_top.scala 19:24]
  wire  back_end_io_o_branch_resolve_pack_prediction_valid; // @[CPU_top.scala 19:24]
  wire [2:0] back_end_io_o_branch_resolve_pack_branch_type; // @[CPU_top.scala 19:24]
  wire  back_end_io_o_stall; // @[CPU_top.scala 19:24]
  wire  back_end_io_o_pc_redirect_valid; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_o_pc_redirect_target; // @[CPU_top.scala 19:24]
  wire  back_end_io_dcache_io_data_valid; // @[CPU_top.scala 19:24]
  wire  back_end_io_dcache_io_data_ready; // @[CPU_top.scala 19:24]
  wire  back_end_io_dcache_io_addr_valid; // @[CPU_top.scala 19:24]
  wire  back_end_io_dcache_io_addr_ready; // @[CPU_top.scala 19:24]
  wire  back_end_io_dcache_io_Mwout; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_dcache_io_Maddr; // @[CPU_top.scala 19:24]
  wire  back_end_io_dcache_io_Men; // @[CPU_top.scala 19:24]
  wire [31:0] back_end_io_dcache_io_Mlen; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_dcache_io_MdataIn; // @[CPU_top.scala 19:24]
  wire [63:0] back_end_io_dcache_io_MdataOut; // @[CPU_top.scala 19:24]
  wire  back_end_io_i_interrupt; // @[CPU_top.scala 19:24]
  Front_End front_end ( // @[CPU_top.scala 18:25]
    .clock(front_end_clock),
    .reset(front_end_reset),
    .io_icache_io_o_addr(front_end_io_icache_io_o_addr),
    .io_icache_io_i_data(front_end_io_icache_io_i_data),
    .io_icache_io_i_addr_ready(front_end_io_icache_io_i_addr_ready),
    .io_icache_io_o_addr_valid(front_end_io_icache_io_o_addr_valid),
    .io_icache_io_i_data_valid(front_end_io_icache_io_i_data_valid),
    .io_i_branch_resolve_pack_valid(front_end_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(front_end_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_taken(front_end_io_i_branch_resolve_pack_taken),
    .io_i_branch_resolve_pack_pc(front_end_io_i_branch_resolve_pack_pc),
    .io_i_branch_resolve_pack_target(front_end_io_i_branch_resolve_pack_target),
    .io_i_branch_resolve_pack_prediction_valid(front_end_io_i_branch_resolve_pack_prediction_valid),
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
  Back_End_With_Decode back_end ( // @[CPU_top.scala 19:24]
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
    .io_dcache_io_data_ready(back_end_io_dcache_io_data_ready),
    .io_dcache_io_addr_valid(back_end_io_dcache_io_addr_valid),
    .io_dcache_io_addr_ready(back_end_io_dcache_io_addr_ready),
    .io_dcache_io_Mwout(back_end_io_dcache_io_Mwout),
    .io_dcache_io_Maddr(back_end_io_dcache_io_Maddr),
    .io_dcache_io_Men(back_end_io_dcache_io_Men),
    .io_dcache_io_Mlen(back_end_io_dcache_io_Mlen),
    .io_dcache_io_MdataIn(back_end_io_dcache_io_MdataIn),
    .io_dcache_io_MdataOut(back_end_io_dcache_io_MdataOut),
    .io_i_interrupt(back_end_io_i_interrupt)
  );
  assign io_icache_io_o_wen = 1'h0; // @[CPU_top.scala 28:22]
  assign io_icache_io_o_addr = front_end_io_icache_io_o_addr; // @[CPU_top.scala 29:23]
  assign io_icache_io_o_addr_valid = front_end_io_icache_io_o_addr_valid; // @[CPU_top.scala 30:29]
  assign io_dcache_io_data_ready = back_end_io_dcache_io_data_ready; // @[CPU_top.scala 40:36]
  assign io_dcache_io_addr_valid = back_end_io_dcache_io_addr_valid; // @[CPU_top.scala 39:36]
  assign io_dcache_io_Mwout = back_end_io_dcache_io_Mwout; // @[CPU_top.scala 43:35]
  assign io_dcache_io_Maddr = back_end_io_dcache_io_Maddr; // @[CPU_top.scala 44:35]
  assign io_dcache_io_Men = back_end_io_dcache_io_Men; // @[CPU_top.scala 45:35]
  assign io_dcache_io_Mlen = back_end_io_dcache_io_Mlen; // @[CPU_top.scala 46:35]
  assign io_dcache_io_MdataOut = back_end_io_dcache_io_MdataOut; // @[CPU_top.scala 47:35]
  assign front_end_clock = clock;
  assign front_end_reset = reset;
  assign front_end_io_icache_io_i_data = io_icache_io_i_data; // @[CPU_top.scala 31:33]
  assign front_end_io_icache_io_i_addr_ready = io_icache_io_i_addr_ready; // @[CPU_top.scala 26:39]
  assign front_end_io_icache_io_i_data_valid = io_icache_io_i_data_valid; // @[CPU_top.scala 27:39]
  assign front_end_io_i_branch_resolve_pack_valid = back_end_io_o_branch_resolve_pack_valid; // @[CPU_top.scala 22:38]
  assign front_end_io_i_branch_resolve_pack_mispred = back_end_io_o_branch_resolve_pack_mispred; // @[CPU_top.scala 22:38]
  assign front_end_io_i_branch_resolve_pack_taken = back_end_io_o_branch_resolve_pack_taken; // @[CPU_top.scala 22:38]
  assign front_end_io_i_branch_resolve_pack_pc = back_end_io_o_branch_resolve_pack_pc; // @[CPU_top.scala 22:38]
  assign front_end_io_i_branch_resolve_pack_target = back_end_io_o_branch_resolve_pack_target; // @[CPU_top.scala 22:38]
  assign front_end_io_i_branch_resolve_pack_prediction_valid = back_end_io_o_branch_resolve_pack_prediction_valid; // @[CPU_top.scala 22:38]
  assign front_end_io_i_pc_redirect_valid = back_end_io_o_pc_redirect_valid; // @[CPU_top.scala 23:36]
  assign front_end_io_i_pc_redirect_target = back_end_io_o_pc_redirect_target; // @[CPU_top.scala 24:37]
  assign front_end_io_o_fetch_pack_ready = back_end_io_i_fetch_pack_ready; // @[CPU_top.scala 34:28]
  assign back_end_clock = clock;
  assign back_end_reset = reset;
  assign back_end_io_i_fetch_pack_valid = front_end_io_o_fetch_pack_valid; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_valids_0 = front_end_io_o_fetch_pack_bits_valids_0; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_valids_1 = front_end_io_o_fetch_pack_bits_valids_1; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_pc = front_end_io_o_fetch_pack_bits_pc; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_insts_0 = front_end_io_o_fetch_pack_bits_insts_0; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_insts_1 = front_end_io_o_fetch_pack_bits_insts_1; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_valid =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_target =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_target; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_branch_type =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_select =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_select; // @[CPU_top.scala 34:28]
  assign back_end_io_i_fetch_pack_bits_branch_predict_pack_taken =
    front_end_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[CPU_top.scala 34:28]
  assign back_end_io_dcache_io_data_valid = io_dcache_io_data_valid; // @[CPU_top.scala 37:37]
  assign back_end_io_dcache_io_addr_ready = io_dcache_io_addr_ready; // @[CPU_top.scala 41:36]
  assign back_end_io_dcache_io_MdataIn = io_dcache_io_MdataIn; // @[CPU_top.scala 38:37]
  assign back_end_io_i_interrupt = io_i_interrupt; // @[CPU_top.scala 35:27]
endmodule
