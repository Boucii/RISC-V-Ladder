module Fetch_Queue(
  input         clock,
  input         reset,
  input         io_in_valid,
  input         io_in_bits_valids_0,
  input         io_in_bits_valids_1,
  input  [63:0] io_in_bits_pc,
  input  [31:0] io_in_bits_insts_0,
  input  [31:0] io_in_bits_insts_1,
  input         io_in_bits_branch_predict_pack_valid,
  input  [63:0] io_in_bits_branch_predict_pack_target,
  input  [3:0]  io_in_bits_branch_predict_pack_branch_type,
  input         io_in_bits_branch_predict_pack_select,
  input         io_in_bits_branch_predict_pack_taken,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_valids_0,
  output        io_out_bits_valids_1,
  output [63:0] io_out_bits_pc,
  output [31:0] io_out_bits_insts_0,
  output [31:0] io_out_bits_insts_1,
  output        io_out_bits_branch_predict_pack_valid,
  output [63:0] io_out_bits_branch_predict_pack_target,
  output [3:0]  io_out_bits_branch_predict_pack_branch_type,
  output        io_out_bits_branch_predict_pack_select,
  output        io_out_bits_branch_predict_pack_taken,
  output        io_full,
  input         io_i_flush
);
  wire  queue_clock; // @[fetch_queue.scala 19:21]
  wire  queue_reset; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_ready; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_valid; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_bits_valids_0; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_bits_valids_1; // @[fetch_queue.scala 19:21]
  wire [63:0] queue_io_enq_bits_pc; // @[fetch_queue.scala 19:21]
  wire [31:0] queue_io_enq_bits_insts_0; // @[fetch_queue.scala 19:21]
  wire [31:0] queue_io_enq_bits_insts_1; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_bits_branch_predict_pack_valid; // @[fetch_queue.scala 19:21]
  wire [63:0] queue_io_enq_bits_branch_predict_pack_target; // @[fetch_queue.scala 19:21]
  wire [3:0] queue_io_enq_bits_branch_predict_pack_branch_type; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_bits_branch_predict_pack_select; // @[fetch_queue.scala 19:21]
  wire  queue_io_enq_bits_branch_predict_pack_taken; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_ready; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_valid; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_bits_valids_0; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_bits_valids_1; // @[fetch_queue.scala 19:21]
  wire [63:0] queue_io_deq_bits_pc; // @[fetch_queue.scala 19:21]
  wire [31:0] queue_io_deq_bits_insts_0; // @[fetch_queue.scala 19:21]
  wire [31:0] queue_io_deq_bits_insts_1; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_bits_branch_predict_pack_valid; // @[fetch_queue.scala 19:21]
  wire [63:0] queue_io_deq_bits_branch_predict_pack_target; // @[fetch_queue.scala 19:21]
  wire [3:0] queue_io_deq_bits_branch_predict_pack_branch_type; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_bits_branch_predict_pack_select; // @[fetch_queue.scala 19:21]
  wire  queue_io_deq_bits_branch_predict_pack_taken; // @[fetch_queue.scala 19:21]
  Queue queue ( // @[fetch_queue.scala 19:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_valids_0(queue_io_enq_bits_valids_0),
    .io_enq_bits_valids_1(queue_io_enq_bits_valids_1),
    .io_enq_bits_pc(queue_io_enq_bits_pc),
    .io_enq_bits_insts_0(queue_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(queue_io_enq_bits_insts_1),
    .io_enq_bits_branch_predict_pack_valid(queue_io_enq_bits_branch_predict_pack_valid),
    .io_enq_bits_branch_predict_pack_target(queue_io_enq_bits_branch_predict_pack_target),
    .io_enq_bits_branch_predict_pack_branch_type(queue_io_enq_bits_branch_predict_pack_branch_type),
    .io_enq_bits_branch_predict_pack_select(queue_io_enq_bits_branch_predict_pack_select),
    .io_enq_bits_branch_predict_pack_taken(queue_io_enq_bits_branch_predict_pack_taken),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_valids_0(queue_io_deq_bits_valids_0),
    .io_deq_bits_valids_1(queue_io_deq_bits_valids_1),
    .io_deq_bits_pc(queue_io_deq_bits_pc),
    .io_deq_bits_insts_0(queue_io_deq_bits_insts_0),
    .io_deq_bits_insts_1(queue_io_deq_bits_insts_1),
    .io_deq_bits_branch_predict_pack_valid(queue_io_deq_bits_branch_predict_pack_valid),
    .io_deq_bits_branch_predict_pack_target(queue_io_deq_bits_branch_predict_pack_target),
    .io_deq_bits_branch_predict_pack_branch_type(queue_io_deq_bits_branch_predict_pack_branch_type),
    .io_deq_bits_branch_predict_pack_select(queue_io_deq_bits_branch_predict_pack_select),
    .io_deq_bits_branch_predict_pack_taken(queue_io_deq_bits_branch_predict_pack_taken)
  );
  assign io_out_valid = queue_io_deq_valid & ~queue_reset; // @[fetch_queue.scala 25:38]
  assign io_out_bits_valids_0 = queue_io_deq_bits_valids_0; // @[fetch_queue.scala 24:15]
  assign io_out_bits_valids_1 = queue_io_deq_bits_valids_1; // @[fetch_queue.scala 24:15]
  assign io_out_bits_pc = queue_io_deq_bits_pc; // @[fetch_queue.scala 24:15]
  assign io_out_bits_insts_0 = queue_io_deq_bits_insts_0; // @[fetch_queue.scala 24:15]
  assign io_out_bits_insts_1 = queue_io_deq_bits_insts_1; // @[fetch_queue.scala 24:15]
  assign io_out_bits_branch_predict_pack_valid = queue_io_deq_bits_branch_predict_pack_valid; // @[fetch_queue.scala 24:15]
  assign io_out_bits_branch_predict_pack_target = queue_io_deq_bits_branch_predict_pack_target; // @[fetch_queue.scala 24:15]
  assign io_out_bits_branch_predict_pack_branch_type = queue_io_deq_bits_branch_predict_pack_branch_type; // @[fetch_queue.scala 24:15]
  assign io_out_bits_branch_predict_pack_select = queue_io_deq_bits_branch_predict_pack_select; // @[fetch_queue.scala 24:15]
  assign io_out_bits_branch_predict_pack_taken = queue_io_deq_bits_branch_predict_pack_taken; // @[fetch_queue.scala 24:15]
  assign io_full = ~queue_io_enq_ready; // @[fetch_queue.scala 28:14]
  assign queue_clock = clock;
  assign queue_reset = reset | io_i_flush; // @[fetch_queue.scala 20:32]
  assign queue_io_enq_valid = io_in_valid; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_valids_0 = io_in_bits_valids_0; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_valids_1 = io_in_bits_valids_1; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_pc = io_in_bits_pc; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_insts_0 = io_in_bits_insts_0; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_insts_1 = io_in_bits_insts_1; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_branch_predict_pack_valid = io_in_bits_branch_predict_pack_valid; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_branch_predict_pack_target = io_in_bits_branch_predict_pack_target; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_branch_predict_pack_branch_type = io_in_bits_branch_predict_pack_branch_type; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_branch_predict_pack_select = io_in_bits_branch_predict_pack_select; // @[fetch_queue.scala 21:16]
  assign queue_io_enq_bits_branch_predict_pack_taken = io_in_bits_branch_predict_pack_taken; // @[fetch_queue.scala 21:16]
  assign queue_io_deq_ready = io_out_ready; // @[fetch_queue.scala 26:22]
endmodule
