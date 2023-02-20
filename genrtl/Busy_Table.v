module Busy_Table(
  input          clock,
  input          reset,
  input          io_i_free_list_reqs_0,
  input          io_i_free_list_reqs_1,
  output [6:0]   io_o_allocated_pregs_0,
  output [6:0]   io_o_allocated_pregs_1,
  output         io_o_empty,
  input          io_i_allocated_uops_0_valid,
  input  [6:0]   io_i_allocated_uops_0_phy_dst,
  input          io_i_allocated_uops_1_valid,
  input  [6:0]   io_i_allocated_uops_1_phy_dst,
  input          io_i_commit_packs_0_valid,
  input  [6:0]   io_i_commit_packs_0_uop_phy_dst,
  input  [6:0]   io_i_commit_packs_0_uop_stale_dst,
  input          io_i_commit_packs_1_valid,
  input  [6:0]   io_i_commit_packs_1_uop_phy_dst,
  input  [6:0]   io_i_commit_packs_1_uop_stale_dst,
  input          io_i_rollback_packs_0_valid,
  input  [6:0]   io_i_rollback_packs_0_uop_phy_dst,
  input          io_i_rollback_packs_1_valid,
  input  [6:0]   io_i_rollback_packs_1_uop_phy_dst,
  output [127:0] io_o_written_back,
  input          io_i_exception
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [127:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] mapped; // @[busy_table.scala 29:25]
  wire [127:0] _written_back_T_1 = 128'h0 - 128'h1; // @[busy_table.scala 30:42]
  reg [127:0] written_back; // @[busy_table.scala 30:31]
  wire [127:0] _next_written_back_T_3 = io_i_commit_packs_0_valid ? 128'hffffffffffffffffffffffffffffffff : 128'h0; // @[Bitwise.scala 77:12]
  wire [127:0] _next_written_back_T_4 = 128'h1 << io_i_commit_packs_0_uop_phy_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_written_back_T_5 = _next_written_back_T_3 & _next_written_back_T_4; // @[busy_table.scala 41:47]
  wire [127:0] _next_written_back_T_6 = written_back | _next_written_back_T_5; // @[busy_table.scala 40:76]
  wire [127:0] _next_written_back_T_8 = io_i_commit_packs_1_valid ? 128'hffffffffffffffffffffffffffffffff : 128'h0; // @[Bitwise.scala 77:12]
  wire [127:0] _next_written_back_T_9 = 128'h1 << io_i_commit_packs_1_uop_phy_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_written_back_T_10 = _next_written_back_T_8 & _next_written_back_T_9; // @[busy_table.scala 42:47]
  wire [127:0] _next_written_back_T_11 = _next_written_back_T_6 | _next_written_back_T_10; // @[busy_table.scala 41:93]
  wire [127:0] _next_written_back_T_13 = io_i_allocated_uops_0_valid ? 128'hffffffffffffffffffffffffffffffff : 128'h0; // @[Bitwise.scala 77:12]
  wire [127:0] _next_written_back_T_14 = 128'h1 << io_i_allocated_uops_0_phy_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_written_back_T_15 = _next_written_back_T_13 & _next_written_back_T_14; // @[busy_table.scala 43:50]
  wire [127:0] _next_written_back_T_16 = ~_next_written_back_T_15; // @[busy_table.scala 43:9]
  wire [127:0] _next_written_back_T_18 = io_i_allocated_uops_1_valid ? 128'hffffffffffffffffffffffffffffffff : 128'h0; // @[Bitwise.scala 77:12]
  wire [127:0] _next_written_back_T_19 = 128'h1 << io_i_allocated_uops_1_phy_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_written_back_T_20 = _next_written_back_T_18 & _next_written_back_T_19; // @[busy_table.scala 44:50]
  wire [127:0] _next_written_back_T_21 = ~_next_written_back_T_20; // @[busy_table.scala 44:9]
  wire [127:0] _next_written_back_T_22 = _next_written_back_T_16 & _next_written_back_T_21; // @[busy_table.scala 43:94]
  wire [127:0] _next_written_back_T_23 = _next_written_back_T_11 & _next_written_back_T_22; // @[busy_table.scala 42:94]
  wire [127:0] _next_written_back_T_25 = io_i_rollback_packs_0_valid ? 128'hffffffffffffffffffffffffffffffff : 128'h0; // @[Bitwise.scala 77:12]
  wire [127:0] _next_written_back_T_26 = 128'h1 << io_i_rollback_packs_0_uop_phy_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_written_back_T_27 = _next_written_back_T_25 & _next_written_back_T_26; // @[busy_table.scala 45:49]
  wire [127:0] _next_written_back_T_29 = io_i_rollback_packs_1_valid ? 128'hffffffffffffffffffffffffffffffff : 128'h0; // @[Bitwise.scala 77:12]
  wire [127:0] _next_written_back_T_30 = 128'h1 << io_i_rollback_packs_1_uop_phy_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_written_back_T_31 = _next_written_back_T_29 & _next_written_back_T_30; // @[busy_table.scala 46:49]
  wire [127:0] _next_written_back_T_32 = _next_written_back_T_27 | _next_written_back_T_31; // @[busy_table.scala 45:97]
  wire [127:0] _next_written_back_T_33 = _next_written_back_T_23 | _next_written_back_T_32; // @[busy_table.scala 44:95]
  wire [127:0] _next_written_back_T_34 = _next_written_back_T_33 | 128'h1; // @[busy_table.scala 46:97]
  wire [127:0] _next_mapped_T = mapped & written_back; // @[busy_table.scala 52:47]
  wire [127:0] _next_mapped_T_5 = mapped | _next_written_back_T_15; // @[busy_table.scala 52:71]
  wire [127:0] _next_mapped_T_10 = _next_mapped_T_5 | _next_written_back_T_20; // @[busy_table.scala 53:93]
  wire [127:0] _next_mapped_T_13 = 128'h1 << io_i_commit_packs_0_uop_stale_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_mapped_T_14 = _next_written_back_T_3 & _next_mapped_T_13; // @[busy_table.scala 55:48]
  wire [127:0] _next_mapped_T_15 = ~_next_mapped_T_14; // @[busy_table.scala 55:9]
  wire [127:0] _next_mapped_T_18 = 128'h1 << io_i_commit_packs_1_uop_stale_dst; // @[OneHot.scala 57:35]
  wire [127:0] _next_mapped_T_19 = _next_written_back_T_8 & _next_mapped_T_18; // @[busy_table.scala 56:48]
  wire [127:0] _next_mapped_T_20 = ~_next_mapped_T_19; // @[busy_table.scala 56:9]
  wire [127:0] _next_mapped_T_21 = _next_mapped_T_15 & _next_mapped_T_20; // @[busy_table.scala 55:96]
  wire [127:0] _next_mapped_T_22 = _next_mapped_T_10 & _next_mapped_T_21; // @[busy_table.scala 54:94]
  wire [127:0] _next_mapped_T_27 = ~_next_written_back_T_27; // @[busy_table.scala 57:9]
  wire [127:0] _next_mapped_T_32 = ~_next_written_back_T_31; // @[busy_table.scala 58:9]
  wire [127:0] _next_mapped_T_33 = _next_mapped_T_27 & _next_mapped_T_32; // @[busy_table.scala 57:98]
  wire [127:0] _next_mapped_T_34 = _next_mapped_T_22 & _next_mapped_T_33; // @[busy_table.scala 56:96]
  wire [127:0] _next_mapped_T_36 = _next_mapped_T_34 & 128'hfffffffffffffffffffffffffffffffe; // @[busy_table.scala 58:99]
  wire [1:0] _num_allocate_T = io_i_free_list_reqs_0 ? 2'h1 : 2'h0; // @[busy_table.scala 80:24]
  wire [1:0] _num_allocate_T_1 = io_i_free_list_reqs_1 ? 2'h1 : 2'h0; // @[busy_table.scala 80:74]
  wire [1:0] num_allocate = _num_allocate_T + _num_allocate_T_1; // @[busy_table.scala 80:69]
  wire [1:0] _num_rbk_T_2 = io_i_rollback_packs_0_valid & io_i_rollback_packs_0_uop_phy_dst != 7'h0 ? 2'h1 : 2'h0; // @[busy_table.scala 81:19]
  wire [1:0] _num_rbk_T_5 = io_i_rollback_packs_1_valid & io_i_rollback_packs_1_uop_phy_dst != 7'h0 ? 2'h1 : 2'h0; // @[busy_table.scala 82:19]
  wire [1:0] num_rbk = _num_rbk_T_2 + _num_rbk_T_5; // @[busy_table.scala 81:116]
  wire [1:0] _num_cmt_stale_T_2 = io_i_commit_packs_0_valid & io_i_commit_packs_0_uop_stale_dst != 7'h0 ? 2'h1 : 2'h0; // @[busy_table.scala 83:25]
  wire [1:0] _num_cmt_stale_T_5 = io_i_commit_packs_1_valid & io_i_commit_packs_1_uop_stale_dst != 7'h0 ? 2'h1 : 2'h0; // @[busy_table.scala 84:25]
  wire [1:0] num_cmt_stale = _num_cmt_stale_T_2 + _num_cmt_stale_T_5; // @[busy_table.scala 83:120]
  wire [1:0] _num_cmt_phy_T_2 = io_i_commit_packs_0_valid & io_i_commit_packs_0_uop_phy_dst != 7'h0 ? 2'h1 : 2'h0; // @[busy_table.scala 85:23]
  wire [1:0] _num_cmt_phy_T_5 = io_i_commit_packs_1_valid & io_i_commit_packs_1_uop_phy_dst != 7'h0 ? 2'h1 : 2'h0; // @[busy_table.scala 86:23]
  wire [1:0] num_cmt_phy = _num_cmt_phy_T_2 + _num_cmt_phy_T_5; // @[busy_table.scala 85:116]
  reg [6:0] num_mapped_not_writtenback; // @[busy_table.scala 88:45]
  wire [6:0] _GEN_0 = {{5'd0}, num_allocate}; // @[busy_table.scala 90:67]
  wire [6:0] _next_num_mapped_not_writtenback_T_1 = num_mapped_not_writtenback + _GEN_0; // @[busy_table.scala 90:67]
  wire [6:0] _GEN_1 = {{5'd0}, num_rbk}; // @[busy_table.scala 90:82]
  wire [6:0] _next_num_mapped_not_writtenback_T_3 = _next_num_mapped_not_writtenback_T_1 - _GEN_1; // @[busy_table.scala 90:82]
  wire [6:0] _GEN_2 = {{5'd0}, num_cmt_phy}; // @[busy_table.scala 90:92]
  wire [6:0] next_num_mapped_not_writtenback = _next_num_mapped_not_writtenback_T_3 - _GEN_2; // @[busy_table.scala 90:92]
  reg [6:0] allocated_num; // @[busy_table.scala 93:32]
  wire [6:0] _next_allocated_num_T_1 = allocated_num - num_mapped_not_writtenback; // @[busy_table.scala 95:62]
  wire [6:0] _next_allocated_num_T_3 = allocated_num + _GEN_0; // @[busy_table.scala 95:108]
  wire [6:0] _next_allocated_num_T_5 = _next_allocated_num_T_3 - _GEN_1; // @[busy_table.scala 95:123]
  wire [6:0] _GEN_5 = {{5'd0}, num_cmt_stale}; // @[busy_table.scala 95:133]
  wire [6:0] _next_allocated_num_T_7 = _next_allocated_num_T_5 - _GEN_5; // @[busy_table.scala 95:133]
  wire [6:0] next_allocated_num = io_i_exception ? _next_allocated_num_T_1 : _next_allocated_num_T_7; // @[busy_table.scala 95:30]
  wire [126:0] _available0_T_1 = ~mapped[127:1]; // @[busy_table.scala 100:35]
  wire [6:0] _available0_T_129 = _available0_T_1[125] ? 7'h7d : 7'h7e; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_130 = _available0_T_1[124] ? 7'h7c : _available0_T_129; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_131 = _available0_T_1[123] ? 7'h7b : _available0_T_130; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_132 = _available0_T_1[122] ? 7'h7a : _available0_T_131; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_133 = _available0_T_1[121] ? 7'h79 : _available0_T_132; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_134 = _available0_T_1[120] ? 7'h78 : _available0_T_133; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_135 = _available0_T_1[119] ? 7'h77 : _available0_T_134; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_136 = _available0_T_1[118] ? 7'h76 : _available0_T_135; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_137 = _available0_T_1[117] ? 7'h75 : _available0_T_136; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_138 = _available0_T_1[116] ? 7'h74 : _available0_T_137; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_139 = _available0_T_1[115] ? 7'h73 : _available0_T_138; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_140 = _available0_T_1[114] ? 7'h72 : _available0_T_139; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_141 = _available0_T_1[113] ? 7'h71 : _available0_T_140; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_142 = _available0_T_1[112] ? 7'h70 : _available0_T_141; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_143 = _available0_T_1[111] ? 7'h6f : _available0_T_142; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_144 = _available0_T_1[110] ? 7'h6e : _available0_T_143; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_145 = _available0_T_1[109] ? 7'h6d : _available0_T_144; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_146 = _available0_T_1[108] ? 7'h6c : _available0_T_145; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_147 = _available0_T_1[107] ? 7'h6b : _available0_T_146; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_148 = _available0_T_1[106] ? 7'h6a : _available0_T_147; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_149 = _available0_T_1[105] ? 7'h69 : _available0_T_148; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_150 = _available0_T_1[104] ? 7'h68 : _available0_T_149; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_151 = _available0_T_1[103] ? 7'h67 : _available0_T_150; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_152 = _available0_T_1[102] ? 7'h66 : _available0_T_151; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_153 = _available0_T_1[101] ? 7'h65 : _available0_T_152; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_154 = _available0_T_1[100] ? 7'h64 : _available0_T_153; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_155 = _available0_T_1[99] ? 7'h63 : _available0_T_154; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_156 = _available0_T_1[98] ? 7'h62 : _available0_T_155; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_157 = _available0_T_1[97] ? 7'h61 : _available0_T_156; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_158 = _available0_T_1[96] ? 7'h60 : _available0_T_157; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_159 = _available0_T_1[95] ? 7'h5f : _available0_T_158; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_160 = _available0_T_1[94] ? 7'h5e : _available0_T_159; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_161 = _available0_T_1[93] ? 7'h5d : _available0_T_160; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_162 = _available0_T_1[92] ? 7'h5c : _available0_T_161; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_163 = _available0_T_1[91] ? 7'h5b : _available0_T_162; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_164 = _available0_T_1[90] ? 7'h5a : _available0_T_163; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_165 = _available0_T_1[89] ? 7'h59 : _available0_T_164; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_166 = _available0_T_1[88] ? 7'h58 : _available0_T_165; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_167 = _available0_T_1[87] ? 7'h57 : _available0_T_166; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_168 = _available0_T_1[86] ? 7'h56 : _available0_T_167; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_169 = _available0_T_1[85] ? 7'h55 : _available0_T_168; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_170 = _available0_T_1[84] ? 7'h54 : _available0_T_169; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_171 = _available0_T_1[83] ? 7'h53 : _available0_T_170; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_172 = _available0_T_1[82] ? 7'h52 : _available0_T_171; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_173 = _available0_T_1[81] ? 7'h51 : _available0_T_172; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_174 = _available0_T_1[80] ? 7'h50 : _available0_T_173; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_175 = _available0_T_1[79] ? 7'h4f : _available0_T_174; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_176 = _available0_T_1[78] ? 7'h4e : _available0_T_175; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_177 = _available0_T_1[77] ? 7'h4d : _available0_T_176; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_178 = _available0_T_1[76] ? 7'h4c : _available0_T_177; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_179 = _available0_T_1[75] ? 7'h4b : _available0_T_178; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_180 = _available0_T_1[74] ? 7'h4a : _available0_T_179; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_181 = _available0_T_1[73] ? 7'h49 : _available0_T_180; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_182 = _available0_T_1[72] ? 7'h48 : _available0_T_181; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_183 = _available0_T_1[71] ? 7'h47 : _available0_T_182; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_184 = _available0_T_1[70] ? 7'h46 : _available0_T_183; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_185 = _available0_T_1[69] ? 7'h45 : _available0_T_184; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_186 = _available0_T_1[68] ? 7'h44 : _available0_T_185; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_187 = _available0_T_1[67] ? 7'h43 : _available0_T_186; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_188 = _available0_T_1[66] ? 7'h42 : _available0_T_187; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_189 = _available0_T_1[65] ? 7'h41 : _available0_T_188; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_190 = _available0_T_1[64] ? 7'h40 : _available0_T_189; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_191 = _available0_T_1[63] ? 7'h3f : _available0_T_190; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_192 = _available0_T_1[62] ? 7'h3e : _available0_T_191; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_193 = _available0_T_1[61] ? 7'h3d : _available0_T_192; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_194 = _available0_T_1[60] ? 7'h3c : _available0_T_193; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_195 = _available0_T_1[59] ? 7'h3b : _available0_T_194; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_196 = _available0_T_1[58] ? 7'h3a : _available0_T_195; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_197 = _available0_T_1[57] ? 7'h39 : _available0_T_196; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_198 = _available0_T_1[56] ? 7'h38 : _available0_T_197; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_199 = _available0_T_1[55] ? 7'h37 : _available0_T_198; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_200 = _available0_T_1[54] ? 7'h36 : _available0_T_199; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_201 = _available0_T_1[53] ? 7'h35 : _available0_T_200; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_202 = _available0_T_1[52] ? 7'h34 : _available0_T_201; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_203 = _available0_T_1[51] ? 7'h33 : _available0_T_202; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_204 = _available0_T_1[50] ? 7'h32 : _available0_T_203; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_205 = _available0_T_1[49] ? 7'h31 : _available0_T_204; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_206 = _available0_T_1[48] ? 7'h30 : _available0_T_205; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_207 = _available0_T_1[47] ? 7'h2f : _available0_T_206; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_208 = _available0_T_1[46] ? 7'h2e : _available0_T_207; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_209 = _available0_T_1[45] ? 7'h2d : _available0_T_208; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_210 = _available0_T_1[44] ? 7'h2c : _available0_T_209; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_211 = _available0_T_1[43] ? 7'h2b : _available0_T_210; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_212 = _available0_T_1[42] ? 7'h2a : _available0_T_211; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_213 = _available0_T_1[41] ? 7'h29 : _available0_T_212; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_214 = _available0_T_1[40] ? 7'h28 : _available0_T_213; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_215 = _available0_T_1[39] ? 7'h27 : _available0_T_214; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_216 = _available0_T_1[38] ? 7'h26 : _available0_T_215; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_217 = _available0_T_1[37] ? 7'h25 : _available0_T_216; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_218 = _available0_T_1[36] ? 7'h24 : _available0_T_217; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_219 = _available0_T_1[35] ? 7'h23 : _available0_T_218; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_220 = _available0_T_1[34] ? 7'h22 : _available0_T_219; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_221 = _available0_T_1[33] ? 7'h21 : _available0_T_220; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_222 = _available0_T_1[32] ? 7'h20 : _available0_T_221; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_223 = _available0_T_1[31] ? 7'h1f : _available0_T_222; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_224 = _available0_T_1[30] ? 7'h1e : _available0_T_223; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_225 = _available0_T_1[29] ? 7'h1d : _available0_T_224; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_226 = _available0_T_1[28] ? 7'h1c : _available0_T_225; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_227 = _available0_T_1[27] ? 7'h1b : _available0_T_226; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_228 = _available0_T_1[26] ? 7'h1a : _available0_T_227; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_229 = _available0_T_1[25] ? 7'h19 : _available0_T_228; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_230 = _available0_T_1[24] ? 7'h18 : _available0_T_229; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_231 = _available0_T_1[23] ? 7'h17 : _available0_T_230; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_232 = _available0_T_1[22] ? 7'h16 : _available0_T_231; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_233 = _available0_T_1[21] ? 7'h15 : _available0_T_232; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_234 = _available0_T_1[20] ? 7'h14 : _available0_T_233; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_235 = _available0_T_1[19] ? 7'h13 : _available0_T_234; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_236 = _available0_T_1[18] ? 7'h12 : _available0_T_235; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_237 = _available0_T_1[17] ? 7'h11 : _available0_T_236; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_238 = _available0_T_1[16] ? 7'h10 : _available0_T_237; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_239 = _available0_T_1[15] ? 7'hf : _available0_T_238; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_240 = _available0_T_1[14] ? 7'he : _available0_T_239; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_241 = _available0_T_1[13] ? 7'hd : _available0_T_240; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_242 = _available0_T_1[12] ? 7'hc : _available0_T_241; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_243 = _available0_T_1[11] ? 7'hb : _available0_T_242; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_244 = _available0_T_1[10] ? 7'ha : _available0_T_243; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_245 = _available0_T_1[9] ? 7'h9 : _available0_T_244; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_246 = _available0_T_1[8] ? 7'h8 : _available0_T_245; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_247 = _available0_T_1[7] ? 7'h7 : _available0_T_246; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_248 = _available0_T_1[6] ? 7'h6 : _available0_T_247; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_249 = _available0_T_1[5] ? 7'h5 : _available0_T_248; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_250 = _available0_T_1[4] ? 7'h4 : _available0_T_249; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_251 = _available0_T_1[3] ? 7'h3 : _available0_T_250; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_252 = _available0_T_1[2] ? 7'h2 : _available0_T_251; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_253 = _available0_T_1[1] ? 7'h1 : _available0_T_252; // @[Mux.scala 47:70]
  wire [6:0] _available0_T_254 = _available0_T_1[0] ? 7'h0 : _available0_T_253; // @[Mux.scala 47:70]
  wire [6:0] available0 = _available0_T_254 + 7'h1; // @[busy_table.scala 100:50]
  wire [63:0] _GEN_6 = {{32'd0}, mapped[64:33]}; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_5 = _GEN_6 & 64'hffffffff; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_7 = {mapped[32:1], 32'h0}; // @[Bitwise.scala 108:70]
  wire [63:0] _available1_T_9 = _available1_T_7 & 64'hffffffff00000000; // @[Bitwise.scala 108:80]
  wire [63:0] _available1_T_10 = _available1_T_5 | _available1_T_9; // @[Bitwise.scala 108:39]
  wire [63:0] _GEN_7 = {{16'd0}, _available1_T_10[63:16]}; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_15 = _GEN_7 & 64'hffff0000ffff; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_17 = {_available1_T_10[47:0], 16'h0}; // @[Bitwise.scala 108:70]
  wire [63:0] _available1_T_19 = _available1_T_17 & 64'hffff0000ffff0000; // @[Bitwise.scala 108:80]
  wire [63:0] _available1_T_20 = _available1_T_15 | _available1_T_19; // @[Bitwise.scala 108:39]
  wire [63:0] _GEN_8 = {{8'd0}, _available1_T_20[63:8]}; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_25 = _GEN_8 & 64'hff00ff00ff00ff; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_27 = {_available1_T_20[55:0], 8'h0}; // @[Bitwise.scala 108:70]
  wire [63:0] _available1_T_29 = _available1_T_27 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 108:80]
  wire [63:0] _available1_T_30 = _available1_T_25 | _available1_T_29; // @[Bitwise.scala 108:39]
  wire [63:0] _GEN_9 = {{4'd0}, _available1_T_30[63:4]}; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_35 = _GEN_9 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_37 = {_available1_T_30[59:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [63:0] _available1_T_39 = _available1_T_37 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 108:80]
  wire [63:0] _available1_T_40 = _available1_T_35 | _available1_T_39; // @[Bitwise.scala 108:39]
  wire [63:0] _GEN_10 = {{2'd0}, _available1_T_40[63:2]}; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_45 = _GEN_10 & 64'h3333333333333333; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_47 = {_available1_T_40[61:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [63:0] _available1_T_49 = _available1_T_47 & 64'hcccccccccccccccc; // @[Bitwise.scala 108:80]
  wire [63:0] _available1_T_50 = _available1_T_45 | _available1_T_49; // @[Bitwise.scala 108:39]
  wire [63:0] _GEN_11 = {{1'd0}, _available1_T_50[63:1]}; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_55 = _GEN_11 & 64'h5555555555555555; // @[Bitwise.scala 108:31]
  wire [63:0] _available1_T_57 = {_available1_T_50[62:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [63:0] _available1_T_59 = _available1_T_57 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 108:80]
  wire [63:0] _available1_T_60 = _available1_T_55 | _available1_T_59; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_12 = {{16'd0}, mapped[96:81]}; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_66 = _GEN_12 & 32'hffff; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_68 = {mapped[80:65], 16'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _available1_T_70 = _available1_T_68 & 32'hffff0000; // @[Bitwise.scala 108:80]
  wire [31:0] _available1_T_71 = _available1_T_66 | _available1_T_70; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_13 = {{8'd0}, _available1_T_71[31:8]}; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_76 = _GEN_13 & 32'hff00ff; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_78 = {_available1_T_71[23:0], 8'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _available1_T_80 = _available1_T_78 & 32'hff00ff00; // @[Bitwise.scala 108:80]
  wire [31:0] _available1_T_81 = _available1_T_76 | _available1_T_80; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_14 = {{4'd0}, _available1_T_81[31:4]}; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_86 = _GEN_14 & 32'hf0f0f0f; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_88 = {_available1_T_81[27:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _available1_T_90 = _available1_T_88 & 32'hf0f0f0f0; // @[Bitwise.scala 108:80]
  wire [31:0] _available1_T_91 = _available1_T_86 | _available1_T_90; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_15 = {{2'd0}, _available1_T_91[31:2]}; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_96 = _GEN_15 & 32'h33333333; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_98 = {_available1_T_91[29:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _available1_T_100 = _available1_T_98 & 32'hcccccccc; // @[Bitwise.scala 108:80]
  wire [31:0] _available1_T_101 = _available1_T_96 | _available1_T_100; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_16 = {{1'd0}, _available1_T_101[31:1]}; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_106 = _GEN_16 & 32'h55555555; // @[Bitwise.scala 108:31]
  wire [31:0] _available1_T_108 = {_available1_T_101[30:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _available1_T_110 = _available1_T_108 & 32'haaaaaaaa; // @[Bitwise.scala 108:80]
  wire [31:0] _available1_T_111 = _available1_T_106 | _available1_T_110; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_17 = {{8'd0}, mapped[112:105]}; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_117 = _GEN_17 & 16'hff; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_119 = {mapped[104:97], 8'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _available1_T_121 = _available1_T_119 & 16'hff00; // @[Bitwise.scala 108:80]
  wire [15:0] _available1_T_122 = _available1_T_117 | _available1_T_121; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_18 = {{4'd0}, _available1_T_122[15:4]}; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_127 = _GEN_18 & 16'hf0f; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_129 = {_available1_T_122[11:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _available1_T_131 = _available1_T_129 & 16'hf0f0; // @[Bitwise.scala 108:80]
  wire [15:0] _available1_T_132 = _available1_T_127 | _available1_T_131; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_19 = {{2'd0}, _available1_T_132[15:2]}; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_137 = _GEN_19 & 16'h3333; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_139 = {_available1_T_132[13:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _available1_T_141 = _available1_T_139 & 16'hcccc; // @[Bitwise.scala 108:80]
  wire [15:0] _available1_T_142 = _available1_T_137 | _available1_T_141; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_20 = {{1'd0}, _available1_T_142[15:1]}; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_147 = _GEN_20 & 16'h5555; // @[Bitwise.scala 108:31]
  wire [15:0] _available1_T_149 = {_available1_T_142[14:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _available1_T_151 = _available1_T_149 & 16'haaaa; // @[Bitwise.scala 108:80]
  wire [15:0] _available1_T_152 = _available1_T_147 | _available1_T_151; // @[Bitwise.scala 108:39]
  wire [7:0] _GEN_21 = {{4'd0}, mapped[120:117]}; // @[Bitwise.scala 108:31]
  wire [7:0] _available1_T_158 = _GEN_21 & 8'hf; // @[Bitwise.scala 108:31]
  wire [7:0] _available1_T_160 = {mapped[116:113], 4'h0}; // @[Bitwise.scala 108:70]
  wire [7:0] _available1_T_162 = _available1_T_160 & 8'hf0; // @[Bitwise.scala 108:80]
  wire [7:0] _available1_T_163 = _available1_T_158 | _available1_T_162; // @[Bitwise.scala 108:39]
  wire [7:0] _GEN_22 = {{2'd0}, _available1_T_163[7:2]}; // @[Bitwise.scala 108:31]
  wire [7:0] _available1_T_168 = _GEN_22 & 8'h33; // @[Bitwise.scala 108:31]
  wire [7:0] _available1_T_170 = {_available1_T_163[5:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [7:0] _available1_T_172 = _available1_T_170 & 8'hcc; // @[Bitwise.scala 108:80]
  wire [7:0] _available1_T_173 = _available1_T_168 | _available1_T_172; // @[Bitwise.scala 108:39]
  wire [7:0] _GEN_23 = {{1'd0}, _available1_T_173[7:1]}; // @[Bitwise.scala 108:31]
  wire [7:0] _available1_T_178 = _GEN_23 & 8'h55; // @[Bitwise.scala 108:31]
  wire [7:0] _available1_T_180 = {_available1_T_173[6:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [7:0] _available1_T_182 = _available1_T_180 & 8'haa; // @[Bitwise.scala 108:80]
  wire [7:0] _available1_T_183 = _available1_T_178 | _available1_T_182; // @[Bitwise.scala 108:39]
  wire [62:0] _available1_T_205 = {_available1_T_111,_available1_T_152,_available1_T_183,mapped[121],mapped[122],mapped[
    123],mapped[124],mapped[125],mapped[126],mapped[127]}; // @[Cat.scala 33:92]
  wire [126:0] _available1_T_206 = {_available1_T_60,_available1_T_205}; // @[Cat.scala 33:92]
  wire [126:0] _available1_T_207 = ~_available1_T_206; // @[busy_table.scala 101:41]
  wire [6:0] _available1_T_335 = _available1_T_207[125] ? 7'h7d : 7'h7e; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_336 = _available1_T_207[124] ? 7'h7c : _available1_T_335; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_337 = _available1_T_207[123] ? 7'h7b : _available1_T_336; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_338 = _available1_T_207[122] ? 7'h7a : _available1_T_337; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_339 = _available1_T_207[121] ? 7'h79 : _available1_T_338; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_340 = _available1_T_207[120] ? 7'h78 : _available1_T_339; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_341 = _available1_T_207[119] ? 7'h77 : _available1_T_340; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_342 = _available1_T_207[118] ? 7'h76 : _available1_T_341; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_343 = _available1_T_207[117] ? 7'h75 : _available1_T_342; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_344 = _available1_T_207[116] ? 7'h74 : _available1_T_343; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_345 = _available1_T_207[115] ? 7'h73 : _available1_T_344; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_346 = _available1_T_207[114] ? 7'h72 : _available1_T_345; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_347 = _available1_T_207[113] ? 7'h71 : _available1_T_346; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_348 = _available1_T_207[112] ? 7'h70 : _available1_T_347; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_349 = _available1_T_207[111] ? 7'h6f : _available1_T_348; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_350 = _available1_T_207[110] ? 7'h6e : _available1_T_349; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_351 = _available1_T_207[109] ? 7'h6d : _available1_T_350; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_352 = _available1_T_207[108] ? 7'h6c : _available1_T_351; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_353 = _available1_T_207[107] ? 7'h6b : _available1_T_352; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_354 = _available1_T_207[106] ? 7'h6a : _available1_T_353; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_355 = _available1_T_207[105] ? 7'h69 : _available1_T_354; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_356 = _available1_T_207[104] ? 7'h68 : _available1_T_355; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_357 = _available1_T_207[103] ? 7'h67 : _available1_T_356; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_358 = _available1_T_207[102] ? 7'h66 : _available1_T_357; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_359 = _available1_T_207[101] ? 7'h65 : _available1_T_358; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_360 = _available1_T_207[100] ? 7'h64 : _available1_T_359; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_361 = _available1_T_207[99] ? 7'h63 : _available1_T_360; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_362 = _available1_T_207[98] ? 7'h62 : _available1_T_361; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_363 = _available1_T_207[97] ? 7'h61 : _available1_T_362; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_364 = _available1_T_207[96] ? 7'h60 : _available1_T_363; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_365 = _available1_T_207[95] ? 7'h5f : _available1_T_364; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_366 = _available1_T_207[94] ? 7'h5e : _available1_T_365; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_367 = _available1_T_207[93] ? 7'h5d : _available1_T_366; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_368 = _available1_T_207[92] ? 7'h5c : _available1_T_367; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_369 = _available1_T_207[91] ? 7'h5b : _available1_T_368; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_370 = _available1_T_207[90] ? 7'h5a : _available1_T_369; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_371 = _available1_T_207[89] ? 7'h59 : _available1_T_370; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_372 = _available1_T_207[88] ? 7'h58 : _available1_T_371; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_373 = _available1_T_207[87] ? 7'h57 : _available1_T_372; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_374 = _available1_T_207[86] ? 7'h56 : _available1_T_373; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_375 = _available1_T_207[85] ? 7'h55 : _available1_T_374; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_376 = _available1_T_207[84] ? 7'h54 : _available1_T_375; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_377 = _available1_T_207[83] ? 7'h53 : _available1_T_376; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_378 = _available1_T_207[82] ? 7'h52 : _available1_T_377; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_379 = _available1_T_207[81] ? 7'h51 : _available1_T_378; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_380 = _available1_T_207[80] ? 7'h50 : _available1_T_379; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_381 = _available1_T_207[79] ? 7'h4f : _available1_T_380; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_382 = _available1_T_207[78] ? 7'h4e : _available1_T_381; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_383 = _available1_T_207[77] ? 7'h4d : _available1_T_382; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_384 = _available1_T_207[76] ? 7'h4c : _available1_T_383; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_385 = _available1_T_207[75] ? 7'h4b : _available1_T_384; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_386 = _available1_T_207[74] ? 7'h4a : _available1_T_385; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_387 = _available1_T_207[73] ? 7'h49 : _available1_T_386; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_388 = _available1_T_207[72] ? 7'h48 : _available1_T_387; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_389 = _available1_T_207[71] ? 7'h47 : _available1_T_388; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_390 = _available1_T_207[70] ? 7'h46 : _available1_T_389; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_391 = _available1_T_207[69] ? 7'h45 : _available1_T_390; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_392 = _available1_T_207[68] ? 7'h44 : _available1_T_391; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_393 = _available1_T_207[67] ? 7'h43 : _available1_T_392; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_394 = _available1_T_207[66] ? 7'h42 : _available1_T_393; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_395 = _available1_T_207[65] ? 7'h41 : _available1_T_394; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_396 = _available1_T_207[64] ? 7'h40 : _available1_T_395; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_397 = _available1_T_207[63] ? 7'h3f : _available1_T_396; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_398 = _available1_T_207[62] ? 7'h3e : _available1_T_397; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_399 = _available1_T_207[61] ? 7'h3d : _available1_T_398; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_400 = _available1_T_207[60] ? 7'h3c : _available1_T_399; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_401 = _available1_T_207[59] ? 7'h3b : _available1_T_400; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_402 = _available1_T_207[58] ? 7'h3a : _available1_T_401; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_403 = _available1_T_207[57] ? 7'h39 : _available1_T_402; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_404 = _available1_T_207[56] ? 7'h38 : _available1_T_403; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_405 = _available1_T_207[55] ? 7'h37 : _available1_T_404; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_406 = _available1_T_207[54] ? 7'h36 : _available1_T_405; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_407 = _available1_T_207[53] ? 7'h35 : _available1_T_406; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_408 = _available1_T_207[52] ? 7'h34 : _available1_T_407; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_409 = _available1_T_207[51] ? 7'h33 : _available1_T_408; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_410 = _available1_T_207[50] ? 7'h32 : _available1_T_409; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_411 = _available1_T_207[49] ? 7'h31 : _available1_T_410; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_412 = _available1_T_207[48] ? 7'h30 : _available1_T_411; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_413 = _available1_T_207[47] ? 7'h2f : _available1_T_412; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_414 = _available1_T_207[46] ? 7'h2e : _available1_T_413; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_415 = _available1_T_207[45] ? 7'h2d : _available1_T_414; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_416 = _available1_T_207[44] ? 7'h2c : _available1_T_415; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_417 = _available1_T_207[43] ? 7'h2b : _available1_T_416; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_418 = _available1_T_207[42] ? 7'h2a : _available1_T_417; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_419 = _available1_T_207[41] ? 7'h29 : _available1_T_418; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_420 = _available1_T_207[40] ? 7'h28 : _available1_T_419; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_421 = _available1_T_207[39] ? 7'h27 : _available1_T_420; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_422 = _available1_T_207[38] ? 7'h26 : _available1_T_421; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_423 = _available1_T_207[37] ? 7'h25 : _available1_T_422; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_424 = _available1_T_207[36] ? 7'h24 : _available1_T_423; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_425 = _available1_T_207[35] ? 7'h23 : _available1_T_424; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_426 = _available1_T_207[34] ? 7'h22 : _available1_T_425; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_427 = _available1_T_207[33] ? 7'h21 : _available1_T_426; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_428 = _available1_T_207[32] ? 7'h20 : _available1_T_427; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_429 = _available1_T_207[31] ? 7'h1f : _available1_T_428; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_430 = _available1_T_207[30] ? 7'h1e : _available1_T_429; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_431 = _available1_T_207[29] ? 7'h1d : _available1_T_430; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_432 = _available1_T_207[28] ? 7'h1c : _available1_T_431; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_433 = _available1_T_207[27] ? 7'h1b : _available1_T_432; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_434 = _available1_T_207[26] ? 7'h1a : _available1_T_433; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_435 = _available1_T_207[25] ? 7'h19 : _available1_T_434; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_436 = _available1_T_207[24] ? 7'h18 : _available1_T_435; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_437 = _available1_T_207[23] ? 7'h17 : _available1_T_436; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_438 = _available1_T_207[22] ? 7'h16 : _available1_T_437; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_439 = _available1_T_207[21] ? 7'h15 : _available1_T_438; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_440 = _available1_T_207[20] ? 7'h14 : _available1_T_439; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_441 = _available1_T_207[19] ? 7'h13 : _available1_T_440; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_442 = _available1_T_207[18] ? 7'h12 : _available1_T_441; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_443 = _available1_T_207[17] ? 7'h11 : _available1_T_442; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_444 = _available1_T_207[16] ? 7'h10 : _available1_T_443; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_445 = _available1_T_207[15] ? 7'hf : _available1_T_444; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_446 = _available1_T_207[14] ? 7'he : _available1_T_445; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_447 = _available1_T_207[13] ? 7'hd : _available1_T_446; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_448 = _available1_T_207[12] ? 7'hc : _available1_T_447; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_449 = _available1_T_207[11] ? 7'hb : _available1_T_448; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_450 = _available1_T_207[10] ? 7'ha : _available1_T_449; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_451 = _available1_T_207[9] ? 7'h9 : _available1_T_450; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_452 = _available1_T_207[8] ? 7'h8 : _available1_T_451; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_453 = _available1_T_207[7] ? 7'h7 : _available1_T_452; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_454 = _available1_T_207[6] ? 7'h6 : _available1_T_453; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_455 = _available1_T_207[5] ? 7'h5 : _available1_T_454; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_456 = _available1_T_207[4] ? 7'h4 : _available1_T_455; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_457 = _available1_T_207[3] ? 7'h3 : _available1_T_456; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_458 = _available1_T_207[2] ? 7'h2 : _available1_T_457; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_459 = _available1_T_207[1] ? 7'h1 : _available1_T_458; // @[Mux.scala 47:70]
  wire [6:0] _available1_T_460 = _available1_T_207[0] ? 7'h0 : _available1_T_459; // @[Mux.scala 47:70]
  wire [6:0] available1 = 7'h7f - _available1_T_460; // @[busy_table.scala 101:24]
  assign io_o_allocated_pregs_0 = io_i_free_list_reqs_0 ? available0 : 7'h0; // @[busy_table.scala 105:35]
  assign io_o_allocated_pregs_1 = io_i_free_list_reqs_1 ? available1 : 7'h0; // @[busy_table.scala 106:35]
  assign io_o_empty = next_allocated_num == 7'h7f | next_allocated_num == 7'h7e; // @[busy_table.scala 103:48]
  assign io_o_written_back = io_i_exception ? _written_back_T_1 : _next_written_back_T_34; // @[busy_table.scala 40:29]
  always @(posedge clock) begin
    if (reset) begin // @[busy_table.scala 29:25]
      mapped <= 128'h0; // @[busy_table.scala 29:25]
    end else if (io_i_exception) begin // @[busy_table.scala 52:23]
      mapped <= _next_mapped_T;
    end else begin
      mapped <= _next_mapped_T_36;
    end
    if (reset) begin // @[busy_table.scala 30:31]
      written_back <= _written_back_T_1; // @[busy_table.scala 30:31]
    end else if (io_i_exception) begin // @[busy_table.scala 40:29]
      written_back <= _written_back_T_1;
    end else begin
      written_back <= _next_written_back_T_34;
    end
    if (reset) begin // @[busy_table.scala 88:45]
      num_mapped_not_writtenback <= 7'h0; // @[busy_table.scala 88:45]
    end else if (io_i_exception) begin // @[busy_table.scala 91:38]
      num_mapped_not_writtenback <= 7'h0;
    end else begin
      num_mapped_not_writtenback <= next_num_mapped_not_writtenback;
    end
    if (reset) begin // @[busy_table.scala 93:32]
      allocated_num <= 7'h0; // @[busy_table.scala 93:32]
    end else if (io_i_exception) begin // @[busy_table.scala 95:30]
      allocated_num <= _next_allocated_num_T_1;
    end else begin
      allocated_num <= _next_allocated_num_T_7;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~((io_i_commit_packs_0_valid | io_i_commit_packs_1_valid) & (io_i_rollback_packs_0_valid |
          io_i_rollback_packs_1_valid)))) begin
          $fwrite(32'h80000002,
            "Assertion failed: rollback and commit cannot happen at the same time\n    at busy_table.scala:26 assert(!((io.i_commit_packs(0).valid || io.i_commit_packs(1).valid) && (io.i_rollback_packs(0).valid || io.i_rollback_packs(1).valid)),\n"
            ); // @[busy_table.scala 26:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(~((io_i_commit_packs_0_valid | io_i_commit_packs_1_valid) & (io_i_rollback_packs_0_valid |
          io_i_rollback_packs_1_valid)))) begin
          $fatal; // @[busy_table.scala 26:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  _RAND_0 = {4{`RANDOM}};
  mapped = _RAND_0[127:0];
  _RAND_1 = {4{`RANDOM}};
  written_back = _RAND_1[127:0];
  _RAND_2 = {1{`RANDOM}};
  num_mapped_not_writtenback = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  allocated_num = _RAND_3[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
