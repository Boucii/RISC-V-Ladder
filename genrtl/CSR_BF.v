module CSR_BF(
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
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[execute_unit.scala 429:24]
  reg  uop_valid; // @[execute_unit.scala 433:22]
  reg [31:0] uop_pc; // @[execute_unit.scala 433:22]
  reg [31:0] uop_inst; // @[execute_unit.scala 433:22]
  reg [6:0] uop_func_code; // @[execute_unit.scala 433:22]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 433:22]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 433:22]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 433:22]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 433:22]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 433:22]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 433:22]
  wire  _next_state_T_7 = io_i_rollback_rob_idx < uop_rob_idx & io_i_rollback_rob_idx[6] & ~uop_rob_idx[6]; // @[execute_unit.scala 450:84]
  wire  _next_state_T_9 = io_i_rollback_valid & (io_i_rollback_rob_idx > uop_rob_idx | _next_state_T_7); // @[execute_unit.scala 449:30]
  wire  _next_state_T_10 = ~io_i_exception; // @[execute_unit.scala 451:10]
  wire  _next_state_T_15 = ~io_i_exception & ~state & (uop_valid & ~io_i_select_to_commit); // @[execute_unit.scala 451:50]
  wire  _next_state_T_19 = _next_state_T_10 & state & io_i_select_to_commit; // @[execute_unit.scala 452:50]
  wire  _next_state_T_20 = _next_state_T_19 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_22 = _next_state_T_9 ? 1'h0 : _next_state_T_15 | _next_state_T_20; // @[Mux.scala 101:16]
  wire  _next_state_T_23 = io_i_exception ? 1'h0 : _next_state_T_22; // @[Mux.scala 101:16]
  wire [1:0] next_state = {{1'd0}, _next_state_T_23}; // @[execute_unit.scala 430:26 447:16]
  wire [1:0] _GEN_1 = reset ? 2'h0 : next_state; // @[execute_unit.scala 429:{24,24} 431:11]
  assign io_o_ex_res_pack_valid = uop_valid; // @[execute_unit.scala 443:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 442:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 442:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 455:26]
  always @(posedge clock) begin
    state <= _GEN_1[0]; // @[execute_unit.scala 429:{24,24} 431:11]
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_valid <= 1'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select_to_commit & ~io_i_select | io_i_exception) begin // @[execute_unit.scala 436:66]
      uop_valid <= 1'h0; // @[execute_unit.scala 437:23]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_pc <= 32'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_inst <= 32'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_func_code <= 7'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 433:22]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 433:22]
    end else if (io_i_select) begin // @[execute_unit.scala 435:20]
      uop_alu_sel <= io_i_uop_alu_sel;
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
  state = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  uop_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  uop_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  uop_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  uop_func_code = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  uop_phy_dst = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  uop_stale_dst = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  uop_arch_dst = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  uop_rob_idx = _RAND_8[6:0];
  _RAND_9 = {2{`RANDOM}};
  uop_src1_value = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  uop_alu_sel = _RAND_10[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
