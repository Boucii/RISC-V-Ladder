module BPU(
  input         clock,
  input         reset,
  input  [63:0] io_i_addr,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_taken,
  input  [63:0] io_i_branch_resolve_pack_pc,
  input  [63:0] io_i_branch_resolve_pack_target,
  input         io_i_branch_resolve_pack_prediction_valid,
  input  [2:0]  io_i_branch_resolve_pack_branch_type,
  input         io_i_branch_presolve_pack_valid,
  input  [63:0] io_i_branch_presolve_pack_pc,
  output        io_o_branch_predict_pack_valid,
  output [63:0] io_o_branch_predict_pack_target,
  output [3:0]  io_o_branch_predict_pack_branch_type,
  output        io_o_branch_predict_pack_select,
  output        io_o_branch_predict_pack_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
`endif // RANDOMIZE_REG_INIT
  reg  btb_0_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_0_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_0_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_0_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_0_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_0_bht; // @[branch_predictor.scala 33:22]
  reg  btb_1_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_1_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_1_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_1_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_1_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_1_bht; // @[branch_predictor.scala 33:22]
  reg  btb_2_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_2_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_2_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_2_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_2_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_2_bht; // @[branch_predictor.scala 33:22]
  reg  btb_3_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_3_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_3_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_3_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_3_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_3_bht; // @[branch_predictor.scala 33:22]
  reg  btb_4_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_4_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_4_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_4_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_4_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_4_bht; // @[branch_predictor.scala 33:22]
  reg  btb_5_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_5_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_5_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_5_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_5_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_5_bht; // @[branch_predictor.scala 33:22]
  reg  btb_6_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_6_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_6_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_6_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_6_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_6_bht; // @[branch_predictor.scala 33:22]
  reg  btb_7_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_7_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_7_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_7_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_7_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_7_bht; // @[branch_predictor.scala 33:22]
  reg  btb_8_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_8_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_8_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_8_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_8_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_8_bht; // @[branch_predictor.scala 33:22]
  reg  btb_9_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_9_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_9_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_9_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_9_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_9_bht; // @[branch_predictor.scala 33:22]
  reg  btb_10_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_10_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_10_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_10_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_10_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_10_bht; // @[branch_predictor.scala 33:22]
  reg  btb_11_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_11_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_11_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_11_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_11_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_11_bht; // @[branch_predictor.scala 33:22]
  reg  btb_12_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_12_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_12_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_12_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_12_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_12_bht; // @[branch_predictor.scala 33:22]
  reg  btb_13_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_13_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_13_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_13_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_13_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_13_bht; // @[branch_predictor.scala 33:22]
  reg  btb_14_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_14_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_14_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_14_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_14_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_14_bht; // @[branch_predictor.scala 33:22]
  reg  btb_15_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_15_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_15_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_15_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_15_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_15_bht; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_victim_ptr; // @[branch_predictor.scala 35:33]
  wire  _GEN_0 = btb_0_tag == io_i_addr[12:3] & btb_0_valid; // @[branch_predictor.scala 37:36 43:45 44:44]
  wire [63:0] _GEN_1 = btb_0_tag == io_i_addr[12:3] ? btb_0_target_address : 64'h0; // @[branch_predictor.scala 38:37 43:45 45:45]
  wire [3:0] _GEN_2 = btb_0_tag == io_i_addr[12:3] ? btb_0_branch_type : 4'h0; // @[branch_predictor.scala 39:42 43:45 46:50]
  wire  _GEN_3 = btb_0_tag == io_i_addr[12:3] & btb_0_select; // @[branch_predictor.scala 40:37 43:45 47:45]
  wire  _GEN_4 = btb_0_tag == io_i_addr[12:3] & ~btb_0_bht[1]; // @[branch_predictor.scala 41:36 43:45 48:44]
  wire  _GEN_5 = btb_1_tag == io_i_addr[12:3] ? btb_1_valid : _GEN_0; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_6 = btb_1_tag == io_i_addr[12:3] ? btb_1_target_address : _GEN_1; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_7 = btb_1_tag == io_i_addr[12:3] ? btb_1_branch_type : _GEN_2; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_8 = btb_1_tag == io_i_addr[12:3] ? btb_1_select : _GEN_3; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_9 = btb_1_tag == io_i_addr[12:3] ? ~btb_1_bht[1] : _GEN_4; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_10 = btb_2_tag == io_i_addr[12:3] ? btb_2_valid : _GEN_5; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_11 = btb_2_tag == io_i_addr[12:3] ? btb_2_target_address : _GEN_6; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_12 = btb_2_tag == io_i_addr[12:3] ? btb_2_branch_type : _GEN_7; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_13 = btb_2_tag == io_i_addr[12:3] ? btb_2_select : _GEN_8; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_14 = btb_2_tag == io_i_addr[12:3] ? ~btb_2_bht[1] : _GEN_9; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_15 = btb_3_tag == io_i_addr[12:3] ? btb_3_valid : _GEN_10; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_16 = btb_3_tag == io_i_addr[12:3] ? btb_3_target_address : _GEN_11; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_17 = btb_3_tag == io_i_addr[12:3] ? btb_3_branch_type : _GEN_12; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_18 = btb_3_tag == io_i_addr[12:3] ? btb_3_select : _GEN_13; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_19 = btb_3_tag == io_i_addr[12:3] ? ~btb_3_bht[1] : _GEN_14; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_20 = btb_4_tag == io_i_addr[12:3] ? btb_4_valid : _GEN_15; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_21 = btb_4_tag == io_i_addr[12:3] ? btb_4_target_address : _GEN_16; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_22 = btb_4_tag == io_i_addr[12:3] ? btb_4_branch_type : _GEN_17; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_23 = btb_4_tag == io_i_addr[12:3] ? btb_4_select : _GEN_18; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_24 = btb_4_tag == io_i_addr[12:3] ? ~btb_4_bht[1] : _GEN_19; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_25 = btb_5_tag == io_i_addr[12:3] ? btb_5_valid : _GEN_20; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_26 = btb_5_tag == io_i_addr[12:3] ? btb_5_target_address : _GEN_21; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_27 = btb_5_tag == io_i_addr[12:3] ? btb_5_branch_type : _GEN_22; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_28 = btb_5_tag == io_i_addr[12:3] ? btb_5_select : _GEN_23; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_29 = btb_5_tag == io_i_addr[12:3] ? ~btb_5_bht[1] : _GEN_24; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_30 = btb_6_tag == io_i_addr[12:3] ? btb_6_valid : _GEN_25; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_31 = btb_6_tag == io_i_addr[12:3] ? btb_6_target_address : _GEN_26; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_32 = btb_6_tag == io_i_addr[12:3] ? btb_6_branch_type : _GEN_27; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_33 = btb_6_tag == io_i_addr[12:3] ? btb_6_select : _GEN_28; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_34 = btb_6_tag == io_i_addr[12:3] ? ~btb_6_bht[1] : _GEN_29; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_35 = btb_7_tag == io_i_addr[12:3] ? btb_7_valid : _GEN_30; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_36 = btb_7_tag == io_i_addr[12:3] ? btb_7_target_address : _GEN_31; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_37 = btb_7_tag == io_i_addr[12:3] ? btb_7_branch_type : _GEN_32; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_38 = btb_7_tag == io_i_addr[12:3] ? btb_7_select : _GEN_33; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_39 = btb_7_tag == io_i_addr[12:3] ? ~btb_7_bht[1] : _GEN_34; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_40 = btb_8_tag == io_i_addr[12:3] ? btb_8_valid : _GEN_35; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_41 = btb_8_tag == io_i_addr[12:3] ? btb_8_target_address : _GEN_36; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_42 = btb_8_tag == io_i_addr[12:3] ? btb_8_branch_type : _GEN_37; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_43 = btb_8_tag == io_i_addr[12:3] ? btb_8_select : _GEN_38; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_44 = btb_8_tag == io_i_addr[12:3] ? ~btb_8_bht[1] : _GEN_39; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_45 = btb_9_tag == io_i_addr[12:3] ? btb_9_valid : _GEN_40; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_46 = btb_9_tag == io_i_addr[12:3] ? btb_9_target_address : _GEN_41; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_47 = btb_9_tag == io_i_addr[12:3] ? btb_9_branch_type : _GEN_42; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_48 = btb_9_tag == io_i_addr[12:3] ? btb_9_select : _GEN_43; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_49 = btb_9_tag == io_i_addr[12:3] ? ~btb_9_bht[1] : _GEN_44; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_50 = btb_10_tag == io_i_addr[12:3] ? btb_10_valid : _GEN_45; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_51 = btb_10_tag == io_i_addr[12:3] ? btb_10_target_address : _GEN_46; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_52 = btb_10_tag == io_i_addr[12:3] ? btb_10_branch_type : _GEN_47; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_53 = btb_10_tag == io_i_addr[12:3] ? btb_10_select : _GEN_48; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_54 = btb_10_tag == io_i_addr[12:3] ? ~btb_10_bht[1] : _GEN_49; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_55 = btb_11_tag == io_i_addr[12:3] ? btb_11_valid : _GEN_50; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_56 = btb_11_tag == io_i_addr[12:3] ? btb_11_target_address : _GEN_51; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_57 = btb_11_tag == io_i_addr[12:3] ? btb_11_branch_type : _GEN_52; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_58 = btb_11_tag == io_i_addr[12:3] ? btb_11_select : _GEN_53; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_59 = btb_11_tag == io_i_addr[12:3] ? ~btb_11_bht[1] : _GEN_54; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_60 = btb_12_tag == io_i_addr[12:3] ? btb_12_valid : _GEN_55; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_61 = btb_12_tag == io_i_addr[12:3] ? btb_12_target_address : _GEN_56; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_62 = btb_12_tag == io_i_addr[12:3] ? btb_12_branch_type : _GEN_57; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_63 = btb_12_tag == io_i_addr[12:3] ? btb_12_select : _GEN_58; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_64 = btb_12_tag == io_i_addr[12:3] ? ~btb_12_bht[1] : _GEN_59; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_65 = btb_13_tag == io_i_addr[12:3] ? btb_13_valid : _GEN_60; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_66 = btb_13_tag == io_i_addr[12:3] ? btb_13_target_address : _GEN_61; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_67 = btb_13_tag == io_i_addr[12:3] ? btb_13_branch_type : _GEN_62; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_68 = btb_13_tag == io_i_addr[12:3] ? btb_13_select : _GEN_63; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_69 = btb_13_tag == io_i_addr[12:3] ? ~btb_13_bht[1] : _GEN_64; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_70 = btb_14_tag == io_i_addr[12:3] ? btb_14_valid : _GEN_65; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_71 = btb_14_tag == io_i_addr[12:3] ? btb_14_target_address : _GEN_66; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_72 = btb_14_tag == io_i_addr[12:3] ? btb_14_branch_type : _GEN_67; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_73 = btb_14_tag == io_i_addr[12:3] ? btb_14_select : _GEN_68; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_74 = btb_14_tag == io_i_addr[12:3] ? ~btb_14_bht[1] : _GEN_69; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_659 = 4'h0 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_80 = 4'h0 == btb_victim_ptr | btb_0_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_660 = 4'h1 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_81 = 4'h1 == btb_victim_ptr | btb_1_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_661 = 4'h2 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_82 = 4'h2 == btb_victim_ptr | btb_2_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_662 = 4'h3 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_83 = 4'h3 == btb_victim_ptr | btb_3_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_663 = 4'h4 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_84 = 4'h4 == btb_victim_ptr | btb_4_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_664 = 4'h5 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_85 = 4'h5 == btb_victim_ptr | btb_5_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_665 = 4'h6 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_86 = 4'h6 == btb_victim_ptr | btb_6_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_666 = 4'h7 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_87 = 4'h7 == btb_victim_ptr | btb_7_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_667 = 4'h8 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_88 = 4'h8 == btb_victim_ptr | btb_8_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_668 = 4'h9 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_89 = 4'h9 == btb_victim_ptr | btb_9_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_669 = 4'ha == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_90 = 4'ha == btb_victim_ptr | btb_10_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_670 = 4'hb == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_91 = 4'hb == btb_victim_ptr | btb_11_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_671 = 4'hc == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_92 = 4'hc == btb_victim_ptr | btb_12_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_672 = 4'hd == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_93 = 4'hd == btb_victim_ptr | btb_13_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_673 = 4'he == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_94 = 4'he == btb_victim_ptr | btb_14_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_674 = 4'hf == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_95 = 4'hf == btb_victim_ptr | btb_15_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire [9:0] _GEN_96 = 4'h0 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_0_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_97 = 4'h1 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_1_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_98 = 4'h2 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_2_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_99 = 4'h3 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_3_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_100 = 4'h4 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_4_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_101 = 4'h5 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_5_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_102 = 4'h6 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_6_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_103 = 4'h7 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_7_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_104 = 4'h8 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_8_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_105 = 4'h9 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_9_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_106 = 4'ha == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_10_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_107 = 4'hb == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_11_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_108 = 4'hc == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_12_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_109 = 4'hd == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_13_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_110 = 4'he == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_14_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_111 = 4'hf == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_15_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [63:0] _GEN_112 = 4'h0 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_0_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_113 = 4'h1 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_1_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_114 = 4'h2 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_2_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_115 = 4'h3 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_3_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_116 = 4'h4 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_4_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_117 = 4'h5 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_5_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_118 = 4'h6 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_6_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_119 = 4'h7 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_7_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_120 = 4'h8 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_8_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_121 = 4'h9 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_9_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_122 = 4'ha == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_10_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_123 = 4'hb == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_11_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_124 = 4'hc == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_12_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_125 = 4'hd == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_13_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_126 = 4'he == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_14_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_127 = 4'hf == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_15_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [3:0] _btb_btb_victim_ptr_branch_type = {{1'd0}, io_i_branch_resolve_pack_branch_type}; // @[branch_predictor.scala 69:{41,41}]
  wire [3:0] _GEN_128 = 4'h0 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_0_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_129 = 4'h1 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_1_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_130 = 4'h2 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_2_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_131 = 4'h3 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_3_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_132 = 4'h4 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_4_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_133 = 4'h5 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_5_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_134 = 4'h6 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_6_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_135 = 4'h7 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_7_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_136 = 4'h8 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_8_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_137 = 4'h9 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_9_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_138 = 4'ha == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_10_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_139 = 4'hb == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_11_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_140 = 4'hc == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_12_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_141 = 4'hd == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_13_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_142 = 4'he == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_14_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_143 = 4'hf == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_15_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire  _GEN_144 = 4'h0 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_0_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_145 = 4'h1 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_1_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_146 = 4'h2 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_2_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_147 = 4'h3 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_3_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_148 = 4'h4 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_4_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_149 = 4'h5 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_5_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_150 = 4'h6 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_6_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_151 = 4'h7 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_7_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_152 = 4'h8 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_8_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_153 = 4'h9 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_9_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_154 = 4'ha == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_10_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_155 = 4'hb == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_11_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_156 = 4'hc == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_12_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_157 = 4'hd == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_13_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_158 = 4'he == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_14_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_159 = 4'hf == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_15_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire [1:0] _btb_bht_T = io_i_branch_resolve_pack_taken ? 2'h1 : 2'h0; // @[branch_predictor.scala 71:39]
  wire [1:0] _GEN_160 = 4'h0 == btb_victim_ptr ? _btb_bht_T : btb_0_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_161 = 4'h1 == btb_victim_ptr ? _btb_bht_T : btb_1_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_162 = 4'h2 == btb_victim_ptr ? _btb_bht_T : btb_2_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_163 = 4'h3 == btb_victim_ptr ? _btb_bht_T : btb_3_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_164 = 4'h4 == btb_victim_ptr ? _btb_bht_T : btb_4_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_165 = 4'h5 == btb_victim_ptr ? _btb_bht_T : btb_5_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_166 = 4'h6 == btb_victim_ptr ? _btb_bht_T : btb_6_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_167 = 4'h7 == btb_victim_ptr ? _btb_bht_T : btb_7_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_168 = 4'h8 == btb_victim_ptr ? _btb_bht_T : btb_8_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_169 = 4'h9 == btb_victim_ptr ? _btb_bht_T : btb_9_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_170 = 4'ha == btb_victim_ptr ? _btb_bht_T : btb_10_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_171 = 4'hb == btb_victim_ptr ? _btb_bht_T : btb_11_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_172 = 4'hc == btb_victim_ptr ? _btb_bht_T : btb_12_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_173 = 4'hd == btb_victim_ptr ? _btb_bht_T : btb_13_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_174 = 4'he == btb_victim_ptr ? _btb_bht_T : btb_14_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_175 = 4'hf == btb_victim_ptr ? _btb_bht_T : btb_15_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [3:0] _btb_victim_ptr_T_1 = btb_victim_ptr + 4'h1; // @[branch_predictor.scala 74:42]
  wire  _GEN_176 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_80 : btb_0_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_177 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_81 : btb_1_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_178 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_82 : btb_2_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_179 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_83 : btb_3_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_180 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_84 : btb_4_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_181 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_85 : btb_5_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_182 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_86 : btb_6_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_183 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_87 : btb_7_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_184 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_88 : btb_8_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_185 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_89 : btb_9_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_186 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_90 : btb_10_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_187 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_91 : btb_11_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_188 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_92 : btb_12_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_189 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_93 : btb_13_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_190 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_94 : btb_14_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_191 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_95 : btb_15_valid; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_192 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_96 : btb_0_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_193 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_97 : btb_1_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_194 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_98 : btb_2_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_195 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_99 : btb_3_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_196 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_100 : btb_4_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_197 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_101 : btb_5_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_198 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_102 : btb_6_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_199 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_103 : btb_7_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_200 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_104 : btb_8_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_201 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_105 : btb_9_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_202 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_106 : btb_10_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_203 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_107 : btb_11_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_204 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_108 : btb_12_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_205 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_109 : btb_13_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_206 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_110 : btb_14_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_207 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_111 : btb_15_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_208 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_112 : btb_0_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_209 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_113 : btb_1_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_210 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_114 : btb_2_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_211 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_115 : btb_3_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_212 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_116 : btb_4_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_213 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_117 : btb_5_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_214 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_118 : btb_6_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_215 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_119 : btb_7_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_216 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_120 : btb_8_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_217 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_121 : btb_9_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_218 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_122 : btb_10_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_219 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_123 : btb_11_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_220 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_124 : btb_12_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_221 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_125 : btb_13_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_222 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_126 : btb_14_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_223 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_127 : btb_15_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_224 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_128 : btb_0_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_225 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_129 : btb_1_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_226 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_130 : btb_2_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_227 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_131 : btb_3_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_228 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_132 : btb_4_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_229 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_133 : btb_5_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_230 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_134 : btb_6_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_231 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_135 : btb_7_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_232 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_136 : btb_8_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_233 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_137 : btb_9_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_234 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_138 : btb_10_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_235 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_139 : btb_11_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_236 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_140 : btb_12_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_237 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_141 : btb_13_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_238 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_142 : btb_14_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_239 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_143 : btb_15_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_240 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_144 : btb_0_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_241 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_145 : btb_1_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_242 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_146 : btb_2_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_243 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_147 : btb_3_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_244 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_148 : btb_4_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_245 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_149 : btb_5_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_246 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_150 : btb_6_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_247 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_151 : btb_7_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_248 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_152 : btb_8_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_249 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_153 : btb_9_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_250 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_154 : btb_10_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_251 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_155 : btb_11_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_252 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_156 : btb_12_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_253 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_157 : btb_13_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_254 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_158 : btb_14_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_255 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_159 : btb_15_select; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_256 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_160 : btb_0_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_257 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_161 : btb_1_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_258 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_162 : btb_2_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_259 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_163 : btb_3_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_260 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_164 : btb_4_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_261 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_165 : btb_5_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_262 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_166 : btb_6_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_263 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_167 : btb_7_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_264 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_168 : btb_8_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_265 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_169 : btb_9_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_266 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_170 : btb_10_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_267 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_171 : btb_11_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_268 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_172 : btb_12_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_269 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_173 : btb_13_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_270 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_174 : btb_14_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_271 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_175 : btb_15_bht; // @[branch_predictor.scala 65:121 33:22]
  wire  _T_35 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid; // @[branch_predictor.scala 87:42]
  wire  _T_40 = ~io_i_branch_resolve_pack_taken; // @[branch_predictor.scala 91:78]
  wire  _btb_0_bht_T = btb_0_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_0_bht_T_1 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_0_bht_T_2 = btb_0_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_0_bht_T_3 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_0_bht_T_4 = btb_0_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_0_bht_T_5 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_0_bht_T_6 = btb_0_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_0_bht_T_7 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_0_bht_T_10 = _T_40 & _btb_0_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_0_bht_T_13 = _T_40 & _btb_0_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_0_bht_T_16 = _T_40 & _btb_0_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_0_bht_T_19 = _T_40 & _btb_0_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_0_bht_T_20 = _btb_0_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_21 = _btb_0_bht_T_16 ? 2'h3 : _btb_0_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_22 = _btb_0_bht_T_13 ? 2'h0 : _btb_0_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_23 = _btb_0_bht_T_10 ? 2'h2 : _btb_0_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_24 = _btb_0_bht_T_7 ? 2'h2 : _btb_0_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_25 = _btb_0_bht_T_5 ? 2'h0 : _btb_0_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_26 = _btb_0_bht_T_3 ? 2'h1 : _btb_0_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_27 = _btb_0_bht_T_1 ? 2'h1 : _btb_0_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_273 = ~(btb_0_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_208; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_274 = ~(btb_0_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_240; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_275 = ~(btb_0_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_0_bht_T_27 : _GEN_256; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_277 = btb_0_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_273 : _GEN_208; // @[branch_predictor.scala 89:71]
  wire  _GEN_278 = btb_0_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_274 : _GEN_240; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_279 = btb_0_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_275 : _GEN_256; // @[branch_predictor.scala 89:71]
  wire  _btb_1_bht_T = btb_1_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_1_bht_T_1 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_1_bht_T_2 = btb_1_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_1_bht_T_3 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_1_bht_T_4 = btb_1_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_1_bht_T_5 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_1_bht_T_6 = btb_1_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_1_bht_T_7 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_1_bht_T_10 = _T_40 & _btb_1_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_1_bht_T_13 = _T_40 & _btb_1_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_1_bht_T_16 = _T_40 & _btb_1_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_1_bht_T_19 = _T_40 & _btb_1_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_1_bht_T_20 = _btb_1_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_21 = _btb_1_bht_T_16 ? 2'h3 : _btb_1_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_22 = _btb_1_bht_T_13 ? 2'h0 : _btb_1_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_23 = _btb_1_bht_T_10 ? 2'h2 : _btb_1_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_24 = _btb_1_bht_T_7 ? 2'h2 : _btb_1_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_25 = _btb_1_bht_T_5 ? 2'h0 : _btb_1_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_26 = _btb_1_bht_T_3 ? 2'h1 : _btb_1_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_27 = _btb_1_bht_T_1 ? 2'h1 : _btb_1_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_280 = ~(btb_1_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_209; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_281 = ~(btb_1_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_241; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_282 = ~(btb_1_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_1_bht_T_27 : _GEN_257; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_284 = btb_1_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_280 : _GEN_209; // @[branch_predictor.scala 89:71]
  wire  _GEN_285 = btb_1_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_281 : _GEN_241; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_286 = btb_1_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_282 : _GEN_257; // @[branch_predictor.scala 89:71]
  wire  _btb_2_bht_T = btb_2_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_2_bht_T_1 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_2_bht_T_2 = btb_2_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_2_bht_T_3 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_2_bht_T_4 = btb_2_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_2_bht_T_5 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_2_bht_T_6 = btb_2_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_2_bht_T_7 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_2_bht_T_10 = _T_40 & _btb_2_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_2_bht_T_13 = _T_40 & _btb_2_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_2_bht_T_16 = _T_40 & _btb_2_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_2_bht_T_19 = _T_40 & _btb_2_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_2_bht_T_20 = _btb_2_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_21 = _btb_2_bht_T_16 ? 2'h3 : _btb_2_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_22 = _btb_2_bht_T_13 ? 2'h0 : _btb_2_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_23 = _btb_2_bht_T_10 ? 2'h2 : _btb_2_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_24 = _btb_2_bht_T_7 ? 2'h2 : _btb_2_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_25 = _btb_2_bht_T_5 ? 2'h0 : _btb_2_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_26 = _btb_2_bht_T_3 ? 2'h1 : _btb_2_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_27 = _btb_2_bht_T_1 ? 2'h1 : _btb_2_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_287 = ~(btb_2_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_210; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_288 = ~(btb_2_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_242; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_289 = ~(btb_2_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_2_bht_T_27 : _GEN_258; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_291 = btb_2_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_287 : _GEN_210; // @[branch_predictor.scala 89:71]
  wire  _GEN_292 = btb_2_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_288 : _GEN_242; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_293 = btb_2_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_289 : _GEN_258; // @[branch_predictor.scala 89:71]
  wire  _btb_3_bht_T = btb_3_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_3_bht_T_1 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_3_bht_T_2 = btb_3_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_3_bht_T_3 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_3_bht_T_4 = btb_3_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_3_bht_T_5 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_3_bht_T_6 = btb_3_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_3_bht_T_7 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_3_bht_T_10 = _T_40 & _btb_3_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_3_bht_T_13 = _T_40 & _btb_3_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_3_bht_T_16 = _T_40 & _btb_3_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_3_bht_T_19 = _T_40 & _btb_3_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_3_bht_T_20 = _btb_3_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_21 = _btb_3_bht_T_16 ? 2'h3 : _btb_3_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_22 = _btb_3_bht_T_13 ? 2'h0 : _btb_3_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_23 = _btb_3_bht_T_10 ? 2'h2 : _btb_3_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_24 = _btb_3_bht_T_7 ? 2'h2 : _btb_3_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_25 = _btb_3_bht_T_5 ? 2'h0 : _btb_3_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_26 = _btb_3_bht_T_3 ? 2'h1 : _btb_3_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_27 = _btb_3_bht_T_1 ? 2'h1 : _btb_3_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_294 = ~(btb_3_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_211; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_295 = ~(btb_3_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_243; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_296 = ~(btb_3_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_3_bht_T_27 : _GEN_259; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_298 = btb_3_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_294 : _GEN_211; // @[branch_predictor.scala 89:71]
  wire  _GEN_299 = btb_3_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_295 : _GEN_243; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_300 = btb_3_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_296 : _GEN_259; // @[branch_predictor.scala 89:71]
  wire  _btb_4_bht_T = btb_4_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_4_bht_T_1 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_4_bht_T_2 = btb_4_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_4_bht_T_3 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_4_bht_T_4 = btb_4_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_4_bht_T_5 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_4_bht_T_6 = btb_4_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_4_bht_T_7 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_4_bht_T_10 = _T_40 & _btb_4_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_4_bht_T_13 = _T_40 & _btb_4_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_4_bht_T_16 = _T_40 & _btb_4_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_4_bht_T_19 = _T_40 & _btb_4_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_4_bht_T_20 = _btb_4_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_21 = _btb_4_bht_T_16 ? 2'h3 : _btb_4_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_22 = _btb_4_bht_T_13 ? 2'h0 : _btb_4_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_23 = _btb_4_bht_T_10 ? 2'h2 : _btb_4_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_24 = _btb_4_bht_T_7 ? 2'h2 : _btb_4_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_25 = _btb_4_bht_T_5 ? 2'h0 : _btb_4_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_26 = _btb_4_bht_T_3 ? 2'h1 : _btb_4_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_27 = _btb_4_bht_T_1 ? 2'h1 : _btb_4_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_301 = ~(btb_4_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_212; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_302 = ~(btb_4_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_244; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_303 = ~(btb_4_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_4_bht_T_27 : _GEN_260; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_305 = btb_4_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_301 : _GEN_212; // @[branch_predictor.scala 89:71]
  wire  _GEN_306 = btb_4_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_302 : _GEN_244; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_307 = btb_4_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_303 : _GEN_260; // @[branch_predictor.scala 89:71]
  wire  _btb_5_bht_T = btb_5_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_5_bht_T_1 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_5_bht_T_2 = btb_5_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_5_bht_T_3 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_5_bht_T_4 = btb_5_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_5_bht_T_5 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_5_bht_T_6 = btb_5_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_5_bht_T_7 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_5_bht_T_10 = _T_40 & _btb_5_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_5_bht_T_13 = _T_40 & _btb_5_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_5_bht_T_16 = _T_40 & _btb_5_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_5_bht_T_19 = _T_40 & _btb_5_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_5_bht_T_20 = _btb_5_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_21 = _btb_5_bht_T_16 ? 2'h3 : _btb_5_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_22 = _btb_5_bht_T_13 ? 2'h0 : _btb_5_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_23 = _btb_5_bht_T_10 ? 2'h2 : _btb_5_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_24 = _btb_5_bht_T_7 ? 2'h2 : _btb_5_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_25 = _btb_5_bht_T_5 ? 2'h0 : _btb_5_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_26 = _btb_5_bht_T_3 ? 2'h1 : _btb_5_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_27 = _btb_5_bht_T_1 ? 2'h1 : _btb_5_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_308 = ~(btb_5_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_213; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_309 = ~(btb_5_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_245; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_310 = ~(btb_5_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_5_bht_T_27 : _GEN_261; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_312 = btb_5_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_308 : _GEN_213; // @[branch_predictor.scala 89:71]
  wire  _GEN_313 = btb_5_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_309 : _GEN_245; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_314 = btb_5_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_310 : _GEN_261; // @[branch_predictor.scala 89:71]
  wire  _btb_6_bht_T = btb_6_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_6_bht_T_1 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_6_bht_T_2 = btb_6_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_6_bht_T_3 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_6_bht_T_4 = btb_6_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_6_bht_T_5 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_6_bht_T_6 = btb_6_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_6_bht_T_7 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_6_bht_T_10 = _T_40 & _btb_6_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_6_bht_T_13 = _T_40 & _btb_6_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_6_bht_T_16 = _T_40 & _btb_6_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_6_bht_T_19 = _T_40 & _btb_6_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_6_bht_T_20 = _btb_6_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_21 = _btb_6_bht_T_16 ? 2'h3 : _btb_6_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_22 = _btb_6_bht_T_13 ? 2'h0 : _btb_6_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_23 = _btb_6_bht_T_10 ? 2'h2 : _btb_6_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_24 = _btb_6_bht_T_7 ? 2'h2 : _btb_6_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_25 = _btb_6_bht_T_5 ? 2'h0 : _btb_6_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_26 = _btb_6_bht_T_3 ? 2'h1 : _btb_6_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_27 = _btb_6_bht_T_1 ? 2'h1 : _btb_6_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_315 = ~(btb_6_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_214; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_316 = ~(btb_6_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_246; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_317 = ~(btb_6_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_6_bht_T_27 : _GEN_262; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_319 = btb_6_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_315 : _GEN_214; // @[branch_predictor.scala 89:71]
  wire  _GEN_320 = btb_6_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_316 : _GEN_246; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_321 = btb_6_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_317 : _GEN_262; // @[branch_predictor.scala 89:71]
  wire  _btb_7_bht_T = btb_7_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_7_bht_T_1 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_7_bht_T_2 = btb_7_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_7_bht_T_3 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_7_bht_T_4 = btb_7_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_7_bht_T_5 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_7_bht_T_6 = btb_7_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_7_bht_T_7 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_7_bht_T_10 = _T_40 & _btb_7_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_7_bht_T_13 = _T_40 & _btb_7_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_7_bht_T_16 = _T_40 & _btb_7_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_7_bht_T_19 = _T_40 & _btb_7_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_7_bht_T_20 = _btb_7_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_21 = _btb_7_bht_T_16 ? 2'h3 : _btb_7_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_22 = _btb_7_bht_T_13 ? 2'h0 : _btb_7_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_23 = _btb_7_bht_T_10 ? 2'h2 : _btb_7_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_24 = _btb_7_bht_T_7 ? 2'h2 : _btb_7_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_25 = _btb_7_bht_T_5 ? 2'h0 : _btb_7_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_26 = _btb_7_bht_T_3 ? 2'h1 : _btb_7_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_27 = _btb_7_bht_T_1 ? 2'h1 : _btb_7_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_322 = ~(btb_7_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_215; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_323 = ~(btb_7_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_247; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_324 = ~(btb_7_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_7_bht_T_27 : _GEN_263; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_326 = btb_7_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_322 : _GEN_215; // @[branch_predictor.scala 89:71]
  wire  _GEN_327 = btb_7_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_323 : _GEN_247; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_328 = btb_7_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_324 : _GEN_263; // @[branch_predictor.scala 89:71]
  wire  _btb_8_bht_T = btb_8_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_8_bht_T_1 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_8_bht_T_2 = btb_8_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_8_bht_T_3 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_8_bht_T_4 = btb_8_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_8_bht_T_5 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_8_bht_T_6 = btb_8_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_8_bht_T_7 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_8_bht_T_10 = _T_40 & _btb_8_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_8_bht_T_13 = _T_40 & _btb_8_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_8_bht_T_16 = _T_40 & _btb_8_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_8_bht_T_19 = _T_40 & _btb_8_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_8_bht_T_20 = _btb_8_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_21 = _btb_8_bht_T_16 ? 2'h3 : _btb_8_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_22 = _btb_8_bht_T_13 ? 2'h0 : _btb_8_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_23 = _btb_8_bht_T_10 ? 2'h2 : _btb_8_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_24 = _btb_8_bht_T_7 ? 2'h2 : _btb_8_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_25 = _btb_8_bht_T_5 ? 2'h0 : _btb_8_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_26 = _btb_8_bht_T_3 ? 2'h1 : _btb_8_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_27 = _btb_8_bht_T_1 ? 2'h1 : _btb_8_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_329 = ~(btb_8_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_216; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_330 = ~(btb_8_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_248; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_331 = ~(btb_8_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_8_bht_T_27 : _GEN_264; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_333 = btb_8_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_329 : _GEN_216; // @[branch_predictor.scala 89:71]
  wire  _GEN_334 = btb_8_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_330 : _GEN_248; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_335 = btb_8_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_331 : _GEN_264; // @[branch_predictor.scala 89:71]
  wire  _btb_9_bht_T = btb_9_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_9_bht_T_1 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_9_bht_T_2 = btb_9_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_9_bht_T_3 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_9_bht_T_4 = btb_9_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_9_bht_T_5 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_9_bht_T_6 = btb_9_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_9_bht_T_7 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_9_bht_T_10 = _T_40 & _btb_9_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_9_bht_T_13 = _T_40 & _btb_9_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_9_bht_T_16 = _T_40 & _btb_9_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_9_bht_T_19 = _T_40 & _btb_9_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_9_bht_T_20 = _btb_9_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_21 = _btb_9_bht_T_16 ? 2'h3 : _btb_9_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_22 = _btb_9_bht_T_13 ? 2'h0 : _btb_9_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_23 = _btb_9_bht_T_10 ? 2'h2 : _btb_9_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_24 = _btb_9_bht_T_7 ? 2'h2 : _btb_9_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_25 = _btb_9_bht_T_5 ? 2'h0 : _btb_9_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_26 = _btb_9_bht_T_3 ? 2'h1 : _btb_9_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_27 = _btb_9_bht_T_1 ? 2'h1 : _btb_9_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_336 = ~(btb_9_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_217; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_337 = ~(btb_9_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_249; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_338 = ~(btb_9_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_9_bht_T_27 : _GEN_265; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_340 = btb_9_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_336 : _GEN_217; // @[branch_predictor.scala 89:71]
  wire  _GEN_341 = btb_9_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_337 : _GEN_249; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_342 = btb_9_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_338 : _GEN_265; // @[branch_predictor.scala 89:71]
  wire  _btb_10_bht_T = btb_10_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_10_bht_T_1 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_10_bht_T_2 = btb_10_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_10_bht_T_3 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_10_bht_T_4 = btb_10_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_10_bht_T_5 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_10_bht_T_6 = btb_10_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_10_bht_T_7 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_10_bht_T_10 = _T_40 & _btb_10_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_10_bht_T_13 = _T_40 & _btb_10_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_10_bht_T_16 = _T_40 & _btb_10_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_10_bht_T_19 = _T_40 & _btb_10_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_10_bht_T_20 = _btb_10_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_21 = _btb_10_bht_T_16 ? 2'h3 : _btb_10_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_22 = _btb_10_bht_T_13 ? 2'h0 : _btb_10_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_23 = _btb_10_bht_T_10 ? 2'h2 : _btb_10_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_24 = _btb_10_bht_T_7 ? 2'h2 : _btb_10_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_25 = _btb_10_bht_T_5 ? 2'h0 : _btb_10_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_26 = _btb_10_bht_T_3 ? 2'h1 : _btb_10_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_27 = _btb_10_bht_T_1 ? 2'h1 : _btb_10_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_343 = ~(btb_10_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_218; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_344 = ~(btb_10_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_250; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_345 = ~(btb_10_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_10_bht_T_27 : _GEN_266; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_347 = btb_10_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_343 : _GEN_218; // @[branch_predictor.scala 89:71]
  wire  _GEN_348 = btb_10_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_344 : _GEN_250; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_349 = btb_10_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_345 : _GEN_266; // @[branch_predictor.scala 89:71]
  wire  _btb_11_bht_T = btb_11_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_11_bht_T_1 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_11_bht_T_2 = btb_11_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_11_bht_T_3 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_11_bht_T_4 = btb_11_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_11_bht_T_5 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_11_bht_T_6 = btb_11_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_11_bht_T_7 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_11_bht_T_10 = _T_40 & _btb_11_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_11_bht_T_13 = _T_40 & _btb_11_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_11_bht_T_16 = _T_40 & _btb_11_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_11_bht_T_19 = _T_40 & _btb_11_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_11_bht_T_20 = _btb_11_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_21 = _btb_11_bht_T_16 ? 2'h3 : _btb_11_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_22 = _btb_11_bht_T_13 ? 2'h0 : _btb_11_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_23 = _btb_11_bht_T_10 ? 2'h2 : _btb_11_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_24 = _btb_11_bht_T_7 ? 2'h2 : _btb_11_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_25 = _btb_11_bht_T_5 ? 2'h0 : _btb_11_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_26 = _btb_11_bht_T_3 ? 2'h1 : _btb_11_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_27 = _btb_11_bht_T_1 ? 2'h1 : _btb_11_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_350 = ~(btb_11_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_219; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_351 = ~(btb_11_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_251; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_352 = ~(btb_11_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_11_bht_T_27 : _GEN_267; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_354 = btb_11_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_350 : _GEN_219; // @[branch_predictor.scala 89:71]
  wire  _GEN_355 = btb_11_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_351 : _GEN_251; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_356 = btb_11_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_352 : _GEN_267; // @[branch_predictor.scala 89:71]
  wire  _btb_12_bht_T = btb_12_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_12_bht_T_1 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_12_bht_T_2 = btb_12_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_12_bht_T_3 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_12_bht_T_4 = btb_12_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_12_bht_T_5 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_12_bht_T_6 = btb_12_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_12_bht_T_7 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_12_bht_T_10 = _T_40 & _btb_12_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_12_bht_T_13 = _T_40 & _btb_12_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_12_bht_T_16 = _T_40 & _btb_12_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_12_bht_T_19 = _T_40 & _btb_12_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_12_bht_T_20 = _btb_12_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_21 = _btb_12_bht_T_16 ? 2'h3 : _btb_12_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_22 = _btb_12_bht_T_13 ? 2'h0 : _btb_12_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_23 = _btb_12_bht_T_10 ? 2'h2 : _btb_12_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_24 = _btb_12_bht_T_7 ? 2'h2 : _btb_12_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_25 = _btb_12_bht_T_5 ? 2'h0 : _btb_12_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_26 = _btb_12_bht_T_3 ? 2'h1 : _btb_12_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_27 = _btb_12_bht_T_1 ? 2'h1 : _btb_12_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_357 = ~(btb_12_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_220; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_358 = ~(btb_12_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_252; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_359 = ~(btb_12_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_12_bht_T_27 : _GEN_268; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_361 = btb_12_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_357 : _GEN_220; // @[branch_predictor.scala 89:71]
  wire  _GEN_362 = btb_12_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_358 : _GEN_252; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_363 = btb_12_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_359 : _GEN_268; // @[branch_predictor.scala 89:71]
  wire  _btb_13_bht_T = btb_13_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_13_bht_T_1 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_13_bht_T_2 = btb_13_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_13_bht_T_3 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_13_bht_T_4 = btb_13_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_13_bht_T_5 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_13_bht_T_6 = btb_13_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_13_bht_T_7 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_13_bht_T_10 = _T_40 & _btb_13_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_13_bht_T_13 = _T_40 & _btb_13_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_13_bht_T_16 = _T_40 & _btb_13_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_13_bht_T_19 = _T_40 & _btb_13_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_13_bht_T_20 = _btb_13_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_21 = _btb_13_bht_T_16 ? 2'h3 : _btb_13_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_22 = _btb_13_bht_T_13 ? 2'h0 : _btb_13_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_23 = _btb_13_bht_T_10 ? 2'h2 : _btb_13_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_24 = _btb_13_bht_T_7 ? 2'h2 : _btb_13_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_25 = _btb_13_bht_T_5 ? 2'h0 : _btb_13_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_26 = _btb_13_bht_T_3 ? 2'h1 : _btb_13_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_27 = _btb_13_bht_T_1 ? 2'h1 : _btb_13_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_364 = ~(btb_13_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_221; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_365 = ~(btb_13_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_253; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_366 = ~(btb_13_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_13_bht_T_27 : _GEN_269; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_368 = btb_13_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_364 : _GEN_221; // @[branch_predictor.scala 89:71]
  wire  _GEN_369 = btb_13_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_365 : _GEN_253; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_370 = btb_13_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_366 : _GEN_269; // @[branch_predictor.scala 89:71]
  wire  _btb_14_bht_T = btb_14_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_14_bht_T_1 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_14_bht_T_2 = btb_14_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_14_bht_T_3 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_14_bht_T_4 = btb_14_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_14_bht_T_5 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_14_bht_T_6 = btb_14_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_14_bht_T_7 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_14_bht_T_10 = _T_40 & _btb_14_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_14_bht_T_13 = _T_40 & _btb_14_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_14_bht_T_16 = _T_40 & _btb_14_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_14_bht_T_19 = _T_40 & _btb_14_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_14_bht_T_20 = _btb_14_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_21 = _btb_14_bht_T_16 ? 2'h3 : _btb_14_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_22 = _btb_14_bht_T_13 ? 2'h0 : _btb_14_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_23 = _btb_14_bht_T_10 ? 2'h2 : _btb_14_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_24 = _btb_14_bht_T_7 ? 2'h2 : _btb_14_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_25 = _btb_14_bht_T_5 ? 2'h0 : _btb_14_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_26 = _btb_14_bht_T_3 ? 2'h1 : _btb_14_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_27 = _btb_14_bht_T_1 ? 2'h1 : _btb_14_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_371 = ~(btb_14_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_222; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_372 = ~(btb_14_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_254; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_373 = ~(btb_14_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_14_bht_T_27 : _GEN_270; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_374 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_13_tag == io_i_branch_resolve_pack_pc[12:3] |
    (btb_12_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_11_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_10_tag
     == io_i_branch_resolve_pack_pc[12:3] | (btb_9_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_8_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_7_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_6_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_5_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_4_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_3_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_2_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_1_tag == io_i_branch_resolve_pack_pc[12:3] | btb_0_tag ==
    io_i_branch_resolve_pack_pc[12:3]))))))))))))); // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_375 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_371 : _GEN_222; // @[branch_predictor.scala 89:71]
  wire  _GEN_376 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_372 : _GEN_254; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_377 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_373 : _GEN_270; // @[branch_predictor.scala 89:71]
  wire  _btb_15_bht_T = btb_15_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_15_bht_T_1 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_15_bht_T_2 = btb_15_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_15_bht_T_3 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_15_bht_T_4 = btb_15_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_15_bht_T_5 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_15_bht_T_6 = btb_15_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_15_bht_T_7 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_15_bht_T_10 = _T_40 & _btb_15_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_15_bht_T_13 = _T_40 & _btb_15_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_15_bht_T_16 = _T_40 & _btb_15_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_15_bht_T_19 = _T_40 & _btb_15_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_15_bht_T_20 = _btb_15_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_21 = _btb_15_bht_T_16 ? 2'h3 : _btb_15_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_22 = _btb_15_bht_T_13 ? 2'h0 : _btb_15_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_23 = _btb_15_bht_T_10 ? 2'h2 : _btb_15_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_24 = _btb_15_bht_T_7 ? 2'h2 : _btb_15_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_25 = _btb_15_bht_T_5 ? 2'h0 : _btb_15_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_26 = _btb_15_bht_T_3 ? 2'h1 : _btb_15_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_27 = _btb_15_bht_T_1 ? 2'h1 : _btb_15_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_378 = ~(btb_15_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_223; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_379 = ~(btb_15_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_255; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_380 = ~(btb_15_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_15_bht_T_27 : _GEN_271; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_381 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] | _GEN_374; // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_382 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_378 : _GEN_223; // @[branch_predictor.scala 89:71]
  wire  _GEN_383 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_379 : _GEN_255; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_384 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_380 : _GEN_271; // @[branch_predictor.scala 89:71]
  wire  entry_found = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid & _GEN_381; // @[branch_predictor.scala 86:17 87:87]
  wire [63:0] _GEN_386 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_277 :
    _GEN_208; // @[branch_predictor.scala 87:87]
  wire  _GEN_387 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_278 : _GEN_240; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_388 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_279 : _GEN_256
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_389 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_284 :
    _GEN_209; // @[branch_predictor.scala 87:87]
  wire  _GEN_390 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_285 : _GEN_241; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_391 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_286 : _GEN_257
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_392 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_291 :
    _GEN_210; // @[branch_predictor.scala 87:87]
  wire  _GEN_393 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_292 : _GEN_242; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_394 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_293 : _GEN_258
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_395 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_298 :
    _GEN_211; // @[branch_predictor.scala 87:87]
  wire  _GEN_396 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_299 : _GEN_243; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_397 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_300 : _GEN_259
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_398 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_305 :
    _GEN_212; // @[branch_predictor.scala 87:87]
  wire  _GEN_399 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_306 : _GEN_244; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_400 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_307 : _GEN_260
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_401 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_312 :
    _GEN_213; // @[branch_predictor.scala 87:87]
  wire  _GEN_402 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_313 : _GEN_245; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_403 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_314 : _GEN_261
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_404 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_319 :
    _GEN_214; // @[branch_predictor.scala 87:87]
  wire  _GEN_405 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_320 : _GEN_246; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_406 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_321 : _GEN_262
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_407 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_326 :
    _GEN_215; // @[branch_predictor.scala 87:87]
  wire  _GEN_408 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_327 : _GEN_247; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_409 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_328 : _GEN_263
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_410 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_333 :
    _GEN_216; // @[branch_predictor.scala 87:87]
  wire  _GEN_411 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_334 : _GEN_248; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_412 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_335 : _GEN_264
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_413 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_340 :
    _GEN_217; // @[branch_predictor.scala 87:87]
  wire  _GEN_414 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_341 : _GEN_249; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_415 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_342 : _GEN_265
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_416 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_347 :
    _GEN_218; // @[branch_predictor.scala 87:87]
  wire  _GEN_417 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_348 : _GEN_250; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_418 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_349 : _GEN_266
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_419 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_354 :
    _GEN_219; // @[branch_predictor.scala 87:87]
  wire  _GEN_420 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_355 : _GEN_251; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_421 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_356 : _GEN_267
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_422 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_361 :
    _GEN_220; // @[branch_predictor.scala 87:87]
  wire  _GEN_423 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_362 : _GEN_252; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_424 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_363 : _GEN_268
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_425 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_368 :
    _GEN_221; // @[branch_predictor.scala 87:87]
  wire  _GEN_426 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_369 : _GEN_253; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_427 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_370 : _GEN_269
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_428 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_375 :
    _GEN_222; // @[branch_predictor.scala 87:87]
  wire  _GEN_429 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_376 : _GEN_254; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_430 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_377 : _GEN_270
    ; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_431 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_382 :
    _GEN_223; // @[branch_predictor.scala 87:87]
  wire  _GEN_432 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_383 : _GEN_255; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_433 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_384 : _GEN_271
    ; // @[branch_predictor.scala 87:87]
  wire  _GEN_434 = _GEN_659 | _GEN_176; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_435 = _GEN_660 | _GEN_177; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_436 = _GEN_661 | _GEN_178; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_437 = _GEN_662 | _GEN_179; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_438 = _GEN_663 | _GEN_180; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_439 = _GEN_664 | _GEN_181; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_440 = _GEN_665 | _GEN_182; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_441 = _GEN_666 | _GEN_183; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_442 = _GEN_667 | _GEN_184; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_443 = _GEN_668 | _GEN_185; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_444 = _GEN_669 | _GEN_186; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_445 = _GEN_670 | _GEN_187; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_446 = _GEN_671 | _GEN_188; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_447 = _GEN_672 | _GEN_189; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_448 = _GEN_673 | _GEN_190; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_449 = _GEN_674 | _GEN_191; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_530 = _T_35 & ~entry_found ? _GEN_434 : _GEN_176; // @[branch_predictor.scala 110:103]
  wire  _GEN_531 = _T_35 & ~entry_found ? _GEN_435 : _GEN_177; // @[branch_predictor.scala 110:103]
  wire  _GEN_532 = _T_35 & ~entry_found ? _GEN_436 : _GEN_178; // @[branch_predictor.scala 110:103]
  wire  _GEN_533 = _T_35 & ~entry_found ? _GEN_437 : _GEN_179; // @[branch_predictor.scala 110:103]
  wire  _GEN_534 = _T_35 & ~entry_found ? _GEN_438 : _GEN_180; // @[branch_predictor.scala 110:103]
  wire  _GEN_535 = _T_35 & ~entry_found ? _GEN_439 : _GEN_181; // @[branch_predictor.scala 110:103]
  wire  _GEN_536 = _T_35 & ~entry_found ? _GEN_440 : _GEN_182; // @[branch_predictor.scala 110:103]
  wire  _GEN_537 = _T_35 & ~entry_found ? _GEN_441 : _GEN_183; // @[branch_predictor.scala 110:103]
  wire  _GEN_538 = _T_35 & ~entry_found ? _GEN_442 : _GEN_184; // @[branch_predictor.scala 110:103]
  wire  _GEN_539 = _T_35 & ~entry_found ? _GEN_443 : _GEN_185; // @[branch_predictor.scala 110:103]
  wire  _GEN_540 = _T_35 & ~entry_found ? _GEN_444 : _GEN_186; // @[branch_predictor.scala 110:103]
  wire  _GEN_541 = _T_35 & ~entry_found ? _GEN_445 : _GEN_187; // @[branch_predictor.scala 110:103]
  wire  _GEN_542 = _T_35 & ~entry_found ? _GEN_446 : _GEN_188; // @[branch_predictor.scala 110:103]
  wire  _GEN_543 = _T_35 & ~entry_found ? _GEN_447 : _GEN_189; // @[branch_predictor.scala 110:103]
  wire  _GEN_544 = _T_35 & ~entry_found ? _GEN_448 : _GEN_190; // @[branch_predictor.scala 110:103]
  wire  _GEN_545 = _T_35 & ~entry_found ? _GEN_449 : _GEN_191; // @[branch_predictor.scala 110:103]
  assign io_o_branch_predict_pack_valid = btb_15_tag == io_i_addr[12:3] ? btb_15_valid : _GEN_70; // @[branch_predictor.scala 43:45 44:44]
  assign io_o_branch_predict_pack_target = btb_15_tag == io_i_addr[12:3] ? btb_15_target_address : _GEN_71; // @[branch_predictor.scala 43:45 45:45]
  assign io_o_branch_predict_pack_branch_type = btb_15_tag == io_i_addr[12:3] ? btb_15_branch_type : _GEN_72; // @[branch_predictor.scala 43:45 46:50]
  assign io_o_branch_predict_pack_select = btb_15_tag == io_i_addr[12:3] ? btb_15_select : _GEN_73; // @[branch_predictor.scala 43:45 47:45]
  assign io_o_branch_predict_pack_taken = btb_15_tag == io_i_addr[12:3] ? ~btb_15_bht[1] : _GEN_74; // @[branch_predictor.scala 43:45 48:44]
  always @(posedge clock) begin
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_0_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_0_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_0_valid <= _GEN_530;
      end
    end else begin
      btb_0_valid <= _GEN_530;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_0_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_0_tag <= _GEN_192;
      end
    end else begin
      btb_0_tag <= _GEN_192;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_0_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_0_branch_type <= _GEN_224;
      end
    end else begin
      btb_0_branch_type <= _GEN_224;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_0_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_0_target_address <= _GEN_386;
      end
    end else begin
      btb_0_target_address <= _GEN_386;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_0_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_0_select <= _GEN_387;
      end
    end else begin
      btb_0_select <= _GEN_387;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_0_bht <= 2'h1;
        end else begin
          btb_0_bht <= 2'h0;
        end
      end else begin
        btb_0_bht <= _GEN_388;
      end
    end else begin
      btb_0_bht <= _GEN_388;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_1_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_1_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_1_valid <= _GEN_531;
      end
    end else begin
      btb_1_valid <= _GEN_531;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_1_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_1_tag <= _GEN_193;
      end
    end else begin
      btb_1_tag <= _GEN_193;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_1_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_1_branch_type <= _GEN_225;
      end
    end else begin
      btb_1_branch_type <= _GEN_225;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_1_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_1_target_address <= _GEN_389;
      end
    end else begin
      btb_1_target_address <= _GEN_389;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_1_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_1_select <= _GEN_390;
      end
    end else begin
      btb_1_select <= _GEN_390;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_1_bht <= 2'h1;
        end else begin
          btb_1_bht <= 2'h0;
        end
      end else begin
        btb_1_bht <= _GEN_391;
      end
    end else begin
      btb_1_bht <= _GEN_391;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_2_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_2_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_2_valid <= _GEN_532;
      end
    end else begin
      btb_2_valid <= _GEN_532;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_2_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_2_tag <= _GEN_194;
      end
    end else begin
      btb_2_tag <= _GEN_194;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_2_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_2_branch_type <= _GEN_226;
      end
    end else begin
      btb_2_branch_type <= _GEN_226;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_2_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_2_target_address <= _GEN_392;
      end
    end else begin
      btb_2_target_address <= _GEN_392;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_2_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_2_select <= _GEN_393;
      end
    end else begin
      btb_2_select <= _GEN_393;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_2_bht <= 2'h1;
        end else begin
          btb_2_bht <= 2'h0;
        end
      end else begin
        btb_2_bht <= _GEN_394;
      end
    end else begin
      btb_2_bht <= _GEN_394;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_3_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_3_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_3_valid <= _GEN_533;
      end
    end else begin
      btb_3_valid <= _GEN_533;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_3_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_3_tag <= _GEN_195;
      end
    end else begin
      btb_3_tag <= _GEN_195;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_3_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_3_branch_type <= _GEN_227;
      end
    end else begin
      btb_3_branch_type <= _GEN_227;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_3_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_3_target_address <= _GEN_395;
      end
    end else begin
      btb_3_target_address <= _GEN_395;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_3_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_3_select <= _GEN_396;
      end
    end else begin
      btb_3_select <= _GEN_396;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_3_bht <= 2'h1;
        end else begin
          btb_3_bht <= 2'h0;
        end
      end else begin
        btb_3_bht <= _GEN_397;
      end
    end else begin
      btb_3_bht <= _GEN_397;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_4_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_4_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_4_valid <= _GEN_534;
      end
    end else begin
      btb_4_valid <= _GEN_534;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_4_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_4_tag <= _GEN_196;
      end
    end else begin
      btb_4_tag <= _GEN_196;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_4_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_4_branch_type <= _GEN_228;
      end
    end else begin
      btb_4_branch_type <= _GEN_228;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_4_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_4_target_address <= _GEN_398;
      end
    end else begin
      btb_4_target_address <= _GEN_398;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_4_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_4_select <= _GEN_399;
      end
    end else begin
      btb_4_select <= _GEN_399;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_4_bht <= 2'h1;
        end else begin
          btb_4_bht <= 2'h0;
        end
      end else begin
        btb_4_bht <= _GEN_400;
      end
    end else begin
      btb_4_bht <= _GEN_400;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_5_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_5_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_5_valid <= _GEN_535;
      end
    end else begin
      btb_5_valid <= _GEN_535;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_5_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_5_tag <= _GEN_197;
      end
    end else begin
      btb_5_tag <= _GEN_197;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_5_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_5_branch_type <= _GEN_229;
      end
    end else begin
      btb_5_branch_type <= _GEN_229;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_5_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_5_target_address <= _GEN_401;
      end
    end else begin
      btb_5_target_address <= _GEN_401;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_5_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_5_select <= _GEN_402;
      end
    end else begin
      btb_5_select <= _GEN_402;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_5_bht <= 2'h1;
        end else begin
          btb_5_bht <= 2'h0;
        end
      end else begin
        btb_5_bht <= _GEN_403;
      end
    end else begin
      btb_5_bht <= _GEN_403;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_6_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_6_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_6_valid <= _GEN_536;
      end
    end else begin
      btb_6_valid <= _GEN_536;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_6_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_6_tag <= _GEN_198;
      end
    end else begin
      btb_6_tag <= _GEN_198;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_6_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_6_branch_type <= _GEN_230;
      end
    end else begin
      btb_6_branch_type <= _GEN_230;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_6_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_6_target_address <= _GEN_404;
      end
    end else begin
      btb_6_target_address <= _GEN_404;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_6_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_6_select <= _GEN_405;
      end
    end else begin
      btb_6_select <= _GEN_405;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_6_bht <= 2'h1;
        end else begin
          btb_6_bht <= 2'h0;
        end
      end else begin
        btb_6_bht <= _GEN_406;
      end
    end else begin
      btb_6_bht <= _GEN_406;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_7_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_7_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_7_valid <= _GEN_537;
      end
    end else begin
      btb_7_valid <= _GEN_537;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_7_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_7_tag <= _GEN_199;
      end
    end else begin
      btb_7_tag <= _GEN_199;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_7_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_7_branch_type <= _GEN_231;
      end
    end else begin
      btb_7_branch_type <= _GEN_231;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_7_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_7_target_address <= _GEN_407;
      end
    end else begin
      btb_7_target_address <= _GEN_407;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_7_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_7_select <= _GEN_408;
      end
    end else begin
      btb_7_select <= _GEN_408;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_7_bht <= 2'h1;
        end else begin
          btb_7_bht <= 2'h0;
        end
      end else begin
        btb_7_bht <= _GEN_409;
      end
    end else begin
      btb_7_bht <= _GEN_409;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_8_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_8_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_8_valid <= _GEN_538;
      end
    end else begin
      btb_8_valid <= _GEN_538;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_8_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_8_tag <= _GEN_200;
      end
    end else begin
      btb_8_tag <= _GEN_200;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_8_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_8_branch_type <= _GEN_232;
      end
    end else begin
      btb_8_branch_type <= _GEN_232;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_8_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_8_target_address <= _GEN_410;
      end
    end else begin
      btb_8_target_address <= _GEN_410;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_8_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_8_select <= _GEN_411;
      end
    end else begin
      btb_8_select <= _GEN_411;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_8_bht <= 2'h1;
        end else begin
          btb_8_bht <= 2'h0;
        end
      end else begin
        btb_8_bht <= _GEN_412;
      end
    end else begin
      btb_8_bht <= _GEN_412;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_9_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_9_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_9_valid <= _GEN_539;
      end
    end else begin
      btb_9_valid <= _GEN_539;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_9_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_9_tag <= _GEN_201;
      end
    end else begin
      btb_9_tag <= _GEN_201;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_9_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_9_branch_type <= _GEN_233;
      end
    end else begin
      btb_9_branch_type <= _GEN_233;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_9_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_9_target_address <= _GEN_413;
      end
    end else begin
      btb_9_target_address <= _GEN_413;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_9_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_9_select <= _GEN_414;
      end
    end else begin
      btb_9_select <= _GEN_414;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_9_bht <= 2'h1;
        end else begin
          btb_9_bht <= 2'h0;
        end
      end else begin
        btb_9_bht <= _GEN_415;
      end
    end else begin
      btb_9_bht <= _GEN_415;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_10_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_10_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_10_valid <= _GEN_540;
      end
    end else begin
      btb_10_valid <= _GEN_540;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'ha == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_10_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_10_tag <= _GEN_202;
      end
    end else begin
      btb_10_tag <= _GEN_202;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'ha == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_10_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_10_branch_type <= _GEN_234;
      end
    end else begin
      btb_10_branch_type <= _GEN_234;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'ha == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_10_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_10_target_address <= _GEN_416;
      end
    end else begin
      btb_10_target_address <= _GEN_416;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'ha == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_10_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_10_select <= _GEN_417;
      end
    end else begin
      btb_10_select <= _GEN_417;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'ha == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_10_bht <= 2'h1;
        end else begin
          btb_10_bht <= 2'h0;
        end
      end else begin
        btb_10_bht <= _GEN_418;
      end
    end else begin
      btb_10_bht <= _GEN_418;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_11_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_11_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_11_valid <= _GEN_541;
      end
    end else begin
      btb_11_valid <= _GEN_541;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hb == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_11_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_11_tag <= _GEN_203;
      end
    end else begin
      btb_11_tag <= _GEN_203;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hb == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_11_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_11_branch_type <= _GEN_235;
      end
    end else begin
      btb_11_branch_type <= _GEN_235;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hb == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_11_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_11_target_address <= _GEN_419;
      end
    end else begin
      btb_11_target_address <= _GEN_419;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hb == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_11_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_11_select <= _GEN_420;
      end
    end else begin
      btb_11_select <= _GEN_420;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hb == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_11_bht <= 2'h1;
        end else begin
          btb_11_bht <= 2'h0;
        end
      end else begin
        btb_11_bht <= _GEN_421;
      end
    end else begin
      btb_11_bht <= _GEN_421;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_12_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_12_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_12_valid <= _GEN_542;
      end
    end else begin
      btb_12_valid <= _GEN_542;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hc == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_12_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_12_tag <= _GEN_204;
      end
    end else begin
      btb_12_tag <= _GEN_204;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hc == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_12_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_12_branch_type <= _GEN_236;
      end
    end else begin
      btb_12_branch_type <= _GEN_236;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hc == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_12_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_12_target_address <= _GEN_422;
      end
    end else begin
      btb_12_target_address <= _GEN_422;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hc == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_12_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_12_select <= _GEN_423;
      end
    end else begin
      btb_12_select <= _GEN_423;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hc == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_12_bht <= 2'h1;
        end else begin
          btb_12_bht <= 2'h0;
        end
      end else begin
        btb_12_bht <= _GEN_424;
      end
    end else begin
      btb_12_bht <= _GEN_424;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_13_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_13_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_13_valid <= _GEN_543;
      end
    end else begin
      btb_13_valid <= _GEN_543;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hd == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_13_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_13_tag <= _GEN_205;
      end
    end else begin
      btb_13_tag <= _GEN_205;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hd == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_13_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_13_branch_type <= _GEN_237;
      end
    end else begin
      btb_13_branch_type <= _GEN_237;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hd == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_13_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_13_target_address <= _GEN_425;
      end
    end else begin
      btb_13_target_address <= _GEN_425;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hd == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_13_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_13_select <= _GEN_426;
      end
    end else begin
      btb_13_select <= _GEN_426;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hd == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_13_bht <= 2'h1;
        end else begin
          btb_13_bht <= 2'h0;
        end
      end else begin
        btb_13_bht <= _GEN_427;
      end
    end else begin
      btb_13_bht <= _GEN_427;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_14_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_14_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_14_valid <= _GEN_544;
      end
    end else begin
      btb_14_valid <= _GEN_544;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'he == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_14_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_14_tag <= _GEN_206;
      end
    end else begin
      btb_14_tag <= _GEN_206;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'he == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_14_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_14_branch_type <= _GEN_238;
      end
    end else begin
      btb_14_branch_type <= _GEN_238;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'he == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_14_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_14_target_address <= _GEN_428;
      end
    end else begin
      btb_14_target_address <= _GEN_428;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'he == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_14_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_14_select <= _GEN_429;
      end
    end else begin
      btb_14_select <= _GEN_429;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'he == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_14_bht <= 2'h1;
        end else begin
          btb_14_bht <= 2'h0;
        end
      end else begin
        btb_14_bht <= _GEN_430;
      end
    end else begin
      btb_14_bht <= _GEN_430;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_15_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_15_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_15_valid <= _GEN_545;
      end
    end else begin
      btb_15_valid <= _GEN_545;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hf == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_15_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_15_tag <= _GEN_207;
      end
    end else begin
      btb_15_tag <= _GEN_207;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hf == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_15_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_15_branch_type <= _GEN_239;
      end
    end else begin
      btb_15_branch_type <= _GEN_239;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hf == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_15_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_15_target_address <= _GEN_431;
      end
    end else begin
      btb_15_target_address <= _GEN_431;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hf == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_15_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_15_select <= _GEN_432;
      end
    end else begin
      btb_15_select <= _GEN_432;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (4'hf == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_15_bht <= 2'h1;
        end else begin
          btb_15_bht <= 2'h0;
        end
      end else begin
        btb_15_bht <= _GEN_433;
      end
    end else begin
      btb_15_bht <= _GEN_433;
    end
    if (reset) begin // @[branch_predictor.scala 35:33]
      btb_victim_ptr <= 4'h0; // @[branch_predictor.scala 35:33]
    end else if (_T_35 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      btb_victim_ptr <= _btb_victim_ptr_T_1; // @[branch_predictor.scala 119:24]
    end else if (io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
      io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 65:121]
      btb_victim_ptr <= _btb_victim_ptr_T_1; // @[branch_predictor.scala 74:24]
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
  btb_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  btb_0_tag = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  btb_0_branch_type = _RAND_2[3:0];
  _RAND_3 = {2{`RANDOM}};
  btb_0_target_address = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  btb_0_select = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  btb_0_bht = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  btb_1_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  btb_1_tag = _RAND_7[9:0];
  _RAND_8 = {1{`RANDOM}};
  btb_1_branch_type = _RAND_8[3:0];
  _RAND_9 = {2{`RANDOM}};
  btb_1_target_address = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  btb_1_select = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  btb_1_bht = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  btb_2_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  btb_2_tag = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  btb_2_branch_type = _RAND_14[3:0];
  _RAND_15 = {2{`RANDOM}};
  btb_2_target_address = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  btb_2_select = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  btb_2_bht = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  btb_3_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  btb_3_tag = _RAND_19[9:0];
  _RAND_20 = {1{`RANDOM}};
  btb_3_branch_type = _RAND_20[3:0];
  _RAND_21 = {2{`RANDOM}};
  btb_3_target_address = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  btb_3_select = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  btb_3_bht = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  btb_4_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  btb_4_tag = _RAND_25[9:0];
  _RAND_26 = {1{`RANDOM}};
  btb_4_branch_type = _RAND_26[3:0];
  _RAND_27 = {2{`RANDOM}};
  btb_4_target_address = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  btb_4_select = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  btb_4_bht = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  btb_5_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  btb_5_tag = _RAND_31[9:0];
  _RAND_32 = {1{`RANDOM}};
  btb_5_branch_type = _RAND_32[3:0];
  _RAND_33 = {2{`RANDOM}};
  btb_5_target_address = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  btb_5_select = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  btb_5_bht = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  btb_6_valid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  btb_6_tag = _RAND_37[9:0];
  _RAND_38 = {1{`RANDOM}};
  btb_6_branch_type = _RAND_38[3:0];
  _RAND_39 = {2{`RANDOM}};
  btb_6_target_address = _RAND_39[63:0];
  _RAND_40 = {1{`RANDOM}};
  btb_6_select = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  btb_6_bht = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  btb_7_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  btb_7_tag = _RAND_43[9:0];
  _RAND_44 = {1{`RANDOM}};
  btb_7_branch_type = _RAND_44[3:0];
  _RAND_45 = {2{`RANDOM}};
  btb_7_target_address = _RAND_45[63:0];
  _RAND_46 = {1{`RANDOM}};
  btb_7_select = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  btb_7_bht = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  btb_8_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  btb_8_tag = _RAND_49[9:0];
  _RAND_50 = {1{`RANDOM}};
  btb_8_branch_type = _RAND_50[3:0];
  _RAND_51 = {2{`RANDOM}};
  btb_8_target_address = _RAND_51[63:0];
  _RAND_52 = {1{`RANDOM}};
  btb_8_select = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  btb_8_bht = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  btb_9_valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  btb_9_tag = _RAND_55[9:0];
  _RAND_56 = {1{`RANDOM}};
  btb_9_branch_type = _RAND_56[3:0];
  _RAND_57 = {2{`RANDOM}};
  btb_9_target_address = _RAND_57[63:0];
  _RAND_58 = {1{`RANDOM}};
  btb_9_select = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  btb_9_bht = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  btb_10_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  btb_10_tag = _RAND_61[9:0];
  _RAND_62 = {1{`RANDOM}};
  btb_10_branch_type = _RAND_62[3:0];
  _RAND_63 = {2{`RANDOM}};
  btb_10_target_address = _RAND_63[63:0];
  _RAND_64 = {1{`RANDOM}};
  btb_10_select = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  btb_10_bht = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  btb_11_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  btb_11_tag = _RAND_67[9:0];
  _RAND_68 = {1{`RANDOM}};
  btb_11_branch_type = _RAND_68[3:0];
  _RAND_69 = {2{`RANDOM}};
  btb_11_target_address = _RAND_69[63:0];
  _RAND_70 = {1{`RANDOM}};
  btb_11_select = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  btb_11_bht = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  btb_12_valid = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  btb_12_tag = _RAND_73[9:0];
  _RAND_74 = {1{`RANDOM}};
  btb_12_branch_type = _RAND_74[3:0];
  _RAND_75 = {2{`RANDOM}};
  btb_12_target_address = _RAND_75[63:0];
  _RAND_76 = {1{`RANDOM}};
  btb_12_select = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  btb_12_bht = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  btb_13_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  btb_13_tag = _RAND_79[9:0];
  _RAND_80 = {1{`RANDOM}};
  btb_13_branch_type = _RAND_80[3:0];
  _RAND_81 = {2{`RANDOM}};
  btb_13_target_address = _RAND_81[63:0];
  _RAND_82 = {1{`RANDOM}};
  btb_13_select = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  btb_13_bht = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  btb_14_valid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  btb_14_tag = _RAND_85[9:0];
  _RAND_86 = {1{`RANDOM}};
  btb_14_branch_type = _RAND_86[3:0];
  _RAND_87 = {2{`RANDOM}};
  btb_14_target_address = _RAND_87[63:0];
  _RAND_88 = {1{`RANDOM}};
  btb_14_select = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  btb_14_bht = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  btb_15_valid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  btb_15_tag = _RAND_91[9:0];
  _RAND_92 = {1{`RANDOM}};
  btb_15_branch_type = _RAND_92[3:0];
  _RAND_93 = {2{`RANDOM}};
  btb_15_target_address = _RAND_93[63:0];
  _RAND_94 = {1{`RANDOM}};
  btb_15_select = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  btb_15_bht = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  btb_victim_ptr = _RAND_96[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
