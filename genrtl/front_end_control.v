module front_end_control(
  input   io_i_pc_redirect_valid,
  input   io_i_icache_data_valid,
  input   io_i_icache_addr_ready,
  input   io_i_branch_resolve_pack_valid,
  input   io_i_branch_resolve_pack_mispred,
  input   io_i_branch_presolve_pack_valid,
  input   io_i_branch_presolve_pack_taken,
  input   io_i_fetch_queue_full,
  output  io_o_stage1_stall,
  output  io_o_stage2_stall,
  output  io_o_stage1_flush,
  output  io_o_stage2_flush,
  output  io_o_fetch_queue_flush
);
  assign io_o_stage1_stall = (~io_i_icache_addr_ready | io_o_stage2_stall) & ~io_o_stage1_flush; // @[front_end_control.scala 36:72]
  assign io_o_stage2_stall = (io_i_fetch_queue_full | ~io_i_icache_data_valid) & ~io_o_stage2_flush; // @[front_end_control.scala 35:78]
  assign io_o_stage1_flush = io_o_stage2_flush | io_i_branch_presolve_pack_valid & io_i_branch_presolve_pack_taken; // @[front_end_control.scala 33:43]
  assign io_o_stage2_flush = io_o_fetch_queue_flush; // @[front_end_control.scala 32:22]
  assign io_o_fetch_queue_flush = io_i_pc_redirect_valid | io_i_branch_resolve_pack_valid &
    io_i_branch_resolve_pack_mispred; // @[front_end_control.scala 31:53]
endmodule
