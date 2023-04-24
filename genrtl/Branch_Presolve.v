module Branch_Presolve(
  input         io_i_fetch_pack_valids_0,
  input         io_i_fetch_pack_valids_1,
  input  [63:0] io_i_fetch_pack_pc,
  input  [31:0] io_i_fetch_pack_insts_0,
  input  [31:0] io_i_fetch_pack_insts_1,
  input         io_i_fetch_pack_branch_predict_pack_valid,
  input         io_i_fetch_pack_branch_predict_pack_select,
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
  wire [31:0] branch_decoder1_invInputs = ~io_i_fetch_pack_insts_1; // @[pla.scala 78:21]
  wire  branch_decoder1_andMatrixInput_0 = io_i_fetch_pack_insts_1[0]; // @[pla.scala 90:45]
  wire  branch_decoder1_andMatrixInput_1 = io_i_fetch_pack_insts_1[1]; // @[pla.scala 90:45]
  wire  branch_decoder1_andMatrixInput_2 = branch_decoder1_invInputs[2]; // @[pla.scala 91:29]
  wire  branch_decoder1_andMatrixInput_3 = branch_decoder1_invInputs[3]; // @[pla.scala 91:29]
  wire  branch_decoder1_andMatrixInput_4 = branch_decoder1_invInputs[4]; // @[pla.scala 91:29]
  wire  branch_decoder1_andMatrixInput_5 = io_i_fetch_pack_insts_1[5]; // @[pla.scala 90:45]
  wire  branch_decoder1_andMatrixInput_6 = io_i_fetch_pack_insts_1[6]; // @[pla.scala 90:45]
  wire  branch_decoder1_andMatrixInput_7 = branch_decoder1_invInputs[13]; // @[pla.scala 91:29]
  wire [7:0] _branch_decoder1_T = {branch_decoder1_andMatrixInput_0,branch_decoder1_andMatrixInput_1,
    branch_decoder1_andMatrixInput_2,branch_decoder1_andMatrixInput_3,branch_decoder1_andMatrixInput_4,
    branch_decoder1_andMatrixInput_5,branch_decoder1_andMatrixInput_6,branch_decoder1_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _branch_decoder1_T_1 = &_branch_decoder1_T; // @[pla.scala 98:74]
  wire  branch_decoder1_andMatrixInput_2_1 = io_i_fetch_pack_insts_1[2]; // @[pla.scala 90:45]
  wire  branch_decoder1_andMatrixInput_7_1 = branch_decoder1_invInputs[12]; // @[pla.scala 91:29]
  wire  branch_decoder1_andMatrixInput_9 = branch_decoder1_invInputs[14]; // @[pla.scala 91:29]
  wire [9:0] _branch_decoder1_T_2 = {branch_decoder1_andMatrixInput_0,branch_decoder1_andMatrixInput_1,
    branch_decoder1_andMatrixInput_2_1,branch_decoder1_andMatrixInput_3,branch_decoder1_andMatrixInput_4,
    branch_decoder1_andMatrixInput_5,branch_decoder1_andMatrixInput_6,branch_decoder1_andMatrixInput_7_1,
    branch_decoder1_andMatrixInput_7,branch_decoder1_andMatrixInput_9}; // @[Cat.scala 33:92]
  wire  _branch_decoder1_T_3 = &_branch_decoder1_T_2; // @[pla.scala 98:74]
  wire  branch_decoder1_andMatrixInput_3_2 = io_i_fetch_pack_insts_1[3]; // @[pla.scala 90:45]
  wire [6:0] _branch_decoder1_T_4 = {branch_decoder1_andMatrixInput_0,branch_decoder1_andMatrixInput_1,
    branch_decoder1_andMatrixInput_2_1,branch_decoder1_andMatrixInput_3_2,branch_decoder1_andMatrixInput_4,
    branch_decoder1_andMatrixInput_5,branch_decoder1_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _branch_decoder1_T_5 = &_branch_decoder1_T_4; // @[pla.scala 98:74]
  wire  branch_decoder1_andMatrixInput_7_2 = io_i_fetch_pack_insts_1[14]; // @[pla.scala 90:45]
  wire [7:0] _branch_decoder1_T_6 = {branch_decoder1_andMatrixInput_0,branch_decoder1_andMatrixInput_1,
    branch_decoder1_andMatrixInput_2,branch_decoder1_andMatrixInput_3,branch_decoder1_andMatrixInput_4,
    branch_decoder1_andMatrixInput_5,branch_decoder1_andMatrixInput_6,branch_decoder1_andMatrixInput_7_2}; // @[Cat.scala 33:92]
  wire  _branch_decoder1_T_7 = &_branch_decoder1_T_6; // @[pla.scala 98:74]
  wire [1:0] _branch_decoder1_orMatrixOutputs_T = {_branch_decoder1_T_1,_branch_decoder1_T_7}; // @[Cat.scala 33:92]
  wire  _branch_decoder1_orMatrixOutputs_T_1 = |_branch_decoder1_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [1:0] _branch_decoder1_orMatrixOutputs_T_2 = {_branch_decoder1_T_3,_branch_decoder1_T_5}; // @[Cat.scala 33:92]
  wire  _branch_decoder1_orMatrixOutputs_T_3 = |_branch_decoder1_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [3:0] branch_decoder1_orMatrixOutputs = {_branch_decoder1_orMatrixOutputs_T_3,
    _branch_decoder1_orMatrixOutputs_T_1,2'h0}; // @[Cat.scala 33:92]
  wire [3:0] branch_decoder1_invMatrixOutputs = {branch_decoder1_orMatrixOutputs[3],branch_decoder1_orMatrixOutputs[2],
    branch_decoder1_orMatrixOutputs[1],branch_decoder1_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire  br0 = branch_decoder0_invMatrixOutputs[0] | branch_decoder0_invMatrixOutputs[1] |
    branch_decoder0_invMatrixOutputs[2] | branch_decoder0_invMatrixOutputs[3]; // @[branch_presolve.scala 44:78]
  wire  br1 = branch_decoder1_invMatrixOutputs[0] | branch_decoder1_invMatrixOutputs[1] |
    branch_decoder1_invMatrixOutputs[2] | branch_decoder1_invMatrixOutputs[3]; // @[branch_presolve.scala 45:78]
  wire  _io_o_branch_presolve_pack_valid_T_3 = io_i_fetch_pack_valids_0 & ~br0 &
    io_i_fetch_pack_branch_predict_pack_valid & io_i_fetch_pack_branch_predict_pack_taken; // @[branch_presolve.scala 50:120]
  wire  _io_o_branch_presolve_pack_valid_T_5 = _io_o_branch_presolve_pack_valid_T_3 & ~
    io_i_fetch_pack_branch_predict_pack_select; // @[branch_presolve.scala 51:55]
  wire  _io_o_branch_presolve_pack_valid_T_9 = io_i_fetch_pack_valids_1 & ~br1 &
    io_i_fetch_pack_branch_predict_pack_valid & io_i_fetch_pack_branch_predict_pack_taken; // @[branch_presolve.scala 52:93]
  wire  _io_o_branch_presolve_pack_valid_T_11 = _io_o_branch_presolve_pack_valid_T_9 &
    io_i_fetch_pack_branch_predict_pack_select; // @[branch_presolve.scala 53:55]
  wire [63:0] _io_o_branch_presolve_pack_pc_T_1 = {io_i_fetch_pack_pc[63:3],3'h0}; // @[Cat.scala 33:92]
  wire [2:0] _io_o_branch_presolve_pack_pc_T_8 = _io_o_branch_presolve_pack_valid_T_5 ? 3'h0 : 3'h4; // @[branch_presolve.scala 54:81]
  wire [63:0] _GEN_0 = {{61'd0}, _io_o_branch_presolve_pack_pc_T_8}; // @[branch_presolve.scala 54:76]
  assign io_o_branch_presolve_pack_valid = _io_o_branch_presolve_pack_valid_T_3 & ~
    io_i_fetch_pack_branch_predict_pack_select | _io_o_branch_presolve_pack_valid_T_11; // @[branch_presolve.scala 51:110]
  assign io_o_branch_presolve_pack_taken = io_i_fetch_pack_branch_predict_pack_taken; // @[branch_presolve.scala 56:37]
  assign io_o_branch_presolve_pack_pc = _io_o_branch_presolve_pack_pc_T_1 + _GEN_0; // @[branch_presolve.scala 54:76]
endmodule
