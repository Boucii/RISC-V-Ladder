module Partial_Products_Gen(
  input  [130:0] io_i_x,
  input  [66:0]  io_i_y,
  output [130:0] io_o_partial_products_0,
  output [130:0] io_o_partial_products_1,
  output [130:0] io_o_partial_products_2,
  output [130:0] io_o_partial_products_3,
  output [130:0] io_o_partial_products_4,
  output [130:0] io_o_partial_products_5,
  output [130:0] io_o_partial_products_6,
  output [130:0] io_o_partial_products_7,
  output [130:0] io_o_partial_products_8,
  output [130:0] io_o_partial_products_9,
  output [130:0] io_o_partial_products_10,
  output [130:0] io_o_partial_products_11,
  output [130:0] io_o_partial_products_12,
  output [130:0] io_o_partial_products_13,
  output [130:0] io_o_partial_products_14,
  output [130:0] io_o_partial_products_15,
  output [130:0] io_o_partial_products_16,
  output [130:0] io_o_partial_products_17,
  output [130:0] io_o_partial_products_18,
  output [130:0] io_o_partial_products_19,
  output [130:0] io_o_partial_products_20,
  output [130:0] io_o_partial_products_21
);
  wire [131:0] _xtimes2_T = {io_i_x, 1'h0}; // @[booth.scala 32:23]
  wire [131:0] _GEN_0 = {{1'd0}, io_i_x}; // @[booth.scala 33:30]
  wire [131:0] _xtimes3_T_2 = _xtimes2_T + _GEN_0; // @[booth.scala 33:30]
  wire [132:0] _xtimes4_T = {io_i_x, 2'h0}; // @[booth.scala 34:23]
  wire [130:0] _xtimes1_com_T = ~io_i_x; // @[booth.scala 35:20]
  wire [130:0] xtimes1_com = _xtimes1_com_T + 131'h1; // @[booth.scala 35:29]
  wire [130:0] xtimes2 = _xtimes2_T[130:0]; // @[booth.scala 23:23 32:13]
  wire [130:0] _xtimes2_com_T = ~xtimes2; // @[booth.scala 36:20]
  wire [130:0] xtimes2_com = _xtimes2_com_T + 131'h1; // @[booth.scala 36:29]
  wire [130:0] xtimes3 = _xtimes3_T_2[130:0]; // @[booth.scala 24:23 33:13]
  wire [130:0] _xtimes3_com_T = ~xtimes3; // @[booth.scala 37:20]
  wire [130:0] xtimes3_com = _xtimes3_com_T + 131'h1; // @[booth.scala 37:29]
  wire [130:0] xtimes4 = _xtimes4_T[130:0]; // @[booth.scala 25:23 34:13]
  wire [130:0] _xtimes4_com_T = ~xtimes4; // @[booth.scala 38:20]
  wire [130:0] xtimes4_com = _xtimes4_com_T + 131'h1; // @[booth.scala 38:29]
  wire [3:0] pp_gen_bits_0 = io_i_y[3:0]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_1 = io_i_y[6:3]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_2 = io_i_y[9:6]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_3 = io_i_y[12:9]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_4 = io_i_y[15:12]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_5 = io_i_y[18:15]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_6 = io_i_y[21:18]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_7 = io_i_y[24:21]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_8 = io_i_y[27:24]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_9 = io_i_y[30:27]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_10 = io_i_y[33:30]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_11 = io_i_y[36:33]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_12 = io_i_y[39:36]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_13 = io_i_y[42:39]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_14 = io_i_y[45:42]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_15 = io_i_y[48:45]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_16 = io_i_y[51:48]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_17 = io_i_y[54:51]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_18 = io_i_y[57:54]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_19 = io_i_y[60:57]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_20 = io_i_y[63:60]; // @[booth.scala 42:33]
  wire [3:0] pp_gen_bits_21 = io_i_y[66:63]; // @[booth.scala 42:33]
  wire  _io_o_partial_products_0_T = pp_gen_bits_0 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_0_T_1 = pp_gen_bits_0 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_0_T_2 = pp_gen_bits_0 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_0_T_3 = pp_gen_bits_0 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_0_T_4 = pp_gen_bits_0 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_0_T_5 = pp_gen_bits_0 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_0_T_6 = pp_gen_bits_0 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_0_T_7 = pp_gen_bits_0 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_0_T_8 = pp_gen_bits_0 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_0_T_9 = pp_gen_bits_0 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_0_T_10 = pp_gen_bits_0 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_0_T_11 = pp_gen_bits_0 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_0_T_12 = pp_gen_bits_0 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_0_T_13 = pp_gen_bits_0 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_0_T_14 = pp_gen_bits_0 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_0_T_17 = _io_o_partial_products_0_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_18 = _io_o_partial_products_0_T_13 ? xtimes1_com :
    _io_o_partial_products_0_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_19 = _io_o_partial_products_0_T_12 ? xtimes2_com :
    _io_o_partial_products_0_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_20 = _io_o_partial_products_0_T_11 ? xtimes2_com :
    _io_o_partial_products_0_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_21 = _io_o_partial_products_0_T_10 ? xtimes3_com :
    _io_o_partial_products_0_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_22 = _io_o_partial_products_0_T_9 ? xtimes3_com :
    _io_o_partial_products_0_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_23 = _io_o_partial_products_0_T_8 ? xtimes4_com :
    _io_o_partial_products_0_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_24 = _io_o_partial_products_0_T_7 ? xtimes4 : _io_o_partial_products_0_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_25 = _io_o_partial_products_0_T_6 ? xtimes3 : _io_o_partial_products_0_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_26 = _io_o_partial_products_0_T_5 ? xtimes3 : _io_o_partial_products_0_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_27 = _io_o_partial_products_0_T_4 ? xtimes2 : _io_o_partial_products_0_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_28 = _io_o_partial_products_0_T_3 ? xtimes2 : _io_o_partial_products_0_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_29 = _io_o_partial_products_0_T_2 ? io_i_x : _io_o_partial_products_0_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_0_T_30 = _io_o_partial_products_0_T_1 ? io_i_x : _io_o_partial_products_0_T_29; // @[Mux.scala 101:16]
  wire  _io_o_partial_products_1_T = pp_gen_bits_1 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_1_T_1 = pp_gen_bits_1 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_1_T_2 = pp_gen_bits_1 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_1_T_3 = pp_gen_bits_1 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_1_T_4 = pp_gen_bits_1 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_1_T_5 = pp_gen_bits_1 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_1_T_6 = pp_gen_bits_1 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_1_T_7 = pp_gen_bits_1 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_1_T_8 = pp_gen_bits_1 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_1_T_9 = pp_gen_bits_1 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_1_T_10 = pp_gen_bits_1 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_1_T_11 = pp_gen_bits_1 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_1_T_12 = pp_gen_bits_1 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_1_T_13 = pp_gen_bits_1 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_1_T_14 = pp_gen_bits_1 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_1_T_17 = _io_o_partial_products_1_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_18 = _io_o_partial_products_1_T_13 ? xtimes1_com :
    _io_o_partial_products_1_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_19 = _io_o_partial_products_1_T_12 ? xtimes2_com :
    _io_o_partial_products_1_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_20 = _io_o_partial_products_1_T_11 ? xtimes2_com :
    _io_o_partial_products_1_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_21 = _io_o_partial_products_1_T_10 ? xtimes3_com :
    _io_o_partial_products_1_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_22 = _io_o_partial_products_1_T_9 ? xtimes3_com :
    _io_o_partial_products_1_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_23 = _io_o_partial_products_1_T_8 ? xtimes4_com :
    _io_o_partial_products_1_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_24 = _io_o_partial_products_1_T_7 ? xtimes4 : _io_o_partial_products_1_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_25 = _io_o_partial_products_1_T_6 ? xtimes3 : _io_o_partial_products_1_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_26 = _io_o_partial_products_1_T_5 ? xtimes3 : _io_o_partial_products_1_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_27 = _io_o_partial_products_1_T_4 ? xtimes2 : _io_o_partial_products_1_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_28 = _io_o_partial_products_1_T_3 ? xtimes2 : _io_o_partial_products_1_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_29 = _io_o_partial_products_1_T_2 ? io_i_x : _io_o_partial_products_1_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_30 = _io_o_partial_products_1_T_1 ? io_i_x : _io_o_partial_products_1_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_1_T_31 = _io_o_partial_products_1_T ? 131'h0 : _io_o_partial_products_1_T_30; // @[Mux.scala 101:16]
  wire [133:0] _io_o_partial_products_1_T_32 = {_io_o_partial_products_1_T_31, 3'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_2_T = pp_gen_bits_2 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_2_T_1 = pp_gen_bits_2 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_2_T_2 = pp_gen_bits_2 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_2_T_3 = pp_gen_bits_2 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_2_T_4 = pp_gen_bits_2 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_2_T_5 = pp_gen_bits_2 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_2_T_6 = pp_gen_bits_2 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_2_T_7 = pp_gen_bits_2 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_2_T_8 = pp_gen_bits_2 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_2_T_9 = pp_gen_bits_2 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_2_T_10 = pp_gen_bits_2 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_2_T_11 = pp_gen_bits_2 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_2_T_12 = pp_gen_bits_2 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_2_T_13 = pp_gen_bits_2 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_2_T_14 = pp_gen_bits_2 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_2_T_17 = _io_o_partial_products_2_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_18 = _io_o_partial_products_2_T_13 ? xtimes1_com :
    _io_o_partial_products_2_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_19 = _io_o_partial_products_2_T_12 ? xtimes2_com :
    _io_o_partial_products_2_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_20 = _io_o_partial_products_2_T_11 ? xtimes2_com :
    _io_o_partial_products_2_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_21 = _io_o_partial_products_2_T_10 ? xtimes3_com :
    _io_o_partial_products_2_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_22 = _io_o_partial_products_2_T_9 ? xtimes3_com :
    _io_o_partial_products_2_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_23 = _io_o_partial_products_2_T_8 ? xtimes4_com :
    _io_o_partial_products_2_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_24 = _io_o_partial_products_2_T_7 ? xtimes4 : _io_o_partial_products_2_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_25 = _io_o_partial_products_2_T_6 ? xtimes3 : _io_o_partial_products_2_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_26 = _io_o_partial_products_2_T_5 ? xtimes3 : _io_o_partial_products_2_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_27 = _io_o_partial_products_2_T_4 ? xtimes2 : _io_o_partial_products_2_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_28 = _io_o_partial_products_2_T_3 ? xtimes2 : _io_o_partial_products_2_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_29 = _io_o_partial_products_2_T_2 ? io_i_x : _io_o_partial_products_2_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_30 = _io_o_partial_products_2_T_1 ? io_i_x : _io_o_partial_products_2_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_2_T_31 = _io_o_partial_products_2_T ? 131'h0 : _io_o_partial_products_2_T_30; // @[Mux.scala 101:16]
  wire [136:0] _io_o_partial_products_2_T_32 = {_io_o_partial_products_2_T_31, 6'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_3_T = pp_gen_bits_3 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_3_T_1 = pp_gen_bits_3 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_3_T_2 = pp_gen_bits_3 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_3_T_3 = pp_gen_bits_3 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_3_T_4 = pp_gen_bits_3 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_3_T_5 = pp_gen_bits_3 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_3_T_6 = pp_gen_bits_3 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_3_T_7 = pp_gen_bits_3 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_3_T_8 = pp_gen_bits_3 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_3_T_9 = pp_gen_bits_3 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_3_T_10 = pp_gen_bits_3 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_3_T_11 = pp_gen_bits_3 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_3_T_12 = pp_gen_bits_3 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_3_T_13 = pp_gen_bits_3 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_3_T_14 = pp_gen_bits_3 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_3_T_17 = _io_o_partial_products_3_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_18 = _io_o_partial_products_3_T_13 ? xtimes1_com :
    _io_o_partial_products_3_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_19 = _io_o_partial_products_3_T_12 ? xtimes2_com :
    _io_o_partial_products_3_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_20 = _io_o_partial_products_3_T_11 ? xtimes2_com :
    _io_o_partial_products_3_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_21 = _io_o_partial_products_3_T_10 ? xtimes3_com :
    _io_o_partial_products_3_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_22 = _io_o_partial_products_3_T_9 ? xtimes3_com :
    _io_o_partial_products_3_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_23 = _io_o_partial_products_3_T_8 ? xtimes4_com :
    _io_o_partial_products_3_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_24 = _io_o_partial_products_3_T_7 ? xtimes4 : _io_o_partial_products_3_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_25 = _io_o_partial_products_3_T_6 ? xtimes3 : _io_o_partial_products_3_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_26 = _io_o_partial_products_3_T_5 ? xtimes3 : _io_o_partial_products_3_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_27 = _io_o_partial_products_3_T_4 ? xtimes2 : _io_o_partial_products_3_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_28 = _io_o_partial_products_3_T_3 ? xtimes2 : _io_o_partial_products_3_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_29 = _io_o_partial_products_3_T_2 ? io_i_x : _io_o_partial_products_3_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_30 = _io_o_partial_products_3_T_1 ? io_i_x : _io_o_partial_products_3_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_3_T_31 = _io_o_partial_products_3_T ? 131'h0 : _io_o_partial_products_3_T_30; // @[Mux.scala 101:16]
  wire [139:0] _io_o_partial_products_3_T_32 = {_io_o_partial_products_3_T_31, 9'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_4_T = pp_gen_bits_4 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_4_T_1 = pp_gen_bits_4 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_4_T_2 = pp_gen_bits_4 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_4_T_3 = pp_gen_bits_4 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_4_T_4 = pp_gen_bits_4 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_4_T_5 = pp_gen_bits_4 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_4_T_6 = pp_gen_bits_4 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_4_T_7 = pp_gen_bits_4 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_4_T_8 = pp_gen_bits_4 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_4_T_9 = pp_gen_bits_4 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_4_T_10 = pp_gen_bits_4 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_4_T_11 = pp_gen_bits_4 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_4_T_12 = pp_gen_bits_4 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_4_T_13 = pp_gen_bits_4 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_4_T_14 = pp_gen_bits_4 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_4_T_17 = _io_o_partial_products_4_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_18 = _io_o_partial_products_4_T_13 ? xtimes1_com :
    _io_o_partial_products_4_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_19 = _io_o_partial_products_4_T_12 ? xtimes2_com :
    _io_o_partial_products_4_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_20 = _io_o_partial_products_4_T_11 ? xtimes2_com :
    _io_o_partial_products_4_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_21 = _io_o_partial_products_4_T_10 ? xtimes3_com :
    _io_o_partial_products_4_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_22 = _io_o_partial_products_4_T_9 ? xtimes3_com :
    _io_o_partial_products_4_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_23 = _io_o_partial_products_4_T_8 ? xtimes4_com :
    _io_o_partial_products_4_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_24 = _io_o_partial_products_4_T_7 ? xtimes4 : _io_o_partial_products_4_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_25 = _io_o_partial_products_4_T_6 ? xtimes3 : _io_o_partial_products_4_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_26 = _io_o_partial_products_4_T_5 ? xtimes3 : _io_o_partial_products_4_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_27 = _io_o_partial_products_4_T_4 ? xtimes2 : _io_o_partial_products_4_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_28 = _io_o_partial_products_4_T_3 ? xtimes2 : _io_o_partial_products_4_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_29 = _io_o_partial_products_4_T_2 ? io_i_x : _io_o_partial_products_4_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_30 = _io_o_partial_products_4_T_1 ? io_i_x : _io_o_partial_products_4_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_4_T_31 = _io_o_partial_products_4_T ? 131'h0 : _io_o_partial_products_4_T_30; // @[Mux.scala 101:16]
  wire [142:0] _io_o_partial_products_4_T_32 = {_io_o_partial_products_4_T_31, 12'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_5_T = pp_gen_bits_5 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_5_T_1 = pp_gen_bits_5 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_5_T_2 = pp_gen_bits_5 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_5_T_3 = pp_gen_bits_5 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_5_T_4 = pp_gen_bits_5 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_5_T_5 = pp_gen_bits_5 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_5_T_6 = pp_gen_bits_5 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_5_T_7 = pp_gen_bits_5 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_5_T_8 = pp_gen_bits_5 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_5_T_9 = pp_gen_bits_5 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_5_T_10 = pp_gen_bits_5 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_5_T_11 = pp_gen_bits_5 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_5_T_12 = pp_gen_bits_5 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_5_T_13 = pp_gen_bits_5 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_5_T_14 = pp_gen_bits_5 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_5_T_17 = _io_o_partial_products_5_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_18 = _io_o_partial_products_5_T_13 ? xtimes1_com :
    _io_o_partial_products_5_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_19 = _io_o_partial_products_5_T_12 ? xtimes2_com :
    _io_o_partial_products_5_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_20 = _io_o_partial_products_5_T_11 ? xtimes2_com :
    _io_o_partial_products_5_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_21 = _io_o_partial_products_5_T_10 ? xtimes3_com :
    _io_o_partial_products_5_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_22 = _io_o_partial_products_5_T_9 ? xtimes3_com :
    _io_o_partial_products_5_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_23 = _io_o_partial_products_5_T_8 ? xtimes4_com :
    _io_o_partial_products_5_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_24 = _io_o_partial_products_5_T_7 ? xtimes4 : _io_o_partial_products_5_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_25 = _io_o_partial_products_5_T_6 ? xtimes3 : _io_o_partial_products_5_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_26 = _io_o_partial_products_5_T_5 ? xtimes3 : _io_o_partial_products_5_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_27 = _io_o_partial_products_5_T_4 ? xtimes2 : _io_o_partial_products_5_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_28 = _io_o_partial_products_5_T_3 ? xtimes2 : _io_o_partial_products_5_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_29 = _io_o_partial_products_5_T_2 ? io_i_x : _io_o_partial_products_5_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_30 = _io_o_partial_products_5_T_1 ? io_i_x : _io_o_partial_products_5_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_5_T_31 = _io_o_partial_products_5_T ? 131'h0 : _io_o_partial_products_5_T_30; // @[Mux.scala 101:16]
  wire [145:0] _io_o_partial_products_5_T_32 = {_io_o_partial_products_5_T_31, 15'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_6_T = pp_gen_bits_6 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_6_T_1 = pp_gen_bits_6 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_6_T_2 = pp_gen_bits_6 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_6_T_3 = pp_gen_bits_6 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_6_T_4 = pp_gen_bits_6 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_6_T_5 = pp_gen_bits_6 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_6_T_6 = pp_gen_bits_6 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_6_T_7 = pp_gen_bits_6 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_6_T_8 = pp_gen_bits_6 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_6_T_9 = pp_gen_bits_6 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_6_T_10 = pp_gen_bits_6 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_6_T_11 = pp_gen_bits_6 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_6_T_12 = pp_gen_bits_6 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_6_T_13 = pp_gen_bits_6 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_6_T_14 = pp_gen_bits_6 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_6_T_17 = _io_o_partial_products_6_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_18 = _io_o_partial_products_6_T_13 ? xtimes1_com :
    _io_o_partial_products_6_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_19 = _io_o_partial_products_6_T_12 ? xtimes2_com :
    _io_o_partial_products_6_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_20 = _io_o_partial_products_6_T_11 ? xtimes2_com :
    _io_o_partial_products_6_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_21 = _io_o_partial_products_6_T_10 ? xtimes3_com :
    _io_o_partial_products_6_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_22 = _io_o_partial_products_6_T_9 ? xtimes3_com :
    _io_o_partial_products_6_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_23 = _io_o_partial_products_6_T_8 ? xtimes4_com :
    _io_o_partial_products_6_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_24 = _io_o_partial_products_6_T_7 ? xtimes4 : _io_o_partial_products_6_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_25 = _io_o_partial_products_6_T_6 ? xtimes3 : _io_o_partial_products_6_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_26 = _io_o_partial_products_6_T_5 ? xtimes3 : _io_o_partial_products_6_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_27 = _io_o_partial_products_6_T_4 ? xtimes2 : _io_o_partial_products_6_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_28 = _io_o_partial_products_6_T_3 ? xtimes2 : _io_o_partial_products_6_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_29 = _io_o_partial_products_6_T_2 ? io_i_x : _io_o_partial_products_6_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_30 = _io_o_partial_products_6_T_1 ? io_i_x : _io_o_partial_products_6_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_6_T_31 = _io_o_partial_products_6_T ? 131'h0 : _io_o_partial_products_6_T_30; // @[Mux.scala 101:16]
  wire [148:0] _io_o_partial_products_6_T_32 = {_io_o_partial_products_6_T_31, 18'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_7_T = pp_gen_bits_7 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_7_T_1 = pp_gen_bits_7 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_7_T_2 = pp_gen_bits_7 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_7_T_3 = pp_gen_bits_7 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_7_T_4 = pp_gen_bits_7 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_7_T_5 = pp_gen_bits_7 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_7_T_6 = pp_gen_bits_7 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_7_T_7 = pp_gen_bits_7 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_7_T_8 = pp_gen_bits_7 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_7_T_9 = pp_gen_bits_7 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_7_T_10 = pp_gen_bits_7 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_7_T_11 = pp_gen_bits_7 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_7_T_12 = pp_gen_bits_7 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_7_T_13 = pp_gen_bits_7 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_7_T_14 = pp_gen_bits_7 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_7_T_17 = _io_o_partial_products_7_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_18 = _io_o_partial_products_7_T_13 ? xtimes1_com :
    _io_o_partial_products_7_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_19 = _io_o_partial_products_7_T_12 ? xtimes2_com :
    _io_o_partial_products_7_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_20 = _io_o_partial_products_7_T_11 ? xtimes2_com :
    _io_o_partial_products_7_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_21 = _io_o_partial_products_7_T_10 ? xtimes3_com :
    _io_o_partial_products_7_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_22 = _io_o_partial_products_7_T_9 ? xtimes3_com :
    _io_o_partial_products_7_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_23 = _io_o_partial_products_7_T_8 ? xtimes4_com :
    _io_o_partial_products_7_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_24 = _io_o_partial_products_7_T_7 ? xtimes4 : _io_o_partial_products_7_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_25 = _io_o_partial_products_7_T_6 ? xtimes3 : _io_o_partial_products_7_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_26 = _io_o_partial_products_7_T_5 ? xtimes3 : _io_o_partial_products_7_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_27 = _io_o_partial_products_7_T_4 ? xtimes2 : _io_o_partial_products_7_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_28 = _io_o_partial_products_7_T_3 ? xtimes2 : _io_o_partial_products_7_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_29 = _io_o_partial_products_7_T_2 ? io_i_x : _io_o_partial_products_7_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_30 = _io_o_partial_products_7_T_1 ? io_i_x : _io_o_partial_products_7_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_7_T_31 = _io_o_partial_products_7_T ? 131'h0 : _io_o_partial_products_7_T_30; // @[Mux.scala 101:16]
  wire [151:0] _io_o_partial_products_7_T_32 = {_io_o_partial_products_7_T_31, 21'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_8_T = pp_gen_bits_8 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_8_T_1 = pp_gen_bits_8 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_8_T_2 = pp_gen_bits_8 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_8_T_3 = pp_gen_bits_8 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_8_T_4 = pp_gen_bits_8 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_8_T_5 = pp_gen_bits_8 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_8_T_6 = pp_gen_bits_8 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_8_T_7 = pp_gen_bits_8 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_8_T_8 = pp_gen_bits_8 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_8_T_9 = pp_gen_bits_8 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_8_T_10 = pp_gen_bits_8 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_8_T_11 = pp_gen_bits_8 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_8_T_12 = pp_gen_bits_8 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_8_T_13 = pp_gen_bits_8 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_8_T_14 = pp_gen_bits_8 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_8_T_17 = _io_o_partial_products_8_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_18 = _io_o_partial_products_8_T_13 ? xtimes1_com :
    _io_o_partial_products_8_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_19 = _io_o_partial_products_8_T_12 ? xtimes2_com :
    _io_o_partial_products_8_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_20 = _io_o_partial_products_8_T_11 ? xtimes2_com :
    _io_o_partial_products_8_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_21 = _io_o_partial_products_8_T_10 ? xtimes3_com :
    _io_o_partial_products_8_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_22 = _io_o_partial_products_8_T_9 ? xtimes3_com :
    _io_o_partial_products_8_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_23 = _io_o_partial_products_8_T_8 ? xtimes4_com :
    _io_o_partial_products_8_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_24 = _io_o_partial_products_8_T_7 ? xtimes4 : _io_o_partial_products_8_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_25 = _io_o_partial_products_8_T_6 ? xtimes3 : _io_o_partial_products_8_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_26 = _io_o_partial_products_8_T_5 ? xtimes3 : _io_o_partial_products_8_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_27 = _io_o_partial_products_8_T_4 ? xtimes2 : _io_o_partial_products_8_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_28 = _io_o_partial_products_8_T_3 ? xtimes2 : _io_o_partial_products_8_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_29 = _io_o_partial_products_8_T_2 ? io_i_x : _io_o_partial_products_8_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_30 = _io_o_partial_products_8_T_1 ? io_i_x : _io_o_partial_products_8_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_8_T_31 = _io_o_partial_products_8_T ? 131'h0 : _io_o_partial_products_8_T_30; // @[Mux.scala 101:16]
  wire [154:0] _io_o_partial_products_8_T_32 = {_io_o_partial_products_8_T_31, 24'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_9_T = pp_gen_bits_9 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_9_T_1 = pp_gen_bits_9 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_9_T_2 = pp_gen_bits_9 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_9_T_3 = pp_gen_bits_9 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_9_T_4 = pp_gen_bits_9 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_9_T_5 = pp_gen_bits_9 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_9_T_6 = pp_gen_bits_9 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_9_T_7 = pp_gen_bits_9 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_9_T_8 = pp_gen_bits_9 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_9_T_9 = pp_gen_bits_9 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_9_T_10 = pp_gen_bits_9 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_9_T_11 = pp_gen_bits_9 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_9_T_12 = pp_gen_bits_9 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_9_T_13 = pp_gen_bits_9 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_9_T_14 = pp_gen_bits_9 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_9_T_17 = _io_o_partial_products_9_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_18 = _io_o_partial_products_9_T_13 ? xtimes1_com :
    _io_o_partial_products_9_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_19 = _io_o_partial_products_9_T_12 ? xtimes2_com :
    _io_o_partial_products_9_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_20 = _io_o_partial_products_9_T_11 ? xtimes2_com :
    _io_o_partial_products_9_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_21 = _io_o_partial_products_9_T_10 ? xtimes3_com :
    _io_o_partial_products_9_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_22 = _io_o_partial_products_9_T_9 ? xtimes3_com :
    _io_o_partial_products_9_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_23 = _io_o_partial_products_9_T_8 ? xtimes4_com :
    _io_o_partial_products_9_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_24 = _io_o_partial_products_9_T_7 ? xtimes4 : _io_o_partial_products_9_T_23; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_25 = _io_o_partial_products_9_T_6 ? xtimes3 : _io_o_partial_products_9_T_24; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_26 = _io_o_partial_products_9_T_5 ? xtimes3 : _io_o_partial_products_9_T_25; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_27 = _io_o_partial_products_9_T_4 ? xtimes2 : _io_o_partial_products_9_T_26; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_28 = _io_o_partial_products_9_T_3 ? xtimes2 : _io_o_partial_products_9_T_27; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_29 = _io_o_partial_products_9_T_2 ? io_i_x : _io_o_partial_products_9_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_30 = _io_o_partial_products_9_T_1 ? io_i_x : _io_o_partial_products_9_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_9_T_31 = _io_o_partial_products_9_T ? 131'h0 : _io_o_partial_products_9_T_30; // @[Mux.scala 101:16]
  wire [157:0] _io_o_partial_products_9_T_32 = {_io_o_partial_products_9_T_31, 27'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_10_T = pp_gen_bits_10 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_10_T_1 = pp_gen_bits_10 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_10_T_2 = pp_gen_bits_10 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_10_T_3 = pp_gen_bits_10 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_10_T_4 = pp_gen_bits_10 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_10_T_5 = pp_gen_bits_10 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_10_T_6 = pp_gen_bits_10 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_10_T_7 = pp_gen_bits_10 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_10_T_8 = pp_gen_bits_10 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_10_T_9 = pp_gen_bits_10 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_10_T_10 = pp_gen_bits_10 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_10_T_11 = pp_gen_bits_10 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_10_T_12 = pp_gen_bits_10 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_10_T_13 = pp_gen_bits_10 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_10_T_14 = pp_gen_bits_10 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_10_T_17 = _io_o_partial_products_10_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_18 = _io_o_partial_products_10_T_13 ? xtimes1_com :
    _io_o_partial_products_10_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_19 = _io_o_partial_products_10_T_12 ? xtimes2_com :
    _io_o_partial_products_10_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_20 = _io_o_partial_products_10_T_11 ? xtimes2_com :
    _io_o_partial_products_10_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_21 = _io_o_partial_products_10_T_10 ? xtimes3_com :
    _io_o_partial_products_10_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_22 = _io_o_partial_products_10_T_9 ? xtimes3_com :
    _io_o_partial_products_10_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_23 = _io_o_partial_products_10_T_8 ? xtimes4_com :
    _io_o_partial_products_10_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_24 = _io_o_partial_products_10_T_7 ? xtimes4 : _io_o_partial_products_10_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_25 = _io_o_partial_products_10_T_6 ? xtimes3 : _io_o_partial_products_10_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_26 = _io_o_partial_products_10_T_5 ? xtimes3 : _io_o_partial_products_10_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_27 = _io_o_partial_products_10_T_4 ? xtimes2 : _io_o_partial_products_10_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_28 = _io_o_partial_products_10_T_3 ? xtimes2 : _io_o_partial_products_10_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_29 = _io_o_partial_products_10_T_2 ? io_i_x : _io_o_partial_products_10_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_30 = _io_o_partial_products_10_T_1 ? io_i_x : _io_o_partial_products_10_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_10_T_31 = _io_o_partial_products_10_T ? 131'h0 : _io_o_partial_products_10_T_30; // @[Mux.scala 101:16]
  wire [160:0] _io_o_partial_products_10_T_32 = {_io_o_partial_products_10_T_31, 30'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_11_T = pp_gen_bits_11 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_11_T_1 = pp_gen_bits_11 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_11_T_2 = pp_gen_bits_11 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_11_T_3 = pp_gen_bits_11 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_11_T_4 = pp_gen_bits_11 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_11_T_5 = pp_gen_bits_11 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_11_T_6 = pp_gen_bits_11 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_11_T_7 = pp_gen_bits_11 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_11_T_8 = pp_gen_bits_11 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_11_T_9 = pp_gen_bits_11 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_11_T_10 = pp_gen_bits_11 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_11_T_11 = pp_gen_bits_11 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_11_T_12 = pp_gen_bits_11 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_11_T_13 = pp_gen_bits_11 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_11_T_14 = pp_gen_bits_11 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_11_T_17 = _io_o_partial_products_11_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_18 = _io_o_partial_products_11_T_13 ? xtimes1_com :
    _io_o_partial_products_11_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_19 = _io_o_partial_products_11_T_12 ? xtimes2_com :
    _io_o_partial_products_11_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_20 = _io_o_partial_products_11_T_11 ? xtimes2_com :
    _io_o_partial_products_11_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_21 = _io_o_partial_products_11_T_10 ? xtimes3_com :
    _io_o_partial_products_11_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_22 = _io_o_partial_products_11_T_9 ? xtimes3_com :
    _io_o_partial_products_11_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_23 = _io_o_partial_products_11_T_8 ? xtimes4_com :
    _io_o_partial_products_11_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_24 = _io_o_partial_products_11_T_7 ? xtimes4 : _io_o_partial_products_11_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_25 = _io_o_partial_products_11_T_6 ? xtimes3 : _io_o_partial_products_11_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_26 = _io_o_partial_products_11_T_5 ? xtimes3 : _io_o_partial_products_11_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_27 = _io_o_partial_products_11_T_4 ? xtimes2 : _io_o_partial_products_11_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_28 = _io_o_partial_products_11_T_3 ? xtimes2 : _io_o_partial_products_11_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_29 = _io_o_partial_products_11_T_2 ? io_i_x : _io_o_partial_products_11_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_30 = _io_o_partial_products_11_T_1 ? io_i_x : _io_o_partial_products_11_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_11_T_31 = _io_o_partial_products_11_T ? 131'h0 : _io_o_partial_products_11_T_30; // @[Mux.scala 101:16]
  wire [163:0] _io_o_partial_products_11_T_32 = {_io_o_partial_products_11_T_31, 33'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_12_T = pp_gen_bits_12 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_12_T_1 = pp_gen_bits_12 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_12_T_2 = pp_gen_bits_12 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_12_T_3 = pp_gen_bits_12 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_12_T_4 = pp_gen_bits_12 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_12_T_5 = pp_gen_bits_12 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_12_T_6 = pp_gen_bits_12 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_12_T_7 = pp_gen_bits_12 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_12_T_8 = pp_gen_bits_12 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_12_T_9 = pp_gen_bits_12 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_12_T_10 = pp_gen_bits_12 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_12_T_11 = pp_gen_bits_12 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_12_T_12 = pp_gen_bits_12 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_12_T_13 = pp_gen_bits_12 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_12_T_14 = pp_gen_bits_12 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_12_T_17 = _io_o_partial_products_12_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_18 = _io_o_partial_products_12_T_13 ? xtimes1_com :
    _io_o_partial_products_12_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_19 = _io_o_partial_products_12_T_12 ? xtimes2_com :
    _io_o_partial_products_12_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_20 = _io_o_partial_products_12_T_11 ? xtimes2_com :
    _io_o_partial_products_12_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_21 = _io_o_partial_products_12_T_10 ? xtimes3_com :
    _io_o_partial_products_12_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_22 = _io_o_partial_products_12_T_9 ? xtimes3_com :
    _io_o_partial_products_12_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_23 = _io_o_partial_products_12_T_8 ? xtimes4_com :
    _io_o_partial_products_12_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_24 = _io_o_partial_products_12_T_7 ? xtimes4 : _io_o_partial_products_12_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_25 = _io_o_partial_products_12_T_6 ? xtimes3 : _io_o_partial_products_12_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_26 = _io_o_partial_products_12_T_5 ? xtimes3 : _io_o_partial_products_12_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_27 = _io_o_partial_products_12_T_4 ? xtimes2 : _io_o_partial_products_12_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_28 = _io_o_partial_products_12_T_3 ? xtimes2 : _io_o_partial_products_12_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_29 = _io_o_partial_products_12_T_2 ? io_i_x : _io_o_partial_products_12_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_30 = _io_o_partial_products_12_T_1 ? io_i_x : _io_o_partial_products_12_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_12_T_31 = _io_o_partial_products_12_T ? 131'h0 : _io_o_partial_products_12_T_30; // @[Mux.scala 101:16]
  wire [166:0] _io_o_partial_products_12_T_32 = {_io_o_partial_products_12_T_31, 36'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_13_T = pp_gen_bits_13 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_13_T_1 = pp_gen_bits_13 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_13_T_2 = pp_gen_bits_13 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_13_T_3 = pp_gen_bits_13 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_13_T_4 = pp_gen_bits_13 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_13_T_5 = pp_gen_bits_13 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_13_T_6 = pp_gen_bits_13 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_13_T_7 = pp_gen_bits_13 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_13_T_8 = pp_gen_bits_13 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_13_T_9 = pp_gen_bits_13 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_13_T_10 = pp_gen_bits_13 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_13_T_11 = pp_gen_bits_13 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_13_T_12 = pp_gen_bits_13 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_13_T_13 = pp_gen_bits_13 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_13_T_14 = pp_gen_bits_13 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_13_T_17 = _io_o_partial_products_13_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_18 = _io_o_partial_products_13_T_13 ? xtimes1_com :
    _io_o_partial_products_13_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_19 = _io_o_partial_products_13_T_12 ? xtimes2_com :
    _io_o_partial_products_13_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_20 = _io_o_partial_products_13_T_11 ? xtimes2_com :
    _io_o_partial_products_13_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_21 = _io_o_partial_products_13_T_10 ? xtimes3_com :
    _io_o_partial_products_13_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_22 = _io_o_partial_products_13_T_9 ? xtimes3_com :
    _io_o_partial_products_13_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_23 = _io_o_partial_products_13_T_8 ? xtimes4_com :
    _io_o_partial_products_13_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_24 = _io_o_partial_products_13_T_7 ? xtimes4 : _io_o_partial_products_13_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_25 = _io_o_partial_products_13_T_6 ? xtimes3 : _io_o_partial_products_13_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_26 = _io_o_partial_products_13_T_5 ? xtimes3 : _io_o_partial_products_13_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_27 = _io_o_partial_products_13_T_4 ? xtimes2 : _io_o_partial_products_13_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_28 = _io_o_partial_products_13_T_3 ? xtimes2 : _io_o_partial_products_13_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_29 = _io_o_partial_products_13_T_2 ? io_i_x : _io_o_partial_products_13_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_30 = _io_o_partial_products_13_T_1 ? io_i_x : _io_o_partial_products_13_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_13_T_31 = _io_o_partial_products_13_T ? 131'h0 : _io_o_partial_products_13_T_30; // @[Mux.scala 101:16]
  wire [169:0] _io_o_partial_products_13_T_32 = {_io_o_partial_products_13_T_31, 39'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_14_T = pp_gen_bits_14 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_14_T_1 = pp_gen_bits_14 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_14_T_2 = pp_gen_bits_14 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_14_T_3 = pp_gen_bits_14 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_14_T_4 = pp_gen_bits_14 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_14_T_5 = pp_gen_bits_14 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_14_T_6 = pp_gen_bits_14 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_14_T_7 = pp_gen_bits_14 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_14_T_8 = pp_gen_bits_14 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_14_T_9 = pp_gen_bits_14 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_14_T_10 = pp_gen_bits_14 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_14_T_11 = pp_gen_bits_14 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_14_T_12 = pp_gen_bits_14 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_14_T_13 = pp_gen_bits_14 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_14_T_14 = pp_gen_bits_14 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_14_T_17 = _io_o_partial_products_14_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_18 = _io_o_partial_products_14_T_13 ? xtimes1_com :
    _io_o_partial_products_14_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_19 = _io_o_partial_products_14_T_12 ? xtimes2_com :
    _io_o_partial_products_14_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_20 = _io_o_partial_products_14_T_11 ? xtimes2_com :
    _io_o_partial_products_14_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_21 = _io_o_partial_products_14_T_10 ? xtimes3_com :
    _io_o_partial_products_14_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_22 = _io_o_partial_products_14_T_9 ? xtimes3_com :
    _io_o_partial_products_14_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_23 = _io_o_partial_products_14_T_8 ? xtimes4_com :
    _io_o_partial_products_14_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_24 = _io_o_partial_products_14_T_7 ? xtimes4 : _io_o_partial_products_14_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_25 = _io_o_partial_products_14_T_6 ? xtimes3 : _io_o_partial_products_14_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_26 = _io_o_partial_products_14_T_5 ? xtimes3 : _io_o_partial_products_14_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_27 = _io_o_partial_products_14_T_4 ? xtimes2 : _io_o_partial_products_14_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_28 = _io_o_partial_products_14_T_3 ? xtimes2 : _io_o_partial_products_14_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_29 = _io_o_partial_products_14_T_2 ? io_i_x : _io_o_partial_products_14_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_30 = _io_o_partial_products_14_T_1 ? io_i_x : _io_o_partial_products_14_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_14_T_31 = _io_o_partial_products_14_T ? 131'h0 : _io_o_partial_products_14_T_30; // @[Mux.scala 101:16]
  wire [172:0] _io_o_partial_products_14_T_32 = {_io_o_partial_products_14_T_31, 42'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_15_T = pp_gen_bits_15 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_15_T_1 = pp_gen_bits_15 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_15_T_2 = pp_gen_bits_15 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_15_T_3 = pp_gen_bits_15 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_15_T_4 = pp_gen_bits_15 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_15_T_5 = pp_gen_bits_15 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_15_T_6 = pp_gen_bits_15 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_15_T_7 = pp_gen_bits_15 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_15_T_8 = pp_gen_bits_15 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_15_T_9 = pp_gen_bits_15 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_15_T_10 = pp_gen_bits_15 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_15_T_11 = pp_gen_bits_15 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_15_T_12 = pp_gen_bits_15 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_15_T_13 = pp_gen_bits_15 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_15_T_14 = pp_gen_bits_15 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_15_T_17 = _io_o_partial_products_15_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_18 = _io_o_partial_products_15_T_13 ? xtimes1_com :
    _io_o_partial_products_15_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_19 = _io_o_partial_products_15_T_12 ? xtimes2_com :
    _io_o_partial_products_15_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_20 = _io_o_partial_products_15_T_11 ? xtimes2_com :
    _io_o_partial_products_15_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_21 = _io_o_partial_products_15_T_10 ? xtimes3_com :
    _io_o_partial_products_15_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_22 = _io_o_partial_products_15_T_9 ? xtimes3_com :
    _io_o_partial_products_15_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_23 = _io_o_partial_products_15_T_8 ? xtimes4_com :
    _io_o_partial_products_15_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_24 = _io_o_partial_products_15_T_7 ? xtimes4 : _io_o_partial_products_15_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_25 = _io_o_partial_products_15_T_6 ? xtimes3 : _io_o_partial_products_15_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_26 = _io_o_partial_products_15_T_5 ? xtimes3 : _io_o_partial_products_15_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_27 = _io_o_partial_products_15_T_4 ? xtimes2 : _io_o_partial_products_15_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_28 = _io_o_partial_products_15_T_3 ? xtimes2 : _io_o_partial_products_15_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_29 = _io_o_partial_products_15_T_2 ? io_i_x : _io_o_partial_products_15_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_30 = _io_o_partial_products_15_T_1 ? io_i_x : _io_o_partial_products_15_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_15_T_31 = _io_o_partial_products_15_T ? 131'h0 : _io_o_partial_products_15_T_30; // @[Mux.scala 101:16]
  wire [175:0] _io_o_partial_products_15_T_32 = {_io_o_partial_products_15_T_31, 45'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_16_T = pp_gen_bits_16 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_16_T_1 = pp_gen_bits_16 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_16_T_2 = pp_gen_bits_16 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_16_T_3 = pp_gen_bits_16 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_16_T_4 = pp_gen_bits_16 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_16_T_5 = pp_gen_bits_16 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_16_T_6 = pp_gen_bits_16 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_16_T_7 = pp_gen_bits_16 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_16_T_8 = pp_gen_bits_16 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_16_T_9 = pp_gen_bits_16 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_16_T_10 = pp_gen_bits_16 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_16_T_11 = pp_gen_bits_16 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_16_T_12 = pp_gen_bits_16 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_16_T_13 = pp_gen_bits_16 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_16_T_14 = pp_gen_bits_16 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_16_T_17 = _io_o_partial_products_16_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_18 = _io_o_partial_products_16_T_13 ? xtimes1_com :
    _io_o_partial_products_16_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_19 = _io_o_partial_products_16_T_12 ? xtimes2_com :
    _io_o_partial_products_16_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_20 = _io_o_partial_products_16_T_11 ? xtimes2_com :
    _io_o_partial_products_16_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_21 = _io_o_partial_products_16_T_10 ? xtimes3_com :
    _io_o_partial_products_16_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_22 = _io_o_partial_products_16_T_9 ? xtimes3_com :
    _io_o_partial_products_16_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_23 = _io_o_partial_products_16_T_8 ? xtimes4_com :
    _io_o_partial_products_16_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_24 = _io_o_partial_products_16_T_7 ? xtimes4 : _io_o_partial_products_16_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_25 = _io_o_partial_products_16_T_6 ? xtimes3 : _io_o_partial_products_16_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_26 = _io_o_partial_products_16_T_5 ? xtimes3 : _io_o_partial_products_16_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_27 = _io_o_partial_products_16_T_4 ? xtimes2 : _io_o_partial_products_16_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_28 = _io_o_partial_products_16_T_3 ? xtimes2 : _io_o_partial_products_16_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_29 = _io_o_partial_products_16_T_2 ? io_i_x : _io_o_partial_products_16_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_30 = _io_o_partial_products_16_T_1 ? io_i_x : _io_o_partial_products_16_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_16_T_31 = _io_o_partial_products_16_T ? 131'h0 : _io_o_partial_products_16_T_30; // @[Mux.scala 101:16]
  wire [178:0] _io_o_partial_products_16_T_32 = {_io_o_partial_products_16_T_31, 48'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_17_T = pp_gen_bits_17 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_17_T_1 = pp_gen_bits_17 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_17_T_2 = pp_gen_bits_17 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_17_T_3 = pp_gen_bits_17 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_17_T_4 = pp_gen_bits_17 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_17_T_5 = pp_gen_bits_17 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_17_T_6 = pp_gen_bits_17 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_17_T_7 = pp_gen_bits_17 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_17_T_8 = pp_gen_bits_17 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_17_T_9 = pp_gen_bits_17 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_17_T_10 = pp_gen_bits_17 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_17_T_11 = pp_gen_bits_17 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_17_T_12 = pp_gen_bits_17 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_17_T_13 = pp_gen_bits_17 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_17_T_14 = pp_gen_bits_17 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_17_T_17 = _io_o_partial_products_17_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_18 = _io_o_partial_products_17_T_13 ? xtimes1_com :
    _io_o_partial_products_17_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_19 = _io_o_partial_products_17_T_12 ? xtimes2_com :
    _io_o_partial_products_17_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_20 = _io_o_partial_products_17_T_11 ? xtimes2_com :
    _io_o_partial_products_17_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_21 = _io_o_partial_products_17_T_10 ? xtimes3_com :
    _io_o_partial_products_17_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_22 = _io_o_partial_products_17_T_9 ? xtimes3_com :
    _io_o_partial_products_17_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_23 = _io_o_partial_products_17_T_8 ? xtimes4_com :
    _io_o_partial_products_17_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_24 = _io_o_partial_products_17_T_7 ? xtimes4 : _io_o_partial_products_17_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_25 = _io_o_partial_products_17_T_6 ? xtimes3 : _io_o_partial_products_17_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_26 = _io_o_partial_products_17_T_5 ? xtimes3 : _io_o_partial_products_17_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_27 = _io_o_partial_products_17_T_4 ? xtimes2 : _io_o_partial_products_17_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_28 = _io_o_partial_products_17_T_3 ? xtimes2 : _io_o_partial_products_17_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_29 = _io_o_partial_products_17_T_2 ? io_i_x : _io_o_partial_products_17_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_30 = _io_o_partial_products_17_T_1 ? io_i_x : _io_o_partial_products_17_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_17_T_31 = _io_o_partial_products_17_T ? 131'h0 : _io_o_partial_products_17_T_30; // @[Mux.scala 101:16]
  wire [181:0] _io_o_partial_products_17_T_32 = {_io_o_partial_products_17_T_31, 51'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_18_T = pp_gen_bits_18 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_18_T_1 = pp_gen_bits_18 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_18_T_2 = pp_gen_bits_18 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_18_T_3 = pp_gen_bits_18 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_18_T_4 = pp_gen_bits_18 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_18_T_5 = pp_gen_bits_18 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_18_T_6 = pp_gen_bits_18 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_18_T_7 = pp_gen_bits_18 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_18_T_8 = pp_gen_bits_18 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_18_T_9 = pp_gen_bits_18 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_18_T_10 = pp_gen_bits_18 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_18_T_11 = pp_gen_bits_18 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_18_T_12 = pp_gen_bits_18 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_18_T_13 = pp_gen_bits_18 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_18_T_14 = pp_gen_bits_18 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_18_T_17 = _io_o_partial_products_18_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_18 = _io_o_partial_products_18_T_13 ? xtimes1_com :
    _io_o_partial_products_18_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_19 = _io_o_partial_products_18_T_12 ? xtimes2_com :
    _io_o_partial_products_18_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_20 = _io_o_partial_products_18_T_11 ? xtimes2_com :
    _io_o_partial_products_18_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_21 = _io_o_partial_products_18_T_10 ? xtimes3_com :
    _io_o_partial_products_18_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_22 = _io_o_partial_products_18_T_9 ? xtimes3_com :
    _io_o_partial_products_18_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_23 = _io_o_partial_products_18_T_8 ? xtimes4_com :
    _io_o_partial_products_18_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_24 = _io_o_partial_products_18_T_7 ? xtimes4 : _io_o_partial_products_18_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_25 = _io_o_partial_products_18_T_6 ? xtimes3 : _io_o_partial_products_18_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_26 = _io_o_partial_products_18_T_5 ? xtimes3 : _io_o_partial_products_18_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_27 = _io_o_partial_products_18_T_4 ? xtimes2 : _io_o_partial_products_18_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_28 = _io_o_partial_products_18_T_3 ? xtimes2 : _io_o_partial_products_18_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_29 = _io_o_partial_products_18_T_2 ? io_i_x : _io_o_partial_products_18_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_30 = _io_o_partial_products_18_T_1 ? io_i_x : _io_o_partial_products_18_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_18_T_31 = _io_o_partial_products_18_T ? 131'h0 : _io_o_partial_products_18_T_30; // @[Mux.scala 101:16]
  wire [184:0] _io_o_partial_products_18_T_32 = {_io_o_partial_products_18_T_31, 54'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_19_T = pp_gen_bits_19 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_19_T_1 = pp_gen_bits_19 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_19_T_2 = pp_gen_bits_19 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_19_T_3 = pp_gen_bits_19 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_19_T_4 = pp_gen_bits_19 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_19_T_5 = pp_gen_bits_19 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_19_T_6 = pp_gen_bits_19 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_19_T_7 = pp_gen_bits_19 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_19_T_8 = pp_gen_bits_19 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_19_T_9 = pp_gen_bits_19 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_19_T_10 = pp_gen_bits_19 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_19_T_11 = pp_gen_bits_19 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_19_T_12 = pp_gen_bits_19 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_19_T_13 = pp_gen_bits_19 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_19_T_14 = pp_gen_bits_19 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_19_T_17 = _io_o_partial_products_19_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_18 = _io_o_partial_products_19_T_13 ? xtimes1_com :
    _io_o_partial_products_19_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_19 = _io_o_partial_products_19_T_12 ? xtimes2_com :
    _io_o_partial_products_19_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_20 = _io_o_partial_products_19_T_11 ? xtimes2_com :
    _io_o_partial_products_19_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_21 = _io_o_partial_products_19_T_10 ? xtimes3_com :
    _io_o_partial_products_19_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_22 = _io_o_partial_products_19_T_9 ? xtimes3_com :
    _io_o_partial_products_19_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_23 = _io_o_partial_products_19_T_8 ? xtimes4_com :
    _io_o_partial_products_19_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_24 = _io_o_partial_products_19_T_7 ? xtimes4 : _io_o_partial_products_19_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_25 = _io_o_partial_products_19_T_6 ? xtimes3 : _io_o_partial_products_19_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_26 = _io_o_partial_products_19_T_5 ? xtimes3 : _io_o_partial_products_19_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_27 = _io_o_partial_products_19_T_4 ? xtimes2 : _io_o_partial_products_19_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_28 = _io_o_partial_products_19_T_3 ? xtimes2 : _io_o_partial_products_19_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_29 = _io_o_partial_products_19_T_2 ? io_i_x : _io_o_partial_products_19_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_30 = _io_o_partial_products_19_T_1 ? io_i_x : _io_o_partial_products_19_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_19_T_31 = _io_o_partial_products_19_T ? 131'h0 : _io_o_partial_products_19_T_30; // @[Mux.scala 101:16]
  wire [187:0] _io_o_partial_products_19_T_32 = {_io_o_partial_products_19_T_31, 57'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_20_T = pp_gen_bits_20 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_20_T_1 = pp_gen_bits_20 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_20_T_2 = pp_gen_bits_20 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_20_T_3 = pp_gen_bits_20 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_20_T_4 = pp_gen_bits_20 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_20_T_5 = pp_gen_bits_20 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_20_T_6 = pp_gen_bits_20 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_20_T_7 = pp_gen_bits_20 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_20_T_8 = pp_gen_bits_20 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_20_T_9 = pp_gen_bits_20 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_20_T_10 = pp_gen_bits_20 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_20_T_11 = pp_gen_bits_20 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_20_T_12 = pp_gen_bits_20 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_20_T_13 = pp_gen_bits_20 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_20_T_14 = pp_gen_bits_20 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_20_T_17 = _io_o_partial_products_20_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_18 = _io_o_partial_products_20_T_13 ? xtimes1_com :
    _io_o_partial_products_20_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_19 = _io_o_partial_products_20_T_12 ? xtimes2_com :
    _io_o_partial_products_20_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_20 = _io_o_partial_products_20_T_11 ? xtimes2_com :
    _io_o_partial_products_20_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_21 = _io_o_partial_products_20_T_10 ? xtimes3_com :
    _io_o_partial_products_20_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_22 = _io_o_partial_products_20_T_9 ? xtimes3_com :
    _io_o_partial_products_20_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_23 = _io_o_partial_products_20_T_8 ? xtimes4_com :
    _io_o_partial_products_20_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_24 = _io_o_partial_products_20_T_7 ? xtimes4 : _io_o_partial_products_20_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_25 = _io_o_partial_products_20_T_6 ? xtimes3 : _io_o_partial_products_20_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_26 = _io_o_partial_products_20_T_5 ? xtimes3 : _io_o_partial_products_20_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_27 = _io_o_partial_products_20_T_4 ? xtimes2 : _io_o_partial_products_20_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_28 = _io_o_partial_products_20_T_3 ? xtimes2 : _io_o_partial_products_20_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_29 = _io_o_partial_products_20_T_2 ? io_i_x : _io_o_partial_products_20_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_30 = _io_o_partial_products_20_T_1 ? io_i_x : _io_o_partial_products_20_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_20_T_31 = _io_o_partial_products_20_T ? 131'h0 : _io_o_partial_products_20_T_30; // @[Mux.scala 101:16]
  wire [190:0] _io_o_partial_products_20_T_32 = {_io_o_partial_products_20_T_31, 60'h0}; // @[booth.scala 62:8]
  wire  _io_o_partial_products_21_T = pp_gen_bits_21 == 4'h0; // @[booth.scala 46:29]
  wire  _io_o_partial_products_21_T_1 = pp_gen_bits_21 == 4'h1; // @[booth.scala 47:29]
  wire  _io_o_partial_products_21_T_2 = pp_gen_bits_21 == 4'h2; // @[booth.scala 48:29]
  wire  _io_o_partial_products_21_T_3 = pp_gen_bits_21 == 4'h3; // @[booth.scala 49:29]
  wire  _io_o_partial_products_21_T_4 = pp_gen_bits_21 == 4'h4; // @[booth.scala 50:29]
  wire  _io_o_partial_products_21_T_5 = pp_gen_bits_21 == 4'h5; // @[booth.scala 51:29]
  wire  _io_o_partial_products_21_T_6 = pp_gen_bits_21 == 4'h6; // @[booth.scala 52:29]
  wire  _io_o_partial_products_21_T_7 = pp_gen_bits_21 == 4'h7; // @[booth.scala 53:29]
  wire  _io_o_partial_products_21_T_8 = pp_gen_bits_21 == 4'h8; // @[booth.scala 54:29]
  wire  _io_o_partial_products_21_T_9 = pp_gen_bits_21 == 4'h9; // @[booth.scala 55:29]
  wire  _io_o_partial_products_21_T_10 = pp_gen_bits_21 == 4'ha; // @[booth.scala 56:29]
  wire  _io_o_partial_products_21_T_11 = pp_gen_bits_21 == 4'hb; // @[booth.scala 57:29]
  wire  _io_o_partial_products_21_T_12 = pp_gen_bits_21 == 4'hc; // @[booth.scala 58:29]
  wire  _io_o_partial_products_21_T_13 = pp_gen_bits_21 == 4'hd; // @[booth.scala 59:29]
  wire  _io_o_partial_products_21_T_14 = pp_gen_bits_21 == 4'he; // @[booth.scala 60:29]
  wire [130:0] _io_o_partial_products_21_T_17 = _io_o_partial_products_21_T_14 ? xtimes1_com : 131'h0; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_18 = _io_o_partial_products_21_T_13 ? xtimes1_com :
    _io_o_partial_products_21_T_17; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_19 = _io_o_partial_products_21_T_12 ? xtimes2_com :
    _io_o_partial_products_21_T_18; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_20 = _io_o_partial_products_21_T_11 ? xtimes2_com :
    _io_o_partial_products_21_T_19; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_21 = _io_o_partial_products_21_T_10 ? xtimes3_com :
    _io_o_partial_products_21_T_20; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_22 = _io_o_partial_products_21_T_9 ? xtimes3_com :
    _io_o_partial_products_21_T_21; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_23 = _io_o_partial_products_21_T_8 ? xtimes4_com :
    _io_o_partial_products_21_T_22; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_24 = _io_o_partial_products_21_T_7 ? xtimes4 : _io_o_partial_products_21_T_23
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_25 = _io_o_partial_products_21_T_6 ? xtimes3 : _io_o_partial_products_21_T_24
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_26 = _io_o_partial_products_21_T_5 ? xtimes3 : _io_o_partial_products_21_T_25
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_27 = _io_o_partial_products_21_T_4 ? xtimes2 : _io_o_partial_products_21_T_26
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_28 = _io_o_partial_products_21_T_3 ? xtimes2 : _io_o_partial_products_21_T_27
    ; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_29 = _io_o_partial_products_21_T_2 ? io_i_x : _io_o_partial_products_21_T_28; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_30 = _io_o_partial_products_21_T_1 ? io_i_x : _io_o_partial_products_21_T_29; // @[Mux.scala 101:16]
  wire [130:0] _io_o_partial_products_21_T_31 = _io_o_partial_products_21_T ? 131'h0 : _io_o_partial_products_21_T_30; // @[Mux.scala 101:16]
  wire [193:0] _io_o_partial_products_21_T_32 = {_io_o_partial_products_21_T_31, 63'h0}; // @[booth.scala 62:8]
  assign io_o_partial_products_0 = _io_o_partial_products_0_T ? 131'h0 : _io_o_partial_products_0_T_30; // @[Mux.scala 101:16]
  assign io_o_partial_products_1 = _io_o_partial_products_1_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_2 = _io_o_partial_products_2_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_3 = _io_o_partial_products_3_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_4 = _io_o_partial_products_4_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_5 = _io_o_partial_products_5_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_6 = _io_o_partial_products_6_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_7 = _io_o_partial_products_7_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_8 = _io_o_partial_products_8_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_9 = _io_o_partial_products_9_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_10 = _io_o_partial_products_10_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_11 = _io_o_partial_products_11_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_12 = _io_o_partial_products_12_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_13 = _io_o_partial_products_13_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_14 = _io_o_partial_products_14_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_15 = _io_o_partial_products_15_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_16 = _io_o_partial_products_16_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_17 = _io_o_partial_products_17_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_18 = _io_o_partial_products_18_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_19 = _io_o_partial_products_19_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_20 = _io_o_partial_products_20_T_32[130:0]; // @[booth.scala 45:34]
  assign io_o_partial_products_21 = _io_o_partial_products_21_T_32[130:0]; // @[booth.scala 45:34]
endmodule
