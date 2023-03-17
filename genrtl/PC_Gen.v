module PC_Gen(
  input         clock,
  input         reset,
  input         io_i_stall,
  input         io_i_pc_redirect_valid,
  input  [63:0] io_i_pc_redirect_target,
  input         io_i_branch_predict_pack_valid,
  input  [63:0] io_i_branch_predict_pack_target,
  input         io_i_branch_predict_pack_select,
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
  reg [63:0] pc; // @[pc_gen.scala 24:21]
  wire [3:0] _npc_T_1 = io_i_branch_presolve_pack_pc[2] ? 4'h4 : 4'h8; // @[pc_gen.scala 40:50]
  wire [63:0] _GEN_5 = {{60'd0}, _npc_T_1}; // @[pc_gen.scala 40:45]
  wire [63:0] _npc_T_3 = io_i_branch_presolve_pack_pc + _GEN_5; // @[pc_gen.scala 40:45]
  wire [63:0] _npc_T_5 = pc[2] ? 64'h4 : 64'h8; // @[pc_gen.scala 47:24]
  wire [63:0] _npc_T_7 = pc + _npc_T_5; // @[pc_gen.scala 47:19]
  wire [63:0] _GEN_0 = io_i_branch_predict_pack_valid & io_i_branch_predict_pack_taken & ~(~
    io_i_branch_predict_pack_select & pc[2]) ? io_i_branch_predict_pack_target : _npc_T_7; // @[pc_gen.scala 44:144 45:13 47:13]
  wire [63:0] _GEN_1 = io_i_stall ? pc : _GEN_0; // @[pc_gen.scala 41:27 42:13]
  assign io_o_pc = pc; // @[pc_gen.scala 31:13]
  always @(posedge clock) begin
    if (reset) begin // @[pc_gen.scala 24:21]
      pc <= 64'h80000000; // @[pc_gen.scala 24:21]
    end else if (io_i_pc_redirect_valid) begin // @[pc_gen.scala 32:33]
      pc <= io_i_pc_redirect_target; // @[pc_gen.scala 33:13]
    end else if (io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred) begin // @[pc_gen.scala 34:83]
      pc <= io_i_branch_resolve_pack_target; // @[pc_gen.scala 35:13]
    end else if (io_i_branch_presolve_pack_valid & io_i_branch_presolve_pack_taken) begin // @[pc_gen.scala 36:83]
      pc <= _npc_T_3; // @[pc_gen.scala 40:13]
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
