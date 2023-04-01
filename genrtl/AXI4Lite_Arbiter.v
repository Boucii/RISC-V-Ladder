module AXI4Lite_Arbiter(
  input          clock,
  input          reset,
  output         io_in1_readAddr_ready,
  input          io_in1_readAddr_valid,
  input  [63:0]  io_in1_readAddr_bits_addr,
  input  [2:0]   io_in1_readAddr_bits_prot,
  input          io_in1_readData_ready,
  output         io_in1_readData_valid,
  output [127:0] io_in1_readData_bits_data,
  output [1:0]   io_in1_readData_bits_resp,
  output         io_in1_writeAddr_ready,
  input          io_in1_writeAddr_valid,
  input  [63:0]  io_in1_writeAddr_bits_addr,
  input  [2:0]   io_in1_writeAddr_bits_prot,
  output         io_in1_writeData_ready,
  input          io_in1_writeData_valid,
  input  [127:0] io_in1_writeData_bits_data,
  input  [15:0]  io_in1_writeData_bits_strb,
  input          io_in1_writeResp_ready,
  output         io_in1_writeResp_valid,
  output [1:0]   io_in1_writeResp_bits,
  input          io_in2_readAddr_valid,
  input  [63:0]  io_in2_readAddr_bits_addr,
  input          io_in2_readData_ready,
  output         io_in2_readData_valid,
  output [127:0] io_in2_readData_bits_data,
  output         io_in2_writeAddr_ready,
  input          io_in2_writeAddr_valid,
  input  [63:0]  io_in2_writeAddr_bits_addr,
  output         io_in2_writeData_ready,
  input          io_in2_writeData_valid,
  input  [127:0] io_in2_writeData_bits_data,
  input  [15:0]  io_in2_writeData_bits_strb,
  input          io_in2_writeResp_ready,
  output         io_in2_writeResp_valid,
  input          io_out_readAddr_ready,
  output         io_out_readAddr_valid,
  output [63:0]  io_out_readAddr_bits_addr,
  output [2:0]   io_out_readAddr_bits_prot,
  output         io_out_readData_ready,
  input          io_out_readData_valid,
  input  [127:0] io_out_readData_bits_data,
  input  [1:0]   io_out_readData_bits_resp,
  input          io_out_writeAddr_ready,
  output         io_out_writeAddr_valid,
  output [63:0]  io_out_writeAddr_bits_addr,
  output [2:0]   io_out_writeAddr_bits_prot,
  input          io_out_writeData_ready,
  output         io_out_writeData_valid,
  output [127:0] io_out_writeData_bits_data,
  output [15:0]  io_out_writeData_bits_strb,
  output         io_out_writeResp_ready,
  input          io_out_writeResp_valid,
  input  [1:0]   io_out_writeResp_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[axi_arbiter.scala 13:22]
  wire  in1Request = io_in1_writeAddr_valid | io_in1_readAddr_valid; // @[axi_arbiter.scala 14:43]
  wire  in2Request = io_in2_writeAddr_valid | io_in2_readAddr_valid; // @[axi_arbiter.scala 15:43]
  wire  in1done = io_in1_writeResp_valid & io_in1_writeResp_ready | io_in1_readData_valid & io_in1_readData_ready; // @[axi_arbiter.scala 16:69]
  wire  in2done = io_in2_writeResp_valid & io_in2_writeResp_ready | io_in2_readData_valid & io_in2_readData_ready; // @[axi_arbiter.scala 17:69]
  wire  _state_T = state == 2'h0; // @[axi_arbiter.scala 21:12]
  wire  _state_T_1 = state == 2'h0 & in1Request; // @[axi_arbiter.scala 21:23]
  wire  _state_T_2 = state == 2'h0 & in1Request & in2Request; // @[axi_arbiter.scala 21:37]
  wire  _state_T_5 = ~in2Request; // @[axi_arbiter.scala 22:40]
  wire  _state_T_6 = _state_T_1 & ~in2Request; // @[axi_arbiter.scala 22:37]
  wire  _state_T_10 = _state_T & ~in1Request & in2Request; // @[axi_arbiter.scala 23:38]
  wire  _state_T_11 = state == 2'h1; // @[axi_arbiter.scala 24:12]
  wire  _state_T_12 = state == 2'h1 & in1done; // @[axi_arbiter.scala 24:22]
  wire  _state_T_14 = state == 2'h1 & in1done & _state_T_5; // @[axi_arbiter.scala 24:33]
  wire  _state_T_17 = _state_T_12 & in2Request; // @[axi_arbiter.scala 25:33]
  wire  _state_T_19 = state == 2'h2 & in2done; // @[axi_arbiter.scala 26:22]
  wire [1:0] _state_T_20 = _state_T_19 ? 2'h0 : state; // @[Mux.scala 101:16]
  wire [1:0] _state_T_21 = _state_T_17 ? 2'h2 : _state_T_20; // @[Mux.scala 101:16]
  wire [1:0] _state_T_22 = _state_T_14 ? 2'h0 : _state_T_21; // @[Mux.scala 101:16]
  assign io_in1_readAddr_ready = io_out_readAddr_ready; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_readData_valid = io_out_readData_valid; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_readData_bits_data = io_out_readData_bits_data; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_readData_bits_resp = io_out_readData_bits_resp; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_writeAddr_ready = io_out_writeAddr_ready; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_writeData_ready = io_out_writeData_ready; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_writeResp_valid = io_out_writeResp_valid; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in1_writeResp_bits = io_out_writeResp_bits; // @[axi_arbiter.scala 32:30 33:12]
  assign io_in2_readData_valid = io_out_readData_valid; // @[axi_arbiter.scala 35:30 36:12]
  assign io_in2_readData_bits_data = io_out_readData_bits_data; // @[axi_arbiter.scala 35:30 36:12]
  assign io_in2_writeAddr_ready = io_out_writeAddr_ready; // @[axi_arbiter.scala 35:30 36:12]
  assign io_in2_writeData_ready = io_out_writeData_ready; // @[axi_arbiter.scala 35:30 36:12]
  assign io_in2_writeResp_valid = io_out_writeResp_valid; // @[axi_arbiter.scala 35:30 36:12]
  assign io_out_readAddr_valid = _state_T_11 ? io_in1_readAddr_valid : io_in2_readAddr_valid; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_readAddr_bits_addr = _state_T_11 ? io_in1_readAddr_bits_addr : io_in2_readAddr_bits_addr; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_readAddr_bits_prot = _state_T_11 ? io_in1_readAddr_bits_prot : 3'h0; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_readData_ready = _state_T_11 ? io_in1_readData_ready : io_in2_readData_ready; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeAddr_valid = _state_T_11 ? io_in1_writeAddr_valid : io_in2_writeAddr_valid; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeAddr_bits_addr = _state_T_11 ? io_in1_writeAddr_bits_addr : io_in2_writeAddr_bits_addr; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeAddr_bits_prot = _state_T_11 ? io_in1_writeAddr_bits_prot : 3'h0; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeData_valid = _state_T_11 ? io_in1_writeData_valid : io_in2_writeData_valid; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeData_bits_data = _state_T_11 ? io_in1_writeData_bits_data : io_in2_writeData_bits_data; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeData_bits_strb = _state_T_11 ? io_in1_writeData_bits_strb : io_in2_writeData_bits_strb; // @[axi_arbiter.scala 32:30 33:12]
  assign io_out_writeResp_ready = _state_T_11 ? io_in1_writeResp_ready : io_in2_writeResp_ready; // @[axi_arbiter.scala 32:30 33:12]
  always @(posedge clock) begin
    if (reset) begin // @[axi_arbiter.scala 13:22]
      state <= 2'h0; // @[axi_arbiter.scala 13:22]
    end else if (_state_T_2) begin // @[Mux.scala 101:16]
      state <= 2'h2;
    end else if (_state_T_6) begin // @[Mux.scala 101:16]
      state <= 2'h1;
    end else if (_state_T_10) begin // @[Mux.scala 101:16]
      state <= 2'h2;
    end else begin
      state <= _state_T_22;
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
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
