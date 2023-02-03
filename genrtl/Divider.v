module Divider(
  input         clock,
  input         reset,
  input  [63:0] io_i_dividend,
  input  [63:0] io_i_divisor,
  input         io_i_div_valid,
  input         io_i_divw,
  input         io_i_div_signed,
  input         io_i_flush,
  output        io_o_out_valid,
  output [63:0] io_o_quotient,
  output [63:0] io_o_remainder
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [127:0] _RAND_2;
  reg [127:0] _RAND_3;
  reg [63:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] state; // @[div.scala 26:24]
  wire [6:0] _next_state_T_1 = state + 7'h1; // @[div.scala 30:33]
  wire  _next_state_T_3 = state == 7'h41; // @[div.scala 31:29]
  wire  _next_state_T_4 = state > 7'h41 | state == 7'h41; // @[div.scala 31:21]
  wire  _next_state_T_5 = state == 7'h0; // @[div.scala 32:15]
  wire [6:0] _next_state_T_7 = _next_state_T_5 ? {{6'd0}, io_i_div_valid} : _next_state_T_1; // @[Mux.scala 101:16]
  wire [6:0] next_state = _next_state_T_4 ? 7'h0 : _next_state_T_7; // @[Mux.scala 101:16]
  wire  _T = ~io_i_div_signed; // @[div.scala 42:10]
  wire  _quotient_sign_T_4 = ~io_i_dividend[31]; // @[div.scala 46:73]
  wire  _quotient_sign_T_7 = ~io_i_dividend[31] & ~io_i_divisor[31]; // @[div.scala 46:92]
  wire  _quotient_sign_T_13 = ~io_i_dividend[63]; // @[div.scala 48:73]
  wire  _quotient_sign_T_16 = ~io_i_dividend[63] & ~io_i_divisor[63]; // @[div.scala 48:92]
  wire  _GEN_0 = io_i_divw ? io_i_dividend[31] & io_i_divisor[31] | ~io_i_dividend[31] & ~io_i_divisor[31] :
    io_i_dividend[63] & io_i_divisor[63] | ~io_i_dividend[63] & ~io_i_divisor[63]; // @[div.scala 45:24 46:27 48:27]
  wire  quotient_sign = ~io_i_div_signed | _GEN_0; // @[div.scala 42:27 43:23]
  wire  _GEN_2 = io_i_divw ? _quotient_sign_T_4 & io_i_divisor[31] | _quotient_sign_T_7 : _quotient_sign_T_13 &
    io_i_divisor[63] | _quotient_sign_T_16; // @[div.scala 54:24 55:28 57:28]
  wire  remainder_sign = _T | _GEN_2; // @[div.scala 51:28 52:24]
  wire [63:0] _GEN_4 = io_i_divw ? {{32'd0}, io_i_dividend[31:0]} : io_i_dividend; // @[div.scala 64:24 65:31 68:31]
  wire [63:0] _GEN_5 = io_i_divw ? {{32'd0}, io_i_divisor[31:0]} : io_i_divisor; // @[div.scala 64:24 66:30 69:30]
  wire [63:0] _dividend_unsigned_T_3 = ~io_i_dividend; // @[div.scala 73:80]
  wire [63:0] _dividend_unsigned_T_5 = _dividend_unsigned_T_3 + 64'h1; // @[div.scala 73:95]
  wire [31:0] _dividend_unsigned_T_8 = io_i_dividend[31] ? _dividend_unsigned_T_5[31:0] : io_i_dividend[31:0]; // @[div.scala 73:59]
  wire [63:0] _dividend_unsigned_T_9 = {32'h0,_dividend_unsigned_T_8}; // @[Cat.scala 33:92]
  wire [63:0] _divisor_unsigned_T_3 = ~io_i_divisor; // @[div.scala 74:78]
  wire [63:0] _divisor_unsigned_T_5 = _divisor_unsigned_T_3 + 64'h1; // @[div.scala 74:92]
  wire [31:0] _divisor_unsigned_T_8 = io_i_divisor[31] ? _divisor_unsigned_T_5[31:0] : io_i_divisor[31:0]; // @[div.scala 74:58]
  wire [63:0] _divisor_unsigned_T_9 = {32'h0,_divisor_unsigned_T_8}; // @[Cat.scala 33:92]
  wire [63:0] _dividend_unsigned_T_14 = io_i_dividend[63] ? _dividend_unsigned_T_5 : io_i_dividend; // @[div.scala 76:37]
  wire [63:0] _divisor_unsigned_T_14 = io_i_divisor[63] ? _divisor_unsigned_T_5 : io_i_divisor; // @[div.scala 77:36]
  wire [63:0] _GEN_6 = io_i_divw ? _dividend_unsigned_T_9 : _dividend_unsigned_T_14; // @[div.scala 72:24 73:31 76:31]
  wire [63:0] _GEN_7 = io_i_divw ? _divisor_unsigned_T_9 : _divisor_unsigned_T_14; // @[div.scala 72:24 74:30 77:30]
  wire [63:0] dividend_unsigned = _T ? _GEN_4 : _GEN_6; // @[div.scala 63:27]
  wire [63:0] divisor_unsigned = _T ? _GEN_5 : _GEN_7; // @[div.scala 63:27]
  reg [1:0] signs; // @[div.scala 81:20]
  wire [1:0] _signs_T = {remainder_sign,quotient_sign}; // @[Cat.scala 33:92]
  reg [127:0] temp_op1; // @[div.scala 87:23]
  reg [127:0] temp_op2; // @[div.scala 88:23]
  wire [127:0] div_temp = temp_op1 - temp_op2; // @[div.scala 90:26]
  wire  _temp_op1_T = next_state == 7'h1; // @[div.scala 93:32]
  wire [127:0] _temp_op1_T_1 = {64'h0,dividend_unsigned}; // @[Cat.scala 33:92]
  wire  _temp_op1_T_3 = ~div_temp[127]; // @[div.scala 93:80]
  wire [127:0] _temp_op2_T_2 = {1'h0,divisor_unsigned,63'h0}; // @[Cat.scala 33:92]
  wire [127:0] _temp_op2_T_4 = {1'h0,temp_op2[127:1]}; // @[Cat.scala 33:92]
  reg [63:0] ans; // @[div.scala 96:22]
  wire  _next_ans_T_2 = state > 7'h0 & state < 7'h41; // @[div.scala 101:22]
  wire [63:0] _next_ans_T_6 = {ans[62:0],_temp_op1_T_3}; // @[Cat.scala 33:92]
  wire [31:0] _quotient_signed_T_3 = ~ans[31:0]; // @[div.scala 110:67]
  wire [31:0] _quotient_signed_T_5 = _quotient_signed_T_3 + 32'h1; // @[div.scala 110:77]
  wire [63:0] _quotient_signed_T_6 = {32'hffffffff,_quotient_signed_T_5}; // @[Cat.scala 33:92]
  wire [63:0] _quotient_signed_T_7 = signs[0] ? ans : _quotient_signed_T_6; // @[div.scala 110:31]
  wire [63:0] _quotient_signed_T_9 = ~ans; // @[div.scala 112:45]
  wire [63:0] _quotient_signed_T_11 = _quotient_signed_T_9 + 64'h1; // @[div.scala 112:49]
  wire [63:0] _quotient_signed_T_12 = signs[0] ? ans : _quotient_signed_T_11; // @[div.scala 112:31]
  wire [31:0] _remainder_signed_T_3 = ~temp_op1[31:0]; // @[div.scala 115:73]
  wire [31:0] _remainder_signed_T_5 = _remainder_signed_T_3 + 32'h1; // @[div.scala 115:88]
  wire [63:0] _remainder_signed_T_6 = {32'hffffffff,_remainder_signed_T_5}; // @[Cat.scala 33:92]
  wire [127:0] _remainder_signed_T_7 = signs[1] ? temp_op1 : {{64'd0}, _remainder_signed_T_6}; // @[div.scala 115:32]
  wire [127:0] _remainder_signed_T_9 = ~temp_op1; // @[div.scala 117:51]
  wire [127:0] _remainder_signed_T_11 = _remainder_signed_T_9 + 128'h1; // @[div.scala 117:60]
  wire [127:0] _remainder_signed_T_12 = signs[1] ? temp_op1 : _remainder_signed_T_11; // @[div.scala 117:32]
  wire [127:0] _GEN_12 = io_i_divw ? _remainder_signed_T_7 : _remainder_signed_T_12; // @[div.scala 114:20 115:26 117:26]
  assign io_o_out_valid = state == 7'h41; // @[div.scala 37:29]
  assign io_o_quotient = io_i_divw ? _quotient_signed_T_7 : _quotient_signed_T_12; // @[div.scala 109:20 110:25 112:25]
  assign io_o_remainder = _GEN_12[63:0]; // @[div.scala 107:32]
  always @(posedge clock) begin
    if (reset) begin // @[div.scala 26:24]
      state <= 7'h0; // @[div.scala 26:24]
    end else if (io_i_flush) begin // @[div.scala 34:17]
      state <= 7'h0;
    end else if (_next_state_T_4) begin // @[Mux.scala 101:16]
      state <= 7'h0;
    end else if (_next_state_T_5) begin // @[Mux.scala 101:16]
      state <= {{6'd0}, io_i_div_valid};
    end else begin
      state <= _next_state_T_1;
    end
    if (state == 7'h1) begin // @[div.scala 82:24]
      signs <= _signs_T; // @[div.scala 83:15]
    end
    if (next_state == 7'h1) begin // @[div.scala 93:20]
      temp_op1 <= _temp_op1_T_1;
    end else if (~div_temp[127]) begin // @[div.scala 93:79]
      temp_op1 <= div_temp;
    end
    if (_temp_op1_T) begin // @[div.scala 94:20]
      temp_op2 <= _temp_op2_T_2;
    end else begin
      temp_op2 <= _temp_op2_T_4;
    end
    if (reset) begin // @[div.scala 96:22]
      ans <= 64'h0; // @[div.scala 96:22]
    end else if (_next_ans_T_2) begin // @[Mux.scala 101:16]
      ans <= _next_ans_T_6;
    end else if (_next_state_T_5) begin // @[Mux.scala 101:16]
      ans <= 64'h0;
    end else if (!(_next_state_T_3)) begin // @[Mux.scala 101:16]
      ans <= 64'h0;
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
  state = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  signs = _RAND_1[1:0];
  _RAND_2 = {4{`RANDOM}};
  temp_op1 = _RAND_2[127:0];
  _RAND_3 = {4{`RANDOM}};
  temp_op2 = _RAND_3[127:0];
  _RAND_4 = {2{`RANDOM}};
  ans = _RAND_4[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
