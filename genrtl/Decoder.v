module Decoder(
  input         clock,
  input         reset,
  output        io_i_fetch_pack_ready,
  input         io_i_fetch_pack_valid,
  input         io_i_fetch_pack_bits_valids_0,
  input         io_i_fetch_pack_bits_valids_1,
  input  [63:0] io_i_fetch_pack_bits_pc,
  input  [31:0] io_i_fetch_pack_bits_insts_0,
  input  [31:0] io_i_fetch_pack_bits_insts_1,
  input         io_i_fetch_pack_bits_branch_predict_pack_valid,
  input  [63:0] io_i_fetch_pack_bits_branch_predict_pack_target,
  input  [3:0]  io_i_fetch_pack_bits_branch_predict_pack_branch_type,
  input         io_i_fetch_pack_bits_branch_predict_pack_select,
  input         io_i_fetch_pack_bits_branch_predict_pack_taken,
  output        io_o_decode_packs_0_valid,
  output [31:0] io_o_decode_packs_0_pc,
  output [31:0] io_o_decode_packs_0_inst,
  output [6:0]  io_o_decode_packs_0_func_code,
  output        io_o_decode_packs_0_branch_predict_pack_valid,
  output [63:0] io_o_decode_packs_0_branch_predict_pack_target,
  output [3:0]  io_o_decode_packs_0_branch_predict_pack_branch_type,
  output        io_o_decode_packs_0_branch_predict_pack_select,
  output        io_o_decode_packs_0_branch_predict_pack_taken,
  output [4:0]  io_o_decode_packs_0_arch_dst,
  output [2:0]  io_o_decode_packs_0_inst_type,
  output        io_o_decode_packs_0_regWen,
  output        io_o_decode_packs_0_src1_valid,
  output [4:0]  io_o_decode_packs_0_arch_rs1,
  output        io_o_decode_packs_0_src2_valid,
  output [4:0]  io_o_decode_packs_0_arch_rs2,
  output [63:0] io_o_decode_packs_0_imm,
  output [63:0] io_o_decode_packs_0_src1_value,
  output [63:0] io_o_decode_packs_0_src2_value,
  output [2:0]  io_o_decode_packs_0_op1_sel,
  output [2:0]  io_o_decode_packs_0_op2_sel,
  output [4:0]  io_o_decode_packs_0_alu_sel,
  output [3:0]  io_o_decode_packs_0_branch_type,
  output [1:0]  io_o_decode_packs_0_mem_type,
  output        io_o_decode_packs_1_valid,
  output [31:0] io_o_decode_packs_1_pc,
  output [31:0] io_o_decode_packs_1_inst,
  output [6:0]  io_o_decode_packs_1_func_code,
  output        io_o_decode_packs_1_branch_predict_pack_valid,
  output [63:0] io_o_decode_packs_1_branch_predict_pack_target,
  output [3:0]  io_o_decode_packs_1_branch_predict_pack_branch_type,
  output        io_o_decode_packs_1_branch_predict_pack_select,
  output        io_o_decode_packs_1_branch_predict_pack_taken,
  output [4:0]  io_o_decode_packs_1_arch_dst,
  output [2:0]  io_o_decode_packs_1_inst_type,
  output        io_o_decode_packs_1_regWen,
  output        io_o_decode_packs_1_src1_valid,
  output [4:0]  io_o_decode_packs_1_arch_rs1,
  output        io_o_decode_packs_1_src2_valid,
  output [4:0]  io_o_decode_packs_1_arch_rs2,
  output [63:0] io_o_decode_packs_1_imm,
  output [63:0] io_o_decode_packs_1_src1_value,
  output [63:0] io_o_decode_packs_1_src2_value,
  output [2:0]  io_o_decode_packs_1_op1_sel,
  output [2:0]  io_o_decode_packs_1_op2_sel,
  output [4:0]  io_o_decode_packs_1_alu_sel,
  output [3:0]  io_o_decode_packs_1_branch_type,
  output [1:0]  io_o_decode_packs_1_mem_type,
  input         io_i_exception,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  input         io_i_stall
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  wire  _io_i_fetch_pack_ready_T = ~io_i_stall; // @[decoder.scala 44:29]
  wire  _io_i_fetch_pack_ready_T_1 = ~io_i_exception; // @[decoder.scala 44:44]
  wire  _io_i_fetch_pack_ready_T_4 = ~(io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred); // @[decoder.scala 44:64]
  reg  uops_0_valid; // @[decoder.scala 46:23]
  reg [31:0] uops_0_pc; // @[decoder.scala 46:23]
  reg [31:0] uops_0_inst; // @[decoder.scala 46:23]
  reg  uops_0_branch_predict_pack_valid; // @[decoder.scala 46:23]
  reg [63:0] uops_0_branch_predict_pack_target; // @[decoder.scala 46:23]
  reg [3:0] uops_0_branch_predict_pack_branch_type; // @[decoder.scala 46:23]
  reg  uops_0_branch_predict_pack_select; // @[decoder.scala 46:23]
  reg  uops_0_branch_predict_pack_taken; // @[decoder.scala 46:23]
  reg  uops_1_valid; // @[decoder.scala 46:23]
  reg [31:0] uops_1_pc; // @[decoder.scala 46:23]
  reg [31:0] uops_1_inst; // @[decoder.scala 46:23]
  reg  uops_1_branch_predict_pack_valid; // @[decoder.scala 46:23]
  reg [63:0] uops_1_branch_predict_pack_target; // @[decoder.scala 46:23]
  reg [3:0] uops_1_branch_predict_pack_branch_type; // @[decoder.scala 46:23]
  reg  uops_1_branch_predict_pack_select; // @[decoder.scala 46:23]
  reg  uops_1_branch_predict_pack_taken; // @[decoder.scala 46:23]
  wire [64:0] _uops_0_pc_T_2 = {{1'd0}, io_i_fetch_pack_bits_pc}; // @[decoder.scala 52:43]
  wire [63:0] _uops_1_pc_T_3 = io_i_fetch_pack_bits_pc + 64'h4; // @[decoder.scala 52:43]
  wire  _GEN_0 = io_i_stall & _io_i_fetch_pack_ready_T_1 & uops_0_valid; // @[decoder.scala 56:46 58:16 62:22]
  wire [31:0] _GEN_1 = io_i_stall & _io_i_fetch_pack_ready_T_1 ? uops_0_pc : 32'h0; // @[decoder.scala 56:46 58:16 63:18]
  wire  _GEN_31 = io_i_stall & _io_i_fetch_pack_ready_T_1 & uops_1_valid; // @[decoder.scala 56:46 58:16 62:22]
  wire [31:0] _GEN_32 = io_i_stall & _io_i_fetch_pack_ready_T_1 ? uops_1_pc : 32'h0; // @[decoder.scala 56:46 58:16 63:18]
  wire [63:0] _GEN_63 = io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
    _io_i_fetch_pack_ready_T_1 ? _uops_0_pc_T_2[63:0] : {{32'd0}, _GEN_1}; // @[decoder.scala 49:143 52:18]
  wire [63:0] _GEN_71 = io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
    _io_i_fetch_pack_ready_T_1 ? _uops_1_pc_T_3 : {{32'd0}, _GEN_32}; // @[decoder.scala 49:143 52:18]
  wire [63:0] insts_0 = {{32'd0}, uops_0_inst}; // @[decoder.scala 47:21 70:14]
  wire [31:0] inst_valid_0_plaInput = insts_0[31:0]; // @[decoder.scala 38:16 pla.scala 77:22]
  wire [31:0] inst_valid_0_invInputs = ~inst_valid_0_plaInput; // @[pla.scala 78:21]
  wire  inst_valid_0_andMatrixInput_0 = inst_valid_0_plaInput[0]; // @[pla.scala 90:45]
  wire  inst_valid_0_andMatrixInput_1 = inst_valid_0_plaInput[1]; // @[pla.scala 90:45]
  wire  inst_valid_0_andMatrixInput_2 = inst_valid_0_invInputs[2]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_3 = inst_valid_0_invInputs[3]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_4 = inst_valid_0_invInputs[5]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_5 = inst_valid_0_invInputs[6]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_6 = inst_valid_0_invInputs[12]; // @[pla.scala 91:29]
  wire [6:0] _inst_valid_0_T = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_1 = &_inst_valid_0_T; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_4_1 = inst_valid_0_invInputs[4]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_7 = inst_valid_0_invInputs[13]; // @[pla.scala 91:29]
  wire [7:0] _inst_valid_0_T_2 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_3 = &_inst_valid_0_T_2; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_6_2 = inst_valid_0_invInputs[14]; // @[pla.scala 91:29]
  wire [6:0] _inst_valid_0_T_4 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_5 = &_inst_valid_0_T_4; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_3_3 = inst_valid_0_plaInput[4]; // @[pla.scala 90:45]
  wire [8:0] _inst_valid_0_T_6 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,
    inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_7 = &_inst_valid_0_T_6; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_2_4 = inst_valid_0_plaInput[2]; // @[pla.scala 90:45]
  wire [5:0] _inst_valid_0_T_8 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2_4,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_5}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_9 = &_inst_valid_0_T_8; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_4_5 = inst_valid_0_plaInput[5]; // @[pla.scala 90:45]
  wire  inst_valid_0_andMatrixInput_9 = inst_valid_0_invInputs[25]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_10 = inst_valid_0_invInputs[26]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_11 = inst_valid_0_invInputs[27]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_12 = inst_valid_0_invInputs[28]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_13 = inst_valid_0_invInputs[29]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_14 = inst_valid_0_invInputs[31]; // @[pla.scala 91:29]
  wire [6:0] inst_valid_0_lo_5 = {inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_0_T_10 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,inst_valid_0_lo_5}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_11 = &_inst_valid_0_T_10; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_11_1 = inst_valid_0_invInputs[30]; // @[pla.scala 91:29]
  wire [5:0] inst_valid_0_lo_6 = {inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,
    inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,
    inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [12:0] _inst_valid_0_T_12 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_lo_6}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_13 = &_inst_valid_0_T_12; // @[pla.scala 98:74]
  wire [6:0] inst_valid_0_lo_7 = {inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_10,
    inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,
    inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_0_T_14 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,inst_valid_0_lo_7}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_15 = &_inst_valid_0_T_14; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_5_8 = inst_valid_0_plaInput[6]; // @[pla.scala 90:45]
  wire [8:0] _inst_valid_0_T_16 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,
    inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_17 = &_inst_valid_0_T_16; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_3_9 = inst_valid_0_plaInput[3]; // @[pla.scala 90:45]
  wire [6:0] _inst_valid_0_T_18 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2_4,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_19 = &_inst_valid_0_T_18; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_7_6 = inst_valid_0_invInputs[7]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_8_5 = inst_valid_0_invInputs[8]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_9_3 = inst_valid_0_invInputs[9]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_10_3 = inst_valid_0_invInputs[10]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_11_3 = inst_valid_0_invInputs[11]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_15 = inst_valid_0_invInputs[15]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_16 = inst_valid_0_invInputs[16]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_17 = inst_valid_0_invInputs[17]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_18 = inst_valid_0_invInputs[18]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_19 = inst_valid_0_invInputs[19]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_20 = inst_valid_0_invInputs[21]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_21 = inst_valid_0_invInputs[22]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_22 = inst_valid_0_invInputs[23]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_23 = inst_valid_0_invInputs[24]; // @[pla.scala 91:29]
  wire [6:0] inst_valid_0_lo_lo_6 = {inst_valid_0_andMatrixInput_9,inst_valid_0_andMatrixInput_10,
    inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,
    inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] inst_valid_0_lo_10 = {inst_valid_0_andMatrixInput_16,inst_valid_0_andMatrixInput_17,
    inst_valid_0_andMatrixInput_18,inst_valid_0_andMatrixInput_19,inst_valid_0_andMatrixInput_20,
    inst_valid_0_andMatrixInput_21,inst_valid_0_andMatrixInput_22,inst_valid_0_andMatrixInput_23,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire [7:0] inst_valid_0_hi_lo_9 = {inst_valid_0_andMatrixInput_8_5,inst_valid_0_andMatrixInput_9_3,
    inst_valid_0_andMatrixInput_10_3,inst_valid_0_andMatrixInput_11_3,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_15}; // @[Cat.scala 33:92]
  wire [30:0] _inst_valid_0_T_20 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_6,inst_valid_0_hi_lo_9
    ,inst_valid_0_lo_10}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_21 = &_inst_valid_0_T_20; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_6_10 = inst_valid_0_plaInput[12]; // @[pla.scala 90:45]
  wire [6:0] inst_valid_0_lo_11 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_10,
    inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,
    inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [13:0] _inst_valid_0_T_22 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_lo_11}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_23 = &_inst_valid_0_T_22; // @[pla.scala 98:74]
  wire [14:0] _inst_valid_0_T_24 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_andMatrixInput_7,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_25 = &_inst_valid_0_T_24; // @[pla.scala 98:74]
  wire [8:0] _inst_valid_0_T_26 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6_10,inst_valid_0_andMatrixInput_7,
    inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_27 = &_inst_valid_0_T_26; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_7_10 = inst_valid_0_plaInput[13]; // @[pla.scala 90:45]
  wire [7:0] _inst_valid_0_T_28 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7_10}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_29 = &_inst_valid_0_T_28; // @[pla.scala 98:74]
  wire [8:0] _inst_valid_0_T_30 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_10,
    inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_31 = &_inst_valid_0_T_30; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_7_12 = inst_valid_0_plaInput[14]; // @[pla.scala 90:45]
  wire [7:0] _inst_valid_0_T_32 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_33 = &_inst_valid_0_T_32; // @[pla.scala 98:74]
  wire [6:0] inst_valid_0_lo_17 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_7_12,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_0_T_34 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_lo_17}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_35 = &_inst_valid_0_T_34; // @[pla.scala 98:74]
  wire [6:0] inst_valid_0_lo_18 = {inst_valid_0_andMatrixInput_7_12,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_0_T_36 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_andMatrixInput_7,inst_valid_0_lo_18}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_37 = &_inst_valid_0_T_36; // @[pla.scala 98:74]
  wire [14:0] _inst_valid_0_T_38 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_andMatrixInput_7,inst_valid_0_lo_18}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_39 = &_inst_valid_0_T_38; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_7_16 = inst_valid_0_plaInput[25]; // @[pla.scala 90:45]
  wire [6:0] inst_valid_0_lo_20 = {inst_valid_0_andMatrixInput_7_16,inst_valid_0_andMatrixInput_10,
    inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,
    inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [13:0] _inst_valid_0_T_40 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7_12,inst_valid_0_lo_20}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_41 = &_inst_valid_0_T_40; // @[pla.scala 98:74]
  wire  inst_valid_0_andMatrixInput_20_1 = inst_valid_0_invInputs[20]; // @[pla.scala 91:29]
  wire  inst_valid_0_andMatrixInput_21_1 = inst_valid_0_plaInput[21]; // @[pla.scala 90:45]
  wire  inst_valid_0_andMatrixInput_28_1 = inst_valid_0_plaInput[28]; // @[pla.scala 90:45]
  wire  inst_valid_0_andMatrixInput_29_1 = inst_valid_0_plaInput[29]; // @[pla.scala 90:45]
  wire [7:0] inst_valid_0_lo_lo_17 = {inst_valid_0_andMatrixInput_23,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_28_1,
    inst_valid_0_andMatrixInput_29_1,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] inst_valid_0_lo_21 = {inst_valid_0_andMatrixInput_16,inst_valid_0_andMatrixInput_17,
    inst_valid_0_andMatrixInput_18,inst_valid_0_andMatrixInput_19,inst_valid_0_andMatrixInput_20_1,
    inst_valid_0_andMatrixInput_21_1,inst_valid_0_andMatrixInput_21,inst_valid_0_andMatrixInput_22,inst_valid_0_lo_lo_17
    }; // @[Cat.scala 33:92]
  wire [31:0] _inst_valid_0_T_42 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_6,inst_valid_0_hi_lo_9
    ,inst_valid_0_lo_21}; // @[Cat.scala 33:92]
  wire  _inst_valid_0_T_43 = &_inst_valid_0_T_42; // @[pla.scala 98:74]
  wire [4:0] inst_valid_0_orMatrixOutputs_lo_lo = {_inst_valid_0_T_35,_inst_valid_0_T_37,_inst_valid_0_T_39,
    _inst_valid_0_T_41,_inst_valid_0_T_43}; // @[Cat.scala 33:92]
  wire [10:0] inst_valid_0_orMatrixOutputs_lo = {_inst_valid_0_T_23,_inst_valid_0_T_25,_inst_valid_0_T_27,
    _inst_valid_0_T_29,_inst_valid_0_T_31,_inst_valid_0_T_33,inst_valid_0_orMatrixOutputs_lo_lo}; // @[Cat.scala 33:92]
  wire [4:0] inst_valid_0_orMatrixOutputs_hi_lo = {_inst_valid_0_T_13,_inst_valid_0_T_15,_inst_valid_0_T_17,
    _inst_valid_0_T_19,_inst_valid_0_T_21}; // @[Cat.scala 33:92]
  wire [21:0] _inst_valid_0_orMatrixOutputs_T = {_inst_valid_0_T_1,_inst_valid_0_T_3,_inst_valid_0_T_5,_inst_valid_0_T_7
    ,_inst_valid_0_T_9,_inst_valid_0_T_11,inst_valid_0_orMatrixOutputs_hi_lo,inst_valid_0_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  inst_valid_0_orMatrixOutputs = |_inst_valid_0_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [63:0] insts_1 = {{32'd0}, uops_1_inst}; // @[decoder.scala 47:21 71:14]
  wire [31:0] inst_valid_1_plaInput = insts_1[31:0]; // @[decoder.scala 38:16 pla.scala 77:22]
  wire [31:0] inst_valid_1_invInputs = ~inst_valid_1_plaInput; // @[pla.scala 78:21]
  wire  inst_valid_1_andMatrixInput_0 = inst_valid_1_plaInput[0]; // @[pla.scala 90:45]
  wire  inst_valid_1_andMatrixInput_1 = inst_valid_1_plaInput[1]; // @[pla.scala 90:45]
  wire  inst_valid_1_andMatrixInput_2 = inst_valid_1_invInputs[2]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_3 = inst_valid_1_invInputs[3]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_4 = inst_valid_1_invInputs[5]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_5 = inst_valid_1_invInputs[6]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_6 = inst_valid_1_invInputs[12]; // @[pla.scala 91:29]
  wire [6:0] _inst_valid_1_T = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_1 = &_inst_valid_1_T; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_4_1 = inst_valid_1_invInputs[4]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_7 = inst_valid_1_invInputs[13]; // @[pla.scala 91:29]
  wire [7:0] _inst_valid_1_T_2 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_3 = &_inst_valid_1_T_2; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_6_2 = inst_valid_1_invInputs[14]; // @[pla.scala 91:29]
  wire [6:0] _inst_valid_1_T_4 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_5 = &_inst_valid_1_T_4; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_3_3 = inst_valid_1_plaInput[4]; // @[pla.scala 90:45]
  wire [8:0] _inst_valid_1_T_6 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,
    inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_7 = &_inst_valid_1_T_6; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_2_4 = inst_valid_1_plaInput[2]; // @[pla.scala 90:45]
  wire [5:0] _inst_valid_1_T_8 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2_4,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_5}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_9 = &_inst_valid_1_T_8; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_4_5 = inst_valid_1_plaInput[5]; // @[pla.scala 90:45]
  wire  inst_valid_1_andMatrixInput_9 = inst_valid_1_invInputs[25]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_10 = inst_valid_1_invInputs[26]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_11 = inst_valid_1_invInputs[27]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_12 = inst_valid_1_invInputs[28]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_13 = inst_valid_1_invInputs[29]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_14 = inst_valid_1_invInputs[31]; // @[pla.scala 91:29]
  wire [6:0] inst_valid_1_lo_5 = {inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_1_T_10 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,inst_valid_1_lo_5}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_11 = &_inst_valid_1_T_10; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_11_1 = inst_valid_1_invInputs[30]; // @[pla.scala 91:29]
  wire [5:0] inst_valid_1_lo_6 = {inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,
    inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,
    inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [12:0] _inst_valid_1_T_12 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_lo_6}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_13 = &_inst_valid_1_T_12; // @[pla.scala 98:74]
  wire [6:0] inst_valid_1_lo_7 = {inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_10,
    inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,
    inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_1_T_14 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,inst_valid_1_lo_7}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_15 = &_inst_valid_1_T_14; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_5_8 = inst_valid_1_plaInput[6]; // @[pla.scala 90:45]
  wire [8:0] _inst_valid_1_T_16 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,
    inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_17 = &_inst_valid_1_T_16; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_3_9 = inst_valid_1_plaInput[3]; // @[pla.scala 90:45]
  wire [6:0] _inst_valid_1_T_18 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2_4,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_19 = &_inst_valid_1_T_18; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_7_6 = inst_valid_1_invInputs[7]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_8_5 = inst_valid_1_invInputs[8]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_9_3 = inst_valid_1_invInputs[9]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_10_3 = inst_valid_1_invInputs[10]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_11_3 = inst_valid_1_invInputs[11]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_15 = inst_valid_1_invInputs[15]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_16 = inst_valid_1_invInputs[16]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_17 = inst_valid_1_invInputs[17]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_18 = inst_valid_1_invInputs[18]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_19 = inst_valid_1_invInputs[19]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_20 = inst_valid_1_invInputs[21]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_21 = inst_valid_1_invInputs[22]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_22 = inst_valid_1_invInputs[23]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_23 = inst_valid_1_invInputs[24]; // @[pla.scala 91:29]
  wire [6:0] inst_valid_1_lo_lo_6 = {inst_valid_1_andMatrixInput_9,inst_valid_1_andMatrixInput_10,
    inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,
    inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] inst_valid_1_lo_10 = {inst_valid_1_andMatrixInput_16,inst_valid_1_andMatrixInput_17,
    inst_valid_1_andMatrixInput_18,inst_valid_1_andMatrixInput_19,inst_valid_1_andMatrixInput_20,
    inst_valid_1_andMatrixInput_21,inst_valid_1_andMatrixInput_22,inst_valid_1_andMatrixInput_23,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire [7:0] inst_valid_1_hi_lo_9 = {inst_valid_1_andMatrixInput_8_5,inst_valid_1_andMatrixInput_9_3,
    inst_valid_1_andMatrixInput_10_3,inst_valid_1_andMatrixInput_11_3,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_15}; // @[Cat.scala 33:92]
  wire [30:0] _inst_valid_1_T_20 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_6,inst_valid_1_hi_lo_9
    ,inst_valid_1_lo_10}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_21 = &_inst_valid_1_T_20; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_6_10 = inst_valid_1_plaInput[12]; // @[pla.scala 90:45]
  wire [6:0] inst_valid_1_lo_11 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_10,
    inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,
    inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [13:0] _inst_valid_1_T_22 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_lo_11}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_23 = &_inst_valid_1_T_22; // @[pla.scala 98:74]
  wire [14:0] _inst_valid_1_T_24 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_andMatrixInput_7,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_25 = &_inst_valid_1_T_24; // @[pla.scala 98:74]
  wire [8:0] _inst_valid_1_T_26 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6_10,inst_valid_1_andMatrixInput_7,
    inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_27 = &_inst_valid_1_T_26; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_7_10 = inst_valid_1_plaInput[13]; // @[pla.scala 90:45]
  wire [7:0] _inst_valid_1_T_28 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7_10}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_29 = &_inst_valid_1_T_28; // @[pla.scala 98:74]
  wire [8:0] _inst_valid_1_T_30 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_10,
    inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_31 = &_inst_valid_1_T_30; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_7_12 = inst_valid_1_plaInput[14]; // @[pla.scala 90:45]
  wire [7:0] _inst_valid_1_T_32 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_33 = &_inst_valid_1_T_32; // @[pla.scala 98:74]
  wire [6:0] inst_valid_1_lo_17 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_7_12,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_1_T_34 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_lo_17}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_35 = &_inst_valid_1_T_34; // @[pla.scala 98:74]
  wire [6:0] inst_valid_1_lo_18 = {inst_valid_1_andMatrixInput_7_12,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [14:0] _inst_valid_1_T_36 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_andMatrixInput_7,inst_valid_1_lo_18}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_37 = &_inst_valid_1_T_36; // @[pla.scala 98:74]
  wire [14:0] _inst_valid_1_T_38 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_andMatrixInput_7,inst_valid_1_lo_18}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_39 = &_inst_valid_1_T_38; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_7_16 = inst_valid_1_plaInput[25]; // @[pla.scala 90:45]
  wire [6:0] inst_valid_1_lo_20 = {inst_valid_1_andMatrixInput_7_16,inst_valid_1_andMatrixInput_10,
    inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,
    inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [13:0] _inst_valid_1_T_40 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7_12,inst_valid_1_lo_20}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_41 = &_inst_valid_1_T_40; // @[pla.scala 98:74]
  wire  inst_valid_1_andMatrixInput_20_1 = inst_valid_1_invInputs[20]; // @[pla.scala 91:29]
  wire  inst_valid_1_andMatrixInput_21_1 = inst_valid_1_plaInput[21]; // @[pla.scala 90:45]
  wire  inst_valid_1_andMatrixInput_28_1 = inst_valid_1_plaInput[28]; // @[pla.scala 90:45]
  wire  inst_valid_1_andMatrixInput_29_1 = inst_valid_1_plaInput[29]; // @[pla.scala 90:45]
  wire [7:0] inst_valid_1_lo_lo_17 = {inst_valid_1_andMatrixInput_23,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_28_1,
    inst_valid_1_andMatrixInput_29_1,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] inst_valid_1_lo_21 = {inst_valid_1_andMatrixInput_16,inst_valid_1_andMatrixInput_17,
    inst_valid_1_andMatrixInput_18,inst_valid_1_andMatrixInput_19,inst_valid_1_andMatrixInput_20_1,
    inst_valid_1_andMatrixInput_21_1,inst_valid_1_andMatrixInput_21,inst_valid_1_andMatrixInput_22,inst_valid_1_lo_lo_17
    }; // @[Cat.scala 33:92]
  wire [31:0] _inst_valid_1_T_42 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_6,inst_valid_1_hi_lo_9
    ,inst_valid_1_lo_21}; // @[Cat.scala 33:92]
  wire  _inst_valid_1_T_43 = &_inst_valid_1_T_42; // @[pla.scala 98:74]
  wire [4:0] inst_valid_1_orMatrixOutputs_lo_lo = {_inst_valid_1_T_35,_inst_valid_1_T_37,_inst_valid_1_T_39,
    _inst_valid_1_T_41,_inst_valid_1_T_43}; // @[Cat.scala 33:92]
  wire [10:0] inst_valid_1_orMatrixOutputs_lo = {_inst_valid_1_T_23,_inst_valid_1_T_25,_inst_valid_1_T_27,
    _inst_valid_1_T_29,_inst_valid_1_T_31,_inst_valid_1_T_33,inst_valid_1_orMatrixOutputs_lo_lo}; // @[Cat.scala 33:92]
  wire [4:0] inst_valid_1_orMatrixOutputs_hi_lo = {_inst_valid_1_T_13,_inst_valid_1_T_15,_inst_valid_1_T_17,
    _inst_valid_1_T_19,_inst_valid_1_T_21}; // @[Cat.scala 33:92]
  wire [21:0] _inst_valid_1_orMatrixOutputs_T = {_inst_valid_1_T_1,_inst_valid_1_T_3,_inst_valid_1_T_5,_inst_valid_1_T_7
    ,_inst_valid_1_T_9,_inst_valid_1_T_11,inst_valid_1_orMatrixOutputs_hi_lo,inst_valid_1_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  inst_valid_1_orMatrixOutputs = |_inst_valid_1_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [7:0] _io_o_decode_packs_0_func_code_T = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_1 = &_io_o_decode_packs_0_func_code_T; // @[pla.scala 98:74]
  wire [7:0] _io_o_decode_packs_0_func_code_T_6 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_7 = &_io_o_decode_packs_0_func_code_T_6; // @[pla.scala 98:74]
  wire [13:0] _io_o_decode_packs_0_func_code_T_14 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_15 = &_io_o_decode_packs_0_func_code_T_14; // @[pla.scala 98:74]
  wire [7:0] _io_o_decode_packs_0_func_code_T_16 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_17 = &_io_o_decode_packs_0_func_code_T_16; // @[pla.scala 98:74]
  wire [13:0] io_o_decode_packs_0_func_code_lo_11 = {inst_valid_0_andMatrixInput_17,inst_valid_0_andMatrixInput_18,
    inst_valid_0_andMatrixInput_19,inst_valid_0_andMatrixInput_20,inst_valid_0_andMatrixInput_21,
    inst_valid_0_andMatrixInput_22,inst_valid_0_andMatrixInput_23,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire [6:0] io_o_decode_packs_0_func_code_hi_lo_10 = {inst_valid_0_andMatrixInput_10_3,inst_valid_0_andMatrixInput_11_3
    ,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2,
    inst_valid_0_andMatrixInput_15,inst_valid_0_andMatrixInput_16}; // @[Cat.scala 33:92]
  wire [27:0] _io_o_decode_packs_0_func_code_T_22 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_6,
    inst_valid_0_andMatrixInput_8_5,inst_valid_0_andMatrixInput_9_3,io_o_decode_packs_0_func_code_hi_lo_10,
    io_o_decode_packs_0_func_code_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_23 = &_io_o_decode_packs_0_func_code_T_22; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_0_func_code_T_24 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_25 = &_io_o_decode_packs_0_func_code_T_24; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_func_code_T_28 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_29 = &_io_o_decode_packs_0_func_code_T_28; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_0_func_code_T_42 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_2,inst_valid_0_lo_20}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_43 = &_io_o_decode_packs_0_func_code_T_42; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_func_code_lo_22 = {inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_7_16,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_func_code_T_44 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,
    io_o_decode_packs_0_func_code_lo_22}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_45 = &_io_o_decode_packs_0_func_code_T_44; // @[pla.scala 98:74]
  wire [6:0] io_o_decode_packs_0_func_code_lo_lo_21 = {inst_valid_0_andMatrixInput_9,inst_valid_0_andMatrixInput_10,
    inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_28_1,inst_valid_0_andMatrixInput_29_1,
    inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [13:0] io_o_decode_packs_0_func_code_lo_24 = {inst_valid_0_andMatrixInput_18,inst_valid_0_andMatrixInput_19,
    inst_valid_0_andMatrixInput_20_1,inst_valid_0_andMatrixInput_21_1,inst_valid_0_andMatrixInput_21,
    inst_valid_0_andMatrixInput_22,inst_valid_0_andMatrixInput_23,io_o_decode_packs_0_func_code_lo_lo_21}; // @[Cat.scala 33:92]
  wire [6:0] io_o_decode_packs_0_func_code_hi_lo_23 = {inst_valid_0_andMatrixInput_11_3,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_15,
    inst_valid_0_andMatrixInput_16,inst_valid_0_andMatrixInput_17}; // @[Cat.scala 33:92]
  wire [27:0] _io_o_decode_packs_0_func_code_T_48 = {inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_6,inst_valid_0_andMatrixInput_8_5,
    inst_valid_0_andMatrixInput_9_3,inst_valid_0_andMatrixInput_10_3,io_o_decode_packs_0_func_code_hi_lo_23,
    io_o_decode_packs_0_func_code_lo_24}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_T_49 = &_io_o_decode_packs_0_func_code_T_48; // @[pla.scala 98:74]
  wire [4:0] io_o_decode_packs_0_func_code_orMatrixOutputs_lo = {_inst_valid_0_T_25,_inst_valid_0_T_29,
    _inst_valid_0_T_35,_inst_valid_0_T_37,_inst_valid_0_T_39}; // @[Cat.scala 33:92]
  wire [10:0] _io_o_decode_packs_0_func_code_orMatrixOutputs_T = {_io_o_decode_packs_0_func_code_T_7,_inst_valid_0_T_7,
    _inst_valid_0_T_9,_inst_valid_0_T_11,_io_o_decode_packs_0_func_code_T_15,_io_o_decode_packs_0_func_code_T_25,
    io_o_decode_packs_0_func_code_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_orMatrixOutputs_T_1 = |_io_o_decode_packs_0_func_code_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_0_func_code_orMatrixOutputs_T_2 = {_io_o_decode_packs_0_func_code_T_17,
    _inst_valid_0_T_17,_inst_valid_0_T_19,_inst_valid_0_T_33}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_orMatrixOutputs_T_3 = |_io_o_decode_packs_0_func_code_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [2:0] _io_o_decode_packs_0_func_code_orMatrixOutputs_T_4 = {_io_o_decode_packs_0_func_code_T_1,_inst_valid_0_T_3,
    _inst_valid_0_T_5}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_orMatrixOutputs_T_5 = |_io_o_decode_packs_0_func_code_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [1:0] _io_o_decode_packs_0_func_code_orMatrixOutputs_T_6 = {_io_o_decode_packs_0_func_code_T_43,
    _io_o_decode_packs_0_func_code_T_45}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_orMatrixOutputs_T_7 = |_io_o_decode_packs_0_func_code_orMatrixOutputs_T_6; // @[pla.scala 114:39]
  wire  _io_o_decode_packs_0_func_code_orMatrixOutputs_T_8 = |_inst_valid_0_T_41; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_0_func_code_orMatrixOutputs_T_9 = {_io_o_decode_packs_0_func_code_T_23,
    _io_o_decode_packs_0_func_code_T_29,_inst_valid_0_T_31,_io_o_decode_packs_0_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_func_code_orMatrixOutputs_T_10 = |_io_o_decode_packs_0_func_code_orMatrixOutputs_T_9; // @[pla.scala 114:39]
  wire [6:0] io_o_decode_packs_0_func_code_orMatrixOutputs = {1'h0,_io_o_decode_packs_0_func_code_orMatrixOutputs_T_10,
    _io_o_decode_packs_0_func_code_orMatrixOutputs_T_8,_io_o_decode_packs_0_func_code_orMatrixOutputs_T_7,
    _io_o_decode_packs_0_func_code_orMatrixOutputs_T_5,_io_o_decode_packs_0_func_code_orMatrixOutputs_T_3,
    _io_o_decode_packs_0_func_code_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [2:0] io_o_decode_packs_0_func_code_invMatrixOutputs_lo = {io_o_decode_packs_0_func_code_orMatrixOutputs[2],
    io_o_decode_packs_0_func_code_orMatrixOutputs[1],io_o_decode_packs_0_func_code_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [3:0] io_o_decode_packs_0_func_code_invMatrixOutputs_hi = {io_o_decode_packs_0_func_code_orMatrixOutputs[6],
    io_o_decode_packs_0_func_code_orMatrixOutputs[5],io_o_decode_packs_0_func_code_orMatrixOutputs[4],
    io_o_decode_packs_0_func_code_orMatrixOutputs[3]}; // @[Cat.scala 33:92]
  wire [7:0] _io_o_decode_packs_1_func_code_T = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_1 = &_io_o_decode_packs_1_func_code_T; // @[pla.scala 98:74]
  wire [7:0] _io_o_decode_packs_1_func_code_T_6 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_7 = &_io_o_decode_packs_1_func_code_T_6; // @[pla.scala 98:74]
  wire [13:0] _io_o_decode_packs_1_func_code_T_14 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_15 = &_io_o_decode_packs_1_func_code_T_14; // @[pla.scala 98:74]
  wire [7:0] _io_o_decode_packs_1_func_code_T_16 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_17 = &_io_o_decode_packs_1_func_code_T_16; // @[pla.scala 98:74]
  wire [13:0] io_o_decode_packs_1_func_code_lo_11 = {inst_valid_1_andMatrixInput_17,inst_valid_1_andMatrixInput_18,
    inst_valid_1_andMatrixInput_19,inst_valid_1_andMatrixInput_20,inst_valid_1_andMatrixInput_21,
    inst_valid_1_andMatrixInput_22,inst_valid_1_andMatrixInput_23,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire [6:0] io_o_decode_packs_1_func_code_hi_lo_10 = {inst_valid_1_andMatrixInput_10_3,inst_valid_1_andMatrixInput_11_3
    ,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2,
    inst_valid_1_andMatrixInput_15,inst_valid_1_andMatrixInput_16}; // @[Cat.scala 33:92]
  wire [27:0] _io_o_decode_packs_1_func_code_T_22 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_6,
    inst_valid_1_andMatrixInput_8_5,inst_valid_1_andMatrixInput_9_3,io_o_decode_packs_1_func_code_hi_lo_10,
    io_o_decode_packs_1_func_code_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_23 = &_io_o_decode_packs_1_func_code_T_22; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_1_func_code_T_24 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_25 = &_io_o_decode_packs_1_func_code_T_24; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_func_code_T_28 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_29 = &_io_o_decode_packs_1_func_code_T_28; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_1_func_code_T_42 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_2,inst_valid_1_lo_20}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_43 = &_io_o_decode_packs_1_func_code_T_42; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_func_code_lo_22 = {inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_7_16,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_func_code_T_44 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,
    io_o_decode_packs_1_func_code_lo_22}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_45 = &_io_o_decode_packs_1_func_code_T_44; // @[pla.scala 98:74]
  wire [6:0] io_o_decode_packs_1_func_code_lo_lo_21 = {inst_valid_1_andMatrixInput_9,inst_valid_1_andMatrixInput_10,
    inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_28_1,inst_valid_1_andMatrixInput_29_1,
    inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [13:0] io_o_decode_packs_1_func_code_lo_24 = {inst_valid_1_andMatrixInput_18,inst_valid_1_andMatrixInput_19,
    inst_valid_1_andMatrixInput_20_1,inst_valid_1_andMatrixInput_21_1,inst_valid_1_andMatrixInput_21,
    inst_valid_1_andMatrixInput_22,inst_valid_1_andMatrixInput_23,io_o_decode_packs_1_func_code_lo_lo_21}; // @[Cat.scala 33:92]
  wire [6:0] io_o_decode_packs_1_func_code_hi_lo_23 = {inst_valid_1_andMatrixInput_11_3,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_15,
    inst_valid_1_andMatrixInput_16,inst_valid_1_andMatrixInput_17}; // @[Cat.scala 33:92]
  wire [27:0] _io_o_decode_packs_1_func_code_T_48 = {inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_6,inst_valid_1_andMatrixInput_8_5,
    inst_valid_1_andMatrixInput_9_3,inst_valid_1_andMatrixInput_10_3,io_o_decode_packs_1_func_code_hi_lo_23,
    io_o_decode_packs_1_func_code_lo_24}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_T_49 = &_io_o_decode_packs_1_func_code_T_48; // @[pla.scala 98:74]
  wire [4:0] io_o_decode_packs_1_func_code_orMatrixOutputs_lo = {_inst_valid_1_T_25,_inst_valid_1_T_29,
    _inst_valid_1_T_35,_inst_valid_1_T_37,_inst_valid_1_T_39}; // @[Cat.scala 33:92]
  wire [10:0] _io_o_decode_packs_1_func_code_orMatrixOutputs_T = {_io_o_decode_packs_1_func_code_T_7,_inst_valid_1_T_7,
    _inst_valid_1_T_9,_inst_valid_1_T_11,_io_o_decode_packs_1_func_code_T_15,_io_o_decode_packs_1_func_code_T_25,
    io_o_decode_packs_1_func_code_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_orMatrixOutputs_T_1 = |_io_o_decode_packs_1_func_code_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_1_func_code_orMatrixOutputs_T_2 = {_io_o_decode_packs_1_func_code_T_17,
    _inst_valid_1_T_17,_inst_valid_1_T_19,_inst_valid_1_T_33}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_orMatrixOutputs_T_3 = |_io_o_decode_packs_1_func_code_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [2:0] _io_o_decode_packs_1_func_code_orMatrixOutputs_T_4 = {_io_o_decode_packs_1_func_code_T_1,_inst_valid_1_T_3,
    _inst_valid_1_T_5}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_orMatrixOutputs_T_5 = |_io_o_decode_packs_1_func_code_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [1:0] _io_o_decode_packs_1_func_code_orMatrixOutputs_T_6 = {_io_o_decode_packs_1_func_code_T_43,
    _io_o_decode_packs_1_func_code_T_45}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_orMatrixOutputs_T_7 = |_io_o_decode_packs_1_func_code_orMatrixOutputs_T_6; // @[pla.scala 114:39]
  wire  _io_o_decode_packs_1_func_code_orMatrixOutputs_T_8 = |_inst_valid_1_T_41; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_1_func_code_orMatrixOutputs_T_9 = {_io_o_decode_packs_1_func_code_T_23,
    _io_o_decode_packs_1_func_code_T_29,_inst_valid_1_T_31,_io_o_decode_packs_1_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_func_code_orMatrixOutputs_T_10 = |_io_o_decode_packs_1_func_code_orMatrixOutputs_T_9; // @[pla.scala 114:39]
  wire [6:0] io_o_decode_packs_1_func_code_orMatrixOutputs = {1'h0,_io_o_decode_packs_1_func_code_orMatrixOutputs_T_10,
    _io_o_decode_packs_1_func_code_orMatrixOutputs_T_8,_io_o_decode_packs_1_func_code_orMatrixOutputs_T_7,
    _io_o_decode_packs_1_func_code_orMatrixOutputs_T_5,_io_o_decode_packs_1_func_code_orMatrixOutputs_T_3,
    _io_o_decode_packs_1_func_code_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [2:0] io_o_decode_packs_1_func_code_invMatrixOutputs_lo = {io_o_decode_packs_1_func_code_orMatrixOutputs[2],
    io_o_decode_packs_1_func_code_orMatrixOutputs[1],io_o_decode_packs_1_func_code_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [3:0] io_o_decode_packs_1_func_code_invMatrixOutputs_hi = {io_o_decode_packs_1_func_code_orMatrixOutputs[6],
    io_o_decode_packs_1_func_code_orMatrixOutputs[5],io_o_decode_packs_1_func_code_orMatrixOutputs[4],
    io_o_decode_packs_1_func_code_orMatrixOutputs[3]}; // @[Cat.scala 33:92]
  wire [7:0] _io_o_decode_packs_0_regWen_T_4 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_regWen_T_5 = &_io_o_decode_packs_0_regWen_T_4; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_regWen_T_16 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2_4,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_regWen_T_17 = &_io_o_decode_packs_0_regWen_T_16; // @[pla.scala 98:74]
  wire [9:0] io_o_decode_packs_0_regWen_orMatrixOutputs_hi = {_inst_valid_0_T_1,_inst_valid_0_T_3,
    _io_o_decode_packs_0_regWen_T_5,_inst_valid_0_T_7,_inst_valid_0_T_9,_inst_valid_0_T_11,_inst_valid_0_T_13,
    _inst_valid_0_T_15,_io_o_decode_packs_0_regWen_T_17,_inst_valid_0_T_19}; // @[Cat.scala 33:92]
  wire [18:0] _io_o_decode_packs_0_regWen_orMatrixOutputs_T = {io_o_decode_packs_0_regWen_orMatrixOutputs_hi,
    _inst_valid_0_T_23,_inst_valid_0_T_25,_io_o_decode_packs_0_func_code_T_29,_inst_valid_0_T_29,_inst_valid_0_T_31,
    _inst_valid_0_T_35,_inst_valid_0_T_37,_inst_valid_0_T_39,_inst_valid_0_T_41}; // @[Cat.scala 33:92]
  wire [7:0] _io_o_decode_packs_1_regWen_T_4 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_regWen_T_5 = &_io_o_decode_packs_1_regWen_T_4; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_regWen_T_16 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2_4,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_regWen_T_17 = &_io_o_decode_packs_1_regWen_T_16; // @[pla.scala 98:74]
  wire [9:0] io_o_decode_packs_1_regWen_orMatrixOutputs_hi = {_inst_valid_1_T_1,_inst_valid_1_T_3,
    _io_o_decode_packs_1_regWen_T_5,_inst_valid_1_T_7,_inst_valid_1_T_9,_inst_valid_1_T_11,_inst_valid_1_T_13,
    _inst_valid_1_T_15,_io_o_decode_packs_1_regWen_T_17,_inst_valid_1_T_19}; // @[Cat.scala 33:92]
  wire [18:0] _io_o_decode_packs_1_regWen_orMatrixOutputs_T = {io_o_decode_packs_1_regWen_orMatrixOutputs_hi,
    _inst_valid_1_T_23,_inst_valid_1_T_25,_io_o_decode_packs_1_func_code_T_29,_inst_valid_1_T_29,_inst_valid_1_T_31,
    _inst_valid_1_T_35,_inst_valid_1_T_37,_inst_valid_1_T_39,_inst_valid_1_T_41}; // @[Cat.scala 33:92]
  wire [7:0] _io_o_decode_packs_0_inst_type_T_10 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_T_11 = &_io_o_decode_packs_0_inst_type_T_10; // @[pla.scala 98:74]
  wire [7:0] _io_o_decode_packs_0_inst_type_T_12 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_T_13 = &_io_o_decode_packs_0_inst_type_T_12; // @[pla.scala 98:74]
  wire [12:0] io_o_decode_packs_0_inst_type_lo_7 = {inst_valid_0_andMatrixInput_18,inst_valid_0_andMatrixInput_19,
    inst_valid_0_andMatrixInput_20,inst_valid_0_andMatrixInput_21,inst_valid_0_andMatrixInput_22,
    inst_valid_0_andMatrixInput_23,inst_valid_0_andMatrixInput_9,inst_valid_0_lo_6}; // @[Cat.scala 33:92]
  wire [5:0] io_o_decode_packs_0_inst_type_hi_lo_6 = {inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,
    inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_15,inst_valid_0_andMatrixInput_16,
    inst_valid_0_andMatrixInput_17}; // @[Cat.scala 33:92]
  wire [25:0] _io_o_decode_packs_0_inst_type_T_14 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_5_8,
    inst_valid_0_andMatrixInput_7_6,inst_valid_0_andMatrixInput_8_5,inst_valid_0_andMatrixInput_9_3,
    inst_valid_0_andMatrixInput_10_3,inst_valid_0_andMatrixInput_11_3,io_o_decode_packs_0_inst_type_hi_lo_6,
    io_o_decode_packs_0_inst_type_lo_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_T_15 = &_io_o_decode_packs_0_inst_type_T_14; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_inst_type_lo_11 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_inst_type_T_22 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    io_o_decode_packs_0_inst_type_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_T_23 = &_io_o_decode_packs_0_inst_type_T_22; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_inst_type_lo_17 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_7_12,
    inst_valid_0_andMatrixInput_9,inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,
    inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_inst_type_T_34 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    io_o_decode_packs_0_inst_type_lo_17}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_T_35 = &_io_o_decode_packs_0_inst_type_T_34; // @[pla.scala 98:74]
  wire [6:0] io_o_decode_packs_0_inst_type_orMatrixOutputs_lo = {_io_o_decode_packs_0_inst_type_T_23,_inst_valid_0_T_27,
    _inst_valid_0_T_29,_inst_valid_0_T_31,_inst_valid_0_T_33,_inst_valid_0_T_35,_io_o_decode_packs_0_inst_type_T_35}; // @[Cat.scala 33:92]
  wire [14:0] _io_o_decode_packs_0_inst_type_orMatrixOutputs_T = {_inst_valid_0_T_1,_inst_valid_0_T_3,
    _io_o_decode_packs_0_regWen_T_5,_inst_valid_0_T_7,_io_o_decode_packs_0_inst_type_T_15,_inst_valid_0_T_17,
    _inst_valid_0_T_19,_io_o_decode_packs_0_func_code_T_25,io_o_decode_packs_0_inst_type_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_1 = |_io_o_decode_packs_0_inst_type_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [2:0] _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_2 = {_io_o_decode_packs_0_inst_type_T_11,
    _io_o_decode_packs_0_inst_type_T_13,_inst_valid_0_T_33}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_3 = |_io_o_decode_packs_0_inst_type_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [1:0] _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_4 = {_inst_valid_0_T_9,_inst_valid_0_T_19}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_5 = |_io_o_decode_packs_0_inst_type_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [6:0] io_o_decode_packs_0_inst_type_orMatrixOutputs = {4'h0,_io_o_decode_packs_0_inst_type_orMatrixOutputs_T_5,
    _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_3,_io_o_decode_packs_0_inst_type_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [6:0] io_o_decode_packs_0_inst_type_invMatrixOutputs = {io_o_decode_packs_0_inst_type_orMatrixOutputs[6],
    io_o_decode_packs_0_inst_type_orMatrixOutputs[5],io_o_decode_packs_0_inst_type_orMatrixOutputs[4],
    io_o_decode_packs_0_inst_type_orMatrixOutputs[3],io_o_decode_packs_0_inst_type_orMatrixOutputs[2],
    io_o_decode_packs_0_inst_type_orMatrixOutputs[1],io_o_decode_packs_0_inst_type_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [7:0] _io_o_decode_packs_1_inst_type_T_10 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_T_11 = &_io_o_decode_packs_1_inst_type_T_10; // @[pla.scala 98:74]
  wire [7:0] _io_o_decode_packs_1_inst_type_T_12 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_T_13 = &_io_o_decode_packs_1_inst_type_T_12; // @[pla.scala 98:74]
  wire [12:0] io_o_decode_packs_1_inst_type_lo_7 = {inst_valid_1_andMatrixInput_18,inst_valid_1_andMatrixInput_19,
    inst_valid_1_andMatrixInput_20,inst_valid_1_andMatrixInput_21,inst_valid_1_andMatrixInput_22,
    inst_valid_1_andMatrixInput_23,inst_valid_1_andMatrixInput_9,inst_valid_1_lo_6}; // @[Cat.scala 33:92]
  wire [5:0] io_o_decode_packs_1_inst_type_hi_lo_6 = {inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,
    inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_15,inst_valid_1_andMatrixInput_16,
    inst_valid_1_andMatrixInput_17}; // @[Cat.scala 33:92]
  wire [25:0] _io_o_decode_packs_1_inst_type_T_14 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_5_8,
    inst_valid_1_andMatrixInput_7_6,inst_valid_1_andMatrixInput_8_5,inst_valid_1_andMatrixInput_9_3,
    inst_valid_1_andMatrixInput_10_3,inst_valid_1_andMatrixInput_11_3,io_o_decode_packs_1_inst_type_hi_lo_6,
    io_o_decode_packs_1_inst_type_lo_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_T_15 = &_io_o_decode_packs_1_inst_type_T_14; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_inst_type_lo_11 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_inst_type_T_22 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    io_o_decode_packs_1_inst_type_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_T_23 = &_io_o_decode_packs_1_inst_type_T_22; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_inst_type_lo_17 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_7_12,
    inst_valid_1_andMatrixInput_9,inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,
    inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_inst_type_T_34 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    io_o_decode_packs_1_inst_type_lo_17}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_T_35 = &_io_o_decode_packs_1_inst_type_T_34; // @[pla.scala 98:74]
  wire [6:0] io_o_decode_packs_1_inst_type_orMatrixOutputs_lo = {_io_o_decode_packs_1_inst_type_T_23,_inst_valid_1_T_27,
    _inst_valid_1_T_29,_inst_valid_1_T_31,_inst_valid_1_T_33,_inst_valid_1_T_35,_io_o_decode_packs_1_inst_type_T_35}; // @[Cat.scala 33:92]
  wire [14:0] _io_o_decode_packs_1_inst_type_orMatrixOutputs_T = {_inst_valid_1_T_1,_inst_valid_1_T_3,
    _io_o_decode_packs_1_regWen_T_5,_inst_valid_1_T_7,_io_o_decode_packs_1_inst_type_T_15,_inst_valid_1_T_17,
    _inst_valid_1_T_19,_io_o_decode_packs_1_func_code_T_25,io_o_decode_packs_1_inst_type_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_1 = |_io_o_decode_packs_1_inst_type_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [2:0] _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_2 = {_io_o_decode_packs_1_inst_type_T_11,
    _io_o_decode_packs_1_inst_type_T_13,_inst_valid_1_T_33}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_3 = |_io_o_decode_packs_1_inst_type_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [1:0] _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_4 = {_inst_valid_1_T_9,_inst_valid_1_T_19}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_5 = |_io_o_decode_packs_1_inst_type_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [6:0] io_o_decode_packs_1_inst_type_orMatrixOutputs = {4'h0,_io_o_decode_packs_1_inst_type_orMatrixOutputs_T_5,
    _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_3,_io_o_decode_packs_1_inst_type_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [6:0] io_o_decode_packs_1_inst_type_invMatrixOutputs = {io_o_decode_packs_1_inst_type_orMatrixOutputs[6],
    io_o_decode_packs_1_inst_type_orMatrixOutputs[5],io_o_decode_packs_1_inst_type_orMatrixOutputs[4],
    io_o_decode_packs_1_inst_type_orMatrixOutputs[3],io_o_decode_packs_1_inst_type_orMatrixOutputs[2],
    io_o_decode_packs_1_inst_type_orMatrixOutputs[1],io_o_decode_packs_1_inst_type_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [1:0] _io_o_decode_packs_0_op1_sel_orMatrixOutputs_T_4 = {_io_o_decode_packs_0_func_code_T_23,
    _io_o_decode_packs_0_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_op1_sel_orMatrixOutputs_T_5 = |_io_o_decode_packs_0_op1_sel_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [2:0] io_o_decode_packs_0_op1_sel_orMatrixOutputs = {_io_o_decode_packs_0_op1_sel_orMatrixOutputs_T_5,
    _io_o_decode_packs_0_inst_type_orMatrixOutputs_T_5,_io_o_decode_packs_0_inst_type_orMatrixOutputs_T_5}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_0_op1_sel_invMatrixOutputs_hi = {io_o_decode_packs_0_op1_sel_orMatrixOutputs[2],
    io_o_decode_packs_0_op1_sel_orMatrixOutputs[1]}; // @[Cat.scala 33:92]
  wire [1:0] _io_o_decode_packs_1_op1_sel_orMatrixOutputs_T_4 = {_io_o_decode_packs_1_func_code_T_23,
    _io_o_decode_packs_1_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_op1_sel_orMatrixOutputs_T_5 = |_io_o_decode_packs_1_op1_sel_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [2:0] io_o_decode_packs_1_op1_sel_orMatrixOutputs = {_io_o_decode_packs_1_op1_sel_orMatrixOutputs_T_5,
    _io_o_decode_packs_1_inst_type_orMatrixOutputs_T_5,_io_o_decode_packs_1_inst_type_orMatrixOutputs_T_5}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_1_op1_sel_invMatrixOutputs_hi = {io_o_decode_packs_1_op1_sel_orMatrixOutputs[2],
    io_o_decode_packs_1_op1_sel_orMatrixOutputs[1]}; // @[Cat.scala 33:92]
  wire [6:0] _io_o_decode_packs_0_op2_sel_T_8 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2_4,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_op2_sel_T_9 = &_io_o_decode_packs_0_op2_sel_T_8; // @[pla.scala 98:74]
  wire [6:0] _io_o_decode_packs_0_op2_sel_T_10 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2_4,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_op2_sel_T_11 = &_io_o_decode_packs_0_op2_sel_T_10; // @[pla.scala 98:74]
  wire [5:0] io_o_decode_packs_0_op2_sel_orMatrixOutputs_lo = {_io_o_decode_packs_0_inst_type_T_23,
    _io_o_decode_packs_0_func_code_T_29,_inst_valid_0_T_29,_inst_valid_0_T_31,_inst_valid_0_T_35,
    _io_o_decode_packs_0_inst_type_T_35}; // @[Cat.scala 33:92]
  wire [11:0] _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T = {_inst_valid_0_T_1,_inst_valid_0_T_3,
    _io_o_decode_packs_0_regWen_T_5,_inst_valid_0_T_7,_io_o_decode_packs_0_regWen_T_17,
    _io_o_decode_packs_0_func_code_T_25,io_o_decode_packs_0_op2_sel_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_1 = |_io_o_decode_packs_0_op2_sel_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [12:0] _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_2 = {_inst_valid_0_T_1,_inst_valid_0_T_3,
    _io_o_decode_packs_0_regWen_T_5,_inst_valid_0_T_7,_io_o_decode_packs_0_op2_sel_T_9,_io_o_decode_packs_0_regWen_T_17,
    _io_o_decode_packs_0_func_code_T_25,io_o_decode_packs_0_op2_sel_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_3 = |_io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_4 = {_io_o_decode_packs_0_op2_sel_T_11,_inst_valid_0_T_19,
    _io_o_decode_packs_0_func_code_T_23,_io_o_decode_packs_0_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_5 = |_io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [2:0] io_o_decode_packs_0_op2_sel_orMatrixOutputs = {_io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_5,
    _io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_3,_io_o_decode_packs_0_op2_sel_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_0_op2_sel_invMatrixOutputs_hi = {io_o_decode_packs_0_op2_sel_orMatrixOutputs[2],
    io_o_decode_packs_0_op2_sel_orMatrixOutputs[1]}; // @[Cat.scala 33:92]
  wire [6:0] _io_o_decode_packs_1_op2_sel_T_8 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2_4,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_op2_sel_T_9 = &_io_o_decode_packs_1_op2_sel_T_8; // @[pla.scala 98:74]
  wire [6:0] _io_o_decode_packs_1_op2_sel_T_10 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2_4,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_op2_sel_T_11 = &_io_o_decode_packs_1_op2_sel_T_10; // @[pla.scala 98:74]
  wire [5:0] io_o_decode_packs_1_op2_sel_orMatrixOutputs_lo = {_io_o_decode_packs_1_inst_type_T_23,
    _io_o_decode_packs_1_func_code_T_29,_inst_valid_1_T_29,_inst_valid_1_T_31,_inst_valid_1_T_35,
    _io_o_decode_packs_1_inst_type_T_35}; // @[Cat.scala 33:92]
  wire [11:0] _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T = {_inst_valid_1_T_1,_inst_valid_1_T_3,
    _io_o_decode_packs_1_regWen_T_5,_inst_valid_1_T_7,_io_o_decode_packs_1_regWen_T_17,
    _io_o_decode_packs_1_func_code_T_25,io_o_decode_packs_1_op2_sel_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_1 = |_io_o_decode_packs_1_op2_sel_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [12:0] _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_2 = {_inst_valid_1_T_1,_inst_valid_1_T_3,
    _io_o_decode_packs_1_regWen_T_5,_inst_valid_1_T_7,_io_o_decode_packs_1_op2_sel_T_9,_io_o_decode_packs_1_regWen_T_17,
    _io_o_decode_packs_1_func_code_T_25,io_o_decode_packs_1_op2_sel_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_3 = |_io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_4 = {_io_o_decode_packs_1_op2_sel_T_11,_inst_valid_1_T_19,
    _io_o_decode_packs_1_func_code_T_23,_io_o_decode_packs_1_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_5 = |_io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [2:0] io_o_decode_packs_1_op2_sel_orMatrixOutputs = {_io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_5,
    _io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_3,_io_o_decode_packs_1_op2_sel_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_1_op2_sel_invMatrixOutputs_hi = {io_o_decode_packs_1_op2_sel_orMatrixOutputs[2],
    io_o_decode_packs_1_op2_sel_orMatrixOutputs[1]}; // @[Cat.scala 33:92]
  wire [8:0] _io_o_decode_packs_0_alu_sel_T = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_1 = &_io_o_decode_packs_0_alu_sel_T; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_alu_sel_T_4 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_5 = &_io_o_decode_packs_0_alu_sel_T_4; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_6 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    io_o_decode_packs_0_inst_type_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_7 = &_io_o_decode_packs_0_alu_sel_T_6; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_4 = {inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_8 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    io_o_decode_packs_0_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_9 = &_io_o_decode_packs_0_alu_sel_T_8; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_0_alu_sel_T_10 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_11 = &_io_o_decode_packs_0_alu_sel_T_10; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_12 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,
    io_o_decode_packs_0_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_13 = &_io_o_decode_packs_0_alu_sel_T_12; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_7 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2,
    inst_valid_0_andMatrixInput_9,inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,
    inst_valid_0_andMatrixInput_12,inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_14 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    io_o_decode_packs_0_alu_sel_lo_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_15 = &_io_o_decode_packs_0_alu_sel_T_14; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_16 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7,
    io_o_decode_packs_0_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_17 = &_io_o_decode_packs_0_alu_sel_T_16; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_11 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_22 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    io_o_decode_packs_0_alu_sel_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_23 = &_io_o_decode_packs_0_alu_sel_T_22; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_0_alu_sel_T_28 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,inst_valid_0_andMatrixInput_7,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_29 = &_io_o_decode_packs_0_alu_sel_T_28; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_30 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    io_o_decode_packs_0_inst_type_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_31 = &_io_o_decode_packs_0_alu_sel_T_30; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_32 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    io_o_decode_packs_0_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_33 = &_io_o_decode_packs_0_alu_sel_T_32; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_34 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,io_o_decode_packs_0_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_35 = &_io_o_decode_packs_0_alu_sel_T_34; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_alu_sel_T_36 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_37 = &_io_o_decode_packs_0_alu_sel_T_36; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_alu_sel_T_38 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7_10,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_39 = &_io_o_decode_packs_0_alu_sel_T_38; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_0_alu_sel_T_40 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7_10,inst_valid_0_lo_lo_6}
    ; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_41 = &_io_o_decode_packs_0_alu_sel_T_40; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_21 = {inst_valid_0_andMatrixInput_7_10,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_42 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    io_o_decode_packs_0_alu_sel_lo_21}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_43 = &_io_o_decode_packs_0_alu_sel_T_42; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_44 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7_10,
    io_o_decode_packs_0_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_45 = &_io_o_decode_packs_0_alu_sel_T_44; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_alu_sel_T_48 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7_10,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_49 = &_io_o_decode_packs_0_alu_sel_T_48; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_alu_sel_T_50 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7_10}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_51 = &_io_o_decode_packs_0_alu_sel_T_50; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_alu_sel_T_52 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_53 = &_io_o_decode_packs_0_alu_sel_T_52; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_alu_sel_T_54 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_55 = &_io_o_decode_packs_0_alu_sel_T_54; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_0_alu_sel_T_56 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7_12,inst_valid_0_lo_lo_6}
    ; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_57 = &_io_o_decode_packs_0_alu_sel_T_56; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_29 = {inst_valid_0_andMatrixInput_7_12,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,inst_valid_0_andMatrixInput_11_1,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_58 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    io_o_decode_packs_0_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_59 = &_io_o_decode_packs_0_alu_sel_T_58; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_64 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,io_o_decode_packs_0_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_65 = &_io_o_decode_packs_0_alu_sel_T_64; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_alu_sel_T_68 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_7_10,
    inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_69 = &_io_o_decode_packs_0_alu_sel_T_68; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_70 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7_10,io_o_decode_packs_0_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_71 = &_io_o_decode_packs_0_alu_sel_T_70; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_alu_sel_T_72 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7_10,inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_73 = &_io_o_decode_packs_0_alu_sel_T_72; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_74 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7_10,io_o_decode_packs_0_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_75 = &_io_o_decode_packs_0_alu_sel_T_74; // @[pla.scala 98:74]
  wire  io_o_decode_packs_0_alu_sel_andMatrixInput_16_5 = inst_valid_0_plaInput[20]; // @[pla.scala 90:45]
  wire [13:0] io_o_decode_packs_0_alu_sel_lo_38 = {inst_valid_0_andMatrixInput_18,inst_valid_0_andMatrixInput_19,
    io_o_decode_packs_0_alu_sel_andMatrixInput_16_5,inst_valid_0_andMatrixInput_20,inst_valid_0_andMatrixInput_21,
    inst_valid_0_andMatrixInput_22,inst_valid_0_andMatrixInput_23,inst_valid_0_lo_lo_6}; // @[Cat.scala 33:92]
  wire [27:0] _io_o_decode_packs_0_alu_sel_T_76 = {inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_6,inst_valid_0_andMatrixInput_8_5,
    inst_valid_0_andMatrixInput_9_3,inst_valid_0_andMatrixInput_10_3,io_o_decode_packs_0_func_code_hi_lo_23,
    io_o_decode_packs_0_alu_sel_lo_38}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_77 = &_io_o_decode_packs_0_alu_sel_T_76; // @[pla.scala 98:74]
  wire  io_o_decode_packs_0_alu_sel_andMatrixInput_14_28 = inst_valid_0_plaInput[30]; // @[pla.scala 90:45]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_40 = {inst_valid_0_andMatrixInput_6_2,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,io_o_decode_packs_0_alu_sel_andMatrixInput_14_28,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_80 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_3,inst_valid_0_andMatrixInput_4_5,
    inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,inst_valid_0_andMatrixInput_7,
    io_o_decode_packs_0_alu_sel_lo_40}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_81 = &_io_o_decode_packs_0_alu_sel_T_80; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_82 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,io_o_decode_packs_0_alu_sel_lo_40}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_83 = &_io_o_decode_packs_0_alu_sel_T_82; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_42 = {inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_7_12,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,io_o_decode_packs_0_alu_sel_andMatrixInput_14_28,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_0_alu_sel_T_84 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    io_o_decode_packs_0_alu_sel_lo_42}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_85 = &_io_o_decode_packs_0_alu_sel_T_84; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_0_alu_sel_lo_43 = {inst_valid_0_andMatrixInput_7_12,inst_valid_0_andMatrixInput_9,
    inst_valid_0_andMatrixInput_10,inst_valid_0_andMatrixInput_11,inst_valid_0_andMatrixInput_12,
    inst_valid_0_andMatrixInput_13,io_o_decode_packs_0_alu_sel_andMatrixInput_14_28,inst_valid_0_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_86 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,io_o_decode_packs_0_alu_sel_lo_43}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_87 = &_io_o_decode_packs_0_alu_sel_T_86; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_88 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,io_o_decode_packs_0_alu_sel_lo_43}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_89 = &_io_o_decode_packs_0_alu_sel_T_88; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_0_alu_sel_T_90 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3_9,inst_valid_0_andMatrixInput_3_3,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,io_o_decode_packs_0_alu_sel_lo_43}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_T_91 = &_io_o_decode_packs_0_alu_sel_T_90; // @[pla.scala 98:74]
  wire [6:0] io_o_decode_packs_0_alu_sel_orMatrixOutputs_lo = {_io_o_decode_packs_0_alu_sel_T_55,
    _io_o_decode_packs_0_alu_sel_T_65,_io_o_decode_packs_0_alu_sel_T_71,_io_o_decode_packs_0_alu_sel_T_73,
    _io_o_decode_packs_0_func_code_T_49,_io_o_decode_packs_0_alu_sel_T_85,_io_o_decode_packs_0_alu_sel_T_91}; // @[Cat.scala 33:92]
  wire [13:0] _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T = {_io_o_decode_packs_0_op2_sel_T_9,
    _io_o_decode_packs_0_alu_sel_T_11,_io_o_decode_packs_0_alu_sel_T_23,_io_o_decode_packs_0_alu_sel_T_31,
    _io_o_decode_packs_0_alu_sel_T_33,_io_o_decode_packs_0_alu_sel_T_39,_inst_valid_0_T_31,
    io_o_decode_packs_0_alu_sel_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_1 = |_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [5:0] io_o_decode_packs_0_alu_sel_orMatrixOutputs_lo_1 = {_inst_valid_0_T_35,_io_o_decode_packs_0_alu_sel_T_69,
    _io_o_decode_packs_0_alu_sel_T_77,_io_o_decode_packs_0_alu_sel_T_83,_io_o_decode_packs_0_alu_sel_T_87,
    _io_o_decode_packs_0_alu_sel_T_89}; // @[Cat.scala 33:92]
  wire [12:0] _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_2 = {_io_o_decode_packs_0_alu_sel_T_1,
    _io_o_decode_packs_0_alu_sel_T_9,_io_o_decode_packs_0_alu_sel_T_35,_io_o_decode_packs_0_alu_sel_T_37,
    _io_o_decode_packs_0_alu_sel_T_43,_io_o_decode_packs_0_alu_sel_T_45,_io_o_decode_packs_0_alu_sel_T_49,
    io_o_decode_packs_0_alu_sel_orMatrixOutputs_lo_1}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_3 = |_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [8:0] _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_4 = {_io_o_decode_packs_0_alu_sel_T_7,
    _io_o_decode_packs_0_func_code_T_23,_io_o_decode_packs_0_inst_type_T_23,_io_o_decode_packs_0_alu_sel_T_51,
    _io_o_decode_packs_0_alu_sel_T_53,_io_o_decode_packs_0_alu_sel_T_59,_inst_valid_0_T_37,_inst_valid_0_T_39,
    _io_o_decode_packs_0_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_5 = |_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [7:0] _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_6 = {_io_o_decode_packs_0_alu_sel_T_5,
    _io_o_decode_packs_0_alu_sel_T_13,_io_o_decode_packs_0_alu_sel_T_15,_io_o_decode_packs_0_func_code_T_25,
    _inst_valid_0_T_25,_inst_valid_0_T_35,_inst_valid_0_T_37,_io_o_decode_packs_0_alu_sel_T_75}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_7 = |_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_6; // @[pla.scala 114:39]
  wire [5:0] _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_8 = {_io_o_decode_packs_0_alu_sel_T_17,
    _io_o_decode_packs_0_alu_sel_T_29,_io_o_decode_packs_0_alu_sel_T_41,_io_o_decode_packs_0_alu_sel_T_57,
    _inst_valid_0_T_39,_io_o_decode_packs_0_alu_sel_T_81}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_9 = |_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_8; // @[pla.scala 114:39]
  wire [4:0] io_o_decode_packs_0_alu_sel_orMatrixOutputs = {_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_9,
    _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_7,_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_5,
    _io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_3,_io_o_decode_packs_0_alu_sel_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_0_alu_sel_invMatrixOutputs_lo = {io_o_decode_packs_0_alu_sel_orMatrixOutputs[1],
    io_o_decode_packs_0_alu_sel_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [2:0] io_o_decode_packs_0_alu_sel_invMatrixOutputs_hi = {io_o_decode_packs_0_alu_sel_orMatrixOutputs[4],
    io_o_decode_packs_0_alu_sel_orMatrixOutputs[3],io_o_decode_packs_0_alu_sel_orMatrixOutputs[2]}; // @[Cat.scala 33:92]
  wire [8:0] _io_o_decode_packs_1_alu_sel_T = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_1 = &_io_o_decode_packs_1_alu_sel_T; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_alu_sel_T_4 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_5 = &_io_o_decode_packs_1_alu_sel_T_4; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_6 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    io_o_decode_packs_1_inst_type_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_7 = &_io_o_decode_packs_1_alu_sel_T_6; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_4 = {inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_8 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    io_o_decode_packs_1_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_9 = &_io_o_decode_packs_1_alu_sel_T_8; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_1_alu_sel_T_10 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_11 = &_io_o_decode_packs_1_alu_sel_T_10; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_12 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,
    io_o_decode_packs_1_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_13 = &_io_o_decode_packs_1_alu_sel_T_12; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_7 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2,
    inst_valid_1_andMatrixInput_9,inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,
    inst_valid_1_andMatrixInput_12,inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_14 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    io_o_decode_packs_1_alu_sel_lo_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_15 = &_io_o_decode_packs_1_alu_sel_T_14; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_16 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7,
    io_o_decode_packs_1_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_17 = &_io_o_decode_packs_1_alu_sel_T_16; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_11 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_22 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    io_o_decode_packs_1_alu_sel_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_23 = &_io_o_decode_packs_1_alu_sel_T_22; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_1_alu_sel_T_28 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,inst_valid_1_andMatrixInput_7,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_29 = &_io_o_decode_packs_1_alu_sel_T_28; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_30 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    io_o_decode_packs_1_inst_type_lo_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_31 = &_io_o_decode_packs_1_alu_sel_T_30; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_32 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    io_o_decode_packs_1_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_33 = &_io_o_decode_packs_1_alu_sel_T_32; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_34 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,io_o_decode_packs_1_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_35 = &_io_o_decode_packs_1_alu_sel_T_34; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_alu_sel_T_36 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_37 = &_io_o_decode_packs_1_alu_sel_T_36; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_alu_sel_T_38 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7_10,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_39 = &_io_o_decode_packs_1_alu_sel_T_38; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_1_alu_sel_T_40 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7_10,inst_valid_1_lo_lo_6}
    ; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_41 = &_io_o_decode_packs_1_alu_sel_T_40; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_21 = {inst_valid_1_andMatrixInput_7_10,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_42 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    io_o_decode_packs_1_alu_sel_lo_21}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_43 = &_io_o_decode_packs_1_alu_sel_T_42; // @[pla.scala 98:74]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_44 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7_10,
    io_o_decode_packs_1_alu_sel_lo_4}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_45 = &_io_o_decode_packs_1_alu_sel_T_44; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_alu_sel_T_48 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7_10,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_49 = &_io_o_decode_packs_1_alu_sel_T_48; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_alu_sel_T_50 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7_10}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_51 = &_io_o_decode_packs_1_alu_sel_T_50; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_alu_sel_T_52 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_53 = &_io_o_decode_packs_1_alu_sel_T_52; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_alu_sel_T_54 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_55 = &_io_o_decode_packs_1_alu_sel_T_54; // @[pla.scala 98:74]
  wire [14:0] _io_o_decode_packs_1_alu_sel_T_56 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7_12,inst_valid_1_lo_lo_6}
    ; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_57 = &_io_o_decode_packs_1_alu_sel_T_56; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_29 = {inst_valid_1_andMatrixInput_7_12,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,inst_valid_1_andMatrixInput_11_1,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_58 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    io_o_decode_packs_1_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_59 = &_io_o_decode_packs_1_alu_sel_T_58; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_64 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,io_o_decode_packs_1_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_65 = &_io_o_decode_packs_1_alu_sel_T_64; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_alu_sel_T_68 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_7_10,
    inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_69 = &_io_o_decode_packs_1_alu_sel_T_68; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_70 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7_10,io_o_decode_packs_1_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_71 = &_io_o_decode_packs_1_alu_sel_T_70; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_alu_sel_T_72 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7_10,inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_73 = &_io_o_decode_packs_1_alu_sel_T_72; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_74 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7_10,io_o_decode_packs_1_alu_sel_lo_29}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_75 = &_io_o_decode_packs_1_alu_sel_T_74; // @[pla.scala 98:74]
  wire  io_o_decode_packs_1_alu_sel_andMatrixInput_16_5 = inst_valid_1_plaInput[20]; // @[pla.scala 90:45]
  wire [13:0] io_o_decode_packs_1_alu_sel_lo_38 = {inst_valid_1_andMatrixInput_18,inst_valid_1_andMatrixInput_19,
    io_o_decode_packs_1_alu_sel_andMatrixInput_16_5,inst_valid_1_andMatrixInput_20,inst_valid_1_andMatrixInput_21,
    inst_valid_1_andMatrixInput_22,inst_valid_1_andMatrixInput_23,inst_valid_1_lo_lo_6}; // @[Cat.scala 33:92]
  wire [27:0] _io_o_decode_packs_1_alu_sel_T_76 = {inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_6,inst_valid_1_andMatrixInput_8_5,
    inst_valid_1_andMatrixInput_9_3,inst_valid_1_andMatrixInput_10_3,io_o_decode_packs_1_func_code_hi_lo_23,
    io_o_decode_packs_1_alu_sel_lo_38}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_77 = &_io_o_decode_packs_1_alu_sel_T_76; // @[pla.scala 98:74]
  wire  io_o_decode_packs_1_alu_sel_andMatrixInput_14_28 = inst_valid_1_plaInput[30]; // @[pla.scala 90:45]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_40 = {inst_valid_1_andMatrixInput_6_2,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,io_o_decode_packs_1_alu_sel_andMatrixInput_14_28,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_80 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_3,inst_valid_1_andMatrixInput_4_5,
    inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,inst_valid_1_andMatrixInput_7,
    io_o_decode_packs_1_alu_sel_lo_40}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_81 = &_io_o_decode_packs_1_alu_sel_T_80; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_82 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,io_o_decode_packs_1_alu_sel_lo_40}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_83 = &_io_o_decode_packs_1_alu_sel_T_82; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_42 = {inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_7_12,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,io_o_decode_packs_1_alu_sel_andMatrixInput_14_28,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [15:0] _io_o_decode_packs_1_alu_sel_T_84 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    io_o_decode_packs_1_alu_sel_lo_42}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_85 = &_io_o_decode_packs_1_alu_sel_T_84; // @[pla.scala 98:74]
  wire [7:0] io_o_decode_packs_1_alu_sel_lo_43 = {inst_valid_1_andMatrixInput_7_12,inst_valid_1_andMatrixInput_9,
    inst_valid_1_andMatrixInput_10,inst_valid_1_andMatrixInput_11,inst_valid_1_andMatrixInput_12,
    inst_valid_1_andMatrixInput_13,io_o_decode_packs_1_alu_sel_andMatrixInput_14_28,inst_valid_1_andMatrixInput_14}; // @[Cat.scala 33:92]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_86 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,io_o_decode_packs_1_alu_sel_lo_43}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_87 = &_io_o_decode_packs_1_alu_sel_T_86; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_88 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,io_o_decode_packs_1_alu_sel_lo_43}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_89 = &_io_o_decode_packs_1_alu_sel_T_88; // @[pla.scala 98:74]
  wire [16:0] _io_o_decode_packs_1_alu_sel_T_90 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3_9,inst_valid_1_andMatrixInput_3_3,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,io_o_decode_packs_1_alu_sel_lo_43}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_T_91 = &_io_o_decode_packs_1_alu_sel_T_90; // @[pla.scala 98:74]
  wire [6:0] io_o_decode_packs_1_alu_sel_orMatrixOutputs_lo = {_io_o_decode_packs_1_alu_sel_T_55,
    _io_o_decode_packs_1_alu_sel_T_65,_io_o_decode_packs_1_alu_sel_T_71,_io_o_decode_packs_1_alu_sel_T_73,
    _io_o_decode_packs_1_func_code_T_49,_io_o_decode_packs_1_alu_sel_T_85,_io_o_decode_packs_1_alu_sel_T_91}; // @[Cat.scala 33:92]
  wire [13:0] _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T = {_io_o_decode_packs_1_op2_sel_T_9,
    _io_o_decode_packs_1_alu_sel_T_11,_io_o_decode_packs_1_alu_sel_T_23,_io_o_decode_packs_1_alu_sel_T_31,
    _io_o_decode_packs_1_alu_sel_T_33,_io_o_decode_packs_1_alu_sel_T_39,_inst_valid_1_T_31,
    io_o_decode_packs_1_alu_sel_orMatrixOutputs_lo}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_1 = |_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [5:0] io_o_decode_packs_1_alu_sel_orMatrixOutputs_lo_1 = {_inst_valid_1_T_35,_io_o_decode_packs_1_alu_sel_T_69,
    _io_o_decode_packs_1_alu_sel_T_77,_io_o_decode_packs_1_alu_sel_T_83,_io_o_decode_packs_1_alu_sel_T_87,
    _io_o_decode_packs_1_alu_sel_T_89}; // @[Cat.scala 33:92]
  wire [12:0] _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_2 = {_io_o_decode_packs_1_alu_sel_T_1,
    _io_o_decode_packs_1_alu_sel_T_9,_io_o_decode_packs_1_alu_sel_T_35,_io_o_decode_packs_1_alu_sel_T_37,
    _io_o_decode_packs_1_alu_sel_T_43,_io_o_decode_packs_1_alu_sel_T_45,_io_o_decode_packs_1_alu_sel_T_49,
    io_o_decode_packs_1_alu_sel_orMatrixOutputs_lo_1}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_3 = |_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [8:0] _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_4 = {_io_o_decode_packs_1_alu_sel_T_7,
    _io_o_decode_packs_1_func_code_T_23,_io_o_decode_packs_1_inst_type_T_23,_io_o_decode_packs_1_alu_sel_T_51,
    _io_o_decode_packs_1_alu_sel_T_53,_io_o_decode_packs_1_alu_sel_T_59,_inst_valid_1_T_37,_inst_valid_1_T_39,
    _io_o_decode_packs_1_func_code_T_49}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_5 = |_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [7:0] _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_6 = {_io_o_decode_packs_1_alu_sel_T_5,
    _io_o_decode_packs_1_alu_sel_T_13,_io_o_decode_packs_1_alu_sel_T_15,_io_o_decode_packs_1_func_code_T_25,
    _inst_valid_1_T_25,_inst_valid_1_T_35,_inst_valid_1_T_37,_io_o_decode_packs_1_alu_sel_T_75}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_7 = |_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_6; // @[pla.scala 114:39]
  wire [5:0] _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_8 = {_io_o_decode_packs_1_alu_sel_T_17,
    _io_o_decode_packs_1_alu_sel_T_29,_io_o_decode_packs_1_alu_sel_T_41,_io_o_decode_packs_1_alu_sel_T_57,
    _inst_valid_1_T_39,_io_o_decode_packs_1_alu_sel_T_81}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_9 = |_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_8; // @[pla.scala 114:39]
  wire [4:0] io_o_decode_packs_1_alu_sel_orMatrixOutputs = {_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_9,
    _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_7,_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_5,
    _io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_3,_io_o_decode_packs_1_alu_sel_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_1_alu_sel_invMatrixOutputs_lo = {io_o_decode_packs_1_alu_sel_orMatrixOutputs[1],
    io_o_decode_packs_1_alu_sel_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [2:0] io_o_decode_packs_1_alu_sel_invMatrixOutputs_hi = {io_o_decode_packs_1_alu_sel_orMatrixOutputs[4],
    io_o_decode_packs_1_alu_sel_orMatrixOutputs[3],io_o_decode_packs_1_alu_sel_orMatrixOutputs[2]}; // @[Cat.scala 33:92]
  wire [9:0] _io_o_decode_packs_0_branch_type_T = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_1 = &_io_o_decode_packs_0_branch_type_T; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_branch_type_T_6 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_7 = &_io_o_decode_packs_0_branch_type_T_6; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_branch_type_T_8 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_9 = &_io_o_decode_packs_0_branch_type_T_8; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_branch_type_T_10 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7,
    inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_11 = &_io_o_decode_packs_0_branch_type_T_10; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_branch_type_T_12 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6_10,
    inst_valid_0_andMatrixInput_7,inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_13 = &_io_o_decode_packs_0_branch_type_T_12; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_0_branch_type_T_14 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_7_10,
    inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_15 = &_io_o_decode_packs_0_branch_type_T_14; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_0_branch_type_T_16 = {inst_valid_0_andMatrixInput_0,inst_valid_0_andMatrixInput_1,
    inst_valid_0_andMatrixInput_2,inst_valid_0_andMatrixInput_3,inst_valid_0_andMatrixInput_4_1,
    inst_valid_0_andMatrixInput_4_5,inst_valid_0_andMatrixInput_5_8,inst_valid_0_andMatrixInput_6,
    inst_valid_0_andMatrixInput_7_10,inst_valid_0_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_T_17 = &_io_o_decode_packs_0_branch_type_T_16; // @[pla.scala 98:74]
  wire [2:0] _io_o_decode_packs_0_branch_type_orMatrixOutputs_T = {_inst_valid_0_T_19,
    _io_o_decode_packs_0_branch_type_T_7,_io_o_decode_packs_0_branch_type_T_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_1 = |_io_o_decode_packs_0_branch_type_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_2 = {_io_o_decode_packs_0_branch_type_T_1,
    _inst_valid_0_T_19,_io_o_decode_packs_0_branch_type_T_13,_io_o_decode_packs_0_branch_type_T_17}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_3 = |_io_o_decode_packs_0_branch_type_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [2:0] _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_4 = {_inst_valid_0_T_19,
    _io_o_decode_packs_0_branch_type_T_9,_io_o_decode_packs_0_branch_type_T_15}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_5 = |_io_o_decode_packs_0_branch_type_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire  _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_6 = |_io_o_decode_packs_0_regWen_T_17; // @[pla.scala 114:39]
  wire [3:0] io_o_decode_packs_0_branch_type_orMatrixOutputs = {_io_o_decode_packs_0_branch_type_orMatrixOutputs_T_6,
    _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_5,_io_o_decode_packs_0_branch_type_orMatrixOutputs_T_3,
    _io_o_decode_packs_0_branch_type_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_0_branch_type_invMatrixOutputs_lo = {io_o_decode_packs_0_branch_type_orMatrixOutputs[1],
    io_o_decode_packs_0_branch_type_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_0_branch_type_invMatrixOutputs_hi = {io_o_decode_packs_0_branch_type_orMatrixOutputs[3],
    io_o_decode_packs_0_branch_type_orMatrixOutputs[2]}; // @[Cat.scala 33:92]
  wire [9:0] _io_o_decode_packs_1_branch_type_T = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_6_2}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_1 = &_io_o_decode_packs_1_branch_type_T; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_branch_type_T_6 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_7 = &_io_o_decode_packs_1_branch_type_T_6; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_branch_type_T_8 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_9 = &_io_o_decode_packs_1_branch_type_T_8; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_branch_type_T_10 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7,
    inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_11 = &_io_o_decode_packs_1_branch_type_T_10; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_branch_type_T_12 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6_10,
    inst_valid_1_andMatrixInput_7,inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_13 = &_io_o_decode_packs_1_branch_type_T_12; // @[pla.scala 98:74]
  wire [8:0] _io_o_decode_packs_1_branch_type_T_14 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_7_10,
    inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_15 = &_io_o_decode_packs_1_branch_type_T_14; // @[pla.scala 98:74]
  wire [9:0] _io_o_decode_packs_1_branch_type_T_16 = {inst_valid_1_andMatrixInput_0,inst_valid_1_andMatrixInput_1,
    inst_valid_1_andMatrixInput_2,inst_valid_1_andMatrixInput_3,inst_valid_1_andMatrixInput_4_1,
    inst_valid_1_andMatrixInput_4_5,inst_valid_1_andMatrixInput_5_8,inst_valid_1_andMatrixInput_6,
    inst_valid_1_andMatrixInput_7_10,inst_valid_1_andMatrixInput_7_12}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_T_17 = &_io_o_decode_packs_1_branch_type_T_16; // @[pla.scala 98:74]
  wire [2:0] _io_o_decode_packs_1_branch_type_orMatrixOutputs_T = {_inst_valid_1_T_19,
    _io_o_decode_packs_1_branch_type_T_7,_io_o_decode_packs_1_branch_type_T_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_1 = |_io_o_decode_packs_1_branch_type_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_2 = {_io_o_decode_packs_1_branch_type_T_1,
    _inst_valid_1_T_19,_io_o_decode_packs_1_branch_type_T_13,_io_o_decode_packs_1_branch_type_T_17}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_3 = |_io_o_decode_packs_1_branch_type_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [2:0] _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_4 = {_inst_valid_1_T_19,
    _io_o_decode_packs_1_branch_type_T_9,_io_o_decode_packs_1_branch_type_T_15}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_5 = |_io_o_decode_packs_1_branch_type_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire  _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_6 = |_io_o_decode_packs_1_regWen_T_17; // @[pla.scala 114:39]
  wire [3:0] io_o_decode_packs_1_branch_type_orMatrixOutputs = {_io_o_decode_packs_1_branch_type_orMatrixOutputs_T_6,
    _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_5,_io_o_decode_packs_1_branch_type_orMatrixOutputs_T_3,
    _io_o_decode_packs_1_branch_type_orMatrixOutputs_T_1}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_1_branch_type_invMatrixOutputs_lo = {io_o_decode_packs_1_branch_type_orMatrixOutputs[1],
    io_o_decode_packs_1_branch_type_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  wire [1:0] io_o_decode_packs_1_branch_type_invMatrixOutputs_hi = {io_o_decode_packs_1_branch_type_orMatrixOutputs[3],
    io_o_decode_packs_1_branch_type_orMatrixOutputs[2]}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_mem_type_orMatrixOutputs_T = |_io_o_decode_packs_0_inst_type_T_11; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_0_mem_type_orMatrixOutputs_T_1 = {_io_o_decode_packs_0_func_code_T_1,_inst_valid_0_T_3,
    _io_o_decode_packs_0_regWen_T_5,_io_o_decode_packs_0_op2_sel_T_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_0_mem_type_orMatrixOutputs_T_2 = |_io_o_decode_packs_0_mem_type_orMatrixOutputs_T_1; // @[pla.scala 114:39]
  wire [1:0] io_o_decode_packs_0_mem_type_orMatrixOutputs = {_io_o_decode_packs_0_mem_type_orMatrixOutputs_T_2,
    _io_o_decode_packs_0_mem_type_orMatrixOutputs_T}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_mem_type_orMatrixOutputs_T = |_io_o_decode_packs_1_inst_type_T_11; // @[pla.scala 114:39]
  wire [3:0] _io_o_decode_packs_1_mem_type_orMatrixOutputs_T_1 = {_io_o_decode_packs_1_func_code_T_1,_inst_valid_1_T_3,
    _io_o_decode_packs_1_regWen_T_5,_io_o_decode_packs_1_op2_sel_T_11}; // @[Cat.scala 33:92]
  wire  _io_o_decode_packs_1_mem_type_orMatrixOutputs_T_2 = |_io_o_decode_packs_1_mem_type_orMatrixOutputs_T_1; // @[pla.scala 114:39]
  wire [1:0] io_o_decode_packs_1_mem_type_orMatrixOutputs = {_io_o_decode_packs_1_mem_type_orMatrixOutputs_T_2,
    _io_o_decode_packs_1_mem_type_orMatrixOutputs_T}; // @[Cat.scala 33:92]
  wire  _immI_T_1 = ~insts_0[31]; // @[decoder.scala 82:53]
  wire [63:0] _immI_T_4 = {52'hfffffffffffff,insts_0[31:20]}; // @[Cat.scala 33:92]
  wire [63:0] immI_0 = ~insts_0[31] ? {{52'd0}, insts_0[31:20]} : _immI_T_4; // @[decoder.scala 82:40]
  wire  _immI_T_7 = ~insts_1[31]; // @[decoder.scala 82:53]
  wire [63:0] _immI_T_10 = {52'hfffffffffffff,insts_1[31:20]}; // @[Cat.scala 33:92]
  wire [63:0] immI_1 = ~insts_1[31] ? {{52'd0}, insts_1[31:20]} : _immI_T_10; // @[decoder.scala 82:40]
  wire [11:0] _immS_T_4 = {insts_0[31:25],insts_0[11:7]}; // @[Cat.scala 33:92]
  wire [43:0] _immS_T_8 = {32'hffffffff,insts_0[31:25],insts_0[11:7]}; // @[Cat.scala 33:92]
  wire [43:0] immS_0 = _immI_T_1 ? {{32'd0}, _immS_T_4} : _immS_T_8; // @[decoder.scala 83:40]
  wire [11:0] _immS_T_14 = {insts_1[31:25],insts_1[11:7]}; // @[Cat.scala 33:92]
  wire [43:0] _immS_T_18 = {32'hffffffff,insts_1[31:25],insts_1[11:7]}; // @[Cat.scala 33:92]
  wire [43:0] immS_1 = _immI_T_7 ? {{32'd0}, _immS_T_14} : _immS_T_18; // @[decoder.scala 83:40]
  wire [31:0] immU_0 = {insts_0[31:12], 12'h0}; // @[decoder.scala 84:52]
  wire [31:0] immU_1 = {insts_1[31:12], 12'h0}; // @[decoder.scala 84:52]
  wire [43:0] _immJ_T_3 = insts_0[31] ? 44'hfffffffffff : {{43'd0}, insts_0[31]}; // @[decoder.scala 85:41]
  wire [63:0] _immJ_T_4 = {_immJ_T_3, 20'h0}; // @[decoder.scala 85:94]
  wire [19:0] _immJ_T_6 = {insts_0[19:12], 12'h0}; // @[decoder.scala 85:123]
  wire [63:0] _GEN_124 = {{44'd0}, _immJ_T_6}; // @[decoder.scala 85:106]
  wire [63:0] _immJ_T_8 = _immJ_T_4 + _GEN_124; // @[decoder.scala 85:106]
  wire [11:0] _immJ_T_10 = {insts_0[20], 11'h0}; // @[decoder.scala 85:152]
  wire [63:0] _GEN_125 = {{52'd0}, _immJ_T_10}; // @[decoder.scala 85:135]
  wire [63:0] _immJ_T_12 = _immJ_T_8 + _GEN_125; // @[decoder.scala 85:135]
  wire [10:0] _immJ_T_14 = {insts_0[30:21], 1'h0}; // @[decoder.scala 85:181]
  wire [63:0] _GEN_126 = {{53'd0}, _immJ_T_14}; // @[decoder.scala 85:164]
  wire [63:0] immJ_0 = _immJ_T_12 + _GEN_126; // @[decoder.scala 85:164]
  wire [43:0] _immJ_T_20 = insts_1[31] ? 44'hfffffffffff : {{43'd0}, insts_1[31]}; // @[decoder.scala 85:41]
  wire [63:0] _immJ_T_21 = {_immJ_T_20, 20'h0}; // @[decoder.scala 85:94]
  wire [19:0] _immJ_T_23 = {insts_1[19:12], 12'h0}; // @[decoder.scala 85:123]
  wire [63:0] _GEN_127 = {{44'd0}, _immJ_T_23}; // @[decoder.scala 85:106]
  wire [63:0] _immJ_T_25 = _immJ_T_21 + _GEN_127; // @[decoder.scala 85:106]
  wire [11:0] _immJ_T_27 = {insts_1[20], 11'h0}; // @[decoder.scala 85:152]
  wire [63:0] _GEN_128 = {{52'd0}, _immJ_T_27}; // @[decoder.scala 85:135]
  wire [63:0] _immJ_T_29 = _immJ_T_25 + _GEN_128; // @[decoder.scala 85:135]
  wire [10:0] _immJ_T_31 = {insts_1[30:21], 1'h0}; // @[decoder.scala 85:181]
  wire [63:0] _GEN_129 = {{53'd0}, _immJ_T_31}; // @[decoder.scala 85:164]
  wire [63:0] immJ_1 = _immJ_T_29 + _GEN_129; // @[decoder.scala 85:164]
  wire [43:0] _immB_T_3 = _immI_T_1 ? {{43'd0}, insts_0[31]} : 44'hfffffffffff; // @[decoder.scala 86:41]
  wire [55:0] _immB_T_4 = {_immB_T_3, 12'h0}; // @[decoder.scala 86:94]
  wire [11:0] _immB_T_6 = {insts_0[7], 11'h0}; // @[decoder.scala 86:121]
  wire [55:0] _GEN_130 = {{44'd0}, _immB_T_6}; // @[decoder.scala 86:106]
  wire [55:0] _immB_T_8 = _immB_T_4 + _GEN_130; // @[decoder.scala 86:106]
  wire [10:0] _immB_T_10 = {insts_0[30:25], 5'h0}; // @[decoder.scala 86:150]
  wire [55:0] _GEN_131 = {{45'd0}, _immB_T_10}; // @[decoder.scala 86:133]
  wire [55:0] _immB_T_12 = _immB_T_8 + _GEN_131; // @[decoder.scala 86:133]
  wire [4:0] _immB_T_14 = {insts_0[11:8], 1'h0}; // @[decoder.scala 86:177]
  wire [55:0] _GEN_132 = {{51'd0}, _immB_T_14}; // @[decoder.scala 86:161]
  wire [55:0] immB_0 = _immB_T_12 + _GEN_132; // @[decoder.scala 86:161]
  wire [43:0] _immB_T_20 = _immI_T_7 ? {{43'd0}, insts_1[31]} : 44'hfffffffffff; // @[decoder.scala 86:41]
  wire [55:0] _immB_T_21 = {_immB_T_20, 12'h0}; // @[decoder.scala 86:94]
  wire [11:0] _immB_T_23 = {insts_1[7], 11'h0}; // @[decoder.scala 86:121]
  wire [55:0] _GEN_133 = {{44'd0}, _immB_T_23}; // @[decoder.scala 86:106]
  wire [55:0] _immB_T_25 = _immB_T_21 + _GEN_133; // @[decoder.scala 86:106]
  wire [10:0] _immB_T_27 = {insts_1[30:25], 5'h0}; // @[decoder.scala 86:150]
  wire [55:0] _GEN_134 = {{45'd0}, _immB_T_27}; // @[decoder.scala 86:133]
  wire [55:0] _immB_T_29 = _immB_T_25 + _GEN_134; // @[decoder.scala 86:133]
  wire [4:0] _immB_T_31 = {insts_1[11:8], 1'h0}; // @[decoder.scala 86:177]
  wire [55:0] _GEN_135 = {{51'd0}, _immB_T_31}; // @[decoder.scala 86:161]
  wire [55:0] immB_1 = _immB_T_29 + _GEN_135; // @[decoder.scala 86:161]
  wire [6:0] _GEN_136 = {{4'd0}, io_o_decode_packs_0_inst_type}; // @[decoder.scala 95:42]
  wire  _io_o_decode_packs_0_imm_T = _GEN_136 == 7'h1; // @[decoder.scala 95:42]
  wire  _io_o_decode_packs_0_imm_T_1 = _GEN_136 == 7'h4; // @[decoder.scala 96:42]
  wire  _io_o_decode_packs_0_imm_T_2 = _GEN_136 == 7'h2; // @[decoder.scala 97:42]
  wire  _io_o_decode_packs_0_imm_T_3 = _GEN_136 == 7'h5; // @[decoder.scala 98:42]
  wire  _io_o_decode_packs_0_imm_T_4 = _GEN_136 == 7'h3; // @[decoder.scala 99:42]
  wire [63:0] _io_o_decode_packs_0_imm_T_7 = _io_o_decode_packs_0_imm_T_4 ? {{8'd0}, immB_0} : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_0_imm_T_8 = _io_o_decode_packs_0_imm_T_3 ? immJ_0 : _io_o_decode_packs_0_imm_T_7; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_0_imm_T_9 = _io_o_decode_packs_0_imm_T_2 ? {{20'd0}, immS_0} :
    _io_o_decode_packs_0_imm_T_8; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_0_imm_T_10 = _io_o_decode_packs_0_imm_T_1 ? {{32'd0}, immU_0} :
    _io_o_decode_packs_0_imm_T_9; // @[Mux.scala 101:16]
  wire  _io_o_decode_packs_0_src1_valid_T = io_o_decode_packs_0_op1_sel == 3'h0; // @[decoder.scala 111:38]
  wire  _io_o_decode_packs_0_src1_valid_T_1 = io_o_decode_packs_0_op1_sel == 3'h3; // @[decoder.scala 112:38]
  wire  _io_o_decode_packs_0_src1_valid_T_2 = io_o_decode_packs_0_op1_sel == 3'h2; // @[decoder.scala 113:38]
  wire  _io_o_decode_packs_0_src1_valid_T_3 = io_o_decode_packs_0_op1_sel == 3'h1; // @[decoder.scala 114:38]
  wire  _io_o_decode_packs_0_src1_valid_T_4 = io_o_decode_packs_0_op1_sel == 3'h4; // @[decoder.scala 115:38]
  wire  _io_o_decode_packs_0_src2_valid_T = io_o_decode_packs_0_op2_sel == 3'h0; // @[decoder.scala 118:39]
  wire  _io_o_decode_packs_0_src2_valid_T_1 = io_o_decode_packs_0_op2_sel == 3'h3; // @[decoder.scala 119:39]
  wire  _io_o_decode_packs_0_src2_valid_T_2 = io_o_decode_packs_0_op2_sel == 3'h2; // @[decoder.scala 120:39]
  wire  _io_o_decode_packs_0_src2_valid_T_3 = io_o_decode_packs_0_op2_sel == 3'h1; // @[decoder.scala 121:39]
  wire  _io_o_decode_packs_0_src2_valid_T_4 = io_o_decode_packs_0_op2_sel == 3'h4; // @[decoder.scala 122:39]
  wire [63:0] _io_o_decode_packs_0_src1_value_T_4 = _io_o_decode_packs_0_src1_valid_T_2 ? {{32'd0},
    io_o_decode_packs_0_pc} : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_0_src2_value_T_4 = _io_o_decode_packs_0_src2_valid_T_2 ? {{32'd0},
    io_o_decode_packs_0_pc} : 64'h0; // @[Mux.scala 101:16]
  wire [6:0] _GEN_142 = {{4'd0}, io_o_decode_packs_1_inst_type}; // @[decoder.scala 95:42]
  wire  _io_o_decode_packs_1_imm_T = _GEN_142 == 7'h1; // @[decoder.scala 95:42]
  wire  _io_o_decode_packs_1_imm_T_1 = _GEN_142 == 7'h4; // @[decoder.scala 96:42]
  wire  _io_o_decode_packs_1_imm_T_2 = _GEN_142 == 7'h2; // @[decoder.scala 97:42]
  wire  _io_o_decode_packs_1_imm_T_3 = _GEN_142 == 7'h5; // @[decoder.scala 98:42]
  wire  _io_o_decode_packs_1_imm_T_4 = _GEN_142 == 7'h3; // @[decoder.scala 99:42]
  wire [63:0] _io_o_decode_packs_1_imm_T_7 = _io_o_decode_packs_1_imm_T_4 ? {{8'd0}, immB_1} : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_1_imm_T_8 = _io_o_decode_packs_1_imm_T_3 ? immJ_1 : _io_o_decode_packs_1_imm_T_7; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_1_imm_T_9 = _io_o_decode_packs_1_imm_T_2 ? {{20'd0}, immS_1} :
    _io_o_decode_packs_1_imm_T_8; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_1_imm_T_10 = _io_o_decode_packs_1_imm_T_1 ? {{32'd0}, immU_1} :
    _io_o_decode_packs_1_imm_T_9; // @[Mux.scala 101:16]
  wire  _io_o_decode_packs_1_src1_valid_T = io_o_decode_packs_1_op1_sel == 3'h0; // @[decoder.scala 111:38]
  wire  _io_o_decode_packs_1_src1_valid_T_1 = io_o_decode_packs_1_op1_sel == 3'h3; // @[decoder.scala 112:38]
  wire  _io_o_decode_packs_1_src1_valid_T_2 = io_o_decode_packs_1_op1_sel == 3'h2; // @[decoder.scala 113:38]
  wire  _io_o_decode_packs_1_src1_valid_T_3 = io_o_decode_packs_1_op1_sel == 3'h1; // @[decoder.scala 114:38]
  wire  _io_o_decode_packs_1_src1_valid_T_4 = io_o_decode_packs_1_op1_sel == 3'h4; // @[decoder.scala 115:38]
  wire  _io_o_decode_packs_1_src2_valid_T = io_o_decode_packs_1_op2_sel == 3'h0; // @[decoder.scala 118:39]
  wire  _io_o_decode_packs_1_src2_valid_T_1 = io_o_decode_packs_1_op2_sel == 3'h3; // @[decoder.scala 119:39]
  wire  _io_o_decode_packs_1_src2_valid_T_2 = io_o_decode_packs_1_op2_sel == 3'h2; // @[decoder.scala 120:39]
  wire  _io_o_decode_packs_1_src2_valid_T_3 = io_o_decode_packs_1_op2_sel == 3'h1; // @[decoder.scala 121:39]
  wire  _io_o_decode_packs_1_src2_valid_T_4 = io_o_decode_packs_1_op2_sel == 3'h4; // @[decoder.scala 122:39]
  wire [63:0] _io_o_decode_packs_1_src1_value_T_4 = _io_o_decode_packs_1_src1_valid_T_2 ? {{32'd0},
    io_o_decode_packs_1_pc} : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_decode_packs_1_src2_value_T_4 = _io_o_decode_packs_1_src2_valid_T_2 ? {{32'd0},
    io_o_decode_packs_1_pc} : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _GEN_148 = reset ? 64'h0 : _GEN_63; // @[decoder.scala 46:{23,23}]
  wire [63:0] _GEN_149 = reset ? 64'h0 : _GEN_71; // @[decoder.scala 46:{23,23}]
  assign io_i_fetch_pack_ready = ~io_i_stall & ~io_i_exception & ~(io_i_branch_resolve_pack_valid &
    io_i_branch_resolve_pack_mispred); // @[decoder.scala 44:60]
  assign io_o_decode_packs_0_valid = inst_valid_0_orMatrixOutputs & uops_0_valid & _io_i_fetch_pack_ready_T &
    _io_i_fetch_pack_ready_T_1 & _io_i_fetch_pack_ready_T_4; // @[decoder.scala 93:104]
  assign io_o_decode_packs_0_pc = uops_0_pc; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_inst = uops_0_inst; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_func_code = {io_o_decode_packs_0_func_code_invMatrixOutputs_hi,
    io_o_decode_packs_0_func_code_invMatrixOutputs_lo}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_0_branch_predict_pack_valid = uops_0_branch_predict_pack_valid; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_branch_predict_pack_target = uops_0_branch_predict_pack_target; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_branch_predict_pack_branch_type = uops_0_branch_predict_pack_branch_type; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_branch_predict_pack_select = uops_0_branch_predict_pack_select; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_branch_predict_pack_taken = uops_0_branch_predict_pack_taken; // @[decoder.scala 68:22]
  assign io_o_decode_packs_0_arch_dst = io_o_decode_packs_0_regWen ? insts_0[11:7] : 5'h0; // @[decoder.scala 104:41]
  assign io_o_decode_packs_0_inst_type = io_o_decode_packs_0_inst_type_invMatrixOutputs[2:0]; // @[decoder.scala 76:18]
  assign io_o_decode_packs_0_regWen = |_io_o_decode_packs_0_regWen_orMatrixOutputs_T; // @[pla.scala 114:39]
  assign io_o_decode_packs_0_src1_valid = _io_o_decode_packs_0_src1_valid_T ? 1'h0 : _io_o_decode_packs_0_src1_valid_T_1
     | (_io_o_decode_packs_0_src1_valid_T_2 | (_io_o_decode_packs_0_src1_valid_T_3 | _io_o_decode_packs_0_src1_valid_T_4
    )); // @[Mux.scala 101:16]
  assign io_o_decode_packs_0_arch_rs1 = insts_0[19:15]; // @[decoder.scala 102:46]
  assign io_o_decode_packs_0_src2_valid = _io_o_decode_packs_0_src2_valid_T ? 1'h0 : _io_o_decode_packs_0_src2_valid_T_1
     | (_io_o_decode_packs_0_src2_valid_T_2 | (_io_o_decode_packs_0_src2_valid_T_3 | _io_o_decode_packs_0_src2_valid_T_4
    )); // @[Mux.scala 101:16]
  assign io_o_decode_packs_0_arch_rs2 = insts_0[24:20]; // @[decoder.scala 103:46]
  assign io_o_decode_packs_0_imm = _io_o_decode_packs_0_imm_T ? immI_0 : _io_o_decode_packs_0_imm_T_10; // @[Mux.scala 101:16]
  assign io_o_decode_packs_0_src1_value = _io_o_decode_packs_0_src1_valid_T_1 ? io_o_decode_packs_0_imm :
    _io_o_decode_packs_0_src1_value_T_4; // @[Mux.scala 101:16]
  assign io_o_decode_packs_0_src2_value = _io_o_decode_packs_0_src2_valid_T_1 ? io_o_decode_packs_0_imm :
    _io_o_decode_packs_0_src2_value_T_4; // @[Mux.scala 101:16]
  assign io_o_decode_packs_0_op1_sel = {io_o_decode_packs_0_op1_sel_invMatrixOutputs_hi,
    io_o_decode_packs_0_op1_sel_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_0_op2_sel = {io_o_decode_packs_0_op2_sel_invMatrixOutputs_hi,
    io_o_decode_packs_0_op2_sel_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_0_alu_sel = {io_o_decode_packs_0_alu_sel_invMatrixOutputs_hi,
    io_o_decode_packs_0_alu_sel_invMatrixOutputs_lo}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_0_branch_type = {io_o_decode_packs_0_branch_type_invMatrixOutputs_hi,
    io_o_decode_packs_0_branch_type_invMatrixOutputs_lo}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_0_mem_type = {io_o_decode_packs_0_mem_type_orMatrixOutputs[1],
    io_o_decode_packs_0_mem_type_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_1_valid = inst_valid_1_orMatrixOutputs & uops_1_valid & _io_i_fetch_pack_ready_T &
    _io_i_fetch_pack_ready_T_1 & _io_i_fetch_pack_ready_T_4; // @[decoder.scala 93:104]
  assign io_o_decode_packs_1_pc = uops_1_pc; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_inst = uops_1_inst; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_func_code = {io_o_decode_packs_1_func_code_invMatrixOutputs_hi,
    io_o_decode_packs_1_func_code_invMatrixOutputs_lo}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_1_branch_predict_pack_valid = uops_1_branch_predict_pack_valid; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_branch_predict_pack_target = uops_1_branch_predict_pack_target; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_branch_predict_pack_branch_type = uops_1_branch_predict_pack_branch_type; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_branch_predict_pack_select = uops_1_branch_predict_pack_select; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_branch_predict_pack_taken = uops_1_branch_predict_pack_taken; // @[decoder.scala 68:22]
  assign io_o_decode_packs_1_arch_dst = io_o_decode_packs_1_regWen ? insts_1[11:7] : 5'h0; // @[decoder.scala 104:41]
  assign io_o_decode_packs_1_inst_type = io_o_decode_packs_1_inst_type_invMatrixOutputs[2:0]; // @[decoder.scala 77:18]
  assign io_o_decode_packs_1_regWen = |_io_o_decode_packs_1_regWen_orMatrixOutputs_T; // @[pla.scala 114:39]
  assign io_o_decode_packs_1_src1_valid = _io_o_decode_packs_1_src1_valid_T ? 1'h0 : _io_o_decode_packs_1_src1_valid_T_1
     | (_io_o_decode_packs_1_src1_valid_T_2 | (_io_o_decode_packs_1_src1_valid_T_3 | _io_o_decode_packs_1_src1_valid_T_4
    )); // @[Mux.scala 101:16]
  assign io_o_decode_packs_1_arch_rs1 = insts_1[19:15]; // @[decoder.scala 102:46]
  assign io_o_decode_packs_1_src2_valid = _io_o_decode_packs_1_src2_valid_T ? 1'h0 : _io_o_decode_packs_1_src2_valid_T_1
     | (_io_o_decode_packs_1_src2_valid_T_2 | (_io_o_decode_packs_1_src2_valid_T_3 | _io_o_decode_packs_1_src2_valid_T_4
    )); // @[Mux.scala 101:16]
  assign io_o_decode_packs_1_arch_rs2 = insts_1[24:20]; // @[decoder.scala 103:46]
  assign io_o_decode_packs_1_imm = _io_o_decode_packs_1_imm_T ? immI_1 : _io_o_decode_packs_1_imm_T_10; // @[Mux.scala 101:16]
  assign io_o_decode_packs_1_src1_value = _io_o_decode_packs_1_src1_valid_T_1 ? io_o_decode_packs_1_imm :
    _io_o_decode_packs_1_src1_value_T_4; // @[Mux.scala 101:16]
  assign io_o_decode_packs_1_src2_value = _io_o_decode_packs_1_src2_valid_T_1 ? io_o_decode_packs_1_imm :
    _io_o_decode_packs_1_src2_value_T_4; // @[Mux.scala 101:16]
  assign io_o_decode_packs_1_op1_sel = {io_o_decode_packs_1_op1_sel_invMatrixOutputs_hi,
    io_o_decode_packs_1_op1_sel_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_1_op2_sel = {io_o_decode_packs_1_op2_sel_invMatrixOutputs_hi,
    io_o_decode_packs_1_op2_sel_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_1_alu_sel = {io_o_decode_packs_1_alu_sel_invMatrixOutputs_hi,
    io_o_decode_packs_1_alu_sel_invMatrixOutputs_lo}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_1_branch_type = {io_o_decode_packs_1_branch_type_invMatrixOutputs_hi,
    io_o_decode_packs_1_branch_type_invMatrixOutputs_lo}; // @[Cat.scala 33:92]
  assign io_o_decode_packs_1_mem_type = {io_o_decode_packs_1_mem_type_orMatrixOutputs[1],
    io_o_decode_packs_1_mem_type_orMatrixOutputs[0]}; // @[Cat.scala 33:92]
  always @(posedge clock) begin
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_valid <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_valid <= io_i_fetch_pack_bits_valids_0; // @[decoder.scala 51:22]
    end else begin
      uops_0_valid <= _GEN_0;
    end
    uops_0_pc <= _GEN_148[31:0]; // @[decoder.scala 46:{23,23}]
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_inst <= 32'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_inst <= io_i_fetch_pack_bits_insts_0; // @[decoder.scala 53:20]
    end else if (!(io_i_stall & _io_i_fetch_pack_ready_T_1)) begin // @[decoder.scala 56:46]
      uops_0_inst <= 32'h0; // @[decoder.scala 64:20]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_branch_predict_pack_valid <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_branch_predict_pack_valid <= io_i_fetch_pack_bits_branch_predict_pack_valid; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_branch_predict_pack_target <= 64'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_branch_predict_pack_target <= io_i_fetch_pack_bits_branch_predict_pack_target; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_branch_predict_pack_branch_type <= 4'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_branch_predict_pack_branch_type <= io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_branch_predict_pack_select <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_branch_predict_pack_select <= io_i_fetch_pack_bits_branch_predict_pack_select; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_0_branch_predict_pack_taken <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_0_branch_predict_pack_taken <= io_i_fetch_pack_bits_branch_predict_pack_taken; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_valid <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_valid <= io_i_fetch_pack_bits_valids_1; // @[decoder.scala 51:22]
    end else begin
      uops_1_valid <= _GEN_31;
    end
    uops_1_pc <= _GEN_149[31:0]; // @[decoder.scala 46:{23,23}]
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_inst <= 32'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_inst <= io_i_fetch_pack_bits_insts_1; // @[decoder.scala 53:20]
    end else if (!(io_i_stall & _io_i_fetch_pack_ready_T_1)) begin // @[decoder.scala 56:46]
      uops_1_inst <= 32'h0; // @[decoder.scala 64:20]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_branch_predict_pack_valid <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_branch_predict_pack_valid <= io_i_fetch_pack_bits_branch_predict_pack_valid; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_branch_predict_pack_target <= 64'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_branch_predict_pack_target <= io_i_fetch_pack_bits_branch_predict_pack_target; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_branch_predict_pack_branch_type <= 4'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_branch_predict_pack_branch_type <= io_i_fetch_pack_bits_branch_predict_pack_branch_type; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_branch_predict_pack_select <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_branch_predict_pack_select <= io_i_fetch_pack_bits_branch_predict_pack_select; // @[decoder.scala 54:36]
    end
    if (reset) begin // @[decoder.scala 46:23]
      uops_1_branch_predict_pack_taken <= 1'h0; // @[decoder.scala 46:23]
    end else if (io_i_fetch_pack_valid & _io_i_fetch_pack_ready_T & _io_i_fetch_pack_ready_T_4 &
      _io_i_fetch_pack_ready_T_1) begin // @[decoder.scala 49:143]
      uops_1_branch_predict_pack_taken <= io_i_fetch_pack_bits_branch_predict_pack_taken; // @[decoder.scala 54:36]
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
  uops_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  uops_0_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  uops_0_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  uops_0_branch_predict_pack_valid = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  uops_0_branch_predict_pack_target = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  uops_0_branch_predict_pack_branch_type = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  uops_0_branch_predict_pack_select = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  uops_0_branch_predict_pack_taken = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  uops_1_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  uops_1_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  uops_1_inst = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  uops_1_branch_predict_pack_valid = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  uops_1_branch_predict_pack_target = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  uops_1_branch_predict_pack_branch_type = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  uops_1_branch_predict_pack_select = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uops_1_branch_predict_pack_taken = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
