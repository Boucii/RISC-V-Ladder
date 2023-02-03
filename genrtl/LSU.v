module LSU(
  input         clock,
  input         reset,
  input         io_i_uop_valid,
  input  [31:0] io_i_uop_pc,
  input  [31:0] io_i_uop_inst,
  input  [6:0]  io_i_uop_func_code,
  input  [6:0]  io_i_uop_phy_dst,
  input  [6:0]  io_i_uop_stale_dst,
  input  [4:0]  io_i_uop_arch_dst,
  input  [6:0]  io_i_uop_rob_idx,
  input  [63:0] io_i_uop_imm,
  input  [63:0] io_i_uop_src1_value,
  input  [63:0] io_i_uop_src2_value,
  input  [4:0]  io_i_uop_alu_sel,
  input  [1:0]  io_i_uop_mem_type,
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
  output [63:0] io_o_ex_res_pack_uop_dst_value,
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
  output        io_o_available,
  input  [6:0]  io_i_ROB_first_entry,
  input         io_dcache_io_data_valid,
  output        io_dcache_io_addr_valid,
  input         io_dcache_io_addr_ready,
  output        io_dcache_io_Mwout,
  output [63:0] io_dcache_io_Maddr,
  output        io_dcache_io_Men,
  output [31:0] io_dcache_io_Mlen,
  input  [63:0] io_dcache_io_MdataIn,
  output [63:0] io_dcache_io_MdataOut,
  output        io_o_lsu_uop_valid,
  output [7:0]  io_o_lsu_uop_rob_idx,
  input         io_i_exception,
  input         io_i_rollback_valid,
  input  [6:0]  io_i_rollback_rob_idx
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
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[execute_unit.scala 235:24]
  reg  uop_valid; // @[execute_unit.scala 239:23]
  reg [31:0] uop_pc; // @[execute_unit.scala 239:23]
  reg [31:0] uop_inst; // @[execute_unit.scala 239:23]
  reg [6:0] uop_func_code; // @[execute_unit.scala 239:23]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 239:23]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 239:23]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 239:23]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 239:23]
  reg [63:0] uop_imm; // @[execute_unit.scala 239:23]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 239:23]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 239:23]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 239:23]
  reg [1:0] uop_mem_type; // @[execute_unit.scala 239:23]
  wire  _next_state_T = ~state; // @[execute_unit.scala 301:17]
  wire  _next_state_T_1 = ~state & io_i_select; // @[execute_unit.scala 301:29]
  wire  _next_state_T_3 = state & io_i_select_to_commit; // @[execute_unit.scala 302:29]
  wire  _next_ready_to_commit_T_2 = uop_mem_type == 2'h1; // @[execute_unit.scala 308:67]
  wire  _next_ready_to_commit_T_3 = state & io_dcache_io_addr_ready & uop_mem_type == 2'h1; // @[execute_unit.scala 308:52]
  wire  _next_ready_to_commit_T_6 = uop_mem_type == 2'h2; // @[execute_unit.scala 309:67]
  wire  _next_ready_to_commit_T_7 = state & io_dcache_io_data_valid & uop_mem_type == 2'h2; // @[execute_unit.scala 309:52]
  reg  ready_to_commit; // @[execute_unit.scala 286:34]
  wire  _next_ready_to_commit_T_9 = _next_state_T ? 1'h0 : ready_to_commit; // @[Mux.scala 101:16]
  wire  next_ready_to_commit = _next_ready_to_commit_T_3 | (_next_ready_to_commit_T_7 | _next_ready_to_commit_T_9); // @[Mux.scala 101:16]
  reg  rollback_occured; // @[execute_unit.scala 290:35]
  reg  exception_occured; // @[execute_unit.scala 247:36]
  wire  _next_state_T_7 = exception_occured & _next_ready_to_commit_T_6; // @[execute_unit.scala 304:98]
  wire  _next_state_T_9 = state & next_ready_to_commit & (rollback_occured | exception_occured &
    _next_ready_to_commit_T_6); // @[execute_unit.scala 304:55]
  wire  _next_state_T_10 = _next_state_T_9 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_11 = _next_state_T_3 ? 1'h0 : _next_state_T_10; // @[Mux.scala 101:16]
  wire  _next_state_T_12 = _next_state_T_1 | _next_state_T_11; // @[Mux.scala 101:16]
  wire [1:0] next_state = {{1'd0}, _next_state_T_12}; // @[execute_unit.scala 236:26 300:16]
  wire  _T_2 = next_state == 2'h0; // @[execute_unit.scala 242:63]
  wire  _GEN_1 = io_i_exception & state | exception_occured; // @[execute_unit.scala 248:45 249:27 247:36]
  wire  _len_T_1 = uop_inst[13:12] == 2'h0; // @[execute_unit.scala 257:26]
  wire  _len_T_3 = uop_inst[13:12] == 2'h1; // @[execute_unit.scala 258:26]
  wire  _len_T_5 = uop_inst[13:12] == 2'h2; // @[execute_unit.scala 259:26]
  wire [3:0] _len_T_8 = _len_T_1 ? 4'h8 : 4'h0; // @[Mux.scala 101:16]
  wire [3:0] _len_T_9 = _len_T_5 ? 4'h4 : _len_T_8; // @[Mux.scala 101:16]
  wire [3:0] _len_T_10 = _len_T_3 ? 4'h2 : _len_T_9; // @[Mux.scala 101:16]
  wire [3:0] _len_T_11 = _len_T_1 ? 4'h1 : _len_T_10; // @[Mux.scala 101:16]
  wire [63:0] _addr_T_2 = uop_src1_value + uop_src2_value; // @[execute_unit.scala 266:54]
  wire [63:0] _addr_T_4 = uop_src1_value + uop_imm; // @[execute_unit.scala 266:84]
  wire  _next_rollback_occured_T_8 = io_i_rollback_rob_idx < uop_rob_idx & io_i_rollback_rob_idx[6] & ~uop_rob_idx[6]; // @[execute_unit.scala 297:84]
  wire  _next_rollback_occured_T_10 = io_i_rollback_valid & (io_i_rollback_rob_idx > uop_rob_idx |
    _next_rollback_occured_T_8); // @[execute_unit.scala 296:31]
  wire [1:0] _GEN_3 = reset ? 2'h0 : next_state; // @[execute_unit.scala 235:{24,24} 237:11]
  assign io_o_ex_res_pack_valid = next_ready_to_commit & ~rollback_occured & ~_next_state_T_7; // @[execute_unit.scala 312:73]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_dst_value = io_dcache_io_MdataIn; // @[execute_unit.scala 284:36]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 283:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 283:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 313:26]
  assign io_dcache_io_addr_valid = ~io_i_exception & (io_i_select & _next_ready_to_commit_T_6) |
    _next_ready_to_commit_T_2 & io_i_ROB_first_entry == uop_rob_idx; // @[execute_unit.scala 275:91]
  assign io_dcache_io_Mwout = uop_mem_type == 2'h1; // @[execute_unit.scala 278:40]
  assign io_dcache_io_Maddr = _next_ready_to_commit_T_6 ? _addr_T_2 : _addr_T_4; // @[execute_unit.scala 266:16]
  assign io_dcache_io_Men = ~(uop_mem_type == 2'h0); // @[execute_unit.scala 279:25]
  assign io_dcache_io_Mlen = {{28'd0}, _len_T_11}; // @[execute_unit.scala 255:19 256:9]
  assign io_dcache_io_MdataOut = uop_src2_value; // @[execute_unit.scala 281:27]
  assign io_o_lsu_uop_valid = state & _next_ready_to_commit_T_2; // @[execute_unit.scala 315:44]
  assign io_o_lsu_uop_rob_idx = {{1'd0}, uop_rob_idx}; // @[execute_unit.scala 316:26]
  always @(posedge clock) begin
    state <= _GEN_3[0]; // @[execute_unit.scala 235:{24,24} 237:11]
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_valid <= 1'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select_to_commit & ~io_i_select | next_state == 2'h0) begin // @[execute_unit.scala 242:75]
      uop_valid <= 1'h0; // @[execute_unit.scala 243:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_pc <= 32'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_inst <= 32'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_func_code <= 7'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_imm <= 64'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_imm <= io_i_uop_imm;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    if (reset) begin // @[execute_unit.scala 239:23]
      uop_mem_type <= 2'h0; // @[execute_unit.scala 239:23]
    end else if (io_i_select) begin // @[execute_unit.scala 241:20]
      uop_mem_type <= io_i_uop_mem_type;
    end
    if (reset) begin // @[execute_unit.scala 286:34]
      ready_to_commit <= 1'h0; // @[execute_unit.scala 286:34]
    end else begin
      ready_to_commit <= next_ready_to_commit; // @[execute_unit.scala 288:20]
    end
    if (reset) begin // @[execute_unit.scala 290:35]
      rollback_occured <= 1'h0; // @[execute_unit.scala 290:35]
    end else if (_T_2) begin // @[Mux.scala 101:16]
      rollback_occured <= 1'h0;
    end else begin
      rollback_occured <= _next_rollback_occured_T_10 | rollback_occured;
    end
    if (reset) begin // @[execute_unit.scala 247:36]
      exception_occured <= 1'h0; // @[execute_unit.scala 247:36]
    end else if (_T_2) begin // @[execute_unit.scala 251:32]
      exception_occured <= 1'h0; // @[execute_unit.scala 252:27]
    end else begin
      exception_occured <= _GEN_1;
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
  uop_phy_dst = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  uop_stale_dst = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  uop_arch_dst = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  uop_rob_idx = _RAND_8[6:0];
  _RAND_9 = {2{`RANDOM}};
  uop_imm = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  uop_src1_value = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  uop_src2_value = _RAND_11[63:0];
  _RAND_12 = {1{`RANDOM}};
  uop_alu_sel = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  uop_mem_type = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  ready_to_commit = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  rollback_occured = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  exception_occured = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
