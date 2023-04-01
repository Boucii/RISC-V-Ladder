module Data_Array(
  input          clock,
  input          reset,
  input          io_i_wen,
  input  [15:0]  io_i_wstrb,
  input  [6:0]   io_i_addr,
  input  [127:0] io_i_wdata,
  output [127:0] io_o_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [127:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [127:0] srams_0_Q; // @[data_array.scala 36:35]
  wire  srams_0_CLK; // @[data_array.scala 36:35]
  wire  srams_0_CEN; // @[data_array.scala 36:35]
  wire  srams_0_WEN; // @[data_array.scala 36:35]
  wire [127:0] srams_0_BWEN; // @[data_array.scala 36:35]
  wire [5:0] srams_0_A; // @[data_array.scala 36:35]
  wire [127:0] srams_0_D; // @[data_array.scala 36:35]
  wire [127:0] srams_1_Q; // @[data_array.scala 36:35]
  wire  srams_1_CLK; // @[data_array.scala 36:35]
  wire  srams_1_CEN; // @[data_array.scala 36:35]
  wire  srams_1_WEN; // @[data_array.scala 36:35]
  wire [127:0] srams_1_BWEN; // @[data_array.scala 36:35]
  wire [5:0] srams_1_A; // @[data_array.scala 36:35]
  wire [127:0] srams_1_D; // @[data_array.scala 36:35]
  wire  _wen_external_T_1 = ~io_i_addr[6]; // @[data_array.scala 25:23]
  wire [1:0] _wen_external_T_4 = io_i_addr[6] ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _wen_external_T_5 = _wen_external_T_1 ? 2'h1 : _wen_external_T_4; // @[Mux.scala 101:16]
  wire [1:0] _wen_external_T_7 = io_i_wen ? 2'h3 : 2'h0; // @[Bitwise.scala 77:12]
  wire [1:0] wen_external = _wen_external_T_5 & _wen_external_T_7; // @[data_array.scala 27:8]
  wire  _bwen_external_0_T_1 = ~io_i_wstrb[0]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_0 = _bwen_external_0_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_1_T_1 = ~io_i_wstrb[1]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_1 = _bwen_external_1_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_2_T_1 = ~io_i_wstrb[2]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_2 = _bwen_external_2_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_3_T_1 = ~io_i_wstrb[3]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_3 = _bwen_external_3_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_4_T_1 = ~io_i_wstrb[4]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_4 = _bwen_external_4_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_5_T_1 = ~io_i_wstrb[5]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_5 = _bwen_external_5_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_6_T_1 = ~io_i_wstrb[6]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_6 = _bwen_external_6_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_7_T_1 = ~io_i_wstrb[7]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_7 = _bwen_external_7_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_8_T_1 = ~io_i_wstrb[8]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_8 = _bwen_external_8_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_9_T_1 = ~io_i_wstrb[9]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_9 = _bwen_external_9_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_10_T_1 = ~io_i_wstrb[10]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_10 = _bwen_external_10_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_11_T_1 = ~io_i_wstrb[11]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_11 = _bwen_external_11_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_12_T_1 = ~io_i_wstrb[12]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_12 = _bwen_external_12_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_13_T_1 = ~io_i_wstrb[13]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_13 = _bwen_external_13_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_14_T_1 = ~io_i_wstrb[14]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_14 = _bwen_external_14_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire  _bwen_external_15_T_1 = ~io_i_wstrb[15]; // @[data_array.scala 34:36]
  wire [7:0] bwen_external_15 = _bwen_external_15_T_1 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [63:0] srams_0_io_BWEN_lo = {bwen_external_7,bwen_external_6,bwen_external_5,bwen_external_4,bwen_external_3,
    bwen_external_2,bwen_external_1,bwen_external_0}; // @[data_array.scala 42:49]
  wire [63:0] srams_0_io_BWEN_hi = {bwen_external_15,bwen_external_14,bwen_external_13,bwen_external_12,bwen_external_11
    ,bwen_external_10,bwen_external_9,bwen_external_8}; // @[data_array.scala 42:49]
  reg [1:0] ren_external_reg; // @[data_array.scala 47:35]
  reg  last_wen; // @[data_array.scala 50:27]
  reg [6:0] last_waddr; // @[data_array.scala 51:29]
  reg [127:0] last_wdata; // @[data_array.scala 52:29]
  wire  _io_o_rdata_T_2 = ren_external_reg == 2'h1; // @[data_array.scala 60:27]
  wire  _io_o_rdata_T_3 = ren_external_reg == 2'h2; // @[data_array.scala 61:27]
  wire [127:0] q_external_1 = srams_1_Q; // @[data_array.scala 23:26 45:23]
  wire [127:0] _io_o_rdata_T_4 = _io_o_rdata_T_3 ? q_external_1 : 128'h0; // @[Mux.scala 101:16]
  wire [127:0] q_external_0 = srams_0_Q; // @[data_array.scala 23:26 45:23]
  wire [127:0] _io_o_rdata_T_5 = _io_o_rdata_T_2 ? q_external_0 : _io_o_rdata_T_4; // @[Mux.scala 101:16]
  S011HD1P_X32Y2D128_BW srams_0 ( // @[data_array.scala 36:35]
    .Q(srams_0_Q),
    .CLK(srams_0_CLK),
    .CEN(srams_0_CEN),
    .WEN(srams_0_WEN),
    .BWEN(srams_0_BWEN),
    .A(srams_0_A),
    .D(srams_0_D)
  );
  S011HD1P_X32Y2D128_BW srams_1 ( // @[data_array.scala 36:35]
    .Q(srams_1_Q),
    .CLK(srams_1_CLK),
    .CEN(srams_1_CEN),
    .WEN(srams_1_WEN),
    .BWEN(srams_1_BWEN),
    .A(srams_1_A),
    .D(srams_1_D)
  );
  assign io_o_rdata = last_wen & last_waddr == io_i_addr ? last_wdata : _io_o_rdata_T_5; // @[data_array.scala 58:22]
  assign srams_0_CLK = clock; // @[data_array.scala 38:25]
  assign srams_0_CEN = 1'h0; // @[data_array.scala 40:25]
  assign srams_0_WEN = ~wen_external[0]; // @[data_array.scala 41:28]
  assign srams_0_BWEN = {srams_0_io_BWEN_hi,srams_0_io_BWEN_lo}; // @[data_array.scala 42:49]
  assign srams_0_A = io_i_addr[5:0]; // @[data_array.scala 43:35]
  assign srams_0_D = io_i_wdata; // @[data_array.scala 44:23]
  assign srams_1_CLK = clock; // @[data_array.scala 38:25]
  assign srams_1_CEN = 1'h0; // @[data_array.scala 40:25]
  assign srams_1_WEN = ~wen_external[1]; // @[data_array.scala 41:28]
  assign srams_1_BWEN = {srams_0_io_BWEN_hi,srams_0_io_BWEN_lo}; // @[data_array.scala 42:49]
  assign srams_1_A = io_i_addr[5:0]; // @[data_array.scala 43:35]
  assign srams_1_D = io_i_wdata; // @[data_array.scala 44:23]
  always @(posedge clock) begin
    if (reset) begin // @[data_array.scala 47:35]
      ren_external_reg <= 2'h0; // @[data_array.scala 47:35]
    end else if (_wen_external_T_1) begin // @[Mux.scala 101:16]
      ren_external_reg <= 2'h1;
    end else if (io_i_addr[6]) begin // @[Mux.scala 101:16]
      ren_external_reg <= 2'h2;
    end else begin
      ren_external_reg <= 2'h0;
    end
    if (reset) begin // @[data_array.scala 50:27]
      last_wen <= 1'h0; // @[data_array.scala 50:27]
    end else begin
      last_wen <= io_i_wen; // @[data_array.scala 54:16]
    end
    if (reset) begin // @[data_array.scala 51:29]
      last_waddr <= 7'h0; // @[data_array.scala 51:29]
    end else begin
      last_waddr <= io_i_addr; // @[data_array.scala 55:16]
    end
    if (reset) begin // @[data_array.scala 52:29]
      last_wdata <= 128'h0; // @[data_array.scala 52:29]
    end else begin
      last_wdata <= io_i_wdata; // @[data_array.scala 56:16]
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
  ren_external_reg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  last_wen = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  last_waddr = _RAND_2[6:0];
  _RAND_3 = {4{`RANDOM}};
  last_wdata = _RAND_3[127:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
