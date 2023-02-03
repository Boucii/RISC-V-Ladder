module Multiplier(
  input         clock,
  input         reset,
  input         io_i_mul_valid,
  input         io_i_flush,
  input         io_i_mulw,
  input  [1:0]  io_i_mul_signed,
  input  [63:0] io_i_multiplicand,
  input  [63:0] io_i_multiplier,
  output        io_o_out_valid,
  output [63:0] io_o_result_hi,
  output [63:0] io_o_result_lo
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [130:0] partial_products_gen_io_i_x; // @[mul.scala 69:38]
  wire [66:0] partial_products_gen_io_i_y; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_0; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_1; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_2; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_3; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_4; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_5; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_6; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_7; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_8; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_9; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_10; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_11; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_12; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_13; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_14; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_15; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_16; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_17; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_18; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_19; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_20; // @[mul.scala 69:38]
  wire [130:0] partial_products_gen_io_o_partial_products_21; // @[mul.scala 69:38]
  wire [130:0] wallace_io_i_partial_products_0; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_1; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_2; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_3; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_4; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_5; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_6; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_7; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_8; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_9; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_10; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_11; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_12; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_13; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_14; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_15; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_16; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_17; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_18; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_19; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_20; // @[mul.scala 70:25]
  wire [130:0] wallace_io_i_partial_products_21; // @[mul.scala 70:25]
  wire [130:0] wallace_io_o_s; // @[mul.scala 70:25]
  wire [130:0] wallace_io_o_c; // @[mul.scala 70:25]
  reg [2:0] state; // @[mul.scala 26:24]
  wire [2:0] _next_state_T_1 = state + 3'h1; // @[mul.scala 29:46]
  reg [63:0] multiplier; // @[mul.scala 34:30]
  reg [63:0] multiplicand; // @[mul.scala 35:30]
  wire  _x_64_T = io_i_mul_signed == 2'h0; // @[mul.scala 50:30]
  wire [130:0] _x_64_T_1 = {67'h0,multiplicand}; // @[Cat.scala 33:92]
  wire  _x_64_T_2 = io_i_mul_signed == 2'h1; // @[mul.scala 51:30]
  wire  _x_64_T_3 = io_i_mul_signed == 2'h2; // @[mul.scala 52:30]
  wire [66:0] _x_64_T_6 = multiplicand[63] ? 67'h7ffffffffffffffff : 67'h0; // @[Bitwise.scala 77:12]
  wire [130:0] _x_64_T_7 = {_x_64_T_6,multiplicand}; // @[Cat.scala 33:92]
  wire  _x_64_T_8 = io_i_mul_signed == 2'h3; // @[mul.scala 53:30]
  wire [130:0] _x_64_T_13 = _x_64_T_8 ? _x_64_T_7 : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _x_64_T_14 = _x_64_T_3 ? _x_64_T_7 : _x_64_T_13; // @[Mux.scala 101:16]
  wire [130:0] _x_64_T_15 = _x_64_T_2 ? 131'h0 : _x_64_T_14; // @[Mux.scala 101:16]
  wire [66:0] _y_64_T_2 = {2'h0,multiplier,1'h0}; // @[Cat.scala 33:92]
  wire [1:0] _y_64_T_10 = multiplier[63] ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [66:0] _y_64_T_12 = {_y_64_T_10,multiplier,1'h0}; // @[Cat.scala 33:92]
  wire [66:0] _y_64_T_13 = _x_64_T_8 ? _y_64_T_12 : 67'h0; // @[Mux.scala 101:16]
  wire [66:0] _y_64_T_14 = _x_64_T_3 ? _y_64_T_2 : _y_64_T_13; // @[Mux.scala 101:16]
  wire [66:0] _y_64_T_15 = _x_64_T_2 ? 67'h0 : _y_64_T_14; // @[Mux.scala 101:16]
  wire [130:0] cout = wallace_io_o_c; // @[mul.scala 76:20 80:10]
  wire [131:0] _sum_T = {cout, 1'h0}; // @[mul.scala 84:17]
  wire [130:0] sout = wallace_io_o_s; // @[mul.scala 77:20 81:10]
  wire [131:0] _GEN_2 = {{1'd0}, sout}; // @[mul.scala 84:22]
  wire [131:0] _sum_T_2 = _sum_T + _GEN_2; // @[mul.scala 84:22]
  wire [130:0] sum = _sum_T_2[130:0]; // @[mul.scala 83:19 84:9]
  wire [63:0] _io_o_result_hi_T_2 = sum[31] ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _io_o_result_lo_T_2 = sum[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _io_o_result_lo_T_4 = {_io_o_result_lo_T_2,sum[31:0]}; // @[Cat.scala 33:92]
  Partial_Products_Gen partial_products_gen ( // @[mul.scala 69:38]
    .io_i_x(partial_products_gen_io_i_x),
    .io_i_y(partial_products_gen_io_i_y),
    .io_o_partial_products_0(partial_products_gen_io_o_partial_products_0),
    .io_o_partial_products_1(partial_products_gen_io_o_partial_products_1),
    .io_o_partial_products_2(partial_products_gen_io_o_partial_products_2),
    .io_o_partial_products_3(partial_products_gen_io_o_partial_products_3),
    .io_o_partial_products_4(partial_products_gen_io_o_partial_products_4),
    .io_o_partial_products_5(partial_products_gen_io_o_partial_products_5),
    .io_o_partial_products_6(partial_products_gen_io_o_partial_products_6),
    .io_o_partial_products_7(partial_products_gen_io_o_partial_products_7),
    .io_o_partial_products_8(partial_products_gen_io_o_partial_products_8),
    .io_o_partial_products_9(partial_products_gen_io_o_partial_products_9),
    .io_o_partial_products_10(partial_products_gen_io_o_partial_products_10),
    .io_o_partial_products_11(partial_products_gen_io_o_partial_products_11),
    .io_o_partial_products_12(partial_products_gen_io_o_partial_products_12),
    .io_o_partial_products_13(partial_products_gen_io_o_partial_products_13),
    .io_o_partial_products_14(partial_products_gen_io_o_partial_products_14),
    .io_o_partial_products_15(partial_products_gen_io_o_partial_products_15),
    .io_o_partial_products_16(partial_products_gen_io_o_partial_products_16),
    .io_o_partial_products_17(partial_products_gen_io_o_partial_products_17),
    .io_o_partial_products_18(partial_products_gen_io_o_partial_products_18),
    .io_o_partial_products_19(partial_products_gen_io_o_partial_products_19),
    .io_o_partial_products_20(partial_products_gen_io_o_partial_products_20),
    .io_o_partial_products_21(partial_products_gen_io_o_partial_products_21)
  );
  Wallace_Tree wallace ( // @[mul.scala 70:25]
    .io_i_partial_products_0(wallace_io_i_partial_products_0),
    .io_i_partial_products_1(wallace_io_i_partial_products_1),
    .io_i_partial_products_2(wallace_io_i_partial_products_2),
    .io_i_partial_products_3(wallace_io_i_partial_products_3),
    .io_i_partial_products_4(wallace_io_i_partial_products_4),
    .io_i_partial_products_5(wallace_io_i_partial_products_5),
    .io_i_partial_products_6(wallace_io_i_partial_products_6),
    .io_i_partial_products_7(wallace_io_i_partial_products_7),
    .io_i_partial_products_8(wallace_io_i_partial_products_8),
    .io_i_partial_products_9(wallace_io_i_partial_products_9),
    .io_i_partial_products_10(wallace_io_i_partial_products_10),
    .io_i_partial_products_11(wallace_io_i_partial_products_11),
    .io_i_partial_products_12(wallace_io_i_partial_products_12),
    .io_i_partial_products_13(wallace_io_i_partial_products_13),
    .io_i_partial_products_14(wallace_io_i_partial_products_14),
    .io_i_partial_products_15(wallace_io_i_partial_products_15),
    .io_i_partial_products_16(wallace_io_i_partial_products_16),
    .io_i_partial_products_17(wallace_io_i_partial_products_17),
    .io_i_partial_products_18(wallace_io_i_partial_products_18),
    .io_i_partial_products_19(wallace_io_i_partial_products_19),
    .io_i_partial_products_20(wallace_io_i_partial_products_20),
    .io_i_partial_products_21(wallace_io_i_partial_products_21),
    .io_o_s(wallace_io_o_s),
    .io_o_c(wallace_io_o_c)
  );
  assign io_o_out_valid = state == 3'h7; // @[mul.scala 31:32]
  assign io_o_result_hi = io_i_mulw ? _io_o_result_hi_T_2 : sum[127:64]; // @[mul.scala 86:20 87:24 90:24]
  assign io_o_result_lo = io_i_mulw ? _io_o_result_lo_T_4 : sum[63:0]; // @[mul.scala 86:20 88:24 91:24]
  assign partial_products_gen_io_i_x = _x_64_T ? _x_64_T_1 : _x_64_T_15; // @[Mux.scala 101:16]
  assign partial_products_gen_io_i_y = _x_64_T ? _y_64_T_2 : _y_64_T_15; // @[Mux.scala 101:16]
  assign wallace_io_i_partial_products_0 = partial_products_gen_io_o_partial_products_0; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_1 = partial_products_gen_io_o_partial_products_1; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_2 = partial_products_gen_io_o_partial_products_2; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_3 = partial_products_gen_io_o_partial_products_3; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_4 = partial_products_gen_io_o_partial_products_4; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_5 = partial_products_gen_io_o_partial_products_5; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_6 = partial_products_gen_io_o_partial_products_6; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_7 = partial_products_gen_io_o_partial_products_7; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_8 = partial_products_gen_io_o_partial_products_8; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_9 = partial_products_gen_io_o_partial_products_9; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_10 = partial_products_gen_io_o_partial_products_10; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_11 = partial_products_gen_io_o_partial_products_11; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_12 = partial_products_gen_io_o_partial_products_12; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_13 = partial_products_gen_io_o_partial_products_13; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_14 = partial_products_gen_io_o_partial_products_14; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_15 = partial_products_gen_io_o_partial_products_15; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_16 = partial_products_gen_io_o_partial_products_16; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_17 = partial_products_gen_io_o_partial_products_17; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_18 = partial_products_gen_io_o_partial_products_18; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_19 = partial_products_gen_io_o_partial_products_19; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_20 = partial_products_gen_io_o_partial_products_20; // @[mul.scala 39:32 74:22]
  assign wallace_io_i_partial_products_21 = partial_products_gen_io_o_partial_products_21; // @[mul.scala 39:32 74:22]
  always @(posedge clock) begin
    if (reset) begin // @[mul.scala 26:24]
      state <= 3'h0; // @[mul.scala 26:24]
    end else if (io_i_flush) begin // @[mul.scala 29:22]
      state <= 3'h0;
    end else begin
      state <= _next_state_T_1;
    end
    if (io_i_mul_valid) begin // @[mul.scala 36:22]
      multiplier <= io_i_multiplier;
    end
    if (io_i_mul_valid) begin // @[mul.scala 37:24]
      multiplicand <= io_i_multiplicand;
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
  state = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  multiplier = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  multiplicand = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
