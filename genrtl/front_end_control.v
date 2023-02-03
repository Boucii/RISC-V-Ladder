module front_end_control(
  input   clock,
  input   reset,
  input   io_i_pc_redirect_valid,
  input   io_i_icache_data_valid,
  input   io_i_icache_addr_ready,
  input   io_i_cache_fetch_valid,
  input   io_i_branch_resolve_pack_valid,
  input   io_i_branch_resolve_pack_mispred,
  input   io_i_branch_presolve_pack_valid,
  input   io_i_branch_presolve_pack_taken,
  input   io_i_fetch_queue_full,
  output  io_o_stage1_stall,
  output  io_o_stage2_stall,
  output  io_o_stage3_stall,
  output  io_o_stage1_flush,
  output  io_o_stage2_flush,
  output  io_o_stage3_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  stage3_flush; // @[front_end_control.scala 29:30]
  reg  stage2_flush; // @[front_end_control.scala 30:30]
  reg  stage1_flush; // @[front_end_control.scala 31:30]
  reg  stage3_stall; // @[front_end_control.scala 32:30]
  reg  stage2_stall; // @[front_end_control.scala 33:30]
  reg  stage1_stall; // @[front_end_control.scala 34:30]
  assign io_o_stage1_stall = stage1_stall; // @[front_end_control.scala 41:22]
  assign io_o_stage2_stall = stage2_stall; // @[front_end_control.scala 40:22]
  assign io_o_stage3_stall = stage3_stall; // @[front_end_control.scala 39:22]
  assign io_o_stage1_flush = stage1_flush; // @[front_end_control.scala 38:22]
  assign io_o_stage2_flush = stage2_flush; // @[front_end_control.scala 37:22]
  assign io_o_stage3_flush = stage3_flush; // @[front_end_control.scala 36:22]
  always @(posedge clock) begin
    if (reset) begin // @[front_end_control.scala 29:30]
      stage3_flush <= 1'h0; // @[front_end_control.scala 29:30]
    end else begin
      stage3_flush <= io_i_pc_redirect_valid | io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred; // @[front_end_control.scala 43:17]
    end
    if (reset) begin // @[front_end_control.scala 30:30]
      stage2_flush <= 1'h0; // @[front_end_control.scala 30:30]
    end else begin
      stage2_flush <= io_o_stage3_flush | io_i_branch_presolve_pack_valid & io_i_branch_presolve_pack_taken; // @[front_end_control.scala 44:17]
    end
    if (reset) begin // @[front_end_control.scala 31:30]
      stage1_flush <= 1'h0; // @[front_end_control.scala 31:30]
    end else begin
      stage1_flush <= io_o_stage2_flush; // @[front_end_control.scala 45:17]
    end
    if (reset) begin // @[front_end_control.scala 32:30]
      stage3_stall <= 1'h0; // @[front_end_control.scala 32:30]
    end else begin
      stage3_stall <= (io_i_fetch_queue_full | ~io_i_icache_data_valid & io_i_cache_fetch_valid) & ~io_o_stage3_flush; // @[front_end_control.scala 47:17]
    end
    if (reset) begin // @[front_end_control.scala 33:30]
      stage2_stall <= 1'h0; // @[front_end_control.scala 33:30]
    end else begin
      stage2_stall <= io_o_stage3_stall & ~io_o_stage2_flush; // @[front_end_control.scala 48:17]
    end
    if (reset) begin // @[front_end_control.scala 34:30]
      stage1_stall <= 1'h0; // @[front_end_control.scala 34:30]
    end else begin
      stage1_stall <= (~io_i_icache_addr_ready | io_o_stage2_stall) & ~io_o_stage1_flush; // @[front_end_control.scala 49:17]
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
  stage3_flush = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stage2_flush = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stage1_flush = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  stage3_stall = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stage2_stall = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stage1_stall = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
