module CSR_BF(
  input         clock,
  input         reset,
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
  input  [1:0]  io_i_uop_mem_type,
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
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [63:0] io_o_ex_res_pack_uop_src2_value,
  output [2:0]  io_o_ex_res_pack_uop_op1_sel,
  output [2:0]  io_o_ex_res_pack_uop_op2_sel,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
  output [3:0]  io_o_ex_res_pack_uop_branch_type,
  output [1:0]  io_o_ex_res_pack_uop_mem_type,
  output        io_o_available,
  input         io_i_exception,
  input         io_i_rollback_valid,
  input  [3:0]  io_i_rollback_rob_idx
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
  reg  state; // @[execute_unit.scala 691:24]
  reg  uop_valid; // @[execute_unit.scala 695:22]
  reg [31:0] uop_pc; // @[execute_unit.scala 695:22]
  reg [31:0] uop_inst; // @[execute_unit.scala 695:22]
  reg [6:0] uop_func_code; // @[execute_unit.scala 695:22]
  reg  uop_branch_predict_pack_valid; // @[execute_unit.scala 695:22]
  reg [63:0] uop_branch_predict_pack_target; // @[execute_unit.scala 695:22]
  reg [3:0] uop_branch_predict_pack_branch_type; // @[execute_unit.scala 695:22]
  reg  uop_branch_predict_pack_select; // @[execute_unit.scala 695:22]
  reg  uop_branch_predict_pack_taken; // @[execute_unit.scala 695:22]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 695:22]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 695:22]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 695:22]
  reg [2:0] uop_inst_type; // @[execute_unit.scala 695:22]
  reg  uop_regWen; // @[execute_unit.scala 695:22]
  reg  uop_src1_valid; // @[execute_unit.scala 695:22]
  reg [6:0] uop_phy_rs1; // @[execute_unit.scala 695:22]
  reg [4:0] uop_arch_rs1; // @[execute_unit.scala 695:22]
  reg  uop_src2_valid; // @[execute_unit.scala 695:22]
  reg [6:0] uop_phy_rs2; // @[execute_unit.scala 695:22]
  reg [4:0] uop_arch_rs2; // @[execute_unit.scala 695:22]
  reg [3:0] uop_rob_idx; // @[execute_unit.scala 695:22]
  reg [63:0] uop_imm; // @[execute_unit.scala 695:22]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 695:22]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 695:22]
  reg [2:0] uop_op1_sel; // @[execute_unit.scala 695:22]
  reg [2:0] uop_op2_sel; // @[execute_unit.scala 695:22]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 695:22]
  reg [3:0] uop_branch_type; // @[execute_unit.scala 695:22]
  reg [1:0] uop_mem_type; // @[execute_unit.scala 695:22]
  wire  _T_16 = io_i_rollback_rob_idx[2:0] > uop_rob_idx[2:0] & (io_i_rollback_rob_idx[3] ^ uop_rob_idx[3]); // @[execute_unit.scala 701:90]
  wire  _T_18 = io_i_rollback_valid & (io_i_rollback_rob_idx[2:0] < uop_rob_idx[2:0] & io_i_rollback_rob_idx[3] ==
    uop_rob_idx[3] | _T_16); // @[execute_unit.scala 700:31]
  wire  _T_19 = io_i_select_to_commit & ~io_i_select | io_i_exception | _T_18; // @[execute_unit.scala 699:66]
  wire  _next_state_T_16 = ~io_i_exception; // @[execute_unit.scala 715:10]
  wire  _next_state_T_21 = ~io_i_exception & ~state & (uop_valid & ~io_i_select_to_commit); // @[execute_unit.scala 715:50]
  wire  _next_state_T_25 = _next_state_T_16 & state & io_i_select_to_commit; // @[execute_unit.scala 716:50]
  wire  _next_state_T_26 = _next_state_T_25 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_28 = _T_18 ? 1'h0 : _next_state_T_21 | _next_state_T_26; // @[Mux.scala 101:16]
  wire  _next_state_T_29 = io_i_exception ? 1'h0 : _next_state_T_28; // @[Mux.scala 101:16]
  wire  _io_o_available_T_1 = state ? 1'h0 : 1'h1; // @[execute_unit.scala 720:26]
  wire [1:0] next_state = {{1'd0}, _next_state_T_29}; // @[execute_unit.scala 692:26 711:16]
  wire [1:0] _GEN_1 = reset ? 2'h0 : next_state; // @[execute_unit.scala 691:{24,24} 693:11]
  assign io_o_ex_res_pack_valid = uop_valid; // @[execute_unit.scala 709:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_valid = uop_branch_predict_pack_valid; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_target = uop_branch_predict_pack_target; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_branch_type = uop_branch_predict_pack_branch_type; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_select = uop_branch_predict_pack_select; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_taken = uop_branch_predict_pack_taken; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_inst_type = uop_inst_type; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_regWen = uop_regWen; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_src1_valid = uop_src1_valid; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_phy_rs1 = uop_phy_rs1; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_arch_rs1 = uop_arch_rs1; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_src2_valid = uop_src2_valid; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_phy_rs2 = uop_phy_rs2; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_arch_rs2 = uop_arch_rs2; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_imm = uop_imm; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_src2_value = uop_src2_value; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_op1_sel = uop_op1_sel; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_op2_sel = uop_op2_sel; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_branch_type = uop_branch_type; // @[execute_unit.scala 708:26]
  assign io_o_ex_res_pack_uop_mem_type = uop_mem_type; // @[execute_unit.scala 708:26]
  assign io_o_available = _io_o_available_T_1 & (io_i_select_to_commit & uop_valid | ~uop_valid); // @[execute_unit.scala 720:61]
  always @(posedge clock) begin
    state <= _GEN_1[0]; // @[execute_unit.scala 691:{24,24} 693:11]
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_valid <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (_T_19) begin // @[execute_unit.scala 701:165]
      uop_valid <= 1'h0; // @[execute_unit.scala 702:23]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_pc <= 32'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_inst <= 32'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_func_code <= 7'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_branch_predict_pack_valid <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_branch_predict_pack_valid <= io_i_uop_branch_predict_pack_valid;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_branch_predict_pack_target <= 64'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_branch_predict_pack_target <= io_i_uop_branch_predict_pack_target;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_branch_predict_pack_branch_type <= 4'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_branch_predict_pack_branch_type <= io_i_uop_branch_predict_pack_branch_type;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_branch_predict_pack_select <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_branch_predict_pack_select <= io_i_uop_branch_predict_pack_select;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_branch_predict_pack_taken <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_branch_predict_pack_taken <= io_i_uop_branch_predict_pack_taken;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_inst_type <= 3'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_inst_type <= io_i_uop_inst_type;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_regWen <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_regWen <= io_i_uop_regWen;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_src1_valid <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_src1_valid <= io_i_uop_src1_valid;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_phy_rs1 <= 7'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_phy_rs1 <= io_i_uop_phy_rs1;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_arch_rs1 <= 5'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_arch_rs1 <= io_i_uop_arch_rs1;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_src2_valid <= 1'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_src2_valid <= io_i_uop_src2_valid;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_phy_rs2 <= 7'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_phy_rs2 <= io_i_uop_phy_rs2;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_arch_rs2 <= 5'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_arch_rs2 <= io_i_uop_arch_rs2;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_rob_idx <= 4'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_imm <= 64'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_imm <= io_i_uop_imm;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_op1_sel <= 3'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_op1_sel <= io_i_uop_op1_sel;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_op2_sel <= 3'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_op2_sel <= io_i_uop_op2_sel;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_branch_type <= 4'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
      uop_branch_type <= io_i_uop_branch_type;
    end
    if (reset) begin // @[execute_unit.scala 695:22]
      uop_mem_type <= 2'h0; // @[execute_unit.scala 695:22]
    end else if (io_i_select) begin // @[execute_unit.scala 697:20]
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
  uop_mem_type = _RAND_29[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
