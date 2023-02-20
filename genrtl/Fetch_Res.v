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
  input         io_o_fetch_pack_ready,
  output        io_o_fetch_pack_valid,
  output        io_o_fetch_pack_bits_valids_0,
  output        io_o_fetch_pack_bits_valids_1,
  output [63:0] io_o_fetch_pack_bits_pc,
  output [31:0] io_o_fetch_pack_bits_insts_0,
  output [31:0] io_o_fetch_pack_bits_insts_1,
  output        io_o_fetch_pack_bits_branch_predict_pack_valid,
  output [63:0] io_o_fetch_pack_bits_branch_predict_pack_target,
  output [3:0]  io_o_fetch_pack_bits_branch_predict_pack_branch_type,
  output        io_o_fetch_pack_bits_branch_predict_pack_select,
  output        io_o_fetch_pack_bits_branch_predict_pack_taken
);
  wire  _io_o_fetch_pack_bits_valids_0_T = ~io_i_stall; // @[fetchres.scala 22:39]
  wire  _io_o_fetch_pack_bits_valids_0_T_4 = ~io_i_flush; // @[fetchres.scala 22:69]
  assign io_o_fetch_pack_valid = io_o_fetch_pack_bits_valids_0 | io_o_fetch_pack_bits_valids_1; // @[fetchres.scala 21:62]
  assign io_o_fetch_pack_bits_valids_0 = ~io_i_stall & ~io_i_pc[2] & ~io_i_flush; // @[fetchres.scala 22:66]
  assign io_o_fetch_pack_bits_valids_1 = _io_o_fetch_pack_bits_valids_0_T & _io_o_fetch_pack_bits_valids_0_T_4; // @[fetchres.scala 23:51]
  assign io_o_fetch_pack_bits_pc = {io_i_pc[63:3],3'h0}; // @[Cat.scala 33:92]
  assign io_o_fetch_pack_bits_insts_0 = io_i_fetch_res[31:0]; // @[fetchres.scala 25:52]
  assign io_o_fetch_pack_bits_insts_1 = io_i_fetch_res[63:32]; // @[fetchres.scala 26:52]
  assign io_o_fetch_pack_bits_branch_predict_pack_valid = io_i_branch_predict_pack_valid; // @[fetchres.scala 27:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_target = io_i_branch_predict_pack_target; // @[fetchres.scala 27:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_branch_type = io_i_branch_predict_pack_branch_type; // @[fetchres.scala 27:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_select = io_i_branch_predict_pack_select; // @[fetchres.scala 27:46]
  assign io_o_fetch_pack_bits_branch_predict_pack_taken = io_i_branch_predict_pack_taken; // @[fetchres.scala 27:46]
endmodule
