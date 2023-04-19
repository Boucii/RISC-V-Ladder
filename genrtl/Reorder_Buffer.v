module Reorder_Buffer(
  input         clock,
  input         reset,
  output        io_o_full,
  input         io_i_rob_allocation_reqs_0_valid,
  input         io_i_rob_allocation_reqs_0_uop_valid,
  input  [31:0] io_i_rob_allocation_reqs_0_uop_pc,
  input  [31:0] io_i_rob_allocation_reqs_0_uop_inst,
  input  [6:0]  io_i_rob_allocation_reqs_0_uop_func_code,
  input         io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid,
  input  [63:0] io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target,
  input  [3:0]  io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type,
  input         io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select,
  input         io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_rob_allocation_reqs_0_uop_phy_dst,
  input  [6:0]  io_i_rob_allocation_reqs_0_uop_stale_dst,
  input  [4:0]  io_i_rob_allocation_reqs_0_uop_arch_dst,
  input  [2:0]  io_i_rob_allocation_reqs_0_uop_inst_type,
  input         io_i_rob_allocation_reqs_0_uop_regWen,
  input         io_i_rob_allocation_reqs_0_uop_src1_valid,
  input  [6:0]  io_i_rob_allocation_reqs_0_uop_phy_rs1,
  input  [4:0]  io_i_rob_allocation_reqs_0_uop_arch_rs1,
  input         io_i_rob_allocation_reqs_0_uop_src2_valid,
  input  [6:0]  io_i_rob_allocation_reqs_0_uop_phy_rs2,
  input  [4:0]  io_i_rob_allocation_reqs_0_uop_arch_rs2,
  input  [63:0] io_i_rob_allocation_reqs_0_uop_imm,
  input  [63:0] io_i_rob_allocation_reqs_0_uop_src1_value,
  input  [63:0] io_i_rob_allocation_reqs_0_uop_src2_value,
  input  [2:0]  io_i_rob_allocation_reqs_0_uop_op1_sel,
  input  [2:0]  io_i_rob_allocation_reqs_0_uop_op2_sel,
  input  [4:0]  io_i_rob_allocation_reqs_0_uop_alu_sel,
  input  [3:0]  io_i_rob_allocation_reqs_0_uop_branch_type,
  input  [2:0]  io_i_rob_allocation_reqs_0_uop_mem_type,
  input         io_i_rob_allocation_reqs_1_valid,
  input         io_i_rob_allocation_reqs_1_uop_valid,
  input  [31:0] io_i_rob_allocation_reqs_1_uop_pc,
  input  [31:0] io_i_rob_allocation_reqs_1_uop_inst,
  input  [6:0]  io_i_rob_allocation_reqs_1_uop_func_code,
  input         io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid,
  input  [63:0] io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target,
  input  [3:0]  io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type,
  input         io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select,
  input         io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_rob_allocation_reqs_1_uop_phy_dst,
  input  [6:0]  io_i_rob_allocation_reqs_1_uop_stale_dst,
  input  [4:0]  io_i_rob_allocation_reqs_1_uop_arch_dst,
  input  [2:0]  io_i_rob_allocation_reqs_1_uop_inst_type,
  input         io_i_rob_allocation_reqs_1_uop_regWen,
  input         io_i_rob_allocation_reqs_1_uop_src1_valid,
  input  [6:0]  io_i_rob_allocation_reqs_1_uop_phy_rs1,
  input  [4:0]  io_i_rob_allocation_reqs_1_uop_arch_rs1,
  input         io_i_rob_allocation_reqs_1_uop_src2_valid,
  input  [6:0]  io_i_rob_allocation_reqs_1_uop_phy_rs2,
  input  [4:0]  io_i_rob_allocation_reqs_1_uop_arch_rs2,
  input  [63:0] io_i_rob_allocation_reqs_1_uop_imm,
  input  [63:0] io_i_rob_allocation_reqs_1_uop_src1_value,
  input  [63:0] io_i_rob_allocation_reqs_1_uop_src2_value,
  input  [2:0]  io_i_rob_allocation_reqs_1_uop_op1_sel,
  input  [2:0]  io_i_rob_allocation_reqs_1_uop_op2_sel,
  input  [4:0]  io_i_rob_allocation_reqs_1_uop_alu_sel,
  input  [3:0]  io_i_rob_allocation_reqs_1_uop_branch_type,
  input  [2:0]  io_i_rob_allocation_reqs_1_uop_mem_type,
  output [3:0]  io_o_rob_allocation_ress_0_rob_idx,
  output [3:0]  io_o_rob_allocation_ress_1_rob_idx,
  output        io_o_rollback_packs_0_valid,
  output [6:0]  io_o_rollback_packs_0_uop_phy_dst,
  output [6:0]  io_o_rollback_packs_0_uop_stale_dst,
  output [4:0]  io_o_rollback_packs_0_uop_arch_dst,
  output        io_o_rollback_packs_1_valid,
  output [6:0]  io_o_rollback_packs_1_uop_phy_dst,
  output [6:0]  io_o_rollback_packs_1_uop_stale_dst,
  output [4:0]  io_o_rollback_packs_1_uop_arch_dst,
  input         io_i_ex_res_packs_0_valid,
  input         io_i_ex_res_packs_0_uop_valid,
  input  [31:0] io_i_ex_res_packs_0_uop_pc,
  input  [31:0] io_i_ex_res_packs_0_uop_inst,
  input  [6:0]  io_i_ex_res_packs_0_uop_func_code,
  input         io_i_ex_res_packs_0_uop_branch_predict_pack_valid,
  input  [63:0] io_i_ex_res_packs_0_uop_branch_predict_pack_target,
  input  [3:0]  io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type,
  input         io_i_ex_res_packs_0_uop_branch_predict_pack_select,
  input         io_i_ex_res_packs_0_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_ex_res_packs_0_uop_phy_dst,
  input  [6:0]  io_i_ex_res_packs_0_uop_stale_dst,
  input  [4:0]  io_i_ex_res_packs_0_uop_arch_dst,
  input  [2:0]  io_i_ex_res_packs_0_uop_inst_type,
  input         io_i_ex_res_packs_0_uop_regWen,
  input         io_i_ex_res_packs_0_uop_src1_valid,
  input  [6:0]  io_i_ex_res_packs_0_uop_phy_rs1,
  input  [4:0]  io_i_ex_res_packs_0_uop_arch_rs1,
  input         io_i_ex_res_packs_0_uop_src2_valid,
  input  [6:0]  io_i_ex_res_packs_0_uop_phy_rs2,
  input  [4:0]  io_i_ex_res_packs_0_uop_arch_rs2,
  input  [3:0]  io_i_ex_res_packs_0_uop_rob_idx,
  input  [63:0] io_i_ex_res_packs_0_uop_imm,
  input  [63:0] io_i_ex_res_packs_0_uop_dst_value,
  input  [63:0] io_i_ex_res_packs_0_uop_src1_value,
  input  [63:0] io_i_ex_res_packs_0_uop_src2_value,
  input  [2:0]  io_i_ex_res_packs_0_uop_op1_sel,
  input  [2:0]  io_i_ex_res_packs_0_uop_op2_sel,
  input  [4:0]  io_i_ex_res_packs_0_uop_alu_sel,
  input  [3:0]  io_i_ex_res_packs_0_uop_branch_type,
  input  [2:0]  io_i_ex_res_packs_0_uop_mem_type,
  input         io_i_ex_res_packs_1_valid,
  input         io_i_ex_res_packs_1_uop_valid,
  input  [31:0] io_i_ex_res_packs_1_uop_pc,
  input  [31:0] io_i_ex_res_packs_1_uop_inst,
  input  [6:0]  io_i_ex_res_packs_1_uop_func_code,
  input         io_i_ex_res_packs_1_uop_branch_predict_pack_valid,
  input  [63:0] io_i_ex_res_packs_1_uop_branch_predict_pack_target,
  input  [3:0]  io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type,
  input         io_i_ex_res_packs_1_uop_branch_predict_pack_select,
  input         io_i_ex_res_packs_1_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_ex_res_packs_1_uop_phy_dst,
  input  [6:0]  io_i_ex_res_packs_1_uop_stale_dst,
  input  [4:0]  io_i_ex_res_packs_1_uop_arch_dst,
  input  [2:0]  io_i_ex_res_packs_1_uop_inst_type,
  input         io_i_ex_res_packs_1_uop_regWen,
  input         io_i_ex_res_packs_1_uop_src1_valid,
  input  [6:0]  io_i_ex_res_packs_1_uop_phy_rs1,
  input  [4:0]  io_i_ex_res_packs_1_uop_arch_rs1,
  input         io_i_ex_res_packs_1_uop_src2_valid,
  input  [6:0]  io_i_ex_res_packs_1_uop_phy_rs2,
  input  [4:0]  io_i_ex_res_packs_1_uop_arch_rs2,
  input  [3:0]  io_i_ex_res_packs_1_uop_rob_idx,
  input  [63:0] io_i_ex_res_packs_1_uop_imm,
  input  [63:0] io_i_ex_res_packs_1_uop_dst_value,
  input  [63:0] io_i_ex_res_packs_1_uop_src1_value,
  input  [63:0] io_i_ex_res_packs_1_uop_src2_value,
  input  [2:0]  io_i_ex_res_packs_1_uop_op1_sel,
  input  [2:0]  io_i_ex_res_packs_1_uop_op2_sel,
  input  [4:0]  io_i_ex_res_packs_1_uop_alu_sel,
  input  [3:0]  io_i_ex_res_packs_1_uop_branch_type,
  input  [2:0]  io_i_ex_res_packs_1_uop_mem_type,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  input  [3:0]  io_i_branch_resolve_pack_rob_idx,
  output        io_o_commit_packs_0_valid,
  output        io_o_commit_packs_0_uop_valid,
  output [31:0] io_o_commit_packs_0_uop_pc,
  output [31:0] io_o_commit_packs_0_uop_inst,
  output [6:0]  io_o_commit_packs_0_uop_func_code,
  output        io_o_commit_packs_0_uop_branch_predict_pack_valid,
  output [63:0] io_o_commit_packs_0_uop_branch_predict_pack_target,
  output [3:0]  io_o_commit_packs_0_uop_branch_predict_pack_branch_type,
  output        io_o_commit_packs_0_uop_branch_predict_pack_select,
  output        io_o_commit_packs_0_uop_branch_predict_pack_taken,
  output [6:0]  io_o_commit_packs_0_uop_phy_dst,
  output [6:0]  io_o_commit_packs_0_uop_stale_dst,
  output [4:0]  io_o_commit_packs_0_uop_arch_dst,
  output [2:0]  io_o_commit_packs_0_uop_inst_type,
  output        io_o_commit_packs_0_uop_regWen,
  output        io_o_commit_packs_0_uop_src1_valid,
  output [6:0]  io_o_commit_packs_0_uop_phy_rs1,
  output [4:0]  io_o_commit_packs_0_uop_arch_rs1,
  output        io_o_commit_packs_0_uop_src2_valid,
  output [6:0]  io_o_commit_packs_0_uop_phy_rs2,
  output [4:0]  io_o_commit_packs_0_uop_arch_rs2,
  output [3:0]  io_o_commit_packs_0_uop_rob_idx,
  output [63:0] io_o_commit_packs_0_uop_imm,
  output [63:0] io_o_commit_packs_0_uop_dst_value,
  output [63:0] io_o_commit_packs_0_uop_src1_value,
  output [63:0] io_o_commit_packs_0_uop_src2_value,
  output [2:0]  io_o_commit_packs_0_uop_op1_sel,
  output [2:0]  io_o_commit_packs_0_uop_op2_sel,
  output [4:0]  io_o_commit_packs_0_uop_alu_sel,
  output [3:0]  io_o_commit_packs_0_uop_branch_type,
  output [2:0]  io_o_commit_packs_0_uop_mem_type,
  output        io_o_commit_packs_1_valid,
  output        io_o_commit_packs_1_uop_valid,
  output [31:0] io_o_commit_packs_1_uop_pc,
  output [31:0] io_o_commit_packs_1_uop_inst,
  output [6:0]  io_o_commit_packs_1_uop_func_code,
  output        io_o_commit_packs_1_uop_branch_predict_pack_valid,
  output [63:0] io_o_commit_packs_1_uop_branch_predict_pack_target,
  output [3:0]  io_o_commit_packs_1_uop_branch_predict_pack_branch_type,
  output        io_o_commit_packs_1_uop_branch_predict_pack_select,
  output        io_o_commit_packs_1_uop_branch_predict_pack_taken,
  output [6:0]  io_o_commit_packs_1_uop_phy_dst,
  output [6:0]  io_o_commit_packs_1_uop_stale_dst,
  output [4:0]  io_o_commit_packs_1_uop_arch_dst,
  output [2:0]  io_o_commit_packs_1_uop_inst_type,
  output        io_o_commit_packs_1_uop_regWen,
  output        io_o_commit_packs_1_uop_src1_valid,
  output [6:0]  io_o_commit_packs_1_uop_phy_rs1,
  output [4:0]  io_o_commit_packs_1_uop_arch_rs1,
  output        io_o_commit_packs_1_uop_src2_valid,
  output [6:0]  io_o_commit_packs_1_uop_phy_rs2,
  output [4:0]  io_o_commit_packs_1_uop_arch_rs2,
  output [3:0]  io_o_commit_packs_1_uop_rob_idx,
  output [63:0] io_o_commit_packs_1_uop_imm,
  output [63:0] io_o_commit_packs_1_uop_dst_value,
  output [63:0] io_o_commit_packs_1_uop_src1_value,
  output [63:0] io_o_commit_packs_1_uop_src2_value,
  output [2:0]  io_o_commit_packs_1_uop_op1_sel,
  output [2:0]  io_o_commit_packs_1_uop_op2_sel,
  output [4:0]  io_o_commit_packs_1_uop_alu_sel,
  output [3:0]  io_o_commit_packs_1_uop_branch_type,
  output [2:0]  io_o_commit_packs_1_uop_mem_type,
  output [3:0]  io_o_rob_head,
  input         io_i_interrupt,
  input         io_i_csr_pc_redirect,
  output        io_o_exception
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
  reg [63:0] _RAND_18;
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
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
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
  reg [63:0] _RAND_48;
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
  reg [63:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [63:0] _RAND_94;
  reg [63:0] _RAND_95;
  reg [63:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [63:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [63:0] _RAND_124;
  reg [63:0] _RAND_125;
  reg [63:0] _RAND_126;
  reg [63:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [63:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [63:0] _RAND_154;
  reg [63:0] _RAND_155;
  reg [63:0] _RAND_156;
  reg [63:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [63:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [63:0] _RAND_184;
  reg [63:0] _RAND_185;
  reg [63:0] _RAND_186;
  reg [63:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [63:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [63:0] _RAND_214;
  reg [63:0] _RAND_215;
  reg [63:0] _RAND_216;
  reg [63:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [63:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [63:0] _RAND_244;
  reg [63:0] _RAND_245;
  reg [63:0] _RAND_246;
  reg [63:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] commit_ptr; // @[rob.scala 48:29]
  reg [3:0] allocate_ptr; // @[rob.scala 49:31]
  reg [1:0] rob_state; // @[rob.scala 55:28]
  reg  last_pc_redirect; // @[rob.scala 57:31]
  wire  need_to_rbk_dispatch = io_i_rob_allocation_reqs_0_valid | io_i_rob_allocation_reqs_1_valid; // @[rob.scala 71:66]
  wire  _next_rob_state_T_2 = rob_state == 2'h0; // @[rob.scala 247:18]
  wire  _next_rob_state_T_3 = rob_state == 2'h1; // @[rob.scala 252:19]
  wire  _next_rob_state_T_4 = rob_state == 2'h3; // @[rob.scala 252:44]
  wire  _next_rob_state_T_7 = (rob_state == 2'h1 | rob_state == 2'h3) & (io_i_branch_resolve_pack_mispred &
    io_i_branch_resolve_pack_valid); // @[rob.scala 252:56]
  wire [3:0] _next_rob_state_T_9 = allocate_ptr - 4'h1; // @[rob.scala 252:170]
  wire  _next_rob_state_T_10 = _next_rob_state_T_9 != io_i_branch_resolve_pack_rob_idx; // @[rob.scala 252:176]
  wire  _next_rob_state_T_12 = (rob_state == 2'h1 | rob_state == 2'h3) & (io_i_branch_resolve_pack_mispred &
    io_i_branch_resolve_pack_valid) & (need_to_rbk_dispatch | _next_rob_state_T_9 != io_i_branch_resolve_pack_rob_idx); // @[rob.scala 252:127]
  wire [3:0] _is_full_T_1 = allocate_ptr + 4'h2; // @[rob.scala 239:31]
  wire [3:0] _is_full_T_6 = allocate_ptr + 4'h1; // @[rob.scala 239:110]
  wire  is_full = _is_full_T_1[2:0] == commit_ptr[2:0] | _is_full_T_6[2:0] == commit_ptr[2:0]; // @[rob.scala 239:92]
  wire  _next_rob_state_T_25 = ~(_next_rob_state_T_7 & _next_rob_state_T_10) & (_next_rob_state_T_3 & is_full); // @[rob.scala 253:192]
  wire  _next_rob_state_T_26 = rob_state == 2'h2; // @[rob.scala 258:18]
  wire [3:0] _next_rob_state_T_28 = io_i_branch_resolve_pack_rob_idx + 4'h1; // @[rob.scala 258:70]
  wire  _next_rob_state_T_30 = rob_state == 2'h2 & _next_rob_state_T_28 == allocate_ptr; // @[rob.scala 258:33]
  reg  will_commit_0; // @[rob.scala 93:30]
  wire  _next_rob_state_T_32 = _next_rob_state_T_4 & will_commit_0; // @[rob.scala 259:29]
  wire [1:0] _next_rob_state_T_33 = _next_rob_state_T_32 ? 2'h1 : rob_state; // @[Mux.scala 101:16]
  wire [1:0] _next_rob_state_T_34 = _next_rob_state_T_30 ? 2'h1 : _next_rob_state_T_33; // @[Mux.scala 101:16]
  wire [1:0] _next_rob_state_T_35 = _next_rob_state_T_25 ? 2'h3 : _next_rob_state_T_34; // @[Mux.scala 101:16]
  wire [1:0] _next_rob_state_T_36 = _next_rob_state_T_12 ? 2'h2 : _next_rob_state_T_35; // @[Mux.scala 101:16]
  wire [1:0] _next_rob_state_T_37 = _next_rob_state_T_2 ? 2'h1 : _next_rob_state_T_36; // @[Mux.scala 101:16]
  wire [1:0] next_rob_state = io_o_exception | io_i_interrupt | last_pc_redirect ? 2'h0 : _next_rob_state_T_37; // @[rob.scala 246:24]
  wire  _this_num_to_roll_back_T = next_rob_state != 2'h2; // @[rob.scala 77:23]
  wire  _this_num_to_roll_back_T_1 = next_rob_state == 2'h2; // @[rob.scala 79:23]
  wire [3:0] _this_num_to_roll_back_T_3 = allocate_ptr - 4'h2; // @[rob.scala 79:55]
  wire  _this_num_to_roll_back_T_5 = next_rob_state == 2'h2 & _this_num_to_roll_back_T_3 ==
    io_i_branch_resolve_pack_rob_idx; // @[rob.scala 79:38]
  wire  _this_num_to_roll_back_T_10 = _this_num_to_roll_back_T_1 & _next_rob_state_T_9 ==
    io_i_branch_resolve_pack_rob_idx; // @[rob.scala 80:38]
  wire [1:0] _this_num_to_roll_back_T_11 = _this_num_to_roll_back_T_10 ? 2'h0 : 2'h2; // @[Mux.scala 101:16]
  wire [1:0] _this_num_to_roll_back_T_12 = _this_num_to_roll_back_T_5 ? 2'h1 : _this_num_to_roll_back_T_11; // @[Mux.scala 101:16]
  wire [1:0] _this_num_to_roll_back_T_13 = _this_num_to_roll_back_T ? 2'h0 : _this_num_to_roll_back_T_12; // @[Mux.scala 101:16]
  reg  rob_valid_0; // @[rob.scala 85:28]
  reg  rob_valid_1; // @[rob.scala 85:28]
  reg  rob_valid_2; // @[rob.scala 85:28]
  reg  rob_valid_3; // @[rob.scala 85:28]
  reg  rob_valid_4; // @[rob.scala 85:28]
  reg  rob_valid_5; // @[rob.scala 85:28]
  reg  rob_valid_6; // @[rob.scala 85:28]
  reg  rob_valid_7; // @[rob.scala 85:28]
  reg  rob_uop_0_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_0_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_0_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_0_func_code; // @[rob.scala 86:26]
  reg  rob_uop_0_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_0_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_0_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_0_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_0_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_0_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_0_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_0_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_0_regWen; // @[rob.scala 86:26]
  reg  rob_uop_0_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_0_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_0_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_0_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_0_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_0_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_0_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_0_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_0_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_0_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_0_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_0_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_0_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_0_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_0_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_0_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_1_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_1_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_1_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_1_func_code; // @[rob.scala 86:26]
  reg  rob_uop_1_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_1_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_1_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_1_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_1_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_1_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_1_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_1_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_1_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_1_regWen; // @[rob.scala 86:26]
  reg  rob_uop_1_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_1_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_1_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_1_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_1_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_1_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_1_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_1_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_1_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_1_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_1_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_1_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_1_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_1_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_1_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_1_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_2_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_2_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_2_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_2_func_code; // @[rob.scala 86:26]
  reg  rob_uop_2_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_2_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_2_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_2_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_2_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_2_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_2_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_2_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_2_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_2_regWen; // @[rob.scala 86:26]
  reg  rob_uop_2_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_2_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_2_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_2_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_2_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_2_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_2_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_2_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_2_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_2_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_2_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_2_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_2_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_2_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_2_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_2_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_3_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_3_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_3_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_3_func_code; // @[rob.scala 86:26]
  reg  rob_uop_3_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_3_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_3_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_3_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_3_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_3_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_3_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_3_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_3_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_3_regWen; // @[rob.scala 86:26]
  reg  rob_uop_3_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_3_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_3_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_3_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_3_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_3_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_3_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_3_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_3_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_3_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_3_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_3_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_3_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_3_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_3_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_3_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_4_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_4_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_4_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_4_func_code; // @[rob.scala 86:26]
  reg  rob_uop_4_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_4_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_4_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_4_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_4_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_4_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_4_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_4_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_4_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_4_regWen; // @[rob.scala 86:26]
  reg  rob_uop_4_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_4_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_4_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_4_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_4_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_4_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_4_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_4_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_4_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_4_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_4_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_4_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_4_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_4_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_4_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_4_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_5_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_5_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_5_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_5_func_code; // @[rob.scala 86:26]
  reg  rob_uop_5_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_5_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_5_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_5_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_5_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_5_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_5_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_5_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_5_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_5_regWen; // @[rob.scala 86:26]
  reg  rob_uop_5_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_5_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_5_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_5_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_5_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_5_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_5_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_5_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_5_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_5_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_5_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_5_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_5_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_5_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_5_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_5_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_6_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_6_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_6_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_6_func_code; // @[rob.scala 86:26]
  reg  rob_uop_6_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_6_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_6_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_6_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_6_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_6_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_6_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_6_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_6_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_6_regWen; // @[rob.scala 86:26]
  reg  rob_uop_6_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_6_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_6_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_6_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_6_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_6_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_6_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_6_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_6_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_6_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_6_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_6_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_6_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_6_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_6_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_6_mem_type; // @[rob.scala 86:26]
  reg  rob_uop_7_valid; // @[rob.scala 86:26]
  reg [31:0] rob_uop_7_pc; // @[rob.scala 86:26]
  reg [31:0] rob_uop_7_inst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_7_func_code; // @[rob.scala 86:26]
  reg  rob_uop_7_branch_predict_pack_valid; // @[rob.scala 86:26]
  reg [63:0] rob_uop_7_branch_predict_pack_target; // @[rob.scala 86:26]
  reg [3:0] rob_uop_7_branch_predict_pack_branch_type; // @[rob.scala 86:26]
  reg  rob_uop_7_branch_predict_pack_select; // @[rob.scala 86:26]
  reg  rob_uop_7_branch_predict_pack_taken; // @[rob.scala 86:26]
  reg [6:0] rob_uop_7_phy_dst; // @[rob.scala 86:26]
  reg [6:0] rob_uop_7_stale_dst; // @[rob.scala 86:26]
  reg [4:0] rob_uop_7_arch_dst; // @[rob.scala 86:26]
  reg [2:0] rob_uop_7_inst_type; // @[rob.scala 86:26]
  reg  rob_uop_7_regWen; // @[rob.scala 86:26]
  reg  rob_uop_7_src1_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_7_phy_rs1; // @[rob.scala 86:26]
  reg [4:0] rob_uop_7_arch_rs1; // @[rob.scala 86:26]
  reg  rob_uop_7_src2_valid; // @[rob.scala 86:26]
  reg [6:0] rob_uop_7_phy_rs2; // @[rob.scala 86:26]
  reg [4:0] rob_uop_7_arch_rs2; // @[rob.scala 86:26]
  reg [3:0] rob_uop_7_rob_idx; // @[rob.scala 86:26]
  reg [63:0] rob_uop_7_imm; // @[rob.scala 86:26]
  reg [63:0] rob_uop_7_dst_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_7_src1_value; // @[rob.scala 86:26]
  reg [63:0] rob_uop_7_src2_value; // @[rob.scala 86:26]
  reg [2:0] rob_uop_7_op1_sel; // @[rob.scala 86:26]
  reg [2:0] rob_uop_7_op2_sel; // @[rob.scala 86:26]
  reg [4:0] rob_uop_7_alu_sel; // @[rob.scala 86:26]
  reg [3:0] rob_uop_7_branch_type; // @[rob.scala 86:26]
  reg [2:0] rob_uop_7_mem_type; // @[rob.scala 86:26]
  reg  rob_done_0; // @[rob.scala 88:27]
  reg  rob_done_1; // @[rob.scala 88:27]
  reg  rob_done_2; // @[rob.scala 88:27]
  reg  rob_done_3; // @[rob.scala 88:27]
  reg  rob_done_4; // @[rob.scala 88:27]
  reg  rob_done_5; // @[rob.scala 88:27]
  reg  rob_done_6; // @[rob.scala 88:27]
  reg  rob_done_7; // @[rob.scala 88:27]
  wire  _GEN_1 = 3'h1 == commit_ptr[2:0] ? rob_valid_1 : rob_valid_0; // @[rob.scala 100:{51,51}]
  wire  _GEN_2 = 3'h2 == commit_ptr[2:0] ? rob_valid_2 : _GEN_1; // @[rob.scala 100:{51,51}]
  wire  _GEN_3 = 3'h3 == commit_ptr[2:0] ? rob_valid_3 : _GEN_2; // @[rob.scala 100:{51,51}]
  wire  _GEN_4 = 3'h4 == commit_ptr[2:0] ? rob_valid_4 : _GEN_3; // @[rob.scala 100:{51,51}]
  wire  _GEN_5 = 3'h5 == commit_ptr[2:0] ? rob_valid_5 : _GEN_4; // @[rob.scala 100:{51,51}]
  wire  _GEN_6 = 3'h6 == commit_ptr[2:0] ? rob_valid_6 : _GEN_5; // @[rob.scala 100:{51,51}]
  wire  _GEN_7 = 3'h7 == commit_ptr[2:0] ? rob_valid_7 : _GEN_6; // @[rob.scala 100:{51,51}]
  wire  _GEN_9 = 3'h1 == commit_ptr[2:0] ? rob_done_1 : rob_done_0; // @[rob.scala 100:{51,51}]
  wire  _GEN_10 = 3'h2 == commit_ptr[2:0] ? rob_done_2 : _GEN_9; // @[rob.scala 100:{51,51}]
  wire  _GEN_11 = 3'h3 == commit_ptr[2:0] ? rob_done_3 : _GEN_10; // @[rob.scala 100:{51,51}]
  wire  _GEN_12 = 3'h4 == commit_ptr[2:0] ? rob_done_4 : _GEN_11; // @[rob.scala 100:{51,51}]
  wire  _GEN_13 = 3'h5 == commit_ptr[2:0] ? rob_done_5 : _GEN_12; // @[rob.scala 100:{51,51}]
  wire  _GEN_14 = 3'h6 == commit_ptr[2:0] ? rob_done_6 : _GEN_13; // @[rob.scala 100:{51,51}]
  wire  _GEN_15 = 3'h7 == commit_ptr[2:0] ? rob_done_7 : _GEN_14; // @[rob.scala 100:{51,51}]
  wire  next_can_commit_0 = _GEN_7 & _GEN_15; // @[rob.scala 100:51]
  wire [3:0] _next_can_commit_1_T_1 = commit_ptr + 4'h1; // @[rob.scala 101:47]
  wire  _GEN_17 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_valid_1 : rob_valid_0; // @[rob.scala 101:{53,53}]
  wire  _GEN_18 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_valid_2 : _GEN_17; // @[rob.scala 101:{53,53}]
  wire  _GEN_19 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_valid_3 : _GEN_18; // @[rob.scala 101:{53,53}]
  wire  _GEN_20 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_valid_4 : _GEN_19; // @[rob.scala 101:{53,53}]
  wire  _GEN_21 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_valid_5 : _GEN_20; // @[rob.scala 101:{53,53}]
  wire  _GEN_22 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_valid_6 : _GEN_21; // @[rob.scala 101:{53,53}]
  wire  _GEN_23 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_valid_7 : _GEN_22; // @[rob.scala 101:{53,53}]
  wire  _GEN_25 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_done_1 : rob_done_0; // @[rob.scala 101:{53,53}]
  wire  _GEN_26 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_done_2 : _GEN_25; // @[rob.scala 101:{53,53}]
  wire  _GEN_27 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_done_3 : _GEN_26; // @[rob.scala 101:{53,53}]
  wire  _GEN_28 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_done_4 : _GEN_27; // @[rob.scala 101:{53,53}]
  wire  _GEN_29 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_done_5 : _GEN_28; // @[rob.scala 101:{53,53}]
  wire  _GEN_30 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_done_6 : _GEN_29; // @[rob.scala 101:{53,53}]
  wire  _GEN_31 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_done_7 : _GEN_30; // @[rob.scala 101:{53,53}]
  wire  next_can_commit_1 = _GEN_23 & _GEN_31; // @[rob.scala 101:53]
  wire  _next_will_commit_0_T = ~io_i_interrupt; // @[rob.scala 103:28]
  wire  _next_will_commit_0_T_5 = next_rob_state == 2'h1; // @[rob.scala 103:114]
  wire  _next_will_commit_0_T_6 = next_rob_state == 2'h3; // @[rob.scala 103:143]
  wire  _next_will_commit_0_T_7 = next_rob_state == 2'h1 | next_rob_state == 2'h3; // @[rob.scala 103:126]
  wire  next_will_commit_0 = ~io_i_interrupt & next_can_commit_0 & (next_rob_state == 2'h1 | next_rob_state == 2'h3); // @[rob.scala 103:96]
  wire [6:0] _GEN_41 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_func_code : rob_uop_0_func_code; // @[rob.scala 104:{83,83}]
  wire [6:0] _GEN_42 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_func_code : _GEN_41; // @[rob.scala 104:{83,83}]
  wire [6:0] _GEN_43 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_func_code : _GEN_42; // @[rob.scala 104:{83,83}]
  wire [6:0] _GEN_44 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_func_code : _GEN_43; // @[rob.scala 104:{83,83}]
  wire [6:0] _GEN_45 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_func_code : _GEN_44; // @[rob.scala 104:{83,83}]
  wire [6:0] _GEN_46 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_func_code : _GEN_45; // @[rob.scala 104:{83,83}]
  wire [6:0] _GEN_47 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_func_code : _GEN_46; // @[rob.scala 104:{83,83}]
  wire [4:0] _GEN_49 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_alu_sel : rob_uop_0_alu_sel; // @[rob.scala 105:{43,43}]
  wire [4:0] _GEN_50 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_alu_sel : _GEN_49; // @[rob.scala 105:{43,43}]
  wire [4:0] _GEN_51 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_alu_sel : _GEN_50; // @[rob.scala 105:{43,43}]
  wire [4:0] _GEN_52 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_alu_sel : _GEN_51; // @[rob.scala 105:{43,43}]
  wire [4:0] _GEN_53 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_alu_sel : _GEN_52; // @[rob.scala 105:{43,43}]
  wire [4:0] _GEN_54 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_alu_sel : _GEN_53; // @[rob.scala 105:{43,43}]
  wire [4:0] _GEN_55 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_alu_sel : _GEN_54; // @[rob.scala 105:{43,43}]
  wire  _next_will_commit_1_T_18 = _GEN_55 == 5'h4 | _GEN_55 == 5'h6 | _GEN_55 == 5'h5; // @[rob.scala 105:110]
  wire  _next_will_commit_1_T_21 = _next_will_commit_0_T & ~(_GEN_47 == 7'h20 & _next_will_commit_1_T_18); // @[rob.scala 104:44]
  wire [6:0] _GEN_73 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_func_code : rob_uop_0_func_code; // @[rob.scala 106:{41,41}]
  wire [6:0] _GEN_74 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_func_code : _GEN_73; // @[rob.scala 106:{41,41}]
  wire [6:0] _GEN_75 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_func_code : _GEN_74; // @[rob.scala 106:{41,41}]
  wire [6:0] _GEN_76 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_func_code : _GEN_75; // @[rob.scala 106:{41,41}]
  wire [6:0] _GEN_77 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_func_code : _GEN_76; // @[rob.scala 106:{41,41}]
  wire [6:0] _GEN_78 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_func_code : _GEN_77; // @[rob.scala 106:{41,41}]
  wire [6:0] _GEN_79 = 3'h7 == commit_ptr[2:0] ? rob_uop_7_func_code : _GEN_78; // @[rob.scala 106:{41,41}]
  wire  _next_will_commit_1_T_24 = ~(_GEN_79 == 7'h20); // @[rob.scala 106:9]
  wire  _next_will_commit_1_T_25 = _next_will_commit_1_T_21 & _next_will_commit_1_T_24; // @[rob.scala 105:162]
  wire  next_will_commit_1 = _next_will_commit_1_T_25 & next_can_commit_0 & next_can_commit_1 & _next_will_commit_0_T_7; // @[rob.scala 107:114]
  wire  _GEN_97 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_valid : rob_uop_0_valid; // @[rob.scala 113:{32,32}]
  wire  _GEN_98 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_valid : _GEN_97; // @[rob.scala 113:{32,32}]
  wire  _GEN_99 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_valid : _GEN_98; // @[rob.scala 113:{32,32}]
  wire  _GEN_100 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_valid : _GEN_99; // @[rob.scala 113:{32,32}]
  wire  _GEN_101 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_valid : _GEN_100; // @[rob.scala 113:{32,32}]
  wire  _GEN_102 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_valid : _GEN_101; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_105 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_pc : rob_uop_0_pc; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_106 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_pc : _GEN_105; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_107 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_pc : _GEN_106; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_108 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_pc : _GEN_107; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_109 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_pc : _GEN_108; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_110 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_pc : _GEN_109; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_113 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_inst : rob_uop_0_inst; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_114 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_inst : _GEN_113; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_115 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_inst : _GEN_114; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_116 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_inst : _GEN_115; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_117 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_inst : _GEN_116; // @[rob.scala 113:{32,32}]
  wire [31:0] _GEN_118 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_inst : _GEN_117; // @[rob.scala 113:{32,32}]
  wire  _GEN_129 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_branch_predict_pack_valid : rob_uop_0_branch_predict_pack_valid; // @[rob.scala 113:{32,32}]
  wire  _GEN_130 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_branch_predict_pack_valid : _GEN_129; // @[rob.scala 113:{32,32}]
  wire  _GEN_131 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_branch_predict_pack_valid : _GEN_130; // @[rob.scala 113:{32,32}]
  wire  _GEN_132 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_branch_predict_pack_valid : _GEN_131; // @[rob.scala 113:{32,32}]
  wire  _GEN_133 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_branch_predict_pack_valid : _GEN_132; // @[rob.scala 113:{32,32}]
  wire  _GEN_134 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_branch_predict_pack_valid : _GEN_133; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_137 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_branch_predict_pack_target :
    rob_uop_0_branch_predict_pack_target; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_138 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_branch_predict_pack_target : _GEN_137; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_139 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_branch_predict_pack_target : _GEN_138; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_140 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_branch_predict_pack_target : _GEN_139; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_141 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_branch_predict_pack_target : _GEN_140; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_142 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_branch_predict_pack_target : _GEN_141; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_145 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_branch_predict_pack_branch_type :
    rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_146 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_branch_predict_pack_branch_type : _GEN_145; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_147 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_branch_predict_pack_branch_type : _GEN_146; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_148 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_branch_predict_pack_branch_type : _GEN_147; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_149 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_branch_predict_pack_branch_type : _GEN_148; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_150 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_branch_predict_pack_branch_type : _GEN_149; // @[rob.scala 113:{32,32}]
  wire  _GEN_153 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_branch_predict_pack_select : rob_uop_0_branch_predict_pack_select
    ; // @[rob.scala 113:{32,32}]
  wire  _GEN_154 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_branch_predict_pack_select : _GEN_153; // @[rob.scala 113:{32,32}]
  wire  _GEN_155 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_branch_predict_pack_select : _GEN_154; // @[rob.scala 113:{32,32}]
  wire  _GEN_156 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_branch_predict_pack_select : _GEN_155; // @[rob.scala 113:{32,32}]
  wire  _GEN_157 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_branch_predict_pack_select : _GEN_156; // @[rob.scala 113:{32,32}]
  wire  _GEN_158 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_branch_predict_pack_select : _GEN_157; // @[rob.scala 113:{32,32}]
  wire  _GEN_161 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_branch_predict_pack_taken : rob_uop_0_branch_predict_pack_taken; // @[rob.scala 113:{32,32}]
  wire  _GEN_162 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_branch_predict_pack_taken : _GEN_161; // @[rob.scala 113:{32,32}]
  wire  _GEN_163 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_branch_predict_pack_taken : _GEN_162; // @[rob.scala 113:{32,32}]
  wire  _GEN_164 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_branch_predict_pack_taken : _GEN_163; // @[rob.scala 113:{32,32}]
  wire  _GEN_165 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_branch_predict_pack_taken : _GEN_164; // @[rob.scala 113:{32,32}]
  wire  _GEN_166 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_branch_predict_pack_taken : _GEN_165; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_169 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_phy_dst : rob_uop_0_phy_dst; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_170 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_phy_dst : _GEN_169; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_171 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_phy_dst : _GEN_170; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_172 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_phy_dst : _GEN_171; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_173 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_phy_dst : _GEN_172; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_174 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_phy_dst : _GEN_173; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_177 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_stale_dst : rob_uop_0_stale_dst; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_178 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_stale_dst : _GEN_177; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_179 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_stale_dst : _GEN_178; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_180 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_stale_dst : _GEN_179; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_181 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_stale_dst : _GEN_180; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_182 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_stale_dst : _GEN_181; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_185 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_arch_dst : rob_uop_0_arch_dst; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_186 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_arch_dst : _GEN_185; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_187 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_arch_dst : _GEN_186; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_188 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_arch_dst : _GEN_187; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_189 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_arch_dst : _GEN_188; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_190 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_arch_dst : _GEN_189; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_193 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_inst_type : rob_uop_0_inst_type; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_194 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_inst_type : _GEN_193; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_195 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_inst_type : _GEN_194; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_196 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_inst_type : _GEN_195; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_197 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_inst_type : _GEN_196; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_198 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_inst_type : _GEN_197; // @[rob.scala 113:{32,32}]
  wire  _GEN_201 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_regWen : rob_uop_0_regWen; // @[rob.scala 113:{32,32}]
  wire  _GEN_202 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_regWen : _GEN_201; // @[rob.scala 113:{32,32}]
  wire  _GEN_203 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_regWen : _GEN_202; // @[rob.scala 113:{32,32}]
  wire  _GEN_204 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_regWen : _GEN_203; // @[rob.scala 113:{32,32}]
  wire  _GEN_205 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_regWen : _GEN_204; // @[rob.scala 113:{32,32}]
  wire  _GEN_206 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_regWen : _GEN_205; // @[rob.scala 113:{32,32}]
  wire  _GEN_209 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_src1_valid : rob_uop_0_src1_valid; // @[rob.scala 113:{32,32}]
  wire  _GEN_210 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_src1_valid : _GEN_209; // @[rob.scala 113:{32,32}]
  wire  _GEN_211 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_src1_valid : _GEN_210; // @[rob.scala 113:{32,32}]
  wire  _GEN_212 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_src1_valid : _GEN_211; // @[rob.scala 113:{32,32}]
  wire  _GEN_213 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_src1_valid : _GEN_212; // @[rob.scala 113:{32,32}]
  wire  _GEN_214 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_src1_valid : _GEN_213; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_217 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_phy_rs1 : rob_uop_0_phy_rs1; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_218 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_phy_rs1 : _GEN_217; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_219 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_phy_rs1 : _GEN_218; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_220 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_phy_rs1 : _GEN_219; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_221 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_phy_rs1 : _GEN_220; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_222 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_phy_rs1 : _GEN_221; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_225 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_arch_rs1 : rob_uop_0_arch_rs1; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_226 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_arch_rs1 : _GEN_225; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_227 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_arch_rs1 : _GEN_226; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_228 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_arch_rs1 : _GEN_227; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_229 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_arch_rs1 : _GEN_228; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_230 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_arch_rs1 : _GEN_229; // @[rob.scala 113:{32,32}]
  wire  _GEN_233 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_src2_valid : rob_uop_0_src2_valid; // @[rob.scala 113:{32,32}]
  wire  _GEN_234 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_src2_valid : _GEN_233; // @[rob.scala 113:{32,32}]
  wire  _GEN_235 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_src2_valid : _GEN_234; // @[rob.scala 113:{32,32}]
  wire  _GEN_236 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_src2_valid : _GEN_235; // @[rob.scala 113:{32,32}]
  wire  _GEN_237 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_src2_valid : _GEN_236; // @[rob.scala 113:{32,32}]
  wire  _GEN_238 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_src2_valid : _GEN_237; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_241 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_phy_rs2 : rob_uop_0_phy_rs2; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_242 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_phy_rs2 : _GEN_241; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_243 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_phy_rs2 : _GEN_242; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_244 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_phy_rs2 : _GEN_243; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_245 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_phy_rs2 : _GEN_244; // @[rob.scala 113:{32,32}]
  wire [6:0] _GEN_246 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_phy_rs2 : _GEN_245; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_249 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_arch_rs2 : rob_uop_0_arch_rs2; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_250 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_arch_rs2 : _GEN_249; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_251 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_arch_rs2 : _GEN_250; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_252 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_arch_rs2 : _GEN_251; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_253 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_arch_rs2 : _GEN_252; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_254 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_arch_rs2 : _GEN_253; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_257 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_rob_idx : rob_uop_0_rob_idx; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_258 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_rob_idx : _GEN_257; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_259 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_rob_idx : _GEN_258; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_260 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_rob_idx : _GEN_259; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_261 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_rob_idx : _GEN_260; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_262 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_rob_idx : _GEN_261; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_265 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_imm : rob_uop_0_imm; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_266 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_imm : _GEN_265; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_267 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_imm : _GEN_266; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_268 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_imm : _GEN_267; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_269 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_imm : _GEN_268; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_270 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_imm : _GEN_269; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_273 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_dst_value : rob_uop_0_dst_value; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_274 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_dst_value : _GEN_273; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_275 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_dst_value : _GEN_274; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_276 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_dst_value : _GEN_275; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_277 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_dst_value : _GEN_276; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_278 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_dst_value : _GEN_277; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_279 = 3'h7 == commit_ptr[2:0] ? rob_uop_7_dst_value : _GEN_278; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_281 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_src1_value : rob_uop_0_src1_value; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_282 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_src1_value : _GEN_281; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_283 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_src1_value : _GEN_282; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_284 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_src1_value : _GEN_283; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_285 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_src1_value : _GEN_284; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_286 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_src1_value : _GEN_285; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_289 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_src2_value : rob_uop_0_src2_value; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_290 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_src2_value : _GEN_289; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_291 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_src2_value : _GEN_290; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_292 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_src2_value : _GEN_291; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_293 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_src2_value : _GEN_292; // @[rob.scala 113:{32,32}]
  wire [63:0] _GEN_294 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_src2_value : _GEN_293; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_305 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_op1_sel : rob_uop_0_op1_sel; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_306 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_op1_sel : _GEN_305; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_307 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_op1_sel : _GEN_306; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_308 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_op1_sel : _GEN_307; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_309 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_op1_sel : _GEN_308; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_310 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_op1_sel : _GEN_309; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_313 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_op2_sel : rob_uop_0_op2_sel; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_314 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_op2_sel : _GEN_313; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_315 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_op2_sel : _GEN_314; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_316 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_op2_sel : _GEN_315; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_317 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_op2_sel : _GEN_316; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_318 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_op2_sel : _GEN_317; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_321 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_alu_sel : rob_uop_0_alu_sel; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_322 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_alu_sel : _GEN_321; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_323 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_alu_sel : _GEN_322; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_324 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_alu_sel : _GEN_323; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_325 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_alu_sel : _GEN_324; // @[rob.scala 113:{32,32}]
  wire [4:0] _GEN_326 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_alu_sel : _GEN_325; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_329 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_branch_type : rob_uop_0_branch_type; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_330 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_branch_type : _GEN_329; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_331 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_branch_type : _GEN_330; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_332 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_branch_type : _GEN_331; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_333 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_branch_type : _GEN_332; // @[rob.scala 113:{32,32}]
  wire [3:0] _GEN_334 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_branch_type : _GEN_333; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_337 = 3'h1 == commit_ptr[2:0] ? rob_uop_1_mem_type : rob_uop_0_mem_type; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_338 = 3'h2 == commit_ptr[2:0] ? rob_uop_2_mem_type : _GEN_337; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_339 = 3'h3 == commit_ptr[2:0] ? rob_uop_3_mem_type : _GEN_338; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_340 = 3'h4 == commit_ptr[2:0] ? rob_uop_4_mem_type : _GEN_339; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_341 = 3'h5 == commit_ptr[2:0] ? rob_uop_5_mem_type : _GEN_340; // @[rob.scala 113:{32,32}]
  wire [2:0] _GEN_342 = 3'h6 == commit_ptr[2:0] ? rob_uop_6_mem_type : _GEN_341; // @[rob.scala 113:{32,32}]
  wire  _io_o_commit_packs_0_uop_dst_value_T_2 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_rob_idx ==
    commit_ptr; // @[rob.scala 115:37]
  wire  _io_o_commit_packs_0_uop_dst_value_T_4 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_rob_idx ==
    commit_ptr; // @[rob.scala 116:37]
  wire [63:0] _io_o_commit_packs_0_uop_dst_value_T_5 = _io_o_commit_packs_0_uop_dst_value_T_4 ?
    io_i_ex_res_packs_1_uop_dst_value : _GEN_279; // @[Mux.scala 101:16]
  wire  _GEN_353 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_valid : rob_uop_0_valid; // @[rob.scala 118:{32,32}]
  wire  _GEN_354 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_valid : _GEN_353; // @[rob.scala 118:{32,32}]
  wire  _GEN_355 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_valid : _GEN_354; // @[rob.scala 118:{32,32}]
  wire  _GEN_356 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_valid : _GEN_355; // @[rob.scala 118:{32,32}]
  wire  _GEN_357 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_valid : _GEN_356; // @[rob.scala 118:{32,32}]
  wire  _GEN_358 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_valid : _GEN_357; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_361 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_pc : rob_uop_0_pc; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_362 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_pc : _GEN_361; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_363 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_pc : _GEN_362; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_364 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_pc : _GEN_363; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_365 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_pc : _GEN_364; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_366 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_pc : _GEN_365; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_369 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_inst : rob_uop_0_inst; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_370 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_inst : _GEN_369; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_371 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_inst : _GEN_370; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_372 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_inst : _GEN_371; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_373 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_inst : _GEN_372; // @[rob.scala 118:{32,32}]
  wire [31:0] _GEN_374 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_inst : _GEN_373; // @[rob.scala 118:{32,32}]
  wire  _GEN_385 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_branch_predict_pack_valid :
    rob_uop_0_branch_predict_pack_valid; // @[rob.scala 118:{32,32}]
  wire  _GEN_386 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_branch_predict_pack_valid : _GEN_385; // @[rob.scala 118:{32,32}]
  wire  _GEN_387 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_branch_predict_pack_valid : _GEN_386; // @[rob.scala 118:{32,32}]
  wire  _GEN_388 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_branch_predict_pack_valid : _GEN_387; // @[rob.scala 118:{32,32}]
  wire  _GEN_389 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_branch_predict_pack_valid : _GEN_388; // @[rob.scala 118:{32,32}]
  wire  _GEN_390 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_branch_predict_pack_valid : _GEN_389; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_393 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_branch_predict_pack_target :
    rob_uop_0_branch_predict_pack_target; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_394 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_branch_predict_pack_target : _GEN_393; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_395 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_branch_predict_pack_target : _GEN_394; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_396 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_branch_predict_pack_target : _GEN_395; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_397 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_branch_predict_pack_target : _GEN_396; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_398 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_branch_predict_pack_target : _GEN_397; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_401 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_branch_predict_pack_branch_type :
    rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_402 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_branch_predict_pack_branch_type : _GEN_401; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_403 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_branch_predict_pack_branch_type : _GEN_402; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_404 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_branch_predict_pack_branch_type : _GEN_403; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_405 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_branch_predict_pack_branch_type : _GEN_404; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_406 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_branch_predict_pack_branch_type : _GEN_405; // @[rob.scala 118:{32,32}]
  wire  _GEN_409 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_branch_predict_pack_select :
    rob_uop_0_branch_predict_pack_select; // @[rob.scala 118:{32,32}]
  wire  _GEN_410 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_branch_predict_pack_select : _GEN_409; // @[rob.scala 118:{32,32}]
  wire  _GEN_411 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_branch_predict_pack_select : _GEN_410; // @[rob.scala 118:{32,32}]
  wire  _GEN_412 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_branch_predict_pack_select : _GEN_411; // @[rob.scala 118:{32,32}]
  wire  _GEN_413 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_branch_predict_pack_select : _GEN_412; // @[rob.scala 118:{32,32}]
  wire  _GEN_414 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_branch_predict_pack_select : _GEN_413; // @[rob.scala 118:{32,32}]
  wire  _GEN_417 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_branch_predict_pack_taken :
    rob_uop_0_branch_predict_pack_taken; // @[rob.scala 118:{32,32}]
  wire  _GEN_418 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_branch_predict_pack_taken : _GEN_417; // @[rob.scala 118:{32,32}]
  wire  _GEN_419 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_branch_predict_pack_taken : _GEN_418; // @[rob.scala 118:{32,32}]
  wire  _GEN_420 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_branch_predict_pack_taken : _GEN_419; // @[rob.scala 118:{32,32}]
  wire  _GEN_421 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_branch_predict_pack_taken : _GEN_420; // @[rob.scala 118:{32,32}]
  wire  _GEN_422 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_branch_predict_pack_taken : _GEN_421; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_425 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_phy_dst : rob_uop_0_phy_dst; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_426 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_phy_dst : _GEN_425; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_427 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_phy_dst : _GEN_426; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_428 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_phy_dst : _GEN_427; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_429 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_phy_dst : _GEN_428; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_430 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_phy_dst : _GEN_429; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_433 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_stale_dst : rob_uop_0_stale_dst; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_434 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_stale_dst : _GEN_433; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_435 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_stale_dst : _GEN_434; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_436 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_stale_dst : _GEN_435; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_437 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_stale_dst : _GEN_436; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_438 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_stale_dst : _GEN_437; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_441 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_arch_dst : rob_uop_0_arch_dst; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_442 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_arch_dst : _GEN_441; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_443 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_arch_dst : _GEN_442; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_444 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_arch_dst : _GEN_443; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_445 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_arch_dst : _GEN_444; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_446 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_arch_dst : _GEN_445; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_449 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_inst_type : rob_uop_0_inst_type; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_450 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_inst_type : _GEN_449; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_451 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_inst_type : _GEN_450; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_452 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_inst_type : _GEN_451; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_453 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_inst_type : _GEN_452; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_454 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_inst_type : _GEN_453; // @[rob.scala 118:{32,32}]
  wire  _GEN_457 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_regWen : rob_uop_0_regWen; // @[rob.scala 118:{32,32}]
  wire  _GEN_458 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_regWen : _GEN_457; // @[rob.scala 118:{32,32}]
  wire  _GEN_459 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_regWen : _GEN_458; // @[rob.scala 118:{32,32}]
  wire  _GEN_460 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_regWen : _GEN_459; // @[rob.scala 118:{32,32}]
  wire  _GEN_461 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_regWen : _GEN_460; // @[rob.scala 118:{32,32}]
  wire  _GEN_462 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_regWen : _GEN_461; // @[rob.scala 118:{32,32}]
  wire  _GEN_465 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_src1_valid : rob_uop_0_src1_valid; // @[rob.scala 118:{32,32}]
  wire  _GEN_466 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_src1_valid : _GEN_465; // @[rob.scala 118:{32,32}]
  wire  _GEN_467 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_src1_valid : _GEN_466; // @[rob.scala 118:{32,32}]
  wire  _GEN_468 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_src1_valid : _GEN_467; // @[rob.scala 118:{32,32}]
  wire  _GEN_469 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_src1_valid : _GEN_468; // @[rob.scala 118:{32,32}]
  wire  _GEN_470 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_src1_valid : _GEN_469; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_473 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_phy_rs1 : rob_uop_0_phy_rs1; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_474 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_phy_rs1 : _GEN_473; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_475 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_phy_rs1 : _GEN_474; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_476 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_phy_rs1 : _GEN_475; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_477 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_phy_rs1 : _GEN_476; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_478 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_phy_rs1 : _GEN_477; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_481 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_arch_rs1 : rob_uop_0_arch_rs1; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_482 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_arch_rs1 : _GEN_481; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_483 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_arch_rs1 : _GEN_482; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_484 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_arch_rs1 : _GEN_483; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_485 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_arch_rs1 : _GEN_484; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_486 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_arch_rs1 : _GEN_485; // @[rob.scala 118:{32,32}]
  wire  _GEN_489 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_src2_valid : rob_uop_0_src2_valid; // @[rob.scala 118:{32,32}]
  wire  _GEN_490 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_src2_valid : _GEN_489; // @[rob.scala 118:{32,32}]
  wire  _GEN_491 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_src2_valid : _GEN_490; // @[rob.scala 118:{32,32}]
  wire  _GEN_492 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_src2_valid : _GEN_491; // @[rob.scala 118:{32,32}]
  wire  _GEN_493 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_src2_valid : _GEN_492; // @[rob.scala 118:{32,32}]
  wire  _GEN_494 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_src2_valid : _GEN_493; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_497 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_phy_rs2 : rob_uop_0_phy_rs2; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_498 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_phy_rs2 : _GEN_497; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_499 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_phy_rs2 : _GEN_498; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_500 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_phy_rs2 : _GEN_499; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_501 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_phy_rs2 : _GEN_500; // @[rob.scala 118:{32,32}]
  wire [6:0] _GEN_502 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_phy_rs2 : _GEN_501; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_505 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_arch_rs2 : rob_uop_0_arch_rs2; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_506 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_arch_rs2 : _GEN_505; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_507 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_arch_rs2 : _GEN_506; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_508 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_arch_rs2 : _GEN_507; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_509 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_arch_rs2 : _GEN_508; // @[rob.scala 118:{32,32}]
  wire [4:0] _GEN_510 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_arch_rs2 : _GEN_509; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_513 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_rob_idx : rob_uop_0_rob_idx; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_514 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_rob_idx : _GEN_513; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_515 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_rob_idx : _GEN_514; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_516 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_rob_idx : _GEN_515; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_517 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_rob_idx : _GEN_516; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_518 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_rob_idx : _GEN_517; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_521 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_imm : rob_uop_0_imm; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_522 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_imm : _GEN_521; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_523 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_imm : _GEN_522; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_524 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_imm : _GEN_523; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_525 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_imm : _GEN_524; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_526 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_imm : _GEN_525; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_529 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_dst_value : rob_uop_0_dst_value; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_530 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_dst_value : _GEN_529; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_531 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_dst_value : _GEN_530; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_532 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_dst_value : _GEN_531; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_533 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_dst_value : _GEN_532; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_534 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_dst_value : _GEN_533; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_535 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_dst_value : _GEN_534; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_537 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_src1_value : rob_uop_0_src1_value; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_538 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_src1_value : _GEN_537; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_539 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_src1_value : _GEN_538; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_540 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_src1_value : _GEN_539; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_541 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_src1_value : _GEN_540; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_542 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_src1_value : _GEN_541; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_545 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_src2_value : rob_uop_0_src2_value; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_546 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_src2_value : _GEN_545; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_547 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_src2_value : _GEN_546; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_548 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_src2_value : _GEN_547; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_549 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_src2_value : _GEN_548; // @[rob.scala 118:{32,32}]
  wire [63:0] _GEN_550 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_src2_value : _GEN_549; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_561 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_op1_sel : rob_uop_0_op1_sel; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_562 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_op1_sel : _GEN_561; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_563 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_op1_sel : _GEN_562; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_564 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_op1_sel : _GEN_563; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_565 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_op1_sel : _GEN_564; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_566 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_op1_sel : _GEN_565; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_569 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_op2_sel : rob_uop_0_op2_sel; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_570 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_op2_sel : _GEN_569; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_571 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_op2_sel : _GEN_570; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_572 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_op2_sel : _GEN_571; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_573 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_op2_sel : _GEN_572; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_574 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_op2_sel : _GEN_573; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_585 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_branch_type : rob_uop_0_branch_type; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_586 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_branch_type : _GEN_585; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_587 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_branch_type : _GEN_586; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_588 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_branch_type : _GEN_587; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_589 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_branch_type : _GEN_588; // @[rob.scala 118:{32,32}]
  wire [3:0] _GEN_590 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_branch_type : _GEN_589; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_593 = 3'h1 == _next_can_commit_1_T_1[2:0] ? rob_uop_1_mem_type : rob_uop_0_mem_type; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_594 = 3'h2 == _next_can_commit_1_T_1[2:0] ? rob_uop_2_mem_type : _GEN_593; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_595 = 3'h3 == _next_can_commit_1_T_1[2:0] ? rob_uop_3_mem_type : _GEN_594; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_596 = 3'h4 == _next_can_commit_1_T_1[2:0] ? rob_uop_4_mem_type : _GEN_595; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_597 = 3'h5 == _next_can_commit_1_T_1[2:0] ? rob_uop_5_mem_type : _GEN_596; // @[rob.scala 118:{32,32}]
  wire [2:0] _GEN_598 = 3'h6 == _next_can_commit_1_T_1[2:0] ? rob_uop_6_mem_type : _GEN_597; // @[rob.scala 118:{32,32}]
  wire  _io_o_commit_packs_1_uop_dst_value_T_6 = io_i_ex_res_packs_0_valid & io_i_ex_res_packs_0_uop_rob_idx ==
    _next_can_commit_1_T_1; // @[rob.scala 120:37]
  wire  _io_o_commit_packs_1_uop_dst_value_T_10 = io_i_ex_res_packs_1_valid & io_i_ex_res_packs_1_uop_rob_idx ==
    _next_can_commit_1_T_1; // @[rob.scala 121:37]
  wire [63:0] _io_o_commit_packs_1_uop_dst_value_T_11 = _io_o_commit_packs_1_uop_dst_value_T_10 ?
    io_i_ex_res_packs_1_uop_dst_value : _GEN_535; // @[Mux.scala 101:16]
  wire  _io_o_rollback_packs_0_valid_T_3 = _next_rob_state_T_26 | ~need_to_rbk_dispatch; // @[rob.scala 129:99]
  wire  _io_o_rollback_packs_0_valid_T_4 = io_i_rob_allocation_reqs_1_valid ? io_i_rob_allocation_reqs_1_valid :
    io_i_rob_allocation_reqs_0_valid; // @[rob.scala 129:136]
  wire [3:0] this_num_to_roll_back = {{2'd0}, _this_num_to_roll_back_T_13}; // @[rob.scala 68:37 76:27]
  wire  _io_o_rollback_packs_1_valid_T_4 = this_num_to_roll_back == 4'h2; // @[rob.scala 130:148]
  wire  _io_o_rollback_packs_1_valid_T_5 = _io_o_rollback_packs_0_valid_T_3 ? this_num_to_roll_back == 4'h2 :
    io_i_rob_allocation_reqs_0_valid; // @[rob.scala 130:73]
  wire  _io_o_rollback_packs_0_uop_T_1 = rob_state != 2'h2 & need_to_rbk_dispatch; // @[rob.scala 132:63]
  wire [6:0] _io_o_rollback_packs_0_uop_T_2_phy_dst = io_i_rob_allocation_reqs_1_valid ?
    io_i_rob_allocation_reqs_1_uop_phy_dst : io_i_rob_allocation_reqs_0_uop_phy_dst; // @[rob.scala 132:91]
  wire [6:0] _io_o_rollback_packs_0_uop_T_2_stale_dst = io_i_rob_allocation_reqs_1_valid ?
    io_i_rob_allocation_reqs_1_uop_stale_dst : io_i_rob_allocation_reqs_0_uop_stale_dst; // @[rob.scala 132:91]
  wire [4:0] _io_o_rollback_packs_0_uop_T_2_arch_dst = io_i_rob_allocation_reqs_1_valid ?
    io_i_rob_allocation_reqs_1_uop_arch_dst : io_i_rob_allocation_reqs_0_uop_arch_dst; // @[rob.scala 132:91]
  wire [6:0] _GEN_648 = 3'h1 == _next_rob_state_T_9[2:0] ? rob_uop_1_phy_dst : rob_uop_0_phy_dst; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_649 = 3'h1 == _next_rob_state_T_9[2:0] ? rob_uop_1_stale_dst : rob_uop_0_stale_dst; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_650 = 3'h1 == _next_rob_state_T_9[2:0] ? rob_uop_1_arch_dst : rob_uop_0_arch_dst; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_679 = 3'h2 == _next_rob_state_T_9[2:0] ? rob_uop_2_phy_dst : _GEN_648; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_680 = 3'h2 == _next_rob_state_T_9[2:0] ? rob_uop_2_stale_dst : _GEN_649; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_681 = 3'h2 == _next_rob_state_T_9[2:0] ? rob_uop_2_arch_dst : _GEN_650; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_710 = 3'h3 == _next_rob_state_T_9[2:0] ? rob_uop_3_phy_dst : _GEN_679; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_711 = 3'h3 == _next_rob_state_T_9[2:0] ? rob_uop_3_stale_dst : _GEN_680; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_712 = 3'h3 == _next_rob_state_T_9[2:0] ? rob_uop_3_arch_dst : _GEN_681; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_741 = 3'h4 == _next_rob_state_T_9[2:0] ? rob_uop_4_phy_dst : _GEN_710; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_742 = 3'h4 == _next_rob_state_T_9[2:0] ? rob_uop_4_stale_dst : _GEN_711; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_743 = 3'h4 == _next_rob_state_T_9[2:0] ? rob_uop_4_arch_dst : _GEN_712; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_772 = 3'h5 == _next_rob_state_T_9[2:0] ? rob_uop_5_phy_dst : _GEN_741; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_773 = 3'h5 == _next_rob_state_T_9[2:0] ? rob_uop_5_stale_dst : _GEN_742; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_774 = 3'h5 == _next_rob_state_T_9[2:0] ? rob_uop_5_arch_dst : _GEN_743; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_803 = 3'h6 == _next_rob_state_T_9[2:0] ? rob_uop_6_phy_dst : _GEN_772; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_804 = 3'h6 == _next_rob_state_T_9[2:0] ? rob_uop_6_stale_dst : _GEN_773; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_805 = 3'h6 == _next_rob_state_T_9[2:0] ? rob_uop_6_arch_dst : _GEN_774; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_834 = 3'h7 == _next_rob_state_T_9[2:0] ? rob_uop_7_phy_dst : _GEN_803; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_835 = 3'h7 == _next_rob_state_T_9[2:0] ? rob_uop_7_stale_dst : _GEN_804; // @[rob.scala 132:{39,39}]
  wire [4:0] _GEN_836 = 3'h7 == _next_rob_state_T_9[2:0] ? rob_uop_7_arch_dst : _GEN_805; // @[rob.scala 132:{39,39}]
  wire [6:0] _GEN_896 = 3'h1 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_1_phy_dst : rob_uop_0_phy_dst; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_897 = 3'h1 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_1_stale_dst : rob_uop_0_stale_dst; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_898 = 3'h1 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_1_arch_dst : rob_uop_0_arch_dst; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_927 = 3'h2 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_2_phy_dst : _GEN_896; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_928 = 3'h2 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_2_stale_dst : _GEN_897; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_929 = 3'h2 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_2_arch_dst : _GEN_898; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_958 = 3'h3 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_3_phy_dst : _GEN_927; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_959 = 3'h3 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_3_stale_dst : _GEN_928; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_960 = 3'h3 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_3_arch_dst : _GEN_929; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_989 = 3'h4 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_4_phy_dst : _GEN_958; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_990 = 3'h4 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_4_stale_dst : _GEN_959; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_991 = 3'h4 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_4_arch_dst : _GEN_960; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_1020 = 3'h5 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_5_phy_dst : _GEN_989; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_1021 = 3'h5 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_5_stale_dst : _GEN_990; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_1022 = 3'h5 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_5_arch_dst : _GEN_991; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_1051 = 3'h6 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_6_phy_dst : _GEN_1020; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_1052 = 3'h6 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_6_stale_dst : _GEN_1021; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_1053 = 3'h6 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_6_arch_dst : _GEN_1022; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_1082 = 3'h7 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_7_phy_dst : _GEN_1051; // @[rob.scala 133:{39,39}]
  wire [6:0] _GEN_1083 = 3'h7 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_7_stale_dst : _GEN_1052; // @[rob.scala 133:{39,39}]
  wire [4:0] _GEN_1084 = 3'h7 == _this_num_to_roll_back_T_3[2:0] ? rob_uop_7_arch_dst : _GEN_1053; // @[rob.scala 133:{39,39}]
  wire  _GEN_1104 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_0_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1105 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1106 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1107 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_3_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1108 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_4_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1109 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_5_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1110 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_6_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1111 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_valid : rob_uop_7_valid; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1112 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_0_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1113 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_1_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1114 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_2_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1115 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_3_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1116 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_4_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1117 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_5_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1118 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_6_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1119 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_pc : rob_uop_7_pc; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1120 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_0_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1121 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_1_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1122 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_2_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1123 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_3_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1124 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_4_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1125 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_5_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1126 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_6_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [31:0] _GEN_1127 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst : rob_uop_7_inst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1128 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_0_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1129 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_1_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1130 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_2_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1131 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_3_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1132 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_4_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1133 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_5_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1134 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_6_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1135 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_func_code : rob_uop_7_func_code; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1136 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_0_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1137 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_1_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1138 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_2_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1139 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_3_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1140 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_4_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1141 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_5_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1142 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_6_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1143 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid :
    rob_uop_7_branch_predict_pack_valid; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1144 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_0_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1145 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_1_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1146 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_2_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1147 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_3_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1148 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_4_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1149 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_5_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1150 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_6_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1151 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    rob_uop_7_branch_predict_pack_target; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1152 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1153 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_1_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1154 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_2_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1155 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_3_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1156 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_4_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1157 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_5_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1158 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_6_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1159 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    rob_uop_7_branch_predict_pack_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1160 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_0_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1161 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_1_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1162 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_2_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1163 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_3_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1164 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_4_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1165 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_5_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1166 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_6_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1167 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    rob_uop_7_branch_predict_pack_select; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1168 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_0_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1169 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_1_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1170 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_2_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1171 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_3_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1172 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_4_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1173 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_5_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1174 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_6_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1175 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken :
    rob_uop_7_branch_predict_pack_taken; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1176 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_0_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1177 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_1_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1178 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_2_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1179 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_3_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1180 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_4_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1181 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_5_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1182 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_6_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1183 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_dst : rob_uop_7_phy_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1184 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_0_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1185 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_1_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1186 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_2_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1187 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_3_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1188 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_4_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1189 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_5_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1190 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_6_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1191 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_stale_dst : rob_uop_7_stale_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1192 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_0_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1193 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_1_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1194 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_2_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1195 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_3_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1196 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_4_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1197 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_5_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1198 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_6_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1199 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_dst : rob_uop_7_arch_dst; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1200 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_0_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1201 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_1_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1202 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_2_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1203 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_3_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1204 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_4_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1205 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_5_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1206 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_6_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1207 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_inst_type : rob_uop_7_inst_type; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1208 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_0_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1209 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_1_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1210 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_2_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1211 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_3_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1212 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_4_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1213 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_5_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1214 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_6_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1215 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_regWen : rob_uop_7_regWen; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1216 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_0_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1217 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_1_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1218 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_2_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1219 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_3_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1220 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_4_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1221 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_5_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1222 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_6_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1223 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_valid : rob_uop_7_src1_valid; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1224 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_0_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1225 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_1_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1226 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_2_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1227 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_3_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1228 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_4_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1229 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_5_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1230 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_6_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1231 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs1 : rob_uop_7_phy_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1232 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_0_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1233 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_1_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1234 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_2_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1235 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_3_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1236 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_4_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1237 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_5_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1238 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_6_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1239 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs1 : rob_uop_7_arch_rs1; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1240 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_0_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1241 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_1_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1242 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_2_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1243 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_3_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1244 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_4_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1245 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_5_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1246 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_6_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1247 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_valid : rob_uop_7_src2_valid; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1248 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_0_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1249 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_1_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1250 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_2_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1251 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_3_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1252 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_4_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1253 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_5_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1254 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_6_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [6:0] _GEN_1255 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_phy_rs2 : rob_uop_7_phy_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1256 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_0_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1257 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_1_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1258 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_2_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1259 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_3_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1260 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_4_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1261 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_5_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1262 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_6_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1263 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_arch_rs2 : rob_uop_7_arch_rs2; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1264 = 3'h0 == allocate_ptr[2:0] ? 4'h0 : rob_uop_0_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1265 = 3'h1 == allocate_ptr[2:0] ? 4'h0 : rob_uop_1_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1266 = 3'h2 == allocate_ptr[2:0] ? 4'h0 : rob_uop_2_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1267 = 3'h3 == allocate_ptr[2:0] ? 4'h0 : rob_uop_3_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1268 = 3'h4 == allocate_ptr[2:0] ? 4'h0 : rob_uop_4_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1269 = 3'h5 == allocate_ptr[2:0] ? 4'h0 : rob_uop_5_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1270 = 3'h6 == allocate_ptr[2:0] ? 4'h0 : rob_uop_6_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1271 = 3'h7 == allocate_ptr[2:0] ? 4'h0 : rob_uop_7_rob_idx; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1272 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_0_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1273 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_1_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1274 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_2_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1275 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_3_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1276 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_4_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1277 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_5_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1278 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_6_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1279 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_imm : rob_uop_7_imm; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1280 = 3'h0 == allocate_ptr[2:0] ? 64'h0 : rob_uop_0_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1281 = 3'h1 == allocate_ptr[2:0] ? 64'h0 : rob_uop_1_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1282 = 3'h2 == allocate_ptr[2:0] ? 64'h0 : rob_uop_2_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1283 = 3'h3 == allocate_ptr[2:0] ? 64'h0 : rob_uop_3_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1284 = 3'h4 == allocate_ptr[2:0] ? 64'h0 : rob_uop_4_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1285 = 3'h5 == allocate_ptr[2:0] ? 64'h0 : rob_uop_5_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1286 = 3'h6 == allocate_ptr[2:0] ? 64'h0 : rob_uop_6_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1287 = 3'h7 == allocate_ptr[2:0] ? 64'h0 : rob_uop_7_dst_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1288 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_0_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1289 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_1_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1290 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_2_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1291 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_3_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1292 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_4_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1293 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_5_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1294 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_6_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1295 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src1_value : rob_uop_7_src1_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1296 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_0_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1297 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_1_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1298 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_2_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1299 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_3_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1300 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_4_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1301 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_5_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1302 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_6_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [63:0] _GEN_1303 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_src2_value : rob_uop_7_src2_value; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1312 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_0_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1313 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_1_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1314 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_2_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1315 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_3_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1316 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_4_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1317 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_5_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1318 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_6_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1319 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op1_sel : rob_uop_7_op1_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1320 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_0_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1321 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_1_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1322 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_2_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1323 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_3_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1324 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_4_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1325 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_5_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1326 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_6_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1327 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_op2_sel : rob_uop_7_op2_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1328 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_0_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1329 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_1_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1330 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_2_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1331 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_3_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1332 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_4_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1333 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_5_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1334 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_6_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [4:0] _GEN_1335 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_alu_sel : rob_uop_7_alu_sel; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1336 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_0_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1337 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_1_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1338 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_2_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1339 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_3_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1340 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_4_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1341 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_5_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1342 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_6_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [3:0] _GEN_1343 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_branch_type : rob_uop_7_branch_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1344 = 3'h0 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_0_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1345 = 3'h1 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_1_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1346 = 3'h2 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_2_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1347 = 3'h3 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_3_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1348 = 3'h4 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_4_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1349 = 3'h5 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_5_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1350 = 3'h6 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_6_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire [2:0] _GEN_1351 = 3'h7 == allocate_ptr[2:0] ? io_i_rob_allocation_reqs_0_uop_mem_type : rob_uop_7_mem_type; // @[rob.scala 141:{31,31} 86:26]
  wire  _GEN_1352 = 3'h0 == allocate_ptr[2:0] | rob_valid_0; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1353 = 3'h1 == allocate_ptr[2:0] | rob_valid_1; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1354 = 3'h2 == allocate_ptr[2:0] | rob_valid_2; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1355 = 3'h3 == allocate_ptr[2:0] | rob_valid_3; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1356 = 3'h4 == allocate_ptr[2:0] | rob_valid_4; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1357 = 3'h5 == allocate_ptr[2:0] | rob_valid_5; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1358 = 3'h6 == allocate_ptr[2:0] | rob_valid_6; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1359 = 3'h7 == allocate_ptr[2:0] | rob_valid_7; // @[rob.scala 142:{33,33} 85:28]
  wire  _GEN_1360 = 3'h0 == allocate_ptr[2:0] ? 1'h0 : rob_done_0; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1361 = 3'h1 == allocate_ptr[2:0] ? 1'h0 : rob_done_1; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1362 = 3'h2 == allocate_ptr[2:0] ? 1'h0 : rob_done_2; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1363 = 3'h3 == allocate_ptr[2:0] ? 1'h0 : rob_done_3; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1364 = 3'h4 == allocate_ptr[2:0] ? 1'h0 : rob_done_4; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1365 = 3'h5 == allocate_ptr[2:0] ? 1'h0 : rob_done_5; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1366 = 3'h6 == allocate_ptr[2:0] ? 1'h0 : rob_done_6; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1367 = 3'h7 == allocate_ptr[2:0] ? 1'h0 : rob_done_7; // @[rob.scala 143:{32,32} 88:27]
  wire  _GEN_1368 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1104; // @[rob.scala 144:{35,35}]
  wire  _GEN_1369 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1105; // @[rob.scala 144:{35,35}]
  wire  _GEN_1370 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1106; // @[rob.scala 144:{35,35}]
  wire  _GEN_1371 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1107; // @[rob.scala 144:{35,35}]
  wire  _GEN_1372 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1108; // @[rob.scala 144:{35,35}]
  wire  _GEN_1373 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1109; // @[rob.scala 144:{35,35}]
  wire  _GEN_1374 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1110; // @[rob.scala 144:{35,35}]
  wire  _GEN_1375 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_valid : _GEN_1111; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1376 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1112; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1377 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1113; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1378 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1114; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1379 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1115; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1380 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1116; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1381 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1117; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1382 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1118; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1383 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_pc : _GEN_1119; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1384 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1120; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1385 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1121; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1386 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1122; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1387 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1123; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1388 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1124; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1389 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1125; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1390 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1126; // @[rob.scala 144:{35,35}]
  wire [31:0] _GEN_1391 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst : _GEN_1127; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1392 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1128; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1393 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1129; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1394 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1130; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1395 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1131; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1396 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1132; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1397 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1133; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1398 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1134; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1399 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_func_code : _GEN_1135; // @[rob.scala 144:{35,35}]
  wire  _GEN_1400 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1136; // @[rob.scala 144:{35,35}]
  wire  _GEN_1401 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1137; // @[rob.scala 144:{35,35}]
  wire  _GEN_1402 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1138; // @[rob.scala 144:{35,35}]
  wire  _GEN_1403 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1139; // @[rob.scala 144:{35,35}]
  wire  _GEN_1404 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1140; // @[rob.scala 144:{35,35}]
  wire  _GEN_1405 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1141; // @[rob.scala 144:{35,35}]
  wire  _GEN_1406 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1142; // @[rob.scala 144:{35,35}]
  wire  _GEN_1407 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid : _GEN_1143; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1408 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1144; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1409 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1145; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1410 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1146; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1411 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1147; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1412 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1148; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1413 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1149; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1414 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1150; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1415 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target :
    _GEN_1151; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1416 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1152; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1417 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1153; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1418 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1154; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1419 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1155; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1420 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1156; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1421 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1157; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1422 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1158; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1423 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type :
    _GEN_1159; // @[rob.scala 144:{35,35}]
  wire  _GEN_1424 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1160; // @[rob.scala 144:{35,35}]
  wire  _GEN_1425 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1161; // @[rob.scala 144:{35,35}]
  wire  _GEN_1426 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1162; // @[rob.scala 144:{35,35}]
  wire  _GEN_1427 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1163; // @[rob.scala 144:{35,35}]
  wire  _GEN_1428 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1164; // @[rob.scala 144:{35,35}]
  wire  _GEN_1429 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1165; // @[rob.scala 144:{35,35}]
  wire  _GEN_1430 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1166; // @[rob.scala 144:{35,35}]
  wire  _GEN_1431 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select : _GEN_1167; // @[rob.scala 144:{35,35}]
  wire  _GEN_1432 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1168; // @[rob.scala 144:{35,35}]
  wire  _GEN_1433 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1169; // @[rob.scala 144:{35,35}]
  wire  _GEN_1434 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1170; // @[rob.scala 144:{35,35}]
  wire  _GEN_1435 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1171; // @[rob.scala 144:{35,35}]
  wire  _GEN_1436 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1172; // @[rob.scala 144:{35,35}]
  wire  _GEN_1437 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1173; // @[rob.scala 144:{35,35}]
  wire  _GEN_1438 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1174; // @[rob.scala 144:{35,35}]
  wire  _GEN_1439 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken : _GEN_1175; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1440 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1176; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1441 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1177; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1442 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1178; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1443 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1179; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1444 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1180; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1445 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1181; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1446 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1182; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1447 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_dst : _GEN_1183; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1448 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1184; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1449 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1185; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1450 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1186; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1451 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1187; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1452 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1188; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1453 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1189; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1454 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1190; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1455 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_stale_dst : _GEN_1191; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1456 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1192; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1457 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1193; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1458 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1194; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1459 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1195; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1460 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1196; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1461 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1197; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1462 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1198; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1463 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_dst : _GEN_1199; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1464 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1200; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1465 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1201; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1466 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1202; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1467 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1203; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1468 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1204; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1469 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1205; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1470 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1206; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1471 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_inst_type : _GEN_1207; // @[rob.scala 144:{35,35}]
  wire  _GEN_1472 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1208; // @[rob.scala 144:{35,35}]
  wire  _GEN_1473 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1209; // @[rob.scala 144:{35,35}]
  wire  _GEN_1474 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1210; // @[rob.scala 144:{35,35}]
  wire  _GEN_1475 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1211; // @[rob.scala 144:{35,35}]
  wire  _GEN_1476 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1212; // @[rob.scala 144:{35,35}]
  wire  _GEN_1477 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1213; // @[rob.scala 144:{35,35}]
  wire  _GEN_1478 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1214; // @[rob.scala 144:{35,35}]
  wire  _GEN_1479 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_regWen : _GEN_1215; // @[rob.scala 144:{35,35}]
  wire  _GEN_1480 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1216; // @[rob.scala 144:{35,35}]
  wire  _GEN_1481 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1217; // @[rob.scala 144:{35,35}]
  wire  _GEN_1482 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1218; // @[rob.scala 144:{35,35}]
  wire  _GEN_1483 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1219; // @[rob.scala 144:{35,35}]
  wire  _GEN_1484 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1220; // @[rob.scala 144:{35,35}]
  wire  _GEN_1485 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1221; // @[rob.scala 144:{35,35}]
  wire  _GEN_1486 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1222; // @[rob.scala 144:{35,35}]
  wire  _GEN_1487 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_valid : _GEN_1223; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1488 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1224; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1489 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1225; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1490 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1226; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1491 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1227; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1492 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1228; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1493 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1229; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1494 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1230; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1495 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs1 : _GEN_1231; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1496 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1232; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1497 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1233; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1498 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1234; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1499 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1235; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1500 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1236; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1501 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1237; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1502 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1238; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1503 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs1 : _GEN_1239; // @[rob.scala 144:{35,35}]
  wire  _GEN_1504 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1240; // @[rob.scala 144:{35,35}]
  wire  _GEN_1505 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1241; // @[rob.scala 144:{35,35}]
  wire  _GEN_1506 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1242; // @[rob.scala 144:{35,35}]
  wire  _GEN_1507 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1243; // @[rob.scala 144:{35,35}]
  wire  _GEN_1508 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1244; // @[rob.scala 144:{35,35}]
  wire  _GEN_1509 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1245; // @[rob.scala 144:{35,35}]
  wire  _GEN_1510 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1246; // @[rob.scala 144:{35,35}]
  wire  _GEN_1511 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_valid : _GEN_1247; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1512 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1248; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1513 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1249; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1514 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1250; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1515 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1251; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1516 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1252; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1517 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1253; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1518 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1254; // @[rob.scala 144:{35,35}]
  wire [6:0] _GEN_1519 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_phy_rs2 : _GEN_1255; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1520 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1256; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1521 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1257; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1522 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1258; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1523 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1259; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1524 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1260; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1525 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1261; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1526 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1262; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1527 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_arch_rs2 : _GEN_1263; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1528 = 3'h0 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1264; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1529 = 3'h1 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1265; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1530 = 3'h2 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1266; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1531 = 3'h3 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1267; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1532 = 3'h4 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1268; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1533 = 3'h5 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1269; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1534 = 3'h6 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1270; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1535 = 3'h7 == _is_full_T_6[2:0] ? 4'h0 : _GEN_1271; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1536 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1272; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1537 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1273; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1538 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1274; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1539 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1275; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1540 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1276; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1541 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1277; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1542 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1278; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1543 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_imm : _GEN_1279; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1544 = 3'h0 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1280; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1545 = 3'h1 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1281; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1546 = 3'h2 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1282; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1547 = 3'h3 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1283; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1548 = 3'h4 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1284; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1549 = 3'h5 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1285; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1550 = 3'h6 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1286; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1551 = 3'h7 == _is_full_T_6[2:0] ? 64'h0 : _GEN_1287; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1552 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1288; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1553 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1289; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1554 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1290; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1555 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1291; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1556 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1292; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1557 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1293; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1558 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1294; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1559 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src1_value : _GEN_1295; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1560 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1296; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1561 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1297; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1562 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1298; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1563 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1299; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1564 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1300; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1565 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1301; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1566 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1302; // @[rob.scala 144:{35,35}]
  wire [63:0] _GEN_1567 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_src2_value : _GEN_1303; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1576 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1312; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1577 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1313; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1578 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1314; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1579 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1315; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1580 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1316; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1581 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1317; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1582 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1318; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1583 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op1_sel : _GEN_1319; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1584 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1320; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1585 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1321; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1586 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1322; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1587 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1323; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1588 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1324; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1589 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1325; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1590 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1326; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1591 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_op2_sel : _GEN_1327; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1592 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1328; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1593 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1329; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1594 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1330; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1595 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1331; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1596 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1332; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1597 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1333; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1598 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1334; // @[rob.scala 144:{35,35}]
  wire [4:0] _GEN_1599 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_alu_sel : _GEN_1335; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1600 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1336; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1601 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1337; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1602 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1338; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1603 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1339; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1604 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1340; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1605 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1341; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1606 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1342; // @[rob.scala 144:{35,35}]
  wire [3:0] _GEN_1607 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_branch_type : _GEN_1343; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1608 = 3'h0 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1344; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1609 = 3'h1 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1345; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1610 = 3'h2 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1346; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1611 = 3'h3 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1347; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1612 = 3'h4 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1348; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1613 = 3'h5 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1349; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1614 = 3'h6 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1350; // @[rob.scala 144:{35,35}]
  wire [2:0] _GEN_1615 = 3'h7 == _is_full_T_6[2:0] ? io_i_rob_allocation_reqs_1_uop_mem_type : _GEN_1351; // @[rob.scala 144:{35,35}]
  wire  _GEN_1616 = 3'h0 == _is_full_T_6[2:0] | _GEN_1352; // @[rob.scala 145:{37,37}]
  wire  _GEN_1617 = 3'h1 == _is_full_T_6[2:0] | _GEN_1353; // @[rob.scala 145:{37,37}]
  wire  _GEN_1618 = 3'h2 == _is_full_T_6[2:0] | _GEN_1354; // @[rob.scala 145:{37,37}]
  wire  _GEN_1619 = 3'h3 == _is_full_T_6[2:0] | _GEN_1355; // @[rob.scala 145:{37,37}]
  wire  _GEN_1620 = 3'h4 == _is_full_T_6[2:0] | _GEN_1356; // @[rob.scala 145:{37,37}]
  wire  _GEN_1621 = 3'h5 == _is_full_T_6[2:0] | _GEN_1357; // @[rob.scala 145:{37,37}]
  wire  _GEN_1622 = 3'h6 == _is_full_T_6[2:0] | _GEN_1358; // @[rob.scala 145:{37,37}]
  wire  _GEN_1623 = 3'h7 == _is_full_T_6[2:0] | _GEN_1359; // @[rob.scala 145:{37,37}]
  wire  _GEN_1624 = 3'h0 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1360; // @[rob.scala 146:{36,36}]
  wire  _GEN_1625 = 3'h1 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1361; // @[rob.scala 146:{36,36}]
  wire  _GEN_1626 = 3'h2 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1362; // @[rob.scala 146:{36,36}]
  wire  _GEN_1627 = 3'h3 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1363; // @[rob.scala 146:{36,36}]
  wire  _GEN_1628 = 3'h4 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1364; // @[rob.scala 146:{36,36}]
  wire  _GEN_1629 = 3'h5 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1365; // @[rob.scala 146:{36,36}]
  wire  _GEN_1630 = 3'h6 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1366; // @[rob.scala 146:{36,36}]
  wire  _GEN_1631 = 3'h7 == _is_full_T_6[2:0] ? 1'h0 : _GEN_1367; // @[rob.scala 146:{36,36}]
  wire  _rob_uop_T_valid = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_valid :
    io_i_rob_allocation_reqs_1_uop_valid; // @[rob.scala 149:37]
  wire [31:0] _rob_uop_T_pc = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_pc :
    io_i_rob_allocation_reqs_1_uop_pc; // @[rob.scala 149:37]
  wire [31:0] _rob_uop_T_inst = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_inst :
    io_i_rob_allocation_reqs_1_uop_inst; // @[rob.scala 149:37]
  wire [6:0] _rob_uop_T_func_code = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_func_code :
    io_i_rob_allocation_reqs_1_uop_func_code; // @[rob.scala 149:37]
  wire  _rob_uop_T_branch_predict_pack_valid = io_i_rob_allocation_reqs_0_valid ?
    io_i_rob_allocation_reqs_0_uop_branch_predict_pack_valid : io_i_rob_allocation_reqs_1_uop_branch_predict_pack_valid; // @[rob.scala 149:37]
  wire [63:0] _rob_uop_T_branch_predict_pack_target = io_i_rob_allocation_reqs_0_valid ?
    io_i_rob_allocation_reqs_0_uop_branch_predict_pack_target :
    io_i_rob_allocation_reqs_1_uop_branch_predict_pack_target; // @[rob.scala 149:37]
  wire [3:0] _rob_uop_T_branch_predict_pack_branch_type = io_i_rob_allocation_reqs_0_valid ?
    io_i_rob_allocation_reqs_0_uop_branch_predict_pack_branch_type :
    io_i_rob_allocation_reqs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 149:37]
  wire  _rob_uop_T_branch_predict_pack_select = io_i_rob_allocation_reqs_0_valid ?
    io_i_rob_allocation_reqs_0_uop_branch_predict_pack_select :
    io_i_rob_allocation_reqs_1_uop_branch_predict_pack_select; // @[rob.scala 149:37]
  wire  _rob_uop_T_branch_predict_pack_taken = io_i_rob_allocation_reqs_0_valid ?
    io_i_rob_allocation_reqs_0_uop_branch_predict_pack_taken : io_i_rob_allocation_reqs_1_uop_branch_predict_pack_taken; // @[rob.scala 149:37]
  wire [6:0] _rob_uop_T_phy_dst = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_phy_dst :
    io_i_rob_allocation_reqs_1_uop_phy_dst; // @[rob.scala 149:37]
  wire [6:0] _rob_uop_T_stale_dst = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_stale_dst :
    io_i_rob_allocation_reqs_1_uop_stale_dst; // @[rob.scala 149:37]
  wire [4:0] _rob_uop_T_arch_dst = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_arch_dst :
    io_i_rob_allocation_reqs_1_uop_arch_dst; // @[rob.scala 149:37]
  wire [2:0] _rob_uop_T_inst_type = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_inst_type :
    io_i_rob_allocation_reqs_1_uop_inst_type; // @[rob.scala 149:37]
  wire  _rob_uop_T_regWen = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_regWen :
    io_i_rob_allocation_reqs_1_uop_regWen; // @[rob.scala 149:37]
  wire  _rob_uop_T_src1_valid = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_src1_valid :
    io_i_rob_allocation_reqs_1_uop_src1_valid; // @[rob.scala 149:37]
  wire [6:0] _rob_uop_T_phy_rs1 = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_phy_rs1 :
    io_i_rob_allocation_reqs_1_uop_phy_rs1; // @[rob.scala 149:37]
  wire [4:0] _rob_uop_T_arch_rs1 = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_arch_rs1 :
    io_i_rob_allocation_reqs_1_uop_arch_rs1; // @[rob.scala 149:37]
  wire  _rob_uop_T_src2_valid = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_src2_valid :
    io_i_rob_allocation_reqs_1_uop_src2_valid; // @[rob.scala 149:37]
  wire [6:0] _rob_uop_T_phy_rs2 = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_phy_rs2 :
    io_i_rob_allocation_reqs_1_uop_phy_rs2; // @[rob.scala 149:37]
  wire [4:0] _rob_uop_T_arch_rs2 = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_arch_rs2 :
    io_i_rob_allocation_reqs_1_uop_arch_rs2; // @[rob.scala 149:37]
  wire [63:0] _rob_uop_T_imm = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_imm :
    io_i_rob_allocation_reqs_1_uop_imm; // @[rob.scala 149:37]
  wire [63:0] _rob_uop_T_src1_value = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_src1_value :
    io_i_rob_allocation_reqs_1_uop_src1_value; // @[rob.scala 149:37]
  wire [63:0] _rob_uop_T_src2_value = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_src2_value :
    io_i_rob_allocation_reqs_1_uop_src2_value; // @[rob.scala 149:37]
  wire [2:0] _rob_uop_T_op1_sel = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_op1_sel :
    io_i_rob_allocation_reqs_1_uop_op1_sel; // @[rob.scala 149:37]
  wire [2:0] _rob_uop_T_op2_sel = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_op2_sel :
    io_i_rob_allocation_reqs_1_uop_op2_sel; // @[rob.scala 149:37]
  wire [4:0] _rob_uop_T_alu_sel = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_alu_sel :
    io_i_rob_allocation_reqs_1_uop_alu_sel; // @[rob.scala 149:37]
  wire [3:0] _rob_uop_T_branch_type = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_branch_type :
    io_i_rob_allocation_reqs_1_uop_branch_type; // @[rob.scala 149:37]
  wire [2:0] _rob_uop_T_mem_type = io_i_rob_allocation_reqs_0_valid ? io_i_rob_allocation_reqs_0_uop_mem_type :
    io_i_rob_allocation_reqs_1_uop_mem_type; // @[rob.scala 149:37]
  wire  _GEN_1632 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_0_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1633 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1634 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1635 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_3_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1636 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_4_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1637 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_5_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1638 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_6_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1639 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_valid : rob_uop_7_valid; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1640 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_0_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1641 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_1_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1642 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_2_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1643 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_3_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1644 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_4_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1645 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_5_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1646 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_6_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1647 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_pc : rob_uop_7_pc; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1648 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_0_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1649 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_1_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1650 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_2_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1651 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_3_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1652 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_4_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1653 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_5_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1654 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_6_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [31:0] _GEN_1655 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_inst : rob_uop_7_inst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1656 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_0_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1657 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_1_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1658 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_2_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1659 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_3_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1660 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_4_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1661 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_5_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1662 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_6_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1663 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_func_code : rob_uop_7_func_code; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1664 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_0_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1665 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_1_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1666 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_2_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1667 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_3_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1668 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_4_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1669 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_5_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1670 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_6_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1671 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_valid :
    rob_uop_7_branch_predict_pack_valid; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1672 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_0_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1673 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_1_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1674 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_2_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1675 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_3_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1676 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_4_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1677 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_5_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1678 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_6_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1679 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_target :
    rob_uop_7_branch_predict_pack_target; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1680 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1681 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_1_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1682 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_2_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1683 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_3_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1684 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_4_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1685 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_5_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1686 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_6_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1687 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_branch_type :
    rob_uop_7_branch_predict_pack_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1688 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_0_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1689 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_1_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1690 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_2_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1691 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_3_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1692 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_4_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1693 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_5_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1694 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_6_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1695 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_select :
    rob_uop_7_branch_predict_pack_select; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1696 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_0_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1697 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_1_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1698 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_2_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1699 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_3_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1700 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_4_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1701 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_5_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1702 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_6_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1703 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_branch_predict_pack_taken :
    rob_uop_7_branch_predict_pack_taken; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1704 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_0_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1705 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_1_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1706 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_2_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1707 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_3_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1708 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_4_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1709 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_5_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1710 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_6_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1711 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_phy_dst : rob_uop_7_phy_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1712 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_0_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1713 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_1_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1714 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_2_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1715 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_3_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1716 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_4_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1717 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_5_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1718 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_6_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1719 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_stale_dst : rob_uop_7_stale_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1720 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_0_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1721 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_1_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1722 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_2_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1723 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_3_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1724 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_4_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1725 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_5_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1726 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_6_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1727 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_arch_dst : rob_uop_7_arch_dst; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1728 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_0_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1729 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_1_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1730 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_2_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1731 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_3_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1732 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_4_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1733 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_5_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1734 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_6_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1735 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_inst_type : rob_uop_7_inst_type; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1736 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_0_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1737 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_1_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1738 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_2_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1739 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_3_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1740 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_4_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1741 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_5_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1742 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_6_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1743 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_regWen : rob_uop_7_regWen; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1744 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_0_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1745 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_1_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1746 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_2_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1747 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_3_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1748 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_4_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1749 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_5_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1750 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_6_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1751 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_src1_valid : rob_uop_7_src1_valid; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1752 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_0_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1753 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_1_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1754 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_2_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1755 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_3_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1756 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_4_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1757 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_5_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1758 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_6_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1759 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs1 : rob_uop_7_phy_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1760 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_0_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1761 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_1_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1762 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_2_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1763 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_3_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1764 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_4_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1765 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_5_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1766 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_6_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1767 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs1 : rob_uop_7_arch_rs1; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1768 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_0_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1769 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_1_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1770 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_2_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1771 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_3_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1772 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_4_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1773 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_5_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1774 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_6_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1775 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_src2_valid : rob_uop_7_src2_valid; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1776 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_0_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1777 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_1_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1778 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_2_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1779 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_3_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1780 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_4_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1781 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_5_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1782 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_6_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [6:0] _GEN_1783 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_phy_rs2 : rob_uop_7_phy_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1784 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_0_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1785 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_1_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1786 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_2_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1787 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_3_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1788 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_4_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1789 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_5_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1790 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_6_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1791 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_arch_rs2 : rob_uop_7_arch_rs2; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1800 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_0_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1801 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_1_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1802 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_2_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1803 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_3_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1804 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_4_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1805 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_5_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1806 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_6_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1807 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_imm : rob_uop_7_imm; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1816 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_0_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1817 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_1_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1818 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_2_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1819 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_3_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1820 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_4_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1821 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_5_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1822 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_6_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1823 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_src1_value : rob_uop_7_src1_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1824 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_0_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1825 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_1_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1826 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_2_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1827 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_3_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1828 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_4_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1829 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_5_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1830 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_6_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [63:0] _GEN_1831 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_src2_value : rob_uop_7_src2_value; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1840 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_0_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1841 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_1_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1842 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_2_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1843 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_3_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1844 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_4_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1845 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_5_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1846 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_6_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1847 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_op1_sel : rob_uop_7_op1_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1848 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_0_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1849 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_1_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1850 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_2_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1851 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_3_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1852 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_4_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1853 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_5_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1854 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_6_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1855 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_op2_sel : rob_uop_7_op2_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1856 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_0_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1857 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_1_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1858 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_2_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1859 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_3_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1860 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_4_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1861 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_5_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1862 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_6_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [4:0] _GEN_1863 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_alu_sel : rob_uop_7_alu_sel; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1864 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_0_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1865 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_1_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1866 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_2_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1867 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_3_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1868 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_4_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1869 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_5_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1870 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_6_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [3:0] _GEN_1871 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_branch_type : rob_uop_7_branch_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1872 = 3'h0 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_0_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1873 = 3'h1 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_1_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1874 = 3'h2 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_2_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1875 = 3'h3 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_3_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1876 = 3'h4 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_4_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1877 = 3'h5 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_5_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1878 = 3'h6 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_6_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire [2:0] _GEN_1879 = 3'h7 == allocate_ptr[2:0] ? _rob_uop_T_mem_type : rob_uop_7_mem_type; // @[rob.scala 149:{31,31} 86:26]
  wire  _GEN_1896 = need_to_rbk_dispatch ? _GEN_1632 : rob_uop_0_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1897 = need_to_rbk_dispatch ? _GEN_1633 : rob_uop_1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1898 = need_to_rbk_dispatch ? _GEN_1634 : rob_uop_2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1899 = need_to_rbk_dispatch ? _GEN_1635 : rob_uop_3_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1900 = need_to_rbk_dispatch ? _GEN_1636 : rob_uop_4_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1901 = need_to_rbk_dispatch ? _GEN_1637 : rob_uop_5_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1902 = need_to_rbk_dispatch ? _GEN_1638 : rob_uop_6_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1903 = need_to_rbk_dispatch ? _GEN_1639 : rob_uop_7_valid; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1904 = need_to_rbk_dispatch ? _GEN_1640 : rob_uop_0_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1905 = need_to_rbk_dispatch ? _GEN_1641 : rob_uop_1_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1906 = need_to_rbk_dispatch ? _GEN_1642 : rob_uop_2_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1907 = need_to_rbk_dispatch ? _GEN_1643 : rob_uop_3_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1908 = need_to_rbk_dispatch ? _GEN_1644 : rob_uop_4_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1909 = need_to_rbk_dispatch ? _GEN_1645 : rob_uop_5_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1910 = need_to_rbk_dispatch ? _GEN_1646 : rob_uop_6_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1911 = need_to_rbk_dispatch ? _GEN_1647 : rob_uop_7_pc; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1912 = need_to_rbk_dispatch ? _GEN_1648 : rob_uop_0_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1913 = need_to_rbk_dispatch ? _GEN_1649 : rob_uop_1_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1914 = need_to_rbk_dispatch ? _GEN_1650 : rob_uop_2_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1915 = need_to_rbk_dispatch ? _GEN_1651 : rob_uop_3_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1916 = need_to_rbk_dispatch ? _GEN_1652 : rob_uop_4_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1917 = need_to_rbk_dispatch ? _GEN_1653 : rob_uop_5_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1918 = need_to_rbk_dispatch ? _GEN_1654 : rob_uop_6_inst; // @[rob.scala 148:89 86:26]
  wire [31:0] _GEN_1919 = need_to_rbk_dispatch ? _GEN_1655 : rob_uop_7_inst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1920 = need_to_rbk_dispatch ? _GEN_1656 : rob_uop_0_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1921 = need_to_rbk_dispatch ? _GEN_1657 : rob_uop_1_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1922 = need_to_rbk_dispatch ? _GEN_1658 : rob_uop_2_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1923 = need_to_rbk_dispatch ? _GEN_1659 : rob_uop_3_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1924 = need_to_rbk_dispatch ? _GEN_1660 : rob_uop_4_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1925 = need_to_rbk_dispatch ? _GEN_1661 : rob_uop_5_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1926 = need_to_rbk_dispatch ? _GEN_1662 : rob_uop_6_func_code; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1927 = need_to_rbk_dispatch ? _GEN_1663 : rob_uop_7_func_code; // @[rob.scala 148:89 86:26]
  wire  _GEN_1928 = need_to_rbk_dispatch ? _GEN_1664 : rob_uop_0_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1929 = need_to_rbk_dispatch ? _GEN_1665 : rob_uop_1_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1930 = need_to_rbk_dispatch ? _GEN_1666 : rob_uop_2_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1931 = need_to_rbk_dispatch ? _GEN_1667 : rob_uop_3_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1932 = need_to_rbk_dispatch ? _GEN_1668 : rob_uop_4_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1933 = need_to_rbk_dispatch ? _GEN_1669 : rob_uop_5_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1934 = need_to_rbk_dispatch ? _GEN_1670 : rob_uop_6_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_1935 = need_to_rbk_dispatch ? _GEN_1671 : rob_uop_7_branch_predict_pack_valid; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1936 = need_to_rbk_dispatch ? _GEN_1672 : rob_uop_0_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1937 = need_to_rbk_dispatch ? _GEN_1673 : rob_uop_1_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1938 = need_to_rbk_dispatch ? _GEN_1674 : rob_uop_2_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1939 = need_to_rbk_dispatch ? _GEN_1675 : rob_uop_3_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1940 = need_to_rbk_dispatch ? _GEN_1676 : rob_uop_4_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1941 = need_to_rbk_dispatch ? _GEN_1677 : rob_uop_5_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1942 = need_to_rbk_dispatch ? _GEN_1678 : rob_uop_6_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_1943 = need_to_rbk_dispatch ? _GEN_1679 : rob_uop_7_branch_predict_pack_target; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1944 = need_to_rbk_dispatch ? _GEN_1680 : rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1945 = need_to_rbk_dispatch ? _GEN_1681 : rob_uop_1_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1946 = need_to_rbk_dispatch ? _GEN_1682 : rob_uop_2_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1947 = need_to_rbk_dispatch ? _GEN_1683 : rob_uop_3_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1948 = need_to_rbk_dispatch ? _GEN_1684 : rob_uop_4_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1949 = need_to_rbk_dispatch ? _GEN_1685 : rob_uop_5_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1950 = need_to_rbk_dispatch ? _GEN_1686 : rob_uop_6_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_1951 = need_to_rbk_dispatch ? _GEN_1687 : rob_uop_7_branch_predict_pack_branch_type; // @[rob.scala 148:89 86:26]
  wire  _GEN_1952 = need_to_rbk_dispatch ? _GEN_1688 : rob_uop_0_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1953 = need_to_rbk_dispatch ? _GEN_1689 : rob_uop_1_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1954 = need_to_rbk_dispatch ? _GEN_1690 : rob_uop_2_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1955 = need_to_rbk_dispatch ? _GEN_1691 : rob_uop_3_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1956 = need_to_rbk_dispatch ? _GEN_1692 : rob_uop_4_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1957 = need_to_rbk_dispatch ? _GEN_1693 : rob_uop_5_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1958 = need_to_rbk_dispatch ? _GEN_1694 : rob_uop_6_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1959 = need_to_rbk_dispatch ? _GEN_1695 : rob_uop_7_branch_predict_pack_select; // @[rob.scala 148:89 86:26]
  wire  _GEN_1960 = need_to_rbk_dispatch ? _GEN_1696 : rob_uop_0_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1961 = need_to_rbk_dispatch ? _GEN_1697 : rob_uop_1_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1962 = need_to_rbk_dispatch ? _GEN_1698 : rob_uop_2_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1963 = need_to_rbk_dispatch ? _GEN_1699 : rob_uop_3_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1964 = need_to_rbk_dispatch ? _GEN_1700 : rob_uop_4_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1965 = need_to_rbk_dispatch ? _GEN_1701 : rob_uop_5_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1966 = need_to_rbk_dispatch ? _GEN_1702 : rob_uop_6_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire  _GEN_1967 = need_to_rbk_dispatch ? _GEN_1703 : rob_uop_7_branch_predict_pack_taken; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1968 = need_to_rbk_dispatch ? _GEN_1704 : rob_uop_0_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1969 = need_to_rbk_dispatch ? _GEN_1705 : rob_uop_1_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1970 = need_to_rbk_dispatch ? _GEN_1706 : rob_uop_2_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1971 = need_to_rbk_dispatch ? _GEN_1707 : rob_uop_3_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1972 = need_to_rbk_dispatch ? _GEN_1708 : rob_uop_4_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1973 = need_to_rbk_dispatch ? _GEN_1709 : rob_uop_5_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1974 = need_to_rbk_dispatch ? _GEN_1710 : rob_uop_6_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1975 = need_to_rbk_dispatch ? _GEN_1711 : rob_uop_7_phy_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1976 = need_to_rbk_dispatch ? _GEN_1712 : rob_uop_0_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1977 = need_to_rbk_dispatch ? _GEN_1713 : rob_uop_1_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1978 = need_to_rbk_dispatch ? _GEN_1714 : rob_uop_2_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1979 = need_to_rbk_dispatch ? _GEN_1715 : rob_uop_3_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1980 = need_to_rbk_dispatch ? _GEN_1716 : rob_uop_4_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1981 = need_to_rbk_dispatch ? _GEN_1717 : rob_uop_5_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1982 = need_to_rbk_dispatch ? _GEN_1718 : rob_uop_6_stale_dst; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_1983 = need_to_rbk_dispatch ? _GEN_1719 : rob_uop_7_stale_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1984 = need_to_rbk_dispatch ? _GEN_1720 : rob_uop_0_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1985 = need_to_rbk_dispatch ? _GEN_1721 : rob_uop_1_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1986 = need_to_rbk_dispatch ? _GEN_1722 : rob_uop_2_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1987 = need_to_rbk_dispatch ? _GEN_1723 : rob_uop_3_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1988 = need_to_rbk_dispatch ? _GEN_1724 : rob_uop_4_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1989 = need_to_rbk_dispatch ? _GEN_1725 : rob_uop_5_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1990 = need_to_rbk_dispatch ? _GEN_1726 : rob_uop_6_arch_dst; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_1991 = need_to_rbk_dispatch ? _GEN_1727 : rob_uop_7_arch_dst; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1992 = need_to_rbk_dispatch ? _GEN_1728 : rob_uop_0_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1993 = need_to_rbk_dispatch ? _GEN_1729 : rob_uop_1_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1994 = need_to_rbk_dispatch ? _GEN_1730 : rob_uop_2_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1995 = need_to_rbk_dispatch ? _GEN_1731 : rob_uop_3_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1996 = need_to_rbk_dispatch ? _GEN_1732 : rob_uop_4_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1997 = need_to_rbk_dispatch ? _GEN_1733 : rob_uop_5_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1998 = need_to_rbk_dispatch ? _GEN_1734 : rob_uop_6_inst_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_1999 = need_to_rbk_dispatch ? _GEN_1735 : rob_uop_7_inst_type; // @[rob.scala 148:89 86:26]
  wire  _GEN_2000 = need_to_rbk_dispatch ? _GEN_1736 : rob_uop_0_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2001 = need_to_rbk_dispatch ? _GEN_1737 : rob_uop_1_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2002 = need_to_rbk_dispatch ? _GEN_1738 : rob_uop_2_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2003 = need_to_rbk_dispatch ? _GEN_1739 : rob_uop_3_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2004 = need_to_rbk_dispatch ? _GEN_1740 : rob_uop_4_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2005 = need_to_rbk_dispatch ? _GEN_1741 : rob_uop_5_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2006 = need_to_rbk_dispatch ? _GEN_1742 : rob_uop_6_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2007 = need_to_rbk_dispatch ? _GEN_1743 : rob_uop_7_regWen; // @[rob.scala 148:89 86:26]
  wire  _GEN_2008 = need_to_rbk_dispatch ? _GEN_1744 : rob_uop_0_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2009 = need_to_rbk_dispatch ? _GEN_1745 : rob_uop_1_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2010 = need_to_rbk_dispatch ? _GEN_1746 : rob_uop_2_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2011 = need_to_rbk_dispatch ? _GEN_1747 : rob_uop_3_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2012 = need_to_rbk_dispatch ? _GEN_1748 : rob_uop_4_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2013 = need_to_rbk_dispatch ? _GEN_1749 : rob_uop_5_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2014 = need_to_rbk_dispatch ? _GEN_1750 : rob_uop_6_src1_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2015 = need_to_rbk_dispatch ? _GEN_1751 : rob_uop_7_src1_valid; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2016 = need_to_rbk_dispatch ? _GEN_1752 : rob_uop_0_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2017 = need_to_rbk_dispatch ? _GEN_1753 : rob_uop_1_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2018 = need_to_rbk_dispatch ? _GEN_1754 : rob_uop_2_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2019 = need_to_rbk_dispatch ? _GEN_1755 : rob_uop_3_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2020 = need_to_rbk_dispatch ? _GEN_1756 : rob_uop_4_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2021 = need_to_rbk_dispatch ? _GEN_1757 : rob_uop_5_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2022 = need_to_rbk_dispatch ? _GEN_1758 : rob_uop_6_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2023 = need_to_rbk_dispatch ? _GEN_1759 : rob_uop_7_phy_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2024 = need_to_rbk_dispatch ? _GEN_1760 : rob_uop_0_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2025 = need_to_rbk_dispatch ? _GEN_1761 : rob_uop_1_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2026 = need_to_rbk_dispatch ? _GEN_1762 : rob_uop_2_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2027 = need_to_rbk_dispatch ? _GEN_1763 : rob_uop_3_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2028 = need_to_rbk_dispatch ? _GEN_1764 : rob_uop_4_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2029 = need_to_rbk_dispatch ? _GEN_1765 : rob_uop_5_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2030 = need_to_rbk_dispatch ? _GEN_1766 : rob_uop_6_arch_rs1; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2031 = need_to_rbk_dispatch ? _GEN_1767 : rob_uop_7_arch_rs1; // @[rob.scala 148:89 86:26]
  wire  _GEN_2032 = need_to_rbk_dispatch ? _GEN_1768 : rob_uop_0_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2033 = need_to_rbk_dispatch ? _GEN_1769 : rob_uop_1_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2034 = need_to_rbk_dispatch ? _GEN_1770 : rob_uop_2_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2035 = need_to_rbk_dispatch ? _GEN_1771 : rob_uop_3_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2036 = need_to_rbk_dispatch ? _GEN_1772 : rob_uop_4_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2037 = need_to_rbk_dispatch ? _GEN_1773 : rob_uop_5_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2038 = need_to_rbk_dispatch ? _GEN_1774 : rob_uop_6_src2_valid; // @[rob.scala 148:89 86:26]
  wire  _GEN_2039 = need_to_rbk_dispatch ? _GEN_1775 : rob_uop_7_src2_valid; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2040 = need_to_rbk_dispatch ? _GEN_1776 : rob_uop_0_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2041 = need_to_rbk_dispatch ? _GEN_1777 : rob_uop_1_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2042 = need_to_rbk_dispatch ? _GEN_1778 : rob_uop_2_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2043 = need_to_rbk_dispatch ? _GEN_1779 : rob_uop_3_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2044 = need_to_rbk_dispatch ? _GEN_1780 : rob_uop_4_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2045 = need_to_rbk_dispatch ? _GEN_1781 : rob_uop_5_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2046 = need_to_rbk_dispatch ? _GEN_1782 : rob_uop_6_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [6:0] _GEN_2047 = need_to_rbk_dispatch ? _GEN_1783 : rob_uop_7_phy_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2048 = need_to_rbk_dispatch ? _GEN_1784 : rob_uop_0_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2049 = need_to_rbk_dispatch ? _GEN_1785 : rob_uop_1_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2050 = need_to_rbk_dispatch ? _GEN_1786 : rob_uop_2_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2051 = need_to_rbk_dispatch ? _GEN_1787 : rob_uop_3_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2052 = need_to_rbk_dispatch ? _GEN_1788 : rob_uop_4_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2053 = need_to_rbk_dispatch ? _GEN_1789 : rob_uop_5_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2054 = need_to_rbk_dispatch ? _GEN_1790 : rob_uop_6_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2055 = need_to_rbk_dispatch ? _GEN_1791 : rob_uop_7_arch_rs2; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2056 = need_to_rbk_dispatch ? _GEN_1264 : rob_uop_0_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2057 = need_to_rbk_dispatch ? _GEN_1265 : rob_uop_1_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2058 = need_to_rbk_dispatch ? _GEN_1266 : rob_uop_2_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2059 = need_to_rbk_dispatch ? _GEN_1267 : rob_uop_3_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2060 = need_to_rbk_dispatch ? _GEN_1268 : rob_uop_4_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2061 = need_to_rbk_dispatch ? _GEN_1269 : rob_uop_5_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2062 = need_to_rbk_dispatch ? _GEN_1270 : rob_uop_6_rob_idx; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2063 = need_to_rbk_dispatch ? _GEN_1271 : rob_uop_7_rob_idx; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2064 = need_to_rbk_dispatch ? _GEN_1800 : rob_uop_0_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2065 = need_to_rbk_dispatch ? _GEN_1801 : rob_uop_1_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2066 = need_to_rbk_dispatch ? _GEN_1802 : rob_uop_2_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2067 = need_to_rbk_dispatch ? _GEN_1803 : rob_uop_3_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2068 = need_to_rbk_dispatch ? _GEN_1804 : rob_uop_4_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2069 = need_to_rbk_dispatch ? _GEN_1805 : rob_uop_5_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2070 = need_to_rbk_dispatch ? _GEN_1806 : rob_uop_6_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2071 = need_to_rbk_dispatch ? _GEN_1807 : rob_uop_7_imm; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2072 = need_to_rbk_dispatch ? _GEN_1280 : rob_uop_0_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2073 = need_to_rbk_dispatch ? _GEN_1281 : rob_uop_1_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2074 = need_to_rbk_dispatch ? _GEN_1282 : rob_uop_2_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2075 = need_to_rbk_dispatch ? _GEN_1283 : rob_uop_3_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2076 = need_to_rbk_dispatch ? _GEN_1284 : rob_uop_4_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2077 = need_to_rbk_dispatch ? _GEN_1285 : rob_uop_5_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2078 = need_to_rbk_dispatch ? _GEN_1286 : rob_uop_6_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2079 = need_to_rbk_dispatch ? _GEN_1287 : rob_uop_7_dst_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2080 = need_to_rbk_dispatch ? _GEN_1816 : rob_uop_0_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2081 = need_to_rbk_dispatch ? _GEN_1817 : rob_uop_1_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2082 = need_to_rbk_dispatch ? _GEN_1818 : rob_uop_2_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2083 = need_to_rbk_dispatch ? _GEN_1819 : rob_uop_3_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2084 = need_to_rbk_dispatch ? _GEN_1820 : rob_uop_4_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2085 = need_to_rbk_dispatch ? _GEN_1821 : rob_uop_5_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2086 = need_to_rbk_dispatch ? _GEN_1822 : rob_uop_6_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2087 = need_to_rbk_dispatch ? _GEN_1823 : rob_uop_7_src1_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2088 = need_to_rbk_dispatch ? _GEN_1824 : rob_uop_0_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2089 = need_to_rbk_dispatch ? _GEN_1825 : rob_uop_1_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2090 = need_to_rbk_dispatch ? _GEN_1826 : rob_uop_2_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2091 = need_to_rbk_dispatch ? _GEN_1827 : rob_uop_3_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2092 = need_to_rbk_dispatch ? _GEN_1828 : rob_uop_4_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2093 = need_to_rbk_dispatch ? _GEN_1829 : rob_uop_5_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2094 = need_to_rbk_dispatch ? _GEN_1830 : rob_uop_6_src2_value; // @[rob.scala 148:89 86:26]
  wire [63:0] _GEN_2095 = need_to_rbk_dispatch ? _GEN_1831 : rob_uop_7_src2_value; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2104 = need_to_rbk_dispatch ? _GEN_1840 : rob_uop_0_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2105 = need_to_rbk_dispatch ? _GEN_1841 : rob_uop_1_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2106 = need_to_rbk_dispatch ? _GEN_1842 : rob_uop_2_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2107 = need_to_rbk_dispatch ? _GEN_1843 : rob_uop_3_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2108 = need_to_rbk_dispatch ? _GEN_1844 : rob_uop_4_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2109 = need_to_rbk_dispatch ? _GEN_1845 : rob_uop_5_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2110 = need_to_rbk_dispatch ? _GEN_1846 : rob_uop_6_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2111 = need_to_rbk_dispatch ? _GEN_1847 : rob_uop_7_op1_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2112 = need_to_rbk_dispatch ? _GEN_1848 : rob_uop_0_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2113 = need_to_rbk_dispatch ? _GEN_1849 : rob_uop_1_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2114 = need_to_rbk_dispatch ? _GEN_1850 : rob_uop_2_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2115 = need_to_rbk_dispatch ? _GEN_1851 : rob_uop_3_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2116 = need_to_rbk_dispatch ? _GEN_1852 : rob_uop_4_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2117 = need_to_rbk_dispatch ? _GEN_1853 : rob_uop_5_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2118 = need_to_rbk_dispatch ? _GEN_1854 : rob_uop_6_op2_sel; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2119 = need_to_rbk_dispatch ? _GEN_1855 : rob_uop_7_op2_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2120 = need_to_rbk_dispatch ? _GEN_1856 : rob_uop_0_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2121 = need_to_rbk_dispatch ? _GEN_1857 : rob_uop_1_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2122 = need_to_rbk_dispatch ? _GEN_1858 : rob_uop_2_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2123 = need_to_rbk_dispatch ? _GEN_1859 : rob_uop_3_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2124 = need_to_rbk_dispatch ? _GEN_1860 : rob_uop_4_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2125 = need_to_rbk_dispatch ? _GEN_1861 : rob_uop_5_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2126 = need_to_rbk_dispatch ? _GEN_1862 : rob_uop_6_alu_sel; // @[rob.scala 148:89 86:26]
  wire [4:0] _GEN_2127 = need_to_rbk_dispatch ? _GEN_1863 : rob_uop_7_alu_sel; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2128 = need_to_rbk_dispatch ? _GEN_1864 : rob_uop_0_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2129 = need_to_rbk_dispatch ? _GEN_1865 : rob_uop_1_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2130 = need_to_rbk_dispatch ? _GEN_1866 : rob_uop_2_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2131 = need_to_rbk_dispatch ? _GEN_1867 : rob_uop_3_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2132 = need_to_rbk_dispatch ? _GEN_1868 : rob_uop_4_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2133 = need_to_rbk_dispatch ? _GEN_1869 : rob_uop_5_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2134 = need_to_rbk_dispatch ? _GEN_1870 : rob_uop_6_branch_type; // @[rob.scala 148:89 86:26]
  wire [3:0] _GEN_2135 = need_to_rbk_dispatch ? _GEN_1871 : rob_uop_7_branch_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2136 = need_to_rbk_dispatch ? _GEN_1872 : rob_uop_0_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2137 = need_to_rbk_dispatch ? _GEN_1873 : rob_uop_1_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2138 = need_to_rbk_dispatch ? _GEN_1874 : rob_uop_2_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2139 = need_to_rbk_dispatch ? _GEN_1875 : rob_uop_3_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2140 = need_to_rbk_dispatch ? _GEN_1876 : rob_uop_4_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2141 = need_to_rbk_dispatch ? _GEN_1877 : rob_uop_5_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2142 = need_to_rbk_dispatch ? _GEN_1878 : rob_uop_6_mem_type; // @[rob.scala 148:89 86:26]
  wire [2:0] _GEN_2143 = need_to_rbk_dispatch ? _GEN_1879 : rob_uop_7_mem_type; // @[rob.scala 148:89 86:26]
  wire  _GEN_2144 = need_to_rbk_dispatch ? _GEN_1352 : rob_valid_0; // @[rob.scala 148:89 85:28]
  wire  _GEN_2145 = need_to_rbk_dispatch ? _GEN_1353 : rob_valid_1; // @[rob.scala 148:89 85:28]
  wire  _GEN_2146 = need_to_rbk_dispatch ? _GEN_1354 : rob_valid_2; // @[rob.scala 148:89 85:28]
  wire  _GEN_2147 = need_to_rbk_dispatch ? _GEN_1355 : rob_valid_3; // @[rob.scala 148:89 85:28]
  wire  _GEN_2148 = need_to_rbk_dispatch ? _GEN_1356 : rob_valid_4; // @[rob.scala 148:89 85:28]
  wire  _GEN_2149 = need_to_rbk_dispatch ? _GEN_1357 : rob_valid_5; // @[rob.scala 148:89 85:28]
  wire  _GEN_2150 = need_to_rbk_dispatch ? _GEN_1358 : rob_valid_6; // @[rob.scala 148:89 85:28]
  wire  _GEN_2151 = need_to_rbk_dispatch ? _GEN_1359 : rob_valid_7; // @[rob.scala 148:89 85:28]
  wire [3:0] _GEN_2152 = need_to_rbk_dispatch ? _is_full_T_6 : allocate_ptr; // @[rob.scala 148:89 152:22 49:31]
  wire  _GEN_2153 = need_to_rbk_dispatch ? _GEN_1360 : rob_done_0; // @[rob.scala 148:89 88:27]
  wire  _GEN_2154 = need_to_rbk_dispatch ? _GEN_1361 : rob_done_1; // @[rob.scala 148:89 88:27]
  wire  _GEN_2155 = need_to_rbk_dispatch ? _GEN_1362 : rob_done_2; // @[rob.scala 148:89 88:27]
  wire  _GEN_2156 = need_to_rbk_dispatch ? _GEN_1363 : rob_done_3; // @[rob.scala 148:89 88:27]
  wire  _GEN_2157 = need_to_rbk_dispatch ? _GEN_1364 : rob_done_4; // @[rob.scala 148:89 88:27]
  wire  _GEN_2158 = need_to_rbk_dispatch ? _GEN_1365 : rob_done_5; // @[rob.scala 148:89 88:27]
  wire  _GEN_2159 = need_to_rbk_dispatch ? _GEN_1366 : rob_done_6; // @[rob.scala 148:89 88:27]
  wire  _GEN_2160 = need_to_rbk_dispatch ? _GEN_1367 : rob_done_7; // @[rob.scala 148:89 88:27]
  wire  _GEN_2161 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1368 : _GEN_1896; // @[rob.scala 139:83]
  wire  _GEN_2162 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1369 : _GEN_1897; // @[rob.scala 139:83]
  wire  _GEN_2163 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1370 : _GEN_1898; // @[rob.scala 139:83]
  wire  _GEN_2164 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1371 : _GEN_1899; // @[rob.scala 139:83]
  wire  _GEN_2165 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1372 : _GEN_1900; // @[rob.scala 139:83]
  wire  _GEN_2166 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1373 : _GEN_1901; // @[rob.scala 139:83]
  wire  _GEN_2167 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1374 : _GEN_1902; // @[rob.scala 139:83]
  wire  _GEN_2168 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1375 : _GEN_1903; // @[rob.scala 139:83]
  wire [31:0] _GEN_2169 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1376 : _GEN_1904; // @[rob.scala 139:83]
  wire [31:0] _GEN_2170 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1377 : _GEN_1905; // @[rob.scala 139:83]
  wire [31:0] _GEN_2171 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1378 : _GEN_1906; // @[rob.scala 139:83]
  wire [31:0] _GEN_2172 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1379 : _GEN_1907; // @[rob.scala 139:83]
  wire [31:0] _GEN_2173 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1380 : _GEN_1908; // @[rob.scala 139:83]
  wire [31:0] _GEN_2174 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1381 : _GEN_1909; // @[rob.scala 139:83]
  wire [31:0] _GEN_2175 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1382 : _GEN_1910; // @[rob.scala 139:83]
  wire [31:0] _GEN_2176 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1383 : _GEN_1911; // @[rob.scala 139:83]
  wire [31:0] _GEN_2177 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1384 : _GEN_1912; // @[rob.scala 139:83]
  wire [31:0] _GEN_2178 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1385 : _GEN_1913; // @[rob.scala 139:83]
  wire [31:0] _GEN_2179 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1386 : _GEN_1914; // @[rob.scala 139:83]
  wire [31:0] _GEN_2180 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1387 : _GEN_1915; // @[rob.scala 139:83]
  wire [31:0] _GEN_2181 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1388 : _GEN_1916; // @[rob.scala 139:83]
  wire [31:0] _GEN_2182 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1389 : _GEN_1917; // @[rob.scala 139:83]
  wire [31:0] _GEN_2183 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1390 : _GEN_1918; // @[rob.scala 139:83]
  wire [31:0] _GEN_2184 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1391 : _GEN_1919; // @[rob.scala 139:83]
  wire [6:0] _GEN_2185 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1392 : _GEN_1920; // @[rob.scala 139:83]
  wire [6:0] _GEN_2186 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1393 : _GEN_1921; // @[rob.scala 139:83]
  wire [6:0] _GEN_2187 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1394 : _GEN_1922; // @[rob.scala 139:83]
  wire [6:0] _GEN_2188 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1395 : _GEN_1923; // @[rob.scala 139:83]
  wire [6:0] _GEN_2189 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1396 : _GEN_1924; // @[rob.scala 139:83]
  wire [6:0] _GEN_2190 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1397 : _GEN_1925; // @[rob.scala 139:83]
  wire [6:0] _GEN_2191 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1398 : _GEN_1926; // @[rob.scala 139:83]
  wire [6:0] _GEN_2192 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1399 : _GEN_1927; // @[rob.scala 139:83]
  wire  _GEN_2193 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1400 : _GEN_1928; // @[rob.scala 139:83]
  wire  _GEN_2194 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1401 : _GEN_1929; // @[rob.scala 139:83]
  wire  _GEN_2195 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1402 : _GEN_1930; // @[rob.scala 139:83]
  wire  _GEN_2196 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1403 : _GEN_1931; // @[rob.scala 139:83]
  wire  _GEN_2197 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1404 : _GEN_1932; // @[rob.scala 139:83]
  wire  _GEN_2198 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1405 : _GEN_1933; // @[rob.scala 139:83]
  wire  _GEN_2199 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1406 : _GEN_1934; // @[rob.scala 139:83]
  wire  _GEN_2200 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1407 : _GEN_1935; // @[rob.scala 139:83]
  wire [63:0] _GEN_2201 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1408 : _GEN_1936; // @[rob.scala 139:83]
  wire [63:0] _GEN_2202 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1409 : _GEN_1937; // @[rob.scala 139:83]
  wire [63:0] _GEN_2203 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1410 : _GEN_1938; // @[rob.scala 139:83]
  wire [63:0] _GEN_2204 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1411 : _GEN_1939; // @[rob.scala 139:83]
  wire [63:0] _GEN_2205 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1412 : _GEN_1940; // @[rob.scala 139:83]
  wire [63:0] _GEN_2206 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1413 : _GEN_1941; // @[rob.scala 139:83]
  wire [63:0] _GEN_2207 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1414 : _GEN_1942; // @[rob.scala 139:83]
  wire [63:0] _GEN_2208 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1415 : _GEN_1943; // @[rob.scala 139:83]
  wire [3:0] _GEN_2209 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1416 : _GEN_1944; // @[rob.scala 139:83]
  wire [3:0] _GEN_2210 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1417 : _GEN_1945; // @[rob.scala 139:83]
  wire [3:0] _GEN_2211 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1418 : _GEN_1946; // @[rob.scala 139:83]
  wire [3:0] _GEN_2212 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1419 : _GEN_1947; // @[rob.scala 139:83]
  wire [3:0] _GEN_2213 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1420 : _GEN_1948; // @[rob.scala 139:83]
  wire [3:0] _GEN_2214 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1421 : _GEN_1949; // @[rob.scala 139:83]
  wire [3:0] _GEN_2215 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1422 : _GEN_1950; // @[rob.scala 139:83]
  wire [3:0] _GEN_2216 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1423 : _GEN_1951; // @[rob.scala 139:83]
  wire  _GEN_2217 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1424 : _GEN_1952; // @[rob.scala 139:83]
  wire  _GEN_2218 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1425 : _GEN_1953; // @[rob.scala 139:83]
  wire  _GEN_2219 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1426 : _GEN_1954; // @[rob.scala 139:83]
  wire  _GEN_2220 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1427 : _GEN_1955; // @[rob.scala 139:83]
  wire  _GEN_2221 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1428 : _GEN_1956; // @[rob.scala 139:83]
  wire  _GEN_2222 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1429 : _GEN_1957; // @[rob.scala 139:83]
  wire  _GEN_2223 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1430 : _GEN_1958; // @[rob.scala 139:83]
  wire  _GEN_2224 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1431 : _GEN_1959; // @[rob.scala 139:83]
  wire  _GEN_2225 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1432 : _GEN_1960; // @[rob.scala 139:83]
  wire  _GEN_2226 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1433 : _GEN_1961; // @[rob.scala 139:83]
  wire  _GEN_2227 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1434 : _GEN_1962; // @[rob.scala 139:83]
  wire  _GEN_2228 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1435 : _GEN_1963; // @[rob.scala 139:83]
  wire  _GEN_2229 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1436 : _GEN_1964; // @[rob.scala 139:83]
  wire  _GEN_2230 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1437 : _GEN_1965; // @[rob.scala 139:83]
  wire  _GEN_2231 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1438 : _GEN_1966; // @[rob.scala 139:83]
  wire  _GEN_2232 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1439 : _GEN_1967; // @[rob.scala 139:83]
  wire [6:0] _GEN_2233 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1440 : _GEN_1968; // @[rob.scala 139:83]
  wire [6:0] _GEN_2234 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1441 : _GEN_1969; // @[rob.scala 139:83]
  wire [6:0] _GEN_2235 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1442 : _GEN_1970; // @[rob.scala 139:83]
  wire [6:0] _GEN_2236 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1443 : _GEN_1971; // @[rob.scala 139:83]
  wire [6:0] _GEN_2237 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1444 : _GEN_1972; // @[rob.scala 139:83]
  wire [6:0] _GEN_2238 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1445 : _GEN_1973; // @[rob.scala 139:83]
  wire [6:0] _GEN_2239 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1446 : _GEN_1974; // @[rob.scala 139:83]
  wire [6:0] _GEN_2240 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1447 : _GEN_1975; // @[rob.scala 139:83]
  wire [6:0] _GEN_2241 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1448 : _GEN_1976; // @[rob.scala 139:83]
  wire [6:0] _GEN_2242 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1449 : _GEN_1977; // @[rob.scala 139:83]
  wire [6:0] _GEN_2243 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1450 : _GEN_1978; // @[rob.scala 139:83]
  wire [6:0] _GEN_2244 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1451 : _GEN_1979; // @[rob.scala 139:83]
  wire [6:0] _GEN_2245 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1452 : _GEN_1980; // @[rob.scala 139:83]
  wire [6:0] _GEN_2246 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1453 : _GEN_1981; // @[rob.scala 139:83]
  wire [6:0] _GEN_2247 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1454 : _GEN_1982; // @[rob.scala 139:83]
  wire [6:0] _GEN_2248 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1455 : _GEN_1983; // @[rob.scala 139:83]
  wire [4:0] _GEN_2249 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1456 : _GEN_1984; // @[rob.scala 139:83]
  wire [4:0] _GEN_2250 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1457 : _GEN_1985; // @[rob.scala 139:83]
  wire [4:0] _GEN_2251 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1458 : _GEN_1986; // @[rob.scala 139:83]
  wire [4:0] _GEN_2252 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1459 : _GEN_1987; // @[rob.scala 139:83]
  wire [4:0] _GEN_2253 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1460 : _GEN_1988; // @[rob.scala 139:83]
  wire [4:0] _GEN_2254 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1461 : _GEN_1989; // @[rob.scala 139:83]
  wire [4:0] _GEN_2255 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1462 : _GEN_1990; // @[rob.scala 139:83]
  wire [4:0] _GEN_2256 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1463 : _GEN_1991; // @[rob.scala 139:83]
  wire [2:0] _GEN_2257 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1464 : _GEN_1992; // @[rob.scala 139:83]
  wire [2:0] _GEN_2258 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1465 : _GEN_1993; // @[rob.scala 139:83]
  wire [2:0] _GEN_2259 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1466 : _GEN_1994; // @[rob.scala 139:83]
  wire [2:0] _GEN_2260 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1467 : _GEN_1995; // @[rob.scala 139:83]
  wire [2:0] _GEN_2261 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1468 : _GEN_1996; // @[rob.scala 139:83]
  wire [2:0] _GEN_2262 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1469 : _GEN_1997; // @[rob.scala 139:83]
  wire [2:0] _GEN_2263 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1470 : _GEN_1998; // @[rob.scala 139:83]
  wire [2:0] _GEN_2264 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1471 : _GEN_1999; // @[rob.scala 139:83]
  wire  _GEN_2265 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1472 : _GEN_2000; // @[rob.scala 139:83]
  wire  _GEN_2266 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1473 : _GEN_2001; // @[rob.scala 139:83]
  wire  _GEN_2267 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1474 : _GEN_2002; // @[rob.scala 139:83]
  wire  _GEN_2268 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1475 : _GEN_2003; // @[rob.scala 139:83]
  wire  _GEN_2269 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1476 : _GEN_2004; // @[rob.scala 139:83]
  wire  _GEN_2270 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1477 : _GEN_2005; // @[rob.scala 139:83]
  wire  _GEN_2271 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1478 : _GEN_2006; // @[rob.scala 139:83]
  wire  _GEN_2272 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1479 : _GEN_2007; // @[rob.scala 139:83]
  wire  _GEN_2273 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1480 : _GEN_2008; // @[rob.scala 139:83]
  wire  _GEN_2274 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1481 : _GEN_2009; // @[rob.scala 139:83]
  wire  _GEN_2275 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1482 : _GEN_2010; // @[rob.scala 139:83]
  wire  _GEN_2276 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1483 : _GEN_2011; // @[rob.scala 139:83]
  wire  _GEN_2277 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1484 : _GEN_2012; // @[rob.scala 139:83]
  wire  _GEN_2278 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1485 : _GEN_2013; // @[rob.scala 139:83]
  wire  _GEN_2279 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1486 : _GEN_2014; // @[rob.scala 139:83]
  wire  _GEN_2280 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1487 : _GEN_2015; // @[rob.scala 139:83]
  wire [6:0] _GEN_2281 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1488 : _GEN_2016; // @[rob.scala 139:83]
  wire [6:0] _GEN_2282 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1489 : _GEN_2017; // @[rob.scala 139:83]
  wire [6:0] _GEN_2283 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1490 : _GEN_2018; // @[rob.scala 139:83]
  wire [6:0] _GEN_2284 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1491 : _GEN_2019; // @[rob.scala 139:83]
  wire [6:0] _GEN_2285 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1492 : _GEN_2020; // @[rob.scala 139:83]
  wire [6:0] _GEN_2286 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1493 : _GEN_2021; // @[rob.scala 139:83]
  wire [6:0] _GEN_2287 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1494 : _GEN_2022; // @[rob.scala 139:83]
  wire [6:0] _GEN_2288 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1495 : _GEN_2023; // @[rob.scala 139:83]
  wire [4:0] _GEN_2289 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1496 : _GEN_2024; // @[rob.scala 139:83]
  wire [4:0] _GEN_2290 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1497 : _GEN_2025; // @[rob.scala 139:83]
  wire [4:0] _GEN_2291 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1498 : _GEN_2026; // @[rob.scala 139:83]
  wire [4:0] _GEN_2292 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1499 : _GEN_2027; // @[rob.scala 139:83]
  wire [4:0] _GEN_2293 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1500 : _GEN_2028; // @[rob.scala 139:83]
  wire [4:0] _GEN_2294 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1501 : _GEN_2029; // @[rob.scala 139:83]
  wire [4:0] _GEN_2295 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1502 : _GEN_2030; // @[rob.scala 139:83]
  wire [4:0] _GEN_2296 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1503 : _GEN_2031; // @[rob.scala 139:83]
  wire  _GEN_2297 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1504 : _GEN_2032; // @[rob.scala 139:83]
  wire  _GEN_2298 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1505 : _GEN_2033; // @[rob.scala 139:83]
  wire  _GEN_2299 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1506 : _GEN_2034; // @[rob.scala 139:83]
  wire  _GEN_2300 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1507 : _GEN_2035; // @[rob.scala 139:83]
  wire  _GEN_2301 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1508 : _GEN_2036; // @[rob.scala 139:83]
  wire  _GEN_2302 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1509 : _GEN_2037; // @[rob.scala 139:83]
  wire  _GEN_2303 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1510 : _GEN_2038; // @[rob.scala 139:83]
  wire  _GEN_2304 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1511 : _GEN_2039; // @[rob.scala 139:83]
  wire [6:0] _GEN_2305 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1512 : _GEN_2040; // @[rob.scala 139:83]
  wire [6:0] _GEN_2306 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1513 : _GEN_2041; // @[rob.scala 139:83]
  wire [6:0] _GEN_2307 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1514 : _GEN_2042; // @[rob.scala 139:83]
  wire [6:0] _GEN_2308 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1515 : _GEN_2043; // @[rob.scala 139:83]
  wire [6:0] _GEN_2309 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1516 : _GEN_2044; // @[rob.scala 139:83]
  wire [6:0] _GEN_2310 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1517 : _GEN_2045; // @[rob.scala 139:83]
  wire [6:0] _GEN_2311 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1518 : _GEN_2046; // @[rob.scala 139:83]
  wire [6:0] _GEN_2312 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1519 : _GEN_2047; // @[rob.scala 139:83]
  wire [4:0] _GEN_2313 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1520 : _GEN_2048; // @[rob.scala 139:83]
  wire [4:0] _GEN_2314 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1521 : _GEN_2049; // @[rob.scala 139:83]
  wire [4:0] _GEN_2315 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1522 : _GEN_2050; // @[rob.scala 139:83]
  wire [4:0] _GEN_2316 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1523 : _GEN_2051; // @[rob.scala 139:83]
  wire [4:0] _GEN_2317 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1524 : _GEN_2052; // @[rob.scala 139:83]
  wire [4:0] _GEN_2318 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1525 : _GEN_2053; // @[rob.scala 139:83]
  wire [4:0] _GEN_2319 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1526 : _GEN_2054; // @[rob.scala 139:83]
  wire [4:0] _GEN_2320 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1527 : _GEN_2055; // @[rob.scala 139:83]
  wire [3:0] _GEN_2321 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1528 : _GEN_2056; // @[rob.scala 139:83]
  wire [3:0] _GEN_2322 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1529 : _GEN_2057; // @[rob.scala 139:83]
  wire [3:0] _GEN_2323 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1530 : _GEN_2058; // @[rob.scala 139:83]
  wire [3:0] _GEN_2324 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1531 : _GEN_2059; // @[rob.scala 139:83]
  wire [3:0] _GEN_2325 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1532 : _GEN_2060; // @[rob.scala 139:83]
  wire [3:0] _GEN_2326 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1533 : _GEN_2061; // @[rob.scala 139:83]
  wire [3:0] _GEN_2327 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1534 : _GEN_2062; // @[rob.scala 139:83]
  wire [3:0] _GEN_2328 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1535 : _GEN_2063; // @[rob.scala 139:83]
  wire [63:0] _GEN_2329 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1536 : _GEN_2064; // @[rob.scala 139:83]
  wire [63:0] _GEN_2330 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1537 : _GEN_2065; // @[rob.scala 139:83]
  wire [63:0] _GEN_2331 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1538 : _GEN_2066; // @[rob.scala 139:83]
  wire [63:0] _GEN_2332 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1539 : _GEN_2067; // @[rob.scala 139:83]
  wire [63:0] _GEN_2333 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1540 : _GEN_2068; // @[rob.scala 139:83]
  wire [63:0] _GEN_2334 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1541 : _GEN_2069; // @[rob.scala 139:83]
  wire [63:0] _GEN_2335 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1542 : _GEN_2070; // @[rob.scala 139:83]
  wire [63:0] _GEN_2336 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1543 : _GEN_2071; // @[rob.scala 139:83]
  wire [63:0] _GEN_2337 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1544 : _GEN_2072; // @[rob.scala 139:83]
  wire [63:0] _GEN_2338 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1545 : _GEN_2073; // @[rob.scala 139:83]
  wire [63:0] _GEN_2339 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1546 : _GEN_2074; // @[rob.scala 139:83]
  wire [63:0] _GEN_2340 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1547 : _GEN_2075; // @[rob.scala 139:83]
  wire [63:0] _GEN_2341 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1548 : _GEN_2076; // @[rob.scala 139:83]
  wire [63:0] _GEN_2342 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1549 : _GEN_2077; // @[rob.scala 139:83]
  wire [63:0] _GEN_2343 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1550 : _GEN_2078; // @[rob.scala 139:83]
  wire [63:0] _GEN_2344 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1551 : _GEN_2079; // @[rob.scala 139:83]
  wire [63:0] _GEN_2345 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1552 : _GEN_2080; // @[rob.scala 139:83]
  wire [63:0] _GEN_2346 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1553 : _GEN_2081; // @[rob.scala 139:83]
  wire [63:0] _GEN_2347 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1554 : _GEN_2082; // @[rob.scala 139:83]
  wire [63:0] _GEN_2348 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1555 : _GEN_2083; // @[rob.scala 139:83]
  wire [63:0] _GEN_2349 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1556 : _GEN_2084; // @[rob.scala 139:83]
  wire [63:0] _GEN_2350 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1557 : _GEN_2085; // @[rob.scala 139:83]
  wire [63:0] _GEN_2351 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1558 : _GEN_2086; // @[rob.scala 139:83]
  wire [63:0] _GEN_2352 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1559 : _GEN_2087; // @[rob.scala 139:83]
  wire [63:0] _GEN_2353 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1560 : _GEN_2088; // @[rob.scala 139:83]
  wire [63:0] _GEN_2354 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1561 : _GEN_2089; // @[rob.scala 139:83]
  wire [63:0] _GEN_2355 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1562 : _GEN_2090; // @[rob.scala 139:83]
  wire [63:0] _GEN_2356 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1563 : _GEN_2091; // @[rob.scala 139:83]
  wire [63:0] _GEN_2357 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1564 : _GEN_2092; // @[rob.scala 139:83]
  wire [63:0] _GEN_2358 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1565 : _GEN_2093; // @[rob.scala 139:83]
  wire [63:0] _GEN_2359 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1566 : _GEN_2094; // @[rob.scala 139:83]
  wire [63:0] _GEN_2360 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1567 : _GEN_2095; // @[rob.scala 139:83]
  wire [2:0] _GEN_2369 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1576 : _GEN_2104; // @[rob.scala 139:83]
  wire [2:0] _GEN_2370 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1577 : _GEN_2105; // @[rob.scala 139:83]
  wire [2:0] _GEN_2371 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1578 : _GEN_2106; // @[rob.scala 139:83]
  wire [2:0] _GEN_2372 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1579 : _GEN_2107; // @[rob.scala 139:83]
  wire [2:0] _GEN_2373 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1580 : _GEN_2108; // @[rob.scala 139:83]
  wire [2:0] _GEN_2374 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1581 : _GEN_2109; // @[rob.scala 139:83]
  wire [2:0] _GEN_2375 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1582 : _GEN_2110; // @[rob.scala 139:83]
  wire [2:0] _GEN_2376 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1583 : _GEN_2111; // @[rob.scala 139:83]
  wire [2:0] _GEN_2377 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1584 : _GEN_2112; // @[rob.scala 139:83]
  wire [2:0] _GEN_2378 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1585 : _GEN_2113; // @[rob.scala 139:83]
  wire [2:0] _GEN_2379 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1586 : _GEN_2114; // @[rob.scala 139:83]
  wire [2:0] _GEN_2380 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1587 : _GEN_2115; // @[rob.scala 139:83]
  wire [2:0] _GEN_2381 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1588 : _GEN_2116; // @[rob.scala 139:83]
  wire [2:0] _GEN_2382 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1589 : _GEN_2117; // @[rob.scala 139:83]
  wire [2:0] _GEN_2383 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1590 : _GEN_2118; // @[rob.scala 139:83]
  wire [2:0] _GEN_2384 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1591 : _GEN_2119; // @[rob.scala 139:83]
  wire [4:0] _GEN_2385 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1592 : _GEN_2120; // @[rob.scala 139:83]
  wire [4:0] _GEN_2386 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1593 : _GEN_2121; // @[rob.scala 139:83]
  wire [4:0] _GEN_2387 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1594 : _GEN_2122; // @[rob.scala 139:83]
  wire [4:0] _GEN_2388 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1595 : _GEN_2123; // @[rob.scala 139:83]
  wire [4:0] _GEN_2389 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1596 : _GEN_2124; // @[rob.scala 139:83]
  wire [4:0] _GEN_2390 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1597 : _GEN_2125; // @[rob.scala 139:83]
  wire [4:0] _GEN_2391 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1598 : _GEN_2126; // @[rob.scala 139:83]
  wire [4:0] _GEN_2392 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1599 : _GEN_2127; // @[rob.scala 139:83]
  wire [3:0] _GEN_2393 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1600 : _GEN_2128; // @[rob.scala 139:83]
  wire [3:0] _GEN_2394 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1601 : _GEN_2129; // @[rob.scala 139:83]
  wire [3:0] _GEN_2395 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1602 : _GEN_2130; // @[rob.scala 139:83]
  wire [3:0] _GEN_2396 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1603 : _GEN_2131; // @[rob.scala 139:83]
  wire [3:0] _GEN_2397 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1604 : _GEN_2132; // @[rob.scala 139:83]
  wire [3:0] _GEN_2398 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1605 : _GEN_2133; // @[rob.scala 139:83]
  wire [3:0] _GEN_2399 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1606 : _GEN_2134; // @[rob.scala 139:83]
  wire [3:0] _GEN_2400 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1607 : _GEN_2135; // @[rob.scala 139:83]
  wire [2:0] _GEN_2401 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1608 : _GEN_2136; // @[rob.scala 139:83]
  wire [2:0] _GEN_2402 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1609 : _GEN_2137; // @[rob.scala 139:83]
  wire [2:0] _GEN_2403 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1610 : _GEN_2138; // @[rob.scala 139:83]
  wire [2:0] _GEN_2404 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1611 : _GEN_2139; // @[rob.scala 139:83]
  wire [2:0] _GEN_2405 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1612 : _GEN_2140; // @[rob.scala 139:83]
  wire [2:0] _GEN_2406 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1613 : _GEN_2141; // @[rob.scala 139:83]
  wire [2:0] _GEN_2407 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1614 : _GEN_2142; // @[rob.scala 139:83]
  wire [2:0] _GEN_2408 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1615 : _GEN_2143; // @[rob.scala 139:83]
  wire  _GEN_2409 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1616 : _GEN_2144; // @[rob.scala 139:83]
  wire  _GEN_2410 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1617 : _GEN_2145; // @[rob.scala 139:83]
  wire  _GEN_2411 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1618 : _GEN_2146; // @[rob.scala 139:83]
  wire  _GEN_2412 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1619 : _GEN_2147; // @[rob.scala 139:83]
  wire  _GEN_2413 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1620 : _GEN_2148; // @[rob.scala 139:83]
  wire  _GEN_2414 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1621 : _GEN_2149; // @[rob.scala 139:83]
  wire  _GEN_2415 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1622 : _GEN_2150; // @[rob.scala 139:83]
  wire  _GEN_2416 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1623 : _GEN_2151; // @[rob.scala 139:83]
  wire  _GEN_2417 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1624 : _GEN_2153; // @[rob.scala 139:83]
  wire  _GEN_2418 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1625 : _GEN_2154; // @[rob.scala 139:83]
  wire  _GEN_2419 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1626 : _GEN_2155; // @[rob.scala 139:83]
  wire  _GEN_2420 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1627 : _GEN_2156; // @[rob.scala 139:83]
  wire  _GEN_2421 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1628 : _GEN_2157; // @[rob.scala 139:83]
  wire  _GEN_2422 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1629 : _GEN_2158; // @[rob.scala 139:83]
  wire  _GEN_2423 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1630 : _GEN_2159; // @[rob.scala 139:83]
  wire  _GEN_2424 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _GEN_1631 : _GEN_2160; // @[rob.scala 139:83]
  wire [3:0] _GEN_2425 = io_i_rob_allocation_reqs_0_valid & io_i_rob_allocation_reqs_1_valid ? _is_full_T_1 : _GEN_2152; // @[rob.scala 139:83 147:22]
  wire  _GEN_5333 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2426 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2409; // @[rob.scala 157:{72,72}]
  wire  _GEN_5334 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2427 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2410; // @[rob.scala 157:{72,72}]
  wire  _GEN_5335 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2428 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2411; // @[rob.scala 157:{72,72}]
  wire  _GEN_5336 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2429 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2412; // @[rob.scala 157:{72,72}]
  wire  _GEN_5337 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2430 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2413; // @[rob.scala 157:{72,72}]
  wire  _GEN_5338 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2431 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2414; // @[rob.scala 157:{72,72}]
  wire  _GEN_5339 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2432 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2415; // @[rob.scala 157:{72,72}]
  wire  _GEN_5340 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0]; // @[rob.scala 157:{72,72}]
  wire  _GEN_2433 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] | _GEN_2416; // @[rob.scala 157:{72,72}]
  wire  _GEN_2434 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2161; // @[rob.scala 158:{70,70}]
  wire  _GEN_2435 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2162; // @[rob.scala 158:{70,70}]
  wire  _GEN_2436 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2163; // @[rob.scala 158:{70,70}]
  wire  _GEN_2437 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2164; // @[rob.scala 158:{70,70}]
  wire  _GEN_2438 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2165; // @[rob.scala 158:{70,70}]
  wire  _GEN_2439 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2166; // @[rob.scala 158:{70,70}]
  wire  _GEN_2440 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2167; // @[rob.scala 158:{70,70}]
  wire  _GEN_2441 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_2168; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2442 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2169; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2443 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2170; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2444 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2171; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2445 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2172; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2446 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2173; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2447 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2174; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2448 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2175; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2449 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_2176; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2450 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2177; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2451 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2178; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2452 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2179; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2453 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2180; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2454 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2181; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2455 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2182; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2456 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2183; // @[rob.scala 158:{70,70}]
  wire [31:0] _GEN_2457 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_2184; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2458 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2185; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2459 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2186; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2460 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2187; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2461 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2188; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2462 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2189; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2463 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2190; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2464 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2191; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2465 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_2192; // @[rob.scala 158:{70,70}]
  wire  _GEN_2466 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2193; // @[rob.scala 158:{70,70}]
  wire  _GEN_2467 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2194; // @[rob.scala 158:{70,70}]
  wire  _GEN_2468 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2195; // @[rob.scala 158:{70,70}]
  wire  _GEN_2469 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2196; // @[rob.scala 158:{70,70}]
  wire  _GEN_2470 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2197; // @[rob.scala 158:{70,70}]
  wire  _GEN_2471 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2198; // @[rob.scala 158:{70,70}]
  wire  _GEN_2472 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2199; // @[rob.scala 158:{70,70}]
  wire  _GEN_2473 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_2200; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2474 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2201; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2475 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2202; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2476 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2203; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2477 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2204; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2478 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2205; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2479 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2206; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2480 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2207; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2481 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_2208; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2482 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2209; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2483 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2210; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2484 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2211; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2485 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2212; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2486 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2213; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2487 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2214; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2488 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2215; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2489 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_2216; // @[rob.scala 158:{70,70}]
  wire  _GEN_2490 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2217; // @[rob.scala 158:{70,70}]
  wire  _GEN_2491 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2218; // @[rob.scala 158:{70,70}]
  wire  _GEN_2492 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2219; // @[rob.scala 158:{70,70}]
  wire  _GEN_2493 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2220; // @[rob.scala 158:{70,70}]
  wire  _GEN_2494 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2221; // @[rob.scala 158:{70,70}]
  wire  _GEN_2495 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2222; // @[rob.scala 158:{70,70}]
  wire  _GEN_2496 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2223; // @[rob.scala 158:{70,70}]
  wire  _GEN_2497 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_2224; // @[rob.scala 158:{70,70}]
  wire  _GEN_2498 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2225; // @[rob.scala 158:{70,70}]
  wire  _GEN_2499 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2226; // @[rob.scala 158:{70,70}]
  wire  _GEN_2500 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2227; // @[rob.scala 158:{70,70}]
  wire  _GEN_2501 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2228; // @[rob.scala 158:{70,70}]
  wire  _GEN_2502 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2229; // @[rob.scala 158:{70,70}]
  wire  _GEN_2503 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2230; // @[rob.scala 158:{70,70}]
  wire  _GEN_2504 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2231; // @[rob.scala 158:{70,70}]
  wire  _GEN_2505 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_2232; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2506 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2233; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2507 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2234; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2508 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2235; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2509 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2236; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2510 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2237; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2511 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2238; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2512 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2239; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2513 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_2240; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2514 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2241; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2515 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2242; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2516 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2243; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2517 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2244; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2518 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2245; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2519 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2246; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2520 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2247; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2521 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_2248; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2522 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2249; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2523 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2250; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2524 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2251; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2525 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2252; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2526 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2253; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2527 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2254; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2528 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2255; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2529 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_2256; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2530 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2257; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2531 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2258; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2532 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2259; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2533 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2260; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2534 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2261; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2535 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2262; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2536 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2263; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2537 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_2264; // @[rob.scala 158:{70,70}]
  wire  _GEN_2538 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2265; // @[rob.scala 158:{70,70}]
  wire  _GEN_2539 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2266; // @[rob.scala 158:{70,70}]
  wire  _GEN_2540 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2267; // @[rob.scala 158:{70,70}]
  wire  _GEN_2541 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2268; // @[rob.scala 158:{70,70}]
  wire  _GEN_2542 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2269; // @[rob.scala 158:{70,70}]
  wire  _GEN_2543 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2270; // @[rob.scala 158:{70,70}]
  wire  _GEN_2544 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2271; // @[rob.scala 158:{70,70}]
  wire  _GEN_2545 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_2272; // @[rob.scala 158:{70,70}]
  wire  _GEN_2546 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2273; // @[rob.scala 158:{70,70}]
  wire  _GEN_2547 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2274; // @[rob.scala 158:{70,70}]
  wire  _GEN_2548 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2275; // @[rob.scala 158:{70,70}]
  wire  _GEN_2549 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2276; // @[rob.scala 158:{70,70}]
  wire  _GEN_2550 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2277; // @[rob.scala 158:{70,70}]
  wire  _GEN_2551 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2278; // @[rob.scala 158:{70,70}]
  wire  _GEN_2552 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2279; // @[rob.scala 158:{70,70}]
  wire  _GEN_2553 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_2280; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2554 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2281; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2555 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2282; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2556 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2283; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2557 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2284; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2558 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2285; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2559 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2286; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2560 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2287; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2561 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_2288; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2562 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2289; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2563 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2290; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2564 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2291; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2565 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2292; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2566 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2293; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2567 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2294; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2568 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2295; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2569 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_2296; // @[rob.scala 158:{70,70}]
  wire  _GEN_2570 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2297; // @[rob.scala 158:{70,70}]
  wire  _GEN_2571 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2298; // @[rob.scala 158:{70,70}]
  wire  _GEN_2572 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2299; // @[rob.scala 158:{70,70}]
  wire  _GEN_2573 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2300; // @[rob.scala 158:{70,70}]
  wire  _GEN_2574 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2301; // @[rob.scala 158:{70,70}]
  wire  _GEN_2575 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2302; // @[rob.scala 158:{70,70}]
  wire  _GEN_2576 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2303; // @[rob.scala 158:{70,70}]
  wire  _GEN_2577 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_2304; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2578 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2305; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2579 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2306; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2580 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2307; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2581 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2308; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2582 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2309; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2583 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2310; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2584 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2311; // @[rob.scala 158:{70,70}]
  wire [6:0] _GEN_2585 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_2312; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2586 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2313; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2587 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2314; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2588 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2315; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2589 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2316; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2590 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2317; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2591 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2318; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2592 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2319; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2593 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_2320; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2594 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2321; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2595 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2322; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2596 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2323; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2597 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2324; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2598 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2325; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2599 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2326; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2600 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2327; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2601 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_2328; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2602 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2329; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2603 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2330; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2604 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2331; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2605 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2332; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2606 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2333; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2607 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2334; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2608 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2335; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2609 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_2336; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2610 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2337; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2611 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2338; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2612 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2339; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2613 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2340; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2614 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2341; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2615 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2342; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2616 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2343; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2617 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_2344; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2618 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2345; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2619 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2346; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2620 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2347; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2621 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2348; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2622 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2349; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2623 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2350; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2624 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2351; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2625 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_2352; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2626 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2353; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2627 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2354; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2628 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2355; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2629 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2356; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2630 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2357; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2631 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2358; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2632 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2359; // @[rob.scala 158:{70,70}]
  wire [63:0] _GEN_2633 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_2360; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2642 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2369; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2643 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2370; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2644 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2371; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2645 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2372; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2646 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2373; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2647 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2374; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2648 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2375; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2649 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_2376; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2650 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2377; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2651 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2378; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2652 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2379; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2653 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2380; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2654 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2381; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2655 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2382; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2656 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2383; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2657 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_2384; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2658 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2385; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2659 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2386; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2660 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2387; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2661 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2388; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2662 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2389; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2663 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2390; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2664 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2391; // @[rob.scala 158:{70,70}]
  wire [4:0] _GEN_2665 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_2392; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2666 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2393; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2667 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2394; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2668 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2395; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2669 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2396; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2670 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2397; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2671 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2398; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2672 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2399; // @[rob.scala 158:{70,70}]
  wire [3:0] _GEN_2673 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_2400; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2674 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2401; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2675 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2402; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2676 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2403; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2677 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2404; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2678 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2405; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2679 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2406; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2680 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2407; // @[rob.scala 158:{70,70}]
  wire [2:0] _GEN_2681 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_2408; // @[rob.scala 158:{70,70}]
  wire  _GEN_2690 = _GEN_5333 | _GEN_2417; // @[rob.scala 160:{71,71}]
  wire  _GEN_2691 = _GEN_5334 | _GEN_2418; // @[rob.scala 160:{71,71}]
  wire  _GEN_2692 = _GEN_5335 | _GEN_2419; // @[rob.scala 160:{71,71}]
  wire  _GEN_2693 = _GEN_5336 | _GEN_2420; // @[rob.scala 160:{71,71}]
  wire  _GEN_2694 = _GEN_5337 | _GEN_2421; // @[rob.scala 160:{71,71}]
  wire  _GEN_2695 = _GEN_5338 | _GEN_2422; // @[rob.scala 160:{71,71}]
  wire  _GEN_2696 = _GEN_5339 | _GEN_2423; // @[rob.scala 160:{71,71}]
  wire  _GEN_2697 = _GEN_5340 | _GEN_2424; // @[rob.scala 160:{71,71}]
  wire  _GEN_2698 = io_i_ex_res_packs_0_valid ? _GEN_2426 : _GEN_2409; // @[rob.scala 156:39]
  wire  _GEN_2699 = io_i_ex_res_packs_0_valid ? _GEN_2427 : _GEN_2410; // @[rob.scala 156:39]
  wire  _GEN_2700 = io_i_ex_res_packs_0_valid ? _GEN_2428 : _GEN_2411; // @[rob.scala 156:39]
  wire  _GEN_2701 = io_i_ex_res_packs_0_valid ? _GEN_2429 : _GEN_2412; // @[rob.scala 156:39]
  wire  _GEN_2702 = io_i_ex_res_packs_0_valid ? _GEN_2430 : _GEN_2413; // @[rob.scala 156:39]
  wire  _GEN_2703 = io_i_ex_res_packs_0_valid ? _GEN_2431 : _GEN_2414; // @[rob.scala 156:39]
  wire  _GEN_2704 = io_i_ex_res_packs_0_valid ? _GEN_2432 : _GEN_2415; // @[rob.scala 156:39]
  wire  _GEN_2705 = io_i_ex_res_packs_0_valid ? _GEN_2433 : _GEN_2416; // @[rob.scala 156:39]
  wire  _GEN_2706 = io_i_ex_res_packs_0_valid ? _GEN_2434 : _GEN_2161; // @[rob.scala 156:39]
  wire  _GEN_2707 = io_i_ex_res_packs_0_valid ? _GEN_2435 : _GEN_2162; // @[rob.scala 156:39]
  wire  _GEN_2708 = io_i_ex_res_packs_0_valid ? _GEN_2436 : _GEN_2163; // @[rob.scala 156:39]
  wire  _GEN_2709 = io_i_ex_res_packs_0_valid ? _GEN_2437 : _GEN_2164; // @[rob.scala 156:39]
  wire  _GEN_2710 = io_i_ex_res_packs_0_valid ? _GEN_2438 : _GEN_2165; // @[rob.scala 156:39]
  wire  _GEN_2711 = io_i_ex_res_packs_0_valid ? _GEN_2439 : _GEN_2166; // @[rob.scala 156:39]
  wire  _GEN_2712 = io_i_ex_res_packs_0_valid ? _GEN_2440 : _GEN_2167; // @[rob.scala 156:39]
  wire  _GEN_2713 = io_i_ex_res_packs_0_valid ? _GEN_2441 : _GEN_2168; // @[rob.scala 156:39]
  wire [31:0] _GEN_2714 = io_i_ex_res_packs_0_valid ? _GEN_2442 : _GEN_2169; // @[rob.scala 156:39]
  wire [31:0] _GEN_2715 = io_i_ex_res_packs_0_valid ? _GEN_2443 : _GEN_2170; // @[rob.scala 156:39]
  wire [31:0] _GEN_2716 = io_i_ex_res_packs_0_valid ? _GEN_2444 : _GEN_2171; // @[rob.scala 156:39]
  wire [31:0] _GEN_2717 = io_i_ex_res_packs_0_valid ? _GEN_2445 : _GEN_2172; // @[rob.scala 156:39]
  wire [31:0] _GEN_2718 = io_i_ex_res_packs_0_valid ? _GEN_2446 : _GEN_2173; // @[rob.scala 156:39]
  wire [31:0] _GEN_2719 = io_i_ex_res_packs_0_valid ? _GEN_2447 : _GEN_2174; // @[rob.scala 156:39]
  wire [31:0] _GEN_2720 = io_i_ex_res_packs_0_valid ? _GEN_2448 : _GEN_2175; // @[rob.scala 156:39]
  wire [31:0] _GEN_2721 = io_i_ex_res_packs_0_valid ? _GEN_2449 : _GEN_2176; // @[rob.scala 156:39]
  wire [31:0] _GEN_2722 = io_i_ex_res_packs_0_valid ? _GEN_2450 : _GEN_2177; // @[rob.scala 156:39]
  wire [31:0] _GEN_2723 = io_i_ex_res_packs_0_valid ? _GEN_2451 : _GEN_2178; // @[rob.scala 156:39]
  wire [31:0] _GEN_2724 = io_i_ex_res_packs_0_valid ? _GEN_2452 : _GEN_2179; // @[rob.scala 156:39]
  wire [31:0] _GEN_2725 = io_i_ex_res_packs_0_valid ? _GEN_2453 : _GEN_2180; // @[rob.scala 156:39]
  wire [31:0] _GEN_2726 = io_i_ex_res_packs_0_valid ? _GEN_2454 : _GEN_2181; // @[rob.scala 156:39]
  wire [31:0] _GEN_2727 = io_i_ex_res_packs_0_valid ? _GEN_2455 : _GEN_2182; // @[rob.scala 156:39]
  wire [31:0] _GEN_2728 = io_i_ex_res_packs_0_valid ? _GEN_2456 : _GEN_2183; // @[rob.scala 156:39]
  wire [31:0] _GEN_2729 = io_i_ex_res_packs_0_valid ? _GEN_2457 : _GEN_2184; // @[rob.scala 156:39]
  wire [6:0] _GEN_2730 = io_i_ex_res_packs_0_valid ? _GEN_2458 : _GEN_2185; // @[rob.scala 156:39]
  wire [6:0] _GEN_2731 = io_i_ex_res_packs_0_valid ? _GEN_2459 : _GEN_2186; // @[rob.scala 156:39]
  wire [6:0] _GEN_2732 = io_i_ex_res_packs_0_valid ? _GEN_2460 : _GEN_2187; // @[rob.scala 156:39]
  wire [6:0] _GEN_2733 = io_i_ex_res_packs_0_valid ? _GEN_2461 : _GEN_2188; // @[rob.scala 156:39]
  wire [6:0] _GEN_2734 = io_i_ex_res_packs_0_valid ? _GEN_2462 : _GEN_2189; // @[rob.scala 156:39]
  wire [6:0] _GEN_2735 = io_i_ex_res_packs_0_valid ? _GEN_2463 : _GEN_2190; // @[rob.scala 156:39]
  wire [6:0] _GEN_2736 = io_i_ex_res_packs_0_valid ? _GEN_2464 : _GEN_2191; // @[rob.scala 156:39]
  wire [6:0] _GEN_2737 = io_i_ex_res_packs_0_valid ? _GEN_2465 : _GEN_2192; // @[rob.scala 156:39]
  wire  _GEN_2738 = io_i_ex_res_packs_0_valid ? _GEN_2466 : _GEN_2193; // @[rob.scala 156:39]
  wire  _GEN_2739 = io_i_ex_res_packs_0_valid ? _GEN_2467 : _GEN_2194; // @[rob.scala 156:39]
  wire  _GEN_2740 = io_i_ex_res_packs_0_valid ? _GEN_2468 : _GEN_2195; // @[rob.scala 156:39]
  wire  _GEN_2741 = io_i_ex_res_packs_0_valid ? _GEN_2469 : _GEN_2196; // @[rob.scala 156:39]
  wire  _GEN_2742 = io_i_ex_res_packs_0_valid ? _GEN_2470 : _GEN_2197; // @[rob.scala 156:39]
  wire  _GEN_2743 = io_i_ex_res_packs_0_valid ? _GEN_2471 : _GEN_2198; // @[rob.scala 156:39]
  wire  _GEN_2744 = io_i_ex_res_packs_0_valid ? _GEN_2472 : _GEN_2199; // @[rob.scala 156:39]
  wire  _GEN_2745 = io_i_ex_res_packs_0_valid ? _GEN_2473 : _GEN_2200; // @[rob.scala 156:39]
  wire [63:0] _GEN_2746 = io_i_ex_res_packs_0_valid ? _GEN_2474 : _GEN_2201; // @[rob.scala 156:39]
  wire [63:0] _GEN_2747 = io_i_ex_res_packs_0_valid ? _GEN_2475 : _GEN_2202; // @[rob.scala 156:39]
  wire [63:0] _GEN_2748 = io_i_ex_res_packs_0_valid ? _GEN_2476 : _GEN_2203; // @[rob.scala 156:39]
  wire [63:0] _GEN_2749 = io_i_ex_res_packs_0_valid ? _GEN_2477 : _GEN_2204; // @[rob.scala 156:39]
  wire [63:0] _GEN_2750 = io_i_ex_res_packs_0_valid ? _GEN_2478 : _GEN_2205; // @[rob.scala 156:39]
  wire [63:0] _GEN_2751 = io_i_ex_res_packs_0_valid ? _GEN_2479 : _GEN_2206; // @[rob.scala 156:39]
  wire [63:0] _GEN_2752 = io_i_ex_res_packs_0_valid ? _GEN_2480 : _GEN_2207; // @[rob.scala 156:39]
  wire [63:0] _GEN_2753 = io_i_ex_res_packs_0_valid ? _GEN_2481 : _GEN_2208; // @[rob.scala 156:39]
  wire [3:0] _GEN_2754 = io_i_ex_res_packs_0_valid ? _GEN_2482 : _GEN_2209; // @[rob.scala 156:39]
  wire [3:0] _GEN_2755 = io_i_ex_res_packs_0_valid ? _GEN_2483 : _GEN_2210; // @[rob.scala 156:39]
  wire [3:0] _GEN_2756 = io_i_ex_res_packs_0_valid ? _GEN_2484 : _GEN_2211; // @[rob.scala 156:39]
  wire [3:0] _GEN_2757 = io_i_ex_res_packs_0_valid ? _GEN_2485 : _GEN_2212; // @[rob.scala 156:39]
  wire [3:0] _GEN_2758 = io_i_ex_res_packs_0_valid ? _GEN_2486 : _GEN_2213; // @[rob.scala 156:39]
  wire [3:0] _GEN_2759 = io_i_ex_res_packs_0_valid ? _GEN_2487 : _GEN_2214; // @[rob.scala 156:39]
  wire [3:0] _GEN_2760 = io_i_ex_res_packs_0_valid ? _GEN_2488 : _GEN_2215; // @[rob.scala 156:39]
  wire [3:0] _GEN_2761 = io_i_ex_res_packs_0_valid ? _GEN_2489 : _GEN_2216; // @[rob.scala 156:39]
  wire  _GEN_2762 = io_i_ex_res_packs_0_valid ? _GEN_2490 : _GEN_2217; // @[rob.scala 156:39]
  wire  _GEN_2763 = io_i_ex_res_packs_0_valid ? _GEN_2491 : _GEN_2218; // @[rob.scala 156:39]
  wire  _GEN_2764 = io_i_ex_res_packs_0_valid ? _GEN_2492 : _GEN_2219; // @[rob.scala 156:39]
  wire  _GEN_2765 = io_i_ex_res_packs_0_valid ? _GEN_2493 : _GEN_2220; // @[rob.scala 156:39]
  wire  _GEN_2766 = io_i_ex_res_packs_0_valid ? _GEN_2494 : _GEN_2221; // @[rob.scala 156:39]
  wire  _GEN_2767 = io_i_ex_res_packs_0_valid ? _GEN_2495 : _GEN_2222; // @[rob.scala 156:39]
  wire  _GEN_2768 = io_i_ex_res_packs_0_valid ? _GEN_2496 : _GEN_2223; // @[rob.scala 156:39]
  wire  _GEN_2769 = io_i_ex_res_packs_0_valid ? _GEN_2497 : _GEN_2224; // @[rob.scala 156:39]
  wire  _GEN_2770 = io_i_ex_res_packs_0_valid ? _GEN_2498 : _GEN_2225; // @[rob.scala 156:39]
  wire  _GEN_2771 = io_i_ex_res_packs_0_valid ? _GEN_2499 : _GEN_2226; // @[rob.scala 156:39]
  wire  _GEN_2772 = io_i_ex_res_packs_0_valid ? _GEN_2500 : _GEN_2227; // @[rob.scala 156:39]
  wire  _GEN_2773 = io_i_ex_res_packs_0_valid ? _GEN_2501 : _GEN_2228; // @[rob.scala 156:39]
  wire  _GEN_2774 = io_i_ex_res_packs_0_valid ? _GEN_2502 : _GEN_2229; // @[rob.scala 156:39]
  wire  _GEN_2775 = io_i_ex_res_packs_0_valid ? _GEN_2503 : _GEN_2230; // @[rob.scala 156:39]
  wire  _GEN_2776 = io_i_ex_res_packs_0_valid ? _GEN_2504 : _GEN_2231; // @[rob.scala 156:39]
  wire  _GEN_2777 = io_i_ex_res_packs_0_valid ? _GEN_2505 : _GEN_2232; // @[rob.scala 156:39]
  wire [6:0] _GEN_2778 = io_i_ex_res_packs_0_valid ? _GEN_2506 : _GEN_2233; // @[rob.scala 156:39]
  wire [6:0] _GEN_2779 = io_i_ex_res_packs_0_valid ? _GEN_2507 : _GEN_2234; // @[rob.scala 156:39]
  wire [6:0] _GEN_2780 = io_i_ex_res_packs_0_valid ? _GEN_2508 : _GEN_2235; // @[rob.scala 156:39]
  wire [6:0] _GEN_2781 = io_i_ex_res_packs_0_valid ? _GEN_2509 : _GEN_2236; // @[rob.scala 156:39]
  wire [6:0] _GEN_2782 = io_i_ex_res_packs_0_valid ? _GEN_2510 : _GEN_2237; // @[rob.scala 156:39]
  wire [6:0] _GEN_2783 = io_i_ex_res_packs_0_valid ? _GEN_2511 : _GEN_2238; // @[rob.scala 156:39]
  wire [6:0] _GEN_2784 = io_i_ex_res_packs_0_valid ? _GEN_2512 : _GEN_2239; // @[rob.scala 156:39]
  wire [6:0] _GEN_2785 = io_i_ex_res_packs_0_valid ? _GEN_2513 : _GEN_2240; // @[rob.scala 156:39]
  wire [6:0] _GEN_2786 = io_i_ex_res_packs_0_valid ? _GEN_2514 : _GEN_2241; // @[rob.scala 156:39]
  wire [6:0] _GEN_2787 = io_i_ex_res_packs_0_valid ? _GEN_2515 : _GEN_2242; // @[rob.scala 156:39]
  wire [6:0] _GEN_2788 = io_i_ex_res_packs_0_valid ? _GEN_2516 : _GEN_2243; // @[rob.scala 156:39]
  wire [6:0] _GEN_2789 = io_i_ex_res_packs_0_valid ? _GEN_2517 : _GEN_2244; // @[rob.scala 156:39]
  wire [6:0] _GEN_2790 = io_i_ex_res_packs_0_valid ? _GEN_2518 : _GEN_2245; // @[rob.scala 156:39]
  wire [6:0] _GEN_2791 = io_i_ex_res_packs_0_valid ? _GEN_2519 : _GEN_2246; // @[rob.scala 156:39]
  wire [6:0] _GEN_2792 = io_i_ex_res_packs_0_valid ? _GEN_2520 : _GEN_2247; // @[rob.scala 156:39]
  wire [6:0] _GEN_2793 = io_i_ex_res_packs_0_valid ? _GEN_2521 : _GEN_2248; // @[rob.scala 156:39]
  wire [4:0] _GEN_2794 = io_i_ex_res_packs_0_valid ? _GEN_2522 : _GEN_2249; // @[rob.scala 156:39]
  wire [4:0] _GEN_2795 = io_i_ex_res_packs_0_valid ? _GEN_2523 : _GEN_2250; // @[rob.scala 156:39]
  wire [4:0] _GEN_2796 = io_i_ex_res_packs_0_valid ? _GEN_2524 : _GEN_2251; // @[rob.scala 156:39]
  wire [4:0] _GEN_2797 = io_i_ex_res_packs_0_valid ? _GEN_2525 : _GEN_2252; // @[rob.scala 156:39]
  wire [4:0] _GEN_2798 = io_i_ex_res_packs_0_valid ? _GEN_2526 : _GEN_2253; // @[rob.scala 156:39]
  wire [4:0] _GEN_2799 = io_i_ex_res_packs_0_valid ? _GEN_2527 : _GEN_2254; // @[rob.scala 156:39]
  wire [4:0] _GEN_2800 = io_i_ex_res_packs_0_valid ? _GEN_2528 : _GEN_2255; // @[rob.scala 156:39]
  wire [4:0] _GEN_2801 = io_i_ex_res_packs_0_valid ? _GEN_2529 : _GEN_2256; // @[rob.scala 156:39]
  wire [2:0] _GEN_2802 = io_i_ex_res_packs_0_valid ? _GEN_2530 : _GEN_2257; // @[rob.scala 156:39]
  wire [2:0] _GEN_2803 = io_i_ex_res_packs_0_valid ? _GEN_2531 : _GEN_2258; // @[rob.scala 156:39]
  wire [2:0] _GEN_2804 = io_i_ex_res_packs_0_valid ? _GEN_2532 : _GEN_2259; // @[rob.scala 156:39]
  wire [2:0] _GEN_2805 = io_i_ex_res_packs_0_valid ? _GEN_2533 : _GEN_2260; // @[rob.scala 156:39]
  wire [2:0] _GEN_2806 = io_i_ex_res_packs_0_valid ? _GEN_2534 : _GEN_2261; // @[rob.scala 156:39]
  wire [2:0] _GEN_2807 = io_i_ex_res_packs_0_valid ? _GEN_2535 : _GEN_2262; // @[rob.scala 156:39]
  wire [2:0] _GEN_2808 = io_i_ex_res_packs_0_valid ? _GEN_2536 : _GEN_2263; // @[rob.scala 156:39]
  wire [2:0] _GEN_2809 = io_i_ex_res_packs_0_valid ? _GEN_2537 : _GEN_2264; // @[rob.scala 156:39]
  wire  _GEN_2810 = io_i_ex_res_packs_0_valid ? _GEN_2538 : _GEN_2265; // @[rob.scala 156:39]
  wire  _GEN_2811 = io_i_ex_res_packs_0_valid ? _GEN_2539 : _GEN_2266; // @[rob.scala 156:39]
  wire  _GEN_2812 = io_i_ex_res_packs_0_valid ? _GEN_2540 : _GEN_2267; // @[rob.scala 156:39]
  wire  _GEN_2813 = io_i_ex_res_packs_0_valid ? _GEN_2541 : _GEN_2268; // @[rob.scala 156:39]
  wire  _GEN_2814 = io_i_ex_res_packs_0_valid ? _GEN_2542 : _GEN_2269; // @[rob.scala 156:39]
  wire  _GEN_2815 = io_i_ex_res_packs_0_valid ? _GEN_2543 : _GEN_2270; // @[rob.scala 156:39]
  wire  _GEN_2816 = io_i_ex_res_packs_0_valid ? _GEN_2544 : _GEN_2271; // @[rob.scala 156:39]
  wire  _GEN_2817 = io_i_ex_res_packs_0_valid ? _GEN_2545 : _GEN_2272; // @[rob.scala 156:39]
  wire  _GEN_2818 = io_i_ex_res_packs_0_valid ? _GEN_2546 : _GEN_2273; // @[rob.scala 156:39]
  wire  _GEN_2819 = io_i_ex_res_packs_0_valid ? _GEN_2547 : _GEN_2274; // @[rob.scala 156:39]
  wire  _GEN_2820 = io_i_ex_res_packs_0_valid ? _GEN_2548 : _GEN_2275; // @[rob.scala 156:39]
  wire  _GEN_2821 = io_i_ex_res_packs_0_valid ? _GEN_2549 : _GEN_2276; // @[rob.scala 156:39]
  wire  _GEN_2822 = io_i_ex_res_packs_0_valid ? _GEN_2550 : _GEN_2277; // @[rob.scala 156:39]
  wire  _GEN_2823 = io_i_ex_res_packs_0_valid ? _GEN_2551 : _GEN_2278; // @[rob.scala 156:39]
  wire  _GEN_2824 = io_i_ex_res_packs_0_valid ? _GEN_2552 : _GEN_2279; // @[rob.scala 156:39]
  wire  _GEN_2825 = io_i_ex_res_packs_0_valid ? _GEN_2553 : _GEN_2280; // @[rob.scala 156:39]
  wire [6:0] _GEN_2826 = io_i_ex_res_packs_0_valid ? _GEN_2554 : _GEN_2281; // @[rob.scala 156:39]
  wire [6:0] _GEN_2827 = io_i_ex_res_packs_0_valid ? _GEN_2555 : _GEN_2282; // @[rob.scala 156:39]
  wire [6:0] _GEN_2828 = io_i_ex_res_packs_0_valid ? _GEN_2556 : _GEN_2283; // @[rob.scala 156:39]
  wire [6:0] _GEN_2829 = io_i_ex_res_packs_0_valid ? _GEN_2557 : _GEN_2284; // @[rob.scala 156:39]
  wire [6:0] _GEN_2830 = io_i_ex_res_packs_0_valid ? _GEN_2558 : _GEN_2285; // @[rob.scala 156:39]
  wire [6:0] _GEN_2831 = io_i_ex_res_packs_0_valid ? _GEN_2559 : _GEN_2286; // @[rob.scala 156:39]
  wire [6:0] _GEN_2832 = io_i_ex_res_packs_0_valid ? _GEN_2560 : _GEN_2287; // @[rob.scala 156:39]
  wire [6:0] _GEN_2833 = io_i_ex_res_packs_0_valid ? _GEN_2561 : _GEN_2288; // @[rob.scala 156:39]
  wire [4:0] _GEN_2834 = io_i_ex_res_packs_0_valid ? _GEN_2562 : _GEN_2289; // @[rob.scala 156:39]
  wire [4:0] _GEN_2835 = io_i_ex_res_packs_0_valid ? _GEN_2563 : _GEN_2290; // @[rob.scala 156:39]
  wire [4:0] _GEN_2836 = io_i_ex_res_packs_0_valid ? _GEN_2564 : _GEN_2291; // @[rob.scala 156:39]
  wire [4:0] _GEN_2837 = io_i_ex_res_packs_0_valid ? _GEN_2565 : _GEN_2292; // @[rob.scala 156:39]
  wire [4:0] _GEN_2838 = io_i_ex_res_packs_0_valid ? _GEN_2566 : _GEN_2293; // @[rob.scala 156:39]
  wire [4:0] _GEN_2839 = io_i_ex_res_packs_0_valid ? _GEN_2567 : _GEN_2294; // @[rob.scala 156:39]
  wire [4:0] _GEN_2840 = io_i_ex_res_packs_0_valid ? _GEN_2568 : _GEN_2295; // @[rob.scala 156:39]
  wire [4:0] _GEN_2841 = io_i_ex_res_packs_0_valid ? _GEN_2569 : _GEN_2296; // @[rob.scala 156:39]
  wire  _GEN_2842 = io_i_ex_res_packs_0_valid ? _GEN_2570 : _GEN_2297; // @[rob.scala 156:39]
  wire  _GEN_2843 = io_i_ex_res_packs_0_valid ? _GEN_2571 : _GEN_2298; // @[rob.scala 156:39]
  wire  _GEN_2844 = io_i_ex_res_packs_0_valid ? _GEN_2572 : _GEN_2299; // @[rob.scala 156:39]
  wire  _GEN_2845 = io_i_ex_res_packs_0_valid ? _GEN_2573 : _GEN_2300; // @[rob.scala 156:39]
  wire  _GEN_2846 = io_i_ex_res_packs_0_valid ? _GEN_2574 : _GEN_2301; // @[rob.scala 156:39]
  wire  _GEN_2847 = io_i_ex_res_packs_0_valid ? _GEN_2575 : _GEN_2302; // @[rob.scala 156:39]
  wire  _GEN_2848 = io_i_ex_res_packs_0_valid ? _GEN_2576 : _GEN_2303; // @[rob.scala 156:39]
  wire  _GEN_2849 = io_i_ex_res_packs_0_valid ? _GEN_2577 : _GEN_2304; // @[rob.scala 156:39]
  wire [6:0] _GEN_2850 = io_i_ex_res_packs_0_valid ? _GEN_2578 : _GEN_2305; // @[rob.scala 156:39]
  wire [6:0] _GEN_2851 = io_i_ex_res_packs_0_valid ? _GEN_2579 : _GEN_2306; // @[rob.scala 156:39]
  wire [6:0] _GEN_2852 = io_i_ex_res_packs_0_valid ? _GEN_2580 : _GEN_2307; // @[rob.scala 156:39]
  wire [6:0] _GEN_2853 = io_i_ex_res_packs_0_valid ? _GEN_2581 : _GEN_2308; // @[rob.scala 156:39]
  wire [6:0] _GEN_2854 = io_i_ex_res_packs_0_valid ? _GEN_2582 : _GEN_2309; // @[rob.scala 156:39]
  wire [6:0] _GEN_2855 = io_i_ex_res_packs_0_valid ? _GEN_2583 : _GEN_2310; // @[rob.scala 156:39]
  wire [6:0] _GEN_2856 = io_i_ex_res_packs_0_valid ? _GEN_2584 : _GEN_2311; // @[rob.scala 156:39]
  wire [6:0] _GEN_2857 = io_i_ex_res_packs_0_valid ? _GEN_2585 : _GEN_2312; // @[rob.scala 156:39]
  wire [4:0] _GEN_2858 = io_i_ex_res_packs_0_valid ? _GEN_2586 : _GEN_2313; // @[rob.scala 156:39]
  wire [4:0] _GEN_2859 = io_i_ex_res_packs_0_valid ? _GEN_2587 : _GEN_2314; // @[rob.scala 156:39]
  wire [4:0] _GEN_2860 = io_i_ex_res_packs_0_valid ? _GEN_2588 : _GEN_2315; // @[rob.scala 156:39]
  wire [4:0] _GEN_2861 = io_i_ex_res_packs_0_valid ? _GEN_2589 : _GEN_2316; // @[rob.scala 156:39]
  wire [4:0] _GEN_2862 = io_i_ex_res_packs_0_valid ? _GEN_2590 : _GEN_2317; // @[rob.scala 156:39]
  wire [4:0] _GEN_2863 = io_i_ex_res_packs_0_valid ? _GEN_2591 : _GEN_2318; // @[rob.scala 156:39]
  wire [4:0] _GEN_2864 = io_i_ex_res_packs_0_valid ? _GEN_2592 : _GEN_2319; // @[rob.scala 156:39]
  wire [4:0] _GEN_2865 = io_i_ex_res_packs_0_valid ? _GEN_2593 : _GEN_2320; // @[rob.scala 156:39]
  wire [3:0] _GEN_2866 = io_i_ex_res_packs_0_valid ? _GEN_2594 : _GEN_2321; // @[rob.scala 156:39]
  wire [3:0] _GEN_2867 = io_i_ex_res_packs_0_valid ? _GEN_2595 : _GEN_2322; // @[rob.scala 156:39]
  wire [3:0] _GEN_2868 = io_i_ex_res_packs_0_valid ? _GEN_2596 : _GEN_2323; // @[rob.scala 156:39]
  wire [3:0] _GEN_2869 = io_i_ex_res_packs_0_valid ? _GEN_2597 : _GEN_2324; // @[rob.scala 156:39]
  wire [3:0] _GEN_2870 = io_i_ex_res_packs_0_valid ? _GEN_2598 : _GEN_2325; // @[rob.scala 156:39]
  wire [3:0] _GEN_2871 = io_i_ex_res_packs_0_valid ? _GEN_2599 : _GEN_2326; // @[rob.scala 156:39]
  wire [3:0] _GEN_2872 = io_i_ex_res_packs_0_valid ? _GEN_2600 : _GEN_2327; // @[rob.scala 156:39]
  wire [3:0] _GEN_2873 = io_i_ex_res_packs_0_valid ? _GEN_2601 : _GEN_2328; // @[rob.scala 156:39]
  wire [63:0] _GEN_2874 = io_i_ex_res_packs_0_valid ? _GEN_2602 : _GEN_2329; // @[rob.scala 156:39]
  wire [63:0] _GEN_2875 = io_i_ex_res_packs_0_valid ? _GEN_2603 : _GEN_2330; // @[rob.scala 156:39]
  wire [63:0] _GEN_2876 = io_i_ex_res_packs_0_valid ? _GEN_2604 : _GEN_2331; // @[rob.scala 156:39]
  wire [63:0] _GEN_2877 = io_i_ex_res_packs_0_valid ? _GEN_2605 : _GEN_2332; // @[rob.scala 156:39]
  wire [63:0] _GEN_2878 = io_i_ex_res_packs_0_valid ? _GEN_2606 : _GEN_2333; // @[rob.scala 156:39]
  wire [63:0] _GEN_2879 = io_i_ex_res_packs_0_valid ? _GEN_2607 : _GEN_2334; // @[rob.scala 156:39]
  wire [63:0] _GEN_2880 = io_i_ex_res_packs_0_valid ? _GEN_2608 : _GEN_2335; // @[rob.scala 156:39]
  wire [63:0] _GEN_2881 = io_i_ex_res_packs_0_valid ? _GEN_2609 : _GEN_2336; // @[rob.scala 156:39]
  wire [63:0] _GEN_2882 = io_i_ex_res_packs_0_valid ? _GEN_2610 : _GEN_2337; // @[rob.scala 156:39]
  wire [63:0] _GEN_2883 = io_i_ex_res_packs_0_valid ? _GEN_2611 : _GEN_2338; // @[rob.scala 156:39]
  wire [63:0] _GEN_2884 = io_i_ex_res_packs_0_valid ? _GEN_2612 : _GEN_2339; // @[rob.scala 156:39]
  wire [63:0] _GEN_2885 = io_i_ex_res_packs_0_valid ? _GEN_2613 : _GEN_2340; // @[rob.scala 156:39]
  wire [63:0] _GEN_2886 = io_i_ex_res_packs_0_valid ? _GEN_2614 : _GEN_2341; // @[rob.scala 156:39]
  wire [63:0] _GEN_2887 = io_i_ex_res_packs_0_valid ? _GEN_2615 : _GEN_2342; // @[rob.scala 156:39]
  wire [63:0] _GEN_2888 = io_i_ex_res_packs_0_valid ? _GEN_2616 : _GEN_2343; // @[rob.scala 156:39]
  wire [63:0] _GEN_2889 = io_i_ex_res_packs_0_valid ? _GEN_2617 : _GEN_2344; // @[rob.scala 156:39]
  wire [63:0] _GEN_2890 = io_i_ex_res_packs_0_valid ? _GEN_2618 : _GEN_2345; // @[rob.scala 156:39]
  wire [63:0] _GEN_2891 = io_i_ex_res_packs_0_valid ? _GEN_2619 : _GEN_2346; // @[rob.scala 156:39]
  wire [63:0] _GEN_2892 = io_i_ex_res_packs_0_valid ? _GEN_2620 : _GEN_2347; // @[rob.scala 156:39]
  wire [63:0] _GEN_2893 = io_i_ex_res_packs_0_valid ? _GEN_2621 : _GEN_2348; // @[rob.scala 156:39]
  wire [63:0] _GEN_2894 = io_i_ex_res_packs_0_valid ? _GEN_2622 : _GEN_2349; // @[rob.scala 156:39]
  wire [63:0] _GEN_2895 = io_i_ex_res_packs_0_valid ? _GEN_2623 : _GEN_2350; // @[rob.scala 156:39]
  wire [63:0] _GEN_2896 = io_i_ex_res_packs_0_valid ? _GEN_2624 : _GEN_2351; // @[rob.scala 156:39]
  wire [63:0] _GEN_2897 = io_i_ex_res_packs_0_valid ? _GEN_2625 : _GEN_2352; // @[rob.scala 156:39]
  wire [63:0] _GEN_2898 = io_i_ex_res_packs_0_valid ? _GEN_2626 : _GEN_2353; // @[rob.scala 156:39]
  wire [63:0] _GEN_2899 = io_i_ex_res_packs_0_valid ? _GEN_2627 : _GEN_2354; // @[rob.scala 156:39]
  wire [63:0] _GEN_2900 = io_i_ex_res_packs_0_valid ? _GEN_2628 : _GEN_2355; // @[rob.scala 156:39]
  wire [63:0] _GEN_2901 = io_i_ex_res_packs_0_valid ? _GEN_2629 : _GEN_2356; // @[rob.scala 156:39]
  wire [63:0] _GEN_2902 = io_i_ex_res_packs_0_valid ? _GEN_2630 : _GEN_2357; // @[rob.scala 156:39]
  wire [63:0] _GEN_2903 = io_i_ex_res_packs_0_valid ? _GEN_2631 : _GEN_2358; // @[rob.scala 156:39]
  wire [63:0] _GEN_2904 = io_i_ex_res_packs_0_valid ? _GEN_2632 : _GEN_2359; // @[rob.scala 156:39]
  wire [63:0] _GEN_2905 = io_i_ex_res_packs_0_valid ? _GEN_2633 : _GEN_2360; // @[rob.scala 156:39]
  wire [2:0] _GEN_2914 = io_i_ex_res_packs_0_valid ? _GEN_2642 : _GEN_2369; // @[rob.scala 156:39]
  wire [2:0] _GEN_2915 = io_i_ex_res_packs_0_valid ? _GEN_2643 : _GEN_2370; // @[rob.scala 156:39]
  wire [2:0] _GEN_2916 = io_i_ex_res_packs_0_valid ? _GEN_2644 : _GEN_2371; // @[rob.scala 156:39]
  wire [2:0] _GEN_2917 = io_i_ex_res_packs_0_valid ? _GEN_2645 : _GEN_2372; // @[rob.scala 156:39]
  wire [2:0] _GEN_2918 = io_i_ex_res_packs_0_valid ? _GEN_2646 : _GEN_2373; // @[rob.scala 156:39]
  wire [2:0] _GEN_2919 = io_i_ex_res_packs_0_valid ? _GEN_2647 : _GEN_2374; // @[rob.scala 156:39]
  wire [2:0] _GEN_2920 = io_i_ex_res_packs_0_valid ? _GEN_2648 : _GEN_2375; // @[rob.scala 156:39]
  wire [2:0] _GEN_2921 = io_i_ex_res_packs_0_valid ? _GEN_2649 : _GEN_2376; // @[rob.scala 156:39]
  wire [2:0] _GEN_2922 = io_i_ex_res_packs_0_valid ? _GEN_2650 : _GEN_2377; // @[rob.scala 156:39]
  wire [2:0] _GEN_2923 = io_i_ex_res_packs_0_valid ? _GEN_2651 : _GEN_2378; // @[rob.scala 156:39]
  wire [2:0] _GEN_2924 = io_i_ex_res_packs_0_valid ? _GEN_2652 : _GEN_2379; // @[rob.scala 156:39]
  wire [2:0] _GEN_2925 = io_i_ex_res_packs_0_valid ? _GEN_2653 : _GEN_2380; // @[rob.scala 156:39]
  wire [2:0] _GEN_2926 = io_i_ex_res_packs_0_valid ? _GEN_2654 : _GEN_2381; // @[rob.scala 156:39]
  wire [2:0] _GEN_2927 = io_i_ex_res_packs_0_valid ? _GEN_2655 : _GEN_2382; // @[rob.scala 156:39]
  wire [2:0] _GEN_2928 = io_i_ex_res_packs_0_valid ? _GEN_2656 : _GEN_2383; // @[rob.scala 156:39]
  wire [2:0] _GEN_2929 = io_i_ex_res_packs_0_valid ? _GEN_2657 : _GEN_2384; // @[rob.scala 156:39]
  wire [4:0] _GEN_2930 = io_i_ex_res_packs_0_valid ? _GEN_2658 : _GEN_2385; // @[rob.scala 156:39]
  wire [4:0] _GEN_2931 = io_i_ex_res_packs_0_valid ? _GEN_2659 : _GEN_2386; // @[rob.scala 156:39]
  wire [4:0] _GEN_2932 = io_i_ex_res_packs_0_valid ? _GEN_2660 : _GEN_2387; // @[rob.scala 156:39]
  wire [4:0] _GEN_2933 = io_i_ex_res_packs_0_valid ? _GEN_2661 : _GEN_2388; // @[rob.scala 156:39]
  wire [4:0] _GEN_2934 = io_i_ex_res_packs_0_valid ? _GEN_2662 : _GEN_2389; // @[rob.scala 156:39]
  wire [4:0] _GEN_2935 = io_i_ex_res_packs_0_valid ? _GEN_2663 : _GEN_2390; // @[rob.scala 156:39]
  wire [4:0] _GEN_2936 = io_i_ex_res_packs_0_valid ? _GEN_2664 : _GEN_2391; // @[rob.scala 156:39]
  wire [4:0] _GEN_2937 = io_i_ex_res_packs_0_valid ? _GEN_2665 : _GEN_2392; // @[rob.scala 156:39]
  wire [3:0] _GEN_2938 = io_i_ex_res_packs_0_valid ? _GEN_2666 : _GEN_2393; // @[rob.scala 156:39]
  wire [3:0] _GEN_2939 = io_i_ex_res_packs_0_valid ? _GEN_2667 : _GEN_2394; // @[rob.scala 156:39]
  wire [3:0] _GEN_2940 = io_i_ex_res_packs_0_valid ? _GEN_2668 : _GEN_2395; // @[rob.scala 156:39]
  wire [3:0] _GEN_2941 = io_i_ex_res_packs_0_valid ? _GEN_2669 : _GEN_2396; // @[rob.scala 156:39]
  wire [3:0] _GEN_2942 = io_i_ex_res_packs_0_valid ? _GEN_2670 : _GEN_2397; // @[rob.scala 156:39]
  wire [3:0] _GEN_2943 = io_i_ex_res_packs_0_valid ? _GEN_2671 : _GEN_2398; // @[rob.scala 156:39]
  wire [3:0] _GEN_2944 = io_i_ex_res_packs_0_valid ? _GEN_2672 : _GEN_2399; // @[rob.scala 156:39]
  wire [3:0] _GEN_2945 = io_i_ex_res_packs_0_valid ? _GEN_2673 : _GEN_2400; // @[rob.scala 156:39]
  wire [2:0] _GEN_2946 = io_i_ex_res_packs_0_valid ? _GEN_2674 : _GEN_2401; // @[rob.scala 156:39]
  wire [2:0] _GEN_2947 = io_i_ex_res_packs_0_valid ? _GEN_2675 : _GEN_2402; // @[rob.scala 156:39]
  wire [2:0] _GEN_2948 = io_i_ex_res_packs_0_valid ? _GEN_2676 : _GEN_2403; // @[rob.scala 156:39]
  wire [2:0] _GEN_2949 = io_i_ex_res_packs_0_valid ? _GEN_2677 : _GEN_2404; // @[rob.scala 156:39]
  wire [2:0] _GEN_2950 = io_i_ex_res_packs_0_valid ? _GEN_2678 : _GEN_2405; // @[rob.scala 156:39]
  wire [2:0] _GEN_2951 = io_i_ex_res_packs_0_valid ? _GEN_2679 : _GEN_2406; // @[rob.scala 156:39]
  wire [2:0] _GEN_2952 = io_i_ex_res_packs_0_valid ? _GEN_2680 : _GEN_2407; // @[rob.scala 156:39]
  wire [2:0] _GEN_2953 = io_i_ex_res_packs_0_valid ? _GEN_2681 : _GEN_2408; // @[rob.scala 156:39]
  wire  _GEN_2962 = io_i_ex_res_packs_0_valid ? _GEN_2690 : _GEN_2417; // @[rob.scala 156:39]
  wire  _GEN_2963 = io_i_ex_res_packs_0_valid ? _GEN_2691 : _GEN_2418; // @[rob.scala 156:39]
  wire  _GEN_2964 = io_i_ex_res_packs_0_valid ? _GEN_2692 : _GEN_2419; // @[rob.scala 156:39]
  wire  _GEN_2965 = io_i_ex_res_packs_0_valid ? _GEN_2693 : _GEN_2420; // @[rob.scala 156:39]
  wire  _GEN_2966 = io_i_ex_res_packs_0_valid ? _GEN_2694 : _GEN_2421; // @[rob.scala 156:39]
  wire  _GEN_2967 = io_i_ex_res_packs_0_valid ? _GEN_2695 : _GEN_2422; // @[rob.scala 156:39]
  wire  _GEN_2968 = io_i_ex_res_packs_0_valid ? _GEN_2696 : _GEN_2423; // @[rob.scala 156:39]
  wire  _GEN_2969 = io_i_ex_res_packs_0_valid ? _GEN_2697 : _GEN_2424; // @[rob.scala 156:39]
  wire  _GEN_5349 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2970 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2698; // @[rob.scala 163:{72,72}]
  wire  _GEN_5350 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2971 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2699; // @[rob.scala 163:{72,72}]
  wire  _GEN_5351 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2972 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2700; // @[rob.scala 163:{72,72}]
  wire  _GEN_5352 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2973 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2701; // @[rob.scala 163:{72,72}]
  wire  _GEN_5353 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2974 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2702; // @[rob.scala 163:{72,72}]
  wire  _GEN_5354 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2975 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2703; // @[rob.scala 163:{72,72}]
  wire  _GEN_5355 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2976 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2704; // @[rob.scala 163:{72,72}]
  wire  _GEN_5356 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]; // @[rob.scala 163:{72,72}]
  wire  _GEN_2977 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] | _GEN_2705; // @[rob.scala 163:{72,72}]
  wire  _GEN_2978 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2706; // @[rob.scala 164:{70,70}]
  wire  _GEN_2979 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2707; // @[rob.scala 164:{70,70}]
  wire  _GEN_2980 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2708; // @[rob.scala 164:{70,70}]
  wire  _GEN_2981 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2709; // @[rob.scala 164:{70,70}]
  wire  _GEN_2982 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2710; // @[rob.scala 164:{70,70}]
  wire  _GEN_2983 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2711; // @[rob.scala 164:{70,70}]
  wire  _GEN_2984 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2712; // @[rob.scala 164:{70,70}]
  wire  _GEN_2985 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_valid : _GEN_2713; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2986 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2714; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2987 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2715; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2988 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2716; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2989 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2717; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2990 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2718; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2991 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2719; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2992 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2720; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2993 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_pc : _GEN_2721; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2994 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2722; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2995 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2723; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2996 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2724; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2997 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2725; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2998 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2726; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_2999 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2727; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_3000 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2728; // @[rob.scala 164:{70,70}]
  wire [31:0] _GEN_3001 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst : _GEN_2729; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3002 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2730; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3003 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2731; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3004 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2732; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3005 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2733; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3006 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2734; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3007 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2735; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3008 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2736; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3009 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_func_code : _GEN_2737; // @[rob.scala 164:{70,70}]
  wire  _GEN_3010 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2738; // @[rob.scala 164:{70,70}]
  wire  _GEN_3011 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2739; // @[rob.scala 164:{70,70}]
  wire  _GEN_3012 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2740; // @[rob.scala 164:{70,70}]
  wire  _GEN_3013 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2741; // @[rob.scala 164:{70,70}]
  wire  _GEN_3014 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2742; // @[rob.scala 164:{70,70}]
  wire  _GEN_3015 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2743; // @[rob.scala 164:{70,70}]
  wire  _GEN_3016 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2744; // @[rob.scala 164:{70,70}]
  wire  _GEN_3017 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_valid :
    _GEN_2745; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3018 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2746; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3019 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2747; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3020 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2748; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3021 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2749; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3022 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2750; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3023 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2751; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3024 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2752; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3025 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_target : _GEN_2753; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3026 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2754; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3027 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2755; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3028 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2756; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3029 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2757; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3030 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2758; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3031 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2759; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3032 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2760; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3033 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type : _GEN_2761; // @[rob.scala 164:{70,70}]
  wire  _GEN_3034 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2762; // @[rob.scala 164:{70,70}]
  wire  _GEN_3035 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2763; // @[rob.scala 164:{70,70}]
  wire  _GEN_3036 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2764; // @[rob.scala 164:{70,70}]
  wire  _GEN_3037 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2765; // @[rob.scala 164:{70,70}]
  wire  _GEN_3038 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2766; // @[rob.scala 164:{70,70}]
  wire  _GEN_3039 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2767; // @[rob.scala 164:{70,70}]
  wire  _GEN_3040 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2768; // @[rob.scala 164:{70,70}]
  wire  _GEN_3041 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_select :
    _GEN_2769; // @[rob.scala 164:{70,70}]
  wire  _GEN_3042 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2770; // @[rob.scala 164:{70,70}]
  wire  _GEN_3043 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2771; // @[rob.scala 164:{70,70}]
  wire  _GEN_3044 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2772; // @[rob.scala 164:{70,70}]
  wire  _GEN_3045 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2773; // @[rob.scala 164:{70,70}]
  wire  _GEN_3046 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2774; // @[rob.scala 164:{70,70}]
  wire  _GEN_3047 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2775; // @[rob.scala 164:{70,70}]
  wire  _GEN_3048 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2776; // @[rob.scala 164:{70,70}]
  wire  _GEN_3049 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_predict_pack_taken :
    _GEN_2777; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3050 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2778; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3051 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2779; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3052 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2780; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3053 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2781; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3054 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2782; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3055 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2783; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3056 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2784; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3057 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_dst : _GEN_2785; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3058 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2786; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3059 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2787; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3060 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2788; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3061 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2789; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3062 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2790; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3063 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2791; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3064 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2792; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3065 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_stale_dst : _GEN_2793; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3066 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2794; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3067 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2795; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3068 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2796; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3069 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2797; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3070 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2798; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3071 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2799; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3072 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2800; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3073 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_dst : _GEN_2801; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3074 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2802; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3075 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2803; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3076 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2804; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3077 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2805; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3078 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2806; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3079 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2807; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3080 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2808; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3081 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_inst_type : _GEN_2809; // @[rob.scala 164:{70,70}]
  wire  _GEN_3082 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2810; // @[rob.scala 164:{70,70}]
  wire  _GEN_3083 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2811; // @[rob.scala 164:{70,70}]
  wire  _GEN_3084 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2812; // @[rob.scala 164:{70,70}]
  wire  _GEN_3085 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2813; // @[rob.scala 164:{70,70}]
  wire  _GEN_3086 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2814; // @[rob.scala 164:{70,70}]
  wire  _GEN_3087 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2815; // @[rob.scala 164:{70,70}]
  wire  _GEN_3088 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2816; // @[rob.scala 164:{70,70}]
  wire  _GEN_3089 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_regWen : _GEN_2817; // @[rob.scala 164:{70,70}]
  wire  _GEN_3090 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2818; // @[rob.scala 164:{70,70}]
  wire  _GEN_3091 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2819; // @[rob.scala 164:{70,70}]
  wire  _GEN_3092 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2820; // @[rob.scala 164:{70,70}]
  wire  _GEN_3093 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2821; // @[rob.scala 164:{70,70}]
  wire  _GEN_3094 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2822; // @[rob.scala 164:{70,70}]
  wire  _GEN_3095 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2823; // @[rob.scala 164:{70,70}]
  wire  _GEN_3096 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2824; // @[rob.scala 164:{70,70}]
  wire  _GEN_3097 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_valid : _GEN_2825; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3098 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2826; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3099 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2827; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3100 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2828; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3101 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2829; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3102 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2830; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3103 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2831; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3104 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2832; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3105 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs1 : _GEN_2833; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3106 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2834; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3107 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2835; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3108 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2836; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3109 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2837; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3110 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2838; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3111 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2839; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3112 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2840; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3113 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs1 : _GEN_2841; // @[rob.scala 164:{70,70}]
  wire  _GEN_3114 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2842; // @[rob.scala 164:{70,70}]
  wire  _GEN_3115 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2843; // @[rob.scala 164:{70,70}]
  wire  _GEN_3116 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2844; // @[rob.scala 164:{70,70}]
  wire  _GEN_3117 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2845; // @[rob.scala 164:{70,70}]
  wire  _GEN_3118 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2846; // @[rob.scala 164:{70,70}]
  wire  _GEN_3119 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2847; // @[rob.scala 164:{70,70}]
  wire  _GEN_3120 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2848; // @[rob.scala 164:{70,70}]
  wire  _GEN_3121 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_valid : _GEN_2849; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3122 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2850; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3123 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2851; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3124 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2852; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3125 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2853; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3126 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2854; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3127 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2855; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3128 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2856; // @[rob.scala 164:{70,70}]
  wire [6:0] _GEN_3129 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_phy_rs2 : _GEN_2857; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3130 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2858; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3131 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2859; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3132 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2860; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3133 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2861; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3134 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2862; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3135 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2863; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3136 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2864; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3137 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_arch_rs2 : _GEN_2865; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3138 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2866; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3139 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2867; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3140 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2868; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3141 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2869; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3142 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2870; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3143 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2871; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3144 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2872; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3145 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_rob_idx : _GEN_2873; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3146 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2874; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3147 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2875; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3148 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2876; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3149 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2877; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3150 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2878; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3151 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2879; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3152 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2880; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3153 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_imm : _GEN_2881; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3154 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2882; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3155 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2883; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3156 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2884; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3157 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2885; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3158 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2886; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3159 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2887; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3160 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2888; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3161 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_dst_value : _GEN_2889; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3162 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2890; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3163 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2891; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3164 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2892; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3165 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2893; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3166 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2894; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3167 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2895; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3168 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2896; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3169 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src1_value : _GEN_2897; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3170 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2898; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3171 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2899; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3172 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2900; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3173 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2901; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3174 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2902; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3175 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2903; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3176 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2904; // @[rob.scala 164:{70,70}]
  wire [63:0] _GEN_3177 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_src2_value : _GEN_2905; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3186 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2914; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3187 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2915; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3188 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2916; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3189 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2917; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3190 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2918; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3191 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2919; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3192 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2920; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3193 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op1_sel : _GEN_2921; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3194 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2922; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3195 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2923; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3196 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2924; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3197 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2925; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3198 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2926; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3199 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2927; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3200 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2928; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3201 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_op2_sel : _GEN_2929; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3202 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2930; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3203 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2931; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3204 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2932; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3205 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2933; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3206 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2934; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3207 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2935; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3208 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2936; // @[rob.scala 164:{70,70}]
  wire [4:0] _GEN_3209 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_alu_sel : _GEN_2937; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3210 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2938; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3211 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2939; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3212 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2940; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3213 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2941; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3214 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2942; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3215 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2943; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3216 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2944; // @[rob.scala 164:{70,70}]
  wire [3:0] _GEN_3217 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_branch_type : _GEN_2945; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3218 = 3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2946; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3219 = 3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2947; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3220 = 3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2948; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3221 = 3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2949; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3222 = 3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2950; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3223 = 3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2951; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3224 = 3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2952; // @[rob.scala 164:{70,70}]
  wire [2:0] _GEN_3225 = 3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0] ? io_i_ex_res_packs_1_uop_mem_type : _GEN_2953; // @[rob.scala 164:{70,70}]
  wire  _GEN_3234 = _GEN_5349 | _GEN_2962; // @[rob.scala 166:{71,71}]
  wire  _GEN_3235 = _GEN_5350 | _GEN_2963; // @[rob.scala 166:{71,71}]
  wire  _GEN_3236 = _GEN_5351 | _GEN_2964; // @[rob.scala 166:{71,71}]
  wire  _GEN_3237 = _GEN_5352 | _GEN_2965; // @[rob.scala 166:{71,71}]
  wire  _GEN_3238 = _GEN_5353 | _GEN_2966; // @[rob.scala 166:{71,71}]
  wire  _GEN_3239 = _GEN_5354 | _GEN_2967; // @[rob.scala 166:{71,71}]
  wire  _GEN_3240 = _GEN_5355 | _GEN_2968; // @[rob.scala 166:{71,71}]
  wire  _GEN_3241 = _GEN_5356 | _GEN_2969; // @[rob.scala 166:{71,71}]
  wire  _GEN_3242 = io_i_ex_res_packs_1_valid ? _GEN_2970 : _GEN_2698; // @[rob.scala 162:39]
  wire  _GEN_3243 = io_i_ex_res_packs_1_valid ? _GEN_2971 : _GEN_2699; // @[rob.scala 162:39]
  wire  _GEN_3244 = io_i_ex_res_packs_1_valid ? _GEN_2972 : _GEN_2700; // @[rob.scala 162:39]
  wire  _GEN_3245 = io_i_ex_res_packs_1_valid ? _GEN_2973 : _GEN_2701; // @[rob.scala 162:39]
  wire  _GEN_3246 = io_i_ex_res_packs_1_valid ? _GEN_2974 : _GEN_2702; // @[rob.scala 162:39]
  wire  _GEN_3247 = io_i_ex_res_packs_1_valid ? _GEN_2975 : _GEN_2703; // @[rob.scala 162:39]
  wire  _GEN_3248 = io_i_ex_res_packs_1_valid ? _GEN_2976 : _GEN_2704; // @[rob.scala 162:39]
  wire  _GEN_3249 = io_i_ex_res_packs_1_valid ? _GEN_2977 : _GEN_2705; // @[rob.scala 162:39]
  wire  _GEN_3250 = io_i_ex_res_packs_1_valid ? _GEN_2978 : _GEN_2706; // @[rob.scala 162:39]
  wire  _GEN_3251 = io_i_ex_res_packs_1_valid ? _GEN_2979 : _GEN_2707; // @[rob.scala 162:39]
  wire  _GEN_3252 = io_i_ex_res_packs_1_valid ? _GEN_2980 : _GEN_2708; // @[rob.scala 162:39]
  wire  _GEN_3253 = io_i_ex_res_packs_1_valid ? _GEN_2981 : _GEN_2709; // @[rob.scala 162:39]
  wire  _GEN_3254 = io_i_ex_res_packs_1_valid ? _GEN_2982 : _GEN_2710; // @[rob.scala 162:39]
  wire  _GEN_3255 = io_i_ex_res_packs_1_valid ? _GEN_2983 : _GEN_2711; // @[rob.scala 162:39]
  wire  _GEN_3256 = io_i_ex_res_packs_1_valid ? _GEN_2984 : _GEN_2712; // @[rob.scala 162:39]
  wire  _GEN_3257 = io_i_ex_res_packs_1_valid ? _GEN_2985 : _GEN_2713; // @[rob.scala 162:39]
  wire [31:0] _GEN_3258 = io_i_ex_res_packs_1_valid ? _GEN_2986 : _GEN_2714; // @[rob.scala 162:39]
  wire [31:0] _GEN_3259 = io_i_ex_res_packs_1_valid ? _GEN_2987 : _GEN_2715; // @[rob.scala 162:39]
  wire [31:0] _GEN_3260 = io_i_ex_res_packs_1_valid ? _GEN_2988 : _GEN_2716; // @[rob.scala 162:39]
  wire [31:0] _GEN_3261 = io_i_ex_res_packs_1_valid ? _GEN_2989 : _GEN_2717; // @[rob.scala 162:39]
  wire [31:0] _GEN_3262 = io_i_ex_res_packs_1_valid ? _GEN_2990 : _GEN_2718; // @[rob.scala 162:39]
  wire [31:0] _GEN_3263 = io_i_ex_res_packs_1_valid ? _GEN_2991 : _GEN_2719; // @[rob.scala 162:39]
  wire [31:0] _GEN_3264 = io_i_ex_res_packs_1_valid ? _GEN_2992 : _GEN_2720; // @[rob.scala 162:39]
  wire [31:0] _GEN_3265 = io_i_ex_res_packs_1_valid ? _GEN_2993 : _GEN_2721; // @[rob.scala 162:39]
  wire [31:0] _GEN_3266 = io_i_ex_res_packs_1_valid ? _GEN_2994 : _GEN_2722; // @[rob.scala 162:39]
  wire [31:0] _GEN_3267 = io_i_ex_res_packs_1_valid ? _GEN_2995 : _GEN_2723; // @[rob.scala 162:39]
  wire [31:0] _GEN_3268 = io_i_ex_res_packs_1_valid ? _GEN_2996 : _GEN_2724; // @[rob.scala 162:39]
  wire [31:0] _GEN_3269 = io_i_ex_res_packs_1_valid ? _GEN_2997 : _GEN_2725; // @[rob.scala 162:39]
  wire [31:0] _GEN_3270 = io_i_ex_res_packs_1_valid ? _GEN_2998 : _GEN_2726; // @[rob.scala 162:39]
  wire [31:0] _GEN_3271 = io_i_ex_res_packs_1_valid ? _GEN_2999 : _GEN_2727; // @[rob.scala 162:39]
  wire [31:0] _GEN_3272 = io_i_ex_res_packs_1_valid ? _GEN_3000 : _GEN_2728; // @[rob.scala 162:39]
  wire [31:0] _GEN_3273 = io_i_ex_res_packs_1_valid ? _GEN_3001 : _GEN_2729; // @[rob.scala 162:39]
  wire [6:0] _GEN_3274 = io_i_ex_res_packs_1_valid ? _GEN_3002 : _GEN_2730; // @[rob.scala 162:39]
  wire [6:0] _GEN_3275 = io_i_ex_res_packs_1_valid ? _GEN_3003 : _GEN_2731; // @[rob.scala 162:39]
  wire [6:0] _GEN_3276 = io_i_ex_res_packs_1_valid ? _GEN_3004 : _GEN_2732; // @[rob.scala 162:39]
  wire [6:0] _GEN_3277 = io_i_ex_res_packs_1_valid ? _GEN_3005 : _GEN_2733; // @[rob.scala 162:39]
  wire [6:0] _GEN_3278 = io_i_ex_res_packs_1_valid ? _GEN_3006 : _GEN_2734; // @[rob.scala 162:39]
  wire [6:0] _GEN_3279 = io_i_ex_res_packs_1_valid ? _GEN_3007 : _GEN_2735; // @[rob.scala 162:39]
  wire [6:0] _GEN_3280 = io_i_ex_res_packs_1_valid ? _GEN_3008 : _GEN_2736; // @[rob.scala 162:39]
  wire [6:0] _GEN_3281 = io_i_ex_res_packs_1_valid ? _GEN_3009 : _GEN_2737; // @[rob.scala 162:39]
  wire  _GEN_3282 = io_i_ex_res_packs_1_valid ? _GEN_3010 : _GEN_2738; // @[rob.scala 162:39]
  wire  _GEN_3283 = io_i_ex_res_packs_1_valid ? _GEN_3011 : _GEN_2739; // @[rob.scala 162:39]
  wire  _GEN_3284 = io_i_ex_res_packs_1_valid ? _GEN_3012 : _GEN_2740; // @[rob.scala 162:39]
  wire  _GEN_3285 = io_i_ex_res_packs_1_valid ? _GEN_3013 : _GEN_2741; // @[rob.scala 162:39]
  wire  _GEN_3286 = io_i_ex_res_packs_1_valid ? _GEN_3014 : _GEN_2742; // @[rob.scala 162:39]
  wire  _GEN_3287 = io_i_ex_res_packs_1_valid ? _GEN_3015 : _GEN_2743; // @[rob.scala 162:39]
  wire  _GEN_3288 = io_i_ex_res_packs_1_valid ? _GEN_3016 : _GEN_2744; // @[rob.scala 162:39]
  wire  _GEN_3289 = io_i_ex_res_packs_1_valid ? _GEN_3017 : _GEN_2745; // @[rob.scala 162:39]
  wire [63:0] _GEN_3290 = io_i_ex_res_packs_1_valid ? _GEN_3018 : _GEN_2746; // @[rob.scala 162:39]
  wire [63:0] _GEN_3291 = io_i_ex_res_packs_1_valid ? _GEN_3019 : _GEN_2747; // @[rob.scala 162:39]
  wire [63:0] _GEN_3292 = io_i_ex_res_packs_1_valid ? _GEN_3020 : _GEN_2748; // @[rob.scala 162:39]
  wire [63:0] _GEN_3293 = io_i_ex_res_packs_1_valid ? _GEN_3021 : _GEN_2749; // @[rob.scala 162:39]
  wire [63:0] _GEN_3294 = io_i_ex_res_packs_1_valid ? _GEN_3022 : _GEN_2750; // @[rob.scala 162:39]
  wire [63:0] _GEN_3295 = io_i_ex_res_packs_1_valid ? _GEN_3023 : _GEN_2751; // @[rob.scala 162:39]
  wire [63:0] _GEN_3296 = io_i_ex_res_packs_1_valid ? _GEN_3024 : _GEN_2752; // @[rob.scala 162:39]
  wire [63:0] _GEN_3297 = io_i_ex_res_packs_1_valid ? _GEN_3025 : _GEN_2753; // @[rob.scala 162:39]
  wire [3:0] _GEN_3298 = io_i_ex_res_packs_1_valid ? _GEN_3026 : _GEN_2754; // @[rob.scala 162:39]
  wire [3:0] _GEN_3299 = io_i_ex_res_packs_1_valid ? _GEN_3027 : _GEN_2755; // @[rob.scala 162:39]
  wire [3:0] _GEN_3300 = io_i_ex_res_packs_1_valid ? _GEN_3028 : _GEN_2756; // @[rob.scala 162:39]
  wire [3:0] _GEN_3301 = io_i_ex_res_packs_1_valid ? _GEN_3029 : _GEN_2757; // @[rob.scala 162:39]
  wire [3:0] _GEN_3302 = io_i_ex_res_packs_1_valid ? _GEN_3030 : _GEN_2758; // @[rob.scala 162:39]
  wire [3:0] _GEN_3303 = io_i_ex_res_packs_1_valid ? _GEN_3031 : _GEN_2759; // @[rob.scala 162:39]
  wire [3:0] _GEN_3304 = io_i_ex_res_packs_1_valid ? _GEN_3032 : _GEN_2760; // @[rob.scala 162:39]
  wire [3:0] _GEN_3305 = io_i_ex_res_packs_1_valid ? _GEN_3033 : _GEN_2761; // @[rob.scala 162:39]
  wire  _GEN_3306 = io_i_ex_res_packs_1_valid ? _GEN_3034 : _GEN_2762; // @[rob.scala 162:39]
  wire  _GEN_3307 = io_i_ex_res_packs_1_valid ? _GEN_3035 : _GEN_2763; // @[rob.scala 162:39]
  wire  _GEN_3308 = io_i_ex_res_packs_1_valid ? _GEN_3036 : _GEN_2764; // @[rob.scala 162:39]
  wire  _GEN_3309 = io_i_ex_res_packs_1_valid ? _GEN_3037 : _GEN_2765; // @[rob.scala 162:39]
  wire  _GEN_3310 = io_i_ex_res_packs_1_valid ? _GEN_3038 : _GEN_2766; // @[rob.scala 162:39]
  wire  _GEN_3311 = io_i_ex_res_packs_1_valid ? _GEN_3039 : _GEN_2767; // @[rob.scala 162:39]
  wire  _GEN_3312 = io_i_ex_res_packs_1_valid ? _GEN_3040 : _GEN_2768; // @[rob.scala 162:39]
  wire  _GEN_3313 = io_i_ex_res_packs_1_valid ? _GEN_3041 : _GEN_2769; // @[rob.scala 162:39]
  wire  _GEN_3314 = io_i_ex_res_packs_1_valid ? _GEN_3042 : _GEN_2770; // @[rob.scala 162:39]
  wire  _GEN_3315 = io_i_ex_res_packs_1_valid ? _GEN_3043 : _GEN_2771; // @[rob.scala 162:39]
  wire  _GEN_3316 = io_i_ex_res_packs_1_valid ? _GEN_3044 : _GEN_2772; // @[rob.scala 162:39]
  wire  _GEN_3317 = io_i_ex_res_packs_1_valid ? _GEN_3045 : _GEN_2773; // @[rob.scala 162:39]
  wire  _GEN_3318 = io_i_ex_res_packs_1_valid ? _GEN_3046 : _GEN_2774; // @[rob.scala 162:39]
  wire  _GEN_3319 = io_i_ex_res_packs_1_valid ? _GEN_3047 : _GEN_2775; // @[rob.scala 162:39]
  wire  _GEN_3320 = io_i_ex_res_packs_1_valid ? _GEN_3048 : _GEN_2776; // @[rob.scala 162:39]
  wire  _GEN_3321 = io_i_ex_res_packs_1_valid ? _GEN_3049 : _GEN_2777; // @[rob.scala 162:39]
  wire [6:0] _GEN_3322 = io_i_ex_res_packs_1_valid ? _GEN_3050 : _GEN_2778; // @[rob.scala 162:39]
  wire [6:0] _GEN_3323 = io_i_ex_res_packs_1_valid ? _GEN_3051 : _GEN_2779; // @[rob.scala 162:39]
  wire [6:0] _GEN_3324 = io_i_ex_res_packs_1_valid ? _GEN_3052 : _GEN_2780; // @[rob.scala 162:39]
  wire [6:0] _GEN_3325 = io_i_ex_res_packs_1_valid ? _GEN_3053 : _GEN_2781; // @[rob.scala 162:39]
  wire [6:0] _GEN_3326 = io_i_ex_res_packs_1_valid ? _GEN_3054 : _GEN_2782; // @[rob.scala 162:39]
  wire [6:0] _GEN_3327 = io_i_ex_res_packs_1_valid ? _GEN_3055 : _GEN_2783; // @[rob.scala 162:39]
  wire [6:0] _GEN_3328 = io_i_ex_res_packs_1_valid ? _GEN_3056 : _GEN_2784; // @[rob.scala 162:39]
  wire [6:0] _GEN_3329 = io_i_ex_res_packs_1_valid ? _GEN_3057 : _GEN_2785; // @[rob.scala 162:39]
  wire [6:0] _GEN_3330 = io_i_ex_res_packs_1_valid ? _GEN_3058 : _GEN_2786; // @[rob.scala 162:39]
  wire [6:0] _GEN_3331 = io_i_ex_res_packs_1_valid ? _GEN_3059 : _GEN_2787; // @[rob.scala 162:39]
  wire [6:0] _GEN_3332 = io_i_ex_res_packs_1_valid ? _GEN_3060 : _GEN_2788; // @[rob.scala 162:39]
  wire [6:0] _GEN_3333 = io_i_ex_res_packs_1_valid ? _GEN_3061 : _GEN_2789; // @[rob.scala 162:39]
  wire [6:0] _GEN_3334 = io_i_ex_res_packs_1_valid ? _GEN_3062 : _GEN_2790; // @[rob.scala 162:39]
  wire [6:0] _GEN_3335 = io_i_ex_res_packs_1_valid ? _GEN_3063 : _GEN_2791; // @[rob.scala 162:39]
  wire [6:0] _GEN_3336 = io_i_ex_res_packs_1_valid ? _GEN_3064 : _GEN_2792; // @[rob.scala 162:39]
  wire [6:0] _GEN_3337 = io_i_ex_res_packs_1_valid ? _GEN_3065 : _GEN_2793; // @[rob.scala 162:39]
  wire [4:0] _GEN_3338 = io_i_ex_res_packs_1_valid ? _GEN_3066 : _GEN_2794; // @[rob.scala 162:39]
  wire [4:0] _GEN_3339 = io_i_ex_res_packs_1_valid ? _GEN_3067 : _GEN_2795; // @[rob.scala 162:39]
  wire [4:0] _GEN_3340 = io_i_ex_res_packs_1_valid ? _GEN_3068 : _GEN_2796; // @[rob.scala 162:39]
  wire [4:0] _GEN_3341 = io_i_ex_res_packs_1_valid ? _GEN_3069 : _GEN_2797; // @[rob.scala 162:39]
  wire [4:0] _GEN_3342 = io_i_ex_res_packs_1_valid ? _GEN_3070 : _GEN_2798; // @[rob.scala 162:39]
  wire [4:0] _GEN_3343 = io_i_ex_res_packs_1_valid ? _GEN_3071 : _GEN_2799; // @[rob.scala 162:39]
  wire [4:0] _GEN_3344 = io_i_ex_res_packs_1_valid ? _GEN_3072 : _GEN_2800; // @[rob.scala 162:39]
  wire [4:0] _GEN_3345 = io_i_ex_res_packs_1_valid ? _GEN_3073 : _GEN_2801; // @[rob.scala 162:39]
  wire [2:0] _GEN_3346 = io_i_ex_res_packs_1_valid ? _GEN_3074 : _GEN_2802; // @[rob.scala 162:39]
  wire [2:0] _GEN_3347 = io_i_ex_res_packs_1_valid ? _GEN_3075 : _GEN_2803; // @[rob.scala 162:39]
  wire [2:0] _GEN_3348 = io_i_ex_res_packs_1_valid ? _GEN_3076 : _GEN_2804; // @[rob.scala 162:39]
  wire [2:0] _GEN_3349 = io_i_ex_res_packs_1_valid ? _GEN_3077 : _GEN_2805; // @[rob.scala 162:39]
  wire [2:0] _GEN_3350 = io_i_ex_res_packs_1_valid ? _GEN_3078 : _GEN_2806; // @[rob.scala 162:39]
  wire [2:0] _GEN_3351 = io_i_ex_res_packs_1_valid ? _GEN_3079 : _GEN_2807; // @[rob.scala 162:39]
  wire [2:0] _GEN_3352 = io_i_ex_res_packs_1_valid ? _GEN_3080 : _GEN_2808; // @[rob.scala 162:39]
  wire [2:0] _GEN_3353 = io_i_ex_res_packs_1_valid ? _GEN_3081 : _GEN_2809; // @[rob.scala 162:39]
  wire  _GEN_3354 = io_i_ex_res_packs_1_valid ? _GEN_3082 : _GEN_2810; // @[rob.scala 162:39]
  wire  _GEN_3355 = io_i_ex_res_packs_1_valid ? _GEN_3083 : _GEN_2811; // @[rob.scala 162:39]
  wire  _GEN_3356 = io_i_ex_res_packs_1_valid ? _GEN_3084 : _GEN_2812; // @[rob.scala 162:39]
  wire  _GEN_3357 = io_i_ex_res_packs_1_valid ? _GEN_3085 : _GEN_2813; // @[rob.scala 162:39]
  wire  _GEN_3358 = io_i_ex_res_packs_1_valid ? _GEN_3086 : _GEN_2814; // @[rob.scala 162:39]
  wire  _GEN_3359 = io_i_ex_res_packs_1_valid ? _GEN_3087 : _GEN_2815; // @[rob.scala 162:39]
  wire  _GEN_3360 = io_i_ex_res_packs_1_valid ? _GEN_3088 : _GEN_2816; // @[rob.scala 162:39]
  wire  _GEN_3361 = io_i_ex_res_packs_1_valid ? _GEN_3089 : _GEN_2817; // @[rob.scala 162:39]
  wire  _GEN_3362 = io_i_ex_res_packs_1_valid ? _GEN_3090 : _GEN_2818; // @[rob.scala 162:39]
  wire  _GEN_3363 = io_i_ex_res_packs_1_valid ? _GEN_3091 : _GEN_2819; // @[rob.scala 162:39]
  wire  _GEN_3364 = io_i_ex_res_packs_1_valid ? _GEN_3092 : _GEN_2820; // @[rob.scala 162:39]
  wire  _GEN_3365 = io_i_ex_res_packs_1_valid ? _GEN_3093 : _GEN_2821; // @[rob.scala 162:39]
  wire  _GEN_3366 = io_i_ex_res_packs_1_valid ? _GEN_3094 : _GEN_2822; // @[rob.scala 162:39]
  wire  _GEN_3367 = io_i_ex_res_packs_1_valid ? _GEN_3095 : _GEN_2823; // @[rob.scala 162:39]
  wire  _GEN_3368 = io_i_ex_res_packs_1_valid ? _GEN_3096 : _GEN_2824; // @[rob.scala 162:39]
  wire  _GEN_3369 = io_i_ex_res_packs_1_valid ? _GEN_3097 : _GEN_2825; // @[rob.scala 162:39]
  wire [6:0] _GEN_3370 = io_i_ex_res_packs_1_valid ? _GEN_3098 : _GEN_2826; // @[rob.scala 162:39]
  wire [6:0] _GEN_3371 = io_i_ex_res_packs_1_valid ? _GEN_3099 : _GEN_2827; // @[rob.scala 162:39]
  wire [6:0] _GEN_3372 = io_i_ex_res_packs_1_valid ? _GEN_3100 : _GEN_2828; // @[rob.scala 162:39]
  wire [6:0] _GEN_3373 = io_i_ex_res_packs_1_valid ? _GEN_3101 : _GEN_2829; // @[rob.scala 162:39]
  wire [6:0] _GEN_3374 = io_i_ex_res_packs_1_valid ? _GEN_3102 : _GEN_2830; // @[rob.scala 162:39]
  wire [6:0] _GEN_3375 = io_i_ex_res_packs_1_valid ? _GEN_3103 : _GEN_2831; // @[rob.scala 162:39]
  wire [6:0] _GEN_3376 = io_i_ex_res_packs_1_valid ? _GEN_3104 : _GEN_2832; // @[rob.scala 162:39]
  wire [6:0] _GEN_3377 = io_i_ex_res_packs_1_valid ? _GEN_3105 : _GEN_2833; // @[rob.scala 162:39]
  wire [4:0] _GEN_3378 = io_i_ex_res_packs_1_valid ? _GEN_3106 : _GEN_2834; // @[rob.scala 162:39]
  wire [4:0] _GEN_3379 = io_i_ex_res_packs_1_valid ? _GEN_3107 : _GEN_2835; // @[rob.scala 162:39]
  wire [4:0] _GEN_3380 = io_i_ex_res_packs_1_valid ? _GEN_3108 : _GEN_2836; // @[rob.scala 162:39]
  wire [4:0] _GEN_3381 = io_i_ex_res_packs_1_valid ? _GEN_3109 : _GEN_2837; // @[rob.scala 162:39]
  wire [4:0] _GEN_3382 = io_i_ex_res_packs_1_valid ? _GEN_3110 : _GEN_2838; // @[rob.scala 162:39]
  wire [4:0] _GEN_3383 = io_i_ex_res_packs_1_valid ? _GEN_3111 : _GEN_2839; // @[rob.scala 162:39]
  wire [4:0] _GEN_3384 = io_i_ex_res_packs_1_valid ? _GEN_3112 : _GEN_2840; // @[rob.scala 162:39]
  wire [4:0] _GEN_3385 = io_i_ex_res_packs_1_valid ? _GEN_3113 : _GEN_2841; // @[rob.scala 162:39]
  wire  _GEN_3386 = io_i_ex_res_packs_1_valid ? _GEN_3114 : _GEN_2842; // @[rob.scala 162:39]
  wire  _GEN_3387 = io_i_ex_res_packs_1_valid ? _GEN_3115 : _GEN_2843; // @[rob.scala 162:39]
  wire  _GEN_3388 = io_i_ex_res_packs_1_valid ? _GEN_3116 : _GEN_2844; // @[rob.scala 162:39]
  wire  _GEN_3389 = io_i_ex_res_packs_1_valid ? _GEN_3117 : _GEN_2845; // @[rob.scala 162:39]
  wire  _GEN_3390 = io_i_ex_res_packs_1_valid ? _GEN_3118 : _GEN_2846; // @[rob.scala 162:39]
  wire  _GEN_3391 = io_i_ex_res_packs_1_valid ? _GEN_3119 : _GEN_2847; // @[rob.scala 162:39]
  wire  _GEN_3392 = io_i_ex_res_packs_1_valid ? _GEN_3120 : _GEN_2848; // @[rob.scala 162:39]
  wire  _GEN_3393 = io_i_ex_res_packs_1_valid ? _GEN_3121 : _GEN_2849; // @[rob.scala 162:39]
  wire [6:0] _GEN_3394 = io_i_ex_res_packs_1_valid ? _GEN_3122 : _GEN_2850; // @[rob.scala 162:39]
  wire [6:0] _GEN_3395 = io_i_ex_res_packs_1_valid ? _GEN_3123 : _GEN_2851; // @[rob.scala 162:39]
  wire [6:0] _GEN_3396 = io_i_ex_res_packs_1_valid ? _GEN_3124 : _GEN_2852; // @[rob.scala 162:39]
  wire [6:0] _GEN_3397 = io_i_ex_res_packs_1_valid ? _GEN_3125 : _GEN_2853; // @[rob.scala 162:39]
  wire [6:0] _GEN_3398 = io_i_ex_res_packs_1_valid ? _GEN_3126 : _GEN_2854; // @[rob.scala 162:39]
  wire [6:0] _GEN_3399 = io_i_ex_res_packs_1_valid ? _GEN_3127 : _GEN_2855; // @[rob.scala 162:39]
  wire [6:0] _GEN_3400 = io_i_ex_res_packs_1_valid ? _GEN_3128 : _GEN_2856; // @[rob.scala 162:39]
  wire [6:0] _GEN_3401 = io_i_ex_res_packs_1_valid ? _GEN_3129 : _GEN_2857; // @[rob.scala 162:39]
  wire [4:0] _GEN_3402 = io_i_ex_res_packs_1_valid ? _GEN_3130 : _GEN_2858; // @[rob.scala 162:39]
  wire [4:0] _GEN_3403 = io_i_ex_res_packs_1_valid ? _GEN_3131 : _GEN_2859; // @[rob.scala 162:39]
  wire [4:0] _GEN_3404 = io_i_ex_res_packs_1_valid ? _GEN_3132 : _GEN_2860; // @[rob.scala 162:39]
  wire [4:0] _GEN_3405 = io_i_ex_res_packs_1_valid ? _GEN_3133 : _GEN_2861; // @[rob.scala 162:39]
  wire [4:0] _GEN_3406 = io_i_ex_res_packs_1_valid ? _GEN_3134 : _GEN_2862; // @[rob.scala 162:39]
  wire [4:0] _GEN_3407 = io_i_ex_res_packs_1_valid ? _GEN_3135 : _GEN_2863; // @[rob.scala 162:39]
  wire [4:0] _GEN_3408 = io_i_ex_res_packs_1_valid ? _GEN_3136 : _GEN_2864; // @[rob.scala 162:39]
  wire [4:0] _GEN_3409 = io_i_ex_res_packs_1_valid ? _GEN_3137 : _GEN_2865; // @[rob.scala 162:39]
  wire [3:0] _GEN_3410 = io_i_ex_res_packs_1_valid ? _GEN_3138 : _GEN_2866; // @[rob.scala 162:39]
  wire [3:0] _GEN_3411 = io_i_ex_res_packs_1_valid ? _GEN_3139 : _GEN_2867; // @[rob.scala 162:39]
  wire [3:0] _GEN_3412 = io_i_ex_res_packs_1_valid ? _GEN_3140 : _GEN_2868; // @[rob.scala 162:39]
  wire [3:0] _GEN_3413 = io_i_ex_res_packs_1_valid ? _GEN_3141 : _GEN_2869; // @[rob.scala 162:39]
  wire [3:0] _GEN_3414 = io_i_ex_res_packs_1_valid ? _GEN_3142 : _GEN_2870; // @[rob.scala 162:39]
  wire [3:0] _GEN_3415 = io_i_ex_res_packs_1_valid ? _GEN_3143 : _GEN_2871; // @[rob.scala 162:39]
  wire [3:0] _GEN_3416 = io_i_ex_res_packs_1_valid ? _GEN_3144 : _GEN_2872; // @[rob.scala 162:39]
  wire [3:0] _GEN_3417 = io_i_ex_res_packs_1_valid ? _GEN_3145 : _GEN_2873; // @[rob.scala 162:39]
  wire [63:0] _GEN_3418 = io_i_ex_res_packs_1_valid ? _GEN_3146 : _GEN_2874; // @[rob.scala 162:39]
  wire [63:0] _GEN_3419 = io_i_ex_res_packs_1_valid ? _GEN_3147 : _GEN_2875; // @[rob.scala 162:39]
  wire [63:0] _GEN_3420 = io_i_ex_res_packs_1_valid ? _GEN_3148 : _GEN_2876; // @[rob.scala 162:39]
  wire [63:0] _GEN_3421 = io_i_ex_res_packs_1_valid ? _GEN_3149 : _GEN_2877; // @[rob.scala 162:39]
  wire [63:0] _GEN_3422 = io_i_ex_res_packs_1_valid ? _GEN_3150 : _GEN_2878; // @[rob.scala 162:39]
  wire [63:0] _GEN_3423 = io_i_ex_res_packs_1_valid ? _GEN_3151 : _GEN_2879; // @[rob.scala 162:39]
  wire [63:0] _GEN_3424 = io_i_ex_res_packs_1_valid ? _GEN_3152 : _GEN_2880; // @[rob.scala 162:39]
  wire [63:0] _GEN_3425 = io_i_ex_res_packs_1_valid ? _GEN_3153 : _GEN_2881; // @[rob.scala 162:39]
  wire [63:0] _GEN_3426 = io_i_ex_res_packs_1_valid ? _GEN_3154 : _GEN_2882; // @[rob.scala 162:39]
  wire [63:0] _GEN_3427 = io_i_ex_res_packs_1_valid ? _GEN_3155 : _GEN_2883; // @[rob.scala 162:39]
  wire [63:0] _GEN_3428 = io_i_ex_res_packs_1_valid ? _GEN_3156 : _GEN_2884; // @[rob.scala 162:39]
  wire [63:0] _GEN_3429 = io_i_ex_res_packs_1_valid ? _GEN_3157 : _GEN_2885; // @[rob.scala 162:39]
  wire [63:0] _GEN_3430 = io_i_ex_res_packs_1_valid ? _GEN_3158 : _GEN_2886; // @[rob.scala 162:39]
  wire [63:0] _GEN_3431 = io_i_ex_res_packs_1_valid ? _GEN_3159 : _GEN_2887; // @[rob.scala 162:39]
  wire [63:0] _GEN_3432 = io_i_ex_res_packs_1_valid ? _GEN_3160 : _GEN_2888; // @[rob.scala 162:39]
  wire [63:0] _GEN_3433 = io_i_ex_res_packs_1_valid ? _GEN_3161 : _GEN_2889; // @[rob.scala 162:39]
  wire [63:0] _GEN_3434 = io_i_ex_res_packs_1_valid ? _GEN_3162 : _GEN_2890; // @[rob.scala 162:39]
  wire [63:0] _GEN_3435 = io_i_ex_res_packs_1_valid ? _GEN_3163 : _GEN_2891; // @[rob.scala 162:39]
  wire [63:0] _GEN_3436 = io_i_ex_res_packs_1_valid ? _GEN_3164 : _GEN_2892; // @[rob.scala 162:39]
  wire [63:0] _GEN_3437 = io_i_ex_res_packs_1_valid ? _GEN_3165 : _GEN_2893; // @[rob.scala 162:39]
  wire [63:0] _GEN_3438 = io_i_ex_res_packs_1_valid ? _GEN_3166 : _GEN_2894; // @[rob.scala 162:39]
  wire [63:0] _GEN_3439 = io_i_ex_res_packs_1_valid ? _GEN_3167 : _GEN_2895; // @[rob.scala 162:39]
  wire [63:0] _GEN_3440 = io_i_ex_res_packs_1_valid ? _GEN_3168 : _GEN_2896; // @[rob.scala 162:39]
  wire [63:0] _GEN_3441 = io_i_ex_res_packs_1_valid ? _GEN_3169 : _GEN_2897; // @[rob.scala 162:39]
  wire [63:0] _GEN_3442 = io_i_ex_res_packs_1_valid ? _GEN_3170 : _GEN_2898; // @[rob.scala 162:39]
  wire [63:0] _GEN_3443 = io_i_ex_res_packs_1_valid ? _GEN_3171 : _GEN_2899; // @[rob.scala 162:39]
  wire [63:0] _GEN_3444 = io_i_ex_res_packs_1_valid ? _GEN_3172 : _GEN_2900; // @[rob.scala 162:39]
  wire [63:0] _GEN_3445 = io_i_ex_res_packs_1_valid ? _GEN_3173 : _GEN_2901; // @[rob.scala 162:39]
  wire [63:0] _GEN_3446 = io_i_ex_res_packs_1_valid ? _GEN_3174 : _GEN_2902; // @[rob.scala 162:39]
  wire [63:0] _GEN_3447 = io_i_ex_res_packs_1_valid ? _GEN_3175 : _GEN_2903; // @[rob.scala 162:39]
  wire [63:0] _GEN_3448 = io_i_ex_res_packs_1_valid ? _GEN_3176 : _GEN_2904; // @[rob.scala 162:39]
  wire [63:0] _GEN_3449 = io_i_ex_res_packs_1_valid ? _GEN_3177 : _GEN_2905; // @[rob.scala 162:39]
  wire [2:0] _GEN_3458 = io_i_ex_res_packs_1_valid ? _GEN_3186 : _GEN_2914; // @[rob.scala 162:39]
  wire [2:0] _GEN_3459 = io_i_ex_res_packs_1_valid ? _GEN_3187 : _GEN_2915; // @[rob.scala 162:39]
  wire [2:0] _GEN_3460 = io_i_ex_res_packs_1_valid ? _GEN_3188 : _GEN_2916; // @[rob.scala 162:39]
  wire [2:0] _GEN_3461 = io_i_ex_res_packs_1_valid ? _GEN_3189 : _GEN_2917; // @[rob.scala 162:39]
  wire [2:0] _GEN_3462 = io_i_ex_res_packs_1_valid ? _GEN_3190 : _GEN_2918; // @[rob.scala 162:39]
  wire [2:0] _GEN_3463 = io_i_ex_res_packs_1_valid ? _GEN_3191 : _GEN_2919; // @[rob.scala 162:39]
  wire [2:0] _GEN_3464 = io_i_ex_res_packs_1_valid ? _GEN_3192 : _GEN_2920; // @[rob.scala 162:39]
  wire [2:0] _GEN_3465 = io_i_ex_res_packs_1_valid ? _GEN_3193 : _GEN_2921; // @[rob.scala 162:39]
  wire [2:0] _GEN_3466 = io_i_ex_res_packs_1_valid ? _GEN_3194 : _GEN_2922; // @[rob.scala 162:39]
  wire [2:0] _GEN_3467 = io_i_ex_res_packs_1_valid ? _GEN_3195 : _GEN_2923; // @[rob.scala 162:39]
  wire [2:0] _GEN_3468 = io_i_ex_res_packs_1_valid ? _GEN_3196 : _GEN_2924; // @[rob.scala 162:39]
  wire [2:0] _GEN_3469 = io_i_ex_res_packs_1_valid ? _GEN_3197 : _GEN_2925; // @[rob.scala 162:39]
  wire [2:0] _GEN_3470 = io_i_ex_res_packs_1_valid ? _GEN_3198 : _GEN_2926; // @[rob.scala 162:39]
  wire [2:0] _GEN_3471 = io_i_ex_res_packs_1_valid ? _GEN_3199 : _GEN_2927; // @[rob.scala 162:39]
  wire [2:0] _GEN_3472 = io_i_ex_res_packs_1_valid ? _GEN_3200 : _GEN_2928; // @[rob.scala 162:39]
  wire [2:0] _GEN_3473 = io_i_ex_res_packs_1_valid ? _GEN_3201 : _GEN_2929; // @[rob.scala 162:39]
  wire [4:0] _GEN_3474 = io_i_ex_res_packs_1_valid ? _GEN_3202 : _GEN_2930; // @[rob.scala 162:39]
  wire [4:0] _GEN_3475 = io_i_ex_res_packs_1_valid ? _GEN_3203 : _GEN_2931; // @[rob.scala 162:39]
  wire [4:0] _GEN_3476 = io_i_ex_res_packs_1_valid ? _GEN_3204 : _GEN_2932; // @[rob.scala 162:39]
  wire [4:0] _GEN_3477 = io_i_ex_res_packs_1_valid ? _GEN_3205 : _GEN_2933; // @[rob.scala 162:39]
  wire [4:0] _GEN_3478 = io_i_ex_res_packs_1_valid ? _GEN_3206 : _GEN_2934; // @[rob.scala 162:39]
  wire [4:0] _GEN_3479 = io_i_ex_res_packs_1_valid ? _GEN_3207 : _GEN_2935; // @[rob.scala 162:39]
  wire [4:0] _GEN_3480 = io_i_ex_res_packs_1_valid ? _GEN_3208 : _GEN_2936; // @[rob.scala 162:39]
  wire [4:0] _GEN_3481 = io_i_ex_res_packs_1_valid ? _GEN_3209 : _GEN_2937; // @[rob.scala 162:39]
  wire [3:0] _GEN_3482 = io_i_ex_res_packs_1_valid ? _GEN_3210 : _GEN_2938; // @[rob.scala 162:39]
  wire [3:0] _GEN_3483 = io_i_ex_res_packs_1_valid ? _GEN_3211 : _GEN_2939; // @[rob.scala 162:39]
  wire [3:0] _GEN_3484 = io_i_ex_res_packs_1_valid ? _GEN_3212 : _GEN_2940; // @[rob.scala 162:39]
  wire [3:0] _GEN_3485 = io_i_ex_res_packs_1_valid ? _GEN_3213 : _GEN_2941; // @[rob.scala 162:39]
  wire [3:0] _GEN_3486 = io_i_ex_res_packs_1_valid ? _GEN_3214 : _GEN_2942; // @[rob.scala 162:39]
  wire [3:0] _GEN_3487 = io_i_ex_res_packs_1_valid ? _GEN_3215 : _GEN_2943; // @[rob.scala 162:39]
  wire [3:0] _GEN_3488 = io_i_ex_res_packs_1_valid ? _GEN_3216 : _GEN_2944; // @[rob.scala 162:39]
  wire [3:0] _GEN_3489 = io_i_ex_res_packs_1_valid ? _GEN_3217 : _GEN_2945; // @[rob.scala 162:39]
  wire [2:0] _GEN_3490 = io_i_ex_res_packs_1_valid ? _GEN_3218 : _GEN_2946; // @[rob.scala 162:39]
  wire [2:0] _GEN_3491 = io_i_ex_res_packs_1_valid ? _GEN_3219 : _GEN_2947; // @[rob.scala 162:39]
  wire [2:0] _GEN_3492 = io_i_ex_res_packs_1_valid ? _GEN_3220 : _GEN_2948; // @[rob.scala 162:39]
  wire [2:0] _GEN_3493 = io_i_ex_res_packs_1_valid ? _GEN_3221 : _GEN_2949; // @[rob.scala 162:39]
  wire [2:0] _GEN_3494 = io_i_ex_res_packs_1_valid ? _GEN_3222 : _GEN_2950; // @[rob.scala 162:39]
  wire [2:0] _GEN_3495 = io_i_ex_res_packs_1_valid ? _GEN_3223 : _GEN_2951; // @[rob.scala 162:39]
  wire [2:0] _GEN_3496 = io_i_ex_res_packs_1_valid ? _GEN_3224 : _GEN_2952; // @[rob.scala 162:39]
  wire [2:0] _GEN_3497 = io_i_ex_res_packs_1_valid ? _GEN_3225 : _GEN_2953; // @[rob.scala 162:39]
  wire  _GEN_3506 = io_i_ex_res_packs_1_valid ? _GEN_3234 : _GEN_2962; // @[rob.scala 162:39]
  wire  _GEN_3507 = io_i_ex_res_packs_1_valid ? _GEN_3235 : _GEN_2963; // @[rob.scala 162:39]
  wire  _GEN_3508 = io_i_ex_res_packs_1_valid ? _GEN_3236 : _GEN_2964; // @[rob.scala 162:39]
  wire  _GEN_3509 = io_i_ex_res_packs_1_valid ? _GEN_3237 : _GEN_2965; // @[rob.scala 162:39]
  wire  _GEN_3510 = io_i_ex_res_packs_1_valid ? _GEN_3238 : _GEN_2966; // @[rob.scala 162:39]
  wire  _GEN_3511 = io_i_ex_res_packs_1_valid ? _GEN_3239 : _GEN_2967; // @[rob.scala 162:39]
  wire  _GEN_3512 = io_i_ex_res_packs_1_valid ? _GEN_3240 : _GEN_2968; // @[rob.scala 162:39]
  wire  _GEN_3513 = io_i_ex_res_packs_1_valid ? _GEN_3241 : _GEN_2969; // @[rob.scala 162:39]
  wire  _T_26 = next_will_commit_0 & next_will_commit_1; // @[rob.scala 170:32]
  wire  _GEN_3514 = 3'h0 == commit_ptr[2:0] ? 1'h0 : _GEN_3242; // @[rob.scala 171:{31,31}]
  wire  _GEN_3515 = 3'h1 == commit_ptr[2:0] ? 1'h0 : _GEN_3243; // @[rob.scala 171:{31,31}]
  wire  _GEN_3516 = 3'h2 == commit_ptr[2:0] ? 1'h0 : _GEN_3244; // @[rob.scala 171:{31,31}]
  wire  _GEN_3517 = 3'h3 == commit_ptr[2:0] ? 1'h0 : _GEN_3245; // @[rob.scala 171:{31,31}]
  wire  _GEN_3518 = 3'h4 == commit_ptr[2:0] ? 1'h0 : _GEN_3246; // @[rob.scala 171:{31,31}]
  wire  _GEN_3519 = 3'h5 == commit_ptr[2:0] ? 1'h0 : _GEN_3247; // @[rob.scala 171:{31,31}]
  wire  _GEN_3520 = 3'h6 == commit_ptr[2:0] ? 1'h0 : _GEN_3248; // @[rob.scala 171:{31,31}]
  wire  _GEN_3521 = 3'h7 == commit_ptr[2:0] ? 1'h0 : _GEN_3249; // @[rob.scala 171:{31,31}]
  wire  _GEN_3522 = 3'h0 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3514; // @[rob.scala 172:{35,35}]
  wire  _GEN_3523 = 3'h1 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3515; // @[rob.scala 172:{35,35}]
  wire  _GEN_3524 = 3'h2 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3516; // @[rob.scala 172:{35,35}]
  wire  _GEN_3525 = 3'h3 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3517; // @[rob.scala 172:{35,35}]
  wire  _GEN_3526 = 3'h4 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3518; // @[rob.scala 172:{35,35}]
  wire  _GEN_3527 = 3'h5 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3519; // @[rob.scala 172:{35,35}]
  wire  _GEN_3528 = 3'h6 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3520; // @[rob.scala 172:{35,35}]
  wire  _GEN_3529 = 3'h7 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_3521; // @[rob.scala 172:{35,35}]
  wire [3:0] _commit_ptr_T_1 = commit_ptr + 4'h2; // @[rob.scala 173:34]
  wire  _GEN_3538 = next_will_commit_0 ? _GEN_3514 : _GEN_3242; // @[rob.scala 174:38]
  wire  _GEN_3539 = next_will_commit_0 ? _GEN_3515 : _GEN_3243; // @[rob.scala 174:38]
  wire  _GEN_3540 = next_will_commit_0 ? _GEN_3516 : _GEN_3244; // @[rob.scala 174:38]
  wire  _GEN_3541 = next_will_commit_0 ? _GEN_3517 : _GEN_3245; // @[rob.scala 174:38]
  wire  _GEN_3542 = next_will_commit_0 ? _GEN_3518 : _GEN_3246; // @[rob.scala 174:38]
  wire  _GEN_3543 = next_will_commit_0 ? _GEN_3519 : _GEN_3247; // @[rob.scala 174:38]
  wire  _GEN_3544 = next_will_commit_0 ? _GEN_3520 : _GEN_3248; // @[rob.scala 174:38]
  wire  _GEN_3545 = next_will_commit_0 ? _GEN_3521 : _GEN_3249; // @[rob.scala 174:38]
  wire [3:0] _GEN_3546 = next_will_commit_0 ? _next_can_commit_1_T_1 : commit_ptr; // @[rob.scala 174:38 176:20 48:29]
  wire  _GEN_3547 = next_will_commit_0 & next_will_commit_1 ? _GEN_3522 : _GEN_3538; // @[rob.scala 170:55]
  wire  _GEN_3548 = next_will_commit_0 & next_will_commit_1 ? _GEN_3523 : _GEN_3539; // @[rob.scala 170:55]
  wire  _GEN_3549 = next_will_commit_0 & next_will_commit_1 ? _GEN_3524 : _GEN_3540; // @[rob.scala 170:55]
  wire  _GEN_3550 = next_will_commit_0 & next_will_commit_1 ? _GEN_3525 : _GEN_3541; // @[rob.scala 170:55]
  wire  _GEN_3551 = next_will_commit_0 & next_will_commit_1 ? _GEN_3526 : _GEN_3542; // @[rob.scala 170:55]
  wire  _GEN_3552 = next_will_commit_0 & next_will_commit_1 ? _GEN_3527 : _GEN_3543; // @[rob.scala 170:55]
  wire  _GEN_3553 = next_will_commit_0 & next_will_commit_1 ? _GEN_3528 : _GEN_3544; // @[rob.scala 170:55]
  wire  _GEN_3554 = next_will_commit_0 & next_will_commit_1 ? _GEN_3529 : _GEN_3545; // @[rob.scala 170:55]
  wire [3:0] _GEN_3555 = next_will_commit_0 & next_will_commit_1 ? _commit_ptr_T_1 : _GEN_3546; // @[rob.scala 170:55 173:20]
  wire  _GEN_3556 = _next_will_commit_0_T_5 ? _GEN_3250 : rob_uop_0_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3557 = _next_will_commit_0_T_5 ? _GEN_3251 : rob_uop_1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3558 = _next_will_commit_0_T_5 ? _GEN_3252 : rob_uop_2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3559 = _next_will_commit_0_T_5 ? _GEN_3253 : rob_uop_3_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3560 = _next_will_commit_0_T_5 ? _GEN_3254 : rob_uop_4_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3561 = _next_will_commit_0_T_5 ? _GEN_3255 : rob_uop_5_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3562 = _next_will_commit_0_T_5 ? _GEN_3256 : rob_uop_6_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3563 = _next_will_commit_0_T_5 ? _GEN_3257 : rob_uop_7_valid; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3564 = _next_will_commit_0_T_5 ? _GEN_3258 : rob_uop_0_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3565 = _next_will_commit_0_T_5 ? _GEN_3259 : rob_uop_1_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3566 = _next_will_commit_0_T_5 ? _GEN_3260 : rob_uop_2_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3567 = _next_will_commit_0_T_5 ? _GEN_3261 : rob_uop_3_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3568 = _next_will_commit_0_T_5 ? _GEN_3262 : rob_uop_4_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3569 = _next_will_commit_0_T_5 ? _GEN_3263 : rob_uop_5_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3570 = _next_will_commit_0_T_5 ? _GEN_3264 : rob_uop_6_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3571 = _next_will_commit_0_T_5 ? _GEN_3265 : rob_uop_7_pc; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3572 = _next_will_commit_0_T_5 ? _GEN_3266 : rob_uop_0_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3573 = _next_will_commit_0_T_5 ? _GEN_3267 : rob_uop_1_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3574 = _next_will_commit_0_T_5 ? _GEN_3268 : rob_uop_2_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3575 = _next_will_commit_0_T_5 ? _GEN_3269 : rob_uop_3_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3576 = _next_will_commit_0_T_5 ? _GEN_3270 : rob_uop_4_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3577 = _next_will_commit_0_T_5 ? _GEN_3271 : rob_uop_5_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3578 = _next_will_commit_0_T_5 ? _GEN_3272 : rob_uop_6_inst; // @[rob.scala 138:38 86:26]
  wire [31:0] _GEN_3579 = _next_will_commit_0_T_5 ? _GEN_3273 : rob_uop_7_inst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3580 = _next_will_commit_0_T_5 ? _GEN_3274 : rob_uop_0_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3581 = _next_will_commit_0_T_5 ? _GEN_3275 : rob_uop_1_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3582 = _next_will_commit_0_T_5 ? _GEN_3276 : rob_uop_2_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3583 = _next_will_commit_0_T_5 ? _GEN_3277 : rob_uop_3_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3584 = _next_will_commit_0_T_5 ? _GEN_3278 : rob_uop_4_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3585 = _next_will_commit_0_T_5 ? _GEN_3279 : rob_uop_5_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3586 = _next_will_commit_0_T_5 ? _GEN_3280 : rob_uop_6_func_code; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3587 = _next_will_commit_0_T_5 ? _GEN_3281 : rob_uop_7_func_code; // @[rob.scala 138:38 86:26]
  wire  _GEN_3588 = _next_will_commit_0_T_5 ? _GEN_3282 : rob_uop_0_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3589 = _next_will_commit_0_T_5 ? _GEN_3283 : rob_uop_1_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3590 = _next_will_commit_0_T_5 ? _GEN_3284 : rob_uop_2_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3591 = _next_will_commit_0_T_5 ? _GEN_3285 : rob_uop_3_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3592 = _next_will_commit_0_T_5 ? _GEN_3286 : rob_uop_4_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3593 = _next_will_commit_0_T_5 ? _GEN_3287 : rob_uop_5_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3594 = _next_will_commit_0_T_5 ? _GEN_3288 : rob_uop_6_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3595 = _next_will_commit_0_T_5 ? _GEN_3289 : rob_uop_7_branch_predict_pack_valid; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3596 = _next_will_commit_0_T_5 ? _GEN_3290 : rob_uop_0_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3597 = _next_will_commit_0_T_5 ? _GEN_3291 : rob_uop_1_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3598 = _next_will_commit_0_T_5 ? _GEN_3292 : rob_uop_2_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3599 = _next_will_commit_0_T_5 ? _GEN_3293 : rob_uop_3_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3600 = _next_will_commit_0_T_5 ? _GEN_3294 : rob_uop_4_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3601 = _next_will_commit_0_T_5 ? _GEN_3295 : rob_uop_5_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3602 = _next_will_commit_0_T_5 ? _GEN_3296 : rob_uop_6_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3603 = _next_will_commit_0_T_5 ? _GEN_3297 : rob_uop_7_branch_predict_pack_target; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3604 = _next_will_commit_0_T_5 ? _GEN_3298 : rob_uop_0_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3605 = _next_will_commit_0_T_5 ? _GEN_3299 : rob_uop_1_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3606 = _next_will_commit_0_T_5 ? _GEN_3300 : rob_uop_2_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3607 = _next_will_commit_0_T_5 ? _GEN_3301 : rob_uop_3_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3608 = _next_will_commit_0_T_5 ? _GEN_3302 : rob_uop_4_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3609 = _next_will_commit_0_T_5 ? _GEN_3303 : rob_uop_5_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3610 = _next_will_commit_0_T_5 ? _GEN_3304 : rob_uop_6_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3611 = _next_will_commit_0_T_5 ? _GEN_3305 : rob_uop_7_branch_predict_pack_branch_type; // @[rob.scala 138:38 86:26]
  wire  _GEN_3612 = _next_will_commit_0_T_5 ? _GEN_3306 : rob_uop_0_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3613 = _next_will_commit_0_T_5 ? _GEN_3307 : rob_uop_1_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3614 = _next_will_commit_0_T_5 ? _GEN_3308 : rob_uop_2_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3615 = _next_will_commit_0_T_5 ? _GEN_3309 : rob_uop_3_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3616 = _next_will_commit_0_T_5 ? _GEN_3310 : rob_uop_4_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3617 = _next_will_commit_0_T_5 ? _GEN_3311 : rob_uop_5_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3618 = _next_will_commit_0_T_5 ? _GEN_3312 : rob_uop_6_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3619 = _next_will_commit_0_T_5 ? _GEN_3313 : rob_uop_7_branch_predict_pack_select; // @[rob.scala 138:38 86:26]
  wire  _GEN_3620 = _next_will_commit_0_T_5 ? _GEN_3314 : rob_uop_0_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3621 = _next_will_commit_0_T_5 ? _GEN_3315 : rob_uop_1_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3622 = _next_will_commit_0_T_5 ? _GEN_3316 : rob_uop_2_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3623 = _next_will_commit_0_T_5 ? _GEN_3317 : rob_uop_3_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3624 = _next_will_commit_0_T_5 ? _GEN_3318 : rob_uop_4_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3625 = _next_will_commit_0_T_5 ? _GEN_3319 : rob_uop_5_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3626 = _next_will_commit_0_T_5 ? _GEN_3320 : rob_uop_6_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire  _GEN_3627 = _next_will_commit_0_T_5 ? _GEN_3321 : rob_uop_7_branch_predict_pack_taken; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3628 = _next_will_commit_0_T_5 ? _GEN_3322 : rob_uop_0_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3629 = _next_will_commit_0_T_5 ? _GEN_3323 : rob_uop_1_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3630 = _next_will_commit_0_T_5 ? _GEN_3324 : rob_uop_2_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3631 = _next_will_commit_0_T_5 ? _GEN_3325 : rob_uop_3_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3632 = _next_will_commit_0_T_5 ? _GEN_3326 : rob_uop_4_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3633 = _next_will_commit_0_T_5 ? _GEN_3327 : rob_uop_5_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3634 = _next_will_commit_0_T_5 ? _GEN_3328 : rob_uop_6_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3635 = _next_will_commit_0_T_5 ? _GEN_3329 : rob_uop_7_phy_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3636 = _next_will_commit_0_T_5 ? _GEN_3330 : rob_uop_0_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3637 = _next_will_commit_0_T_5 ? _GEN_3331 : rob_uop_1_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3638 = _next_will_commit_0_T_5 ? _GEN_3332 : rob_uop_2_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3639 = _next_will_commit_0_T_5 ? _GEN_3333 : rob_uop_3_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3640 = _next_will_commit_0_T_5 ? _GEN_3334 : rob_uop_4_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3641 = _next_will_commit_0_T_5 ? _GEN_3335 : rob_uop_5_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3642 = _next_will_commit_0_T_5 ? _GEN_3336 : rob_uop_6_stale_dst; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3643 = _next_will_commit_0_T_5 ? _GEN_3337 : rob_uop_7_stale_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3644 = _next_will_commit_0_T_5 ? _GEN_3338 : rob_uop_0_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3645 = _next_will_commit_0_T_5 ? _GEN_3339 : rob_uop_1_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3646 = _next_will_commit_0_T_5 ? _GEN_3340 : rob_uop_2_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3647 = _next_will_commit_0_T_5 ? _GEN_3341 : rob_uop_3_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3648 = _next_will_commit_0_T_5 ? _GEN_3342 : rob_uop_4_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3649 = _next_will_commit_0_T_5 ? _GEN_3343 : rob_uop_5_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3650 = _next_will_commit_0_T_5 ? _GEN_3344 : rob_uop_6_arch_dst; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3651 = _next_will_commit_0_T_5 ? _GEN_3345 : rob_uop_7_arch_dst; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3652 = _next_will_commit_0_T_5 ? _GEN_3346 : rob_uop_0_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3653 = _next_will_commit_0_T_5 ? _GEN_3347 : rob_uop_1_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3654 = _next_will_commit_0_T_5 ? _GEN_3348 : rob_uop_2_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3655 = _next_will_commit_0_T_5 ? _GEN_3349 : rob_uop_3_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3656 = _next_will_commit_0_T_5 ? _GEN_3350 : rob_uop_4_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3657 = _next_will_commit_0_T_5 ? _GEN_3351 : rob_uop_5_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3658 = _next_will_commit_0_T_5 ? _GEN_3352 : rob_uop_6_inst_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3659 = _next_will_commit_0_T_5 ? _GEN_3353 : rob_uop_7_inst_type; // @[rob.scala 138:38 86:26]
  wire  _GEN_3660 = _next_will_commit_0_T_5 ? _GEN_3354 : rob_uop_0_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3661 = _next_will_commit_0_T_5 ? _GEN_3355 : rob_uop_1_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3662 = _next_will_commit_0_T_5 ? _GEN_3356 : rob_uop_2_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3663 = _next_will_commit_0_T_5 ? _GEN_3357 : rob_uop_3_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3664 = _next_will_commit_0_T_5 ? _GEN_3358 : rob_uop_4_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3665 = _next_will_commit_0_T_5 ? _GEN_3359 : rob_uop_5_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3666 = _next_will_commit_0_T_5 ? _GEN_3360 : rob_uop_6_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3667 = _next_will_commit_0_T_5 ? _GEN_3361 : rob_uop_7_regWen; // @[rob.scala 138:38 86:26]
  wire  _GEN_3668 = _next_will_commit_0_T_5 ? _GEN_3362 : rob_uop_0_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3669 = _next_will_commit_0_T_5 ? _GEN_3363 : rob_uop_1_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3670 = _next_will_commit_0_T_5 ? _GEN_3364 : rob_uop_2_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3671 = _next_will_commit_0_T_5 ? _GEN_3365 : rob_uop_3_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3672 = _next_will_commit_0_T_5 ? _GEN_3366 : rob_uop_4_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3673 = _next_will_commit_0_T_5 ? _GEN_3367 : rob_uop_5_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3674 = _next_will_commit_0_T_5 ? _GEN_3368 : rob_uop_6_src1_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3675 = _next_will_commit_0_T_5 ? _GEN_3369 : rob_uop_7_src1_valid; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3676 = _next_will_commit_0_T_5 ? _GEN_3370 : rob_uop_0_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3677 = _next_will_commit_0_T_5 ? _GEN_3371 : rob_uop_1_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3678 = _next_will_commit_0_T_5 ? _GEN_3372 : rob_uop_2_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3679 = _next_will_commit_0_T_5 ? _GEN_3373 : rob_uop_3_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3680 = _next_will_commit_0_T_5 ? _GEN_3374 : rob_uop_4_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3681 = _next_will_commit_0_T_5 ? _GEN_3375 : rob_uop_5_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3682 = _next_will_commit_0_T_5 ? _GEN_3376 : rob_uop_6_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3683 = _next_will_commit_0_T_5 ? _GEN_3377 : rob_uop_7_phy_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3684 = _next_will_commit_0_T_5 ? _GEN_3378 : rob_uop_0_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3685 = _next_will_commit_0_T_5 ? _GEN_3379 : rob_uop_1_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3686 = _next_will_commit_0_T_5 ? _GEN_3380 : rob_uop_2_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3687 = _next_will_commit_0_T_5 ? _GEN_3381 : rob_uop_3_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3688 = _next_will_commit_0_T_5 ? _GEN_3382 : rob_uop_4_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3689 = _next_will_commit_0_T_5 ? _GEN_3383 : rob_uop_5_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3690 = _next_will_commit_0_T_5 ? _GEN_3384 : rob_uop_6_arch_rs1; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3691 = _next_will_commit_0_T_5 ? _GEN_3385 : rob_uop_7_arch_rs1; // @[rob.scala 138:38 86:26]
  wire  _GEN_3692 = _next_will_commit_0_T_5 ? _GEN_3386 : rob_uop_0_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3693 = _next_will_commit_0_T_5 ? _GEN_3387 : rob_uop_1_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3694 = _next_will_commit_0_T_5 ? _GEN_3388 : rob_uop_2_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3695 = _next_will_commit_0_T_5 ? _GEN_3389 : rob_uop_3_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3696 = _next_will_commit_0_T_5 ? _GEN_3390 : rob_uop_4_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3697 = _next_will_commit_0_T_5 ? _GEN_3391 : rob_uop_5_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3698 = _next_will_commit_0_T_5 ? _GEN_3392 : rob_uop_6_src2_valid; // @[rob.scala 138:38 86:26]
  wire  _GEN_3699 = _next_will_commit_0_T_5 ? _GEN_3393 : rob_uop_7_src2_valid; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3700 = _next_will_commit_0_T_5 ? _GEN_3394 : rob_uop_0_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3701 = _next_will_commit_0_T_5 ? _GEN_3395 : rob_uop_1_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3702 = _next_will_commit_0_T_5 ? _GEN_3396 : rob_uop_2_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3703 = _next_will_commit_0_T_5 ? _GEN_3397 : rob_uop_3_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3704 = _next_will_commit_0_T_5 ? _GEN_3398 : rob_uop_4_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3705 = _next_will_commit_0_T_5 ? _GEN_3399 : rob_uop_5_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3706 = _next_will_commit_0_T_5 ? _GEN_3400 : rob_uop_6_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [6:0] _GEN_3707 = _next_will_commit_0_T_5 ? _GEN_3401 : rob_uop_7_phy_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3708 = _next_will_commit_0_T_5 ? _GEN_3402 : rob_uop_0_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3709 = _next_will_commit_0_T_5 ? _GEN_3403 : rob_uop_1_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3710 = _next_will_commit_0_T_5 ? _GEN_3404 : rob_uop_2_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3711 = _next_will_commit_0_T_5 ? _GEN_3405 : rob_uop_3_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3712 = _next_will_commit_0_T_5 ? _GEN_3406 : rob_uop_4_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3713 = _next_will_commit_0_T_5 ? _GEN_3407 : rob_uop_5_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3714 = _next_will_commit_0_T_5 ? _GEN_3408 : rob_uop_6_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3715 = _next_will_commit_0_T_5 ? _GEN_3409 : rob_uop_7_arch_rs2; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3716 = _next_will_commit_0_T_5 ? _GEN_3410 : rob_uop_0_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3717 = _next_will_commit_0_T_5 ? _GEN_3411 : rob_uop_1_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3718 = _next_will_commit_0_T_5 ? _GEN_3412 : rob_uop_2_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3719 = _next_will_commit_0_T_5 ? _GEN_3413 : rob_uop_3_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3720 = _next_will_commit_0_T_5 ? _GEN_3414 : rob_uop_4_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3721 = _next_will_commit_0_T_5 ? _GEN_3415 : rob_uop_5_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3722 = _next_will_commit_0_T_5 ? _GEN_3416 : rob_uop_6_rob_idx; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3723 = _next_will_commit_0_T_5 ? _GEN_3417 : rob_uop_7_rob_idx; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3724 = _next_will_commit_0_T_5 ? _GEN_3418 : rob_uop_0_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3725 = _next_will_commit_0_T_5 ? _GEN_3419 : rob_uop_1_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3726 = _next_will_commit_0_T_5 ? _GEN_3420 : rob_uop_2_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3727 = _next_will_commit_0_T_5 ? _GEN_3421 : rob_uop_3_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3728 = _next_will_commit_0_T_5 ? _GEN_3422 : rob_uop_4_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3729 = _next_will_commit_0_T_5 ? _GEN_3423 : rob_uop_5_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3730 = _next_will_commit_0_T_5 ? _GEN_3424 : rob_uop_6_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3731 = _next_will_commit_0_T_5 ? _GEN_3425 : rob_uop_7_imm; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3732 = _next_will_commit_0_T_5 ? _GEN_3426 : rob_uop_0_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3733 = _next_will_commit_0_T_5 ? _GEN_3427 : rob_uop_1_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3734 = _next_will_commit_0_T_5 ? _GEN_3428 : rob_uop_2_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3735 = _next_will_commit_0_T_5 ? _GEN_3429 : rob_uop_3_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3736 = _next_will_commit_0_T_5 ? _GEN_3430 : rob_uop_4_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3737 = _next_will_commit_0_T_5 ? _GEN_3431 : rob_uop_5_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3738 = _next_will_commit_0_T_5 ? _GEN_3432 : rob_uop_6_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3739 = _next_will_commit_0_T_5 ? _GEN_3433 : rob_uop_7_dst_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3740 = _next_will_commit_0_T_5 ? _GEN_3434 : rob_uop_0_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3741 = _next_will_commit_0_T_5 ? _GEN_3435 : rob_uop_1_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3742 = _next_will_commit_0_T_5 ? _GEN_3436 : rob_uop_2_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3743 = _next_will_commit_0_T_5 ? _GEN_3437 : rob_uop_3_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3744 = _next_will_commit_0_T_5 ? _GEN_3438 : rob_uop_4_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3745 = _next_will_commit_0_T_5 ? _GEN_3439 : rob_uop_5_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3746 = _next_will_commit_0_T_5 ? _GEN_3440 : rob_uop_6_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3747 = _next_will_commit_0_T_5 ? _GEN_3441 : rob_uop_7_src1_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3748 = _next_will_commit_0_T_5 ? _GEN_3442 : rob_uop_0_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3749 = _next_will_commit_0_T_5 ? _GEN_3443 : rob_uop_1_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3750 = _next_will_commit_0_T_5 ? _GEN_3444 : rob_uop_2_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3751 = _next_will_commit_0_T_5 ? _GEN_3445 : rob_uop_3_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3752 = _next_will_commit_0_T_5 ? _GEN_3446 : rob_uop_4_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3753 = _next_will_commit_0_T_5 ? _GEN_3447 : rob_uop_5_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3754 = _next_will_commit_0_T_5 ? _GEN_3448 : rob_uop_6_src2_value; // @[rob.scala 138:38 86:26]
  wire [63:0] _GEN_3755 = _next_will_commit_0_T_5 ? _GEN_3449 : rob_uop_7_src2_value; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3764 = _next_will_commit_0_T_5 ? _GEN_3458 : rob_uop_0_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3765 = _next_will_commit_0_T_5 ? _GEN_3459 : rob_uop_1_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3766 = _next_will_commit_0_T_5 ? _GEN_3460 : rob_uop_2_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3767 = _next_will_commit_0_T_5 ? _GEN_3461 : rob_uop_3_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3768 = _next_will_commit_0_T_5 ? _GEN_3462 : rob_uop_4_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3769 = _next_will_commit_0_T_5 ? _GEN_3463 : rob_uop_5_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3770 = _next_will_commit_0_T_5 ? _GEN_3464 : rob_uop_6_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3771 = _next_will_commit_0_T_5 ? _GEN_3465 : rob_uop_7_op1_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3772 = _next_will_commit_0_T_5 ? _GEN_3466 : rob_uop_0_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3773 = _next_will_commit_0_T_5 ? _GEN_3467 : rob_uop_1_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3774 = _next_will_commit_0_T_5 ? _GEN_3468 : rob_uop_2_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3775 = _next_will_commit_0_T_5 ? _GEN_3469 : rob_uop_3_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3776 = _next_will_commit_0_T_5 ? _GEN_3470 : rob_uop_4_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3777 = _next_will_commit_0_T_5 ? _GEN_3471 : rob_uop_5_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3778 = _next_will_commit_0_T_5 ? _GEN_3472 : rob_uop_6_op2_sel; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3779 = _next_will_commit_0_T_5 ? _GEN_3473 : rob_uop_7_op2_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3780 = _next_will_commit_0_T_5 ? _GEN_3474 : rob_uop_0_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3781 = _next_will_commit_0_T_5 ? _GEN_3475 : rob_uop_1_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3782 = _next_will_commit_0_T_5 ? _GEN_3476 : rob_uop_2_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3783 = _next_will_commit_0_T_5 ? _GEN_3477 : rob_uop_3_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3784 = _next_will_commit_0_T_5 ? _GEN_3478 : rob_uop_4_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3785 = _next_will_commit_0_T_5 ? _GEN_3479 : rob_uop_5_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3786 = _next_will_commit_0_T_5 ? _GEN_3480 : rob_uop_6_alu_sel; // @[rob.scala 138:38 86:26]
  wire [4:0] _GEN_3787 = _next_will_commit_0_T_5 ? _GEN_3481 : rob_uop_7_alu_sel; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3788 = _next_will_commit_0_T_5 ? _GEN_3482 : rob_uop_0_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3789 = _next_will_commit_0_T_5 ? _GEN_3483 : rob_uop_1_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3790 = _next_will_commit_0_T_5 ? _GEN_3484 : rob_uop_2_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3791 = _next_will_commit_0_T_5 ? _GEN_3485 : rob_uop_3_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3792 = _next_will_commit_0_T_5 ? _GEN_3486 : rob_uop_4_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3793 = _next_will_commit_0_T_5 ? _GEN_3487 : rob_uop_5_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3794 = _next_will_commit_0_T_5 ? _GEN_3488 : rob_uop_6_branch_type; // @[rob.scala 138:38 86:26]
  wire [3:0] _GEN_3795 = _next_will_commit_0_T_5 ? _GEN_3489 : rob_uop_7_branch_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3796 = _next_will_commit_0_T_5 ? _GEN_3490 : rob_uop_0_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3797 = _next_will_commit_0_T_5 ? _GEN_3491 : rob_uop_1_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3798 = _next_will_commit_0_T_5 ? _GEN_3492 : rob_uop_2_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3799 = _next_will_commit_0_T_5 ? _GEN_3493 : rob_uop_3_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3800 = _next_will_commit_0_T_5 ? _GEN_3494 : rob_uop_4_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3801 = _next_will_commit_0_T_5 ? _GEN_3495 : rob_uop_5_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3802 = _next_will_commit_0_T_5 ? _GEN_3496 : rob_uop_6_mem_type; // @[rob.scala 138:38 86:26]
  wire [2:0] _GEN_3803 = _next_will_commit_0_T_5 ? _GEN_3497 : rob_uop_7_mem_type; // @[rob.scala 138:38 86:26]
  wire  _GEN_3804 = _next_will_commit_0_T_5 ? _GEN_3547 : rob_valid_0; // @[rob.scala 138:38 85:28]
  wire  _GEN_3805 = _next_will_commit_0_T_5 ? _GEN_3548 : rob_valid_1; // @[rob.scala 138:38 85:28]
  wire  _GEN_3806 = _next_will_commit_0_T_5 ? _GEN_3549 : rob_valid_2; // @[rob.scala 138:38 85:28]
  wire  _GEN_3807 = _next_will_commit_0_T_5 ? _GEN_3550 : rob_valid_3; // @[rob.scala 138:38 85:28]
  wire  _GEN_3808 = _next_will_commit_0_T_5 ? _GEN_3551 : rob_valid_4; // @[rob.scala 138:38 85:28]
  wire  _GEN_3809 = _next_will_commit_0_T_5 ? _GEN_3552 : rob_valid_5; // @[rob.scala 138:38 85:28]
  wire  _GEN_3810 = _next_will_commit_0_T_5 ? _GEN_3553 : rob_valid_6; // @[rob.scala 138:38 85:28]
  wire  _GEN_3811 = _next_will_commit_0_T_5 ? _GEN_3554 : rob_valid_7; // @[rob.scala 138:38 85:28]
  wire  _GEN_3812 = _next_will_commit_0_T_5 ? _GEN_3506 : rob_done_0; // @[rob.scala 138:38 88:27]
  wire  _GEN_3813 = _next_will_commit_0_T_5 ? _GEN_3507 : rob_done_1; // @[rob.scala 138:38 88:27]
  wire  _GEN_3814 = _next_will_commit_0_T_5 ? _GEN_3508 : rob_done_2; // @[rob.scala 138:38 88:27]
  wire  _GEN_3815 = _next_will_commit_0_T_5 ? _GEN_3509 : rob_done_3; // @[rob.scala 138:38 88:27]
  wire  _GEN_3816 = _next_will_commit_0_T_5 ? _GEN_3510 : rob_done_4; // @[rob.scala 138:38 88:27]
  wire  _GEN_3817 = _next_will_commit_0_T_5 ? _GEN_3511 : rob_done_5; // @[rob.scala 138:38 88:27]
  wire  _GEN_3818 = _next_will_commit_0_T_5 ? _GEN_3512 : rob_done_6; // @[rob.scala 138:38 88:27]
  wire  _GEN_3819 = _next_will_commit_0_T_5 ? _GEN_3513 : rob_done_7; // @[rob.scala 138:38 88:27]
  wire [3:0] _GEN_3820 = _next_will_commit_0_T_5 ? _GEN_2425 : allocate_ptr; // @[rob.scala 138:38 49:31]
  wire [3:0] _GEN_3829 = _next_will_commit_0_T_5 ? _GEN_3555 : commit_ptr; // @[rob.scala 138:38 48:29]
  wire  _GEN_3830 = _GEN_5333 | _GEN_3804; // @[rob.scala 182:{72,72}]
  wire  _GEN_3831 = _GEN_5334 | _GEN_3805; // @[rob.scala 182:{72,72}]
  wire  _GEN_3832 = _GEN_5335 | _GEN_3806; // @[rob.scala 182:{72,72}]
  wire  _GEN_3833 = _GEN_5336 | _GEN_3807; // @[rob.scala 182:{72,72}]
  wire  _GEN_3834 = _GEN_5337 | _GEN_3808; // @[rob.scala 182:{72,72}]
  wire  _GEN_3835 = _GEN_5338 | _GEN_3809; // @[rob.scala 182:{72,72}]
  wire  _GEN_3836 = _GEN_5339 | _GEN_3810; // @[rob.scala 182:{72,72}]
  wire  _GEN_3837 = _GEN_5340 | _GEN_3811; // @[rob.scala 182:{72,72}]
  wire  _GEN_3838 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3556; // @[rob.scala 183:{70,70}]
  wire  _GEN_3839 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3557; // @[rob.scala 183:{70,70}]
  wire  _GEN_3840 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3558; // @[rob.scala 183:{70,70}]
  wire  _GEN_3841 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3559; // @[rob.scala 183:{70,70}]
  wire  _GEN_3842 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3560; // @[rob.scala 183:{70,70}]
  wire  _GEN_3843 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3561; // @[rob.scala 183:{70,70}]
  wire  _GEN_3844 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3562; // @[rob.scala 183:{70,70}]
  wire  _GEN_3845 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_valid : _GEN_3563; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3846 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3564; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3847 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3565; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3848 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3566; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3849 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3567; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3850 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3568; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3851 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3569; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3852 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3570; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3853 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_pc : _GEN_3571; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3854 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3572; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3855 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3573; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3856 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3574; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3857 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3575; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3858 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3576; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3859 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3577; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3860 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3578; // @[rob.scala 183:{70,70}]
  wire [31:0] _GEN_3861 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst : _GEN_3579; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3862 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3580; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3863 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3581; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3864 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3582; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3865 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3583; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3866 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3584; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3867 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3585; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3868 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3586; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3869 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_func_code : _GEN_3587; // @[rob.scala 183:{70,70}]
  wire  _GEN_3870 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3588; // @[rob.scala 183:{70,70}]
  wire  _GEN_3871 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3589; // @[rob.scala 183:{70,70}]
  wire  _GEN_3872 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3590; // @[rob.scala 183:{70,70}]
  wire  _GEN_3873 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3591; // @[rob.scala 183:{70,70}]
  wire  _GEN_3874 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3592; // @[rob.scala 183:{70,70}]
  wire  _GEN_3875 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3593; // @[rob.scala 183:{70,70}]
  wire  _GEN_3876 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3594; // @[rob.scala 183:{70,70}]
  wire  _GEN_3877 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_valid :
    _GEN_3595; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3878 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3596; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3879 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3597; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3880 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3598; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3881 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3599; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3882 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3600; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3883 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3601; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3884 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3602; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_3885 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_target : _GEN_3603; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3886 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3604; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3887 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3605; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3888 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3606; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3889 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3607; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3890 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3608; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3891 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3609; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3892 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3610; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3893 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ?
    io_i_ex_res_packs_0_uop_branch_predict_pack_branch_type : _GEN_3611; // @[rob.scala 183:{70,70}]
  wire  _GEN_3894 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3612; // @[rob.scala 183:{70,70}]
  wire  _GEN_3895 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3613; // @[rob.scala 183:{70,70}]
  wire  _GEN_3896 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3614; // @[rob.scala 183:{70,70}]
  wire  _GEN_3897 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3615; // @[rob.scala 183:{70,70}]
  wire  _GEN_3898 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3616; // @[rob.scala 183:{70,70}]
  wire  _GEN_3899 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3617; // @[rob.scala 183:{70,70}]
  wire  _GEN_3900 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3618; // @[rob.scala 183:{70,70}]
  wire  _GEN_3901 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_select :
    _GEN_3619; // @[rob.scala 183:{70,70}]
  wire  _GEN_3902 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3620; // @[rob.scala 183:{70,70}]
  wire  _GEN_3903 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3621; // @[rob.scala 183:{70,70}]
  wire  _GEN_3904 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3622; // @[rob.scala 183:{70,70}]
  wire  _GEN_3905 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3623; // @[rob.scala 183:{70,70}]
  wire  _GEN_3906 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3624; // @[rob.scala 183:{70,70}]
  wire  _GEN_3907 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3625; // @[rob.scala 183:{70,70}]
  wire  _GEN_3908 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3626; // @[rob.scala 183:{70,70}]
  wire  _GEN_3909 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_predict_pack_taken :
    _GEN_3627; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3910 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3628; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3911 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3629; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3912 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3630; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3913 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3631; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3914 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3632; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3915 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3633; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3916 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3634; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3917 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_dst : _GEN_3635; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3918 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3636; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3919 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3637; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3920 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3638; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3921 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3639; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3922 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3640; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3923 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3641; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3924 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3642; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3925 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_stale_dst : _GEN_3643; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3926 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3644; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3927 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3645; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3928 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3646; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3929 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3647; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3930 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3648; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3931 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3649; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3932 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3650; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3933 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_dst : _GEN_3651; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3934 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3652; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3935 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3653; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3936 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3654; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3937 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3655; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3938 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3656; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3939 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3657; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3940 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3658; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_3941 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_inst_type : _GEN_3659; // @[rob.scala 183:{70,70}]
  wire  _GEN_3942 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3660; // @[rob.scala 183:{70,70}]
  wire  _GEN_3943 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3661; // @[rob.scala 183:{70,70}]
  wire  _GEN_3944 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3662; // @[rob.scala 183:{70,70}]
  wire  _GEN_3945 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3663; // @[rob.scala 183:{70,70}]
  wire  _GEN_3946 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3664; // @[rob.scala 183:{70,70}]
  wire  _GEN_3947 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3665; // @[rob.scala 183:{70,70}]
  wire  _GEN_3948 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3666; // @[rob.scala 183:{70,70}]
  wire  _GEN_3949 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_regWen : _GEN_3667; // @[rob.scala 183:{70,70}]
  wire  _GEN_3950 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3668; // @[rob.scala 183:{70,70}]
  wire  _GEN_3951 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3669; // @[rob.scala 183:{70,70}]
  wire  _GEN_3952 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3670; // @[rob.scala 183:{70,70}]
  wire  _GEN_3953 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3671; // @[rob.scala 183:{70,70}]
  wire  _GEN_3954 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3672; // @[rob.scala 183:{70,70}]
  wire  _GEN_3955 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3673; // @[rob.scala 183:{70,70}]
  wire  _GEN_3956 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3674; // @[rob.scala 183:{70,70}]
  wire  _GEN_3957 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_valid : _GEN_3675; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3958 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3676; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3959 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3677; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3960 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3678; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3961 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3679; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3962 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3680; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3963 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3681; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3964 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3682; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3965 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs1 : _GEN_3683; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3966 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3684; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3967 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3685; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3968 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3686; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3969 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3687; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3970 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3688; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3971 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3689; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3972 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3690; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3973 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs1 : _GEN_3691; // @[rob.scala 183:{70,70}]
  wire  _GEN_3974 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3692; // @[rob.scala 183:{70,70}]
  wire  _GEN_3975 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3693; // @[rob.scala 183:{70,70}]
  wire  _GEN_3976 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3694; // @[rob.scala 183:{70,70}]
  wire  _GEN_3977 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3695; // @[rob.scala 183:{70,70}]
  wire  _GEN_3978 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3696; // @[rob.scala 183:{70,70}]
  wire  _GEN_3979 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3697; // @[rob.scala 183:{70,70}]
  wire  _GEN_3980 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3698; // @[rob.scala 183:{70,70}]
  wire  _GEN_3981 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_valid : _GEN_3699; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3982 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3700; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3983 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3701; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3984 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3702; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3985 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3703; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3986 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3704; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3987 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3705; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3988 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3706; // @[rob.scala 183:{70,70}]
  wire [6:0] _GEN_3989 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_phy_rs2 : _GEN_3707; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3990 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3708; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3991 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3709; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3992 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3710; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3993 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3711; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3994 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3712; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3995 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3713; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3996 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3714; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_3997 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_arch_rs2 : _GEN_3715; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3998 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3716; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_3999 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3717; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4000 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3718; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4001 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3719; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4002 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3720; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4003 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3721; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4004 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3722; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4005 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_rob_idx : _GEN_3723; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4006 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3724; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4007 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3725; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4008 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3726; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4009 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3727; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4010 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3728; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4011 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3729; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4012 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3730; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4013 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_imm : _GEN_3731; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4014 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3732; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4015 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3733; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4016 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3734; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4017 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3735; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4018 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3736; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4019 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3737; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4020 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3738; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4021 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_dst_value : _GEN_3739; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4022 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3740; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4023 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3741; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4024 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3742; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4025 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3743; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4026 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3744; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4027 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3745; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4028 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3746; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4029 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src1_value : _GEN_3747; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4030 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3748; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4031 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3749; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4032 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3750; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4033 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3751; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4034 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3752; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4035 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3753; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4036 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3754; // @[rob.scala 183:{70,70}]
  wire [63:0] _GEN_4037 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_src2_value : _GEN_3755; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4046 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3764; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4047 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3765; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4048 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3766; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4049 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3767; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4050 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3768; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4051 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3769; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4052 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3770; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4053 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op1_sel : _GEN_3771; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4054 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3772; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4055 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3773; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4056 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3774; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4057 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3775; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4058 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3776; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4059 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3777; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4060 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3778; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4061 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_op2_sel : _GEN_3779; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4062 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3780; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4063 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3781; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4064 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3782; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4065 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3783; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4066 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3784; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4067 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3785; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4068 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3786; // @[rob.scala 183:{70,70}]
  wire [4:0] _GEN_4069 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_alu_sel : _GEN_3787; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4070 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3788; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4071 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3789; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4072 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3790; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4073 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3791; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4074 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3792; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4075 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3793; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4076 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3794; // @[rob.scala 183:{70,70}]
  wire [3:0] _GEN_4077 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_branch_type : _GEN_3795; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4078 = 3'h0 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3796; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4079 = 3'h1 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3797; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4080 = 3'h2 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3798; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4081 = 3'h3 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3799; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4082 = 3'h4 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3800; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4083 = 3'h5 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3801; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4084 = 3'h6 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3802; // @[rob.scala 183:{70,70}]
  wire [2:0] _GEN_4085 = 3'h7 == io_i_ex_res_packs_0_uop_rob_idx[2:0] ? io_i_ex_res_packs_0_uop_mem_type : _GEN_3803; // @[rob.scala 183:{70,70}]
  wire  _GEN_4094 = _GEN_5333 | _GEN_3812; // @[rob.scala 185:{71,71}]
  wire  _GEN_4095 = _GEN_5334 | _GEN_3813; // @[rob.scala 185:{71,71}]
  wire  _GEN_4096 = _GEN_5335 | _GEN_3814; // @[rob.scala 185:{71,71}]
  wire  _GEN_4097 = _GEN_5336 | _GEN_3815; // @[rob.scala 185:{71,71}]
  wire  _GEN_4098 = _GEN_5337 | _GEN_3816; // @[rob.scala 185:{71,71}]
  wire  _GEN_4099 = _GEN_5338 | _GEN_3817; // @[rob.scala 185:{71,71}]
  wire  _GEN_4100 = _GEN_5339 | _GEN_3818; // @[rob.scala 185:{71,71}]
  wire  _GEN_4101 = _GEN_5340 | _GEN_3819; // @[rob.scala 185:{71,71}]
  wire  _GEN_4102 = io_i_ex_res_packs_0_valid ? _GEN_3830 : _GEN_3804; // @[rob.scala 181:39]
  wire  _GEN_4103 = io_i_ex_res_packs_0_valid ? _GEN_3831 : _GEN_3805; // @[rob.scala 181:39]
  wire  _GEN_4104 = io_i_ex_res_packs_0_valid ? _GEN_3832 : _GEN_3806; // @[rob.scala 181:39]
  wire  _GEN_4105 = io_i_ex_res_packs_0_valid ? _GEN_3833 : _GEN_3807; // @[rob.scala 181:39]
  wire  _GEN_4106 = io_i_ex_res_packs_0_valid ? _GEN_3834 : _GEN_3808; // @[rob.scala 181:39]
  wire  _GEN_4107 = io_i_ex_res_packs_0_valid ? _GEN_3835 : _GEN_3809; // @[rob.scala 181:39]
  wire  _GEN_4108 = io_i_ex_res_packs_0_valid ? _GEN_3836 : _GEN_3810; // @[rob.scala 181:39]
  wire  _GEN_4109 = io_i_ex_res_packs_0_valid ? _GEN_3837 : _GEN_3811; // @[rob.scala 181:39]
  wire  _GEN_4110 = io_i_ex_res_packs_0_valid ? _GEN_3838 : _GEN_3556; // @[rob.scala 181:39]
  wire  _GEN_4111 = io_i_ex_res_packs_0_valid ? _GEN_3839 : _GEN_3557; // @[rob.scala 181:39]
  wire  _GEN_4112 = io_i_ex_res_packs_0_valid ? _GEN_3840 : _GEN_3558; // @[rob.scala 181:39]
  wire  _GEN_4113 = io_i_ex_res_packs_0_valid ? _GEN_3841 : _GEN_3559; // @[rob.scala 181:39]
  wire  _GEN_4114 = io_i_ex_res_packs_0_valid ? _GEN_3842 : _GEN_3560; // @[rob.scala 181:39]
  wire  _GEN_4115 = io_i_ex_res_packs_0_valid ? _GEN_3843 : _GEN_3561; // @[rob.scala 181:39]
  wire  _GEN_4116 = io_i_ex_res_packs_0_valid ? _GEN_3844 : _GEN_3562; // @[rob.scala 181:39]
  wire  _GEN_4117 = io_i_ex_res_packs_0_valid ? _GEN_3845 : _GEN_3563; // @[rob.scala 181:39]
  wire [31:0] _GEN_4118 = io_i_ex_res_packs_0_valid ? _GEN_3846 : _GEN_3564; // @[rob.scala 181:39]
  wire [31:0] _GEN_4119 = io_i_ex_res_packs_0_valid ? _GEN_3847 : _GEN_3565; // @[rob.scala 181:39]
  wire [31:0] _GEN_4120 = io_i_ex_res_packs_0_valid ? _GEN_3848 : _GEN_3566; // @[rob.scala 181:39]
  wire [31:0] _GEN_4121 = io_i_ex_res_packs_0_valid ? _GEN_3849 : _GEN_3567; // @[rob.scala 181:39]
  wire [31:0] _GEN_4122 = io_i_ex_res_packs_0_valid ? _GEN_3850 : _GEN_3568; // @[rob.scala 181:39]
  wire [31:0] _GEN_4123 = io_i_ex_res_packs_0_valid ? _GEN_3851 : _GEN_3569; // @[rob.scala 181:39]
  wire [31:0] _GEN_4124 = io_i_ex_res_packs_0_valid ? _GEN_3852 : _GEN_3570; // @[rob.scala 181:39]
  wire [31:0] _GEN_4125 = io_i_ex_res_packs_0_valid ? _GEN_3853 : _GEN_3571; // @[rob.scala 181:39]
  wire [31:0] _GEN_4126 = io_i_ex_res_packs_0_valid ? _GEN_3854 : _GEN_3572; // @[rob.scala 181:39]
  wire [31:0] _GEN_4127 = io_i_ex_res_packs_0_valid ? _GEN_3855 : _GEN_3573; // @[rob.scala 181:39]
  wire [31:0] _GEN_4128 = io_i_ex_res_packs_0_valid ? _GEN_3856 : _GEN_3574; // @[rob.scala 181:39]
  wire [31:0] _GEN_4129 = io_i_ex_res_packs_0_valid ? _GEN_3857 : _GEN_3575; // @[rob.scala 181:39]
  wire [31:0] _GEN_4130 = io_i_ex_res_packs_0_valid ? _GEN_3858 : _GEN_3576; // @[rob.scala 181:39]
  wire [31:0] _GEN_4131 = io_i_ex_res_packs_0_valid ? _GEN_3859 : _GEN_3577; // @[rob.scala 181:39]
  wire [31:0] _GEN_4132 = io_i_ex_res_packs_0_valid ? _GEN_3860 : _GEN_3578; // @[rob.scala 181:39]
  wire [31:0] _GEN_4133 = io_i_ex_res_packs_0_valid ? _GEN_3861 : _GEN_3579; // @[rob.scala 181:39]
  wire [6:0] _GEN_4134 = io_i_ex_res_packs_0_valid ? _GEN_3862 : _GEN_3580; // @[rob.scala 181:39]
  wire [6:0] _GEN_4135 = io_i_ex_res_packs_0_valid ? _GEN_3863 : _GEN_3581; // @[rob.scala 181:39]
  wire [6:0] _GEN_4136 = io_i_ex_res_packs_0_valid ? _GEN_3864 : _GEN_3582; // @[rob.scala 181:39]
  wire [6:0] _GEN_4137 = io_i_ex_res_packs_0_valid ? _GEN_3865 : _GEN_3583; // @[rob.scala 181:39]
  wire [6:0] _GEN_4138 = io_i_ex_res_packs_0_valid ? _GEN_3866 : _GEN_3584; // @[rob.scala 181:39]
  wire [6:0] _GEN_4139 = io_i_ex_res_packs_0_valid ? _GEN_3867 : _GEN_3585; // @[rob.scala 181:39]
  wire [6:0] _GEN_4140 = io_i_ex_res_packs_0_valid ? _GEN_3868 : _GEN_3586; // @[rob.scala 181:39]
  wire [6:0] _GEN_4141 = io_i_ex_res_packs_0_valid ? _GEN_3869 : _GEN_3587; // @[rob.scala 181:39]
  wire  _GEN_4142 = io_i_ex_res_packs_0_valid ? _GEN_3870 : _GEN_3588; // @[rob.scala 181:39]
  wire  _GEN_4143 = io_i_ex_res_packs_0_valid ? _GEN_3871 : _GEN_3589; // @[rob.scala 181:39]
  wire  _GEN_4144 = io_i_ex_res_packs_0_valid ? _GEN_3872 : _GEN_3590; // @[rob.scala 181:39]
  wire  _GEN_4145 = io_i_ex_res_packs_0_valid ? _GEN_3873 : _GEN_3591; // @[rob.scala 181:39]
  wire  _GEN_4146 = io_i_ex_res_packs_0_valid ? _GEN_3874 : _GEN_3592; // @[rob.scala 181:39]
  wire  _GEN_4147 = io_i_ex_res_packs_0_valid ? _GEN_3875 : _GEN_3593; // @[rob.scala 181:39]
  wire  _GEN_4148 = io_i_ex_res_packs_0_valid ? _GEN_3876 : _GEN_3594; // @[rob.scala 181:39]
  wire  _GEN_4149 = io_i_ex_res_packs_0_valid ? _GEN_3877 : _GEN_3595; // @[rob.scala 181:39]
  wire [63:0] _GEN_4150 = io_i_ex_res_packs_0_valid ? _GEN_3878 : _GEN_3596; // @[rob.scala 181:39]
  wire [63:0] _GEN_4151 = io_i_ex_res_packs_0_valid ? _GEN_3879 : _GEN_3597; // @[rob.scala 181:39]
  wire [63:0] _GEN_4152 = io_i_ex_res_packs_0_valid ? _GEN_3880 : _GEN_3598; // @[rob.scala 181:39]
  wire [63:0] _GEN_4153 = io_i_ex_res_packs_0_valid ? _GEN_3881 : _GEN_3599; // @[rob.scala 181:39]
  wire [63:0] _GEN_4154 = io_i_ex_res_packs_0_valid ? _GEN_3882 : _GEN_3600; // @[rob.scala 181:39]
  wire [63:0] _GEN_4155 = io_i_ex_res_packs_0_valid ? _GEN_3883 : _GEN_3601; // @[rob.scala 181:39]
  wire [63:0] _GEN_4156 = io_i_ex_res_packs_0_valid ? _GEN_3884 : _GEN_3602; // @[rob.scala 181:39]
  wire [63:0] _GEN_4157 = io_i_ex_res_packs_0_valid ? _GEN_3885 : _GEN_3603; // @[rob.scala 181:39]
  wire [3:0] _GEN_4158 = io_i_ex_res_packs_0_valid ? _GEN_3886 : _GEN_3604; // @[rob.scala 181:39]
  wire [3:0] _GEN_4159 = io_i_ex_res_packs_0_valid ? _GEN_3887 : _GEN_3605; // @[rob.scala 181:39]
  wire [3:0] _GEN_4160 = io_i_ex_res_packs_0_valid ? _GEN_3888 : _GEN_3606; // @[rob.scala 181:39]
  wire [3:0] _GEN_4161 = io_i_ex_res_packs_0_valid ? _GEN_3889 : _GEN_3607; // @[rob.scala 181:39]
  wire [3:0] _GEN_4162 = io_i_ex_res_packs_0_valid ? _GEN_3890 : _GEN_3608; // @[rob.scala 181:39]
  wire [3:0] _GEN_4163 = io_i_ex_res_packs_0_valid ? _GEN_3891 : _GEN_3609; // @[rob.scala 181:39]
  wire [3:0] _GEN_4164 = io_i_ex_res_packs_0_valid ? _GEN_3892 : _GEN_3610; // @[rob.scala 181:39]
  wire [3:0] _GEN_4165 = io_i_ex_res_packs_0_valid ? _GEN_3893 : _GEN_3611; // @[rob.scala 181:39]
  wire  _GEN_4166 = io_i_ex_res_packs_0_valid ? _GEN_3894 : _GEN_3612; // @[rob.scala 181:39]
  wire  _GEN_4167 = io_i_ex_res_packs_0_valid ? _GEN_3895 : _GEN_3613; // @[rob.scala 181:39]
  wire  _GEN_4168 = io_i_ex_res_packs_0_valid ? _GEN_3896 : _GEN_3614; // @[rob.scala 181:39]
  wire  _GEN_4169 = io_i_ex_res_packs_0_valid ? _GEN_3897 : _GEN_3615; // @[rob.scala 181:39]
  wire  _GEN_4170 = io_i_ex_res_packs_0_valid ? _GEN_3898 : _GEN_3616; // @[rob.scala 181:39]
  wire  _GEN_4171 = io_i_ex_res_packs_0_valid ? _GEN_3899 : _GEN_3617; // @[rob.scala 181:39]
  wire  _GEN_4172 = io_i_ex_res_packs_0_valid ? _GEN_3900 : _GEN_3618; // @[rob.scala 181:39]
  wire  _GEN_4173 = io_i_ex_res_packs_0_valid ? _GEN_3901 : _GEN_3619; // @[rob.scala 181:39]
  wire  _GEN_4174 = io_i_ex_res_packs_0_valid ? _GEN_3902 : _GEN_3620; // @[rob.scala 181:39]
  wire  _GEN_4175 = io_i_ex_res_packs_0_valid ? _GEN_3903 : _GEN_3621; // @[rob.scala 181:39]
  wire  _GEN_4176 = io_i_ex_res_packs_0_valid ? _GEN_3904 : _GEN_3622; // @[rob.scala 181:39]
  wire  _GEN_4177 = io_i_ex_res_packs_0_valid ? _GEN_3905 : _GEN_3623; // @[rob.scala 181:39]
  wire  _GEN_4178 = io_i_ex_res_packs_0_valid ? _GEN_3906 : _GEN_3624; // @[rob.scala 181:39]
  wire  _GEN_4179 = io_i_ex_res_packs_0_valid ? _GEN_3907 : _GEN_3625; // @[rob.scala 181:39]
  wire  _GEN_4180 = io_i_ex_res_packs_0_valid ? _GEN_3908 : _GEN_3626; // @[rob.scala 181:39]
  wire  _GEN_4181 = io_i_ex_res_packs_0_valid ? _GEN_3909 : _GEN_3627; // @[rob.scala 181:39]
  wire [6:0] _GEN_4182 = io_i_ex_res_packs_0_valid ? _GEN_3910 : _GEN_3628; // @[rob.scala 181:39]
  wire [6:0] _GEN_4183 = io_i_ex_res_packs_0_valid ? _GEN_3911 : _GEN_3629; // @[rob.scala 181:39]
  wire [6:0] _GEN_4184 = io_i_ex_res_packs_0_valid ? _GEN_3912 : _GEN_3630; // @[rob.scala 181:39]
  wire [6:0] _GEN_4185 = io_i_ex_res_packs_0_valid ? _GEN_3913 : _GEN_3631; // @[rob.scala 181:39]
  wire [6:0] _GEN_4186 = io_i_ex_res_packs_0_valid ? _GEN_3914 : _GEN_3632; // @[rob.scala 181:39]
  wire [6:0] _GEN_4187 = io_i_ex_res_packs_0_valid ? _GEN_3915 : _GEN_3633; // @[rob.scala 181:39]
  wire [6:0] _GEN_4188 = io_i_ex_res_packs_0_valid ? _GEN_3916 : _GEN_3634; // @[rob.scala 181:39]
  wire [6:0] _GEN_4189 = io_i_ex_res_packs_0_valid ? _GEN_3917 : _GEN_3635; // @[rob.scala 181:39]
  wire [6:0] _GEN_4190 = io_i_ex_res_packs_0_valid ? _GEN_3918 : _GEN_3636; // @[rob.scala 181:39]
  wire [6:0] _GEN_4191 = io_i_ex_res_packs_0_valid ? _GEN_3919 : _GEN_3637; // @[rob.scala 181:39]
  wire [6:0] _GEN_4192 = io_i_ex_res_packs_0_valid ? _GEN_3920 : _GEN_3638; // @[rob.scala 181:39]
  wire [6:0] _GEN_4193 = io_i_ex_res_packs_0_valid ? _GEN_3921 : _GEN_3639; // @[rob.scala 181:39]
  wire [6:0] _GEN_4194 = io_i_ex_res_packs_0_valid ? _GEN_3922 : _GEN_3640; // @[rob.scala 181:39]
  wire [6:0] _GEN_4195 = io_i_ex_res_packs_0_valid ? _GEN_3923 : _GEN_3641; // @[rob.scala 181:39]
  wire [6:0] _GEN_4196 = io_i_ex_res_packs_0_valid ? _GEN_3924 : _GEN_3642; // @[rob.scala 181:39]
  wire [6:0] _GEN_4197 = io_i_ex_res_packs_0_valid ? _GEN_3925 : _GEN_3643; // @[rob.scala 181:39]
  wire [4:0] _GEN_4198 = io_i_ex_res_packs_0_valid ? _GEN_3926 : _GEN_3644; // @[rob.scala 181:39]
  wire [4:0] _GEN_4199 = io_i_ex_res_packs_0_valid ? _GEN_3927 : _GEN_3645; // @[rob.scala 181:39]
  wire [4:0] _GEN_4200 = io_i_ex_res_packs_0_valid ? _GEN_3928 : _GEN_3646; // @[rob.scala 181:39]
  wire [4:0] _GEN_4201 = io_i_ex_res_packs_0_valid ? _GEN_3929 : _GEN_3647; // @[rob.scala 181:39]
  wire [4:0] _GEN_4202 = io_i_ex_res_packs_0_valid ? _GEN_3930 : _GEN_3648; // @[rob.scala 181:39]
  wire [4:0] _GEN_4203 = io_i_ex_res_packs_0_valid ? _GEN_3931 : _GEN_3649; // @[rob.scala 181:39]
  wire [4:0] _GEN_4204 = io_i_ex_res_packs_0_valid ? _GEN_3932 : _GEN_3650; // @[rob.scala 181:39]
  wire [4:0] _GEN_4205 = io_i_ex_res_packs_0_valid ? _GEN_3933 : _GEN_3651; // @[rob.scala 181:39]
  wire [2:0] _GEN_4206 = io_i_ex_res_packs_0_valid ? _GEN_3934 : _GEN_3652; // @[rob.scala 181:39]
  wire [2:0] _GEN_4207 = io_i_ex_res_packs_0_valid ? _GEN_3935 : _GEN_3653; // @[rob.scala 181:39]
  wire [2:0] _GEN_4208 = io_i_ex_res_packs_0_valid ? _GEN_3936 : _GEN_3654; // @[rob.scala 181:39]
  wire [2:0] _GEN_4209 = io_i_ex_res_packs_0_valid ? _GEN_3937 : _GEN_3655; // @[rob.scala 181:39]
  wire [2:0] _GEN_4210 = io_i_ex_res_packs_0_valid ? _GEN_3938 : _GEN_3656; // @[rob.scala 181:39]
  wire [2:0] _GEN_4211 = io_i_ex_res_packs_0_valid ? _GEN_3939 : _GEN_3657; // @[rob.scala 181:39]
  wire [2:0] _GEN_4212 = io_i_ex_res_packs_0_valid ? _GEN_3940 : _GEN_3658; // @[rob.scala 181:39]
  wire [2:0] _GEN_4213 = io_i_ex_res_packs_0_valid ? _GEN_3941 : _GEN_3659; // @[rob.scala 181:39]
  wire  _GEN_4214 = io_i_ex_res_packs_0_valid ? _GEN_3942 : _GEN_3660; // @[rob.scala 181:39]
  wire  _GEN_4215 = io_i_ex_res_packs_0_valid ? _GEN_3943 : _GEN_3661; // @[rob.scala 181:39]
  wire  _GEN_4216 = io_i_ex_res_packs_0_valid ? _GEN_3944 : _GEN_3662; // @[rob.scala 181:39]
  wire  _GEN_4217 = io_i_ex_res_packs_0_valid ? _GEN_3945 : _GEN_3663; // @[rob.scala 181:39]
  wire  _GEN_4218 = io_i_ex_res_packs_0_valid ? _GEN_3946 : _GEN_3664; // @[rob.scala 181:39]
  wire  _GEN_4219 = io_i_ex_res_packs_0_valid ? _GEN_3947 : _GEN_3665; // @[rob.scala 181:39]
  wire  _GEN_4220 = io_i_ex_res_packs_0_valid ? _GEN_3948 : _GEN_3666; // @[rob.scala 181:39]
  wire  _GEN_4221 = io_i_ex_res_packs_0_valid ? _GEN_3949 : _GEN_3667; // @[rob.scala 181:39]
  wire  _GEN_4222 = io_i_ex_res_packs_0_valid ? _GEN_3950 : _GEN_3668; // @[rob.scala 181:39]
  wire  _GEN_4223 = io_i_ex_res_packs_0_valid ? _GEN_3951 : _GEN_3669; // @[rob.scala 181:39]
  wire  _GEN_4224 = io_i_ex_res_packs_0_valid ? _GEN_3952 : _GEN_3670; // @[rob.scala 181:39]
  wire  _GEN_4225 = io_i_ex_res_packs_0_valid ? _GEN_3953 : _GEN_3671; // @[rob.scala 181:39]
  wire  _GEN_4226 = io_i_ex_res_packs_0_valid ? _GEN_3954 : _GEN_3672; // @[rob.scala 181:39]
  wire  _GEN_4227 = io_i_ex_res_packs_0_valid ? _GEN_3955 : _GEN_3673; // @[rob.scala 181:39]
  wire  _GEN_4228 = io_i_ex_res_packs_0_valid ? _GEN_3956 : _GEN_3674; // @[rob.scala 181:39]
  wire  _GEN_4229 = io_i_ex_res_packs_0_valid ? _GEN_3957 : _GEN_3675; // @[rob.scala 181:39]
  wire [6:0] _GEN_4230 = io_i_ex_res_packs_0_valid ? _GEN_3958 : _GEN_3676; // @[rob.scala 181:39]
  wire [6:0] _GEN_4231 = io_i_ex_res_packs_0_valid ? _GEN_3959 : _GEN_3677; // @[rob.scala 181:39]
  wire [6:0] _GEN_4232 = io_i_ex_res_packs_0_valid ? _GEN_3960 : _GEN_3678; // @[rob.scala 181:39]
  wire [6:0] _GEN_4233 = io_i_ex_res_packs_0_valid ? _GEN_3961 : _GEN_3679; // @[rob.scala 181:39]
  wire [6:0] _GEN_4234 = io_i_ex_res_packs_0_valid ? _GEN_3962 : _GEN_3680; // @[rob.scala 181:39]
  wire [6:0] _GEN_4235 = io_i_ex_res_packs_0_valid ? _GEN_3963 : _GEN_3681; // @[rob.scala 181:39]
  wire [6:0] _GEN_4236 = io_i_ex_res_packs_0_valid ? _GEN_3964 : _GEN_3682; // @[rob.scala 181:39]
  wire [6:0] _GEN_4237 = io_i_ex_res_packs_0_valid ? _GEN_3965 : _GEN_3683; // @[rob.scala 181:39]
  wire [4:0] _GEN_4238 = io_i_ex_res_packs_0_valid ? _GEN_3966 : _GEN_3684; // @[rob.scala 181:39]
  wire [4:0] _GEN_4239 = io_i_ex_res_packs_0_valid ? _GEN_3967 : _GEN_3685; // @[rob.scala 181:39]
  wire [4:0] _GEN_4240 = io_i_ex_res_packs_0_valid ? _GEN_3968 : _GEN_3686; // @[rob.scala 181:39]
  wire [4:0] _GEN_4241 = io_i_ex_res_packs_0_valid ? _GEN_3969 : _GEN_3687; // @[rob.scala 181:39]
  wire [4:0] _GEN_4242 = io_i_ex_res_packs_0_valid ? _GEN_3970 : _GEN_3688; // @[rob.scala 181:39]
  wire [4:0] _GEN_4243 = io_i_ex_res_packs_0_valid ? _GEN_3971 : _GEN_3689; // @[rob.scala 181:39]
  wire [4:0] _GEN_4244 = io_i_ex_res_packs_0_valid ? _GEN_3972 : _GEN_3690; // @[rob.scala 181:39]
  wire [4:0] _GEN_4245 = io_i_ex_res_packs_0_valid ? _GEN_3973 : _GEN_3691; // @[rob.scala 181:39]
  wire  _GEN_4246 = io_i_ex_res_packs_0_valid ? _GEN_3974 : _GEN_3692; // @[rob.scala 181:39]
  wire  _GEN_4247 = io_i_ex_res_packs_0_valid ? _GEN_3975 : _GEN_3693; // @[rob.scala 181:39]
  wire  _GEN_4248 = io_i_ex_res_packs_0_valid ? _GEN_3976 : _GEN_3694; // @[rob.scala 181:39]
  wire  _GEN_4249 = io_i_ex_res_packs_0_valid ? _GEN_3977 : _GEN_3695; // @[rob.scala 181:39]
  wire  _GEN_4250 = io_i_ex_res_packs_0_valid ? _GEN_3978 : _GEN_3696; // @[rob.scala 181:39]
  wire  _GEN_4251 = io_i_ex_res_packs_0_valid ? _GEN_3979 : _GEN_3697; // @[rob.scala 181:39]
  wire  _GEN_4252 = io_i_ex_res_packs_0_valid ? _GEN_3980 : _GEN_3698; // @[rob.scala 181:39]
  wire  _GEN_4253 = io_i_ex_res_packs_0_valid ? _GEN_3981 : _GEN_3699; // @[rob.scala 181:39]
  wire [6:0] _GEN_4254 = io_i_ex_res_packs_0_valid ? _GEN_3982 : _GEN_3700; // @[rob.scala 181:39]
  wire [6:0] _GEN_4255 = io_i_ex_res_packs_0_valid ? _GEN_3983 : _GEN_3701; // @[rob.scala 181:39]
  wire [6:0] _GEN_4256 = io_i_ex_res_packs_0_valid ? _GEN_3984 : _GEN_3702; // @[rob.scala 181:39]
  wire [6:0] _GEN_4257 = io_i_ex_res_packs_0_valid ? _GEN_3985 : _GEN_3703; // @[rob.scala 181:39]
  wire [6:0] _GEN_4258 = io_i_ex_res_packs_0_valid ? _GEN_3986 : _GEN_3704; // @[rob.scala 181:39]
  wire [6:0] _GEN_4259 = io_i_ex_res_packs_0_valid ? _GEN_3987 : _GEN_3705; // @[rob.scala 181:39]
  wire [6:0] _GEN_4260 = io_i_ex_res_packs_0_valid ? _GEN_3988 : _GEN_3706; // @[rob.scala 181:39]
  wire [6:0] _GEN_4261 = io_i_ex_res_packs_0_valid ? _GEN_3989 : _GEN_3707; // @[rob.scala 181:39]
  wire [4:0] _GEN_4262 = io_i_ex_res_packs_0_valid ? _GEN_3990 : _GEN_3708; // @[rob.scala 181:39]
  wire [4:0] _GEN_4263 = io_i_ex_res_packs_0_valid ? _GEN_3991 : _GEN_3709; // @[rob.scala 181:39]
  wire [4:0] _GEN_4264 = io_i_ex_res_packs_0_valid ? _GEN_3992 : _GEN_3710; // @[rob.scala 181:39]
  wire [4:0] _GEN_4265 = io_i_ex_res_packs_0_valid ? _GEN_3993 : _GEN_3711; // @[rob.scala 181:39]
  wire [4:0] _GEN_4266 = io_i_ex_res_packs_0_valid ? _GEN_3994 : _GEN_3712; // @[rob.scala 181:39]
  wire [4:0] _GEN_4267 = io_i_ex_res_packs_0_valid ? _GEN_3995 : _GEN_3713; // @[rob.scala 181:39]
  wire [4:0] _GEN_4268 = io_i_ex_res_packs_0_valid ? _GEN_3996 : _GEN_3714; // @[rob.scala 181:39]
  wire [4:0] _GEN_4269 = io_i_ex_res_packs_0_valid ? _GEN_3997 : _GEN_3715; // @[rob.scala 181:39]
  wire [3:0] _GEN_4270 = io_i_ex_res_packs_0_valid ? _GEN_3998 : _GEN_3716; // @[rob.scala 181:39]
  wire [3:0] _GEN_4271 = io_i_ex_res_packs_0_valid ? _GEN_3999 : _GEN_3717; // @[rob.scala 181:39]
  wire [3:0] _GEN_4272 = io_i_ex_res_packs_0_valid ? _GEN_4000 : _GEN_3718; // @[rob.scala 181:39]
  wire [3:0] _GEN_4273 = io_i_ex_res_packs_0_valid ? _GEN_4001 : _GEN_3719; // @[rob.scala 181:39]
  wire [3:0] _GEN_4274 = io_i_ex_res_packs_0_valid ? _GEN_4002 : _GEN_3720; // @[rob.scala 181:39]
  wire [3:0] _GEN_4275 = io_i_ex_res_packs_0_valid ? _GEN_4003 : _GEN_3721; // @[rob.scala 181:39]
  wire [3:0] _GEN_4276 = io_i_ex_res_packs_0_valid ? _GEN_4004 : _GEN_3722; // @[rob.scala 181:39]
  wire [3:0] _GEN_4277 = io_i_ex_res_packs_0_valid ? _GEN_4005 : _GEN_3723; // @[rob.scala 181:39]
  wire [63:0] _GEN_4278 = io_i_ex_res_packs_0_valid ? _GEN_4006 : _GEN_3724; // @[rob.scala 181:39]
  wire [63:0] _GEN_4279 = io_i_ex_res_packs_0_valid ? _GEN_4007 : _GEN_3725; // @[rob.scala 181:39]
  wire [63:0] _GEN_4280 = io_i_ex_res_packs_0_valid ? _GEN_4008 : _GEN_3726; // @[rob.scala 181:39]
  wire [63:0] _GEN_4281 = io_i_ex_res_packs_0_valid ? _GEN_4009 : _GEN_3727; // @[rob.scala 181:39]
  wire [63:0] _GEN_4282 = io_i_ex_res_packs_0_valid ? _GEN_4010 : _GEN_3728; // @[rob.scala 181:39]
  wire [63:0] _GEN_4283 = io_i_ex_res_packs_0_valid ? _GEN_4011 : _GEN_3729; // @[rob.scala 181:39]
  wire [63:0] _GEN_4284 = io_i_ex_res_packs_0_valid ? _GEN_4012 : _GEN_3730; // @[rob.scala 181:39]
  wire [63:0] _GEN_4285 = io_i_ex_res_packs_0_valid ? _GEN_4013 : _GEN_3731; // @[rob.scala 181:39]
  wire [63:0] _GEN_4286 = io_i_ex_res_packs_0_valid ? _GEN_4014 : _GEN_3732; // @[rob.scala 181:39]
  wire [63:0] _GEN_4287 = io_i_ex_res_packs_0_valid ? _GEN_4015 : _GEN_3733; // @[rob.scala 181:39]
  wire [63:0] _GEN_4288 = io_i_ex_res_packs_0_valid ? _GEN_4016 : _GEN_3734; // @[rob.scala 181:39]
  wire [63:0] _GEN_4289 = io_i_ex_res_packs_0_valid ? _GEN_4017 : _GEN_3735; // @[rob.scala 181:39]
  wire [63:0] _GEN_4290 = io_i_ex_res_packs_0_valid ? _GEN_4018 : _GEN_3736; // @[rob.scala 181:39]
  wire [63:0] _GEN_4291 = io_i_ex_res_packs_0_valid ? _GEN_4019 : _GEN_3737; // @[rob.scala 181:39]
  wire [63:0] _GEN_4292 = io_i_ex_res_packs_0_valid ? _GEN_4020 : _GEN_3738; // @[rob.scala 181:39]
  wire [63:0] _GEN_4293 = io_i_ex_res_packs_0_valid ? _GEN_4021 : _GEN_3739; // @[rob.scala 181:39]
  wire [63:0] _GEN_4294 = io_i_ex_res_packs_0_valid ? _GEN_4022 : _GEN_3740; // @[rob.scala 181:39]
  wire [63:0] _GEN_4295 = io_i_ex_res_packs_0_valid ? _GEN_4023 : _GEN_3741; // @[rob.scala 181:39]
  wire [63:0] _GEN_4296 = io_i_ex_res_packs_0_valid ? _GEN_4024 : _GEN_3742; // @[rob.scala 181:39]
  wire [63:0] _GEN_4297 = io_i_ex_res_packs_0_valid ? _GEN_4025 : _GEN_3743; // @[rob.scala 181:39]
  wire [63:0] _GEN_4298 = io_i_ex_res_packs_0_valid ? _GEN_4026 : _GEN_3744; // @[rob.scala 181:39]
  wire [63:0] _GEN_4299 = io_i_ex_res_packs_0_valid ? _GEN_4027 : _GEN_3745; // @[rob.scala 181:39]
  wire [63:0] _GEN_4300 = io_i_ex_res_packs_0_valid ? _GEN_4028 : _GEN_3746; // @[rob.scala 181:39]
  wire [63:0] _GEN_4301 = io_i_ex_res_packs_0_valid ? _GEN_4029 : _GEN_3747; // @[rob.scala 181:39]
  wire [63:0] _GEN_4302 = io_i_ex_res_packs_0_valid ? _GEN_4030 : _GEN_3748; // @[rob.scala 181:39]
  wire [63:0] _GEN_4303 = io_i_ex_res_packs_0_valid ? _GEN_4031 : _GEN_3749; // @[rob.scala 181:39]
  wire [63:0] _GEN_4304 = io_i_ex_res_packs_0_valid ? _GEN_4032 : _GEN_3750; // @[rob.scala 181:39]
  wire [63:0] _GEN_4305 = io_i_ex_res_packs_0_valid ? _GEN_4033 : _GEN_3751; // @[rob.scala 181:39]
  wire [63:0] _GEN_4306 = io_i_ex_res_packs_0_valid ? _GEN_4034 : _GEN_3752; // @[rob.scala 181:39]
  wire [63:0] _GEN_4307 = io_i_ex_res_packs_0_valid ? _GEN_4035 : _GEN_3753; // @[rob.scala 181:39]
  wire [63:0] _GEN_4308 = io_i_ex_res_packs_0_valid ? _GEN_4036 : _GEN_3754; // @[rob.scala 181:39]
  wire [63:0] _GEN_4309 = io_i_ex_res_packs_0_valid ? _GEN_4037 : _GEN_3755; // @[rob.scala 181:39]
  wire [2:0] _GEN_4318 = io_i_ex_res_packs_0_valid ? _GEN_4046 : _GEN_3764; // @[rob.scala 181:39]
  wire [2:0] _GEN_4319 = io_i_ex_res_packs_0_valid ? _GEN_4047 : _GEN_3765; // @[rob.scala 181:39]
  wire [2:0] _GEN_4320 = io_i_ex_res_packs_0_valid ? _GEN_4048 : _GEN_3766; // @[rob.scala 181:39]
  wire [2:0] _GEN_4321 = io_i_ex_res_packs_0_valid ? _GEN_4049 : _GEN_3767; // @[rob.scala 181:39]
  wire [2:0] _GEN_4322 = io_i_ex_res_packs_0_valid ? _GEN_4050 : _GEN_3768; // @[rob.scala 181:39]
  wire [2:0] _GEN_4323 = io_i_ex_res_packs_0_valid ? _GEN_4051 : _GEN_3769; // @[rob.scala 181:39]
  wire [2:0] _GEN_4324 = io_i_ex_res_packs_0_valid ? _GEN_4052 : _GEN_3770; // @[rob.scala 181:39]
  wire [2:0] _GEN_4325 = io_i_ex_res_packs_0_valid ? _GEN_4053 : _GEN_3771; // @[rob.scala 181:39]
  wire [2:0] _GEN_4326 = io_i_ex_res_packs_0_valid ? _GEN_4054 : _GEN_3772; // @[rob.scala 181:39]
  wire [2:0] _GEN_4327 = io_i_ex_res_packs_0_valid ? _GEN_4055 : _GEN_3773; // @[rob.scala 181:39]
  wire [2:0] _GEN_4328 = io_i_ex_res_packs_0_valid ? _GEN_4056 : _GEN_3774; // @[rob.scala 181:39]
  wire [2:0] _GEN_4329 = io_i_ex_res_packs_0_valid ? _GEN_4057 : _GEN_3775; // @[rob.scala 181:39]
  wire [2:0] _GEN_4330 = io_i_ex_res_packs_0_valid ? _GEN_4058 : _GEN_3776; // @[rob.scala 181:39]
  wire [2:0] _GEN_4331 = io_i_ex_res_packs_0_valid ? _GEN_4059 : _GEN_3777; // @[rob.scala 181:39]
  wire [2:0] _GEN_4332 = io_i_ex_res_packs_0_valid ? _GEN_4060 : _GEN_3778; // @[rob.scala 181:39]
  wire [2:0] _GEN_4333 = io_i_ex_res_packs_0_valid ? _GEN_4061 : _GEN_3779; // @[rob.scala 181:39]
  wire [4:0] _GEN_4334 = io_i_ex_res_packs_0_valid ? _GEN_4062 : _GEN_3780; // @[rob.scala 181:39]
  wire [4:0] _GEN_4335 = io_i_ex_res_packs_0_valid ? _GEN_4063 : _GEN_3781; // @[rob.scala 181:39]
  wire [4:0] _GEN_4336 = io_i_ex_res_packs_0_valid ? _GEN_4064 : _GEN_3782; // @[rob.scala 181:39]
  wire [4:0] _GEN_4337 = io_i_ex_res_packs_0_valid ? _GEN_4065 : _GEN_3783; // @[rob.scala 181:39]
  wire [4:0] _GEN_4338 = io_i_ex_res_packs_0_valid ? _GEN_4066 : _GEN_3784; // @[rob.scala 181:39]
  wire [4:0] _GEN_4339 = io_i_ex_res_packs_0_valid ? _GEN_4067 : _GEN_3785; // @[rob.scala 181:39]
  wire [4:0] _GEN_4340 = io_i_ex_res_packs_0_valid ? _GEN_4068 : _GEN_3786; // @[rob.scala 181:39]
  wire [4:0] _GEN_4341 = io_i_ex_res_packs_0_valid ? _GEN_4069 : _GEN_3787; // @[rob.scala 181:39]
  wire [3:0] _GEN_4342 = io_i_ex_res_packs_0_valid ? _GEN_4070 : _GEN_3788; // @[rob.scala 181:39]
  wire [3:0] _GEN_4343 = io_i_ex_res_packs_0_valid ? _GEN_4071 : _GEN_3789; // @[rob.scala 181:39]
  wire [3:0] _GEN_4344 = io_i_ex_res_packs_0_valid ? _GEN_4072 : _GEN_3790; // @[rob.scala 181:39]
  wire [3:0] _GEN_4345 = io_i_ex_res_packs_0_valid ? _GEN_4073 : _GEN_3791; // @[rob.scala 181:39]
  wire [3:0] _GEN_4346 = io_i_ex_res_packs_0_valid ? _GEN_4074 : _GEN_3792; // @[rob.scala 181:39]
  wire [3:0] _GEN_4347 = io_i_ex_res_packs_0_valid ? _GEN_4075 : _GEN_3793; // @[rob.scala 181:39]
  wire [3:0] _GEN_4348 = io_i_ex_res_packs_0_valid ? _GEN_4076 : _GEN_3794; // @[rob.scala 181:39]
  wire [3:0] _GEN_4349 = io_i_ex_res_packs_0_valid ? _GEN_4077 : _GEN_3795; // @[rob.scala 181:39]
  wire [2:0] _GEN_4350 = io_i_ex_res_packs_0_valid ? _GEN_4078 : _GEN_3796; // @[rob.scala 181:39]
  wire [2:0] _GEN_4351 = io_i_ex_res_packs_0_valid ? _GEN_4079 : _GEN_3797; // @[rob.scala 181:39]
  wire [2:0] _GEN_4352 = io_i_ex_res_packs_0_valid ? _GEN_4080 : _GEN_3798; // @[rob.scala 181:39]
  wire [2:0] _GEN_4353 = io_i_ex_res_packs_0_valid ? _GEN_4081 : _GEN_3799; // @[rob.scala 181:39]
  wire [2:0] _GEN_4354 = io_i_ex_res_packs_0_valid ? _GEN_4082 : _GEN_3800; // @[rob.scala 181:39]
  wire [2:0] _GEN_4355 = io_i_ex_res_packs_0_valid ? _GEN_4083 : _GEN_3801; // @[rob.scala 181:39]
  wire [2:0] _GEN_4356 = io_i_ex_res_packs_0_valid ? _GEN_4084 : _GEN_3802; // @[rob.scala 181:39]
  wire [2:0] _GEN_4357 = io_i_ex_res_packs_0_valid ? _GEN_4085 : _GEN_3803; // @[rob.scala 181:39]
  wire  _GEN_4366 = io_i_ex_res_packs_0_valid ? _GEN_4094 : _GEN_3812; // @[rob.scala 181:39]
  wire  _GEN_4367 = io_i_ex_res_packs_0_valid ? _GEN_4095 : _GEN_3813; // @[rob.scala 181:39]
  wire  _GEN_4368 = io_i_ex_res_packs_0_valid ? _GEN_4096 : _GEN_3814; // @[rob.scala 181:39]
  wire  _GEN_4369 = io_i_ex_res_packs_0_valid ? _GEN_4097 : _GEN_3815; // @[rob.scala 181:39]
  wire  _GEN_4370 = io_i_ex_res_packs_0_valid ? _GEN_4098 : _GEN_3816; // @[rob.scala 181:39]
  wire  _GEN_4371 = io_i_ex_res_packs_0_valid ? _GEN_4099 : _GEN_3817; // @[rob.scala 181:39]
  wire  _GEN_4372 = io_i_ex_res_packs_0_valid ? _GEN_4100 : _GEN_3818; // @[rob.scala 181:39]
  wire  _GEN_4373 = io_i_ex_res_packs_0_valid ? _GEN_4101 : _GEN_3819; // @[rob.scala 181:39]
  wire  _GEN_4374 = _GEN_5349 | _GEN_4102; // @[rob.scala 188:{72,72}]
  wire  _GEN_4375 = _GEN_5350 | _GEN_4103; // @[rob.scala 188:{72,72}]
  wire  _GEN_4376 = _GEN_5351 | _GEN_4104; // @[rob.scala 188:{72,72}]
  wire  _GEN_4377 = _GEN_5352 | _GEN_4105; // @[rob.scala 188:{72,72}]
  wire  _GEN_4378 = _GEN_5353 | _GEN_4106; // @[rob.scala 188:{72,72}]
  wire  _GEN_4379 = _GEN_5354 | _GEN_4107; // @[rob.scala 188:{72,72}]
  wire  _GEN_4380 = _GEN_5355 | _GEN_4108; // @[rob.scala 188:{72,72}]
  wire  _GEN_4381 = _GEN_5356 | _GEN_4109; // @[rob.scala 188:{72,72}]
  wire  _GEN_4638 = _GEN_5349 | _GEN_4366; // @[rob.scala 191:{71,71}]
  wire  _GEN_4639 = _GEN_5350 | _GEN_4367; // @[rob.scala 191:{71,71}]
  wire  _GEN_4640 = _GEN_5351 | _GEN_4368; // @[rob.scala 191:{71,71}]
  wire  _GEN_4641 = _GEN_5352 | _GEN_4369; // @[rob.scala 191:{71,71}]
  wire  _GEN_4642 = _GEN_5353 | _GEN_4370; // @[rob.scala 191:{71,71}]
  wire  _GEN_4643 = _GEN_5354 | _GEN_4371; // @[rob.scala 191:{71,71}]
  wire  _GEN_4644 = _GEN_5355 | _GEN_4372; // @[rob.scala 191:{71,71}]
  wire  _GEN_4645 = _GEN_5356 | _GEN_4373; // @[rob.scala 191:{71,71}]
  wire  _GEN_4646 = io_i_ex_res_packs_1_valid ? _GEN_4374 : _GEN_4102; // @[rob.scala 187:39]
  wire  _GEN_4647 = io_i_ex_res_packs_1_valid ? _GEN_4375 : _GEN_4103; // @[rob.scala 187:39]
  wire  _GEN_4648 = io_i_ex_res_packs_1_valid ? _GEN_4376 : _GEN_4104; // @[rob.scala 187:39]
  wire  _GEN_4649 = io_i_ex_res_packs_1_valid ? _GEN_4377 : _GEN_4105; // @[rob.scala 187:39]
  wire  _GEN_4650 = io_i_ex_res_packs_1_valid ? _GEN_4378 : _GEN_4106; // @[rob.scala 187:39]
  wire  _GEN_4651 = io_i_ex_res_packs_1_valid ? _GEN_4379 : _GEN_4107; // @[rob.scala 187:39]
  wire  _GEN_4652 = io_i_ex_res_packs_1_valid ? _GEN_4380 : _GEN_4108; // @[rob.scala 187:39]
  wire  _GEN_4653 = io_i_ex_res_packs_1_valid ? _GEN_4381 : _GEN_4109; // @[rob.scala 187:39]
  wire  _GEN_4918 = 3'h0 == commit_ptr[2:0] ? 1'h0 : _GEN_4646; // @[rob.scala 195:{31,31}]
  wire  _GEN_4919 = 3'h1 == commit_ptr[2:0] ? 1'h0 : _GEN_4647; // @[rob.scala 195:{31,31}]
  wire  _GEN_4920 = 3'h2 == commit_ptr[2:0] ? 1'h0 : _GEN_4648; // @[rob.scala 195:{31,31}]
  wire  _GEN_4921 = 3'h3 == commit_ptr[2:0] ? 1'h0 : _GEN_4649; // @[rob.scala 195:{31,31}]
  wire  _GEN_4922 = 3'h4 == commit_ptr[2:0] ? 1'h0 : _GEN_4650; // @[rob.scala 195:{31,31}]
  wire  _GEN_4923 = 3'h5 == commit_ptr[2:0] ? 1'h0 : _GEN_4651; // @[rob.scala 195:{31,31}]
  wire  _GEN_4924 = 3'h6 == commit_ptr[2:0] ? 1'h0 : _GEN_4652; // @[rob.scala 195:{31,31}]
  wire  _GEN_4925 = 3'h7 == commit_ptr[2:0] ? 1'h0 : _GEN_4653; // @[rob.scala 195:{31,31}]
  wire  _GEN_4926 = 3'h0 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4918; // @[rob.scala 196:{35,35}]
  wire  _GEN_4927 = 3'h1 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4919; // @[rob.scala 196:{35,35}]
  wire  _GEN_4928 = 3'h2 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4920; // @[rob.scala 196:{35,35}]
  wire  _GEN_4929 = 3'h3 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4921; // @[rob.scala 196:{35,35}]
  wire  _GEN_4930 = 3'h4 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4922; // @[rob.scala 196:{35,35}]
  wire  _GEN_4931 = 3'h5 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4923; // @[rob.scala 196:{35,35}]
  wire  _GEN_4932 = 3'h6 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4924; // @[rob.scala 196:{35,35}]
  wire  _GEN_4933 = 3'h7 == _next_can_commit_1_T_1[2:0] ? 1'h0 : _GEN_4925; // @[rob.scala 196:{35,35}]
  wire  _GEN_4942 = next_will_commit_0 ? _GEN_4918 : _GEN_4646; // @[rob.scala 198:38]
  wire  _GEN_4943 = next_will_commit_0 ? _GEN_4919 : _GEN_4647; // @[rob.scala 198:38]
  wire  _GEN_4944 = next_will_commit_0 ? _GEN_4920 : _GEN_4648; // @[rob.scala 198:38]
  wire  _GEN_4945 = next_will_commit_0 ? _GEN_4921 : _GEN_4649; // @[rob.scala 198:38]
  wire  _GEN_4946 = next_will_commit_0 ? _GEN_4922 : _GEN_4650; // @[rob.scala 198:38]
  wire  _GEN_4947 = next_will_commit_0 ? _GEN_4923 : _GEN_4651; // @[rob.scala 198:38]
  wire  _GEN_4948 = next_will_commit_0 ? _GEN_4924 : _GEN_4652; // @[rob.scala 198:38]
  wire  _GEN_4949 = next_will_commit_0 ? _GEN_4925 : _GEN_4653; // @[rob.scala 198:38]
  wire [3:0] _GEN_4950 = next_will_commit_0 ? _next_can_commit_1_T_1 : _GEN_3829; // @[rob.scala 198:38 200:20]
  wire  _GEN_4951 = _T_26 ? _GEN_4926 : _GEN_4942; // @[rob.scala 194:55]
  wire  _GEN_4952 = _T_26 ? _GEN_4927 : _GEN_4943; // @[rob.scala 194:55]
  wire  _GEN_4953 = _T_26 ? _GEN_4928 : _GEN_4944; // @[rob.scala 194:55]
  wire  _GEN_4954 = _T_26 ? _GEN_4929 : _GEN_4945; // @[rob.scala 194:55]
  wire  _GEN_4955 = _T_26 ? _GEN_4930 : _GEN_4946; // @[rob.scala 194:55]
  wire  _GEN_4956 = _T_26 ? _GEN_4931 : _GEN_4947; // @[rob.scala 194:55]
  wire  _GEN_4957 = _T_26 ? _GEN_4932 : _GEN_4948; // @[rob.scala 194:55]
  wire  _GEN_4958 = _T_26 ? _GEN_4933 : _GEN_4949; // @[rob.scala 194:55]
  wire  _GEN_4960 = _next_will_commit_0_T_6 ? _GEN_4951 : _GEN_3804; // @[rob.scala 179:36]
  wire  _GEN_4961 = _next_will_commit_0_T_6 ? _GEN_4952 : _GEN_3805; // @[rob.scala 179:36]
  wire  _GEN_4962 = _next_will_commit_0_T_6 ? _GEN_4953 : _GEN_3806; // @[rob.scala 179:36]
  wire  _GEN_4963 = _next_will_commit_0_T_6 ? _GEN_4954 : _GEN_3807; // @[rob.scala 179:36]
  wire  _GEN_4964 = _next_will_commit_0_T_6 ? _GEN_4955 : _GEN_3808; // @[rob.scala 179:36]
  wire  _GEN_4965 = _next_will_commit_0_T_6 ? _GEN_4956 : _GEN_3809; // @[rob.scala 179:36]
  wire  _GEN_4966 = _next_will_commit_0_T_6 ? _GEN_4957 : _GEN_3810; // @[rob.scala 179:36]
  wire  _GEN_4967 = _next_will_commit_0_T_6 ? _GEN_4958 : _GEN_3811; // @[rob.scala 179:36]
  wire [3:0] _allocate_ptr_T_5 = allocate_ptr - this_num_to_roll_back; // @[rob.scala 211:38]
  wire  _GEN_5233 = 3'h0 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4960; // @[rob.scala 213:{39,39}]
  wire  _GEN_5234 = 3'h1 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4961; // @[rob.scala 213:{39,39}]
  wire  _GEN_5235 = 3'h2 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4962; // @[rob.scala 213:{39,39}]
  wire  _GEN_5236 = 3'h3 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4963; // @[rob.scala 213:{39,39}]
  wire  _GEN_5237 = 3'h4 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4964; // @[rob.scala 213:{39,39}]
  wire  _GEN_5238 = 3'h5 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4965; // @[rob.scala 213:{39,39}]
  wire  _GEN_5239 = 3'h6 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4966; // @[rob.scala 213:{39,39}]
  wire  _GEN_5240 = 3'h7 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_4967; // @[rob.scala 213:{39,39}]
  wire  _GEN_5241 = 3'h0 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5233; // @[rob.scala 214:{39,39}]
  wire  _GEN_5242 = 3'h1 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5234; // @[rob.scala 214:{39,39}]
  wire  _GEN_5243 = 3'h2 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5235; // @[rob.scala 214:{39,39}]
  wire  _GEN_5244 = 3'h3 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5236; // @[rob.scala 214:{39,39}]
  wire  _GEN_5245 = 3'h4 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5237; // @[rob.scala 214:{39,39}]
  wire  _GEN_5246 = 3'h5 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5238; // @[rob.scala 214:{39,39}]
  wire  _GEN_5247 = 3'h6 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5239; // @[rob.scala 214:{39,39}]
  wire  _GEN_5248 = 3'h7 == _this_num_to_roll_back_T_3[2:0] ? 1'h0 : _GEN_5240; // @[rob.scala 214:{39,39}]
  wire  _GEN_5249 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5241 : _GEN_4960; // @[rob.scala 212:44]
  wire  _GEN_5250 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5242 : _GEN_4961; // @[rob.scala 212:44]
  wire  _GEN_5251 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5243 : _GEN_4962; // @[rob.scala 212:44]
  wire  _GEN_5252 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5244 : _GEN_4963; // @[rob.scala 212:44]
  wire  _GEN_5253 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5245 : _GEN_4964; // @[rob.scala 212:44]
  wire  _GEN_5254 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5246 : _GEN_4965; // @[rob.scala 212:44]
  wire  _GEN_5255 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5247 : _GEN_4966; // @[rob.scala 212:44]
  wire  _GEN_5256 = _io_o_rollback_packs_1_valid_T_4 ? _GEN_5248 : _GEN_4967; // @[rob.scala 212:44]
  wire  _GEN_5257 = 3'h0 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5249; // @[rob.scala 217:{39,39}]
  wire  _GEN_5258 = 3'h1 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5250; // @[rob.scala 217:{39,39}]
  wire  _GEN_5259 = 3'h2 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5251; // @[rob.scala 217:{39,39}]
  wire  _GEN_5260 = 3'h3 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5252; // @[rob.scala 217:{39,39}]
  wire  _GEN_5261 = 3'h4 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5253; // @[rob.scala 217:{39,39}]
  wire  _GEN_5262 = 3'h5 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5254; // @[rob.scala 217:{39,39}]
  wire  _GEN_5263 = 3'h6 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5255; // @[rob.scala 217:{39,39}]
  wire  _GEN_5264 = 3'h7 == _next_rob_state_T_9[2:0] ? 1'h0 : _GEN_5256; // @[rob.scala 217:{39,39}]
  wire  _GEN_5265 = this_num_to_roll_back == 4'h1 ? _GEN_5257 : _GEN_5249; // @[rob.scala 216:44]
  wire  _GEN_5266 = this_num_to_roll_back == 4'h1 ? _GEN_5258 : _GEN_5250; // @[rob.scala 216:44]
  wire  _GEN_5267 = this_num_to_roll_back == 4'h1 ? _GEN_5259 : _GEN_5251; // @[rob.scala 216:44]
  wire  _GEN_5268 = this_num_to_roll_back == 4'h1 ? _GEN_5260 : _GEN_5252; // @[rob.scala 216:44]
  wire  _GEN_5269 = this_num_to_roll_back == 4'h1 ? _GEN_5261 : _GEN_5253; // @[rob.scala 216:44]
  wire  _GEN_5270 = this_num_to_roll_back == 4'h1 ? _GEN_5262 : _GEN_5254; // @[rob.scala 216:44]
  wire  _GEN_5271 = this_num_to_roll_back == 4'h1 ? _GEN_5263 : _GEN_5255; // @[rob.scala 216:44]
  wire  _GEN_5272 = this_num_to_roll_back == 4'h1 ? _GEN_5264 : _GEN_5256; // @[rob.scala 216:44]
  assign io_o_full = _is_full_T_1[2:0] == commit_ptr[2:0] | _is_full_T_6[2:0] == commit_ptr[2:0]; // @[rob.scala 239:92]
  assign io_o_rob_allocation_ress_0_rob_idx = allocate_ptr; // @[rob.scala 135:43]
  assign io_o_rob_allocation_ress_1_rob_idx = allocate_ptr + 4'h1; // @[rob.scala 136:58]
  assign io_o_rollback_packs_0_valid = _this_num_to_roll_back_T_1 & (_next_rob_state_T_26 | ~need_to_rbk_dispatch |
    _io_o_rollback_packs_0_valid_T_4); // @[rob.scala 129:67]
  assign io_o_rollback_packs_0_uop_phy_dst = rob_state != 2'h2 & need_to_rbk_dispatch ?
    _io_o_rollback_packs_0_uop_T_2_phy_dst : _GEN_834; // @[rob.scala 132:39]
  assign io_o_rollback_packs_0_uop_stale_dst = rob_state != 2'h2 & need_to_rbk_dispatch ?
    _io_o_rollback_packs_0_uop_T_2_stale_dst : _GEN_835; // @[rob.scala 132:39]
  assign io_o_rollback_packs_0_uop_arch_dst = rob_state != 2'h2 & need_to_rbk_dispatch ?
    _io_o_rollback_packs_0_uop_T_2_arch_dst : _GEN_836; // @[rob.scala 132:39]
  assign io_o_rollback_packs_1_valid = _this_num_to_roll_back_T_1 & _io_o_rollback_packs_1_valid_T_5; // @[rob.scala 130:67]
  assign io_o_rollback_packs_1_uop_phy_dst = _io_o_rollback_packs_0_uop_T_1 ? io_i_rob_allocation_reqs_0_uop_phy_dst :
    _GEN_1082; // @[rob.scala 133:39]
  assign io_o_rollback_packs_1_uop_stale_dst = _io_o_rollback_packs_0_uop_T_1 ? io_i_rob_allocation_reqs_0_uop_stale_dst
     : _GEN_1083; // @[rob.scala 133:39]
  assign io_o_rollback_packs_1_uop_arch_dst = _io_o_rollback_packs_0_uop_T_1 ? io_i_rob_allocation_reqs_0_uop_arch_dst
     : _GEN_1084; // @[rob.scala 133:39]
  assign io_o_commit_packs_0_valid = next_will_commit_0 & _next_will_commit_0_T_7; // @[rob.scala 111:59]
  assign io_o_commit_packs_0_uop_valid = 3'h7 == commit_ptr[2:0] ? rob_uop_7_valid : _GEN_102; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_pc = 3'h7 == commit_ptr[2:0] ? rob_uop_7_pc : _GEN_110; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_inst = 3'h7 == commit_ptr[2:0] ? rob_uop_7_inst : _GEN_118; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_func_code = 3'h7 == commit_ptr[2:0] ? rob_uop_7_func_code : _GEN_78; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_branch_predict_pack_valid = 3'h7 == commit_ptr[2:0] ?
    rob_uop_7_branch_predict_pack_valid : _GEN_134; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_branch_predict_pack_target = 3'h7 == commit_ptr[2:0] ?
    rob_uop_7_branch_predict_pack_target : _GEN_142; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_branch_predict_pack_branch_type = 3'h7 == commit_ptr[2:0] ?
    rob_uop_7_branch_predict_pack_branch_type : _GEN_150; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_branch_predict_pack_select = 3'h7 == commit_ptr[2:0] ?
    rob_uop_7_branch_predict_pack_select : _GEN_158; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_branch_predict_pack_taken = 3'h7 == commit_ptr[2:0] ?
    rob_uop_7_branch_predict_pack_taken : _GEN_166; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_phy_dst = 3'h7 == commit_ptr[2:0] ? rob_uop_7_phy_dst : _GEN_174; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_stale_dst = 3'h7 == commit_ptr[2:0] ? rob_uop_7_stale_dst : _GEN_182; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_arch_dst = 3'h7 == commit_ptr[2:0] ? rob_uop_7_arch_dst : _GEN_190; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_inst_type = 3'h7 == commit_ptr[2:0] ? rob_uop_7_inst_type : _GEN_198; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_regWen = 3'h7 == commit_ptr[2:0] ? rob_uop_7_regWen : _GEN_206; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_src1_valid = 3'h7 == commit_ptr[2:0] ? rob_uop_7_src1_valid : _GEN_214; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_phy_rs1 = 3'h7 == commit_ptr[2:0] ? rob_uop_7_phy_rs1 : _GEN_222; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_arch_rs1 = 3'h7 == commit_ptr[2:0] ? rob_uop_7_arch_rs1 : _GEN_230; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_src2_valid = 3'h7 == commit_ptr[2:0] ? rob_uop_7_src2_valid : _GEN_238; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_phy_rs2 = 3'h7 == commit_ptr[2:0] ? rob_uop_7_phy_rs2 : _GEN_246; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_arch_rs2 = 3'h7 == commit_ptr[2:0] ? rob_uop_7_arch_rs2 : _GEN_254; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_rob_idx = 3'h7 == commit_ptr[2:0] ? rob_uop_7_rob_idx : _GEN_262; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_imm = 3'h7 == commit_ptr[2:0] ? rob_uop_7_imm : _GEN_270; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_dst_value = _io_o_commit_packs_0_uop_dst_value_T_2 ? io_i_ex_res_packs_0_uop_dst_value
     : _io_o_commit_packs_0_uop_dst_value_T_5; // @[Mux.scala 101:16]
  assign io_o_commit_packs_0_uop_src1_value = 3'h7 == commit_ptr[2:0] ? rob_uop_7_src1_value : _GEN_286; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_src2_value = 3'h7 == commit_ptr[2:0] ? rob_uop_7_src2_value : _GEN_294; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_op1_sel = 3'h7 == commit_ptr[2:0] ? rob_uop_7_op1_sel : _GEN_310; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_op2_sel = 3'h7 == commit_ptr[2:0] ? rob_uop_7_op2_sel : _GEN_318; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_alu_sel = 3'h7 == commit_ptr[2:0] ? rob_uop_7_alu_sel : _GEN_326; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_branch_type = 3'h7 == commit_ptr[2:0] ? rob_uop_7_branch_type : _GEN_334; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_0_uop_mem_type = 3'h7 == commit_ptr[2:0] ? rob_uop_7_mem_type : _GEN_342; // @[rob.scala 113:{32,32}]
  assign io_o_commit_packs_1_valid = next_will_commit_1 & next_will_commit_0 & _next_will_commit_0_T_7; // @[rob.scala 112:82]
  assign io_o_commit_packs_1_uop_valid = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_valid : _GEN_358; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_pc = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_pc : _GEN_366; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_inst = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_inst : _GEN_374; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_func_code = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_func_code : _GEN_46; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_branch_predict_pack_valid = 3'h7 == _next_can_commit_1_T_1[2:0] ?
    rob_uop_7_branch_predict_pack_valid : _GEN_390; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_branch_predict_pack_target = 3'h7 == _next_can_commit_1_T_1[2:0] ?
    rob_uop_7_branch_predict_pack_target : _GEN_398; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_branch_predict_pack_branch_type = 3'h7 == _next_can_commit_1_T_1[2:0] ?
    rob_uop_7_branch_predict_pack_branch_type : _GEN_406; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_branch_predict_pack_select = 3'h7 == _next_can_commit_1_T_1[2:0] ?
    rob_uop_7_branch_predict_pack_select : _GEN_414; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_branch_predict_pack_taken = 3'h7 == _next_can_commit_1_T_1[2:0] ?
    rob_uop_7_branch_predict_pack_taken : _GEN_422; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_phy_dst = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_phy_dst : _GEN_430; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_stale_dst = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_stale_dst : _GEN_438; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_arch_dst = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_arch_dst : _GEN_446; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_inst_type = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_inst_type : _GEN_454; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_regWen = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_regWen : _GEN_462; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_src1_valid = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_src1_valid : _GEN_470; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_phy_rs1 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_phy_rs1 : _GEN_478; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_arch_rs1 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_arch_rs1 : _GEN_486; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_src2_valid = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_src2_valid : _GEN_494; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_phy_rs2 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_phy_rs2 : _GEN_502; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_arch_rs2 = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_arch_rs2 : _GEN_510; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_rob_idx = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_rob_idx : _GEN_518; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_imm = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_imm : _GEN_526; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_dst_value = _io_o_commit_packs_1_uop_dst_value_T_6 ? io_i_ex_res_packs_0_uop_dst_value
     : _io_o_commit_packs_1_uop_dst_value_T_11; // @[Mux.scala 101:16]
  assign io_o_commit_packs_1_uop_src1_value = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_src1_value : _GEN_542; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_src2_value = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_src2_value : _GEN_550; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_op1_sel = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_op1_sel : _GEN_566; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_op2_sel = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_op2_sel : _GEN_574; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_alu_sel = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_alu_sel : _GEN_54; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_branch_type = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_branch_type : _GEN_590; // @[rob.scala 118:{32,32}]
  assign io_o_commit_packs_1_uop_mem_type = 3'h7 == _next_can_commit_1_T_1[2:0] ? rob_uop_7_mem_type : _GEN_598; // @[rob.scala 118:{32,32}]
  assign io_o_rob_head = commit_ptr; // @[rob.scala 82:19]
  assign io_o_exception = 1'h0; // @[rob.scala 233:{47,47}]
  always @(posedge clock) begin
    if (reset) begin // @[rob.scala 48:29]
      commit_ptr <= 4'h0; // @[rob.scala 48:29]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      commit_ptr <= 4'h0; // @[rob.scala 226:20]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (_T_26) begin // @[rob.scala 194:55]
        commit_ptr <= _commit_ptr_T_1; // @[rob.scala 197:20]
      end else begin
        commit_ptr <= _GEN_4950;
      end
    end else if (_next_will_commit_0_T_5) begin // @[rob.scala 138:38]
      commit_ptr <= _GEN_3555;
    end
    if (reset) begin // @[rob.scala 49:31]
      allocate_ptr <= 4'h0; // @[rob.scala 49:31]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      allocate_ptr <= 4'h0; // @[rob.scala 225:22]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        allocate_ptr <= _allocate_ptr_T_5; // @[rob.scala 211:22]
      end else begin
        allocate_ptr <= _GEN_3820;
      end
    end else begin
      allocate_ptr <= _GEN_3820;
    end
    if (reset) begin // @[rob.scala 55:28]
      rob_state <= 2'h1; // @[rob.scala 55:28]
    end else if (io_o_exception | io_i_interrupt | last_pc_redirect) begin // @[rob.scala 246:24]
      rob_state <= 2'h0;
    end else if (_next_rob_state_T_2) begin // @[Mux.scala 101:16]
      rob_state <= 2'h1;
    end else if (_next_rob_state_T_12) begin // @[Mux.scala 101:16]
      rob_state <= 2'h2;
    end else begin
      rob_state <= _next_rob_state_T_35;
    end
    last_pc_redirect <= io_i_csr_pc_redirect; // @[rob.scala 58:22]
    if (reset) begin // @[rob.scala 93:30]
      will_commit_0 <= 1'h0; // @[rob.scala 93:30]
    end else begin
      will_commit_0 <= next_will_commit_0; // @[rob.scala 95:17]
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_0 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_0 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_0 <= _GEN_5265;
      end else begin
        rob_valid_0 <= _GEN_4960;
      end
    end else begin
      rob_valid_0 <= _GEN_4960;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_1 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_1 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_1 <= _GEN_5266;
      end else begin
        rob_valid_1 <= _GEN_4961;
      end
    end else begin
      rob_valid_1 <= _GEN_4961;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_2 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_2 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_2 <= _GEN_5267;
      end else begin
        rob_valid_2 <= _GEN_4962;
      end
    end else begin
      rob_valid_2 <= _GEN_4962;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_3 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_3 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_3 <= _GEN_5268;
      end else begin
        rob_valid_3 <= _GEN_4963;
      end
    end else begin
      rob_valid_3 <= _GEN_4963;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_4 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_4 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_4 <= _GEN_5269;
      end else begin
        rob_valid_4 <= _GEN_4964;
      end
    end else begin
      rob_valid_4 <= _GEN_4964;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_5 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_5 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_5 <= _GEN_5270;
      end else begin
        rob_valid_5 <= _GEN_4965;
      end
    end else begin
      rob_valid_5 <= _GEN_4965;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_6 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_6 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_6 <= _GEN_5271;
      end else begin
        rob_valid_6 <= _GEN_4966;
      end
    end else begin
      rob_valid_6 <= _GEN_4966;
    end
    if (reset) begin // @[rob.scala 85:28]
      rob_valid_7 <= 1'h0; // @[rob.scala 85:28]
    end else if (next_rob_state == 2'h0) begin // @[rob.scala 221:37]
      rob_valid_7 <= 1'h0; // @[rob.scala 223:24]
    end else if (_this_num_to_roll_back_T_1) begin // @[rob.scala 203:40]
      if (_io_o_rollback_packs_0_valid_T_3) begin // @[rob.scala 210:62]
        rob_valid_7 <= _GEN_5272;
      end else begin
        rob_valid_7 <= _GEN_4967;
      end
    end else begin
      rob_valid_7 <= _GEN_4967;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_valid <= _GEN_4110;
        end
      end else begin
        rob_uop_0_valid <= _GEN_4110;
      end
    end else begin
      rob_uop_0_valid <= _GEN_3556;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_pc <= _GEN_4118;
        end
      end else begin
        rob_uop_0_pc <= _GEN_4118;
      end
    end else begin
      rob_uop_0_pc <= _GEN_3564;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_inst <= _GEN_4126;
        end
      end else begin
        rob_uop_0_inst <= _GEN_4126;
      end
    end else begin
      rob_uop_0_inst <= _GEN_3572;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_func_code <= _GEN_4134;
        end
      end else begin
        rob_uop_0_func_code <= _GEN_4134;
      end
    end else begin
      rob_uop_0_func_code <= _GEN_3580;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_branch_predict_pack_valid <= _GEN_4142;
        end
      end else begin
        rob_uop_0_branch_predict_pack_valid <= _GEN_4142;
      end
    end else begin
      rob_uop_0_branch_predict_pack_valid <= _GEN_3588;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_branch_predict_pack_target <= _GEN_4150;
        end
      end else begin
        rob_uop_0_branch_predict_pack_target <= _GEN_4150;
      end
    end else begin
      rob_uop_0_branch_predict_pack_target <= _GEN_3596;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_branch_predict_pack_branch_type <= _GEN_4158;
        end
      end else begin
        rob_uop_0_branch_predict_pack_branch_type <= _GEN_4158;
      end
    end else begin
      rob_uop_0_branch_predict_pack_branch_type <= _GEN_3604;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_branch_predict_pack_select <= _GEN_4166;
        end
      end else begin
        rob_uop_0_branch_predict_pack_select <= _GEN_4166;
      end
    end else begin
      rob_uop_0_branch_predict_pack_select <= _GEN_3612;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_branch_predict_pack_taken <= _GEN_4174;
        end
      end else begin
        rob_uop_0_branch_predict_pack_taken <= _GEN_4174;
      end
    end else begin
      rob_uop_0_branch_predict_pack_taken <= _GEN_3620;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_phy_dst <= _GEN_4182;
        end
      end else begin
        rob_uop_0_phy_dst <= _GEN_4182;
      end
    end else begin
      rob_uop_0_phy_dst <= _GEN_3628;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_stale_dst <= _GEN_4190;
        end
      end else begin
        rob_uop_0_stale_dst <= _GEN_4190;
      end
    end else begin
      rob_uop_0_stale_dst <= _GEN_3636;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_arch_dst <= _GEN_4198;
        end
      end else begin
        rob_uop_0_arch_dst <= _GEN_4198;
      end
    end else begin
      rob_uop_0_arch_dst <= _GEN_3644;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_inst_type <= _GEN_4206;
        end
      end else begin
        rob_uop_0_inst_type <= _GEN_4206;
      end
    end else begin
      rob_uop_0_inst_type <= _GEN_3652;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_regWen <= _GEN_4214;
        end
      end else begin
        rob_uop_0_regWen <= _GEN_4214;
      end
    end else begin
      rob_uop_0_regWen <= _GEN_3660;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_src1_valid <= _GEN_4222;
        end
      end else begin
        rob_uop_0_src1_valid <= _GEN_4222;
      end
    end else begin
      rob_uop_0_src1_valid <= _GEN_3668;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_phy_rs1 <= _GEN_4230;
        end
      end else begin
        rob_uop_0_phy_rs1 <= _GEN_4230;
      end
    end else begin
      rob_uop_0_phy_rs1 <= _GEN_3676;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_arch_rs1 <= _GEN_4238;
        end
      end else begin
        rob_uop_0_arch_rs1 <= _GEN_4238;
      end
    end else begin
      rob_uop_0_arch_rs1 <= _GEN_3684;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_src2_valid <= _GEN_4246;
        end
      end else begin
        rob_uop_0_src2_valid <= _GEN_4246;
      end
    end else begin
      rob_uop_0_src2_valid <= _GEN_3692;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_phy_rs2 <= _GEN_4254;
        end
      end else begin
        rob_uop_0_phy_rs2 <= _GEN_4254;
      end
    end else begin
      rob_uop_0_phy_rs2 <= _GEN_3700;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_arch_rs2 <= _GEN_4262;
        end
      end else begin
        rob_uop_0_arch_rs2 <= _GEN_4262;
      end
    end else begin
      rob_uop_0_arch_rs2 <= _GEN_3708;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_rob_idx <= _GEN_4270;
        end
      end else begin
        rob_uop_0_rob_idx <= _GEN_4270;
      end
    end else begin
      rob_uop_0_rob_idx <= _GEN_3716;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_imm <= _GEN_4278;
        end
      end else begin
        rob_uop_0_imm <= _GEN_4278;
      end
    end else begin
      rob_uop_0_imm <= _GEN_3724;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_dst_value <= _GEN_4286;
        end
      end else begin
        rob_uop_0_dst_value <= _GEN_4286;
      end
    end else begin
      rob_uop_0_dst_value <= _GEN_3732;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_src1_value <= _GEN_4294;
        end
      end else begin
        rob_uop_0_src1_value <= _GEN_4294;
      end
    end else begin
      rob_uop_0_src1_value <= _GEN_3740;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_src2_value <= _GEN_4302;
        end
      end else begin
        rob_uop_0_src2_value <= _GEN_4302;
      end
    end else begin
      rob_uop_0_src2_value <= _GEN_3748;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_op1_sel <= _GEN_4318;
        end
      end else begin
        rob_uop_0_op1_sel <= _GEN_4318;
      end
    end else begin
      rob_uop_0_op1_sel <= _GEN_3764;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_op2_sel <= _GEN_4326;
        end
      end else begin
        rob_uop_0_op2_sel <= _GEN_4326;
      end
    end else begin
      rob_uop_0_op2_sel <= _GEN_3772;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_alu_sel <= _GEN_4334;
        end
      end else begin
        rob_uop_0_alu_sel <= _GEN_4334;
      end
    end else begin
      rob_uop_0_alu_sel <= _GEN_3780;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_branch_type <= _GEN_4342;
        end
      end else begin
        rob_uop_0_branch_type <= _GEN_4342;
      end
    end else begin
      rob_uop_0_branch_type <= _GEN_3788;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_0_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h0 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_0_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_0_mem_type <= _GEN_4350;
        end
      end else begin
        rob_uop_0_mem_type <= _GEN_4350;
      end
    end else begin
      rob_uop_0_mem_type <= _GEN_3796;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_valid <= _GEN_4111;
        end
      end else begin
        rob_uop_1_valid <= _GEN_4111;
      end
    end else begin
      rob_uop_1_valid <= _GEN_3557;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_pc <= _GEN_4119;
        end
      end else begin
        rob_uop_1_pc <= _GEN_4119;
      end
    end else begin
      rob_uop_1_pc <= _GEN_3565;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_inst <= _GEN_4127;
        end
      end else begin
        rob_uop_1_inst <= _GEN_4127;
      end
    end else begin
      rob_uop_1_inst <= _GEN_3573;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_func_code <= _GEN_4135;
        end
      end else begin
        rob_uop_1_func_code <= _GEN_4135;
      end
    end else begin
      rob_uop_1_func_code <= _GEN_3581;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_branch_predict_pack_valid <= _GEN_4143;
        end
      end else begin
        rob_uop_1_branch_predict_pack_valid <= _GEN_4143;
      end
    end else begin
      rob_uop_1_branch_predict_pack_valid <= _GEN_3589;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_branch_predict_pack_target <= _GEN_4151;
        end
      end else begin
        rob_uop_1_branch_predict_pack_target <= _GEN_4151;
      end
    end else begin
      rob_uop_1_branch_predict_pack_target <= _GEN_3597;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_branch_predict_pack_branch_type <= _GEN_4159;
        end
      end else begin
        rob_uop_1_branch_predict_pack_branch_type <= _GEN_4159;
      end
    end else begin
      rob_uop_1_branch_predict_pack_branch_type <= _GEN_3605;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_branch_predict_pack_select <= _GEN_4167;
        end
      end else begin
        rob_uop_1_branch_predict_pack_select <= _GEN_4167;
      end
    end else begin
      rob_uop_1_branch_predict_pack_select <= _GEN_3613;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_branch_predict_pack_taken <= _GEN_4175;
        end
      end else begin
        rob_uop_1_branch_predict_pack_taken <= _GEN_4175;
      end
    end else begin
      rob_uop_1_branch_predict_pack_taken <= _GEN_3621;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_phy_dst <= _GEN_4183;
        end
      end else begin
        rob_uop_1_phy_dst <= _GEN_4183;
      end
    end else begin
      rob_uop_1_phy_dst <= _GEN_3629;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_stale_dst <= _GEN_4191;
        end
      end else begin
        rob_uop_1_stale_dst <= _GEN_4191;
      end
    end else begin
      rob_uop_1_stale_dst <= _GEN_3637;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_arch_dst <= _GEN_4199;
        end
      end else begin
        rob_uop_1_arch_dst <= _GEN_4199;
      end
    end else begin
      rob_uop_1_arch_dst <= _GEN_3645;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_inst_type <= _GEN_4207;
        end
      end else begin
        rob_uop_1_inst_type <= _GEN_4207;
      end
    end else begin
      rob_uop_1_inst_type <= _GEN_3653;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_regWen <= _GEN_4215;
        end
      end else begin
        rob_uop_1_regWen <= _GEN_4215;
      end
    end else begin
      rob_uop_1_regWen <= _GEN_3661;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_src1_valid <= _GEN_4223;
        end
      end else begin
        rob_uop_1_src1_valid <= _GEN_4223;
      end
    end else begin
      rob_uop_1_src1_valid <= _GEN_3669;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_phy_rs1 <= _GEN_4231;
        end
      end else begin
        rob_uop_1_phy_rs1 <= _GEN_4231;
      end
    end else begin
      rob_uop_1_phy_rs1 <= _GEN_3677;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_arch_rs1 <= _GEN_4239;
        end
      end else begin
        rob_uop_1_arch_rs1 <= _GEN_4239;
      end
    end else begin
      rob_uop_1_arch_rs1 <= _GEN_3685;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_src2_valid <= _GEN_4247;
        end
      end else begin
        rob_uop_1_src2_valid <= _GEN_4247;
      end
    end else begin
      rob_uop_1_src2_valid <= _GEN_3693;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_phy_rs2 <= _GEN_4255;
        end
      end else begin
        rob_uop_1_phy_rs2 <= _GEN_4255;
      end
    end else begin
      rob_uop_1_phy_rs2 <= _GEN_3701;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_arch_rs2 <= _GEN_4263;
        end
      end else begin
        rob_uop_1_arch_rs2 <= _GEN_4263;
      end
    end else begin
      rob_uop_1_arch_rs2 <= _GEN_3709;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_rob_idx <= _GEN_4271;
        end
      end else begin
        rob_uop_1_rob_idx <= _GEN_4271;
      end
    end else begin
      rob_uop_1_rob_idx <= _GEN_3717;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_imm <= _GEN_4279;
        end
      end else begin
        rob_uop_1_imm <= _GEN_4279;
      end
    end else begin
      rob_uop_1_imm <= _GEN_3725;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_dst_value <= _GEN_4287;
        end
      end else begin
        rob_uop_1_dst_value <= _GEN_4287;
      end
    end else begin
      rob_uop_1_dst_value <= _GEN_3733;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_src1_value <= _GEN_4295;
        end
      end else begin
        rob_uop_1_src1_value <= _GEN_4295;
      end
    end else begin
      rob_uop_1_src1_value <= _GEN_3741;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_src2_value <= _GEN_4303;
        end
      end else begin
        rob_uop_1_src2_value <= _GEN_4303;
      end
    end else begin
      rob_uop_1_src2_value <= _GEN_3749;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_op1_sel <= _GEN_4319;
        end
      end else begin
        rob_uop_1_op1_sel <= _GEN_4319;
      end
    end else begin
      rob_uop_1_op1_sel <= _GEN_3765;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_op2_sel <= _GEN_4327;
        end
      end else begin
        rob_uop_1_op2_sel <= _GEN_4327;
      end
    end else begin
      rob_uop_1_op2_sel <= _GEN_3773;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_alu_sel <= _GEN_4335;
        end
      end else begin
        rob_uop_1_alu_sel <= _GEN_4335;
      end
    end else begin
      rob_uop_1_alu_sel <= _GEN_3781;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_branch_type <= _GEN_4343;
        end
      end else begin
        rob_uop_1_branch_type <= _GEN_4343;
      end
    end else begin
      rob_uop_1_branch_type <= _GEN_3789;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_1_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h1 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_1_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_1_mem_type <= _GEN_4351;
        end
      end else begin
        rob_uop_1_mem_type <= _GEN_4351;
      end
    end else begin
      rob_uop_1_mem_type <= _GEN_3797;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_valid <= _GEN_4112;
        end
      end else begin
        rob_uop_2_valid <= _GEN_4112;
      end
    end else begin
      rob_uop_2_valid <= _GEN_3558;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_pc <= _GEN_4120;
        end
      end else begin
        rob_uop_2_pc <= _GEN_4120;
      end
    end else begin
      rob_uop_2_pc <= _GEN_3566;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_inst <= _GEN_4128;
        end
      end else begin
        rob_uop_2_inst <= _GEN_4128;
      end
    end else begin
      rob_uop_2_inst <= _GEN_3574;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_func_code <= _GEN_4136;
        end
      end else begin
        rob_uop_2_func_code <= _GEN_4136;
      end
    end else begin
      rob_uop_2_func_code <= _GEN_3582;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_branch_predict_pack_valid <= _GEN_4144;
        end
      end else begin
        rob_uop_2_branch_predict_pack_valid <= _GEN_4144;
      end
    end else begin
      rob_uop_2_branch_predict_pack_valid <= _GEN_3590;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_branch_predict_pack_target <= _GEN_4152;
        end
      end else begin
        rob_uop_2_branch_predict_pack_target <= _GEN_4152;
      end
    end else begin
      rob_uop_2_branch_predict_pack_target <= _GEN_3598;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_branch_predict_pack_branch_type <= _GEN_4160;
        end
      end else begin
        rob_uop_2_branch_predict_pack_branch_type <= _GEN_4160;
      end
    end else begin
      rob_uop_2_branch_predict_pack_branch_type <= _GEN_3606;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_branch_predict_pack_select <= _GEN_4168;
        end
      end else begin
        rob_uop_2_branch_predict_pack_select <= _GEN_4168;
      end
    end else begin
      rob_uop_2_branch_predict_pack_select <= _GEN_3614;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_branch_predict_pack_taken <= _GEN_4176;
        end
      end else begin
        rob_uop_2_branch_predict_pack_taken <= _GEN_4176;
      end
    end else begin
      rob_uop_2_branch_predict_pack_taken <= _GEN_3622;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_phy_dst <= _GEN_4184;
        end
      end else begin
        rob_uop_2_phy_dst <= _GEN_4184;
      end
    end else begin
      rob_uop_2_phy_dst <= _GEN_3630;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_stale_dst <= _GEN_4192;
        end
      end else begin
        rob_uop_2_stale_dst <= _GEN_4192;
      end
    end else begin
      rob_uop_2_stale_dst <= _GEN_3638;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_arch_dst <= _GEN_4200;
        end
      end else begin
        rob_uop_2_arch_dst <= _GEN_4200;
      end
    end else begin
      rob_uop_2_arch_dst <= _GEN_3646;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_inst_type <= _GEN_4208;
        end
      end else begin
        rob_uop_2_inst_type <= _GEN_4208;
      end
    end else begin
      rob_uop_2_inst_type <= _GEN_3654;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_regWen <= _GEN_4216;
        end
      end else begin
        rob_uop_2_regWen <= _GEN_4216;
      end
    end else begin
      rob_uop_2_regWen <= _GEN_3662;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_src1_valid <= _GEN_4224;
        end
      end else begin
        rob_uop_2_src1_valid <= _GEN_4224;
      end
    end else begin
      rob_uop_2_src1_valid <= _GEN_3670;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_phy_rs1 <= _GEN_4232;
        end
      end else begin
        rob_uop_2_phy_rs1 <= _GEN_4232;
      end
    end else begin
      rob_uop_2_phy_rs1 <= _GEN_3678;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_arch_rs1 <= _GEN_4240;
        end
      end else begin
        rob_uop_2_arch_rs1 <= _GEN_4240;
      end
    end else begin
      rob_uop_2_arch_rs1 <= _GEN_3686;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_src2_valid <= _GEN_4248;
        end
      end else begin
        rob_uop_2_src2_valid <= _GEN_4248;
      end
    end else begin
      rob_uop_2_src2_valid <= _GEN_3694;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_phy_rs2 <= _GEN_4256;
        end
      end else begin
        rob_uop_2_phy_rs2 <= _GEN_4256;
      end
    end else begin
      rob_uop_2_phy_rs2 <= _GEN_3702;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_arch_rs2 <= _GEN_4264;
        end
      end else begin
        rob_uop_2_arch_rs2 <= _GEN_4264;
      end
    end else begin
      rob_uop_2_arch_rs2 <= _GEN_3710;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_rob_idx <= _GEN_4272;
        end
      end else begin
        rob_uop_2_rob_idx <= _GEN_4272;
      end
    end else begin
      rob_uop_2_rob_idx <= _GEN_3718;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_imm <= _GEN_4280;
        end
      end else begin
        rob_uop_2_imm <= _GEN_4280;
      end
    end else begin
      rob_uop_2_imm <= _GEN_3726;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_dst_value <= _GEN_4288;
        end
      end else begin
        rob_uop_2_dst_value <= _GEN_4288;
      end
    end else begin
      rob_uop_2_dst_value <= _GEN_3734;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_src1_value <= _GEN_4296;
        end
      end else begin
        rob_uop_2_src1_value <= _GEN_4296;
      end
    end else begin
      rob_uop_2_src1_value <= _GEN_3742;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_src2_value <= _GEN_4304;
        end
      end else begin
        rob_uop_2_src2_value <= _GEN_4304;
      end
    end else begin
      rob_uop_2_src2_value <= _GEN_3750;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_op1_sel <= _GEN_4320;
        end
      end else begin
        rob_uop_2_op1_sel <= _GEN_4320;
      end
    end else begin
      rob_uop_2_op1_sel <= _GEN_3766;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_op2_sel <= _GEN_4328;
        end
      end else begin
        rob_uop_2_op2_sel <= _GEN_4328;
      end
    end else begin
      rob_uop_2_op2_sel <= _GEN_3774;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_alu_sel <= _GEN_4336;
        end
      end else begin
        rob_uop_2_alu_sel <= _GEN_4336;
      end
    end else begin
      rob_uop_2_alu_sel <= _GEN_3782;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_branch_type <= _GEN_4344;
        end
      end else begin
        rob_uop_2_branch_type <= _GEN_4344;
      end
    end else begin
      rob_uop_2_branch_type <= _GEN_3790;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_2_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h2 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_2_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_2_mem_type <= _GEN_4352;
        end
      end else begin
        rob_uop_2_mem_type <= _GEN_4352;
      end
    end else begin
      rob_uop_2_mem_type <= _GEN_3798;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_valid <= _GEN_4113;
        end
      end else begin
        rob_uop_3_valid <= _GEN_4113;
      end
    end else begin
      rob_uop_3_valid <= _GEN_3559;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_pc <= _GEN_4121;
        end
      end else begin
        rob_uop_3_pc <= _GEN_4121;
      end
    end else begin
      rob_uop_3_pc <= _GEN_3567;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_inst <= _GEN_4129;
        end
      end else begin
        rob_uop_3_inst <= _GEN_4129;
      end
    end else begin
      rob_uop_3_inst <= _GEN_3575;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_func_code <= _GEN_4137;
        end
      end else begin
        rob_uop_3_func_code <= _GEN_4137;
      end
    end else begin
      rob_uop_3_func_code <= _GEN_3583;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_branch_predict_pack_valid <= _GEN_4145;
        end
      end else begin
        rob_uop_3_branch_predict_pack_valid <= _GEN_4145;
      end
    end else begin
      rob_uop_3_branch_predict_pack_valid <= _GEN_3591;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_branch_predict_pack_target <= _GEN_4153;
        end
      end else begin
        rob_uop_3_branch_predict_pack_target <= _GEN_4153;
      end
    end else begin
      rob_uop_3_branch_predict_pack_target <= _GEN_3599;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_branch_predict_pack_branch_type <= _GEN_4161;
        end
      end else begin
        rob_uop_3_branch_predict_pack_branch_type <= _GEN_4161;
      end
    end else begin
      rob_uop_3_branch_predict_pack_branch_type <= _GEN_3607;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_branch_predict_pack_select <= _GEN_4169;
        end
      end else begin
        rob_uop_3_branch_predict_pack_select <= _GEN_4169;
      end
    end else begin
      rob_uop_3_branch_predict_pack_select <= _GEN_3615;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_branch_predict_pack_taken <= _GEN_4177;
        end
      end else begin
        rob_uop_3_branch_predict_pack_taken <= _GEN_4177;
      end
    end else begin
      rob_uop_3_branch_predict_pack_taken <= _GEN_3623;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_phy_dst <= _GEN_4185;
        end
      end else begin
        rob_uop_3_phy_dst <= _GEN_4185;
      end
    end else begin
      rob_uop_3_phy_dst <= _GEN_3631;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_stale_dst <= _GEN_4193;
        end
      end else begin
        rob_uop_3_stale_dst <= _GEN_4193;
      end
    end else begin
      rob_uop_3_stale_dst <= _GEN_3639;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_arch_dst <= _GEN_4201;
        end
      end else begin
        rob_uop_3_arch_dst <= _GEN_4201;
      end
    end else begin
      rob_uop_3_arch_dst <= _GEN_3647;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_inst_type <= _GEN_4209;
        end
      end else begin
        rob_uop_3_inst_type <= _GEN_4209;
      end
    end else begin
      rob_uop_3_inst_type <= _GEN_3655;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_regWen <= _GEN_4217;
        end
      end else begin
        rob_uop_3_regWen <= _GEN_4217;
      end
    end else begin
      rob_uop_3_regWen <= _GEN_3663;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_src1_valid <= _GEN_4225;
        end
      end else begin
        rob_uop_3_src1_valid <= _GEN_4225;
      end
    end else begin
      rob_uop_3_src1_valid <= _GEN_3671;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_phy_rs1 <= _GEN_4233;
        end
      end else begin
        rob_uop_3_phy_rs1 <= _GEN_4233;
      end
    end else begin
      rob_uop_3_phy_rs1 <= _GEN_3679;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_arch_rs1 <= _GEN_4241;
        end
      end else begin
        rob_uop_3_arch_rs1 <= _GEN_4241;
      end
    end else begin
      rob_uop_3_arch_rs1 <= _GEN_3687;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_src2_valid <= _GEN_4249;
        end
      end else begin
        rob_uop_3_src2_valid <= _GEN_4249;
      end
    end else begin
      rob_uop_3_src2_valid <= _GEN_3695;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_phy_rs2 <= _GEN_4257;
        end
      end else begin
        rob_uop_3_phy_rs2 <= _GEN_4257;
      end
    end else begin
      rob_uop_3_phy_rs2 <= _GEN_3703;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_arch_rs2 <= _GEN_4265;
        end
      end else begin
        rob_uop_3_arch_rs2 <= _GEN_4265;
      end
    end else begin
      rob_uop_3_arch_rs2 <= _GEN_3711;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_rob_idx <= _GEN_4273;
        end
      end else begin
        rob_uop_3_rob_idx <= _GEN_4273;
      end
    end else begin
      rob_uop_3_rob_idx <= _GEN_3719;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_imm <= _GEN_4281;
        end
      end else begin
        rob_uop_3_imm <= _GEN_4281;
      end
    end else begin
      rob_uop_3_imm <= _GEN_3727;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_dst_value <= _GEN_4289;
        end
      end else begin
        rob_uop_3_dst_value <= _GEN_4289;
      end
    end else begin
      rob_uop_3_dst_value <= _GEN_3735;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_src1_value <= _GEN_4297;
        end
      end else begin
        rob_uop_3_src1_value <= _GEN_4297;
      end
    end else begin
      rob_uop_3_src1_value <= _GEN_3743;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_src2_value <= _GEN_4305;
        end
      end else begin
        rob_uop_3_src2_value <= _GEN_4305;
      end
    end else begin
      rob_uop_3_src2_value <= _GEN_3751;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_op1_sel <= _GEN_4321;
        end
      end else begin
        rob_uop_3_op1_sel <= _GEN_4321;
      end
    end else begin
      rob_uop_3_op1_sel <= _GEN_3767;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_op2_sel <= _GEN_4329;
        end
      end else begin
        rob_uop_3_op2_sel <= _GEN_4329;
      end
    end else begin
      rob_uop_3_op2_sel <= _GEN_3775;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_alu_sel <= _GEN_4337;
        end
      end else begin
        rob_uop_3_alu_sel <= _GEN_4337;
      end
    end else begin
      rob_uop_3_alu_sel <= _GEN_3783;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_branch_type <= _GEN_4345;
        end
      end else begin
        rob_uop_3_branch_type <= _GEN_4345;
      end
    end else begin
      rob_uop_3_branch_type <= _GEN_3791;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_3_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h3 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_3_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_3_mem_type <= _GEN_4353;
        end
      end else begin
        rob_uop_3_mem_type <= _GEN_4353;
      end
    end else begin
      rob_uop_3_mem_type <= _GEN_3799;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_valid <= _GEN_4114;
        end
      end else begin
        rob_uop_4_valid <= _GEN_4114;
      end
    end else begin
      rob_uop_4_valid <= _GEN_3560;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_pc <= _GEN_4122;
        end
      end else begin
        rob_uop_4_pc <= _GEN_4122;
      end
    end else begin
      rob_uop_4_pc <= _GEN_3568;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_inst <= _GEN_4130;
        end
      end else begin
        rob_uop_4_inst <= _GEN_4130;
      end
    end else begin
      rob_uop_4_inst <= _GEN_3576;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_func_code <= _GEN_4138;
        end
      end else begin
        rob_uop_4_func_code <= _GEN_4138;
      end
    end else begin
      rob_uop_4_func_code <= _GEN_3584;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_branch_predict_pack_valid <= _GEN_4146;
        end
      end else begin
        rob_uop_4_branch_predict_pack_valid <= _GEN_4146;
      end
    end else begin
      rob_uop_4_branch_predict_pack_valid <= _GEN_3592;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_branch_predict_pack_target <= _GEN_4154;
        end
      end else begin
        rob_uop_4_branch_predict_pack_target <= _GEN_4154;
      end
    end else begin
      rob_uop_4_branch_predict_pack_target <= _GEN_3600;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_branch_predict_pack_branch_type <= _GEN_4162;
        end
      end else begin
        rob_uop_4_branch_predict_pack_branch_type <= _GEN_4162;
      end
    end else begin
      rob_uop_4_branch_predict_pack_branch_type <= _GEN_3608;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_branch_predict_pack_select <= _GEN_4170;
        end
      end else begin
        rob_uop_4_branch_predict_pack_select <= _GEN_4170;
      end
    end else begin
      rob_uop_4_branch_predict_pack_select <= _GEN_3616;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_branch_predict_pack_taken <= _GEN_4178;
        end
      end else begin
        rob_uop_4_branch_predict_pack_taken <= _GEN_4178;
      end
    end else begin
      rob_uop_4_branch_predict_pack_taken <= _GEN_3624;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_phy_dst <= _GEN_4186;
        end
      end else begin
        rob_uop_4_phy_dst <= _GEN_4186;
      end
    end else begin
      rob_uop_4_phy_dst <= _GEN_3632;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_stale_dst <= _GEN_4194;
        end
      end else begin
        rob_uop_4_stale_dst <= _GEN_4194;
      end
    end else begin
      rob_uop_4_stale_dst <= _GEN_3640;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_arch_dst <= _GEN_4202;
        end
      end else begin
        rob_uop_4_arch_dst <= _GEN_4202;
      end
    end else begin
      rob_uop_4_arch_dst <= _GEN_3648;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_inst_type <= _GEN_4210;
        end
      end else begin
        rob_uop_4_inst_type <= _GEN_4210;
      end
    end else begin
      rob_uop_4_inst_type <= _GEN_3656;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_regWen <= _GEN_4218;
        end
      end else begin
        rob_uop_4_regWen <= _GEN_4218;
      end
    end else begin
      rob_uop_4_regWen <= _GEN_3664;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_src1_valid <= _GEN_4226;
        end
      end else begin
        rob_uop_4_src1_valid <= _GEN_4226;
      end
    end else begin
      rob_uop_4_src1_valid <= _GEN_3672;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_phy_rs1 <= _GEN_4234;
        end
      end else begin
        rob_uop_4_phy_rs1 <= _GEN_4234;
      end
    end else begin
      rob_uop_4_phy_rs1 <= _GEN_3680;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_arch_rs1 <= _GEN_4242;
        end
      end else begin
        rob_uop_4_arch_rs1 <= _GEN_4242;
      end
    end else begin
      rob_uop_4_arch_rs1 <= _GEN_3688;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_src2_valid <= _GEN_4250;
        end
      end else begin
        rob_uop_4_src2_valid <= _GEN_4250;
      end
    end else begin
      rob_uop_4_src2_valid <= _GEN_3696;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_phy_rs2 <= _GEN_4258;
        end
      end else begin
        rob_uop_4_phy_rs2 <= _GEN_4258;
      end
    end else begin
      rob_uop_4_phy_rs2 <= _GEN_3704;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_arch_rs2 <= _GEN_4266;
        end
      end else begin
        rob_uop_4_arch_rs2 <= _GEN_4266;
      end
    end else begin
      rob_uop_4_arch_rs2 <= _GEN_3712;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_rob_idx <= _GEN_4274;
        end
      end else begin
        rob_uop_4_rob_idx <= _GEN_4274;
      end
    end else begin
      rob_uop_4_rob_idx <= _GEN_3720;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_imm <= _GEN_4282;
        end
      end else begin
        rob_uop_4_imm <= _GEN_4282;
      end
    end else begin
      rob_uop_4_imm <= _GEN_3728;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_dst_value <= _GEN_4290;
        end
      end else begin
        rob_uop_4_dst_value <= _GEN_4290;
      end
    end else begin
      rob_uop_4_dst_value <= _GEN_3736;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_src1_value <= _GEN_4298;
        end
      end else begin
        rob_uop_4_src1_value <= _GEN_4298;
      end
    end else begin
      rob_uop_4_src1_value <= _GEN_3744;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_src2_value <= _GEN_4306;
        end
      end else begin
        rob_uop_4_src2_value <= _GEN_4306;
      end
    end else begin
      rob_uop_4_src2_value <= _GEN_3752;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_op1_sel <= _GEN_4322;
        end
      end else begin
        rob_uop_4_op1_sel <= _GEN_4322;
      end
    end else begin
      rob_uop_4_op1_sel <= _GEN_3768;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_op2_sel <= _GEN_4330;
        end
      end else begin
        rob_uop_4_op2_sel <= _GEN_4330;
      end
    end else begin
      rob_uop_4_op2_sel <= _GEN_3776;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_alu_sel <= _GEN_4338;
        end
      end else begin
        rob_uop_4_alu_sel <= _GEN_4338;
      end
    end else begin
      rob_uop_4_alu_sel <= _GEN_3784;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_branch_type <= _GEN_4346;
        end
      end else begin
        rob_uop_4_branch_type <= _GEN_4346;
      end
    end else begin
      rob_uop_4_branch_type <= _GEN_3792;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_4_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h4 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_4_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_4_mem_type <= _GEN_4354;
        end
      end else begin
        rob_uop_4_mem_type <= _GEN_4354;
      end
    end else begin
      rob_uop_4_mem_type <= _GEN_3800;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_valid <= _GEN_4115;
        end
      end else begin
        rob_uop_5_valid <= _GEN_4115;
      end
    end else begin
      rob_uop_5_valid <= _GEN_3561;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_pc <= _GEN_4123;
        end
      end else begin
        rob_uop_5_pc <= _GEN_4123;
      end
    end else begin
      rob_uop_5_pc <= _GEN_3569;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_inst <= _GEN_4131;
        end
      end else begin
        rob_uop_5_inst <= _GEN_4131;
      end
    end else begin
      rob_uop_5_inst <= _GEN_3577;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_func_code <= _GEN_4139;
        end
      end else begin
        rob_uop_5_func_code <= _GEN_4139;
      end
    end else begin
      rob_uop_5_func_code <= _GEN_3585;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_branch_predict_pack_valid <= _GEN_4147;
        end
      end else begin
        rob_uop_5_branch_predict_pack_valid <= _GEN_4147;
      end
    end else begin
      rob_uop_5_branch_predict_pack_valid <= _GEN_3593;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_branch_predict_pack_target <= _GEN_4155;
        end
      end else begin
        rob_uop_5_branch_predict_pack_target <= _GEN_4155;
      end
    end else begin
      rob_uop_5_branch_predict_pack_target <= _GEN_3601;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_branch_predict_pack_branch_type <= _GEN_4163;
        end
      end else begin
        rob_uop_5_branch_predict_pack_branch_type <= _GEN_4163;
      end
    end else begin
      rob_uop_5_branch_predict_pack_branch_type <= _GEN_3609;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_branch_predict_pack_select <= _GEN_4171;
        end
      end else begin
        rob_uop_5_branch_predict_pack_select <= _GEN_4171;
      end
    end else begin
      rob_uop_5_branch_predict_pack_select <= _GEN_3617;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_branch_predict_pack_taken <= _GEN_4179;
        end
      end else begin
        rob_uop_5_branch_predict_pack_taken <= _GEN_4179;
      end
    end else begin
      rob_uop_5_branch_predict_pack_taken <= _GEN_3625;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_phy_dst <= _GEN_4187;
        end
      end else begin
        rob_uop_5_phy_dst <= _GEN_4187;
      end
    end else begin
      rob_uop_5_phy_dst <= _GEN_3633;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_stale_dst <= _GEN_4195;
        end
      end else begin
        rob_uop_5_stale_dst <= _GEN_4195;
      end
    end else begin
      rob_uop_5_stale_dst <= _GEN_3641;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_arch_dst <= _GEN_4203;
        end
      end else begin
        rob_uop_5_arch_dst <= _GEN_4203;
      end
    end else begin
      rob_uop_5_arch_dst <= _GEN_3649;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_inst_type <= _GEN_4211;
        end
      end else begin
        rob_uop_5_inst_type <= _GEN_4211;
      end
    end else begin
      rob_uop_5_inst_type <= _GEN_3657;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_regWen <= _GEN_4219;
        end
      end else begin
        rob_uop_5_regWen <= _GEN_4219;
      end
    end else begin
      rob_uop_5_regWen <= _GEN_3665;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_src1_valid <= _GEN_4227;
        end
      end else begin
        rob_uop_5_src1_valid <= _GEN_4227;
      end
    end else begin
      rob_uop_5_src1_valid <= _GEN_3673;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_phy_rs1 <= _GEN_4235;
        end
      end else begin
        rob_uop_5_phy_rs1 <= _GEN_4235;
      end
    end else begin
      rob_uop_5_phy_rs1 <= _GEN_3681;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_arch_rs1 <= _GEN_4243;
        end
      end else begin
        rob_uop_5_arch_rs1 <= _GEN_4243;
      end
    end else begin
      rob_uop_5_arch_rs1 <= _GEN_3689;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_src2_valid <= _GEN_4251;
        end
      end else begin
        rob_uop_5_src2_valid <= _GEN_4251;
      end
    end else begin
      rob_uop_5_src2_valid <= _GEN_3697;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_phy_rs2 <= _GEN_4259;
        end
      end else begin
        rob_uop_5_phy_rs2 <= _GEN_4259;
      end
    end else begin
      rob_uop_5_phy_rs2 <= _GEN_3705;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_arch_rs2 <= _GEN_4267;
        end
      end else begin
        rob_uop_5_arch_rs2 <= _GEN_4267;
      end
    end else begin
      rob_uop_5_arch_rs2 <= _GEN_3713;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_rob_idx <= _GEN_4275;
        end
      end else begin
        rob_uop_5_rob_idx <= _GEN_4275;
      end
    end else begin
      rob_uop_5_rob_idx <= _GEN_3721;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_imm <= _GEN_4283;
        end
      end else begin
        rob_uop_5_imm <= _GEN_4283;
      end
    end else begin
      rob_uop_5_imm <= _GEN_3729;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_dst_value <= _GEN_4291;
        end
      end else begin
        rob_uop_5_dst_value <= _GEN_4291;
      end
    end else begin
      rob_uop_5_dst_value <= _GEN_3737;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_src1_value <= _GEN_4299;
        end
      end else begin
        rob_uop_5_src1_value <= _GEN_4299;
      end
    end else begin
      rob_uop_5_src1_value <= _GEN_3745;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_src2_value <= _GEN_4307;
        end
      end else begin
        rob_uop_5_src2_value <= _GEN_4307;
      end
    end else begin
      rob_uop_5_src2_value <= _GEN_3753;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_op1_sel <= _GEN_4323;
        end
      end else begin
        rob_uop_5_op1_sel <= _GEN_4323;
      end
    end else begin
      rob_uop_5_op1_sel <= _GEN_3769;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_op2_sel <= _GEN_4331;
        end
      end else begin
        rob_uop_5_op2_sel <= _GEN_4331;
      end
    end else begin
      rob_uop_5_op2_sel <= _GEN_3777;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_alu_sel <= _GEN_4339;
        end
      end else begin
        rob_uop_5_alu_sel <= _GEN_4339;
      end
    end else begin
      rob_uop_5_alu_sel <= _GEN_3785;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_branch_type <= _GEN_4347;
        end
      end else begin
        rob_uop_5_branch_type <= _GEN_4347;
      end
    end else begin
      rob_uop_5_branch_type <= _GEN_3793;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_5_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h5 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_5_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_5_mem_type <= _GEN_4355;
        end
      end else begin
        rob_uop_5_mem_type <= _GEN_4355;
      end
    end else begin
      rob_uop_5_mem_type <= _GEN_3801;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_valid <= _GEN_4116;
        end
      end else begin
        rob_uop_6_valid <= _GEN_4116;
      end
    end else begin
      rob_uop_6_valid <= _GEN_3562;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_pc <= _GEN_4124;
        end
      end else begin
        rob_uop_6_pc <= _GEN_4124;
      end
    end else begin
      rob_uop_6_pc <= _GEN_3570;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_inst <= _GEN_4132;
        end
      end else begin
        rob_uop_6_inst <= _GEN_4132;
      end
    end else begin
      rob_uop_6_inst <= _GEN_3578;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_func_code <= _GEN_4140;
        end
      end else begin
        rob_uop_6_func_code <= _GEN_4140;
      end
    end else begin
      rob_uop_6_func_code <= _GEN_3586;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_branch_predict_pack_valid <= _GEN_4148;
        end
      end else begin
        rob_uop_6_branch_predict_pack_valid <= _GEN_4148;
      end
    end else begin
      rob_uop_6_branch_predict_pack_valid <= _GEN_3594;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_branch_predict_pack_target <= _GEN_4156;
        end
      end else begin
        rob_uop_6_branch_predict_pack_target <= _GEN_4156;
      end
    end else begin
      rob_uop_6_branch_predict_pack_target <= _GEN_3602;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_branch_predict_pack_branch_type <= _GEN_4164;
        end
      end else begin
        rob_uop_6_branch_predict_pack_branch_type <= _GEN_4164;
      end
    end else begin
      rob_uop_6_branch_predict_pack_branch_type <= _GEN_3610;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_branch_predict_pack_select <= _GEN_4172;
        end
      end else begin
        rob_uop_6_branch_predict_pack_select <= _GEN_4172;
      end
    end else begin
      rob_uop_6_branch_predict_pack_select <= _GEN_3618;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_branch_predict_pack_taken <= _GEN_4180;
        end
      end else begin
        rob_uop_6_branch_predict_pack_taken <= _GEN_4180;
      end
    end else begin
      rob_uop_6_branch_predict_pack_taken <= _GEN_3626;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_phy_dst <= _GEN_4188;
        end
      end else begin
        rob_uop_6_phy_dst <= _GEN_4188;
      end
    end else begin
      rob_uop_6_phy_dst <= _GEN_3634;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_stale_dst <= _GEN_4196;
        end
      end else begin
        rob_uop_6_stale_dst <= _GEN_4196;
      end
    end else begin
      rob_uop_6_stale_dst <= _GEN_3642;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_arch_dst <= _GEN_4204;
        end
      end else begin
        rob_uop_6_arch_dst <= _GEN_4204;
      end
    end else begin
      rob_uop_6_arch_dst <= _GEN_3650;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_inst_type <= _GEN_4212;
        end
      end else begin
        rob_uop_6_inst_type <= _GEN_4212;
      end
    end else begin
      rob_uop_6_inst_type <= _GEN_3658;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_regWen <= _GEN_4220;
        end
      end else begin
        rob_uop_6_regWen <= _GEN_4220;
      end
    end else begin
      rob_uop_6_regWen <= _GEN_3666;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_src1_valid <= _GEN_4228;
        end
      end else begin
        rob_uop_6_src1_valid <= _GEN_4228;
      end
    end else begin
      rob_uop_6_src1_valid <= _GEN_3674;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_phy_rs1 <= _GEN_4236;
        end
      end else begin
        rob_uop_6_phy_rs1 <= _GEN_4236;
      end
    end else begin
      rob_uop_6_phy_rs1 <= _GEN_3682;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_arch_rs1 <= _GEN_4244;
        end
      end else begin
        rob_uop_6_arch_rs1 <= _GEN_4244;
      end
    end else begin
      rob_uop_6_arch_rs1 <= _GEN_3690;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_src2_valid <= _GEN_4252;
        end
      end else begin
        rob_uop_6_src2_valid <= _GEN_4252;
      end
    end else begin
      rob_uop_6_src2_valid <= _GEN_3698;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_phy_rs2 <= _GEN_4260;
        end
      end else begin
        rob_uop_6_phy_rs2 <= _GEN_4260;
      end
    end else begin
      rob_uop_6_phy_rs2 <= _GEN_3706;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_arch_rs2 <= _GEN_4268;
        end
      end else begin
        rob_uop_6_arch_rs2 <= _GEN_4268;
      end
    end else begin
      rob_uop_6_arch_rs2 <= _GEN_3714;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_rob_idx <= _GEN_4276;
        end
      end else begin
        rob_uop_6_rob_idx <= _GEN_4276;
      end
    end else begin
      rob_uop_6_rob_idx <= _GEN_3722;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_imm <= _GEN_4284;
        end
      end else begin
        rob_uop_6_imm <= _GEN_4284;
      end
    end else begin
      rob_uop_6_imm <= _GEN_3730;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_dst_value <= _GEN_4292;
        end
      end else begin
        rob_uop_6_dst_value <= _GEN_4292;
      end
    end else begin
      rob_uop_6_dst_value <= _GEN_3738;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_src1_value <= _GEN_4300;
        end
      end else begin
        rob_uop_6_src1_value <= _GEN_4300;
      end
    end else begin
      rob_uop_6_src1_value <= _GEN_3746;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_src2_value <= _GEN_4308;
        end
      end else begin
        rob_uop_6_src2_value <= _GEN_4308;
      end
    end else begin
      rob_uop_6_src2_value <= _GEN_3754;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_op1_sel <= _GEN_4324;
        end
      end else begin
        rob_uop_6_op1_sel <= _GEN_4324;
      end
    end else begin
      rob_uop_6_op1_sel <= _GEN_3770;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_op2_sel <= _GEN_4332;
        end
      end else begin
        rob_uop_6_op2_sel <= _GEN_4332;
      end
    end else begin
      rob_uop_6_op2_sel <= _GEN_3778;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_alu_sel <= _GEN_4340;
        end
      end else begin
        rob_uop_6_alu_sel <= _GEN_4340;
      end
    end else begin
      rob_uop_6_alu_sel <= _GEN_3786;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_branch_type <= _GEN_4348;
        end
      end else begin
        rob_uop_6_branch_type <= _GEN_4348;
      end
    end else begin
      rob_uop_6_branch_type <= _GEN_3794;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_6_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h6 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_6_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_6_mem_type <= _GEN_4356;
        end
      end else begin
        rob_uop_6_mem_type <= _GEN_4356;
      end
    end else begin
      rob_uop_6_mem_type <= _GEN_3802;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_valid <= io_i_ex_res_packs_1_uop_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_valid <= _GEN_4117;
        end
      end else begin
        rob_uop_7_valid <= _GEN_4117;
      end
    end else begin
      rob_uop_7_valid <= _GEN_3563;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_pc <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_pc <= io_i_ex_res_packs_1_uop_pc; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_pc <= _GEN_4125;
        end
      end else begin
        rob_uop_7_pc <= _GEN_4125;
      end
    end else begin
      rob_uop_7_pc <= _GEN_3571;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_inst <= 32'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_inst <= io_i_ex_res_packs_1_uop_inst; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_inst <= _GEN_4133;
        end
      end else begin
        rob_uop_7_inst <= _GEN_4133;
      end
    end else begin
      rob_uop_7_inst <= _GEN_3579;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_func_code <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_func_code <= io_i_ex_res_packs_1_uop_func_code; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_func_code <= _GEN_4141;
        end
      end else begin
        rob_uop_7_func_code <= _GEN_4141;
      end
    end else begin
      rob_uop_7_func_code <= _GEN_3587;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_branch_predict_pack_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_branch_predict_pack_valid <= io_i_ex_res_packs_1_uop_branch_predict_pack_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_branch_predict_pack_valid <= _GEN_4149;
        end
      end else begin
        rob_uop_7_branch_predict_pack_valid <= _GEN_4149;
      end
    end else begin
      rob_uop_7_branch_predict_pack_valid <= _GEN_3595;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_branch_predict_pack_target <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_branch_predict_pack_target <= io_i_ex_res_packs_1_uop_branch_predict_pack_target; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_branch_predict_pack_target <= _GEN_4157;
        end
      end else begin
        rob_uop_7_branch_predict_pack_target <= _GEN_4157;
      end
    end else begin
      rob_uop_7_branch_predict_pack_target <= _GEN_3603;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_branch_predict_pack_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_branch_predict_pack_branch_type <= io_i_ex_res_packs_1_uop_branch_predict_pack_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_branch_predict_pack_branch_type <= _GEN_4165;
        end
      end else begin
        rob_uop_7_branch_predict_pack_branch_type <= _GEN_4165;
      end
    end else begin
      rob_uop_7_branch_predict_pack_branch_type <= _GEN_3611;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_branch_predict_pack_select <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_branch_predict_pack_select <= io_i_ex_res_packs_1_uop_branch_predict_pack_select; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_branch_predict_pack_select <= _GEN_4173;
        end
      end else begin
        rob_uop_7_branch_predict_pack_select <= _GEN_4173;
      end
    end else begin
      rob_uop_7_branch_predict_pack_select <= _GEN_3619;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_branch_predict_pack_taken <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_branch_predict_pack_taken <= io_i_ex_res_packs_1_uop_branch_predict_pack_taken; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_branch_predict_pack_taken <= _GEN_4181;
        end
      end else begin
        rob_uop_7_branch_predict_pack_taken <= _GEN_4181;
      end
    end else begin
      rob_uop_7_branch_predict_pack_taken <= _GEN_3627;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_phy_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_phy_dst <= io_i_ex_res_packs_1_uop_phy_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_phy_dst <= _GEN_4189;
        end
      end else begin
        rob_uop_7_phy_dst <= _GEN_4189;
      end
    end else begin
      rob_uop_7_phy_dst <= _GEN_3635;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_stale_dst <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_stale_dst <= io_i_ex_res_packs_1_uop_stale_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_stale_dst <= _GEN_4197;
        end
      end else begin
        rob_uop_7_stale_dst <= _GEN_4197;
      end
    end else begin
      rob_uop_7_stale_dst <= _GEN_3643;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_arch_dst <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_arch_dst <= io_i_ex_res_packs_1_uop_arch_dst; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_arch_dst <= _GEN_4205;
        end
      end else begin
        rob_uop_7_arch_dst <= _GEN_4205;
      end
    end else begin
      rob_uop_7_arch_dst <= _GEN_3651;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_inst_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_inst_type <= io_i_ex_res_packs_1_uop_inst_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_inst_type <= _GEN_4213;
        end
      end else begin
        rob_uop_7_inst_type <= _GEN_4213;
      end
    end else begin
      rob_uop_7_inst_type <= _GEN_3659;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_regWen <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_regWen <= io_i_ex_res_packs_1_uop_regWen; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_regWen <= _GEN_4221;
        end
      end else begin
        rob_uop_7_regWen <= _GEN_4221;
      end
    end else begin
      rob_uop_7_regWen <= _GEN_3667;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_src1_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_src1_valid <= io_i_ex_res_packs_1_uop_src1_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_src1_valid <= _GEN_4229;
        end
      end else begin
        rob_uop_7_src1_valid <= _GEN_4229;
      end
    end else begin
      rob_uop_7_src1_valid <= _GEN_3675;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_phy_rs1 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_phy_rs1 <= io_i_ex_res_packs_1_uop_phy_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_phy_rs1 <= _GEN_4237;
        end
      end else begin
        rob_uop_7_phy_rs1 <= _GEN_4237;
      end
    end else begin
      rob_uop_7_phy_rs1 <= _GEN_3683;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_arch_rs1 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_arch_rs1 <= io_i_ex_res_packs_1_uop_arch_rs1; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_arch_rs1 <= _GEN_4245;
        end
      end else begin
        rob_uop_7_arch_rs1 <= _GEN_4245;
      end
    end else begin
      rob_uop_7_arch_rs1 <= _GEN_3691;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_src2_valid <= 1'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_src2_valid <= io_i_ex_res_packs_1_uop_src2_valid; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_src2_valid <= _GEN_4253;
        end
      end else begin
        rob_uop_7_src2_valid <= _GEN_4253;
      end
    end else begin
      rob_uop_7_src2_valid <= _GEN_3699;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_phy_rs2 <= 7'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_phy_rs2 <= io_i_ex_res_packs_1_uop_phy_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_phy_rs2 <= _GEN_4261;
        end
      end else begin
        rob_uop_7_phy_rs2 <= _GEN_4261;
      end
    end else begin
      rob_uop_7_phy_rs2 <= _GEN_3707;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_arch_rs2 <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_arch_rs2 <= io_i_ex_res_packs_1_uop_arch_rs2; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_arch_rs2 <= _GEN_4269;
        end
      end else begin
        rob_uop_7_arch_rs2 <= _GEN_4269;
      end
    end else begin
      rob_uop_7_arch_rs2 <= _GEN_3715;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_rob_idx <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_rob_idx <= io_i_ex_res_packs_1_uop_rob_idx; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_rob_idx <= _GEN_4277;
        end
      end else begin
        rob_uop_7_rob_idx <= _GEN_4277;
      end
    end else begin
      rob_uop_7_rob_idx <= _GEN_3723;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_imm <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_imm <= io_i_ex_res_packs_1_uop_imm; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_imm <= _GEN_4285;
        end
      end else begin
        rob_uop_7_imm <= _GEN_4285;
      end
    end else begin
      rob_uop_7_imm <= _GEN_3731;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_dst_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_dst_value <= io_i_ex_res_packs_1_uop_dst_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_dst_value <= _GEN_4293;
        end
      end else begin
        rob_uop_7_dst_value <= _GEN_4293;
      end
    end else begin
      rob_uop_7_dst_value <= _GEN_3739;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_src1_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_src1_value <= io_i_ex_res_packs_1_uop_src1_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_src1_value <= _GEN_4301;
        end
      end else begin
        rob_uop_7_src1_value <= _GEN_4301;
      end
    end else begin
      rob_uop_7_src1_value <= _GEN_3747;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_src2_value <= 64'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_src2_value <= io_i_ex_res_packs_1_uop_src2_value; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_src2_value <= _GEN_4309;
        end
      end else begin
        rob_uop_7_src2_value <= _GEN_4309;
      end
    end else begin
      rob_uop_7_src2_value <= _GEN_3755;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_op1_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_op1_sel <= io_i_ex_res_packs_1_uop_op1_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_op1_sel <= _GEN_4325;
        end
      end else begin
        rob_uop_7_op1_sel <= _GEN_4325;
      end
    end else begin
      rob_uop_7_op1_sel <= _GEN_3771;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_op2_sel <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_op2_sel <= io_i_ex_res_packs_1_uop_op2_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_op2_sel <= _GEN_4333;
        end
      end else begin
        rob_uop_7_op2_sel <= _GEN_4333;
      end
    end else begin
      rob_uop_7_op2_sel <= _GEN_3779;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_alu_sel <= 5'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_alu_sel <= io_i_ex_res_packs_1_uop_alu_sel; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_alu_sel <= _GEN_4341;
        end
      end else begin
        rob_uop_7_alu_sel <= _GEN_4341;
      end
    end else begin
      rob_uop_7_alu_sel <= _GEN_3787;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_branch_type <= 4'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_branch_type <= io_i_ex_res_packs_1_uop_branch_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_branch_type <= _GEN_4349;
        end
      end else begin
        rob_uop_7_branch_type <= _GEN_4349;
      end
    end else begin
      rob_uop_7_branch_type <= _GEN_3795;
    end
    if (reset) begin // @[rob.scala 86:26]
      rob_uop_7_mem_type <= 3'h0; // @[rob.scala 86:26]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        if (3'h7 == io_i_ex_res_packs_1_uop_rob_idx[2:0]) begin // @[rob.scala 189:70]
          rob_uop_7_mem_type <= io_i_ex_res_packs_1_uop_mem_type; // @[rob.scala 189:70]
        end else begin
          rob_uop_7_mem_type <= _GEN_4357;
        end
      end else begin
        rob_uop_7_mem_type <= _GEN_4357;
      end
    end else begin
      rob_uop_7_mem_type <= _GEN_3803;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_0 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_0 <= _GEN_4638;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_0 <= _GEN_4094;
      end else begin
        rob_done_0 <= _GEN_3812;
      end
    end else begin
      rob_done_0 <= _GEN_3812;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_1 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_1 <= _GEN_4639;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_1 <= _GEN_4095;
      end else begin
        rob_done_1 <= _GEN_3813;
      end
    end else begin
      rob_done_1 <= _GEN_3813;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_2 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_2 <= _GEN_4640;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_2 <= _GEN_4096;
      end else begin
        rob_done_2 <= _GEN_3814;
      end
    end else begin
      rob_done_2 <= _GEN_3814;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_3 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_3 <= _GEN_4641;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_3 <= _GEN_4097;
      end else begin
        rob_done_3 <= _GEN_3815;
      end
    end else begin
      rob_done_3 <= _GEN_3815;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_4 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_4 <= _GEN_4642;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_4 <= _GEN_4098;
      end else begin
        rob_done_4 <= _GEN_3816;
      end
    end else begin
      rob_done_4 <= _GEN_3816;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_5 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_5 <= _GEN_4643;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_5 <= _GEN_4099;
      end else begin
        rob_done_5 <= _GEN_3817;
      end
    end else begin
      rob_done_5 <= _GEN_3817;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_6 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_6 <= _GEN_4644;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_6 <= _GEN_4100;
      end else begin
        rob_done_6 <= _GEN_3818;
      end
    end else begin
      rob_done_6 <= _GEN_3818;
    end
    if (reset) begin // @[rob.scala 88:27]
      rob_done_7 <= 1'h0; // @[rob.scala 88:27]
    end else if (_next_will_commit_0_T_6) begin // @[rob.scala 179:36]
      if (io_i_ex_res_packs_1_valid) begin // @[rob.scala 187:39]
        rob_done_7 <= _GEN_4645;
      end else if (io_i_ex_res_packs_0_valid) begin // @[rob.scala 181:39]
        rob_done_7 <= _GEN_4101;
      end else begin
        rob_done_7 <= _GEN_3819;
      end
    end else begin
      rob_done_7 <= _GEN_3819;
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
  commit_ptr = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  allocate_ptr = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  rob_state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  last_pc_redirect = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  will_commit_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rob_valid_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  rob_valid_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  rob_valid_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rob_valid_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  rob_valid_4 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  rob_valid_5 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  rob_valid_6 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  rob_valid_7 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  rob_uop_0_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  rob_uop_0_pc = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  rob_uop_0_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  rob_uop_0_func_code = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  rob_uop_0_branch_predict_pack_valid = _RAND_17[0:0];
  _RAND_18 = {2{`RANDOM}};
  rob_uop_0_branch_predict_pack_target = _RAND_18[63:0];
  _RAND_19 = {1{`RANDOM}};
  rob_uop_0_branch_predict_pack_branch_type = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  rob_uop_0_branch_predict_pack_select = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  rob_uop_0_branch_predict_pack_taken = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  rob_uop_0_phy_dst = _RAND_22[6:0];
  _RAND_23 = {1{`RANDOM}};
  rob_uop_0_stale_dst = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  rob_uop_0_arch_dst = _RAND_24[4:0];
  _RAND_25 = {1{`RANDOM}};
  rob_uop_0_inst_type = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  rob_uop_0_regWen = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  rob_uop_0_src1_valid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  rob_uop_0_phy_rs1 = _RAND_28[6:0];
  _RAND_29 = {1{`RANDOM}};
  rob_uop_0_arch_rs1 = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  rob_uop_0_src2_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  rob_uop_0_phy_rs2 = _RAND_31[6:0];
  _RAND_32 = {1{`RANDOM}};
  rob_uop_0_arch_rs2 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  rob_uop_0_rob_idx = _RAND_33[3:0];
  _RAND_34 = {2{`RANDOM}};
  rob_uop_0_imm = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  rob_uop_0_dst_value = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  rob_uop_0_src1_value = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  rob_uop_0_src2_value = _RAND_37[63:0];
  _RAND_38 = {1{`RANDOM}};
  rob_uop_0_op1_sel = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  rob_uop_0_op2_sel = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  rob_uop_0_alu_sel = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  rob_uop_0_branch_type = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  rob_uop_0_mem_type = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  rob_uop_1_valid = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  rob_uop_1_pc = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  rob_uop_1_inst = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  rob_uop_1_func_code = _RAND_46[6:0];
  _RAND_47 = {1{`RANDOM}};
  rob_uop_1_branch_predict_pack_valid = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  rob_uop_1_branch_predict_pack_target = _RAND_48[63:0];
  _RAND_49 = {1{`RANDOM}};
  rob_uop_1_branch_predict_pack_branch_type = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  rob_uop_1_branch_predict_pack_select = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  rob_uop_1_branch_predict_pack_taken = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  rob_uop_1_phy_dst = _RAND_52[6:0];
  _RAND_53 = {1{`RANDOM}};
  rob_uop_1_stale_dst = _RAND_53[6:0];
  _RAND_54 = {1{`RANDOM}};
  rob_uop_1_arch_dst = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  rob_uop_1_inst_type = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  rob_uop_1_regWen = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  rob_uop_1_src1_valid = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  rob_uop_1_phy_rs1 = _RAND_58[6:0];
  _RAND_59 = {1{`RANDOM}};
  rob_uop_1_arch_rs1 = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  rob_uop_1_src2_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  rob_uop_1_phy_rs2 = _RAND_61[6:0];
  _RAND_62 = {1{`RANDOM}};
  rob_uop_1_arch_rs2 = _RAND_62[4:0];
  _RAND_63 = {1{`RANDOM}};
  rob_uop_1_rob_idx = _RAND_63[3:0];
  _RAND_64 = {2{`RANDOM}};
  rob_uop_1_imm = _RAND_64[63:0];
  _RAND_65 = {2{`RANDOM}};
  rob_uop_1_dst_value = _RAND_65[63:0];
  _RAND_66 = {2{`RANDOM}};
  rob_uop_1_src1_value = _RAND_66[63:0];
  _RAND_67 = {2{`RANDOM}};
  rob_uop_1_src2_value = _RAND_67[63:0];
  _RAND_68 = {1{`RANDOM}};
  rob_uop_1_op1_sel = _RAND_68[2:0];
  _RAND_69 = {1{`RANDOM}};
  rob_uop_1_op2_sel = _RAND_69[2:0];
  _RAND_70 = {1{`RANDOM}};
  rob_uop_1_alu_sel = _RAND_70[4:0];
  _RAND_71 = {1{`RANDOM}};
  rob_uop_1_branch_type = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  rob_uop_1_mem_type = _RAND_72[2:0];
  _RAND_73 = {1{`RANDOM}};
  rob_uop_2_valid = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  rob_uop_2_pc = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  rob_uop_2_inst = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  rob_uop_2_func_code = _RAND_76[6:0];
  _RAND_77 = {1{`RANDOM}};
  rob_uop_2_branch_predict_pack_valid = _RAND_77[0:0];
  _RAND_78 = {2{`RANDOM}};
  rob_uop_2_branch_predict_pack_target = _RAND_78[63:0];
  _RAND_79 = {1{`RANDOM}};
  rob_uop_2_branch_predict_pack_branch_type = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  rob_uop_2_branch_predict_pack_select = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  rob_uop_2_branch_predict_pack_taken = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  rob_uop_2_phy_dst = _RAND_82[6:0];
  _RAND_83 = {1{`RANDOM}};
  rob_uop_2_stale_dst = _RAND_83[6:0];
  _RAND_84 = {1{`RANDOM}};
  rob_uop_2_arch_dst = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  rob_uop_2_inst_type = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  rob_uop_2_regWen = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  rob_uop_2_src1_valid = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  rob_uop_2_phy_rs1 = _RAND_88[6:0];
  _RAND_89 = {1{`RANDOM}};
  rob_uop_2_arch_rs1 = _RAND_89[4:0];
  _RAND_90 = {1{`RANDOM}};
  rob_uop_2_src2_valid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  rob_uop_2_phy_rs2 = _RAND_91[6:0];
  _RAND_92 = {1{`RANDOM}};
  rob_uop_2_arch_rs2 = _RAND_92[4:0];
  _RAND_93 = {1{`RANDOM}};
  rob_uop_2_rob_idx = _RAND_93[3:0];
  _RAND_94 = {2{`RANDOM}};
  rob_uop_2_imm = _RAND_94[63:0];
  _RAND_95 = {2{`RANDOM}};
  rob_uop_2_dst_value = _RAND_95[63:0];
  _RAND_96 = {2{`RANDOM}};
  rob_uop_2_src1_value = _RAND_96[63:0];
  _RAND_97 = {2{`RANDOM}};
  rob_uop_2_src2_value = _RAND_97[63:0];
  _RAND_98 = {1{`RANDOM}};
  rob_uop_2_op1_sel = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  rob_uop_2_op2_sel = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  rob_uop_2_alu_sel = _RAND_100[4:0];
  _RAND_101 = {1{`RANDOM}};
  rob_uop_2_branch_type = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  rob_uop_2_mem_type = _RAND_102[2:0];
  _RAND_103 = {1{`RANDOM}};
  rob_uop_3_valid = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  rob_uop_3_pc = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  rob_uop_3_inst = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  rob_uop_3_func_code = _RAND_106[6:0];
  _RAND_107 = {1{`RANDOM}};
  rob_uop_3_branch_predict_pack_valid = _RAND_107[0:0];
  _RAND_108 = {2{`RANDOM}};
  rob_uop_3_branch_predict_pack_target = _RAND_108[63:0];
  _RAND_109 = {1{`RANDOM}};
  rob_uop_3_branch_predict_pack_branch_type = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  rob_uop_3_branch_predict_pack_select = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  rob_uop_3_branch_predict_pack_taken = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  rob_uop_3_phy_dst = _RAND_112[6:0];
  _RAND_113 = {1{`RANDOM}};
  rob_uop_3_stale_dst = _RAND_113[6:0];
  _RAND_114 = {1{`RANDOM}};
  rob_uop_3_arch_dst = _RAND_114[4:0];
  _RAND_115 = {1{`RANDOM}};
  rob_uop_3_inst_type = _RAND_115[2:0];
  _RAND_116 = {1{`RANDOM}};
  rob_uop_3_regWen = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  rob_uop_3_src1_valid = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  rob_uop_3_phy_rs1 = _RAND_118[6:0];
  _RAND_119 = {1{`RANDOM}};
  rob_uop_3_arch_rs1 = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  rob_uop_3_src2_valid = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  rob_uop_3_phy_rs2 = _RAND_121[6:0];
  _RAND_122 = {1{`RANDOM}};
  rob_uop_3_arch_rs2 = _RAND_122[4:0];
  _RAND_123 = {1{`RANDOM}};
  rob_uop_3_rob_idx = _RAND_123[3:0];
  _RAND_124 = {2{`RANDOM}};
  rob_uop_3_imm = _RAND_124[63:0];
  _RAND_125 = {2{`RANDOM}};
  rob_uop_3_dst_value = _RAND_125[63:0];
  _RAND_126 = {2{`RANDOM}};
  rob_uop_3_src1_value = _RAND_126[63:0];
  _RAND_127 = {2{`RANDOM}};
  rob_uop_3_src2_value = _RAND_127[63:0];
  _RAND_128 = {1{`RANDOM}};
  rob_uop_3_op1_sel = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  rob_uop_3_op2_sel = _RAND_129[2:0];
  _RAND_130 = {1{`RANDOM}};
  rob_uop_3_alu_sel = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  rob_uop_3_branch_type = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  rob_uop_3_mem_type = _RAND_132[2:0];
  _RAND_133 = {1{`RANDOM}};
  rob_uop_4_valid = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  rob_uop_4_pc = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  rob_uop_4_inst = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  rob_uop_4_func_code = _RAND_136[6:0];
  _RAND_137 = {1{`RANDOM}};
  rob_uop_4_branch_predict_pack_valid = _RAND_137[0:0];
  _RAND_138 = {2{`RANDOM}};
  rob_uop_4_branch_predict_pack_target = _RAND_138[63:0];
  _RAND_139 = {1{`RANDOM}};
  rob_uop_4_branch_predict_pack_branch_type = _RAND_139[3:0];
  _RAND_140 = {1{`RANDOM}};
  rob_uop_4_branch_predict_pack_select = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  rob_uop_4_branch_predict_pack_taken = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  rob_uop_4_phy_dst = _RAND_142[6:0];
  _RAND_143 = {1{`RANDOM}};
  rob_uop_4_stale_dst = _RAND_143[6:0];
  _RAND_144 = {1{`RANDOM}};
  rob_uop_4_arch_dst = _RAND_144[4:0];
  _RAND_145 = {1{`RANDOM}};
  rob_uop_4_inst_type = _RAND_145[2:0];
  _RAND_146 = {1{`RANDOM}};
  rob_uop_4_regWen = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  rob_uop_4_src1_valid = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  rob_uop_4_phy_rs1 = _RAND_148[6:0];
  _RAND_149 = {1{`RANDOM}};
  rob_uop_4_arch_rs1 = _RAND_149[4:0];
  _RAND_150 = {1{`RANDOM}};
  rob_uop_4_src2_valid = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  rob_uop_4_phy_rs2 = _RAND_151[6:0];
  _RAND_152 = {1{`RANDOM}};
  rob_uop_4_arch_rs2 = _RAND_152[4:0];
  _RAND_153 = {1{`RANDOM}};
  rob_uop_4_rob_idx = _RAND_153[3:0];
  _RAND_154 = {2{`RANDOM}};
  rob_uop_4_imm = _RAND_154[63:0];
  _RAND_155 = {2{`RANDOM}};
  rob_uop_4_dst_value = _RAND_155[63:0];
  _RAND_156 = {2{`RANDOM}};
  rob_uop_4_src1_value = _RAND_156[63:0];
  _RAND_157 = {2{`RANDOM}};
  rob_uop_4_src2_value = _RAND_157[63:0];
  _RAND_158 = {1{`RANDOM}};
  rob_uop_4_op1_sel = _RAND_158[2:0];
  _RAND_159 = {1{`RANDOM}};
  rob_uop_4_op2_sel = _RAND_159[2:0];
  _RAND_160 = {1{`RANDOM}};
  rob_uop_4_alu_sel = _RAND_160[4:0];
  _RAND_161 = {1{`RANDOM}};
  rob_uop_4_branch_type = _RAND_161[3:0];
  _RAND_162 = {1{`RANDOM}};
  rob_uop_4_mem_type = _RAND_162[2:0];
  _RAND_163 = {1{`RANDOM}};
  rob_uop_5_valid = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  rob_uop_5_pc = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  rob_uop_5_inst = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  rob_uop_5_func_code = _RAND_166[6:0];
  _RAND_167 = {1{`RANDOM}};
  rob_uop_5_branch_predict_pack_valid = _RAND_167[0:0];
  _RAND_168 = {2{`RANDOM}};
  rob_uop_5_branch_predict_pack_target = _RAND_168[63:0];
  _RAND_169 = {1{`RANDOM}};
  rob_uop_5_branch_predict_pack_branch_type = _RAND_169[3:0];
  _RAND_170 = {1{`RANDOM}};
  rob_uop_5_branch_predict_pack_select = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  rob_uop_5_branch_predict_pack_taken = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  rob_uop_5_phy_dst = _RAND_172[6:0];
  _RAND_173 = {1{`RANDOM}};
  rob_uop_5_stale_dst = _RAND_173[6:0];
  _RAND_174 = {1{`RANDOM}};
  rob_uop_5_arch_dst = _RAND_174[4:0];
  _RAND_175 = {1{`RANDOM}};
  rob_uop_5_inst_type = _RAND_175[2:0];
  _RAND_176 = {1{`RANDOM}};
  rob_uop_5_regWen = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  rob_uop_5_src1_valid = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  rob_uop_5_phy_rs1 = _RAND_178[6:0];
  _RAND_179 = {1{`RANDOM}};
  rob_uop_5_arch_rs1 = _RAND_179[4:0];
  _RAND_180 = {1{`RANDOM}};
  rob_uop_5_src2_valid = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  rob_uop_5_phy_rs2 = _RAND_181[6:0];
  _RAND_182 = {1{`RANDOM}};
  rob_uop_5_arch_rs2 = _RAND_182[4:0];
  _RAND_183 = {1{`RANDOM}};
  rob_uop_5_rob_idx = _RAND_183[3:0];
  _RAND_184 = {2{`RANDOM}};
  rob_uop_5_imm = _RAND_184[63:0];
  _RAND_185 = {2{`RANDOM}};
  rob_uop_5_dst_value = _RAND_185[63:0];
  _RAND_186 = {2{`RANDOM}};
  rob_uop_5_src1_value = _RAND_186[63:0];
  _RAND_187 = {2{`RANDOM}};
  rob_uop_5_src2_value = _RAND_187[63:0];
  _RAND_188 = {1{`RANDOM}};
  rob_uop_5_op1_sel = _RAND_188[2:0];
  _RAND_189 = {1{`RANDOM}};
  rob_uop_5_op2_sel = _RAND_189[2:0];
  _RAND_190 = {1{`RANDOM}};
  rob_uop_5_alu_sel = _RAND_190[4:0];
  _RAND_191 = {1{`RANDOM}};
  rob_uop_5_branch_type = _RAND_191[3:0];
  _RAND_192 = {1{`RANDOM}};
  rob_uop_5_mem_type = _RAND_192[2:0];
  _RAND_193 = {1{`RANDOM}};
  rob_uop_6_valid = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  rob_uop_6_pc = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  rob_uop_6_inst = _RAND_195[31:0];
  _RAND_196 = {1{`RANDOM}};
  rob_uop_6_func_code = _RAND_196[6:0];
  _RAND_197 = {1{`RANDOM}};
  rob_uop_6_branch_predict_pack_valid = _RAND_197[0:0];
  _RAND_198 = {2{`RANDOM}};
  rob_uop_6_branch_predict_pack_target = _RAND_198[63:0];
  _RAND_199 = {1{`RANDOM}};
  rob_uop_6_branch_predict_pack_branch_type = _RAND_199[3:0];
  _RAND_200 = {1{`RANDOM}};
  rob_uop_6_branch_predict_pack_select = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  rob_uop_6_branch_predict_pack_taken = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  rob_uop_6_phy_dst = _RAND_202[6:0];
  _RAND_203 = {1{`RANDOM}};
  rob_uop_6_stale_dst = _RAND_203[6:0];
  _RAND_204 = {1{`RANDOM}};
  rob_uop_6_arch_dst = _RAND_204[4:0];
  _RAND_205 = {1{`RANDOM}};
  rob_uop_6_inst_type = _RAND_205[2:0];
  _RAND_206 = {1{`RANDOM}};
  rob_uop_6_regWen = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  rob_uop_6_src1_valid = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  rob_uop_6_phy_rs1 = _RAND_208[6:0];
  _RAND_209 = {1{`RANDOM}};
  rob_uop_6_arch_rs1 = _RAND_209[4:0];
  _RAND_210 = {1{`RANDOM}};
  rob_uop_6_src2_valid = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  rob_uop_6_phy_rs2 = _RAND_211[6:0];
  _RAND_212 = {1{`RANDOM}};
  rob_uop_6_arch_rs2 = _RAND_212[4:0];
  _RAND_213 = {1{`RANDOM}};
  rob_uop_6_rob_idx = _RAND_213[3:0];
  _RAND_214 = {2{`RANDOM}};
  rob_uop_6_imm = _RAND_214[63:0];
  _RAND_215 = {2{`RANDOM}};
  rob_uop_6_dst_value = _RAND_215[63:0];
  _RAND_216 = {2{`RANDOM}};
  rob_uop_6_src1_value = _RAND_216[63:0];
  _RAND_217 = {2{`RANDOM}};
  rob_uop_6_src2_value = _RAND_217[63:0];
  _RAND_218 = {1{`RANDOM}};
  rob_uop_6_op1_sel = _RAND_218[2:0];
  _RAND_219 = {1{`RANDOM}};
  rob_uop_6_op2_sel = _RAND_219[2:0];
  _RAND_220 = {1{`RANDOM}};
  rob_uop_6_alu_sel = _RAND_220[4:0];
  _RAND_221 = {1{`RANDOM}};
  rob_uop_6_branch_type = _RAND_221[3:0];
  _RAND_222 = {1{`RANDOM}};
  rob_uop_6_mem_type = _RAND_222[2:0];
  _RAND_223 = {1{`RANDOM}};
  rob_uop_7_valid = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  rob_uop_7_pc = _RAND_224[31:0];
  _RAND_225 = {1{`RANDOM}};
  rob_uop_7_inst = _RAND_225[31:0];
  _RAND_226 = {1{`RANDOM}};
  rob_uop_7_func_code = _RAND_226[6:0];
  _RAND_227 = {1{`RANDOM}};
  rob_uop_7_branch_predict_pack_valid = _RAND_227[0:0];
  _RAND_228 = {2{`RANDOM}};
  rob_uop_7_branch_predict_pack_target = _RAND_228[63:0];
  _RAND_229 = {1{`RANDOM}};
  rob_uop_7_branch_predict_pack_branch_type = _RAND_229[3:0];
  _RAND_230 = {1{`RANDOM}};
  rob_uop_7_branch_predict_pack_select = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  rob_uop_7_branch_predict_pack_taken = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  rob_uop_7_phy_dst = _RAND_232[6:0];
  _RAND_233 = {1{`RANDOM}};
  rob_uop_7_stale_dst = _RAND_233[6:0];
  _RAND_234 = {1{`RANDOM}};
  rob_uop_7_arch_dst = _RAND_234[4:0];
  _RAND_235 = {1{`RANDOM}};
  rob_uop_7_inst_type = _RAND_235[2:0];
  _RAND_236 = {1{`RANDOM}};
  rob_uop_7_regWen = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  rob_uop_7_src1_valid = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  rob_uop_7_phy_rs1 = _RAND_238[6:0];
  _RAND_239 = {1{`RANDOM}};
  rob_uop_7_arch_rs1 = _RAND_239[4:0];
  _RAND_240 = {1{`RANDOM}};
  rob_uop_7_src2_valid = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  rob_uop_7_phy_rs2 = _RAND_241[6:0];
  _RAND_242 = {1{`RANDOM}};
  rob_uop_7_arch_rs2 = _RAND_242[4:0];
  _RAND_243 = {1{`RANDOM}};
  rob_uop_7_rob_idx = _RAND_243[3:0];
  _RAND_244 = {2{`RANDOM}};
  rob_uop_7_imm = _RAND_244[63:0];
  _RAND_245 = {2{`RANDOM}};
  rob_uop_7_dst_value = _RAND_245[63:0];
  _RAND_246 = {2{`RANDOM}};
  rob_uop_7_src1_value = _RAND_246[63:0];
  _RAND_247 = {2{`RANDOM}};
  rob_uop_7_src2_value = _RAND_247[63:0];
  _RAND_248 = {1{`RANDOM}};
  rob_uop_7_op1_sel = _RAND_248[2:0];
  _RAND_249 = {1{`RANDOM}};
  rob_uop_7_op2_sel = _RAND_249[2:0];
  _RAND_250 = {1{`RANDOM}};
  rob_uop_7_alu_sel = _RAND_250[4:0];
  _RAND_251 = {1{`RANDOM}};
  rob_uop_7_branch_type = _RAND_251[3:0];
  _RAND_252 = {1{`RANDOM}};
  rob_uop_7_mem_type = _RAND_252[2:0];
  _RAND_253 = {1{`RANDOM}};
  rob_done_0 = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  rob_done_1 = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  rob_done_2 = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  rob_done_3 = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  rob_done_4 = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  rob_done_5 = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  rob_done_6 = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  rob_done_7 = _RAND_260[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
