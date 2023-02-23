module Reservation_Station_Slot(
  input          clock,
  input          reset,
  output         io_o_valid,
  output         io_o_ready_to_issue,
  input          io_i_allocated_idx,
  input          io_i_issue_granted,
  input          io_i_branch_resolve_pack_valid,
  input          io_i_branch_resolve_pack_mispred,
  input  [7:0]   io_i_branch_resolve_pack_rob_idx,
  input          io_i_exception,
  input          io_i_write_slot,
  input  [127:0] io_i_wakeup_port,
  input          io_i_uop_valid,
  input  [31:0]  io_i_uop_pc,
  input  [31:0]  io_i_uop_inst,
  input  [6:0]   io_i_uop_func_code,
  input          io_i_uop_branch_predict_pack_valid,
  input  [63:0]  io_i_uop_branch_predict_pack_target,
  input  [3:0]   io_i_uop_branch_predict_pack_branch_type,
  input          io_i_uop_branch_predict_pack_select,
  input          io_i_uop_branch_predict_pack_taken,
  input  [6:0]   io_i_uop_phy_dst,
  input  [6:0]   io_i_uop_stale_dst,
  input  [4:0]   io_i_uop_arch_dst,
  input  [2:0]   io_i_uop_inst_type,
  input          io_i_uop_regWen,
  input          io_i_uop_src1_valid,
  input  [6:0]   io_i_uop_phy_rs1,
  input  [4:0]   io_i_uop_arch_rs1,
  input          io_i_uop_src2_valid,
  input  [6:0]   io_i_uop_phy_rs2,
  input  [4:0]   io_i_uop_arch_rs2,
  input  [6:0]   io_i_uop_rob_idx,
  input  [63:0]  io_i_uop_imm,
  input  [63:0]  io_i_uop_src1_value,
  input  [63:0]  io_i_uop_src2_value,
  input  [2:0]   io_i_uop_op1_sel,
  input  [2:0]   io_i_uop_op2_sel,
  input  [4:0]   io_i_uop_alu_sel,
  input  [3:0]   io_i_uop_branch_type,
  input  [1:0]   io_i_uop_mem_type,
  output [31:0]  io_o_uop_pc,
  output [31:0]  io_o_uop_inst,
  output [6:0]   io_o_uop_func_code,
  output         io_o_uop_branch_predict_pack_valid,
  output [63:0]  io_o_uop_branch_predict_pack_target,
  output [3:0]   io_o_uop_branch_predict_pack_branch_type,
  output         io_o_uop_branch_predict_pack_select,
  output         io_o_uop_branch_predict_pack_taken,
  output [6:0]   io_o_uop_phy_dst,
  output [6:0]   io_o_uop_stale_dst,
  output [4:0]   io_o_uop_arch_dst,
  output [2:0]   io_o_uop_inst_type,
  output         io_o_uop_regWen,
  output         io_o_uop_src1_valid,
  output [6:0]   io_o_uop_phy_rs1,
  output [4:0]   io_o_uop_arch_rs1,
  output         io_o_uop_src2_valid,
  output [6:0]   io_o_uop_phy_rs2,
  output [4:0]   io_o_uop_arch_rs2,
  output [6:0]   io_o_uop_rob_idx,
  output [63:0]  io_o_uop_imm,
  output [63:0]  io_o_uop_src1_value,
  output [63:0]  io_o_uop_src2_value,
  output [2:0]   io_o_uop_op1_sel,
  output [2:0]   io_o_uop_op2_sel,
  output [4:0]   io_o_uop_alu_sel,
  output [3:0]   io_o_uop_branch_type,
  output [1:0]   io_o_uop_mem_type,
  input  [6:0]   io_i_exe_dst1,
  input  [6:0]   io_i_exe_dst2,
  input  [63:0]  io_i_exe_value1,
  input  [63:0]  io_i_exe_value2,
  input          io_i_age_pack_issue_valid_0,
  input          io_i_age_pack_issue_valid_1,
  input  [7:0]   io_i_age_pack_max_age,
  input  [7:0]   io_i_age_pack_issued_ages_0,
  input  [7:0]   io_i_age_pack_issued_ages_1,
  output [7:0]   io_o_age,
  input  [6:0]   io_i_ROB_first_entry
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
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
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] age; // @[reservation_station_slot.scala 47:22]
  reg  uop_valid; // @[reservation_station_slot.scala 50:22]
  reg [31:0] uop_pc; // @[reservation_station_slot.scala 50:22]
  reg [31:0] uop_inst; // @[reservation_station_slot.scala 50:22]
  reg [6:0] uop_func_code; // @[reservation_station_slot.scala 50:22]
  reg  uop_branch_predict_pack_valid; // @[reservation_station_slot.scala 50:22]
  reg [63:0] uop_branch_predict_pack_target; // @[reservation_station_slot.scala 50:22]
  reg [3:0] uop_branch_predict_pack_branch_type; // @[reservation_station_slot.scala 50:22]
  reg  uop_branch_predict_pack_select; // @[reservation_station_slot.scala 50:22]
  reg  uop_branch_predict_pack_taken; // @[reservation_station_slot.scala 50:22]
  reg [6:0] uop_phy_dst; // @[reservation_station_slot.scala 50:22]
  reg [6:0] uop_stale_dst; // @[reservation_station_slot.scala 50:22]
  reg [4:0] uop_arch_dst; // @[reservation_station_slot.scala 50:22]
  reg [2:0] uop_inst_type; // @[reservation_station_slot.scala 50:22]
  reg  uop_regWen; // @[reservation_station_slot.scala 50:22]
  reg  uop_src1_valid; // @[reservation_station_slot.scala 50:22]
  reg [6:0] uop_phy_rs1; // @[reservation_station_slot.scala 50:22]
  reg [4:0] uop_arch_rs1; // @[reservation_station_slot.scala 50:22]
  reg  uop_src2_valid; // @[reservation_station_slot.scala 50:22]
  reg [6:0] uop_phy_rs2; // @[reservation_station_slot.scala 50:22]
  reg [4:0] uop_arch_rs2; // @[reservation_station_slot.scala 50:22]
  reg [6:0] uop_rob_idx; // @[reservation_station_slot.scala 50:22]
  reg [63:0] uop_imm; // @[reservation_station_slot.scala 50:22]
  reg [63:0] uop_src1_value; // @[reservation_station_slot.scala 50:22]
  reg [63:0] uop_src2_value; // @[reservation_station_slot.scala 50:22]
  reg [2:0] uop_op1_sel; // @[reservation_station_slot.scala 50:22]
  reg [2:0] uop_op2_sel; // @[reservation_station_slot.scala 50:22]
  reg [4:0] uop_alu_sel; // @[reservation_station_slot.scala 50:22]
  reg [3:0] uop_branch_type; // @[reservation_station_slot.scala 50:22]
  reg [1:0] uop_mem_type; // @[reservation_station_slot.scala 50:22]
  reg  valid; // @[reservation_station_slot.scala 53:24]
  wire  _flush_T_14 = io_i_branch_resolve_pack_rob_idx[5:0] > uop_rob_idx[5:0] & (io_i_branch_resolve_pack_rob_idx[6] ^
    uop_rob_idx[6]); // @[reservation_station_slot.scala 60:71]
  wire  _flush_T_15 = io_i_branch_resolve_pack_rob_idx[6] == uop_rob_idx[6] & io_i_branch_resolve_pack_rob_idx[5:0] <
    uop_rob_idx[5:0] | _flush_T_14; // @[reservation_station_slot.scala 59:132]
  wire  _flush_T_17 = valid & (io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_mispred & _flush_T_15); // @[reservation_station_slot.scala 58:20]
  wire  flush = io_i_exception | _flush_T_17; // @[reservation_station_slot.scala 57:29]
  wire  _T = io_i_write_slot & io_i_uop_valid; // @[reservation_station_slot.scala 64:32]
  wire [7:0] _GEN_83 = {{7'd0}, io_i_allocated_idx}; // @[reservation_station_slot.scala 65:37]
  wire [7:0] _age_T_1 = io_i_age_pack_max_age + _GEN_83; // @[reservation_station_slot.scala 65:37]
  wire  _T_1 = ~io_i_write_slot; // @[reservation_station_slot.scala 66:16]
  wire  _T_3 = valid & io_i_age_pack_issue_valid_0; // @[reservation_station_slot.scala 68:22]
  wire  _T_4 = valid & io_i_age_pack_issue_valid_0 & io_i_age_pack_issue_valid_1; // @[reservation_station_slot.scala 68:54]
  wire [7:0] _GEN_84 = {{2'd0}, age}; // @[reservation_station_slot.scala 68:91]
  wire  _T_5 = _GEN_84 > io_i_age_pack_issued_ages_0; // @[reservation_station_slot.scala 68:91]
  wire [5:0] _age_T_3 = age - 6'h1; // @[reservation_station_slot.scala 69:19]
  wire [5:0] _age_T_5 = age - 6'h2; // @[reservation_station_slot.scala 71:19]
  wire [5:0] _GEN_0 = _T_3 & ~io_i_age_pack_issue_valid_1 & _T_5 ? _age_T_3 : age; // @[reservation_station_slot.scala 72:121 73:13 75:13]
  wire [5:0] _GEN_1 = _T_4 & _GEN_84 > io_i_age_pack_issued_ages_1 ? _age_T_5 : _GEN_0; // @[reservation_station_slot.scala 70:121 71:13]
  wire [5:0] _GEN_2 = valid & io_i_age_pack_issue_valid_0 & io_i_age_pack_issue_valid_1 & _GEN_84 >
    io_i_age_pack_issued_ages_0 & _GEN_84 < io_i_age_pack_issued_ages_1 ? _age_T_3 : _GEN_1; // @[reservation_station_slot.scala 68:157 69:13]
  wire [5:0] _GEN_3 = ~io_i_write_slot & io_i_issue_granted ? 6'h3f : _GEN_2; // @[reservation_station_slot.scala 66:55 67:13]
  wire [7:0] _GEN_4 = io_i_write_slot & io_i_uop_valid ? _age_T_1 : {{2'd0}, _GEN_3}; // @[reservation_station_slot.scala 64:50 65:13]
  wire [7:0] _GEN_5 = flush ? 8'h3f : _GEN_4; // @[reservation_station_slot.scala 62:17 63:13]
  reg  src1_ready; // @[reservation_station_slot.scala 78:29]
  reg  src2_ready; // @[reservation_station_slot.scala 81:29]
  wire  _T_18 = io_i_uop_op1_sel == 3'h0; // @[reservation_station_slot.scala 109:14]
  wire [2:0] _GEN_88 = {{2'd0}, io_i_uop_op1_sel == 3'h0}; // @[reservation_station_slot.scala 109:31]
  wire  _T_22 = ~reset; // @[reservation_station_slot.scala 109:11]
  wire  _T_24 = io_i_uop_op2_sel == 3'h0; // @[reservation_station_slot.scala 110:14]
  wire [2:0] _GEN_89 = {{2'd0}, io_i_uop_op2_sel == 3'h0}; // @[reservation_station_slot.scala 110:31]
  wire  _next_src1_acquired_T_1 = ~_T_18; // @[reservation_station_slot.scala 113:30]
  wire  _next_src1_acquired_T_4 = _T_18 & io_i_uop_phy_rs1 == 7'h0; // @[reservation_station_slot.scala 113:91]
  wire  _next_src1_acquired_T_7 = io_i_exe_dst1 == io_i_uop_phy_rs1; // @[reservation_station_slot.scala 113:171]
  wire  _next_src1_acquired_T_8 = io_i_exe_dst2 == io_i_uop_phy_rs1; // @[reservation_station_slot.scala 113:209]
  wire  _next_src1_value_T_5 = _next_src1_acquired_T_7 & _T_18; // @[reservation_station_slot.scala 115:49]
  wire  _next_src1_value_T_8 = _next_src1_acquired_T_8 & _T_18; // @[reservation_station_slot.scala 116:49]
  wire [63:0] _next_src1_value_T_9 = _next_src1_value_T_8 ? io_i_exe_value2 : io_i_uop_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _next_src1_value_T_10 = _next_src1_value_T_5 ? io_i_exe_value1 : _next_src1_value_T_9; // @[Mux.scala 101:16]
  wire [63:0] _next_src1_value_T_11 = _next_src1_acquired_T_4 ? 64'h0 : _next_src1_value_T_10; // @[reservation_station_slot.scala 114:31]
  wire [127:0] _T_30 = io_i_wakeup_port >> uop_phy_rs1; // @[reservation_station_slot.scala 118:33]
  wire  _T_34 = _T_30[0] & uop_op1_sel == 3'h0; // @[reservation_station_slot.scala 118:53]
  wire  _next_src1_acquired_T_12 = io_i_exe_dst1 == uop_phy_rs1; // @[reservation_station_slot.scala 119:67]
  wire  _next_src1_acquired_T_13 = io_i_exe_dst2 == uop_phy_rs1; // @[reservation_station_slot.scala 119:99]
  wire  _GEN_68 = _T_30[0] & uop_op1_sel == 3'h0 ? uop_src1_valid | (io_i_exe_dst1 == uop_phy_rs1 | io_i_exe_dst2 ==
    uop_phy_rs1) : uop_src1_valid; // @[reservation_station_slot.scala 118:78 119:28 125:28]
  wire  next_src1_acquired = io_i_write_slot ? ~_T_18 | _T_18 & io_i_uop_phy_rs1 == 7'h0 | _T_18 & (io_i_exe_dst1 ==
    io_i_uop_phy_rs1 | io_i_exe_dst2 == io_i_uop_phy_rs1) : _GEN_68; // @[reservation_station_slot.scala 112:26 113:27]
  wire [63:0] _next_src1_value_T_16 = _next_src1_acquired_T_13 ? io_i_exe_value2 : uop_src1_value; // @[Mux.scala 101:16]
  wire [63:0] _next_src1_value_T_17 = _next_src1_acquired_T_12 ? io_i_exe_value1 : _next_src1_value_T_16; // @[Mux.scala 101:16]
  wire [63:0] _next_src1_value_T_18 = ~uop_src1_valid & next_src1_acquired ? _next_src1_value_T_17 : uop_src1_value; // @[reservation_station_slot.scala 120:30]
  wire [63:0] _GEN_69 = _T_30[0] & uop_op1_sel == 3'h0 ? _next_src1_value_T_18 : uop_src1_value; // @[reservation_station_slot.scala 118:78 120:25 126:25]
  wire  _next_src2_acquired_T_1 = ~_T_24; // @[reservation_station_slot.scala 129:30]
  wire  _next_src2_acquired_T_4 = _T_24 & io_i_uop_phy_rs2 == 7'h0; // @[reservation_station_slot.scala 129:90]
  wire  _next_src2_acquired_T_7 = io_i_exe_dst1 == io_i_uop_phy_rs2; // @[reservation_station_slot.scala 129:171]
  wire  _next_src2_acquired_T_8 = io_i_exe_dst2 == io_i_uop_phy_rs2; // @[reservation_station_slot.scala 129:209]
  wire  _next_src2_value_T_5 = _next_src2_acquired_T_7 & _T_24; // @[reservation_station_slot.scala 131:49]
  wire  _next_src2_value_T_8 = _next_src2_acquired_T_8 & _T_24; // @[reservation_station_slot.scala 132:49]
  wire [63:0] _next_src2_value_T_9 = _next_src2_value_T_8 ? io_i_exe_value2 : io_i_uop_src2_value; // @[Mux.scala 101:16]
  wire [63:0] _next_src2_value_T_10 = _next_src2_value_T_5 ? io_i_exe_value1 : _next_src2_value_T_9; // @[Mux.scala 101:16]
  wire [63:0] _next_src2_value_T_11 = _next_src2_acquired_T_4 ? 64'h0 : _next_src2_value_T_10; // @[reservation_station_slot.scala 130:30]
  wire [127:0] _T_35 = io_i_wakeup_port >> uop_phy_rs2; // @[reservation_station_slot.scala 134:33]
  wire  _T_39 = _T_35[0] & uop_op2_sel == 3'h0; // @[reservation_station_slot.scala 134:53]
  wire  _next_src2_acquired_T_12 = io_i_exe_dst1 == uop_phy_rs2; // @[reservation_station_slot.scala 135:68]
  wire  _next_src2_acquired_T_13 = io_i_exe_dst2 == uop_phy_rs2; // @[reservation_station_slot.scala 135:100]
  wire  _GEN_72 = _T_35[0] & uop_op2_sel == 3'h0 ? uop_src2_valid | (io_i_exe_dst1 == uop_phy_rs2 | io_i_exe_dst2 ==
    uop_phy_rs2) : uop_src2_valid; // @[reservation_station_slot.scala 134:78 135:28 141:28]
  wire  next_src2_acquired = io_i_write_slot ? ~_T_24 | _T_24 & io_i_uop_phy_rs2 == 7'h0 | _T_24 & (io_i_exe_dst1 ==
    io_i_uop_phy_rs2 | io_i_exe_dst2 == io_i_uop_phy_rs2) : _GEN_72; // @[reservation_station_slot.scala 128:26 129:27]
  wire [63:0] _next_src2_value_T_16 = _next_src2_acquired_T_13 ? io_i_exe_value2 : uop_src2_value; // @[Mux.scala 101:16]
  wire [63:0] _next_src2_value_T_17 = _next_src2_acquired_T_12 ? io_i_exe_value1 : _next_src2_value_T_16; // @[Mux.scala 101:16]
  wire [63:0] _next_src2_value_T_18 = ~uop_src2_valid & next_src2_acquired ? _next_src2_value_T_17 : uop_src2_value; // @[reservation_station_slot.scala 136:30]
  wire [63:0] _GEN_73 = _T_35[0] & uop_op2_sel == 3'h0 ? _next_src2_value_T_18 : uop_src2_value; // @[reservation_station_slot.scala 134:78 136:25 142:25]
  wire [127:0] _next_src1_ready_T_3 = io_i_wakeup_port >> io_i_uop_phy_rs1; // @[reservation_station_slot.scala 146:108]
  wire  _GEN_76 = uop_valid & _T_34 | src1_ready; // @[reservation_station_slot.scala 147:91 148:24 150:24]
  wire  next_src1_ready = io_i_write_slot ? _next_src1_acquired_T_1 | _T_18 & _next_src1_ready_T_3[0] : _GEN_76; // @[reservation_station_slot.scala 145:26 146:24]
  wire [127:0] _next_src2_ready_T_3 = io_i_wakeup_port >> io_i_uop_phy_rs2; // @[reservation_station_slot.scala 154:108]
  wire  _GEN_78 = uop_valid & _T_39 | src2_ready; // @[reservation_station_slot.scala 155:91 156:24 158:24]
  wire  next_src2_ready = io_i_write_slot ? _next_src2_acquired_T_1 | _T_24 & _next_src2_ready_T_3[0] : _GEN_78; // @[reservation_station_slot.scala 153:26 154:24]
  wire  _GEN_80 = _T | valid; // @[reservation_station_slot.scala 166:52 167:14 53:24]
  wire  ls_is_the_head_of_ROB = io_i_ROB_first_entry == uop_rob_idx & uop_func_code == 7'h4 | uop_func_code != 7'h4; // @[reservation_station_slot.scala 173:96]
  wire [7:0] _GEN_90 = reset ? 8'h3f : _GEN_5; // @[reservation_station_slot.scala 47:{22,22}]
  assign io_o_valid = valid; // @[reservation_station_slot.scala 54:16]
  assign io_o_ready_to_issue = valid & next_src1_ready & next_src2_ready & ~flush & ls_is_the_head_of_ROB; // @[reservation_station_slot.scala 175:100]
  assign io_o_uop_pc = uop_pc; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_inst = uop_inst; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_func_code = uop_func_code; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_branch_predict_pack_valid = uop_branch_predict_pack_valid; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_branch_predict_pack_target = uop_branch_predict_pack_target; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_branch_predict_pack_branch_type = uop_branch_predict_pack_branch_type; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_branch_predict_pack_select = uop_branch_predict_pack_select; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_branch_predict_pack_taken = uop_branch_predict_pack_taken; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_phy_dst = uop_phy_dst; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_stale_dst = uop_stale_dst; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_arch_dst = uop_arch_dst; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_inst_type = uop_inst_type; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_regWen = uop_regWen; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_src1_valid = io_i_write_slot ? ~_T_18 | _T_18 & io_i_uop_phy_rs1 == 7'h0 | _T_18 & (io_i_exe_dst1 ==
    io_i_uop_phy_rs1 | io_i_exe_dst2 == io_i_uop_phy_rs1) : _GEN_68; // @[reservation_station_slot.scala 112:26 113:27]
  assign io_o_uop_phy_rs1 = uop_phy_rs1; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_arch_rs1 = uop_arch_rs1; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_src2_valid = io_i_write_slot ? ~_T_24 | _T_24 & io_i_uop_phy_rs2 == 7'h0 | _T_24 & (io_i_exe_dst1 ==
    io_i_uop_phy_rs2 | io_i_exe_dst2 == io_i_uop_phy_rs2) : _GEN_72; // @[reservation_station_slot.scala 128:26 129:27]
  assign io_o_uop_phy_rs2 = uop_phy_rs2; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_arch_rs2 = uop_arch_rs2; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_rob_idx = uop_rob_idx; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_imm = uop_imm; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_src1_value = io_i_write_slot ? _next_src1_value_T_11 : _GEN_69; // @[reservation_station_slot.scala 112:26 114:25]
  assign io_o_uop_src2_value = io_i_write_slot ? _next_src2_value_T_11 : _GEN_73; // @[reservation_station_slot.scala 128:26 130:25]
  assign io_o_uop_op1_sel = uop_op1_sel; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_op2_sel = uop_op2_sel; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_alu_sel = uop_alu_sel; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_branch_type = uop_branch_type; // @[reservation_station_slot.scala 51:14]
  assign io_o_uop_mem_type = uop_mem_type; // @[reservation_station_slot.scala 51:14]
  assign io_o_age = {{2'd0}, age}; // @[reservation_station_slot.scala 48:14]
  always @(posedge clock) begin
    age <= _GEN_90[5:0]; // @[reservation_station_slot.scala 47:{22,22}]
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_valid <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (flush) begin // @[reservation_station_slot.scala 87:16]
      uop_valid <= 1'h0; // @[reservation_station_slot.scala 88:18]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
      uop_valid <= io_i_uop_valid; // @[reservation_station_slot.scala 90:12]
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_pc <= 32'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_pc <= io_i_uop_pc; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_inst <= 32'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_inst <= io_i_uop_inst; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_func_code <= 7'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_func_code <= io_i_uop_func_code; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_branch_predict_pack_valid <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_branch_predict_pack_valid <= io_i_uop_branch_predict_pack_valid; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_branch_predict_pack_target <= 64'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_branch_predict_pack_target <= io_i_uop_branch_predict_pack_target; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_branch_predict_pack_branch_type <= 4'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_branch_predict_pack_branch_type <= io_i_uop_branch_predict_pack_branch_type; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_branch_predict_pack_select <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_branch_predict_pack_select <= io_i_uop_branch_predict_pack_select; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_branch_predict_pack_taken <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_branch_predict_pack_taken <= io_i_uop_branch_predict_pack_taken; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_phy_dst <= 7'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_phy_dst <= io_i_uop_phy_dst; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_stale_dst <= 7'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_stale_dst <= io_i_uop_stale_dst; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_arch_dst <= 5'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_arch_dst <= io_i_uop_arch_dst; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_inst_type <= 3'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_inst_type <= io_i_uop_inst_type; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_regWen <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_regWen <= io_i_uop_regWen; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_src1_valid <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 112:26]
      uop_src1_valid <= ~_T_18 | _T_18 & io_i_uop_phy_rs1 == 7'h0 | _T_18 & (io_i_exe_dst1 == io_i_uop_phy_rs1 |
        io_i_exe_dst2 == io_i_uop_phy_rs1); // @[reservation_station_slot.scala 113:27]
    end else if (_T_30[0] & uop_op1_sel == 3'h0) begin // @[reservation_station_slot.scala 118:78]
      uop_src1_valid <= uop_src1_valid | (io_i_exe_dst1 == uop_phy_rs1 | io_i_exe_dst2 == uop_phy_rs1); // @[reservation_station_slot.scala 119:28]
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_phy_rs1 <= 7'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_phy_rs1 <= io_i_uop_phy_rs1; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_arch_rs1 <= 5'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_arch_rs1 <= io_i_uop_arch_rs1; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_src2_valid <= 1'h0; // @[reservation_station_slot.scala 50:22]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 128:26]
      uop_src2_valid <= ~_T_24 | _T_24 & io_i_uop_phy_rs2 == 7'h0 | _T_24 & (io_i_exe_dst1 == io_i_uop_phy_rs2 |
        io_i_exe_dst2 == io_i_uop_phy_rs2); // @[reservation_station_slot.scala 129:27]
    end else if (_T_35[0] & uop_op2_sel == 3'h0) begin // @[reservation_station_slot.scala 134:78]
      uop_src2_valid <= uop_src2_valid | (io_i_exe_dst1 == uop_phy_rs2 | io_i_exe_dst2 == uop_phy_rs2); // @[reservation_station_slot.scala 135:28]
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_phy_rs2 <= 7'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_phy_rs2 <= io_i_uop_phy_rs2; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_arch_rs2 <= 5'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_arch_rs2 <= io_i_uop_arch_rs2; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_rob_idx <= 7'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_rob_idx <= io_i_uop_rob_idx; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_imm <= 64'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_imm <= io_i_uop_imm; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_src1_value <= 64'h0; // @[reservation_station_slot.scala 50:22]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 112:26]
      if (_next_src1_acquired_T_4) begin // @[reservation_station_slot.scala 114:31]
        uop_src1_value <= 64'h0;
      end else if (_next_src1_value_T_5) begin // @[Mux.scala 101:16]
        uop_src1_value <= io_i_exe_value1;
      end else begin
        uop_src1_value <= _next_src1_value_T_9;
      end
    end else if (_T_30[0] & uop_op1_sel == 3'h0) begin // @[reservation_station_slot.scala 118:78]
      if (~uop_src1_valid & next_src1_acquired) begin // @[reservation_station_slot.scala 120:30]
        uop_src1_value <= _next_src1_value_T_17;
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_src2_value <= 64'h0; // @[reservation_station_slot.scala 50:22]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 128:26]
      if (_next_src2_acquired_T_4) begin // @[reservation_station_slot.scala 130:30]
        uop_src2_value <= 64'h0;
      end else if (_next_src2_value_T_5) begin // @[Mux.scala 101:16]
        uop_src2_value <= io_i_exe_value1;
      end else begin
        uop_src2_value <= _next_src2_value_T_9;
      end
    end else if (_T_35[0] & uop_op2_sel == 3'h0) begin // @[reservation_station_slot.scala 134:78]
      if (~uop_src2_valid & next_src2_acquired) begin // @[reservation_station_slot.scala 136:30]
        uop_src2_value <= _next_src2_value_T_17;
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_op1_sel <= 3'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_op1_sel <= io_i_uop_op1_sel; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_op2_sel <= 3'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_op2_sel <= io_i_uop_op2_sel; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_alu_sel <= 5'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_alu_sel <= io_i_uop_alu_sel; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_branch_type <= 4'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_branch_type <= io_i_uop_branch_type; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 50:22]
      uop_mem_type <= 2'h0; // @[reservation_station_slot.scala 50:22]
    end else if (!(flush)) begin // @[reservation_station_slot.scala 87:16]
      if (io_i_write_slot) begin // @[reservation_station_slot.scala 89:32]
        uop_mem_type <= io_i_uop_mem_type; // @[reservation_station_slot.scala 90:12]
      end
    end
    if (reset) begin // @[reservation_station_slot.scala 53:24]
      valid <= 1'h0; // @[reservation_station_slot.scala 53:24]
    end else if (flush | io_i_issue_granted & _T_1) begin // @[reservation_station_slot.scala 164:60]
      valid <= 1'h0; // @[reservation_station_slot.scala 165:14]
    end else begin
      valid <= _GEN_80;
    end
    if (reset) begin // @[reservation_station_slot.scala 78:29]
      src1_ready <= 1'h0; // @[reservation_station_slot.scala 78:29]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 145:26]
      src1_ready <= _next_src1_acquired_T_1 | _T_18 & _next_src1_ready_T_3[0]; // @[reservation_station_slot.scala 146:24]
    end else begin
      src1_ready <= _GEN_76;
    end
    if (reset) begin // @[reservation_station_slot.scala 81:29]
      src2_ready <= 1'h0; // @[reservation_station_slot.scala 81:29]
    end else if (io_i_write_slot) begin // @[reservation_station_slot.scala 153:26]
      src2_ready <= _next_src2_acquired_T_1 | _T_24 & _next_src2_ready_T_3[0]; // @[reservation_station_slot.scala 154:24]
    end else begin
      src2_ready <= _GEN_78;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_GEN_88 == 3'h0 == io_i_uop_src1_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: src valid wrong\n    at reservation_station_slot.scala:109 assert(((!io.i_uop.op1_sel===SRC_RS)===io.i_uop.src1_valid),\"src valid wrong\")\n"
            ); // @[reservation_station_slot.scala 109:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(_GEN_88 == 3'h0 == io_i_uop_src1_valid)) begin
          $fatal; // @[reservation_station_slot.scala 109:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_22 & ~(_GEN_89 == 3'h0 == io_i_uop_src2_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: src valid wrong\n    at reservation_station_slot.scala:110 assert(((!io.i_uop.op2_sel===SRC_RS)===io.i_uop.src2_valid),\"src valid wrong\")\n"
            ); // @[reservation_station_slot.scala 110:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_22 & ~(_GEN_89 == 3'h0 == io_i_uop_src2_valid)) begin
          $fatal; // @[reservation_station_slot.scala 110:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  age = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  uop_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  uop_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  uop_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  uop_func_code = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  uop_branch_predict_pack_valid = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  uop_branch_predict_pack_target = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  uop_branch_predict_pack_branch_type = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  uop_branch_predict_pack_select = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  uop_branch_predict_pack_taken = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  uop_phy_dst = _RAND_10[6:0];
  _RAND_11 = {1{`RANDOM}};
  uop_stale_dst = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  uop_arch_dst = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  uop_inst_type = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  uop_regWen = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uop_src1_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  uop_phy_rs1 = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  uop_arch_rs1 = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  uop_src2_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uop_phy_rs2 = _RAND_19[6:0];
  _RAND_20 = {1{`RANDOM}};
  uop_arch_rs2 = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  uop_rob_idx = _RAND_21[6:0];
  _RAND_22 = {2{`RANDOM}};
  uop_imm = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  uop_src1_value = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  uop_src2_value = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  uop_op1_sel = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  uop_op2_sel = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  uop_alu_sel = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  uop_branch_type = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  uop_mem_type = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  src1_ready = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  src2_ready = _RAND_32[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
