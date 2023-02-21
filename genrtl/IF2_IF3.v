module IF2_IF3(
  input         clock,
  input         reset,
  input         io_i_stall,
  input         io_i_flush,
  input         io_i_fetch_valid,
  output        io_o_fetch_valid,
  input  [63:0] io_i_pc,
  output [63:0] io_o_pc,
  input         io_i_branch_predict_pack_valid,
  input  [63:0] io_i_branch_predict_pack_target,
  input  [3:0]  io_i_branch_predict_pack_branch_type,
  input         io_i_branch_predict_pack_select,
  input         io_i_branch_predict_pack_taken,
  output        io_o_branch_predict_pack_valid,
  output [63:0] io_o_branch_predict_pack_target,
  output [3:0]  io_o_branch_predict_pack_branch_type,
  output        io_o_branch_predict_pack_select,
  output        io_o_branch_predict_pack_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc; // @[if2_if3.scala 23:21]
  reg  branch_predict_pack_valid; // @[if2_if3.scala 27:38]
  reg [63:0] branch_predict_pack_target; // @[if2_if3.scala 27:38]
  reg [3:0] branch_predict_pack_branch_type; // @[if2_if3.scala 27:38]
  reg  branch_predict_pack_select; // @[if2_if3.scala 27:38]
  reg  branch_predict_pack_taken; // @[if2_if3.scala 27:38]
  reg  fetch_valid; // @[if2_if3.scala 32:30]
  assign io_o_fetch_valid = fetch_valid; // @[if2_if3.scala 37:22]
  assign io_o_pc = pc; // @[if2_if3.scala 25:13]
  assign io_o_branch_predict_pack_valid = branch_predict_pack_valid; // @[if2_if3.scala 30:30]
  assign io_o_branch_predict_pack_target = branch_predict_pack_target; // @[if2_if3.scala 30:30]
  assign io_o_branch_predict_pack_branch_type = branch_predict_pack_branch_type; // @[if2_if3.scala 30:30]
  assign io_o_branch_predict_pack_select = branch_predict_pack_select; // @[if2_if3.scala 30:30]
  assign io_o_branch_predict_pack_taken = branch_predict_pack_taken; // @[if2_if3.scala 30:30]
  always @(posedge clock) begin
    if (reset) begin // @[if2_if3.scala 23:21]
      pc <= 64'h0; // @[if2_if3.scala 23:21]
    end else if (io_i_flush) begin // @[if2_if3.scala 24:14]
      pc <= 64'h0;
    end else if (!(io_i_stall)) begin // @[if2_if3.scala 24:35]
      pc <= io_i_pc;
    end
    if (reset) begin // @[if2_if3.scala 27:38]
      branch_predict_pack_valid <= 1'h0; // @[if2_if3.scala 27:38]
    end else if (io_i_flush) begin // @[if2_if3.scala 29:37]
      branch_predict_pack_valid <= 1'h0;
    end else if (!(io_i_stall)) begin // @[if2_if3.scala 29:62]
      branch_predict_pack_valid <= io_i_branch_predict_pack_valid;
    end
    if (reset) begin // @[if2_if3.scala 27:38]
      branch_predict_pack_target <= 64'h0; // @[if2_if3.scala 27:38]
    end else begin
      branch_predict_pack_target <= io_i_branch_predict_pack_target; // @[if2_if3.scala 28:25]
    end
    if (reset) begin // @[if2_if3.scala 27:38]
      branch_predict_pack_branch_type <= 4'h0; // @[if2_if3.scala 27:38]
    end else begin
      branch_predict_pack_branch_type <= io_i_branch_predict_pack_branch_type; // @[if2_if3.scala 28:25]
    end
    if (reset) begin // @[if2_if3.scala 27:38]
      branch_predict_pack_select <= 1'h0; // @[if2_if3.scala 27:38]
    end else begin
      branch_predict_pack_select <= io_i_branch_predict_pack_select; // @[if2_if3.scala 28:25]
    end
    if (reset) begin // @[if2_if3.scala 27:38]
      branch_predict_pack_taken <= 1'h0; // @[if2_if3.scala 27:38]
    end else begin
      branch_predict_pack_taken <= io_i_branch_predict_pack_taken; // @[if2_if3.scala 28:25]
    end
    if (reset) begin // @[if2_if3.scala 32:30]
      fetch_valid <= 1'h0; // @[if2_if3.scala 32:30]
    end else begin
      fetch_valid <= ~io_i_stall & ~io_i_flush & io_i_fetch_valid; // @[if2_if3.scala 36:17]
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
  _RAND_0 = {2{`RANDOM}};
  pc = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  branch_predict_pack_valid = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  branch_predict_pack_target = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  branch_predict_pack_branch_type = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  branch_predict_pack_select = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  branch_predict_pack_taken = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  fetch_valid = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
