module Branch_Presolve(
  input         io_i_fetch_pack_valids_0,
  input  [63:0] io_i_fetch_pack_pc,
  input  [31:0] io_i_fetch_pack_insts_0,
  input         io_i_fetch_pack_branch_predict_pack_valid,
  input         io_i_fetch_pack_branch_predict_pack_taken,
  output        io_o_branch_presolve_pack_valid,
  output        io_o_branch_presolve_pack_taken,
  output [63:0] io_o_branch_presolve_pack_pc
);
  wire [31:0] branch_decoder0_invInputs = ~io_i_fetch_pack_insts_0; // @[pla.scala 78:21]
  wire  branch_decoder0_andMatrixInput_0 = io_i_fetch_pack_insts_0[0]; // @[pla.scala 90:45]
  wire  branch_decoder0_andMatrixInput_1 = io_i_fetch_pack_insts_0[1]; // @[pla.scala 90:45]
  wire  branch_decoder0_andMatrixInput_2 = branch_decoder0_invInputs[2]; // @[pla.scala 91:29]
  wire  branch_decoder0_andMatrixInput_3 = branch_decoder0_invInputs[3]; // @[pla.scala 91:29]
  wire  branch_decoder0_andMatrixInput_4 = branch_decoder0_invInputs[4]; // @[pla.scala 91:29]
  wire  branch_decoder0_andMatrixInput_5 = io_i_fetch_pack_insts_0[5]; // @[pla.scala 90:45]
  wire  branch_decoder0_andMatrixInput_6 = io_i_fetch_pack_insts_0[6]; // @[pla.scala 90:45]
  wire  branch_decoder0_andMatrixInput_7 = branch_decoder0_invInputs[13]; // @[pla.scala 91:29]
  wire [7:0] _branch_decoder0_T = {branch_decoder0_andMatrixInput_0,branch_decoder0_andMatrixInput_1,
    branch_decoder0_andMatrixInput_2,branch_decoder0_andMatrixInput_3,branch_decoder0_andMatrixInput_4,
    branch_decoder0_andMatrixInput_5,branch_decoder0_andMatrixInput_6,branch_decoder0_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _branch_decoder0_T_1 = &_branch_decoder0_T; // @[pla.scala 98:74]
  wire  branch_decoder0_andMatrixInput_2_1 = io_i_fetch_pack_insts_0[2]; // @[pla.scala 90:45]
  wire  branch_decoder0_andMatrixInput_7_1 = branch_decoder0_invInputs[12]; // @[pla.scala 91:29]
  wire  branch_decoder0_andMatrixInput_9 = branch_decoder0_invInputs[14]; // @[pla.scala 91:29]
  wire [9:0] _branch_decoder0_T_2 = {branch_decoder0_andMatrixInput_0,branch_decoder0_andMatrixInput_1,
    branch_decoder0_andMatrixInput_2_1,branch_decoder0_andMatrixInput_3,branch_decoder0_andMatrixInput_4,
    branch_decoder0_andMatrixInput_5,branch_decoder0_andMatrixInput_6,branch_decoder0_andMatrixInput_7_1,
    branch_decoder0_andMatrixInput_7,branch_decoder0_andMatrixInput_9}; // @[Cat.scala 33:92]
  wire  _branch_decoder0_T_3 = &_branch_decoder0_T_2; // @[pla.scala 98:74]
  wire  branch_decoder0_andMatrixInput_3_2 = io_i_fetch_pack_insts_0[3]; // @[pla.scala 90:45]
  wire [6:0] _branch_decoder0_T_4 = {branch_decoder0_andMatrixInput_0,branch_decoder0_andMatrixInput_1,
    branch_decoder0_andMatrixInput_2_1,branch_decoder0_andMatrixInput_3_2,branch_decoder0_andMatrixInput_4,
    branch_decoder0_andMatrixInput_5,branch_decoder0_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _branch_decoder0_T_5 = &_branch_decoder0_T_4; // @[pla.scala 98:74]
  wire  branch_decoder0_andMatrixInput_7_2 = io_i_fetch_pack_insts_0[14]; // @[pla.scala 90:45]
  wire [7:0] _branch_decoder0_T_6 = {branch_decoder0_andMatrixInput_0,branch_decoder0_andMatrixInput_1,
    branch_decoder0_andMatrixInput_2,branch_decoder0_andMatrixInput_3,branch_decoder0_andMatrixInput_4,
    branch_decoder0_andMatrixInput_5,branch_decoder0_andMatrixInput_6,branch_decoder0_andMatrixInput_7_2}; // @[Cat.scala 33:92]
  wire  _branch_decoder0_T_7 = &_branch_decoder0_T_6; // @[pla.scala 98:74]
  wire [1:0] _branch_decoder0_orMatrixOutputs_T = {_branch_decoder0_T_1,_branch_decoder0_T_7}; // @[Cat.scala 33:92]
  wire  _branch_decoder0_orMatrixOutputs_T_1 = |_branch_decoder0_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [1:0] _branch_decoder0_orMatrixOutputs_T_2 = {_branch_decoder0_T_3,_branch_decoder0_T_5}; // @[Cat.scala 33:92]
  wire  _branch_decoder0_orMatrixOutputs_T_3 = |_branch_decoder0_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [3:0] branch_decoder0_orMatrixOutputs = {_branch_decoder0_orMatrixOutputs_T_3,
    _branch_decoder0_orMatrixOutputs_T_1,2'h0}; // @[Cat.scala 33:92]
  wire [3:0] branch_decoder0_invMatrixOutputs = {branch_decoder0_orMatrixOutputs[3],branch_decoder0_orMatrixOutputs[2],
    branch_decoder0_orMatrixOutputs[1],branch_decoder0_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire  br0 = branch_decoder0_invMatrixOutputs[0] | branch_decoder0_invMatrixOutputs[1] |
    branch_decoder0_invMatrixOutputs[2] | branch_decoder0_invMatrixOutputs[3]; // @[branch_presolve.scala 45:78]
  wire  _io_o_branch_presolve_pack_valid_T_3 = io_i_fetch_pack_valids_0 & ~br0 &
    io_i_fetch_pack_branch_predict_pack_valid & io_i_fetch_pack_branch_predict_pack_taken; // @[branch_presolve.scala 51:120]
  wire [63:0] _io_o_branch_presolve_pack_pc_T_1 = {io_i_fetch_pack_pc[63:3],3'h0}; // @[Cat.scala 33:92]
  wire [3:0] _io_o_branch_presolve_pack_pc_T_8 = _io_o_branch_presolve_pack_valid_T_3 ? 4'h4 : 4'h8; // @[branch_presolve.scala 55:81]
  wire [63:0] _GEN_0 = {{60'd0}, _io_o_branch_presolve_pack_pc_T_8}; // @[branch_presolve.scala 55:76]
  assign io_o_branch_presolve_pack_valid = io_i_fetch_pack_valids_0 & ~br0 & io_i_fetch_pack_branch_predict_pack_valid
     & io_i_fetch_pack_branch_predict_pack_taken; // @[branch_presolve.scala 51:120]
  assign io_o_branch_presolve_pack_taken = io_i_fetch_pack_branch_predict_pack_taken; // @[branch_presolve.scala 57:37]
  assign io_o_branch_presolve_pack_pc = _io_o_branch_presolve_pack_pc_T_1 + _GEN_0; // @[branch_presolve.scala 55:76]
endmodule
