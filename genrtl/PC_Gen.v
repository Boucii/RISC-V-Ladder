module PC_Gen(
  input         clock,
  input         reset,
  input         io_i_stall,
  input         io_i_pc_redirect_valid,
  input  [63:0] io_i_pc_redirect_target,
  input         io_i_branch_predict_pack_valid,
  input  [63:0] io_i_branch_predict_pack_target,
  input         io_i_branch_predict_pack_taken,
  input         io_i_branch_presolve_pack_valid,
  input         io_i_branch_presolve_pack_taken,
  input  [63:0] io_i_branch_presolve_pack_pc,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  input  [63:0] io_i_branch_resolve_pack_target,
  output [63:0] io_o_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc; // @[pc_gen.scala 23:21]
  wire [63:0] _npc_T_1 = io_i_branch_presolve_pack_pc + 64'h4; // @[pc_gen.scala 32:45]
  wire [63:0] _npc_T_3 = pc + 64'h8; // @[pc_gen.scala 38:19]
  wire [63:0] _GEN_0 = io_i_stall ? pc : _npc_T_3; // @[pc_gen.scala 35:27 36:13 38:13]
  wire [63:0] _GEN_1 = io_i_branch_predict_pack_valid & io_i_branch_predict_pack_taken ? io_i_branch_predict_pack_target
     : _GEN_0; // @[pc_gen.scala 33:81 34:13]
  assign io_o_pc = pc; // @[pc_gen.scala 26:13]
  always @(posedge clock) begin
    if (reset) begin // @[pc_gen.scala 23:21]
      pc <= 64'h80000000; // @[pc_gen.scala 23:21]
    end else if (io_i_pc_redirect_valid) begin // @[pc_gen.scala 27:33]
      pc <= io_i_pc_redirect_target; // @[pc_gen.scala 28:13]
    end else if (io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred) begin // @[pc_gen.scala 29:83]
      pc <= io_i_branch_resolve_pack_target; // @[pc_gen.scala 30:13]
    end else if (io_i_branch_presolve_pack_valid & io_i_branch_presolve_pack_taken) begin // @[pc_gen.scala 31:83]
      pc <= _npc_T_1; // @[pc_gen.scala 32:13]
    end else begin
      pc <= _GEN_1;
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
