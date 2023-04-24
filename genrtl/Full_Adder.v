module Full_Adder(
  input   io_i_a,
  input   io_i_b,
  input   io_i_cin,
  output  io_o_s,
  output  io_o_cout
);
  assign io_o_s = io_i_a ^ io_i_b ^ io_i_cin; // @[wallace_tree.scala 23:31]
  assign io_o_cout = io_i_a & io_i_b | io_i_a & io_i_cin | io_i_b & io_i_cin; // @[wallace_tree.scala 24:58]
endmodule
