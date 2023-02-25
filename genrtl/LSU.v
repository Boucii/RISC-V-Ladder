module LSU(
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
  input  [6:0]  io_i_uop_rob_idx,
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
  output [6:0]  io_o_ex_res_pack_uop_rob_idx,
  output [63:0] io_o_ex_res_pack_uop_imm,
  output [63:0] io_o_ex_res_pack_uop_dst_value,
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [63:0] io_o_ex_res_pack_uop_src2_value,
  output [2:0]  io_o_ex_res_pack_uop_op1_sel,
  output [2:0]  io_o_ex_res_pack_uop_op2_sel,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
  output [3:0]  io_o_ex_res_pack_uop_branch_type,
  output [1:0]  io_o_ex_res_pack_uop_mem_type,
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
  reg [63:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[execute_unit.scala 262:24]
  reg  uop_valid; // @[execute_unit.scala 266:23]
  reg [31:0] uop_pc; // @[execute_unit.scala 266:23]
  reg [31:0] uop_inst; // @[execute_unit.scala 266:23]
  reg [6:0] uop_func_code; // @[execute_unit.scala 266:23]
  reg  uop_branch_predict_pack_valid; // @[execute_unit.scala 266:23]
  reg [63:0] uop_branch_predict_pack_target; // @[execute_unit.scala 266:23]
  reg [3:0] uop_branch_predict_pack_branch_type; // @[execute_unit.scala 266:23]
  reg  uop_branch_predict_pack_select; // @[execute_unit.scala 266:23]
  reg  uop_branch_predict_pack_taken; // @[execute_unit.scala 266:23]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 266:23]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 266:23]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 266:23]
  reg [2:0] uop_inst_type; // @[execute_unit.scala 266:23]
  reg  uop_regWen; // @[execute_unit.scala 266:23]
  reg  uop_src1_valid; // @[execute_unit.scala 266:23]
  reg [6:0] uop_phy_rs1; // @[execute_unit.scala 266:23]
  reg [4:0] uop_arch_rs1; // @[execute_unit.scala 266:23]
  reg  uop_src2_valid; // @[execute_unit.scala 266:23]
  reg [6:0] uop_phy_rs2; // @[execute_unit.scala 266:23]
  reg [4:0] uop_arch_rs2; // @[execute_unit.scala 266:23]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 266:23]
  reg [63:0] uop_imm; // @[execute_unit.scala 266:23]
  reg [63:0] uop_dst_value; // @[execute_unit.scala 266:23]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 266:23]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 266:23]
  reg [2:0] uop_op1_sel; // @[execute_unit.scala 266:23]
  reg [2:0] uop_op2_sel; // @[execute_unit.scala 266:23]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 266:23]
  reg [3:0] uop_branch_type; // @[execute_unit.scala 266:23]
  reg [1:0] uop_mem_type; // @[execute_unit.scala 266:23]
  wire [1:0] next_uop_mem_type = io_i_select ? io_i_uop_mem_type : uop_mem_type; // @[execute_unit.scala 268:20]
  wire  _next_state_T = ~state; // @[execute_unit.scala 355:17]
  wire  _next_state_T_1 = ~state & io_i_select; // @[execute_unit.scala 355:29]
  wire  _next_state_T_3 = state & io_i_select_to_commit; // @[execute_unit.scala 356:29]
  wire  _next_ready_to_commit_T_2 = uop_mem_type == 2'h1; // @[execute_unit.scala 362:67]
  reg  addr_given; // @[execute_unit.scala 325:29]
  wire  _next_ready_to_commit_T_4 = state & io_dcache_io_addr_ready & uop_mem_type == 2'h1 & addr_given; // @[execute_unit.scala 362:76]
  wire  _next_ready_to_commit_T_7 = uop_mem_type == 2'h2; // @[execute_unit.scala 363:67]
  wire  _next_ready_to_commit_T_9 = state & io_dcache_io_data_valid & uop_mem_type == 2'h2 & addr_given; // @[execute_unit.scala 363:76]
  reg  ready_to_commit; // @[execute_unit.scala 340:34]
  wire  _next_ready_to_commit_T_11 = _next_state_T ? 1'h0 : ready_to_commit; // @[Mux.scala 101:16]
  wire  next_ready_to_commit = _next_ready_to_commit_T_4 | (_next_ready_to_commit_T_9 | _next_ready_to_commit_T_11); // @[Mux.scala 101:16]
  reg  rollback_occured; // @[execute_unit.scala 344:35]
  reg  exception_occured; // @[execute_unit.scala 275:36]
  wire  _next_state_T_7 = exception_occured & _next_ready_to_commit_T_7; // @[execute_unit.scala 358:98]
  wire  _next_state_T_9 = state & next_ready_to_commit & (rollback_occured | exception_occured &
    _next_ready_to_commit_T_7); // @[execute_unit.scala 358:55]
  wire  _next_state_T_10 = _next_state_T_9 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_11 = _next_state_T_3 ? 1'h0 : _next_state_T_10; // @[Mux.scala 101:16]
  wire  _next_state_T_12 = _next_state_T_1 | _next_state_T_11; // @[Mux.scala 101:16]
  wire [1:0] next_state = {{1'd0}, _next_state_T_12}; // @[execute_unit.scala 263:26 354:16]
  wire  _T_2 = next_state == 2'h0; // @[execute_unit.scala 269:63]
  wire  _GEN_1 = io_i_exception & state | exception_occured; // @[execute_unit.scala 276:45 277:27 275:36]
  wire  _len_T_1 = uop_inst[13:12] == 2'h0; // @[execute_unit.scala 285:26]
  wire  _len_T_3 = uop_inst[13:12] == 2'h1; // @[execute_unit.scala 286:26]
  wire  _len_T_5 = uop_inst[13:12] == 2'h2; // @[execute_unit.scala 287:26]
  wire  _len_T_7 = uop_inst[13:12] == 2'h3; // @[execute_unit.scala 288:26]
  wire [3:0] _len_T_8 = _len_T_7 ? 4'h8 : 4'h0; // @[Mux.scala 101:16]
  wire [3:0] _len_T_9 = _len_T_5 ? 4'h4 : _len_T_8; // @[Mux.scala 101:16]
  wire [3:0] _len_T_10 = _len_T_3 ? 4'h2 : _len_T_9; // @[Mux.scala 101:16]
  wire [3:0] _len_T_11 = _len_T_1 ? 4'h1 : _len_T_10; // @[Mux.scala 101:16]
  wire  loadu = uop_inst[14]; // @[execute_unit.scala 291:23]
  wire [63:0] _addr_T_2 = uop_src1_value + uop_src2_value; // @[execute_unit.scala 294:54]
  wire [63:0] _addr_T_4 = uop_src1_value + uop_imm; // @[execute_unit.scala 294:84]
  wire [31:0] len = {{28'd0}, _len_T_11}; // @[execute_unit.scala 283:19 284:9]
  wire  _io_o_ex_res_pack_uop_dst_value_T = len == 32'h1; // @[execute_unit.scala 299:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_2 = loadu & len == 32'h1 & io_dcache_io_data_valid; // @[execute_unit.scala 299:29]
  wire  _io_o_ex_res_pack_uop_dst_value_T_4 = len == 32'h2; // @[execute_unit.scala 300:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_6 = loadu & len == 32'h2 & io_dcache_io_data_valid; // @[execute_unit.scala 300:29]
  wire  _io_o_ex_res_pack_uop_dst_value_T_8 = len == 32'h4; // @[execute_unit.scala 301:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_10 = loadu & len == 32'h4 & io_dcache_io_data_valid; // @[execute_unit.scala 301:29]
  wire  _io_o_ex_res_pack_uop_dst_value_T_12 = len == 32'h8; // @[execute_unit.scala 302:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_14 = loadu & len == 32'h8 & io_dcache_io_data_valid; // @[execute_unit.scala 302:29]
  wire  _io_o_ex_res_pack_uop_dst_value_T_15 = ~loadu; // @[execute_unit.scala 304:10]
  wire  _io_o_ex_res_pack_uop_dst_value_T_18 = ~loadu & _io_o_ex_res_pack_uop_dst_value_T & io_dcache_io_data_valid; // @[execute_unit.scala 304:30]
  wire [55:0] _io_o_ex_res_pack_uop_dst_value_T_23 = {48'hffffffffffff,io_dcache_io_MdataIn[7:0]}; // @[Cat.scala 33:92]
  wire [55:0] _io_o_ex_res_pack_uop_dst_value_T_24 = ~io_dcache_io_MdataIn[7] ? {{48'd0}, io_dcache_io_MdataIn[7:0]} :
    _io_o_ex_res_pack_uop_dst_value_T_23; // @[execute_unit.scala 304:64]
  wire  _io_o_ex_res_pack_uop_dst_value_T_28 = _io_o_ex_res_pack_uop_dst_value_T_15 &
    _io_o_ex_res_pack_uop_dst_value_T_4 & io_dcache_io_data_valid; // @[execute_unit.scala 305:30]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_33 = {48'hffffffffffff,io_dcache_io_MdataIn[15:0]}; // @[Cat.scala 33:92]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_34 = ~io_dcache_io_MdataIn[15] ? {{48'd0}, io_dcache_io_MdataIn[15:0]}
     : _io_o_ex_res_pack_uop_dst_value_T_33; // @[execute_unit.scala 305:64]
  wire  _io_o_ex_res_pack_uop_dst_value_T_38 = _io_o_ex_res_pack_uop_dst_value_T_15 &
    _io_o_ex_res_pack_uop_dst_value_T_8 & io_dcache_io_data_valid; // @[execute_unit.scala 306:30]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_43 = {32'hffffffff,io_dcache_io_MdataIn[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_44 = ~io_dcache_io_MdataIn[31] ? {{32'd0}, io_dcache_io_MdataIn[31:0]}
     : _io_o_ex_res_pack_uop_dst_value_T_43; // @[execute_unit.scala 306:64]
  wire  _io_o_ex_res_pack_uop_dst_value_T_48 = _io_o_ex_res_pack_uop_dst_value_T_15 &
    _io_o_ex_res_pack_uop_dst_value_T_12 & io_dcache_io_data_valid; // @[execute_unit.scala 307:30]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_49 = _io_o_ex_res_pack_uop_dst_value_T_48 ? io_dcache_io_MdataIn :
    uop_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_50 = _io_o_ex_res_pack_uop_dst_value_T_38 ?
    _io_o_ex_res_pack_uop_dst_value_T_44 : _io_o_ex_res_pack_uop_dst_value_T_49; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_51 = _io_o_ex_res_pack_uop_dst_value_T_28 ?
    _io_o_ex_res_pack_uop_dst_value_T_34 : _io_o_ex_res_pack_uop_dst_value_T_50; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_52 = _io_o_ex_res_pack_uop_dst_value_T_18 ? {{8'd0},
    _io_o_ex_res_pack_uop_dst_value_T_24} : _io_o_ex_res_pack_uop_dst_value_T_51; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_53 = _io_o_ex_res_pack_uop_dst_value_T_14 ? io_dcache_io_MdataIn :
    _io_o_ex_res_pack_uop_dst_value_T_52; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_54 = _io_o_ex_res_pack_uop_dst_value_T_10 ? {{32'd0},
    io_dcache_io_MdataIn[31:0]} : _io_o_ex_res_pack_uop_dst_value_T_53; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_55 = _io_o_ex_res_pack_uop_dst_value_T_6 ? {{48'd0},
    io_dcache_io_MdataIn[15:0]} : _io_o_ex_res_pack_uop_dst_value_T_54; // @[Mux.scala 101:16]
  wire  _addr_given_T_1 = io_dcache_io_addr_valid & ~io_i_select_to_commit; // @[execute_unit.scala 327:34]
  wire  _addr_given_T_3 = _T_2 ? 1'h0 : addr_given; // @[Mux.scala 101:16]
  wire  _addr_given_T_4 = _addr_given_T_1 | _addr_given_T_3; // @[Mux.scala 101:16]
  wire  _next_rollback_occured_T_14 = io_i_rollback_rob_idx[5:0] > uop_rob_idx[5:0] & (io_i_rollback_rob_idx[6] ^
    uop_rob_idx[6]); // @[execute_unit.scala 351:60]
  wire  _next_rollback_occured_T_16 = io_i_rollback_valid & (io_i_rollback_rob_idx[5:0] < uop_rob_idx[5:0] &
    io_i_rollback_rob_idx[6] == uop_rob_idx[6] | _next_rollback_occured_T_14); // @[execute_unit.scala 350:30]
  wire [1:0] _GEN_3 = reset ? 2'h0 : next_state; // @[execute_unit.scala 262:{24,24} 264:11]
  assign io_o_ex_res_pack_valid = next_ready_to_commit & ~rollback_occured & ~_next_state_T_7; // @[execute_unit.scala 366:73]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_valid = uop_branch_predict_pack_valid; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_target = uop_branch_predict_pack_target; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_branch_type = uop_branch_predict_pack_branch_type; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_select = uop_branch_predict_pack_select; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_branch_predict_pack_taken = uop_branch_predict_pack_taken; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_inst_type = uop_inst_type; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_regWen = uop_regWen; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_src1_valid = uop_src1_valid; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_phy_rs1 = uop_phy_rs1; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_arch_rs1 = uop_arch_rs1; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_src2_valid = uop_src2_valid; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_phy_rs2 = uop_phy_rs2; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_arch_rs2 = uop_arch_rs2; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_imm = uop_imm; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_dst_value = _io_o_ex_res_pack_uop_dst_value_T_2 ? {{56'd0}, io_dcache_io_MdataIn[7:0]} :
    _io_o_ex_res_pack_uop_dst_value_T_55; // @[Mux.scala 101:16]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_src2_value = uop_src2_value; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_op1_sel = uop_op1_sel; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_op2_sel = uop_op2_sel; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_branch_type = uop_branch_type; // @[execute_unit.scala 273:26]
  assign io_o_ex_res_pack_uop_mem_type = uop_mem_type; // @[execute_unit.scala 273:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 367:26]
  assign io_dcache_io_addr_valid = uop_valid & ~addr_given & next_uop_mem_type == 2'h2 | uop_valid & ~addr_given &
    _next_ready_to_commit_T_2 & io_i_ROB_first_entry == uop_rob_idx; // @[execute_unit.scala 331:90]
  assign io_dcache_io_Mwout = uop_mem_type == 2'h1; // @[execute_unit.scala 334:40]
  assign io_dcache_io_Maddr = _next_ready_to_commit_T_7 ? _addr_T_2 : _addr_T_4; // @[execute_unit.scala 294:16]
  assign io_dcache_io_Men = ~(uop_mem_type == 2'h0); // @[execute_unit.scala 335:25]
  assign io_dcache_io_Mlen = {{28'd0}, _len_T_11}; // @[execute_unit.scala 283:19 284:9]
  assign io_dcache_io_MdataOut = uop_src2_value; // @[execute_unit.scala 337:27]
  assign io_o_lsu_uop_valid = state & _next_ready_to_commit_T_2; // @[execute_unit.scala 369:44]
  assign io_o_lsu_uop_rob_idx = {{1'd0}, uop_rob_idx}; // @[execute_unit.scala 370:26]
  always @(posedge clock) begin
    state <= _GEN_3[0]; // @[execute_unit.scala 262:{24,24} 264:11]
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_valid <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select_to_commit & ~io_i_select | next_state == 2'h0) begin // @[execute_unit.scala 269:75]
      uop_valid <= 1'h0; // @[execute_unit.scala 270:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_pc <= 32'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_inst <= 32'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_func_code <= 7'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_branch_predict_pack_valid <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_branch_predict_pack_valid <= io_i_uop_branch_predict_pack_valid;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_branch_predict_pack_target <= 64'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_branch_predict_pack_target <= io_i_uop_branch_predict_pack_target;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_branch_predict_pack_branch_type <= 4'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_branch_predict_pack_branch_type <= io_i_uop_branch_predict_pack_branch_type;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_branch_predict_pack_select <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_branch_predict_pack_select <= io_i_uop_branch_predict_pack_select;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_branch_predict_pack_taken <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_branch_predict_pack_taken <= io_i_uop_branch_predict_pack_taken;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_inst_type <= 3'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_inst_type <= io_i_uop_inst_type;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_regWen <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_regWen <= io_i_uop_regWen;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_src1_valid <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_src1_valid <= io_i_uop_src1_valid;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_phy_rs1 <= 7'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_phy_rs1 <= io_i_uop_phy_rs1;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_arch_rs1 <= 5'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_arch_rs1 <= io_i_uop_arch_rs1;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_src2_valid <= 1'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_src2_valid <= io_i_uop_src2_valid;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_phy_rs2 <= 7'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_phy_rs2 <= io_i_uop_phy_rs2;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_arch_rs2 <= 5'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_arch_rs2 <= io_i_uop_arch_rs2;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_imm <= 64'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_imm <= io_i_uop_imm;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_dst_value <= 64'h0; // @[execute_unit.scala 266:23]
    end else if (_io_o_ex_res_pack_uop_dst_value_T_2) begin // @[Mux.scala 101:16]
      uop_dst_value <= {{56'd0}, io_dcache_io_MdataIn[7:0]};
    end else if (_io_o_ex_res_pack_uop_dst_value_T_6) begin // @[Mux.scala 101:16]
      uop_dst_value <= {{48'd0}, io_dcache_io_MdataIn[15:0]};
    end else if (_io_o_ex_res_pack_uop_dst_value_T_10) begin // @[Mux.scala 101:16]
      uop_dst_value <= {{32'd0}, io_dcache_io_MdataIn[31:0]};
    end else begin
      uop_dst_value <= _io_o_ex_res_pack_uop_dst_value_T_53;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_op1_sel <= 3'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_op1_sel <= io_i_uop_op1_sel;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_op2_sel <= 3'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_op2_sel <= io_i_uop_op2_sel;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_branch_type <= 4'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_branch_type <= io_i_uop_branch_type;
    end
    if (reset) begin // @[execute_unit.scala 266:23]
      uop_mem_type <= 2'h0; // @[execute_unit.scala 266:23]
    end else if (io_i_select) begin // @[execute_unit.scala 268:20]
      uop_mem_type <= io_i_uop_mem_type;
    end
    if (reset) begin // @[execute_unit.scala 325:29]
      addr_given <= 1'h0; // @[execute_unit.scala 325:29]
    end else begin
      addr_given <= _addr_given_T_4; // @[execute_unit.scala 326:16]
    end
    if (reset) begin // @[execute_unit.scala 340:34]
      ready_to_commit <= 1'h0; // @[execute_unit.scala 340:34]
    end else begin
      ready_to_commit <= next_ready_to_commit; // @[execute_unit.scala 342:20]
    end
    if (reset) begin // @[execute_unit.scala 344:35]
      rollback_occured <= 1'h0; // @[execute_unit.scala 344:35]
    end else if (_T_2) begin // @[Mux.scala 101:16]
      rollback_occured <= 1'h0;
    end else begin
      rollback_occured <= _next_rollback_occured_T_16 | rollback_occured;
    end
    if (reset) begin // @[execute_unit.scala 275:36]
      exception_occured <= 1'h0; // @[execute_unit.scala 275:36]
    end else if (_T_2) begin // @[execute_unit.scala 279:32]
      exception_occured <= 1'h0; // @[execute_unit.scala 280:27]
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
  uop_dst_value = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  uop_src1_value = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  uop_src2_value = _RAND_25[63:0];
  _RAND_26 = {1{`RANDOM}};
  uop_op1_sel = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  uop_op2_sel = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  uop_alu_sel = _RAND_28[4:0];
  _RAND_29 = {1{`RANDOM}};
  uop_branch_type = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  uop_mem_type = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  addr_given = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  ready_to_commit = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  rollback_occured = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  exception_occured = _RAND_34[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
