module Rename_Table(
  input        clock,
  input        reset,
  input  [4:0] io_i_rename_req_packs_0_arch_rs1,
  input  [4:0] io_i_rename_req_packs_0_arch_rs2,
  input  [4:0] io_i_rename_req_packs_0_arch_dst,
  input  [4:0] io_i_rename_req_packs_1_arch_rs1,
  input  [4:0] io_i_rename_req_packs_1_arch_rs2,
  input  [4:0] io_i_rename_req_packs_1_arch_dst,
  output [6:0] io_o_rename_res_packs_0_phy_rs1,
  output [6:0] io_o_rename_res_packs_0_phy_rs2,
  output [6:0] io_o_rename_res_packs_0_phy_dst,
  output [6:0] io_o_rename_res_packs_1_phy_rs1,
  output [6:0] io_o_rename_res_packs_1_phy_rs2,
  output [6:0] io_o_rename_res_packs_1_phy_dst,
  input        io_i_allocation_pack_0_valid,
  input  [6:0] io_i_allocation_pack_0_phy_dst,
  input  [4:0] io_i_allocation_pack_0_arch_dst,
  input        io_i_allocation_pack_1_valid,
  input  [6:0] io_i_allocation_pack_1_phy_dst,
  input  [4:0] io_i_allocation_pack_1_arch_dst,
  input        io_i_commit_packs_0_valid,
  input  [6:0] io_i_commit_packs_0_uop_phy_dst,
  input  [4:0] io_i_commit_packs_0_uop_arch_dst,
  input        io_i_commit_packs_1_valid,
  input  [6:0] io_i_commit_packs_1_uop_phy_dst,
  input  [4:0] io_i_commit_packs_1_uop_arch_dst,
  input        io_i_rollback_packs_0_valid,
  input  [6:0] io_i_rollback_packs_0_uop_stale_dst,
  input  [4:0] io_i_rollback_packs_0_uop_arch_dst,
  input        io_i_rollback_packs_1_valid,
  input  [6:0] io_i_rollback_packs_1_uop_stale_dst,
  input  [4:0] io_i_rollback_packs_1_uop_arch_dst,
  input        io_i_exception,
  output [6:0] io_o_commit_rename_table_0,
  output [6:0] io_o_commit_rename_table_1,
  output [6:0] io_o_commit_rename_table_2,
  output [6:0] io_o_commit_rename_table_3,
  output [6:0] io_o_commit_rename_table_4,
  output [6:0] io_o_commit_rename_table_5,
  output [6:0] io_o_commit_rename_table_6,
  output [6:0] io_o_commit_rename_table_7,
  output [6:0] io_o_commit_rename_table_8,
  output [6:0] io_o_commit_rename_table_9,
  output [6:0] io_o_commit_rename_table_10,
  output [6:0] io_o_commit_rename_table_11,
  output [6:0] io_o_commit_rename_table_12,
  output [6:0] io_o_commit_rename_table_13,
  output [6:0] io_o_commit_rename_table_14,
  output [6:0] io_o_commit_rename_table_15,
  output [6:0] io_o_commit_rename_table_16,
  output [6:0] io_o_commit_rename_table_17,
  output [6:0] io_o_commit_rename_table_18,
  output [6:0] io_o_commit_rename_table_19,
  output [6:0] io_o_commit_rename_table_20,
  output [6:0] io_o_commit_rename_table_21,
  output [6:0] io_o_commit_rename_table_22,
  output [6:0] io_o_commit_rename_table_23,
  output [6:0] io_o_commit_rename_table_24,
  output [6:0] io_o_commit_rename_table_25,
  output [6:0] io_o_commit_rename_table_26,
  output [6:0] io_o_commit_rename_table_27,
  output [6:0] io_o_commit_rename_table_28,
  output [6:0] io_o_commit_rename_table_29,
  output [6:0] io_o_commit_rename_table_30,
  output [6:0] io_o_commit_rename_table_31
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
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] rename_table_0; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_1; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_2; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_3; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_4; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_5; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_6; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_7; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_8; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_9; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_10; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_11; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_12; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_13; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_14; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_15; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_16; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_17; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_18; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_19; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_20; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_21; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_22; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_23; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_24; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_25; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_26; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_27; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_28; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_29; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_30; // @[rename_table.scala 39:31]
  reg [6:0] rename_table_31; // @[rename_table.scala 39:31]
  reg [6:0] commit_rename_table_0; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_1; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_2; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_3; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_4; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_5; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_6; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_7; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_8; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_9; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_10; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_11; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_12; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_13; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_14; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_15; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_16; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_17; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_18; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_19; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_20; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_21; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_22; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_23; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_24; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_25; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_26; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_27; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_28; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_29; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_30; // @[rename_table.scala 40:38]
  reg [6:0] commit_rename_table_31; // @[rename_table.scala 40:38]
  wire [6:0] _GEN_0 = 5'h0 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_0
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_1 = 5'h1 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_1
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_2 = 5'h2 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_2
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_3 = 5'h3 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_3
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_4 = 5'h4 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_4
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_5 = 5'h5 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_5
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_6 = 5'h6 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_6
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_7 = 5'h7 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_7
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_8 = 5'h8 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_8
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_9 = 5'h9 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst : commit_rename_table_9
    ; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_10 = 5'ha == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_10; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_11 = 5'hb == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_11; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_12 = 5'hc == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_12; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_13 = 5'hd == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_13; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_14 = 5'he == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_14; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_15 = 5'hf == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_15; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_16 = 5'h10 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_16; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_17 = 5'h11 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_17; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_18 = 5'h12 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_18; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_19 = 5'h13 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_19; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_20 = 5'h14 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_20; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_21 = 5'h15 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_21; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_22 = 5'h16 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_22; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_23 = 5'h17 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_23; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_24 = 5'h18 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_24; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_25 = 5'h19 == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_25; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_26 = 5'h1a == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_26; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_27 = 5'h1b == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_27; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_28 = 5'h1c == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_28; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_29 = 5'h1d == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_29; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_30 = 5'h1e == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_30; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_31 = 5'h1f == io_i_commit_packs_0_uop_arch_dst ? io_i_commit_packs_0_uop_phy_dst :
    commit_rename_table_31; // @[rename_table.scala 40:38 45:{63,63}]
  wire [6:0] _GEN_32 = io_i_commit_packs_0_valid ? _GEN_0 : commit_rename_table_0; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_33 = io_i_commit_packs_0_valid ? _GEN_1 : commit_rename_table_1; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_34 = io_i_commit_packs_0_valid ? _GEN_2 : commit_rename_table_2; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_35 = io_i_commit_packs_0_valid ? _GEN_3 : commit_rename_table_3; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_36 = io_i_commit_packs_0_valid ? _GEN_4 : commit_rename_table_4; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_37 = io_i_commit_packs_0_valid ? _GEN_5 : commit_rename_table_5; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_38 = io_i_commit_packs_0_valid ? _GEN_6 : commit_rename_table_6; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_39 = io_i_commit_packs_0_valid ? _GEN_7 : commit_rename_table_7; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_40 = io_i_commit_packs_0_valid ? _GEN_8 : commit_rename_table_8; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_41 = io_i_commit_packs_0_valid ? _GEN_9 : commit_rename_table_9; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_42 = io_i_commit_packs_0_valid ? _GEN_10 : commit_rename_table_10; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_43 = io_i_commit_packs_0_valid ? _GEN_11 : commit_rename_table_11; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_44 = io_i_commit_packs_0_valid ? _GEN_12 : commit_rename_table_12; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_45 = io_i_commit_packs_0_valid ? _GEN_13 : commit_rename_table_13; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_46 = io_i_commit_packs_0_valid ? _GEN_14 : commit_rename_table_14; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_47 = io_i_commit_packs_0_valid ? _GEN_15 : commit_rename_table_15; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_48 = io_i_commit_packs_0_valid ? _GEN_16 : commit_rename_table_16; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_49 = io_i_commit_packs_0_valid ? _GEN_17 : commit_rename_table_17; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_50 = io_i_commit_packs_0_valid ? _GEN_18 : commit_rename_table_18; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_51 = io_i_commit_packs_0_valid ? _GEN_19 : commit_rename_table_19; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_52 = io_i_commit_packs_0_valid ? _GEN_20 : commit_rename_table_20; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_53 = io_i_commit_packs_0_valid ? _GEN_21 : commit_rename_table_21; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_54 = io_i_commit_packs_0_valid ? _GEN_22 : commit_rename_table_22; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_55 = io_i_commit_packs_0_valid ? _GEN_23 : commit_rename_table_23; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_56 = io_i_commit_packs_0_valid ? _GEN_24 : commit_rename_table_24; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_57 = io_i_commit_packs_0_valid ? _GEN_25 : commit_rename_table_25; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_58 = io_i_commit_packs_0_valid ? _GEN_26 : commit_rename_table_26; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_59 = io_i_commit_packs_0_valid ? _GEN_27 : commit_rename_table_27; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_60 = io_i_commit_packs_0_valid ? _GEN_28 : commit_rename_table_28; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_61 = io_i_commit_packs_0_valid ? _GEN_29 : commit_rename_table_29; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_62 = io_i_commit_packs_0_valid ? _GEN_30 : commit_rename_table_30; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_63 = io_i_commit_packs_0_valid ? _GEN_31 : commit_rename_table_31; // @[rename_table.scala 44:37 40:38]
  wire [6:0] _GEN_128 = 5'h0 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_0; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_129 = 5'h1 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_1; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_130 = 5'h2 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_2; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_131 = 5'h3 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_3; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_132 = 5'h4 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_4; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_133 = 5'h5 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_5; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_134 = 5'h6 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_6; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_135 = 5'h7 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_7; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_136 = 5'h8 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_8; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_137 = 5'h9 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_9; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_138 = 5'ha == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_10; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_139 = 5'hb == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_11; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_140 = 5'hc == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_12; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_141 = 5'hd == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_13; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_142 = 5'he == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_14; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_143 = 5'hf == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_15; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_144 = 5'h10 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_16; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_145 = 5'h11 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_17; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_146 = 5'h12 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_18; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_147 = 5'h13 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_19; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_148 = 5'h14 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_20; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_149 = 5'h15 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_21; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_150 = 5'h16 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_22; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_151 = 5'h17 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_23; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_152 = 5'h18 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_24; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_153 = 5'h19 == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_25; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_154 = 5'h1a == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_26; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_155 = 5'h1b == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_27; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_156 = 5'h1c == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_28; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_157 = 5'h1d == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_29; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_158 = 5'h1e == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_30; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_159 = 5'h1f == io_i_rollback_packs_0_uop_arch_dst ? io_i_rollback_packs_0_uop_stale_dst :
    rename_table_31; // @[rename_table.scala 39:31 51:{58,58}]
  wire [6:0] _GEN_160 = io_i_rollback_packs_0_valid ? _GEN_128 : rename_table_0; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_161 = io_i_rollback_packs_0_valid ? _GEN_129 : rename_table_1; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_162 = io_i_rollback_packs_0_valid ? _GEN_130 : rename_table_2; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_163 = io_i_rollback_packs_0_valid ? _GEN_131 : rename_table_3; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_164 = io_i_rollback_packs_0_valid ? _GEN_132 : rename_table_4; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_165 = io_i_rollback_packs_0_valid ? _GEN_133 : rename_table_5; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_166 = io_i_rollback_packs_0_valid ? _GEN_134 : rename_table_6; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_167 = io_i_rollback_packs_0_valid ? _GEN_135 : rename_table_7; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_168 = io_i_rollback_packs_0_valid ? _GEN_136 : rename_table_8; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_169 = io_i_rollback_packs_0_valid ? _GEN_137 : rename_table_9; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_170 = io_i_rollback_packs_0_valid ? _GEN_138 : rename_table_10; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_171 = io_i_rollback_packs_0_valid ? _GEN_139 : rename_table_11; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_172 = io_i_rollback_packs_0_valid ? _GEN_140 : rename_table_12; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_173 = io_i_rollback_packs_0_valid ? _GEN_141 : rename_table_13; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_174 = io_i_rollback_packs_0_valid ? _GEN_142 : rename_table_14; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_175 = io_i_rollback_packs_0_valid ? _GEN_143 : rename_table_15; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_176 = io_i_rollback_packs_0_valid ? _GEN_144 : rename_table_16; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_177 = io_i_rollback_packs_0_valid ? _GEN_145 : rename_table_17; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_178 = io_i_rollback_packs_0_valid ? _GEN_146 : rename_table_18; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_179 = io_i_rollback_packs_0_valid ? _GEN_147 : rename_table_19; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_180 = io_i_rollback_packs_0_valid ? _GEN_148 : rename_table_20; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_181 = io_i_rollback_packs_0_valid ? _GEN_149 : rename_table_21; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_182 = io_i_rollback_packs_0_valid ? _GEN_150 : rename_table_22; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_183 = io_i_rollback_packs_0_valid ? _GEN_151 : rename_table_23; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_184 = io_i_rollback_packs_0_valid ? _GEN_152 : rename_table_24; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_185 = io_i_rollback_packs_0_valid ? _GEN_153 : rename_table_25; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_186 = io_i_rollback_packs_0_valid ? _GEN_154 : rename_table_26; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_187 = io_i_rollback_packs_0_valid ? _GEN_155 : rename_table_27; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_188 = io_i_rollback_packs_0_valid ? _GEN_156 : rename_table_28; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_189 = io_i_rollback_packs_0_valid ? _GEN_157 : rename_table_29; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_190 = io_i_rollback_packs_0_valid ? _GEN_158 : rename_table_30; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_191 = io_i_rollback_packs_0_valid ? _GEN_159 : rename_table_31; // @[rename_table.scala 39:31 50:39]
  wire [6:0] _GEN_192 = 5'h0 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_160; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_193 = 5'h1 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_161; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_194 = 5'h2 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_162; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_195 = 5'h3 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_163; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_196 = 5'h4 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_164; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_197 = 5'h5 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_165; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_198 = 5'h6 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_166; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_199 = 5'h7 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_167; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_200 = 5'h8 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_168; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_201 = 5'h9 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_169; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_202 = 5'ha == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_170; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_203 = 5'hb == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_171; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_204 = 5'hc == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_172; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_205 = 5'hd == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_173; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_206 = 5'he == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_174; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_207 = 5'hf == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_175; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_208 = 5'h10 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_176; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_209 = 5'h11 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_177; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_210 = 5'h12 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_178; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_211 = 5'h13 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_179; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_212 = 5'h14 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_180; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_213 = 5'h15 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_181; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_214 = 5'h16 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_182; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_215 = 5'h17 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_183; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_216 = 5'h18 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_184; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_217 = 5'h19 == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_185; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_218 = 5'h1a == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_186; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_219 = 5'h1b == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_187; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_220 = 5'h1c == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_188; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_221 = 5'h1d == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_189; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_222 = 5'h1e == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_190; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_223 = 5'h1f == io_i_rollback_packs_1_uop_arch_dst ? io_i_rollback_packs_1_uop_stale_dst : _GEN_191; // @[rename_table.scala 54:{58,58}]
  wire [6:0] _GEN_224 = io_i_rollback_packs_1_valid ? _GEN_192 : _GEN_160; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_225 = io_i_rollback_packs_1_valid ? _GEN_193 : _GEN_161; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_226 = io_i_rollback_packs_1_valid ? _GEN_194 : _GEN_162; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_227 = io_i_rollback_packs_1_valid ? _GEN_195 : _GEN_163; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_228 = io_i_rollback_packs_1_valid ? _GEN_196 : _GEN_164; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_229 = io_i_rollback_packs_1_valid ? _GEN_197 : _GEN_165; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_230 = io_i_rollback_packs_1_valid ? _GEN_198 : _GEN_166; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_231 = io_i_rollback_packs_1_valid ? _GEN_199 : _GEN_167; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_232 = io_i_rollback_packs_1_valid ? _GEN_200 : _GEN_168; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_233 = io_i_rollback_packs_1_valid ? _GEN_201 : _GEN_169; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_234 = io_i_rollback_packs_1_valid ? _GEN_202 : _GEN_170; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_235 = io_i_rollback_packs_1_valid ? _GEN_203 : _GEN_171; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_236 = io_i_rollback_packs_1_valid ? _GEN_204 : _GEN_172; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_237 = io_i_rollback_packs_1_valid ? _GEN_205 : _GEN_173; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_238 = io_i_rollback_packs_1_valid ? _GEN_206 : _GEN_174; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_239 = io_i_rollback_packs_1_valid ? _GEN_207 : _GEN_175; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_240 = io_i_rollback_packs_1_valid ? _GEN_208 : _GEN_176; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_241 = io_i_rollback_packs_1_valid ? _GEN_209 : _GEN_177; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_242 = io_i_rollback_packs_1_valid ? _GEN_210 : _GEN_178; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_243 = io_i_rollback_packs_1_valid ? _GEN_211 : _GEN_179; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_244 = io_i_rollback_packs_1_valid ? _GEN_212 : _GEN_180; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_245 = io_i_rollback_packs_1_valid ? _GEN_213 : _GEN_181; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_246 = io_i_rollback_packs_1_valid ? _GEN_214 : _GEN_182; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_247 = io_i_rollback_packs_1_valid ? _GEN_215 : _GEN_183; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_248 = io_i_rollback_packs_1_valid ? _GEN_216 : _GEN_184; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_249 = io_i_rollback_packs_1_valid ? _GEN_217 : _GEN_185; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_250 = io_i_rollback_packs_1_valid ? _GEN_218 : _GEN_186; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_251 = io_i_rollback_packs_1_valid ? _GEN_219 : _GEN_187; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_252 = io_i_rollback_packs_1_valid ? _GEN_220 : _GEN_188; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_253 = io_i_rollback_packs_1_valid ? _GEN_221 : _GEN_189; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_254 = io_i_rollback_packs_1_valid ? _GEN_222 : _GEN_190; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_255 = io_i_rollback_packs_1_valid ? _GEN_223 : _GEN_191; // @[rename_table.scala 53:39]
  wire [6:0] _GEN_256 = 5'h0 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_224; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_257 = 5'h1 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_225; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_258 = 5'h2 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_226; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_259 = 5'h3 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_227; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_260 = 5'h4 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_228; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_261 = 5'h5 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_229; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_262 = 5'h6 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_230; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_263 = 5'h7 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_231; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_264 = 5'h8 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_232; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_265 = 5'h9 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_233; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_266 = 5'ha == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_234; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_267 = 5'hb == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_235; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_268 = 5'hc == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_236; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_269 = 5'hd == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_237; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_270 = 5'he == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_238; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_271 = 5'hf == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_239; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_272 = 5'h10 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_240; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_273 = 5'h11 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_241; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_274 = 5'h12 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_242; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_275 = 5'h13 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_243; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_276 = 5'h14 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_244; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_277 = 5'h15 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_245; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_278 = 5'h16 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_246; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_279 = 5'h17 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_247; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_280 = 5'h18 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_248; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_281 = 5'h19 == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_249; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_282 = 5'h1a == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_250; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_283 = 5'h1b == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_251; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_284 = 5'h1c == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_252; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_285 = 5'h1d == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_253; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_286 = 5'h1e == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_254; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_287 = 5'h1f == io_i_allocation_pack_0_arch_dst ? io_i_allocation_pack_0_phy_dst : _GEN_255; // @[rename_table.scala 57:{55,55}]
  wire [6:0] _GEN_288 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_256 : _GEN_224; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_289 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_257 : _GEN_225; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_290 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_258 : _GEN_226; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_291 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_259 : _GEN_227; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_292 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_260 : _GEN_228; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_293 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_261 : _GEN_229; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_294 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_262 : _GEN_230; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_295 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_263 : _GEN_231; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_296 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_264 : _GEN_232; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_297 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_265 : _GEN_233; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_298 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_266 : _GEN_234; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_299 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_267 : _GEN_235; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_300 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_268 : _GEN_236; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_301 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_269 : _GEN_237; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_302 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_270 : _GEN_238; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_303 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_271 : _GEN_239; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_304 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_272 : _GEN_240; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_305 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_273 : _GEN_241; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_306 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_274 : _GEN_242; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_307 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_275 : _GEN_243; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_308 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_276 : _GEN_244; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_309 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_277 : _GEN_245; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_310 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_278 : _GEN_246; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_311 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_279 : _GEN_247; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_312 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_280 : _GEN_248; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_313 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_281 : _GEN_249; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_314 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_282 : _GEN_250; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_315 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_283 : _GEN_251; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_316 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_284 : _GEN_252; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_317 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_285 : _GEN_253; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_318 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_286 : _GEN_254; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_319 = io_i_allocation_pack_0_valid & io_i_allocation_pack_0_arch_dst != 5'h0 ? _GEN_287 : _GEN_255; // @[rename_table.scala 56:84]
  wire [6:0] _GEN_385 = 5'h1 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_1 : rename_table_0; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_386 = 5'h2 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_2 : _GEN_385; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_387 = 5'h3 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_3 : _GEN_386; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_388 = 5'h4 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_4 : _GEN_387; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_389 = 5'h5 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_5 : _GEN_388; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_390 = 5'h6 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_6 : _GEN_389; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_391 = 5'h7 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_7 : _GEN_390; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_392 = 5'h8 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_8 : _GEN_391; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_393 = 5'h9 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_9 : _GEN_392; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_394 = 5'ha == io_i_rename_req_packs_0_arch_rs1 ? rename_table_10 : _GEN_393; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_395 = 5'hb == io_i_rename_req_packs_0_arch_rs1 ? rename_table_11 : _GEN_394; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_396 = 5'hc == io_i_rename_req_packs_0_arch_rs1 ? rename_table_12 : _GEN_395; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_397 = 5'hd == io_i_rename_req_packs_0_arch_rs1 ? rename_table_13 : _GEN_396; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_398 = 5'he == io_i_rename_req_packs_0_arch_rs1 ? rename_table_14 : _GEN_397; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_399 = 5'hf == io_i_rename_req_packs_0_arch_rs1 ? rename_table_15 : _GEN_398; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_400 = 5'h10 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_16 : _GEN_399; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_401 = 5'h11 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_17 : _GEN_400; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_402 = 5'h12 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_18 : _GEN_401; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_403 = 5'h13 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_19 : _GEN_402; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_404 = 5'h14 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_20 : _GEN_403; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_405 = 5'h15 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_21 : _GEN_404; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_406 = 5'h16 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_22 : _GEN_405; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_407 = 5'h17 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_23 : _GEN_406; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_408 = 5'h18 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_24 : _GEN_407; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_409 = 5'h19 == io_i_rename_req_packs_0_arch_rs1 ? rename_table_25 : _GEN_408; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_410 = 5'h1a == io_i_rename_req_packs_0_arch_rs1 ? rename_table_26 : _GEN_409; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_411 = 5'h1b == io_i_rename_req_packs_0_arch_rs1 ? rename_table_27 : _GEN_410; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_412 = 5'h1c == io_i_rename_req_packs_0_arch_rs1 ? rename_table_28 : _GEN_411; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_413 = 5'h1d == io_i_rename_req_packs_0_arch_rs1 ? rename_table_29 : _GEN_412; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_414 = 5'h1e == io_i_rename_req_packs_0_arch_rs1 ? rename_table_30 : _GEN_413; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_417 = 5'h1 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_1 : rename_table_0; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_418 = 5'h2 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_2 : _GEN_417; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_419 = 5'h3 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_3 : _GEN_418; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_420 = 5'h4 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_4 : _GEN_419; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_421 = 5'h5 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_5 : _GEN_420; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_422 = 5'h6 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_6 : _GEN_421; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_423 = 5'h7 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_7 : _GEN_422; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_424 = 5'h8 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_8 : _GEN_423; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_425 = 5'h9 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_9 : _GEN_424; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_426 = 5'ha == io_i_rename_req_packs_0_arch_rs2 ? rename_table_10 : _GEN_425; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_427 = 5'hb == io_i_rename_req_packs_0_arch_rs2 ? rename_table_11 : _GEN_426; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_428 = 5'hc == io_i_rename_req_packs_0_arch_rs2 ? rename_table_12 : _GEN_427; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_429 = 5'hd == io_i_rename_req_packs_0_arch_rs2 ? rename_table_13 : _GEN_428; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_430 = 5'he == io_i_rename_req_packs_0_arch_rs2 ? rename_table_14 : _GEN_429; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_431 = 5'hf == io_i_rename_req_packs_0_arch_rs2 ? rename_table_15 : _GEN_430; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_432 = 5'h10 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_16 : _GEN_431; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_433 = 5'h11 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_17 : _GEN_432; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_434 = 5'h12 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_18 : _GEN_433; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_435 = 5'h13 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_19 : _GEN_434; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_436 = 5'h14 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_20 : _GEN_435; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_437 = 5'h15 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_21 : _GEN_436; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_438 = 5'h16 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_22 : _GEN_437; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_439 = 5'h17 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_23 : _GEN_438; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_440 = 5'h18 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_24 : _GEN_439; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_441 = 5'h19 == io_i_rename_req_packs_0_arch_rs2 ? rename_table_25 : _GEN_440; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_442 = 5'h1a == io_i_rename_req_packs_0_arch_rs2 ? rename_table_26 : _GEN_441; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_443 = 5'h1b == io_i_rename_req_packs_0_arch_rs2 ? rename_table_27 : _GEN_442; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_444 = 5'h1c == io_i_rename_req_packs_0_arch_rs2 ? rename_table_28 : _GEN_443; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_445 = 5'h1d == io_i_rename_req_packs_0_arch_rs2 ? rename_table_29 : _GEN_444; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_446 = 5'h1e == io_i_rename_req_packs_0_arch_rs2 ? rename_table_30 : _GEN_445; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_449 = 5'h1 == io_i_rename_req_packs_0_arch_dst ? rename_table_1 : rename_table_0; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_450 = 5'h2 == io_i_rename_req_packs_0_arch_dst ? rename_table_2 : _GEN_449; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_451 = 5'h3 == io_i_rename_req_packs_0_arch_dst ? rename_table_3 : _GEN_450; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_452 = 5'h4 == io_i_rename_req_packs_0_arch_dst ? rename_table_4 : _GEN_451; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_453 = 5'h5 == io_i_rename_req_packs_0_arch_dst ? rename_table_5 : _GEN_452; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_454 = 5'h6 == io_i_rename_req_packs_0_arch_dst ? rename_table_6 : _GEN_453; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_455 = 5'h7 == io_i_rename_req_packs_0_arch_dst ? rename_table_7 : _GEN_454; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_456 = 5'h8 == io_i_rename_req_packs_0_arch_dst ? rename_table_8 : _GEN_455; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_457 = 5'h9 == io_i_rename_req_packs_0_arch_dst ? rename_table_9 : _GEN_456; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_458 = 5'ha == io_i_rename_req_packs_0_arch_dst ? rename_table_10 : _GEN_457; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_459 = 5'hb == io_i_rename_req_packs_0_arch_dst ? rename_table_11 : _GEN_458; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_460 = 5'hc == io_i_rename_req_packs_0_arch_dst ? rename_table_12 : _GEN_459; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_461 = 5'hd == io_i_rename_req_packs_0_arch_dst ? rename_table_13 : _GEN_460; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_462 = 5'he == io_i_rename_req_packs_0_arch_dst ? rename_table_14 : _GEN_461; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_463 = 5'hf == io_i_rename_req_packs_0_arch_dst ? rename_table_15 : _GEN_462; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_464 = 5'h10 == io_i_rename_req_packs_0_arch_dst ? rename_table_16 : _GEN_463; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_465 = 5'h11 == io_i_rename_req_packs_0_arch_dst ? rename_table_17 : _GEN_464; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_466 = 5'h12 == io_i_rename_req_packs_0_arch_dst ? rename_table_18 : _GEN_465; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_467 = 5'h13 == io_i_rename_req_packs_0_arch_dst ? rename_table_19 : _GEN_466; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_468 = 5'h14 == io_i_rename_req_packs_0_arch_dst ? rename_table_20 : _GEN_467; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_469 = 5'h15 == io_i_rename_req_packs_0_arch_dst ? rename_table_21 : _GEN_468; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_470 = 5'h16 == io_i_rename_req_packs_0_arch_dst ? rename_table_22 : _GEN_469; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_471 = 5'h17 == io_i_rename_req_packs_0_arch_dst ? rename_table_23 : _GEN_470; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_472 = 5'h18 == io_i_rename_req_packs_0_arch_dst ? rename_table_24 : _GEN_471; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_473 = 5'h19 == io_i_rename_req_packs_0_arch_dst ? rename_table_25 : _GEN_472; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_474 = 5'h1a == io_i_rename_req_packs_0_arch_dst ? rename_table_26 : _GEN_473; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_475 = 5'h1b == io_i_rename_req_packs_0_arch_dst ? rename_table_27 : _GEN_474; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_476 = 5'h1c == io_i_rename_req_packs_0_arch_dst ? rename_table_28 : _GEN_475; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_477 = 5'h1d == io_i_rename_req_packs_0_arch_dst ? rename_table_29 : _GEN_476; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_478 = 5'h1e == io_i_rename_req_packs_0_arch_dst ? rename_table_30 : _GEN_477; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_481 = 5'h1 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_1 : rename_table_0; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_482 = 5'h2 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_2 : _GEN_481; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_483 = 5'h3 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_3 : _GEN_482; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_484 = 5'h4 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_4 : _GEN_483; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_485 = 5'h5 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_5 : _GEN_484; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_486 = 5'h6 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_6 : _GEN_485; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_487 = 5'h7 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_7 : _GEN_486; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_488 = 5'h8 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_8 : _GEN_487; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_489 = 5'h9 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_9 : _GEN_488; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_490 = 5'ha == io_i_rename_req_packs_1_arch_rs1 ? rename_table_10 : _GEN_489; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_491 = 5'hb == io_i_rename_req_packs_1_arch_rs1 ? rename_table_11 : _GEN_490; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_492 = 5'hc == io_i_rename_req_packs_1_arch_rs1 ? rename_table_12 : _GEN_491; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_493 = 5'hd == io_i_rename_req_packs_1_arch_rs1 ? rename_table_13 : _GEN_492; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_494 = 5'he == io_i_rename_req_packs_1_arch_rs1 ? rename_table_14 : _GEN_493; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_495 = 5'hf == io_i_rename_req_packs_1_arch_rs1 ? rename_table_15 : _GEN_494; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_496 = 5'h10 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_16 : _GEN_495; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_497 = 5'h11 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_17 : _GEN_496; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_498 = 5'h12 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_18 : _GEN_497; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_499 = 5'h13 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_19 : _GEN_498; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_500 = 5'h14 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_20 : _GEN_499; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_501 = 5'h15 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_21 : _GEN_500; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_502 = 5'h16 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_22 : _GEN_501; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_503 = 5'h17 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_23 : _GEN_502; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_504 = 5'h18 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_24 : _GEN_503; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_505 = 5'h19 == io_i_rename_req_packs_1_arch_rs1 ? rename_table_25 : _GEN_504; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_506 = 5'h1a == io_i_rename_req_packs_1_arch_rs1 ? rename_table_26 : _GEN_505; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_507 = 5'h1b == io_i_rename_req_packs_1_arch_rs1 ? rename_table_27 : _GEN_506; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_508 = 5'h1c == io_i_rename_req_packs_1_arch_rs1 ? rename_table_28 : _GEN_507; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_509 = 5'h1d == io_i_rename_req_packs_1_arch_rs1 ? rename_table_29 : _GEN_508; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_510 = 5'h1e == io_i_rename_req_packs_1_arch_rs1 ? rename_table_30 : _GEN_509; // @[rename_table.scala 65:{41,41}]
  wire [6:0] _GEN_513 = 5'h1 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_1 : rename_table_0; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_514 = 5'h2 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_2 : _GEN_513; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_515 = 5'h3 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_3 : _GEN_514; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_516 = 5'h4 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_4 : _GEN_515; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_517 = 5'h5 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_5 : _GEN_516; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_518 = 5'h6 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_6 : _GEN_517; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_519 = 5'h7 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_7 : _GEN_518; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_520 = 5'h8 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_8 : _GEN_519; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_521 = 5'h9 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_9 : _GEN_520; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_522 = 5'ha == io_i_rename_req_packs_1_arch_rs2 ? rename_table_10 : _GEN_521; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_523 = 5'hb == io_i_rename_req_packs_1_arch_rs2 ? rename_table_11 : _GEN_522; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_524 = 5'hc == io_i_rename_req_packs_1_arch_rs2 ? rename_table_12 : _GEN_523; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_525 = 5'hd == io_i_rename_req_packs_1_arch_rs2 ? rename_table_13 : _GEN_524; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_526 = 5'he == io_i_rename_req_packs_1_arch_rs2 ? rename_table_14 : _GEN_525; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_527 = 5'hf == io_i_rename_req_packs_1_arch_rs2 ? rename_table_15 : _GEN_526; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_528 = 5'h10 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_16 : _GEN_527; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_529 = 5'h11 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_17 : _GEN_528; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_530 = 5'h12 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_18 : _GEN_529; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_531 = 5'h13 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_19 : _GEN_530; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_532 = 5'h14 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_20 : _GEN_531; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_533 = 5'h15 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_21 : _GEN_532; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_534 = 5'h16 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_22 : _GEN_533; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_535 = 5'h17 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_23 : _GEN_534; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_536 = 5'h18 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_24 : _GEN_535; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_537 = 5'h19 == io_i_rename_req_packs_1_arch_rs2 ? rename_table_25 : _GEN_536; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_538 = 5'h1a == io_i_rename_req_packs_1_arch_rs2 ? rename_table_26 : _GEN_537; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_539 = 5'h1b == io_i_rename_req_packs_1_arch_rs2 ? rename_table_27 : _GEN_538; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_540 = 5'h1c == io_i_rename_req_packs_1_arch_rs2 ? rename_table_28 : _GEN_539; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_541 = 5'h1d == io_i_rename_req_packs_1_arch_rs2 ? rename_table_29 : _GEN_540; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_542 = 5'h1e == io_i_rename_req_packs_1_arch_rs2 ? rename_table_30 : _GEN_541; // @[rename_table.scala 66:{41,41}]
  wire [6:0] _GEN_545 = 5'h1 == io_i_rename_req_packs_1_arch_dst ? rename_table_1 : rename_table_0; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_546 = 5'h2 == io_i_rename_req_packs_1_arch_dst ? rename_table_2 : _GEN_545; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_547 = 5'h3 == io_i_rename_req_packs_1_arch_dst ? rename_table_3 : _GEN_546; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_548 = 5'h4 == io_i_rename_req_packs_1_arch_dst ? rename_table_4 : _GEN_547; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_549 = 5'h5 == io_i_rename_req_packs_1_arch_dst ? rename_table_5 : _GEN_548; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_550 = 5'h6 == io_i_rename_req_packs_1_arch_dst ? rename_table_6 : _GEN_549; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_551 = 5'h7 == io_i_rename_req_packs_1_arch_dst ? rename_table_7 : _GEN_550; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_552 = 5'h8 == io_i_rename_req_packs_1_arch_dst ? rename_table_8 : _GEN_551; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_553 = 5'h9 == io_i_rename_req_packs_1_arch_dst ? rename_table_9 : _GEN_552; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_554 = 5'ha == io_i_rename_req_packs_1_arch_dst ? rename_table_10 : _GEN_553; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_555 = 5'hb == io_i_rename_req_packs_1_arch_dst ? rename_table_11 : _GEN_554; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_556 = 5'hc == io_i_rename_req_packs_1_arch_dst ? rename_table_12 : _GEN_555; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_557 = 5'hd == io_i_rename_req_packs_1_arch_dst ? rename_table_13 : _GEN_556; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_558 = 5'he == io_i_rename_req_packs_1_arch_dst ? rename_table_14 : _GEN_557; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_559 = 5'hf == io_i_rename_req_packs_1_arch_dst ? rename_table_15 : _GEN_558; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_560 = 5'h10 == io_i_rename_req_packs_1_arch_dst ? rename_table_16 : _GEN_559; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_561 = 5'h11 == io_i_rename_req_packs_1_arch_dst ? rename_table_17 : _GEN_560; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_562 = 5'h12 == io_i_rename_req_packs_1_arch_dst ? rename_table_18 : _GEN_561; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_563 = 5'h13 == io_i_rename_req_packs_1_arch_dst ? rename_table_19 : _GEN_562; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_564 = 5'h14 == io_i_rename_req_packs_1_arch_dst ? rename_table_20 : _GEN_563; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_565 = 5'h15 == io_i_rename_req_packs_1_arch_dst ? rename_table_21 : _GEN_564; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_566 = 5'h16 == io_i_rename_req_packs_1_arch_dst ? rename_table_22 : _GEN_565; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_567 = 5'h17 == io_i_rename_req_packs_1_arch_dst ? rename_table_23 : _GEN_566; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_568 = 5'h18 == io_i_rename_req_packs_1_arch_dst ? rename_table_24 : _GEN_567; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_569 = 5'h19 == io_i_rename_req_packs_1_arch_dst ? rename_table_25 : _GEN_568; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_570 = 5'h1a == io_i_rename_req_packs_1_arch_dst ? rename_table_26 : _GEN_569; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_571 = 5'h1b == io_i_rename_req_packs_1_arch_dst ? rename_table_27 : _GEN_570; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_572 = 5'h1c == io_i_rename_req_packs_1_arch_dst ? rename_table_28 : _GEN_571; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_573 = 5'h1d == io_i_rename_req_packs_1_arch_dst ? rename_table_29 : _GEN_572; // @[rename_table.scala 67:{41,41}]
  wire [6:0] _GEN_574 = 5'h1e == io_i_rename_req_packs_1_arch_dst ? rename_table_30 : _GEN_573; // @[rename_table.scala 67:{41,41}]
  assign io_o_rename_res_packs_0_phy_rs1 = 5'h1f == io_i_rename_req_packs_0_arch_rs1 ? rename_table_31 : _GEN_414; // @[rename_table.scala 65:{41,41}]
  assign io_o_rename_res_packs_0_phy_rs2 = 5'h1f == io_i_rename_req_packs_0_arch_rs2 ? rename_table_31 : _GEN_446; // @[rename_table.scala 66:{41,41}]
  assign io_o_rename_res_packs_0_phy_dst = 5'h1f == io_i_rename_req_packs_0_arch_dst ? rename_table_31 : _GEN_478; // @[rename_table.scala 67:{41,41}]
  assign io_o_rename_res_packs_1_phy_rs1 = 5'h1f == io_i_rename_req_packs_1_arch_rs1 ? rename_table_31 : _GEN_510; // @[rename_table.scala 65:{41,41}]
  assign io_o_rename_res_packs_1_phy_rs2 = 5'h1f == io_i_rename_req_packs_1_arch_rs2 ? rename_table_31 : _GEN_542; // @[rename_table.scala 66:{41,41}]
  assign io_o_rename_res_packs_1_phy_dst = 5'h1f == io_i_rename_req_packs_1_arch_dst ? rename_table_31 : _GEN_574; // @[rename_table.scala 67:{41,41}]
  assign io_o_commit_rename_table_0 = commit_rename_table_0; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_1 = commit_rename_table_1; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_2 = commit_rename_table_2; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_3 = commit_rename_table_3; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_4 = commit_rename_table_4; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_5 = commit_rename_table_5; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_6 = commit_rename_table_6; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_7 = commit_rename_table_7; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_8 = commit_rename_table_8; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_9 = commit_rename_table_9; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_10 = commit_rename_table_10; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_11 = commit_rename_table_11; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_12 = commit_rename_table_12; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_13 = commit_rename_table_13; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_14 = commit_rename_table_14; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_15 = commit_rename_table_15; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_16 = commit_rename_table_16; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_17 = commit_rename_table_17; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_18 = commit_rename_table_18; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_19 = commit_rename_table_19; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_20 = commit_rename_table_20; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_21 = commit_rename_table_21; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_22 = commit_rename_table_22; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_23 = commit_rename_table_23; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_24 = commit_rename_table_24; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_25 = commit_rename_table_25; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_26 = commit_rename_table_26; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_27 = commit_rename_table_27; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_28 = commit_rename_table_28; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_29 = commit_rename_table_29; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_30 = commit_rename_table_30; // @[rename_table.scala 41:29]
  assign io_o_commit_rename_table_31 = commit_rename_table_31; // @[rename_table.scala 41:29]
  always @(posedge clock) begin
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_0 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_0 <= commit_rename_table_0; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h0 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_0 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_0 <= _GEN_288;
      end
    end else begin
      rename_table_0 <= _GEN_288;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_1 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_1 <= commit_rename_table_1; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_1 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_1 <= _GEN_289;
      end
    end else begin
      rename_table_1 <= _GEN_289;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_2 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_2 <= commit_rename_table_2; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h2 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_2 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_2 <= _GEN_290;
      end
    end else begin
      rename_table_2 <= _GEN_290;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_3 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_3 <= commit_rename_table_3; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h3 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_3 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_3 <= _GEN_291;
      end
    end else begin
      rename_table_3 <= _GEN_291;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_4 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_4 <= commit_rename_table_4; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h4 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_4 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_4 <= _GEN_292;
      end
    end else begin
      rename_table_4 <= _GEN_292;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_5 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_5 <= commit_rename_table_5; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h5 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_5 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_5 <= _GEN_293;
      end
    end else begin
      rename_table_5 <= _GEN_293;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_6 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_6 <= commit_rename_table_6; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h6 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_6 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_6 <= _GEN_294;
      end
    end else begin
      rename_table_6 <= _GEN_294;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_7 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_7 <= commit_rename_table_7; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h7 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_7 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_7 <= _GEN_295;
      end
    end else begin
      rename_table_7 <= _GEN_295;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_8 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_8 <= commit_rename_table_8; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h8 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_8 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_8 <= _GEN_296;
      end
    end else begin
      rename_table_8 <= _GEN_296;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_9 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_9 <= commit_rename_table_9; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h9 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_9 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_9 <= _GEN_297;
      end
    end else begin
      rename_table_9 <= _GEN_297;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_10 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_10 <= commit_rename_table_10; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'ha == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_10 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_10 <= _GEN_298;
      end
    end else begin
      rename_table_10 <= _GEN_298;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_11 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_11 <= commit_rename_table_11; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'hb == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_11 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_11 <= _GEN_299;
      end
    end else begin
      rename_table_11 <= _GEN_299;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_12 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_12 <= commit_rename_table_12; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'hc == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_12 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_12 <= _GEN_300;
      end
    end else begin
      rename_table_12 <= _GEN_300;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_13 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_13 <= commit_rename_table_13; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'hd == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_13 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_13 <= _GEN_301;
      end
    end else begin
      rename_table_13 <= _GEN_301;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_14 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_14 <= commit_rename_table_14; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'he == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_14 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_14 <= _GEN_302;
      end
    end else begin
      rename_table_14 <= _GEN_302;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_15 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_15 <= commit_rename_table_15; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'hf == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_15 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_15 <= _GEN_303;
      end
    end else begin
      rename_table_15 <= _GEN_303;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_16 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_16 <= commit_rename_table_16; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h10 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_16 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_16 <= _GEN_304;
      end
    end else begin
      rename_table_16 <= _GEN_304;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_17 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_17 <= commit_rename_table_17; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h11 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_17 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_17 <= _GEN_305;
      end
    end else begin
      rename_table_17 <= _GEN_305;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_18 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_18 <= commit_rename_table_18; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h12 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_18 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_18 <= _GEN_306;
      end
    end else begin
      rename_table_18 <= _GEN_306;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_19 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_19 <= commit_rename_table_19; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h13 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_19 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_19 <= _GEN_307;
      end
    end else begin
      rename_table_19 <= _GEN_307;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_20 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_20 <= commit_rename_table_20; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h14 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_20 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_20 <= _GEN_308;
      end
    end else begin
      rename_table_20 <= _GEN_308;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_21 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_21 <= commit_rename_table_21; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h15 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_21 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_21 <= _GEN_309;
      end
    end else begin
      rename_table_21 <= _GEN_309;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_22 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_22 <= commit_rename_table_22; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h16 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_22 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_22 <= _GEN_310;
      end
    end else begin
      rename_table_22 <= _GEN_310;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_23 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_23 <= commit_rename_table_23; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h17 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_23 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_23 <= _GEN_311;
      end
    end else begin
      rename_table_23 <= _GEN_311;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_24 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_24 <= commit_rename_table_24; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h18 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_24 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_24 <= _GEN_312;
      end
    end else begin
      rename_table_24 <= _GEN_312;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_25 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_25 <= commit_rename_table_25; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h19 == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_25 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_25 <= _GEN_313;
      end
    end else begin
      rename_table_25 <= _GEN_313;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_26 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_26 <= commit_rename_table_26; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1a == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_26 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_26 <= _GEN_314;
      end
    end else begin
      rename_table_26 <= _GEN_314;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_27 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_27 <= commit_rename_table_27; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1b == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_27 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_27 <= _GEN_315;
      end
    end else begin
      rename_table_27 <= _GEN_315;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_28 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_28 <= commit_rename_table_28; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1c == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_28 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_28 <= _GEN_316;
      end
    end else begin
      rename_table_28 <= _GEN_316;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_29 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_29 <= commit_rename_table_29; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1d == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_29 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_29 <= _GEN_317;
      end
    end else begin
      rename_table_29 <= _GEN_317;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_30 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_30 <= commit_rename_table_30; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1e == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_30 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_30 <= _GEN_318;
      end
    end else begin
      rename_table_30 <= _GEN_318;
    end
    if (reset) begin // @[rename_table.scala 39:31]
      rename_table_31 <= 7'h0; // @[rename_table.scala 39:31]
    end else if (io_i_exception) begin // @[rename_table.scala 71:25]
      rename_table_31 <= commit_rename_table_31; // @[rename_table.scala 72:21]
    end else if (io_i_allocation_pack_1_valid & io_i_allocation_pack_1_arch_dst != 5'h0) begin // @[rename_table.scala 59:84]
      if (5'h1f == io_i_allocation_pack_1_arch_dst) begin // @[rename_table.scala 60:55]
        rename_table_31 <= io_i_allocation_pack_1_phy_dst; // @[rename_table.scala 60:55]
      end else begin
        rename_table_31 <= _GEN_319;
      end
    end else begin
      rename_table_31 <= _GEN_319;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_0 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h0 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_0 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_0 <= _GEN_32;
      end
    end else begin
      commit_rename_table_0 <= _GEN_32;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_1 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_1 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_1 <= _GEN_33;
      end
    end else begin
      commit_rename_table_1 <= _GEN_33;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_2 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h2 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_2 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_2 <= _GEN_34;
      end
    end else begin
      commit_rename_table_2 <= _GEN_34;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_3 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h3 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_3 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_3 <= _GEN_35;
      end
    end else begin
      commit_rename_table_3 <= _GEN_35;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_4 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h4 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_4 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_4 <= _GEN_36;
      end
    end else begin
      commit_rename_table_4 <= _GEN_36;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_5 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h5 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_5 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_5 <= _GEN_37;
      end
    end else begin
      commit_rename_table_5 <= _GEN_37;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_6 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h6 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_6 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_6 <= _GEN_38;
      end
    end else begin
      commit_rename_table_6 <= _GEN_38;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_7 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h7 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_7 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_7 <= _GEN_39;
      end
    end else begin
      commit_rename_table_7 <= _GEN_39;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_8 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h8 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_8 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_8 <= _GEN_40;
      end
    end else begin
      commit_rename_table_8 <= _GEN_40;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_9 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h9 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_9 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_9 <= _GEN_41;
      end
    end else begin
      commit_rename_table_9 <= _GEN_41;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_10 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'ha == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_10 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_10 <= _GEN_42;
      end
    end else begin
      commit_rename_table_10 <= _GEN_42;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_11 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'hb == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_11 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_11 <= _GEN_43;
      end
    end else begin
      commit_rename_table_11 <= _GEN_43;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_12 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'hc == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_12 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_12 <= _GEN_44;
      end
    end else begin
      commit_rename_table_12 <= _GEN_44;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_13 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'hd == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_13 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_13 <= _GEN_45;
      end
    end else begin
      commit_rename_table_13 <= _GEN_45;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_14 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'he == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_14 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_14 <= _GEN_46;
      end
    end else begin
      commit_rename_table_14 <= _GEN_46;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_15 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'hf == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_15 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_15 <= _GEN_47;
      end
    end else begin
      commit_rename_table_15 <= _GEN_47;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_16 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h10 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_16 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_16 <= _GEN_48;
      end
    end else begin
      commit_rename_table_16 <= _GEN_48;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_17 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h11 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_17 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_17 <= _GEN_49;
      end
    end else begin
      commit_rename_table_17 <= _GEN_49;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_18 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h12 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_18 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_18 <= _GEN_50;
      end
    end else begin
      commit_rename_table_18 <= _GEN_50;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_19 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h13 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_19 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_19 <= _GEN_51;
      end
    end else begin
      commit_rename_table_19 <= _GEN_51;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_20 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h14 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_20 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_20 <= _GEN_52;
      end
    end else begin
      commit_rename_table_20 <= _GEN_52;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_21 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h15 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_21 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_21 <= _GEN_53;
      end
    end else begin
      commit_rename_table_21 <= _GEN_53;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_22 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h16 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_22 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_22 <= _GEN_54;
      end
    end else begin
      commit_rename_table_22 <= _GEN_54;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_23 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h17 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_23 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_23 <= _GEN_55;
      end
    end else begin
      commit_rename_table_23 <= _GEN_55;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_24 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h18 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_24 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_24 <= _GEN_56;
      end
    end else begin
      commit_rename_table_24 <= _GEN_56;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_25 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h19 == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_25 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_25 <= _GEN_57;
      end
    end else begin
      commit_rename_table_25 <= _GEN_57;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_26 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1a == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_26 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_26 <= _GEN_58;
      end
    end else begin
      commit_rename_table_26 <= _GEN_58;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_27 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1b == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_27 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_27 <= _GEN_59;
      end
    end else begin
      commit_rename_table_27 <= _GEN_59;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_28 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1c == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_28 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_28 <= _GEN_60;
      end
    end else begin
      commit_rename_table_28 <= _GEN_60;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_29 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1d == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_29 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_29 <= _GEN_61;
      end
    end else begin
      commit_rename_table_29 <= _GEN_61;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_30 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1e == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_30 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_30 <= _GEN_62;
      end
    end else begin
      commit_rename_table_30 <= _GEN_62;
    end
    if (reset) begin // @[rename_table.scala 40:38]
      commit_rename_table_31 <= 7'h0; // @[rename_table.scala 40:38]
    end else if (io_i_commit_packs_1_valid) begin // @[rename_table.scala 47:37]
      if (5'h1f == io_i_commit_packs_1_uop_arch_dst) begin // @[rename_table.scala 48:63]
        commit_rename_table_31 <= io_i_commit_packs_1_uop_phy_dst; // @[rename_table.scala 48:63]
      end else begin
        commit_rename_table_31 <= _GEN_63;
      end
    end else begin
      commit_rename_table_31 <= _GEN_63;
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
  rename_table_0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  rename_table_1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  rename_table_2 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  rename_table_3 = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  rename_table_4 = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  rename_table_5 = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  rename_table_6 = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  rename_table_7 = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  rename_table_8 = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  rename_table_9 = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  rename_table_10 = _RAND_10[6:0];
  _RAND_11 = {1{`RANDOM}};
  rename_table_11 = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  rename_table_12 = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  rename_table_13 = _RAND_13[6:0];
  _RAND_14 = {1{`RANDOM}};
  rename_table_14 = _RAND_14[6:0];
  _RAND_15 = {1{`RANDOM}};
  rename_table_15 = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  rename_table_16 = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  rename_table_17 = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  rename_table_18 = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  rename_table_19 = _RAND_19[6:0];
  _RAND_20 = {1{`RANDOM}};
  rename_table_20 = _RAND_20[6:0];
  _RAND_21 = {1{`RANDOM}};
  rename_table_21 = _RAND_21[6:0];
  _RAND_22 = {1{`RANDOM}};
  rename_table_22 = _RAND_22[6:0];
  _RAND_23 = {1{`RANDOM}};
  rename_table_23 = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  rename_table_24 = _RAND_24[6:0];
  _RAND_25 = {1{`RANDOM}};
  rename_table_25 = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  rename_table_26 = _RAND_26[6:0];
  _RAND_27 = {1{`RANDOM}};
  rename_table_27 = _RAND_27[6:0];
  _RAND_28 = {1{`RANDOM}};
  rename_table_28 = _RAND_28[6:0];
  _RAND_29 = {1{`RANDOM}};
  rename_table_29 = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  rename_table_30 = _RAND_30[6:0];
  _RAND_31 = {1{`RANDOM}};
  rename_table_31 = _RAND_31[6:0];
  _RAND_32 = {1{`RANDOM}};
  commit_rename_table_0 = _RAND_32[6:0];
  _RAND_33 = {1{`RANDOM}};
  commit_rename_table_1 = _RAND_33[6:0];
  _RAND_34 = {1{`RANDOM}};
  commit_rename_table_2 = _RAND_34[6:0];
  _RAND_35 = {1{`RANDOM}};
  commit_rename_table_3 = _RAND_35[6:0];
  _RAND_36 = {1{`RANDOM}};
  commit_rename_table_4 = _RAND_36[6:0];
  _RAND_37 = {1{`RANDOM}};
  commit_rename_table_5 = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  commit_rename_table_6 = _RAND_38[6:0];
  _RAND_39 = {1{`RANDOM}};
  commit_rename_table_7 = _RAND_39[6:0];
  _RAND_40 = {1{`RANDOM}};
  commit_rename_table_8 = _RAND_40[6:0];
  _RAND_41 = {1{`RANDOM}};
  commit_rename_table_9 = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  commit_rename_table_10 = _RAND_42[6:0];
  _RAND_43 = {1{`RANDOM}};
  commit_rename_table_11 = _RAND_43[6:0];
  _RAND_44 = {1{`RANDOM}};
  commit_rename_table_12 = _RAND_44[6:0];
  _RAND_45 = {1{`RANDOM}};
  commit_rename_table_13 = _RAND_45[6:0];
  _RAND_46 = {1{`RANDOM}};
  commit_rename_table_14 = _RAND_46[6:0];
  _RAND_47 = {1{`RANDOM}};
  commit_rename_table_15 = _RAND_47[6:0];
  _RAND_48 = {1{`RANDOM}};
  commit_rename_table_16 = _RAND_48[6:0];
  _RAND_49 = {1{`RANDOM}};
  commit_rename_table_17 = _RAND_49[6:0];
  _RAND_50 = {1{`RANDOM}};
  commit_rename_table_18 = _RAND_50[6:0];
  _RAND_51 = {1{`RANDOM}};
  commit_rename_table_19 = _RAND_51[6:0];
  _RAND_52 = {1{`RANDOM}};
  commit_rename_table_20 = _RAND_52[6:0];
  _RAND_53 = {1{`RANDOM}};
  commit_rename_table_21 = _RAND_53[6:0];
  _RAND_54 = {1{`RANDOM}};
  commit_rename_table_22 = _RAND_54[6:0];
  _RAND_55 = {1{`RANDOM}};
  commit_rename_table_23 = _RAND_55[6:0];
  _RAND_56 = {1{`RANDOM}};
  commit_rename_table_24 = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  commit_rename_table_25 = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  commit_rename_table_26 = _RAND_58[6:0];
  _RAND_59 = {1{`RANDOM}};
  commit_rename_table_27 = _RAND_59[6:0];
  _RAND_60 = {1{`RANDOM}};
  commit_rename_table_28 = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  commit_rename_table_29 = _RAND_61[6:0];
  _RAND_62 = {1{`RANDOM}};
  commit_rename_table_30 = _RAND_62[6:0];
  _RAND_63 = {1{`RANDOM}};
  commit_rename_table_31 = _RAND_63[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
