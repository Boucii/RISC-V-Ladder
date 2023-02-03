module MUL(
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
  wire  multiplier_clock; // @[execute_unit.scala 339:28]
  wire  multiplier_reset; // @[execute_unit.scala 339:28]
  wire  multiplier_io_i_mul_valid; // @[execute_unit.scala 339:28]
  wire  multiplier_io_i_flush; // @[execute_unit.scala 339:28]
  wire  multiplier_io_i_mulw; // @[execute_unit.scala 339:28]
  wire [1:0] multiplier_io_i_mul_signed; // @[execute_unit.scala 339:28]
  wire [63:0] multiplier_io_i_multiplicand; // @[execute_unit.scala 339:28]
  wire [63:0] multiplier_io_i_multiplier; // @[execute_unit.scala 339:28]
  wire  multiplier_io_o_out_valid; // @[execute_unit.scala 339:28]
  wire [63:0] multiplier_io_o_result_hi; // @[execute_unit.scala 339:28]
  wire [63:0] multiplier_io_o_result_lo; // @[execute_unit.scala 339:28]
  reg  uop_valid; // @[execute_unit.scala 320:23]
  reg [31:0] uop_pc; // @[execute_unit.scala 320:23]
  reg [31:0] uop_inst; // @[execute_unit.scala 320:23]
  reg [6:0] uop_func_code; // @[execute_unit.scala 320:23]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 320:23]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 320:23]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 320:23]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 320:23]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 320:23]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 320:23]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 320:23]
  reg  state; // @[execute_unit.scala 322:24]
  wire  _next_state_T_7 = io_i_rollback_rob_idx < uop_rob_idx & io_i_rollback_rob_idx[6] & ~uop_rob_idx[6]; // @[execute_unit.scala 328:84]
  wire  _next_state_T_9 = io_i_rollback_valid & (io_i_rollback_rob_idx > uop_rob_idx | _next_state_T_7); // @[execute_unit.scala 327:30]
  wire  _next_state_T_10 = ~io_i_exception; // @[execute_unit.scala 329:10]
  wire  _next_state_T_13 = ~io_i_exception & ~state & io_i_select; // @[execute_unit.scala 329:50]
  wire  _next_state_T_17 = _next_state_T_10 & state & io_i_select_to_commit; // @[execute_unit.scala 330:50]
  wire  _next_state_T_18 = _next_state_T_17 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_20 = _next_state_T_9 ? 1'h0 : _next_state_T_13 | _next_state_T_18; // @[Mux.scala 101:16]
  wire  _next_state_T_21 = io_i_exception ? 1'h0 : _next_state_T_20; // @[Mux.scala 101:16]
  wire [31:0] next_uop_inst = io_i_select ? io_i_uop_inst : uop_inst; // @[execute_unit.scala 334:20]
  wire [1:0] next_state = {{1'd0}, _next_state_T_21}; // @[execute_unit.scala 323:26 325:16]
  wire  _multiplier_io_i_mul_signed_T_1 = next_uop_inst[14:12] == 3'h0; // @[execute_unit.scala 343:31]
  wire  _multiplier_io_i_mul_signed_T_3 = next_uop_inst[14:12] == 3'h1; // @[execute_unit.scala 344:31]
  wire  _multiplier_io_i_mul_signed_T_5 = next_uop_inst[14:12] == 3'h2; // @[execute_unit.scala 345:31]
  wire  _multiplier_io_i_mul_signed_T_7 = next_uop_inst[14:12] == 3'h3; // @[execute_unit.scala 346:31]
  wire [1:0] _multiplier_io_i_mul_signed_T_8 = _multiplier_io_i_mul_signed_T_7 ? 2'h0 : 2'h3; // @[Mux.scala 101:16]
  wire [1:0] _multiplier_io_i_mul_signed_T_9 = _multiplier_io_i_mul_signed_T_5 ? 2'h2 : _multiplier_io_i_mul_signed_T_8; // @[Mux.scala 101:16]
  wire [1:0] _multiplier_io_i_mul_signed_T_10 = _multiplier_io_i_mul_signed_T_3 ? 2'h3 : _multiplier_io_i_mul_signed_T_9
    ; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_8 = _multiplier_io_i_mul_signed_T_7 ? multiplier_io_o_result_hi :
    multiplier_io_o_result_lo; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_9 = _multiplier_io_i_mul_signed_T_5 ? multiplier_io_o_result_hi :
    _io_o_ex_res_pack_uop_dst_value_T_8; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_10 = _multiplier_io_i_mul_signed_T_3 ? multiplier_io_o_result_hi :
    _io_o_ex_res_pack_uop_dst_value_T_9; // @[Mux.scala 101:16]
  reg  mul_finished; // @[execute_unit.scala 357:29]
  wire  _GEN_1 = io_i_select_to_commit ? 1'h0 : mul_finished; // @[execute_unit.scala 361:38 362:21 364:22]
  wire  _GEN_2 = multiplier_io_o_out_valid | _GEN_1; // @[execute_unit.scala 359:36 360:21]
  wire [1:0] _GEN_3 = reset ? 2'h0 : next_state; // @[execute_unit.scala 322:{24,24} 324:11]
  Multiplier multiplier ( // @[execute_unit.scala 339:28]
    .clock(multiplier_clock),
    .reset(multiplier_reset),
    .io_i_mul_valid(multiplier_io_i_mul_valid),
    .io_i_flush(multiplier_io_i_flush),
    .io_i_mulw(multiplier_io_i_mulw),
    .io_i_mul_signed(multiplier_io_i_mul_signed),
    .io_i_multiplicand(multiplier_io_i_multiplicand),
    .io_i_multiplier(multiplier_io_i_multiplier),
    .io_o_out_valid(multiplier_io_o_out_valid),
    .io_o_result_hi(multiplier_io_o_result_hi),
    .io_o_result_lo(multiplier_io_o_result_lo)
  );
  assign io_o_ex_res_pack_valid = mul_finished; // @[execute_unit.scala 369:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_dst_value = _multiplier_io_i_mul_signed_T_1 ? multiplier_io_o_result_lo :
    _io_o_ex_res_pack_uop_dst_value_T_10; // @[Mux.scala 101:16]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 349:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 349:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 374:26]
  assign multiplier_clock = clock;
  assign multiplier_reset = reset;
  assign multiplier_io_i_mul_valid = next_state == 2'h1 & ~mul_finished; // @[execute_unit.scala 367:56]
  assign multiplier_io_i_flush = next_state == 2'h0; // @[execute_unit.scala 340:41]
  assign multiplier_io_i_mulw = next_uop_inst[6:0] == 7'h3b; // @[execute_unit.scala 341:48]
  assign multiplier_io_i_mul_signed = _multiplier_io_i_mul_signed_T_1 ? 2'h3 : _multiplier_io_i_mul_signed_T_10; // @[Mux.scala 101:16]
  assign multiplier_io_i_multiplicand = io_i_select ? io_i_uop_src1_value : uop_src1_value; // @[execute_unit.scala 334:20]
  assign multiplier_io_i_multiplier = io_i_select ? io_i_uop_src2_value : uop_src2_value; // @[execute_unit.scala 334:20]
  always @(posedge clock) begin
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_valid <= 1'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select_to_commit & ~io_i_select | io_i_exception) begin // @[execute_unit.scala 336:66]
      uop_valid <= 1'h0; // @[execute_unit.scala 337:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_pc <= 32'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_inst <= 32'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_func_code <= 7'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 320:23]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 320:23]
    end else if (io_i_select) begin // @[execute_unit.scala 334:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    state <= _GEN_3[0]; // @[execute_unit.scala 322:{24,24} 324:11]
    if (reset) begin // @[execute_unit.scala 357:29]
      mul_finished <= 1'h0; // @[execute_unit.scala 357:29]
    end else begin
      mul_finished <= _GEN_2;
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
  mul_finished = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
