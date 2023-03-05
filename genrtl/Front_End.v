module Front_End(
  input         clock,
  input         reset,
  output [63:0] io_icache_io_o_addr,
  input  [63:0] io_icache_io_i_data,
  input         io_icache_io_i_addr_ready,
  output        io_icache_io_o_addr_valid,
  input         io_icache_io_i_data_valid,
  output        io_icache_io_o_stall1,
  output        io_icache_io_o_stall2,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  input         io_i_branch_resolve_pack_taken,
  input  [63:0] io_i_branch_resolve_pack_pc,
  input  [63:0] io_i_branch_resolve_pack_target,
  input  [6:0]  io_i_branch_resolve_pack_rob_idx,
  input         io_i_branch_resolve_pack_prediction_valid,
  input  [2:0]  io_i_branch_resolve_pack_branch_type,
  input         io_i_pc_redirect_valid,
  input  [63:0] io_i_pc_redirect_target,
  input         io_o_fetch_pack_ready,
  output        io_o_fetch_pack_valid,
  output        io_o_fetch_pack_bits_valids_0,
  output        io_o_fetch_pack_bits_valids_1,
  output [63:0] io_o_fetch_pack_bits_pc,
  output [31:0] io_o_fetch_pack_bits_insts_0,
  output [31:0] io_o_fetch_pack_bits_insts_1,
  output        io_o_fetch_pack_bits_branch_predict_pack_valid,
  output [63:0] io_o_fetch_pack_bits_branch_predict_pack_target,
  output [3:0]  io_o_fetch_pack_bits_branch_predict_pack_branch_type,
  output        io_o_fetch_pack_bits_branch_predict_pack_select,
  output        io_o_fetch_pack_bits_branch_predict_pack_taken
);
  wire  pc_gen_clock; // @[front_end.scala 26:24]
  wire  pc_gen_reset; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_stall; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_pc_redirect_valid; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_pc_redirect_target; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_predict_pack_valid; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_branch_predict_pack_target; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_predict_pack_select; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_predict_pack_taken; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_presolve_pack_valid; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_presolve_pack_taken; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_branch_presolve_pack_pc; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_resolve_pack_valid; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_resolve_pack_mispred; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_branch_resolve_pack_target; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_o_pc; // @[front_end.scala 26:24]
  wire  bpu_clock; // @[front_end.scala 27:21]
  wire  bpu_reset; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_addr; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_valid; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_mispred; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_taken; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_branch_resolve_pack_pc; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_branch_resolve_pack_target; // @[front_end.scala 27:21]
  wire [6:0] bpu_io_i_branch_resolve_pack_rob_idx; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_prediction_valid; // @[front_end.scala 27:21]
  wire [2:0] bpu_io_i_branch_resolve_pack_branch_type; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_presolve_pack_valid; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_presolve_pack_taken; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_branch_presolve_pack_pc; // @[front_end.scala 27:21]
  wire  bpu_io_o_branch_predict_pack_valid; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_o_branch_predict_pack_target; // @[front_end.scala 27:21]
  wire [3:0] bpu_io_o_branch_predict_pack_branch_type; // @[front_end.scala 27:21]
  wire  bpu_io_o_branch_predict_pack_select; // @[front_end.scala 27:21]
  wire  bpu_io_o_branch_predict_pack_taken; // @[front_end.scala 27:21]
  wire  if1_if2_clock; // @[front_end.scala 28:25]
  wire  if1_if2_reset; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_stall; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_flush; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_fetch_valid; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_i_pc; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_o_pc; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_branch_predict_pack_valid; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_i_branch_predict_pack_target; // @[front_end.scala 28:25]
  wire [3:0] if1_if2_io_i_branch_predict_pack_branch_type; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_branch_predict_pack_select; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_branch_predict_pack_taken; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_branch_predict_pack_valid; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_o_branch_predict_pack_target; // @[front_end.scala 28:25]
  wire [3:0] if1_if2_io_o_branch_predict_pack_branch_type; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_branch_predict_pack_select; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_branch_predict_pack_taken; // @[front_end.scala 28:25]
  wire  if2_if3_clock; // @[front_end.scala 29:25]
  wire  if2_if3_reset; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_stall; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_flush; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_fetch_valid; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_fetch_valid; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_i_pc; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_o_pc; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_branch_predict_pack_valid; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_i_branch_predict_pack_target; // @[front_end.scala 29:25]
  wire [3:0] if2_if3_io_i_branch_predict_pack_branch_type; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_branch_predict_pack_select; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_branch_predict_pack_taken; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_branch_predict_pack_valid; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_o_branch_predict_pack_target; // @[front_end.scala 29:25]
  wire [3:0] if2_if3_io_o_branch_predict_pack_branch_type; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_branch_predict_pack_select; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_branch_predict_pack_taken; // @[front_end.scala 29:25]
  wire  branch_presolve_io_i_fetch_pack_valids_0; // @[front_end.scala 30:33]
  wire  branch_presolve_io_i_fetch_pack_valids_1; // @[front_end.scala 30:33]
  wire [63:0] branch_presolve_io_i_fetch_pack_pc; // @[front_end.scala 30:33]
  wire [31:0] branch_presolve_io_i_fetch_pack_insts_0; // @[front_end.scala 30:33]
  wire [31:0] branch_presolve_io_i_fetch_pack_insts_1; // @[front_end.scala 30:33]
  wire  branch_presolve_io_i_fetch_pack_branch_predict_pack_valid; // @[front_end.scala 30:33]
  wire  branch_presolve_io_i_fetch_pack_branch_predict_pack_select; // @[front_end.scala 30:33]
  wire  branch_presolve_io_i_fetch_pack_branch_predict_pack_taken; // @[front_end.scala 30:33]
  wire  branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 30:33]
  wire  branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 30:33]
  wire [63:0] branch_presolve_io_o_branch_presolve_pack_pc; // @[front_end.scala 30:33]
  wire  fetch_queue_clock; // @[front_end.scala 31:29]
  wire  fetch_queue_reset; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_valid; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_valids_0; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_valids_1; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_in_bits_pc; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_in_bits_insts_0; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_in_bits_insts_1; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_branch_predict_pack_valid; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_in_bits_branch_predict_pack_target; // @[front_end.scala 31:29]
  wire [3:0] fetch_queue_io_in_bits_branch_predict_pack_branch_type; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_branch_predict_pack_select; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_branch_predict_pack_taken; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_ready; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_valid; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_valids_0; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_valids_1; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_out_bits_pc; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_out_bits_insts_0; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_out_bits_insts_1; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_branch_predict_pack_valid; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_out_bits_branch_predict_pack_target; // @[front_end.scala 31:29]
  wire [3:0] fetch_queue_io_out_bits_branch_predict_pack_branch_type; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_branch_predict_pack_select; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_branch_predict_pack_taken; // @[front_end.scala 31:29]
  wire  fetch_queue_io_full; // @[front_end.scala 31:29]
  wire  fetch_queue_io_i_flush; // @[front_end.scala 31:29]
  wire  front_end_control_io_i_pc_redirect_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_icache_data_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_icache_addr_ready; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_resolve_pack_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_resolve_pack_mispred; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_presolve_pack_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_presolve_pack_taken; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_fetch_queue_full; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage1_stall; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage2_stall; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage1_flush; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage2_flush; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_fetch_queue_flush; // @[front_end.scala 32:35]
  wire [63:0] fetch_res_io_i_pc; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_flush; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_stall; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_i_fetch_res; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_predict_pack_valid; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_i_branch_predict_pack_target; // @[front_end.scala 33:27]
  wire [3:0] fetch_res_io_i_branch_predict_pack_branch_type; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_predict_pack_select; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_predict_pack_taken; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_presolve_pack_valid; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_presolve_pack_taken; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_valids_0; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_valids_1; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_o_fetch_pack_bits_pc; // @[front_end.scala 33:27]
  wire [31:0] fetch_res_io_o_fetch_pack_bits_insts_0; // @[front_end.scala 33:27]
  wire [31:0] fetch_res_io_o_fetch_pack_bits_insts_1; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_o_fetch_pack_bits_branch_predict_pack_target; // @[front_end.scala 33:27]
  wire [3:0] fetch_res_io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_branch_predict_pack_select; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_with_presolve_valid; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_with_presolve_bits_valids_0; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_with_presolve_bits_valids_1; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_o_fetch_pack_with_presolve_bits_pc; // @[front_end.scala 33:27]
  wire [31:0] fetch_res_io_o_fetch_pack_with_presolve_bits_insts_0; // @[front_end.scala 33:27]
  wire [31:0] fetch_res_io_o_fetch_pack_with_presolve_bits_insts_1; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_valid; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_target; // @[front_end.scala 33:27]
  wire [3:0] fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_branch_type; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_select; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_taken; // @[front_end.scala 33:27]
  PC_Gen pc_gen ( // @[front_end.scala 26:24]
    .clock(pc_gen_clock),
    .reset(pc_gen_reset),
    .io_i_stall(pc_gen_io_i_stall),
    .io_i_pc_redirect_valid(pc_gen_io_i_pc_redirect_valid),
    .io_i_pc_redirect_target(pc_gen_io_i_pc_redirect_target),
    .io_i_branch_predict_pack_valid(pc_gen_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(pc_gen_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_select(pc_gen_io_i_branch_predict_pack_select),
    .io_i_branch_predict_pack_taken(pc_gen_io_i_branch_predict_pack_taken),
    .io_i_branch_presolve_pack_valid(pc_gen_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_taken(pc_gen_io_i_branch_presolve_pack_taken),
    .io_i_branch_presolve_pack_pc(pc_gen_io_i_branch_presolve_pack_pc),
    .io_i_branch_resolve_pack_valid(pc_gen_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(pc_gen_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_target(pc_gen_io_i_branch_resolve_pack_target),
    .io_o_pc(pc_gen_io_o_pc)
  );
  BPU bpu ( // @[front_end.scala 27:21]
    .clock(bpu_clock),
    .reset(bpu_reset),
    .io_i_addr(bpu_io_i_addr),
    .io_i_branch_resolve_pack_valid(bpu_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(bpu_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_taken(bpu_io_i_branch_resolve_pack_taken),
    .io_i_branch_resolve_pack_pc(bpu_io_i_branch_resolve_pack_pc),
    .io_i_branch_resolve_pack_target(bpu_io_i_branch_resolve_pack_target),
    .io_i_branch_resolve_pack_rob_idx(bpu_io_i_branch_resolve_pack_rob_idx),
    .io_i_branch_resolve_pack_prediction_valid(bpu_io_i_branch_resolve_pack_prediction_valid),
    .io_i_branch_resolve_pack_branch_type(bpu_io_i_branch_resolve_pack_branch_type),
    .io_i_branch_presolve_pack_valid(bpu_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_taken(bpu_io_i_branch_presolve_pack_taken),
    .io_i_branch_presolve_pack_pc(bpu_io_i_branch_presolve_pack_pc),
    .io_o_branch_predict_pack_valid(bpu_io_o_branch_predict_pack_valid),
    .io_o_branch_predict_pack_target(bpu_io_o_branch_predict_pack_target),
    .io_o_branch_predict_pack_branch_type(bpu_io_o_branch_predict_pack_branch_type),
    .io_o_branch_predict_pack_select(bpu_io_o_branch_predict_pack_select),
    .io_o_branch_predict_pack_taken(bpu_io_o_branch_predict_pack_taken)
  );
  IF1_IF2 if1_if2 ( // @[front_end.scala 28:25]
    .clock(if1_if2_clock),
    .reset(if1_if2_reset),
    .io_i_stall(if1_if2_io_i_stall),
    .io_i_flush(if1_if2_io_i_flush),
    .io_o_fetch_valid(if1_if2_io_o_fetch_valid),
    .io_i_pc(if1_if2_io_i_pc),
    .io_o_pc(if1_if2_io_o_pc),
    .io_i_branch_predict_pack_valid(if1_if2_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(if1_if2_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_branch_type(if1_if2_io_i_branch_predict_pack_branch_type),
    .io_i_branch_predict_pack_select(if1_if2_io_i_branch_predict_pack_select),
    .io_i_branch_predict_pack_taken(if1_if2_io_i_branch_predict_pack_taken),
    .io_o_branch_predict_pack_valid(if1_if2_io_o_branch_predict_pack_valid),
    .io_o_branch_predict_pack_target(if1_if2_io_o_branch_predict_pack_target),
    .io_o_branch_predict_pack_branch_type(if1_if2_io_o_branch_predict_pack_branch_type),
    .io_o_branch_predict_pack_select(if1_if2_io_o_branch_predict_pack_select),
    .io_o_branch_predict_pack_taken(if1_if2_io_o_branch_predict_pack_taken)
  );
  IF2_IF3 if2_if3 ( // @[front_end.scala 29:25]
    .clock(if2_if3_clock),
    .reset(if2_if3_reset),
    .io_i_stall(if2_if3_io_i_stall),
    .io_i_flush(if2_if3_io_i_flush),
    .io_i_fetch_valid(if2_if3_io_i_fetch_valid),
    .io_o_fetch_valid(if2_if3_io_o_fetch_valid),
    .io_i_pc(if2_if3_io_i_pc),
    .io_o_pc(if2_if3_io_o_pc),
    .io_i_branch_predict_pack_valid(if2_if3_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(if2_if3_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_branch_type(if2_if3_io_i_branch_predict_pack_branch_type),
    .io_i_branch_predict_pack_select(if2_if3_io_i_branch_predict_pack_select),
    .io_i_branch_predict_pack_taken(if2_if3_io_i_branch_predict_pack_taken),
    .io_o_branch_predict_pack_valid(if2_if3_io_o_branch_predict_pack_valid),
    .io_o_branch_predict_pack_target(if2_if3_io_o_branch_predict_pack_target),
    .io_o_branch_predict_pack_branch_type(if2_if3_io_o_branch_predict_pack_branch_type),
    .io_o_branch_predict_pack_select(if2_if3_io_o_branch_predict_pack_select),
    .io_o_branch_predict_pack_taken(if2_if3_io_o_branch_predict_pack_taken)
  );
  Branch_Presolve branch_presolve ( // @[front_end.scala 30:33]
    .io_i_fetch_pack_valids_0(branch_presolve_io_i_fetch_pack_valids_0),
    .io_i_fetch_pack_valids_1(branch_presolve_io_i_fetch_pack_valids_1),
    .io_i_fetch_pack_pc(branch_presolve_io_i_fetch_pack_pc),
    .io_i_fetch_pack_insts_0(branch_presolve_io_i_fetch_pack_insts_0),
    .io_i_fetch_pack_insts_1(branch_presolve_io_i_fetch_pack_insts_1),
    .io_i_fetch_pack_branch_predict_pack_valid(branch_presolve_io_i_fetch_pack_branch_predict_pack_valid),
    .io_i_fetch_pack_branch_predict_pack_select(branch_presolve_io_i_fetch_pack_branch_predict_pack_select),
    .io_i_fetch_pack_branch_predict_pack_taken(branch_presolve_io_i_fetch_pack_branch_predict_pack_taken),
    .io_o_branch_presolve_pack_valid(branch_presolve_io_o_branch_presolve_pack_valid),
    .io_o_branch_presolve_pack_taken(branch_presolve_io_o_branch_presolve_pack_taken),
    .io_o_branch_presolve_pack_pc(branch_presolve_io_o_branch_presolve_pack_pc)
  );
  Fetch_Queue fetch_queue ( // @[front_end.scala 31:29]
    .clock(fetch_queue_clock),
    .reset(fetch_queue_reset),
    .io_in_valid(fetch_queue_io_in_valid),
    .io_in_bits_valids_0(fetch_queue_io_in_bits_valids_0),
    .io_in_bits_valids_1(fetch_queue_io_in_bits_valids_1),
    .io_in_bits_pc(fetch_queue_io_in_bits_pc),
    .io_in_bits_insts_0(fetch_queue_io_in_bits_insts_0),
    .io_in_bits_insts_1(fetch_queue_io_in_bits_insts_1),
    .io_in_bits_branch_predict_pack_valid(fetch_queue_io_in_bits_branch_predict_pack_valid),
    .io_in_bits_branch_predict_pack_target(fetch_queue_io_in_bits_branch_predict_pack_target),
    .io_in_bits_branch_predict_pack_branch_type(fetch_queue_io_in_bits_branch_predict_pack_branch_type),
    .io_in_bits_branch_predict_pack_select(fetch_queue_io_in_bits_branch_predict_pack_select),
    .io_in_bits_branch_predict_pack_taken(fetch_queue_io_in_bits_branch_predict_pack_taken),
    .io_out_ready(fetch_queue_io_out_ready),
    .io_out_valid(fetch_queue_io_out_valid),
    .io_out_bits_valids_0(fetch_queue_io_out_bits_valids_0),
    .io_out_bits_valids_1(fetch_queue_io_out_bits_valids_1),
    .io_out_bits_pc(fetch_queue_io_out_bits_pc),
    .io_out_bits_insts_0(fetch_queue_io_out_bits_insts_0),
    .io_out_bits_insts_1(fetch_queue_io_out_bits_insts_1),
    .io_out_bits_branch_predict_pack_valid(fetch_queue_io_out_bits_branch_predict_pack_valid),
    .io_out_bits_branch_predict_pack_target(fetch_queue_io_out_bits_branch_predict_pack_target),
    .io_out_bits_branch_predict_pack_branch_type(fetch_queue_io_out_bits_branch_predict_pack_branch_type),
    .io_out_bits_branch_predict_pack_select(fetch_queue_io_out_bits_branch_predict_pack_select),
    .io_out_bits_branch_predict_pack_taken(fetch_queue_io_out_bits_branch_predict_pack_taken),
    .io_full(fetch_queue_io_full),
    .io_i_flush(fetch_queue_io_i_flush)
  );
  front_end_control front_end_control ( // @[front_end.scala 32:35]
    .io_i_pc_redirect_valid(front_end_control_io_i_pc_redirect_valid),
    .io_i_icache_data_valid(front_end_control_io_i_icache_data_valid),
    .io_i_icache_addr_ready(front_end_control_io_i_icache_addr_ready),
    .io_i_branch_resolve_pack_valid(front_end_control_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(front_end_control_io_i_branch_resolve_pack_mispred),
    .io_i_branch_presolve_pack_valid(front_end_control_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_taken(front_end_control_io_i_branch_presolve_pack_taken),
    .io_i_fetch_queue_full(front_end_control_io_i_fetch_queue_full),
    .io_o_stage1_stall(front_end_control_io_o_stage1_stall),
    .io_o_stage2_stall(front_end_control_io_o_stage2_stall),
    .io_o_stage1_flush(front_end_control_io_o_stage1_flush),
    .io_o_stage2_flush(front_end_control_io_o_stage2_flush),
    .io_o_fetch_queue_flush(front_end_control_io_o_fetch_queue_flush)
  );
  Fetch_Res fetch_res ( // @[front_end.scala 33:27]
    .io_i_pc(fetch_res_io_i_pc),
    .io_i_flush(fetch_res_io_i_flush),
    .io_i_stall(fetch_res_io_i_stall),
    .io_i_fetch_res(fetch_res_io_i_fetch_res),
    .io_i_branch_predict_pack_valid(fetch_res_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(fetch_res_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_branch_type(fetch_res_io_i_branch_predict_pack_branch_type),
    .io_i_branch_predict_pack_select(fetch_res_io_i_branch_predict_pack_select),
    .io_i_branch_predict_pack_taken(fetch_res_io_i_branch_predict_pack_taken),
    .io_i_branch_presolve_pack_valid(fetch_res_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_taken(fetch_res_io_i_branch_presolve_pack_taken),
    .io_o_fetch_pack_bits_valids_0(fetch_res_io_o_fetch_pack_bits_valids_0),
    .io_o_fetch_pack_bits_valids_1(fetch_res_io_o_fetch_pack_bits_valids_1),
    .io_o_fetch_pack_bits_pc(fetch_res_io_o_fetch_pack_bits_pc),
    .io_o_fetch_pack_bits_insts_0(fetch_res_io_o_fetch_pack_bits_insts_0),
    .io_o_fetch_pack_bits_insts_1(fetch_res_io_o_fetch_pack_bits_insts_1),
    .io_o_fetch_pack_bits_branch_predict_pack_valid(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid),
    .io_o_fetch_pack_bits_branch_predict_pack_target(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_target),
    .io_o_fetch_pack_bits_branch_predict_pack_branch_type(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_branch_type
      ),
    .io_o_fetch_pack_bits_branch_predict_pack_select(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_select),
    .io_o_fetch_pack_bits_branch_predict_pack_taken(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken),
    .io_o_fetch_pack_with_presolve_valid(fetch_res_io_o_fetch_pack_with_presolve_valid),
    .io_o_fetch_pack_with_presolve_bits_valids_0(fetch_res_io_o_fetch_pack_with_presolve_bits_valids_0),
    .io_o_fetch_pack_with_presolve_bits_valids_1(fetch_res_io_o_fetch_pack_with_presolve_bits_valids_1),
    .io_o_fetch_pack_with_presolve_bits_pc(fetch_res_io_o_fetch_pack_with_presolve_bits_pc),
    .io_o_fetch_pack_with_presolve_bits_insts_0(fetch_res_io_o_fetch_pack_with_presolve_bits_insts_0),
    .io_o_fetch_pack_with_presolve_bits_insts_1(fetch_res_io_o_fetch_pack_with_presolve_bits_insts_1),
    .io_o_fetch_pack_with_presolve_bits_branch_predict_pack_valid(
      fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_valid),
    .io_o_fetch_pack_with_presolve_bits_branch_predict_pack_target(
      fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_target),
    .io_o_fetch_pack_with_presolve_bits_branch_predict_pack_branch_type(
      fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_branch_type),
    .io_o_fetch_pack_with_presolve_bits_branch_predict_pack_select(
      fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_select),
    .io_o_fetch_pack_with_presolve_bits_branch_predict_pack_taken(
      fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_taken)
  );
  assign io_icache_io_o_addr = {pc_gen_io_o_pc[63:3],3'h0}; // @[Cat.scala 33:92]
  assign io_icache_io_o_addr_valid = front_end_control_io_o_stage1_stall; // @[front_end.scala 54:31]
  assign io_icache_io_o_stall1 = front_end_control_io_o_stage1_stall; // @[front_end.scala 56:27]
  assign io_icache_io_o_stall2 = front_end_control_io_o_stage2_stall; // @[front_end.scala 57:27]
  assign io_o_fetch_pack_valid = fetch_queue_io_out_valid; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_valids_0 = fetch_queue_io_out_bits_valids_0; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_valids_1 = fetch_queue_io_out_bits_valids_1; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_pc = fetch_queue_io_out_bits_pc; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_insts_0 = fetch_queue_io_out_bits_insts_0; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_insts_1 = fetch_queue_io_out_bits_insts_1; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_valid = fetch_queue_io_out_bits_branch_predict_pack_valid; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_target = fetch_queue_io_out_bits_branch_predict_pack_target; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_branch_type = fetch_queue_io_out_bits_branch_predict_pack_branch_type; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_select = fetch_queue_io_out_bits_branch_predict_pack_select; // @[front_end.scala 93:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_taken = fetch_queue_io_out_bits_branch_predict_pack_taken; // @[front_end.scala 93:21]
  assign pc_gen_clock = clock;
  assign pc_gen_reset = reset;
  assign pc_gen_io_i_stall = front_end_control_io_o_stage1_stall; // @[front_end.scala 45:23]
  assign pc_gen_io_i_pc_redirect_valid = io_i_pc_redirect_valid; // @[front_end.scala 46:35]
  assign pc_gen_io_i_pc_redirect_target = io_i_pc_redirect_target; // @[front_end.scala 47:36]
  assign pc_gen_io_i_branch_predict_pack_valid = bpu_io_o_branch_predict_pack_valid; // @[front_end.scala 48:37]
  assign pc_gen_io_i_branch_predict_pack_target = bpu_io_o_branch_predict_pack_target; // @[front_end.scala 48:37]
  assign pc_gen_io_i_branch_predict_pack_select = bpu_io_o_branch_predict_pack_select; // @[front_end.scala 48:37]
  assign pc_gen_io_i_branch_predict_pack_taken = bpu_io_o_branch_predict_pack_taken; // @[front_end.scala 48:37]
  assign pc_gen_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 49:38]
  assign pc_gen_io_i_branch_presolve_pack_taken = branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 49:38]
  assign pc_gen_io_i_branch_presolve_pack_pc = branch_presolve_io_o_branch_presolve_pack_pc; // @[front_end.scala 49:38]
  assign pc_gen_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[front_end.scala 50:37]
  assign pc_gen_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[front_end.scala 50:37]
  assign pc_gen_io_i_branch_resolve_pack_target = io_i_branch_resolve_pack_target; // @[front_end.scala 50:37]
  assign bpu_clock = clock;
  assign bpu_reset = reset;
  assign bpu_io_i_addr = pc_gen_io_o_pc; // @[front_end.scala 59:19]
  assign bpu_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_taken = io_i_branch_resolve_pack_taken; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_pc = io_i_branch_resolve_pack_pc; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_target = io_i_branch_resolve_pack_target; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_rob_idx = io_i_branch_resolve_pack_rob_idx; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_prediction_valid = io_i_branch_resolve_pack_prediction_valid; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_resolve_pack_branch_type = io_i_branch_resolve_pack_branch_type; // @[front_end.scala 61:34]
  assign bpu_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 60:35]
  assign bpu_io_i_branch_presolve_pack_taken = branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 60:35]
  assign bpu_io_i_branch_presolve_pack_pc = branch_presolve_io_o_branch_presolve_pack_pc; // @[front_end.scala 60:35]
  assign if1_if2_clock = clock;
  assign if1_if2_reset = reset;
  assign if1_if2_io_i_stall = front_end_control_io_o_stage1_stall; // @[front_end.scala 64:24]
  assign if1_if2_io_i_flush = front_end_control_io_o_stage1_flush; // @[front_end.scala 65:24]
  assign if1_if2_io_i_pc = pc_gen_io_o_pc; // @[front_end.scala 66:21]
  assign if1_if2_io_i_branch_predict_pack_valid = bpu_io_o_branch_predict_pack_valid; // @[front_end.scala 67:38]
  assign if1_if2_io_i_branch_predict_pack_target = bpu_io_o_branch_predict_pack_target; // @[front_end.scala 67:38]
  assign if1_if2_io_i_branch_predict_pack_branch_type = bpu_io_o_branch_predict_pack_branch_type; // @[front_end.scala 67:38]
  assign if1_if2_io_i_branch_predict_pack_select = bpu_io_o_branch_predict_pack_select; // @[front_end.scala 67:38]
  assign if1_if2_io_i_branch_predict_pack_taken = bpu_io_o_branch_predict_pack_taken; // @[front_end.scala 67:38]
  assign if2_if3_clock = clock;
  assign if2_if3_reset = reset;
  assign if2_if3_io_i_stall = front_end_control_io_o_stage2_stall; // @[front_end.scala 72:24]
  assign if2_if3_io_i_flush = front_end_control_io_o_stage2_flush; // @[front_end.scala 73:24]
  assign if2_if3_io_i_fetch_valid = if1_if2_io_o_fetch_valid; // @[front_end.scala 76:30]
  assign if2_if3_io_i_pc = if1_if2_io_o_pc; // @[front_end.scala 74:21]
  assign if2_if3_io_i_branch_predict_pack_valid = if1_if2_io_o_branch_predict_pack_valid; // @[front_end.scala 75:38]
  assign if2_if3_io_i_branch_predict_pack_target = if1_if2_io_o_branch_predict_pack_target; // @[front_end.scala 75:38]
  assign if2_if3_io_i_branch_predict_pack_branch_type = if1_if2_io_o_branch_predict_pack_branch_type; // @[front_end.scala 75:38]
  assign if2_if3_io_i_branch_predict_pack_select = if1_if2_io_o_branch_predict_pack_select; // @[front_end.scala 75:38]
  assign if2_if3_io_i_branch_predict_pack_taken = if1_if2_io_o_branch_predict_pack_taken; // @[front_end.scala 75:38]
  assign branch_presolve_io_i_fetch_pack_valids_0 = fetch_res_io_o_fetch_pack_bits_valids_0; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_valids_1 = fetch_res_io_o_fetch_pack_bits_valids_1; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_pc = fetch_res_io_o_fetch_pack_bits_pc; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_insts_0 = fetch_res_io_o_fetch_pack_bits_insts_0; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_insts_1 = fetch_res_io_o_fetch_pack_bits_insts_1; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_branch_predict_pack_valid =
    fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_branch_predict_pack_select =
    fetch_res_io_o_fetch_pack_bits_branch_predict_pack_select; // @[front_end.scala 79:37]
  assign branch_presolve_io_i_fetch_pack_branch_predict_pack_taken =
    fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[front_end.scala 79:37]
  assign fetch_queue_clock = clock;
  assign fetch_queue_reset = reset;
  assign fetch_queue_io_in_valid = fetch_res_io_o_fetch_pack_with_presolve_valid; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_valids_0 = fetch_res_io_o_fetch_pack_with_presolve_bits_valids_0; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_valids_1 = fetch_res_io_o_fetch_pack_with_presolve_bits_valids_1; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_pc = fetch_res_io_o_fetch_pack_with_presolve_bits_pc; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_insts_0 = fetch_res_io_o_fetch_pack_with_presolve_bits_insts_0; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_insts_1 = fetch_res_io_o_fetch_pack_with_presolve_bits_insts_1; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_valid =
    fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_valid; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_target =
    fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_target; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_branch_type =
    fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_branch_type; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_select =
    fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_select; // @[front_end.scala 89:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_taken =
    fetch_res_io_o_fetch_pack_with_presolve_bits_branch_predict_pack_taken; // @[front_end.scala 89:24]
  assign fetch_queue_io_out_ready = io_o_fetch_pack_ready; // @[front_end.scala 93:21]
  assign fetch_queue_io_i_flush = front_end_control_io_o_fetch_queue_flush; // @[front_end.scala 90:28]
  assign front_end_control_io_i_pc_redirect_valid = io_i_pc_redirect_valid; // @[front_end.scala 36:46]
  assign front_end_control_io_i_icache_data_valid = io_icache_io_i_data_valid; // @[front_end.scala 38:46]
  assign front_end_control_io_i_icache_addr_ready = io_icache_io_i_addr_ready; // @[front_end.scala 37:46]
  assign front_end_control_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[front_end.scala 40:48]
  assign front_end_control_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[front_end.scala 40:48]
  assign front_end_control_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 39:49]
  assign front_end_control_io_i_branch_presolve_pack_taken = branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 39:49]
  assign front_end_control_io_i_fetch_queue_full = fetch_queue_io_full; // @[front_end.scala 41:45]
  assign fetch_res_io_i_pc = if2_if3_io_o_pc; // @[front_end.scala 82:23]
  assign fetch_res_io_i_flush = front_end_control_io_o_fetch_queue_flush | ~if2_if3_io_o_fetch_valid; // @[front_end.scala 83:70]
  assign fetch_res_io_i_stall = front_end_control_io_o_stage2_stall; // @[front_end.scala 84:26]
  assign fetch_res_io_i_fetch_res = io_icache_io_i_data; // @[front_end.scala 86:30]
  assign fetch_res_io_i_branch_predict_pack_valid = if2_if3_io_o_branch_predict_pack_valid; // @[front_end.scala 87:40]
  assign fetch_res_io_i_branch_predict_pack_target = if2_if3_io_o_branch_predict_pack_target; // @[front_end.scala 87:40]
  assign fetch_res_io_i_branch_predict_pack_branch_type = if2_if3_io_o_branch_predict_pack_branch_type; // @[front_end.scala 87:40]
  assign fetch_res_io_i_branch_predict_pack_select = if2_if3_io_o_branch_predict_pack_select; // @[front_end.scala 87:40]
  assign fetch_res_io_i_branch_predict_pack_taken = if2_if3_io_o_branch_predict_pack_taken; // @[front_end.scala 87:40]
  assign fetch_res_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 85:45]
  assign fetch_res_io_i_branch_presolve_pack_taken = branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 85:45]
endmodule
