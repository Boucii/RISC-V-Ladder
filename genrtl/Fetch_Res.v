module Fetch_Res(
  input  [63:0] io_i_pc,
  input         io_i_flush,
  input         io_i_stall,
  input  [63:0] io_i_fetch_res,
  input         io_i_branch_predict_pack_valid,
  input  [63:0] io_i_branch_predict_pack_target,
  input  [3:0]  io_i_branch_predict_pack_branch_type,
  input         io_i_branch_predict_pack_select,
  input         io_i_branch_predict_pack_taken,
  input         io_i_branch_presolve_pack_valid,
  input         io_i_branch_presolve_pack_taken,
  output        io_o_fetch_pack_bits_valids_0,
  output        io_o_fetch_pack_bits_valids_1,
  output [63:0] io_o_fetch_pack_bits_pc,
  output [31:0] io_o_fetch_pack_bits_insts_0,
  output [31:0] io_o_fetch_pack_bits_insts_1,
  output        io_o_fetch_pack_bits_branch_predict_pack_valid,
  output [63:0] io_o_fetch_pack_bits_branch_predict_pack_target,
  output [3:0]  io_o_fetch_pack_bits_branch_predict_pack_branch_type,
  output        io_o_fetch_pack_bits_branch_predict_pack_select,
  output        io_o_fetch_pack_bits_branch_predict_pack_taken,
  output        io_o_fetch_pack_with_presolve_valid,
  output        io_o_fetch_pack_with_presolve_bits_valids_0,
  output        io_o_fetch_pack_with_presolve_bits_valids_1,
  output [63:0] io_o_fetch_pack_with_presolve_bits_pc,
  output [31:0] io_o_fetch_pack_with_presolve_bits_insts_0,
  output [31:0] io_o_fetch_pack_with_presolve_bits_insts_1,
  output        io_o_fetch_pack_with_presolve_bits_branch_predict_pack_valid,
  output [63:0] io_o_fetch_pack_with_presolve_bits_branch_predict_pack_target,
  output [3:0]  io_o_fetch_pack_with_presolve_bits_branch_predict_pack_branch_type,
  output        io_o_fetch_pack_with_presolve_bits_branch_predict_pack_select,
  output        io_o_fetch_pack_with_presolve_bits_branch_predict_pack_taken
);
  wire  _io_o_fetch_pack_bits_valids_0_T = ~io_i_stall; // @[fetchres.scala 35:39]
  wire  _io_o_fetch_pack_bits_valids_0_T_2 = ~io_i_pc[2]; // @[fetchres.scala 35:54]
  wire  _io_o_fetch_pack_bits_valids_0_T_4 = ~io_i_flush; // @[fetchres.scala 35:69]
  wire  _io_o_fetch_pack_bits_valids_1_T_2 = _io_o_fetch_pack_bits_valids_0_T & _io_o_fetch_pack_bits_valids_0_T_4; // @[fetchres.scala 36:51]
  wire  _io_o_fetch_pack_bits_valids_1_T_8 = io_i_branch_predict_pack_valid & io_i_branch_predict_pack_taken & ~
    io_i_branch_predict_pack_select & _io_o_fetch_pack_bits_valids_0_T_2; // @[fetchres.scala 37:119]
  wire  _io_o_fetch_pack_bits_valids_1_T_9 = ~(io_i_branch_predict_pack_valid & io_i_branch_predict_pack_taken & ~
    io_i_branch_predict_pack_select & _io_o_fetch_pack_bits_valids_0_T_2); // @[fetchres.scala 37:9]
  wire  _io_o_fetch_pack_with_presolve_bits_valids_1_T_16 = io_i_branch_presolve_pack_valid &
    io_i_branch_presolve_pack_taken; // @[fetchres.scala 49:44]
  wire  _io_o_fetch_pack_with_presolve_bits_valids_1_T_17 = _io_o_fetch_pack_bits_valids_1_T_8 &
    _io_o_fetch_pack_with_presolve_bits_valids_1_T_16; // @[fetchres.scala 48:142]
  wire  _io_o_fetch_pack_with_presolve_bits_valids_1_T_18 = _io_o_fetch_pack_bits_valids_1_T_9 |
    _io_o_fetch_pack_with_presolve_bits_valids_1_T_17; // @[fetchres.scala 47:142]
  assign io_o_fetch_pack_bits_valids_0 = ~io_i_stall & ~io_i_pc[2] & ~io_i_flush; // @[fetchres.scala 35:66]
  assign io_o_fetch_pack_bits_valids_1 = _io_o_fetch_pack_bits_valids_0_T & _io_o_fetch_pack_bits_valids_0_T_4 &
    _io_o_fetch_pack_bits_valids_1_T_9; // @[fetchres.scala 36:66]
  assign io_o_fetch_pack_bits_pc = {io_i_pc[63:3],3'h0}; // @[Cat.scala 33:92]
  assign io_o_fetch_pack_bits_insts_0 = io_i_fetch_res[31:0]; // @[fetchres.scala 39:52]
  assign io_o_fetch_pack_bits_insts_1 = io_i_fetch_res[63:32]; // @[fetchres.scala 40:52]
  assign io_o_fetch_pack_bits_branch_predict_pack_valid = io_i_branch_predict_pack_valid; // @[fetchres.scala 41:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_target = io_i_branch_predict_pack_target; // @[fetchres.scala 41:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_branch_type = io_i_branch_predict_pack_branch_type; // @[fetchres.scala 41:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_select = io_i_branch_predict_pack_select; // @[fetchres.scala 41:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_taken = io_i_branch_predict_pack_taken; // @[fetchres.scala 41:46]
  assign io_o_fetch_pack_with_presolve_valid = io_o_fetch_pack_with_presolve_bits_valids_0 |
    io_o_fetch_pack_with_presolve_bits_valids_1; // @[fetchres.scala 44:90]
  assign io_o_fetch_pack_with_presolve_bits_valids_0 = io_o_fetch_pack_bits_valids_0; // @[fetchres.scala 45:50]
  assign io_o_fetch_pack_with_presolve_bits_valids_1 = _io_o_fetch_pack_bits_valids_1_T_2 &
    _io_o_fetch_pack_with_presolve_bits_valids_1_T_18; // @[fetchres.scala 46:80]
  assign io_o_fetch_pack_with_presolve_bits_pc = io_o_fetch_pack_bits_pc; // @[fetchres.scala 43:44]
  assign io_o_fetch_pack_with_presolve_bits_insts_0 = io_o_fetch_pack_bits_insts_0; // @[fetchres.scala 43:44]
  assign io_o_fetch_pack_with_presolve_bits_insts_1 = io_o_fetch_pack_bits_insts_1; // @[fetchres.scala 43:44]
  assign io_o_fetch_pack_with_presolve_bits_branch_predict_pack_valid = io_i_branch_presolve_pack_valid ? 1'h0 :
    io_o_fetch_pack_bits_branch_predict_pack_valid; // @[fetchres.scala 52:42 43:44 53:68]
  assign io_o_fetch_pack_with_presolve_bits_branch_predict_pack_target = io_o_fetch_pack_bits_branch_predict_pack_target
    ; // @[fetchres.scala 43:44]
  assign io_o_fetch_pack_with_presolve_bits_branch_predict_pack_branch_type =
    io_o_fetch_pack_bits_branch_predict_pack_branch_type; // @[fetchres.scala 43:44]
  assign io_o_fetch_pack_with_presolve_bits_branch_predict_pack_select = io_o_fetch_pack_bits_branch_predict_pack_select
    ; // @[fetchres.scala 43:44]
  assign io_o_fetch_pack_with_presolve_bits_branch_predict_pack_taken = io_o_fetch_pack_bits_branch_predict_pack_taken; // @[fetchres.scala 43:44]
endmodule
