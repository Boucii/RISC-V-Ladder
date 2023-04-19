module BRU(
  input         clock,
  input         reset,
  output        io_o_branch_resolve_pack_valid,
  output        io_o_branch_resolve_pack_mispred,
  output        io_o_branch_resolve_pack_taken,
  output [63:0] io_o_branch_resolve_pack_pc,
  output [63:0] io_o_branch_resolve_pack_target,
  output [3:0]  io_o_branch_resolve_pack_rob_idx,
  output        io_o_branch_resolve_pack_prediction_valid,
  output [2:0]  io_o_branch_resolve_pack_branch_type,
  input         io_i_uop_valid,
  input  [31:0] io_i_uop_pc,
  input  [31:0] io_i_uop_inst,
  input  [6:0]  io_i_uop_func_code,
  input         io_i_uop_branch_predict_pack_valid,
  input  [63:0] io_i_uop_branch_predict_pack_target,
  input  [3:0]  io_i_uop_branch_predict_pack_branch_type,
  input         io_i_uop_branch_predict_pack_select,
  input         io_i_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_uop_phy_dst,
  input  [6:0]  io_i_uop_stale_dst,
  input  [4:0]  io_i_uop_arch_dst,
  input  [2:0]  io_i_uop_inst_type,
  input         io_i_uop_regWen,
  input         io_i_uop_src1_valid,
  input  [6:0]  io_i_uop_phy_rs1,
  input  [4:0]  io_i_uop_arch_rs1,
  input         io_i_uop_src2_valid,
  input  [6:0]  io_i_uop_phy_rs2,
  input  [4:0]  io_i_uop_arch_rs2,
  input  [3:0]  io_i_uop_rob_idx,
  input  [63:0] io_i_uop_imm,
  input  [63:0] io_i_uop_src1_value,
  input  [63:0] io_i_uop_src2_value,
  input  [2:0]  io_i_uop_op1_sel,
  input  [2:0]  io_i_uop_op2_sel,
  input  [4:0]  io_i_uop_alu_sel,
  input  [3:0]  io_i_uop_branch_type,
  input  [2:0]  io_i_uop_mem_type,
  input         io_i_select,
  input         io_i_select_to_commit,
  output        io_o_ex_res_pack_valid,
  output        io_o_ex_res_pack_uop_valid,
  output [31:0] io_o_ex_res_pack_uop_pc,
  output [31:0] io_o_ex_res_pack_uop_inst,
  output [6:0]  io_o_ex_res_pack_uop_func_code,
  output        io_o_ex_res_pack_uop_branch_predict_pack_valid,
  output [63:0] io_o_ex_res_pack_uop_branch_predict_pack_target,
  output [3:0]  io_o_ex_res_pack_uop_branch_predict_pack_branch_type,
  output        io_o_ex_res_pack_uop_branch_predict_pack_select,
  output        io_o_ex_res_pack_uop_branch_predict_pack_taken,
  output [6:0]  io_o_ex_res_pack_uop_phy_dst,
  output [6:0]  io_o_ex_res_pack_uop_stale_dst,
  output [4:0]  io_o_ex_res_pack_uop_arch_dst,
  output [2:0]  io_o_ex_res_pack_uop_inst_type,
  output        io_o_ex_res_pack_uop_regWen,
  output        io_o_ex_res_pack_uop_src1_valid,
  output [6:0]  io_o_ex_res_pack_uop_phy_rs1,
  output [4:0]  io_o_ex_res_pack_uop_arch_rs1,
  output        io_o_ex_res_pack_uop_src2_valid,
  output [6:0]  io_o_ex_res_pack_uop_phy_rs2,
  output [4:0]  io_o_ex_res_pack_uop_arch_rs2,
  output [3:0]  io_o_ex_res_pack_uop_rob_idx,
  output [63:0] io_o_ex_res_pack_uop_imm,
  output [63:0] io_o_ex_res_pack_uop_dst_value,
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [63:0] io_o_ex_res_pack_uop_src2_value,
  output [2:0]  io_o_ex_res_pack_uop_op1_sel,
  output [2:0]  io_o_ex_res_pack_uop_op2_sel,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
  output [3:0]  io_o_ex_res_pack_uop_branch_type,
  output [2:0]  io_o_ex_res_pack_uop_mem_type,
  output        io_o_available,
  input         io_i_exception
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
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[execute_unit.scala 149:24]
  reg  uop_valid; // @[execute_unit.scala 153:23]
  reg [31:0] uop_pc; // @[execute_unit.scala 153:23]
  reg [31:0] uop_inst; // @[execute_unit.scala 153:23]
  reg [6:0] uop_func_code; // @[execute_unit.scala 153:23]
  reg  uop_branch_predict_pack_valid; // @[execute_unit.scala 153:23]
  reg [63:0] uop_branch_predict_pack_target; // @[execute_unit.scala 153:23]
  reg [3:0] uop_branch_predict_pack_branch_type; // @[execute_unit.scala 153:23]
  reg  uop_branch_predict_pack_select; // @[execute_unit.scala 153:23]
  reg  uop_branch_predict_pack_taken; // @[execute_unit.scala 153:23]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 153:23]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 153:23]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 153:23]
  reg [2:0] uop_inst_type; // @[execute_unit.scala 153:23]
  reg  uop_regWen; // @[execute_unit.scala 153:23]
  reg  uop_src1_valid; // @[execute_unit.scala 153:23]
  reg [6:0] uop_phy_rs1; // @[execute_unit.scala 153:23]
  reg [4:0] uop_arch_rs1; // @[execute_unit.scala 153:23]
  reg  uop_src2_valid; // @[execute_unit.scala 153:23]
  reg [6:0] uop_phy_rs2; // @[execute_unit.scala 153:23]
  reg [4:0] uop_arch_rs2; // @[execute_unit.scala 153:23]
  reg [3:0] uop_rob_idx; // @[execute_unit.scala 153:23]
  reg [63:0] uop_imm; // @[execute_unit.scala 153:23]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 153:23]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 153:23]
  reg [2:0] uop_op1_sel; // @[execute_unit.scala 153:23]
  reg [2:0] uop_op2_sel; // @[execute_unit.scala 153:23]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 153:23]
  reg [3:0] uop_branch_type; // @[execute_unit.scala 153:23]
  reg [2:0] uop_mem_type; // @[execute_unit.scala 153:23]
  wire [31:0] _io_o_ex_res_pack_uop_dst_value_T_1 = uop_pc + 32'h4; // @[execute_unit.scala 163:46]
  wire  br_eq = uop_src1_value == uop_src2_value; // @[execute_unit.scala 168:21]
  wire  br_ltu = uop_src1_value < uop_src2_value; // @[execute_unit.scala 169:30]
  wire  _br_lt_T_8 = uop_src1_value[63] & ~uop_src2_value[63]; // @[execute_unit.scala 171:25]
  wire  br_lt = ~(uop_src1_value[63] ^ uop_src2_value[63]) & br_ltu | _br_lt_T_8; // @[execute_unit.scala 170:49]
  wire  _pc_sel_T = uop_branch_type == 4'h0; // @[execute_unit.scala 183:41]
  wire  _pc_sel_T_1 = uop_branch_type == 4'h1; // @[execute_unit.scala 184:41]
  wire [1:0] _pc_sel_T_3 = ~br_eq ? 2'h1 : 2'h0; // @[execute_unit.scala 184:61]
  wire  _pc_sel_T_4 = uop_branch_type == 4'h2; // @[execute_unit.scala 185:41]
  wire [1:0] _pc_sel_T_5 = br_eq ? 2'h1 : 2'h0; // @[execute_unit.scala 185:61]
  wire  _pc_sel_T_6 = uop_branch_type == 4'h3; // @[execute_unit.scala 186:41]
  wire [1:0] _pc_sel_T_8 = ~br_lt ? 2'h1 : 2'h0; // @[execute_unit.scala 186:61]
  wire  _pc_sel_T_9 = uop_branch_type == 4'h4; // @[execute_unit.scala 187:41]
  wire [1:0] _pc_sel_T_11 = ~br_ltu ? 2'h1 : 2'h0; // @[execute_unit.scala 187:61]
  wire  _pc_sel_T_12 = uop_branch_type == 4'h5; // @[execute_unit.scala 188:41]
  wire [1:0] _pc_sel_T_13 = br_lt ? 2'h1 : 2'h0; // @[execute_unit.scala 188:61]
  wire  _pc_sel_T_14 = uop_branch_type == 4'h6; // @[execute_unit.scala 189:41]
  wire [1:0] _pc_sel_T_15 = br_ltu ? 2'h1 : 2'h0; // @[execute_unit.scala 189:61]
  wire  _pc_sel_T_16 = uop_branch_type == 4'h7; // @[execute_unit.scala 190:41]
  wire  _pc_sel_T_17 = uop_branch_type == 4'h8; // @[execute_unit.scala 191:41]
  wire [1:0] _pc_sel_T_18 = _pc_sel_T_17 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_19 = _pc_sel_T_16 ? 2'h1 : _pc_sel_T_18; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_20 = _pc_sel_T_14 ? _pc_sel_T_15 : _pc_sel_T_19; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_21 = _pc_sel_T_12 ? _pc_sel_T_13 : _pc_sel_T_20; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_22 = _pc_sel_T_9 ? _pc_sel_T_11 : _pc_sel_T_21; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_23 = _pc_sel_T_6 ? _pc_sel_T_8 : _pc_sel_T_22; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_24 = _pc_sel_T_4 ? _pc_sel_T_5 : _pc_sel_T_23; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_25 = _pc_sel_T_1 ? _pc_sel_T_3 : _pc_sel_T_24; // @[Mux.scala 101:16]
  wire [1:0] pc_sel = _pc_sel_T ? 2'h0 : _pc_sel_T_25; // @[Mux.scala 101:16]
  wire  is_taken = pc_sel != 2'h0; // @[execute_unit.scala 195:23]
  wire  _target_address_T_2 = pc_sel == 2'h1; // @[execute_unit.scala 198:13]
  wire [31:0] _target_address_T_4 = uop_pc; // @[execute_unit.scala 198:57]
  wire [63:0] _GEN_1 = {{32{_target_address_T_4[31]}},_target_address_T_4}; // @[execute_unit.scala 198:49]
  wire [63:0] _target_address_T_8 = $signed(uop_imm) + $signed(_GEN_1); // @[execute_unit.scala 198:65]
  wire  _target_address_T_9 = pc_sel == 2'h2; // @[execute_unit.scala 199:13]
  wire [63:0] _target_address_T_15 = $signed(uop_src1_value) + $signed(uop_src2_value); // @[execute_unit.scala 199:80]
  wire  _target_address_T_16 = pc_sel == 2'h0; // @[execute_unit.scala 200:13]
  wire [31:0] _target_address_T_19 = _target_address_T_16 ? _io_o_ex_res_pack_uop_dst_value_T_1 :
    _io_o_ex_res_pack_uop_dst_value_T_1; // @[Mux.scala 101:16]
  wire [63:0] _target_address_T_20 = _target_address_T_9 ? _target_address_T_15 : {{32'd0}, _target_address_T_19}; // @[Mux.scala 101:16]
  wire [63:0] _target_address_T_21 = _target_address_T_2 ? _target_address_T_8 : _target_address_T_20; // @[Mux.scala 101:16]
  wire  valid_prediction = uop_pc[2] == uop_branch_predict_pack_select & uop_branch_predict_pack_valid; // @[execute_unit.scala 210:70]
  wire [31:0] target_address = _target_address_T_21[31:0]; // @[execute_unit.scala 196:28 197:18]
  wire [63:0] _GEN_2 = {{32'd0}, target_address}; // @[execute_unit.scala 214:101]
  wire  _mispredict_T_5 = valid_prediction & (is_taken & uop_branch_predict_pack_taken & _GEN_2 !=
    uop_branch_predict_pack_target); // @[execute_unit.scala 214:36]
  wire  _mispredict_T_6 = valid_prediction & (is_taken ^ uop_branch_predict_pack_taken) | _mispredict_T_5; // @[execute_unit.scala 213:82]
  wire  _mispredict_T_8 = ~valid_prediction & is_taken; // @[execute_unit.scala 215:36]
  wire  _next_state_T = ~io_i_exception; // @[execute_unit.scala 245:10]
  wire  _next_state_T_5 = ~io_i_exception & ~state & (uop_valid & ~io_i_select_to_commit); // @[execute_unit.scala 245:50]
  wire  _next_state_T_9 = _next_state_T & state & io_i_select_to_commit; // @[execute_unit.scala 246:50]
  wire  _next_state_T_10 = _next_state_T_9 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_12 = io_i_exception ? 1'h0 : _next_state_T_5 | _next_state_T_10; // @[Mux.scala 101:16]
  wire [1:0] next_state = {{1'd0}, _next_state_T_12}; // @[execute_unit.scala 150:26 243:16]
  wire [1:0] _GEN_3 = reset ? 2'h0 : next_state; // @[execute_unit.scala 149:{24,24} 151:11]
  assign io_o_branch_resolve_pack_valid = uop_valid; // @[execute_unit.scala 223:33 225:41]
  assign io_o_branch_resolve_pack_mispred = _mispredict_T_6 | _mispredict_T_8; // @[execute_unit.scala 214:138]
  assign io_o_branch_resolve_pack_taken = pc_sel != 2'h0; // @[execute_unit.scala 195:23]
  assign io_o_branch_resolve_pack_pc = {{32'd0}, uop_pc}; // @[execute_unit.scala 223:33 226:41]
  assign io_o_branch_resolve_pack_target = {{32'd0}, target_address}; // @[execute_unit.scala 223:33 229:41]
  assign io_o_branch_resolve_pack_rob_idx = uop_rob_idx; // @[execute_unit.scala 223:33 230:41]
  assign io_o_branch_resolve_pack_prediction_valid = uop_branch_predict_pack_valid; // @[execute_unit.scala 223:33 233:41]
  assign io_o_branch_resolve_pack_branch_type = uop_branch_type[2:0]; // @[execute_unit.scala 223:33 231:41]
  assign io_o_ex_res_pack_valid = uop_valid; // @[execute_unit.scala 251:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_valid = uop_branch_predict_pack_valid; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_target = uop_branch_predict_pack_target; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_branch_type = uop_branch_predict_pack_branch_type; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_select = uop_branch_predict_pack_select; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_taken = uop_branch_predict_pack_taken; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_inst_type = uop_inst_type; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_regWen = uop_regWen; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_src1_valid = uop_src1_valid; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_phy_rs1 = uop_phy_rs1; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_arch_rs1 = uop_arch_rs1; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_src2_valid = uop_src2_valid; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_phy_rs2 = uop_phy_rs2; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_arch_rs2 = uop_arch_rs2; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_imm = uop_imm; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_dst_value = {{32'd0}, _io_o_ex_res_pack_uop_dst_value_T_1}; // @[execute_unit.scala 163:36]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_src2_value = uop_src2_value; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_op1_sel = uop_op1_sel; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_op2_sel = uop_op2_sel; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_branch_type = uop_branch_type; // @[execute_unit.scala 162:26]
  assign io_o_ex_res_pack_uop_mem_type = uop_mem_type; // @[execute_unit.scala 162:26]
  assign io_o_available = next_state != 2'h1; // @[execute_unit.scala 250:34]
  always @(posedge clock) begin
    state <= _GEN_3[0]; // @[execute_unit.scala 149:{24,24} 151:11]
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_valid <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select_to_commit & ~io_i_select | io_i_exception) begin // @[execute_unit.scala 158:66]
      uop_valid <= 1'h0; // @[execute_unit.scala 159:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_pc <= 32'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_inst <= 32'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_func_code <= 7'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_branch_predict_pack_valid <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_branch_predict_pack_valid <= io_i_uop_branch_predict_pack_valid;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_branch_predict_pack_target <= 64'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_branch_predict_pack_target <= io_i_uop_branch_predict_pack_target;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_branch_predict_pack_branch_type <= 4'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_branch_predict_pack_branch_type <= io_i_uop_branch_predict_pack_branch_type;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_branch_predict_pack_select <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_branch_predict_pack_select <= io_i_uop_branch_predict_pack_select;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_branch_predict_pack_taken <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_branch_predict_pack_taken <= io_i_uop_branch_predict_pack_taken;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_inst_type <= 3'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_inst_type <= io_i_uop_inst_type;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_regWen <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_regWen <= io_i_uop_regWen;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_src1_valid <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_src1_valid <= io_i_uop_src1_valid;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_phy_rs1 <= 7'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_phy_rs1 <= io_i_uop_phy_rs1;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_arch_rs1 <= 5'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_arch_rs1 <= io_i_uop_arch_rs1;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_src2_valid <= 1'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_src2_valid <= io_i_uop_src2_valid;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_phy_rs2 <= 7'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_phy_rs2 <= io_i_uop_phy_rs2;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_arch_rs2 <= 5'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_arch_rs2 <= io_i_uop_arch_rs2;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_rob_idx <= 4'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_imm <= 64'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_imm <= io_i_uop_imm;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_op1_sel <= 3'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_op1_sel <= io_i_uop_op1_sel;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_op2_sel <= 3'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_op2_sel <= io_i_uop_op2_sel;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_branch_type <= 4'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_branch_type <= io_i_uop_branch_type;
    end
    if (reset) begin // @[execute_unit.scala 153:23]
      uop_mem_type <= 3'h0; // @[execute_unit.scala 153:23]
    end else if (io_i_select) begin // @[execute_unit.scala 155:20]
      uop_mem_type <= io_i_uop_mem_type;
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
  state = _RAND_0[0:0];
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
  uop_rob_idx = _RAND_21[3:0];
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
  uop_mem_type = _RAND_29[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
