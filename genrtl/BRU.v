module BRU(
  input         clock,
  input         reset,
  output        io_o_branch_resolve_pack_valid,
  output        io_o_branch_resolve_pack_mispred,
  output        io_o_branch_resolve_pack_taken,
  output [63:0] io_o_branch_resolve_pack_pc,
  output [63:0] io_o_branch_resolve_pack_target,
  output [7:0]  io_o_branch_resolve_pack_rob_idx,
  output        io_o_branch_resolve_pack_prediction_valid,
  output [2:0]  io_o_branch_resolve_pack_branch_type,
  input         io_i_uop_valid,
  input  [31:0] io_i_uop_pc,
  input  [31:0] io_i_uop_inst,
  input  [6:0]  io_i_uop_func_code,
  input         io_i_uop_branch_predict_pack_valid,
  input  [63:0] io_i_uop_branch_predict_pack_target,
  input         io_i_uop_branch_predict_pack_taken,
  input  [6:0]  io_i_uop_phy_dst,
  input  [6:0]  io_i_uop_stale_dst,
  input  [4:0]  io_i_uop_arch_dst,
  input  [6:0]  io_i_uop_rob_idx,
  input  [63:0] io_i_uop_imm,
  input  [63:0] io_i_uop_src1_value,
  input  [63:0] io_i_uop_src2_value,
  input  [4:0]  io_i_uop_alu_sel,
  input  [2:0]  io_i_uop_branch_type,
  input         io_i_select,
  input         io_i_select_to_commit,
  output        io_o_ex_res_pack_valid,
  output        io_o_ex_res_pack_uop_valid,
  output [31:0] io_o_ex_res_pack_uop_pc,
  output [31:0] io_o_ex_res_pack_uop_inst,
  output [6:0]  io_o_ex_res_pack_uop_func_code,
  output [6:0]  io_o_ex_res_pack_uop_phy_dst,
  output [6:0]  io_o_ex_res_pack_uop_stale_dst,
  output [4:0]  io_o_ex_res_pack_uop_arch_dst,
  output [6:0]  io_o_ex_res_pack_uop_rob_idx,
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
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
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[execute_unit.scala 136:24]
  reg  uop_valid; // @[execute_unit.scala 140:23]
  reg [31:0] uop_pc; // @[execute_unit.scala 140:23]
  reg [31:0] uop_inst; // @[execute_unit.scala 140:23]
  reg [6:0] uop_func_code; // @[execute_unit.scala 140:23]
  reg  uop_branch_predict_pack_valid; // @[execute_unit.scala 140:23]
  reg [63:0] uop_branch_predict_pack_target; // @[execute_unit.scala 140:23]
  reg  uop_branch_predict_pack_taken; // @[execute_unit.scala 140:23]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 140:23]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 140:23]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 140:23]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 140:23]
  reg [63:0] uop_imm; // @[execute_unit.scala 140:23]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 140:23]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 140:23]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 140:23]
  reg [2:0] uop_branch_type; // @[execute_unit.scala 140:23]
  wire  br_eq = uop_src1_value == uop_src2_value; // @[execute_unit.scala 151:21]
  wire  br_ltu = uop_src1_value < uop_src2_value; // @[execute_unit.scala 152:30]
  wire  _br_lt_T_8 = uop_src1_value[63] & ~uop_src2_value[63]; // @[execute_unit.scala 154:25]
  wire  br_lt = ~(uop_src1_value[63] ^ uop_src2_value[63]) & br_ltu | _br_lt_T_8; // @[execute_unit.scala 153:49]
  wire [3:0] _GEN_1 = {{1'd0}, uop_branch_type}; // @[execute_unit.scala 166:41]
  wire  _pc_sel_T = _GEN_1 == 4'h0; // @[execute_unit.scala 166:41]
  wire  _pc_sel_T_1 = _GEN_1 == 4'h1; // @[execute_unit.scala 167:41]
  wire [1:0] _pc_sel_T_3 = ~br_eq ? 2'h1 : 2'h0; // @[execute_unit.scala 167:61]
  wire  _pc_sel_T_4 = _GEN_1 == 4'h2; // @[execute_unit.scala 168:41]
  wire [1:0] _pc_sel_T_5 = br_eq ? 2'h1 : 2'h0; // @[execute_unit.scala 168:61]
  wire  _pc_sel_T_6 = _GEN_1 == 4'h3; // @[execute_unit.scala 169:41]
  wire [1:0] _pc_sel_T_8 = ~br_lt ? 2'h1 : 2'h0; // @[execute_unit.scala 169:61]
  wire  _pc_sel_T_9 = _GEN_1 == 4'h4; // @[execute_unit.scala 170:41]
  wire [1:0] _pc_sel_T_11 = ~br_ltu ? 2'h1 : 2'h0; // @[execute_unit.scala 170:61]
  wire  _pc_sel_T_12 = _GEN_1 == 4'h5; // @[execute_unit.scala 171:41]
  wire [1:0] _pc_sel_T_13 = br_lt ? 2'h1 : 2'h0; // @[execute_unit.scala 171:61]
  wire  _pc_sel_T_14 = _GEN_1 == 4'h6; // @[execute_unit.scala 172:41]
  wire [1:0] _pc_sel_T_15 = br_ltu ? 2'h1 : 2'h0; // @[execute_unit.scala 172:61]
  wire  _pc_sel_T_16 = _GEN_1 == 4'h7; // @[execute_unit.scala 173:41]
  wire  _pc_sel_T_17 = _GEN_1 == 4'h8; // @[execute_unit.scala 174:41]
  wire [1:0] _pc_sel_T_18 = _pc_sel_T_17 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_19 = _pc_sel_T_16 ? 2'h1 : _pc_sel_T_18; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_20 = _pc_sel_T_14 ? _pc_sel_T_15 : _pc_sel_T_19; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_21 = _pc_sel_T_12 ? _pc_sel_T_13 : _pc_sel_T_20; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_22 = _pc_sel_T_9 ? _pc_sel_T_11 : _pc_sel_T_21; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_23 = _pc_sel_T_6 ? _pc_sel_T_8 : _pc_sel_T_22; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_24 = _pc_sel_T_4 ? _pc_sel_T_5 : _pc_sel_T_23; // @[Mux.scala 101:16]
  wire [1:0] _pc_sel_T_25 = _pc_sel_T_1 ? _pc_sel_T_3 : _pc_sel_T_24; // @[Mux.scala 101:16]
  wire [1:0] pc_sel = _pc_sel_T ? 2'h0 : _pc_sel_T_25; // @[Mux.scala 101:16]
  wire  is_taken = pc_sel != 2'h0; // @[execute_unit.scala 178:23]
  wire [31:0] _target_address_T_1 = uop_pc + 32'h4; // @[execute_unit.scala 180:35]
  wire  _target_address_T_2 = pc_sel == 2'h1; // @[execute_unit.scala 181:13]
  wire [31:0] _target_address_T_4 = uop_pc; // @[execute_unit.scala 181:57]
  wire [63:0] _GEN_10 = {{32{_target_address_T_4[31]}},_target_address_T_4}; // @[execute_unit.scala 181:49]
  wire [63:0] _target_address_T_8 = $signed(uop_imm) + $signed(_GEN_10); // @[execute_unit.scala 181:65]
  wire  _target_address_T_9 = pc_sel == 2'h2; // @[execute_unit.scala 182:13]
  wire [63:0] _target_address_T_15 = $signed(uop_src1_value) + $signed(uop_src2_value); // @[execute_unit.scala 182:80]
  wire  _target_address_T_16 = pc_sel == 2'h0; // @[execute_unit.scala 183:13]
  wire [31:0] _target_address_T_19 = _target_address_T_16 ? _target_address_T_1 : _target_address_T_1; // @[Mux.scala 101:16]
  wire [63:0] _target_address_T_20 = _target_address_T_9 ? _target_address_T_15 : {{32'd0}, _target_address_T_19}; // @[Mux.scala 101:16]
  wire [63:0] _target_address_T_21 = _target_address_T_2 ? _target_address_T_8 : _target_address_T_20; // @[Mux.scala 101:16]
  wire [31:0] target_address = _target_address_T_21[31:0]; // @[execute_unit.scala 179:28 180:18]
  wire [63:0] _GEN_11 = {{32'd0}, target_address}; // @[execute_unit.scala 194:114]
  wire  _mispredict_T_5 = uop_branch_predict_pack_valid & (is_taken & uop_branch_predict_pack_taken & _GEN_11 !=
    uop_branch_predict_pack_target); // @[execute_unit.scala 194:49]
  wire  _mispredict_T_6 = uop_branch_predict_pack_valid & (is_taken ^ uop_branch_predict_pack_taken) | _mispredict_T_5; // @[execute_unit.scala 193:95]
  wire  _mispredict_T_8 = ~uop_branch_predict_pack_valid & is_taken; // @[execute_unit.scala 195:49]
  wire  _next_state_T = ~io_i_exception; // @[execute_unit.scala 218:10]
  wire  _next_state_T_5 = ~io_i_exception & ~state & (uop_valid & ~io_i_select_to_commit); // @[execute_unit.scala 218:50]
  wire  _next_state_T_9 = _next_state_T & state & io_i_select_to_commit; // @[execute_unit.scala 219:50]
  wire  _next_state_T_10 = _next_state_T_9 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_12 = io_i_exception ? 1'h0 : _next_state_T_5 | _next_state_T_10; // @[Mux.scala 101:16]
  wire [1:0] next_state = {{1'd0}, _next_state_T_12}; // @[execute_unit.scala 137:26 216:16]
  wire [1:0] _GEN_12 = reset ? 2'h0 : next_state; // @[execute_unit.scala 136:{24,24} 138:11]
  assign io_o_branch_resolve_pack_valid = uop_valid; // @[execute_unit.scala 197:33 199:41]
  assign io_o_branch_resolve_pack_mispred = _mispredict_T_6 | _mispredict_T_8; // @[execute_unit.scala 194:151]
  assign io_o_branch_resolve_pack_taken = pc_sel != 2'h0; // @[execute_unit.scala 178:23]
  assign io_o_branch_resolve_pack_pc = {{32'd0}, uop_pc}; // @[execute_unit.scala 197:33 200:41]
  assign io_o_branch_resolve_pack_target = {{32'd0}, target_address}; // @[execute_unit.scala 197:33 203:41]
  assign io_o_branch_resolve_pack_rob_idx = {{1'd0}, uop_rob_idx}; // @[execute_unit.scala 197:33 204:41]
  assign io_o_branch_resolve_pack_prediction_valid = uop_branch_predict_pack_valid; // @[execute_unit.scala 197:33 206:41]
  assign io_o_branch_resolve_pack_branch_type = uop_branch_type; // @[execute_unit.scala 197:33 205:41]
  assign io_o_ex_res_pack_valid = uop_valid; // @[execute_unit.scala 223:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 147:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 147:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 222:26]
  always @(posedge clock) begin
    state <= _GEN_12[0]; // @[execute_unit.scala 136:{24,24} 138:11]
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_valid <= 1'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select_to_commit & ~io_i_select | io_i_exception) begin // @[execute_unit.scala 144:66]
      uop_valid <= 1'h0; // @[execute_unit.scala 145:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_pc <= 32'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_inst <= 32'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_func_code <= 7'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_branch_predict_pack_valid <= 1'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_branch_predict_pack_valid <= io_i_uop_branch_predict_pack_valid;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_branch_predict_pack_target <= 64'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_branch_predict_pack_target <= io_i_uop_branch_predict_pack_target;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_branch_predict_pack_taken <= 1'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_branch_predict_pack_taken <= io_i_uop_branch_predict_pack_taken;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_imm <= 64'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_imm <= io_i_uop_imm;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    if (reset) begin // @[execute_unit.scala 140:23]
      uop_branch_type <= 3'h0; // @[execute_unit.scala 140:23]
    end else if (io_i_select) begin // @[execute_unit.scala 142:20]
      uop_branch_type <= io_i_uop_branch_type;
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
  uop_branch_predict_pack_taken = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  uop_phy_dst = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  uop_stale_dst = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  uop_arch_dst = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  uop_rob_idx = _RAND_11[6:0];
  _RAND_12 = {2{`RANDOM}};
  uop_imm = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  uop_src1_value = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  uop_src2_value = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  uop_alu_sel = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  uop_branch_type = _RAND_16[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
