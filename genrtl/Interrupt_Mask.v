module Interrupt_Mask(
  input        clock,
  input        reset,
  input        io_i_lsu_uop_valid,
  input  [5:0] io_i_rob_idx,
  input  [5:0] io_i_lsu_uop_rob_idx,
  input        io_i_interrupt,
  output       io_o_interrupt_with_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  mask; // @[interrupt_mask.scala 25:23]
  reg [5:0] cmt_ptr; // @[interrupt_mask.scala 28:26]
  wire  _GEN_0 = io_i_lsu_uop_valid & io_i_lsu_uop_rob_idx == io_i_rob_idx | mask; // @[interrupt_mask.scala 29:15 30:68 31:19]
  wire  next_mask = mask & io_i_rob_idx != cmt_ptr ? 1'h0 : _GEN_0; // @[interrupt_mask.scala 34:52 35:19]
  assign io_o_interrupt_with_mask = next_mask ? 1'h0 : io_i_interrupt; // @[interrupt_mask.scala 37:36]
  always @(posedge clock) begin
    if (reset) begin // @[interrupt_mask.scala 25:23]
      mask <= 1'h0; // @[interrupt_mask.scala 25:23]
    end else if (mask & io_i_rob_idx != cmt_ptr) begin // @[interrupt_mask.scala 34:52]
      mask <= 1'h0; // @[interrupt_mask.scala 35:19]
    end else begin
      mask <= _GEN_0;
    end
    if (reset) begin // @[interrupt_mask.scala 28:26]
      cmt_ptr <= 6'h0; // @[interrupt_mask.scala 28:26]
    end else if (io_i_lsu_uop_valid & io_i_lsu_uop_rob_idx == io_i_rob_idx) begin // @[interrupt_mask.scala 30:68]
      cmt_ptr <= io_i_rob_idx; // @[interrupt_mask.scala 32:17]
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
  mask = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cmt_ptr = _RAND_1[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
