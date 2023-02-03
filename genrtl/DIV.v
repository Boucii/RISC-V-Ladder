module DIV(
  input         clock,
  input         reset,
  input         io_i_uop_valid,
  input  [31:0] io_i_uop_pc,
  input  [31:0] io_i_uop_inst,
  input  [6:0]  io_i_uop_func_code,
  input  [6:0]  io_i_uop_phy_dst,
  input  [6:0]  io_i_uop_stale_dst,
  input  [4:0]  io_i_uop_arch_dst,
  input  [6:0]  io_i_uop_rob_idx,
  input  [63:0] io_i_uop_src1_value,
  input  [63:0] io_i_uop_src2_value,
  input  [4:0]  io_i_uop_alu_sel,
  input         io_i_select,
  input         io_i_select_to_commit,
  output        io_o_ex_res_pack_valid,
  output        io_o_ex_res_pack_uop_valid,
  output [31:0] io_o_ex_res_pack_uop_pc,
  output [31:0] io_o_ex_res_pack_uop_inst,
  output [6:0]  io_o_ex_res_pack_uop_func_code,
  output [6:0]  io_o_ex_res_pack_uop_phy_dst,
  output [6:0]  io_o_ex_res_pack_uop_stale_dst,
  output [4:0]  io_o_ex_res_pack_uop_arch_dst,
  output [6:0]  io_o_ex_res_pack_uop_rob_idx,
  output [63:0] io_o_ex_res_pack_uop_dst_value,
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
  output        io_o_available,
  input         io_i_exception,
  input         io_i_rollback_valid,
  input  [6:0]  io_i_rollback_rob_idx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire  divider_clock; // @[execute_unit.scala 398:25]
  wire  divider_reset; // @[execute_unit.scala 398:25]
  wire [63:0] divider_io_i_dividend; // @[execute_unit.scala 398:25]
  wire [63:0] divider_io_i_divisor; // @[execute_unit.scala 398:25]
  wire  divider_io_i_div_valid; // @[execute_unit.scala 398:25]
  wire  divider_io_i_divw; // @[execute_unit.scala 398:25]
  wire  divider_io_i_div_signed; // @[execute_unit.scala 398:25]
  wire  divider_io_i_flush; // @[execute_unit.scala 398:25]
  wire  divider_io_o_out_valid; // @[execute_unit.scala 398:25]
  wire [63:0] divider_io_o_quotient; // @[execute_unit.scala 398:25]
  wire [63:0] divider_io_o_remainder; // @[execute_unit.scala 398:25]
  reg  uop_valid; // @[execute_unit.scala 378:23]
  reg [31:0] uop_pc; // @[execute_unit.scala 378:23]
  reg [31:0] uop_inst; // @[execute_unit.scala 378:23]
  reg [6:0] uop_func_code; // @[execute_unit.scala 378:23]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 378:23]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 378:23]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 378:23]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 378:23]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 378:23]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 378:23]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 378:23]
  reg  state; // @[execute_unit.scala 380:24]
  wire  _next_state_T_7 = io_i_rollback_rob_idx < uop_rob_idx & io_i_rollback_rob_idx[6] & ~uop_rob_idx[6]; // @[execute_unit.scala 386:84]
  wire  _next_state_T_9 = io_i_rollback_valid & (io_i_rollback_rob_idx > uop_rob_idx | _next_state_T_7); // @[execute_unit.scala 385:30]
  wire  _next_state_T_10 = ~io_i_exception; // @[execute_unit.scala 387:10]
  wire  _next_state_T_13 = ~io_i_exception & ~state & io_i_select; // @[execute_unit.scala 387:50]
  wire  _next_state_T_17 = _next_state_T_10 & state & io_i_select_to_commit; // @[execute_unit.scala 388:50]
  wire  _next_state_T_18 = _next_state_T_17 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_20 = _next_state_T_9 ? 1'h0 : _next_state_T_13 | _next_state_T_18; // @[Mux.scala 101:16]
  wire  _next_state_T_21 = io_i_exception ? 1'h0 : _next_state_T_20; // @[Mux.scala 101:16]
  wire [31:0] next_uop_inst = io_i_select ? io_i_uop_inst : uop_inst; // @[execute_unit.scala 392:20]
  reg  div_finished; // @[execute_unit.scala 399:29]
  wire  _GEN_1 = divider_io_o_out_valid | div_finished; // @[execute_unit.scala 400:33 401:21 399:29]
  wire [1:0] next_state = {{1'd0}, _next_state_T_21}; // @[execute_unit.scala 381:26 383:16]
  wire [1:0] _GEN_3 = reset ? 2'h0 : next_state; // @[execute_unit.scala 380:{24,24} 382:11]
  Divider divider ( // @[execute_unit.scala 398:25]
    .clock(divider_clock),
    .reset(divider_reset),
    .io_i_dividend(divider_io_i_dividend),
    .io_i_divisor(divider_io_i_divisor),
    .io_i_div_valid(divider_io_i_div_valid),
    .io_i_divw(divider_io_i_divw),
    .io_i_div_signed(divider_io_i_div_signed),
    .io_i_flush(divider_io_i_flush),
    .io_o_out_valid(divider_io_o_out_valid),
    .io_o_quotient(divider_io_o_quotient),
    .io_o_remainder(divider_io_o_remainder)
  );
  assign io_o_ex_res_pack_valid = divider_io_o_out_valid; // @[execute_unit.scala 419:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_dst_value = next_uop_inst[14:12] == 3'h6 | next_uop_inst[14:12] == 3'h7 ?
    divider_io_o_remainder : divider_io_o_quotient; // @[execute_unit.scala 417:42]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 416:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 416:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 420:26]
  assign divider_clock = clock;
  assign divider_reset = reset;
  assign divider_io_i_dividend = io_i_select ? io_i_uop_src1_value : uop_src1_value; // @[execute_unit.scala 392:20]
  assign divider_io_i_divisor = io_i_select ? io_i_uop_src2_value : uop_src2_value; // @[execute_unit.scala 392:20]
  assign divider_io_i_div_valid = next_state == 2'h1 & ~div_finished; // @[execute_unit.scala 410:53]
  assign divider_io_i_divw = uop_inst[6:0] == 7'h3b; // @[execute_unit.scala 412:40]
  assign divider_io_i_div_signed = next_uop_inst[14:12] != 3'h5; // @[execute_unit.scala 414:52]
  assign divider_io_i_flush = next_state == 2'h0; // @[execute_unit.scala 411:38]
  always @(posedge clock) begin
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_valid <= 1'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select_to_commit & ~io_i_select | io_i_exception) begin // @[execute_unit.scala 394:66]
      uop_valid <= 1'h0; // @[execute_unit.scala 395:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_pc <= 32'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_inst <= 32'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_func_code <= 7'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 378:23]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 378:23]
    end else if (io_i_select) begin // @[execute_unit.scala 392:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    state <= _GEN_3[0]; // @[execute_unit.scala 380:{24,24} 382:11]
    if (reset) begin // @[execute_unit.scala 399:29]
      div_finished <= 1'h0; // @[execute_unit.scala 399:29]
    end else if (io_i_select_to_commit) begin // @[execute_unit.scala 403:32]
      div_finished <= 1'h0; // @[execute_unit.scala 404:21]
    end else begin
      div_finished <= _GEN_1;
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
  uop_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  uop_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  uop_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  uop_func_code = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  uop_phy_dst = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  uop_stale_dst = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  uop_arch_dst = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  uop_rob_idx = _RAND_7[6:0];
  _RAND_8 = {2{`RANDOM}};
  uop_src1_value = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  uop_src2_value = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  uop_alu_sel = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  state = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  div_finished = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
