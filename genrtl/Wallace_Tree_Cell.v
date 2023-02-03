module Wallace_Tree_Cell(
  input  [18:0] io_i_inter_c,
  input  [21:0] io_i_s,
  output [18:0] io_o_inter_c,
  output        io_o_c,
  output        io_o_s
);
  wire  adder_level0_0_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_0_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_0_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_0_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_0_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level0_1_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_1_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_1_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_1_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_1_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level0_2_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_2_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_2_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_2_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_2_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level0_3_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_3_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_3_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_3_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_3_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level0_4_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_4_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_4_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_4_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_4_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level0_5_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_5_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_5_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_5_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_5_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level0_6_io_i_a; // @[wallace_tree.scala 34:42]
  wire  adder_level0_6_io_i_b; // @[wallace_tree.scala 34:42]
  wire  adder_level0_6_io_i_cin; // @[wallace_tree.scala 34:42]
  wire  adder_level0_6_io_o_s; // @[wallace_tree.scala 34:42]
  wire  adder_level0_6_io_o_cout; // @[wallace_tree.scala 34:42]
  wire  adder_level1_0_io_i_a; // @[wallace_tree.scala 35:42]
  wire  adder_level1_0_io_i_b; // @[wallace_tree.scala 35:42]
  wire  adder_level1_0_io_i_cin; // @[wallace_tree.scala 35:42]
  wire  adder_level1_0_io_o_s; // @[wallace_tree.scala 35:42]
  wire  adder_level1_0_io_o_cout; // @[wallace_tree.scala 35:42]
  wire  adder_level1_1_io_i_a; // @[wallace_tree.scala 35:42]
  wire  adder_level1_1_io_i_b; // @[wallace_tree.scala 35:42]
  wire  adder_level1_1_io_i_cin; // @[wallace_tree.scala 35:42]
  wire  adder_level1_1_io_o_s; // @[wallace_tree.scala 35:42]
  wire  adder_level1_1_io_o_cout; // @[wallace_tree.scala 35:42]
  wire  adder_level1_2_io_i_a; // @[wallace_tree.scala 35:42]
  wire  adder_level1_2_io_i_b; // @[wallace_tree.scala 35:42]
  wire  adder_level1_2_io_i_cin; // @[wallace_tree.scala 35:42]
  wire  adder_level1_2_io_o_s; // @[wallace_tree.scala 35:42]
  wire  adder_level1_2_io_o_cout; // @[wallace_tree.scala 35:42]
  wire  adder_level1_3_io_i_a; // @[wallace_tree.scala 35:42]
  wire  adder_level1_3_io_i_b; // @[wallace_tree.scala 35:42]
  wire  adder_level1_3_io_i_cin; // @[wallace_tree.scala 35:42]
  wire  adder_level1_3_io_o_s; // @[wallace_tree.scala 35:42]
  wire  adder_level1_3_io_o_cout; // @[wallace_tree.scala 35:42]
  wire  adder_level2_0_io_i_a; // @[wallace_tree.scala 36:42]
  wire  adder_level2_0_io_i_b; // @[wallace_tree.scala 36:42]
  wire  adder_level2_0_io_i_cin; // @[wallace_tree.scala 36:42]
  wire  adder_level2_0_io_o_s; // @[wallace_tree.scala 36:42]
  wire  adder_level2_0_io_o_cout; // @[wallace_tree.scala 36:42]
  wire  adder_level2_1_io_i_a; // @[wallace_tree.scala 36:42]
  wire  adder_level2_1_io_i_b; // @[wallace_tree.scala 36:42]
  wire  adder_level2_1_io_i_cin; // @[wallace_tree.scala 36:42]
  wire  adder_level2_1_io_o_s; // @[wallace_tree.scala 36:42]
  wire  adder_level2_1_io_o_cout; // @[wallace_tree.scala 36:42]
  wire  adder_level2_2_io_i_a; // @[wallace_tree.scala 36:42]
  wire  adder_level2_2_io_i_b; // @[wallace_tree.scala 36:42]
  wire  adder_level2_2_io_i_cin; // @[wallace_tree.scala 36:42]
  wire  adder_level2_2_io_o_s; // @[wallace_tree.scala 36:42]
  wire  adder_level2_2_io_o_cout; // @[wallace_tree.scala 36:42]
  wire  adder_level3_0_io_i_a; // @[wallace_tree.scala 37:42]
  wire  adder_level3_0_io_i_b; // @[wallace_tree.scala 37:42]
  wire  adder_level3_0_io_i_cin; // @[wallace_tree.scala 37:42]
  wire  adder_level3_0_io_o_s; // @[wallace_tree.scala 37:42]
  wire  adder_level3_0_io_o_cout; // @[wallace_tree.scala 37:42]
  wire  adder_level3_1_io_i_a; // @[wallace_tree.scala 37:42]
  wire  adder_level3_1_io_i_b; // @[wallace_tree.scala 37:42]
  wire  adder_level3_1_io_i_cin; // @[wallace_tree.scala 37:42]
  wire  adder_level3_1_io_o_s; // @[wallace_tree.scala 37:42]
  wire  adder_level3_1_io_o_cout; // @[wallace_tree.scala 37:42]
  wire  adder_level3_2_io_i_a; // @[wallace_tree.scala 37:42]
  wire  adder_level3_2_io_i_b; // @[wallace_tree.scala 37:42]
  wire  adder_level3_2_io_i_cin; // @[wallace_tree.scala 37:42]
  wire  adder_level3_2_io_o_s; // @[wallace_tree.scala 37:42]
  wire  adder_level3_2_io_o_cout; // @[wallace_tree.scala 37:42]
  wire  adder_level4_0_io_i_a; // @[wallace_tree.scala 38:42]
  wire  adder_level4_0_io_i_b; // @[wallace_tree.scala 38:42]
  wire  adder_level4_0_io_i_cin; // @[wallace_tree.scala 38:42]
  wire  adder_level4_0_io_o_s; // @[wallace_tree.scala 38:42]
  wire  adder_level4_0_io_o_cout; // @[wallace_tree.scala 38:42]
  wire  adder_level4_1_io_i_a; // @[wallace_tree.scala 38:42]
  wire  adder_level4_1_io_i_b; // @[wallace_tree.scala 38:42]
  wire  adder_level4_1_io_i_cin; // @[wallace_tree.scala 38:42]
  wire  adder_level4_1_io_o_s; // @[wallace_tree.scala 38:42]
  wire  adder_level4_1_io_o_cout; // @[wallace_tree.scala 38:42]
  wire  adder_level5_0_io_i_a; // @[wallace_tree.scala 39:42]
  wire  adder_level5_0_io_i_b; // @[wallace_tree.scala 39:42]
  wire  adder_level5_0_io_i_cin; // @[wallace_tree.scala 39:42]
  wire  adder_level5_0_io_o_s; // @[wallace_tree.scala 39:42]
  wire  adder_level5_0_io_o_cout; // @[wallace_tree.scala 39:42]
  wire  inter_c_1 = adder_level0_1_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire  inter_c_0 = adder_level0_0_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire  inter_c_3 = adder_level0_3_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire  inter_c_2 = adder_level0_2_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire  inter_c_5 = adder_level0_5_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire  inter_c_4 = adder_level0_4_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire  inter_c_8 = adder_level1_1_io_o_cout; // @[wallace_tree.scala 42:23 48:22]
  wire  inter_c_7 = adder_level1_0_io_o_cout; // @[wallace_tree.scala 42:23 48:22]
  wire  inter_c_6 = adder_level0_6_io_o_cout; // @[wallace_tree.scala 42:23 45:20]
  wire [8:0] io_o_inter_c_lo = {inter_c_8,inter_c_7,inter_c_6,inter_c_5,inter_c_4,inter_c_3,inter_c_2,inter_c_1,
    inter_c_0}; // @[wallace_tree.scala 43:29]
  wire  inter_c_10 = adder_level1_3_io_o_cout; // @[wallace_tree.scala 42:23 48:22]
  wire  inter_c_9 = adder_level1_2_io_o_cout; // @[wallace_tree.scala 42:23 48:22]
  wire  inter_c_13 = adder_level2_2_io_o_cout; // @[wallace_tree.scala 42:23 51:23]
  wire  inter_c_12 = adder_level2_1_io_o_cout; // @[wallace_tree.scala 42:23 51:23]
  wire  inter_c_11 = adder_level2_0_io_o_cout; // @[wallace_tree.scala 42:23 51:23]
  wire  inter_c_15 = adder_level3_1_io_o_cout; // @[wallace_tree.scala 42:23 54:23]
  wire  inter_c_14 = adder_level3_0_io_o_cout; // @[wallace_tree.scala 42:23 54:23]
  wire  inter_c_18 = adder_level4_1_io_o_cout; // @[wallace_tree.scala 42:23 57:23]
  wire  inter_c_17 = adder_level4_0_io_o_cout; // @[wallace_tree.scala 42:23 57:23]
  wire  inter_c_16 = adder_level3_2_io_o_cout; // @[wallace_tree.scala 42:23 54:23]
  wire [9:0] io_o_inter_c_hi = {inter_c_18,inter_c_17,inter_c_16,inter_c_15,inter_c_14,inter_c_13,inter_c_12,inter_c_11,
    inter_c_10,inter_c_9}; // @[wallace_tree.scala 43:29]
  Full_Adder adder_level0_0 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_0_io_i_a),
    .io_i_b(adder_level0_0_io_i_b),
    .io_i_cin(adder_level0_0_io_i_cin),
    .io_o_s(adder_level0_0_io_o_s),
    .io_o_cout(adder_level0_0_io_o_cout)
  );
  Full_Adder adder_level0_1 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_1_io_i_a),
    .io_i_b(adder_level0_1_io_i_b),
    .io_i_cin(adder_level0_1_io_i_cin),
    .io_o_s(adder_level0_1_io_o_s),
    .io_o_cout(adder_level0_1_io_o_cout)
  );
  Full_Adder adder_level0_2 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_2_io_i_a),
    .io_i_b(adder_level0_2_io_i_b),
    .io_i_cin(adder_level0_2_io_i_cin),
    .io_o_s(adder_level0_2_io_o_s),
    .io_o_cout(adder_level0_2_io_o_cout)
  );
  Full_Adder adder_level0_3 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_3_io_i_a),
    .io_i_b(adder_level0_3_io_i_b),
    .io_i_cin(adder_level0_3_io_i_cin),
    .io_o_s(adder_level0_3_io_o_s),
    .io_o_cout(adder_level0_3_io_o_cout)
  );
  Full_Adder adder_level0_4 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_4_io_i_a),
    .io_i_b(adder_level0_4_io_i_b),
    .io_i_cin(adder_level0_4_io_i_cin),
    .io_o_s(adder_level0_4_io_o_s),
    .io_o_cout(adder_level0_4_io_o_cout)
  );
  Full_Adder adder_level0_5 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_5_io_i_a),
    .io_i_b(adder_level0_5_io_i_b),
    .io_i_cin(adder_level0_5_io_i_cin),
    .io_o_s(adder_level0_5_io_o_s),
    .io_o_cout(adder_level0_5_io_o_cout)
  );
  Full_Adder adder_level0_6 ( // @[wallace_tree.scala 34:42]
    .io_i_a(adder_level0_6_io_i_a),
    .io_i_b(adder_level0_6_io_i_b),
    .io_i_cin(adder_level0_6_io_i_cin),
    .io_o_s(adder_level0_6_io_o_s),
    .io_o_cout(adder_level0_6_io_o_cout)
  );
  Full_Adder adder_level1_0 ( // @[wallace_tree.scala 35:42]
    .io_i_a(adder_level1_0_io_i_a),
    .io_i_b(adder_level1_0_io_i_b),
    .io_i_cin(adder_level1_0_io_i_cin),
    .io_o_s(adder_level1_0_io_o_s),
    .io_o_cout(adder_level1_0_io_o_cout)
  );
  Full_Adder adder_level1_1 ( // @[wallace_tree.scala 35:42]
    .io_i_a(adder_level1_1_io_i_a),
    .io_i_b(adder_level1_1_io_i_b),
    .io_i_cin(adder_level1_1_io_i_cin),
    .io_o_s(adder_level1_1_io_o_s),
    .io_o_cout(adder_level1_1_io_o_cout)
  );
  Full_Adder adder_level1_2 ( // @[wallace_tree.scala 35:42]
    .io_i_a(adder_level1_2_io_i_a),
    .io_i_b(adder_level1_2_io_i_b),
    .io_i_cin(adder_level1_2_io_i_cin),
    .io_o_s(adder_level1_2_io_o_s),
    .io_o_cout(adder_level1_2_io_o_cout)
  );
  Full_Adder adder_level1_3 ( // @[wallace_tree.scala 35:42]
    .io_i_a(adder_level1_3_io_i_a),
    .io_i_b(adder_level1_3_io_i_b),
    .io_i_cin(adder_level1_3_io_i_cin),
    .io_o_s(adder_level1_3_io_o_s),
    .io_o_cout(adder_level1_3_io_o_cout)
  );
  Full_Adder adder_level2_0 ( // @[wallace_tree.scala 36:42]
    .io_i_a(adder_level2_0_io_i_a),
    .io_i_b(adder_level2_0_io_i_b),
    .io_i_cin(adder_level2_0_io_i_cin),
    .io_o_s(adder_level2_0_io_o_s),
    .io_o_cout(adder_level2_0_io_o_cout)
  );
  Full_Adder adder_level2_1 ( // @[wallace_tree.scala 36:42]
    .io_i_a(adder_level2_1_io_i_a),
    .io_i_b(adder_level2_1_io_i_b),
    .io_i_cin(adder_level2_1_io_i_cin),
    .io_o_s(adder_level2_1_io_o_s),
    .io_o_cout(adder_level2_1_io_o_cout)
  );
  Full_Adder adder_level2_2 ( // @[wallace_tree.scala 36:42]
    .io_i_a(adder_level2_2_io_i_a),
    .io_i_b(adder_level2_2_io_i_b),
    .io_i_cin(adder_level2_2_io_i_cin),
    .io_o_s(adder_level2_2_io_o_s),
    .io_o_cout(adder_level2_2_io_o_cout)
  );
  Full_Adder adder_level3_0 ( // @[wallace_tree.scala 37:42]
    .io_i_a(adder_level3_0_io_i_a),
    .io_i_b(adder_level3_0_io_i_b),
    .io_i_cin(adder_level3_0_io_i_cin),
    .io_o_s(adder_level3_0_io_o_s),
    .io_o_cout(adder_level3_0_io_o_cout)
  );
  Full_Adder adder_level3_1 ( // @[wallace_tree.scala 37:42]
    .io_i_a(adder_level3_1_io_i_a),
    .io_i_b(adder_level3_1_io_i_b),
    .io_i_cin(adder_level3_1_io_i_cin),
    .io_o_s(adder_level3_1_io_o_s),
    .io_o_cout(adder_level3_1_io_o_cout)
  );
  Full_Adder adder_level3_2 ( // @[wallace_tree.scala 37:42]
    .io_i_a(adder_level3_2_io_i_a),
    .io_i_b(adder_level3_2_io_i_b),
    .io_i_cin(adder_level3_2_io_i_cin),
    .io_o_s(adder_level3_2_io_o_s),
    .io_o_cout(adder_level3_2_io_o_cout)
  );
  Full_Adder adder_level4_0 ( // @[wallace_tree.scala 38:42]
    .io_i_a(adder_level4_0_io_i_a),
    .io_i_b(adder_level4_0_io_i_b),
    .io_i_cin(adder_level4_0_io_i_cin),
    .io_o_s(adder_level4_0_io_o_s),
    .io_o_cout(adder_level4_0_io_o_cout)
  );
  Full_Adder adder_level4_1 ( // @[wallace_tree.scala 38:42]
    .io_i_a(adder_level4_1_io_i_a),
    .io_i_b(adder_level4_1_io_i_b),
    .io_i_cin(adder_level4_1_io_i_cin),
    .io_o_s(adder_level4_1_io_o_s),
    .io_o_cout(adder_level4_1_io_o_cout)
  );
  Full_Adder adder_level5_0 ( // @[wallace_tree.scala 39:42]
    .io_i_a(adder_level5_0_io_i_a),
    .io_i_b(adder_level5_0_io_i_b),
    .io_i_cin(adder_level5_0_io_i_cin),
    .io_o_s(adder_level5_0_io_o_s),
    .io_o_cout(adder_level5_0_io_o_cout)
  );
  assign io_o_inter_c = {io_o_inter_c_hi,io_o_inter_c_lo}; // @[wallace_tree.scala 43:29]
  assign io_o_c = adder_level5_0_io_o_cout; // @[wallace_tree.scala 59:12]
  assign io_o_s = adder_level5_0_io_o_s; // @[wallace_tree.scala 62:12]
  assign adder_level0_0_io_i_a = io_i_s[0]; // @[wallace_tree.scala 67:41]
  assign adder_level0_0_io_i_b = io_i_s[1]; // @[wallace_tree.scala 68:41]
  assign adder_level0_0_io_i_cin = io_i_s[2]; // @[wallace_tree.scala 69:43]
  assign adder_level0_1_io_i_a = io_i_s[3]; // @[wallace_tree.scala 67:41]
  assign adder_level0_1_io_i_b = io_i_s[4]; // @[wallace_tree.scala 68:41]
  assign adder_level0_1_io_i_cin = io_i_s[5]; // @[wallace_tree.scala 69:43]
  assign adder_level0_2_io_i_a = io_i_s[6]; // @[wallace_tree.scala 67:41]
  assign adder_level0_2_io_i_b = io_i_s[7]; // @[wallace_tree.scala 68:41]
  assign adder_level0_2_io_i_cin = io_i_s[8]; // @[wallace_tree.scala 69:43]
  assign adder_level0_3_io_i_a = io_i_s[9]; // @[wallace_tree.scala 67:41]
  assign adder_level0_3_io_i_b = io_i_s[10]; // @[wallace_tree.scala 68:41]
  assign adder_level0_3_io_i_cin = io_i_s[11]; // @[wallace_tree.scala 69:43]
  assign adder_level0_4_io_i_a = io_i_s[12]; // @[wallace_tree.scala 67:41]
  assign adder_level0_4_io_i_b = io_i_s[13]; // @[wallace_tree.scala 68:41]
  assign adder_level0_4_io_i_cin = io_i_s[14]; // @[wallace_tree.scala 69:43]
  assign adder_level0_5_io_i_a = io_i_s[15]; // @[wallace_tree.scala 67:41]
  assign adder_level0_5_io_i_b = io_i_s[16]; // @[wallace_tree.scala 68:41]
  assign adder_level0_5_io_i_cin = io_i_s[17]; // @[wallace_tree.scala 69:43]
  assign adder_level0_6_io_i_a = io_i_s[18]; // @[wallace_tree.scala 67:41]
  assign adder_level0_6_io_i_b = io_i_s[19]; // @[wallace_tree.scala 68:41]
  assign adder_level0_6_io_i_cin = io_i_s[20]; // @[wallace_tree.scala 69:43]
  assign adder_level1_0_io_i_a = adder_level0_0_io_o_s; // @[wallace_tree.scala 72:33]
  assign adder_level1_0_io_i_b = adder_level0_1_io_o_s; // @[wallace_tree.scala 73:33]
  assign adder_level1_0_io_i_cin = adder_level0_2_io_o_s; // @[wallace_tree.scala 74:33]
  assign adder_level1_1_io_i_a = adder_level0_3_io_o_s; // @[wallace_tree.scala 76:33]
  assign adder_level1_1_io_i_b = adder_level0_4_io_o_s; // @[wallace_tree.scala 77:33]
  assign adder_level1_1_io_i_cin = adder_level0_5_io_o_s; // @[wallace_tree.scala 78:33]
  assign adder_level1_2_io_i_a = adder_level0_6_io_o_s; // @[wallace_tree.scala 80:33]
  assign adder_level1_2_io_i_b = io_i_s[21]; // @[wallace_tree.scala 81:42]
  assign adder_level1_2_io_i_cin = io_i_inter_c[0]; // @[wallace_tree.scala 82:48]
  assign adder_level1_3_io_i_a = io_i_inter_c[1]; // @[wallace_tree.scala 84:48]
  assign adder_level1_3_io_i_b = io_i_inter_c[2]; // @[wallace_tree.scala 85:48]
  assign adder_level1_3_io_i_cin = io_i_inter_c[3]; // @[wallace_tree.scala 86:48]
  assign adder_level2_0_io_i_a = adder_level1_0_io_o_s; // @[wallace_tree.scala 89:33]
  assign adder_level2_0_io_i_b = adder_level1_1_io_o_s; // @[wallace_tree.scala 90:33]
  assign adder_level2_0_io_i_cin = adder_level1_2_io_o_s; // @[wallace_tree.scala 91:33]
  assign adder_level2_1_io_i_a = adder_level1_3_io_o_s; // @[wallace_tree.scala 93:33]
  assign adder_level2_1_io_i_b = io_i_inter_c[4]; // @[wallace_tree.scala 94:48]
  assign adder_level2_1_io_i_cin = io_i_inter_c[5]; // @[wallace_tree.scala 95:48]
  assign adder_level2_2_io_i_a = io_i_inter_c[6]; // @[wallace_tree.scala 97:48]
  assign adder_level2_2_io_i_b = io_i_inter_c[7]; // @[wallace_tree.scala 98:48]
  assign adder_level2_2_io_i_cin = io_i_inter_c[8]; // @[wallace_tree.scala 99:48]
  assign adder_level3_0_io_i_a = adder_level2_0_io_o_s; // @[wallace_tree.scala 102:33]
  assign adder_level3_0_io_i_b = adder_level2_1_io_o_s; // @[wallace_tree.scala 103:33]
  assign adder_level3_0_io_i_cin = adder_level2_2_io_o_s; // @[wallace_tree.scala 104:33]
  assign adder_level3_1_io_i_a = io_i_inter_c[9]; // @[wallace_tree.scala 106:48]
  assign adder_level3_1_io_i_b = io_i_inter_c[10]; // @[wallace_tree.scala 107:48]
  assign adder_level3_1_io_i_cin = io_i_inter_c[11]; // @[wallace_tree.scala 108:48]
  assign adder_level3_2_io_i_a = io_i_inter_c[12]; // @[wallace_tree.scala 110:48]
  assign adder_level3_2_io_i_b = io_i_inter_c[13]; // @[wallace_tree.scala 111:48]
  assign adder_level3_2_io_i_cin = io_i_inter_c[14]; // @[wallace_tree.scala 112:48]
  assign adder_level4_0_io_i_a = adder_level3_0_io_o_s; // @[wallace_tree.scala 115:33]
  assign adder_level4_0_io_i_b = adder_level3_1_io_o_s; // @[wallace_tree.scala 116:33]
  assign adder_level4_0_io_i_cin = adder_level3_2_io_o_s; // @[wallace_tree.scala 117:33]
  assign adder_level4_1_io_i_a = io_i_inter_c[15]; // @[wallace_tree.scala 119:48]
  assign adder_level4_1_io_i_b = io_i_inter_c[16]; // @[wallace_tree.scala 120:48]
  assign adder_level4_1_io_i_cin = io_i_inter_c[17]; // @[wallace_tree.scala 121:48]
  assign adder_level5_0_io_i_a = adder_level4_0_io_o_s; // @[wallace_tree.scala 124:33]
  assign adder_level5_0_io_i_b = adder_level4_1_io_o_s; // @[wallace_tree.scala 125:33]
  assign adder_level5_0_io_i_cin = io_i_inter_c[18]; // @[wallace_tree.scala 126:48]
endmodule
