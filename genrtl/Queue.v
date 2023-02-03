module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_valids_0,
  input         io_enq_bits_valids_1,
  input  [63:0] io_enq_bits_pc,
  input  [31:0] io_enq_bits_insts_0,
  input  [31:0] io_enq_bits_insts_1,
  input         io_enq_bits_branch_predict_pack_valid,
  input  [63:0] io_enq_bits_branch_predict_pack_target,
  input         io_enq_bits_branch_predict_pack_taken,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_valids_0,
  output        io_deq_bits_valids_1,
  output [63:0] io_deq_bits_pc,
  output [31:0] io_deq_bits_insts_0,
  output [31:0] io_deq_bits_insts_1,
  output        io_deq_bits_branch_predict_pack_valid,
  output [63:0] io_deq_bits_branch_predict_pack_target,
  output [3:0]  io_deq_bits_branch_predict_pack_branch_type,
  output        io_deq_bits_branch_predict_pack_select,
  output        io_deq_bits_branch_predict_pack_taken
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg  ram_valids_0 [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_valids_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_valids_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_valids_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_valids_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_valids_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_valids_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_valids_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_valids_1 [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_valids_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_valids_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_valids_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_valids_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_valids_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_valids_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_valids_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [63:0] ram_pc [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_pc_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_pc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_pc_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_pc_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_pc_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_pc_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_insts_0 [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_insts_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_insts_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_insts_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_insts_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_insts_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_insts_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_insts_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_insts_1 [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_insts_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_insts_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_insts_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_insts_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_insts_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_insts_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_insts_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_branch_predict_pack_valid [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_valid_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_valid_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_valid_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_valid_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_valid_MPORT_en; // @[Decoupled.scala 275:95]
  reg [63:0] ram_branch_predict_pack_target [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_target_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_target_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_branch_predict_pack_target_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_branch_predict_pack_target_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_target_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_target_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_target_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] ram_branch_predict_pack_branch_type [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [3:0] ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_branch_predict_pack_branch_type_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_branch_type_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_branch_type_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_branch_type_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_branch_predict_pack_select [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_select_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_select_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_select_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_select_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_select_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_select_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_select_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_branch_predict_pack_taken [0:63]; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_taken_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_taken_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_branch_predict_pack_taken_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_taken_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_branch_predict_pack_taken_MPORT_en; // @[Decoupled.scala 275:95]
  reg [5:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [5:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [5:0] _value_T_1 = enq_ptr_value + 6'h1; // @[Counter.scala 77:24]
  wire [5:0] _value_T_3 = deq_ptr_value + 6'h1; // @[Counter.scala 77:24]
  assign ram_valids_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_valids_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_valids_0_io_deq_bits_MPORT_data = ram_valids_0[ram_valids_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_valids_0_MPORT_data = io_enq_bits_valids_0;
  assign ram_valids_0_MPORT_addr = enq_ptr_value;
  assign ram_valids_0_MPORT_mask = 1'h1;
  assign ram_valids_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_valids_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_valids_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_valids_1_io_deq_bits_MPORT_data = ram_valids_1[ram_valids_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_valids_1_MPORT_data = io_enq_bits_valids_1;
  assign ram_valids_1_MPORT_addr = enq_ptr_value;
  assign ram_valids_1_MPORT_mask = 1'h1;
  assign ram_valids_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_pc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_pc_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_pc_io_deq_bits_MPORT_data = ram_pc[ram_pc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_pc_MPORT_data = io_enq_bits_pc;
  assign ram_pc_MPORT_addr = enq_ptr_value;
  assign ram_pc_MPORT_mask = 1'h1;
  assign ram_pc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_insts_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_insts_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_insts_0_io_deq_bits_MPORT_data = ram_insts_0[ram_insts_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_insts_0_MPORT_data = io_enq_bits_insts_0;
  assign ram_insts_0_MPORT_addr = enq_ptr_value;
  assign ram_insts_0_MPORT_mask = 1'h1;
  assign ram_insts_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_insts_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_insts_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_insts_1_io_deq_bits_MPORT_data = ram_insts_1[ram_insts_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_insts_1_MPORT_data = io_enq_bits_insts_1;
  assign ram_insts_1_MPORT_addr = enq_ptr_value;
  assign ram_insts_1_MPORT_mask = 1'h1;
  assign ram_insts_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_branch_predict_pack_valid_io_deq_bits_MPORT_en = 1'h1;
  assign ram_branch_predict_pack_valid_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_branch_predict_pack_valid_io_deq_bits_MPORT_data =
    ram_branch_predict_pack_valid[ram_branch_predict_pack_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_branch_predict_pack_valid_MPORT_data = io_enq_bits_branch_predict_pack_valid;
  assign ram_branch_predict_pack_valid_MPORT_addr = enq_ptr_value;
  assign ram_branch_predict_pack_valid_MPORT_mask = 1'h1;
  assign ram_branch_predict_pack_valid_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_branch_predict_pack_target_io_deq_bits_MPORT_en = 1'h1;
  assign ram_branch_predict_pack_target_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_branch_predict_pack_target_io_deq_bits_MPORT_data =
    ram_branch_predict_pack_target[ram_branch_predict_pack_target_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_branch_predict_pack_target_MPORT_data = io_enq_bits_branch_predict_pack_target;
  assign ram_branch_predict_pack_target_MPORT_addr = enq_ptr_value;
  assign ram_branch_predict_pack_target_MPORT_mask = 1'h1;
  assign ram_branch_predict_pack_target_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_en = 1'h1;
  assign ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_data =
    ram_branch_predict_pack_branch_type[ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_branch_predict_pack_branch_type_MPORT_data = 4'h0;
  assign ram_branch_predict_pack_branch_type_MPORT_addr = enq_ptr_value;
  assign ram_branch_predict_pack_branch_type_MPORT_mask = 1'h1;
  assign ram_branch_predict_pack_branch_type_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_branch_predict_pack_select_io_deq_bits_MPORT_en = 1'h1;
  assign ram_branch_predict_pack_select_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_branch_predict_pack_select_io_deq_bits_MPORT_data =
    ram_branch_predict_pack_select[ram_branch_predict_pack_select_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_branch_predict_pack_select_MPORT_data = 1'h0;
  assign ram_branch_predict_pack_select_MPORT_addr = enq_ptr_value;
  assign ram_branch_predict_pack_select_MPORT_mask = 1'h1;
  assign ram_branch_predict_pack_select_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_branch_predict_pack_taken_io_deq_bits_MPORT_en = 1'h1;
  assign ram_branch_predict_pack_taken_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_branch_predict_pack_taken_io_deq_bits_MPORT_data =
    ram_branch_predict_pack_taken[ram_branch_predict_pack_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_branch_predict_pack_taken_MPORT_data = io_enq_bits_branch_predict_pack_taken;
  assign ram_branch_predict_pack_taken_MPORT_addr = enq_ptr_value;
  assign ram_branch_predict_pack_taken_MPORT_mask = 1'h1;
  assign ram_branch_predict_pack_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_valids_0 = ram_valids_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_valids_1 = ram_valids_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_pc = ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_insts_0 = ram_insts_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_insts_1 = ram_insts_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_branch_predict_pack_valid = ram_branch_predict_pack_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_branch_predict_pack_target = ram_branch_predict_pack_target_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_branch_predict_pack_branch_type = ram_branch_predict_pack_branch_type_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_branch_predict_pack_select = ram_branch_predict_pack_select_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_branch_predict_pack_taken = ram_branch_predict_pack_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_valids_0_MPORT_en & ram_valids_0_MPORT_mask) begin
      ram_valids_0[ram_valids_0_MPORT_addr] <= ram_valids_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_valids_1_MPORT_en & ram_valids_1_MPORT_mask) begin
      ram_valids_1[ram_valids_1_MPORT_addr] <= ram_valids_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_pc_MPORT_en & ram_pc_MPORT_mask) begin
      ram_pc[ram_pc_MPORT_addr] <= ram_pc_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_insts_0_MPORT_en & ram_insts_0_MPORT_mask) begin
      ram_insts_0[ram_insts_0_MPORT_addr] <= ram_insts_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_insts_1_MPORT_en & ram_insts_1_MPORT_mask) begin
      ram_insts_1[ram_insts_1_MPORT_addr] <= ram_insts_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_branch_predict_pack_valid_MPORT_en & ram_branch_predict_pack_valid_MPORT_mask) begin
      ram_branch_predict_pack_valid[ram_branch_predict_pack_valid_MPORT_addr] <=
        ram_branch_predict_pack_valid_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_branch_predict_pack_target_MPORT_en & ram_branch_predict_pack_target_MPORT_mask) begin
      ram_branch_predict_pack_target[ram_branch_predict_pack_target_MPORT_addr] <=
        ram_branch_predict_pack_target_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_branch_predict_pack_branch_type_MPORT_en & ram_branch_predict_pack_branch_type_MPORT_mask) begin
      ram_branch_predict_pack_branch_type[ram_branch_predict_pack_branch_type_MPORT_addr] <=
        ram_branch_predict_pack_branch_type_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_branch_predict_pack_select_MPORT_en & ram_branch_predict_pack_select_MPORT_mask) begin
      ram_branch_predict_pack_select[ram_branch_predict_pack_select_MPORT_addr] <=
        ram_branch_predict_pack_select_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_branch_predict_pack_taken_MPORT_en & ram_branch_predict_pack_taken_MPORT_mask) begin
      ram_branch_predict_pack_taken[ram_branch_predict_pack_taken_MPORT_addr] <=
        ram_branch_predict_pack_taken_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 6'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 6'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_valids_0[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_valids_1[initvar] = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_pc[initvar] = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_insts_0[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_insts_1[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_branch_predict_pack_valid[initvar] = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_branch_predict_pack_target[initvar] = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_branch_predict_pack_branch_type[initvar] = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_branch_predict_pack_select[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_branch_predict_pack_taken[initvar] = _RAND_9[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  enq_ptr_value = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  deq_ptr_value = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  maybe_full = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
