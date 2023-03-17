module BPU(
  input         clock,
  input         reset,
  input  [63:0] io_i_addr,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_taken,
  input  [63:0] io_i_branch_resolve_pack_pc,
  input  [63:0] io_i_branch_resolve_pack_target,
  input         io_i_branch_resolve_pack_prediction_valid,
  input  [2:0]  io_i_branch_resolve_pack_branch_type,
  input         io_i_branch_presolve_pack_valid,
  input  [63:0] io_i_branch_presolve_pack_pc,
  output        io_o_branch_predict_pack_valid,
  output [63:0] io_o_branch_predict_pack_target,
  output [3:0]  io_o_branch_predict_pack_branch_type,
  output        io_o_branch_predict_pack_select,
  output        io_o_branch_predict_pack_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [63:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [63:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [63:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [63:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [63:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [63:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [63:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [63:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [63:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [63:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [63:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [63:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [63:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [63:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [63:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [63:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [63:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [63:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [63:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [63:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [63:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [63:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [63:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [63:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [63:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [63:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [63:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [63:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [63:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [63:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [63:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [63:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [63:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [63:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [63:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [63:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [63:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [63:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [63:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [63:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [63:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [63:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [63:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [63:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [63:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [63:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [63:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [63:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
`endif // RANDOMIZE_REG_INIT
  reg  btb_0_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_0_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_0_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_0_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_0_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_0_bht; // @[branch_predictor.scala 33:22]
  reg  btb_1_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_1_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_1_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_1_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_1_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_1_bht; // @[branch_predictor.scala 33:22]
  reg  btb_2_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_2_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_2_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_2_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_2_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_2_bht; // @[branch_predictor.scala 33:22]
  reg  btb_3_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_3_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_3_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_3_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_3_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_3_bht; // @[branch_predictor.scala 33:22]
  reg  btb_4_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_4_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_4_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_4_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_4_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_4_bht; // @[branch_predictor.scala 33:22]
  reg  btb_5_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_5_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_5_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_5_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_5_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_5_bht; // @[branch_predictor.scala 33:22]
  reg  btb_6_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_6_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_6_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_6_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_6_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_6_bht; // @[branch_predictor.scala 33:22]
  reg  btb_7_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_7_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_7_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_7_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_7_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_7_bht; // @[branch_predictor.scala 33:22]
  reg  btb_8_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_8_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_8_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_8_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_8_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_8_bht; // @[branch_predictor.scala 33:22]
  reg  btb_9_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_9_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_9_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_9_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_9_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_9_bht; // @[branch_predictor.scala 33:22]
  reg  btb_10_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_10_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_10_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_10_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_10_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_10_bht; // @[branch_predictor.scala 33:22]
  reg  btb_11_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_11_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_11_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_11_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_11_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_11_bht; // @[branch_predictor.scala 33:22]
  reg  btb_12_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_12_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_12_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_12_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_12_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_12_bht; // @[branch_predictor.scala 33:22]
  reg  btb_13_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_13_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_13_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_13_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_13_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_13_bht; // @[branch_predictor.scala 33:22]
  reg  btb_14_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_14_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_14_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_14_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_14_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_14_bht; // @[branch_predictor.scala 33:22]
  reg  btb_15_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_15_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_15_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_15_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_15_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_15_bht; // @[branch_predictor.scala 33:22]
  reg  btb_16_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_16_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_16_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_16_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_16_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_16_bht; // @[branch_predictor.scala 33:22]
  reg  btb_17_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_17_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_17_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_17_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_17_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_17_bht; // @[branch_predictor.scala 33:22]
  reg  btb_18_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_18_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_18_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_18_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_18_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_18_bht; // @[branch_predictor.scala 33:22]
  reg  btb_19_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_19_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_19_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_19_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_19_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_19_bht; // @[branch_predictor.scala 33:22]
  reg  btb_20_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_20_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_20_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_20_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_20_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_20_bht; // @[branch_predictor.scala 33:22]
  reg  btb_21_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_21_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_21_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_21_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_21_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_21_bht; // @[branch_predictor.scala 33:22]
  reg  btb_22_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_22_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_22_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_22_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_22_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_22_bht; // @[branch_predictor.scala 33:22]
  reg  btb_23_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_23_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_23_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_23_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_23_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_23_bht; // @[branch_predictor.scala 33:22]
  reg  btb_24_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_24_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_24_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_24_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_24_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_24_bht; // @[branch_predictor.scala 33:22]
  reg  btb_25_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_25_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_25_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_25_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_25_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_25_bht; // @[branch_predictor.scala 33:22]
  reg  btb_26_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_26_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_26_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_26_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_26_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_26_bht; // @[branch_predictor.scala 33:22]
  reg  btb_27_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_27_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_27_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_27_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_27_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_27_bht; // @[branch_predictor.scala 33:22]
  reg  btb_28_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_28_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_28_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_28_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_28_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_28_bht; // @[branch_predictor.scala 33:22]
  reg  btb_29_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_29_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_29_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_29_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_29_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_29_bht; // @[branch_predictor.scala 33:22]
  reg  btb_30_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_30_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_30_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_30_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_30_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_30_bht; // @[branch_predictor.scala 33:22]
  reg  btb_31_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_31_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_31_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_31_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_31_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_31_bht; // @[branch_predictor.scala 33:22]
  reg  btb_32_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_32_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_32_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_32_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_32_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_32_bht; // @[branch_predictor.scala 33:22]
  reg  btb_33_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_33_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_33_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_33_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_33_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_33_bht; // @[branch_predictor.scala 33:22]
  reg  btb_34_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_34_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_34_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_34_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_34_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_34_bht; // @[branch_predictor.scala 33:22]
  reg  btb_35_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_35_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_35_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_35_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_35_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_35_bht; // @[branch_predictor.scala 33:22]
  reg  btb_36_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_36_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_36_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_36_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_36_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_36_bht; // @[branch_predictor.scala 33:22]
  reg  btb_37_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_37_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_37_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_37_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_37_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_37_bht; // @[branch_predictor.scala 33:22]
  reg  btb_38_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_38_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_38_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_38_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_38_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_38_bht; // @[branch_predictor.scala 33:22]
  reg  btb_39_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_39_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_39_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_39_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_39_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_39_bht; // @[branch_predictor.scala 33:22]
  reg  btb_40_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_40_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_40_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_40_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_40_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_40_bht; // @[branch_predictor.scala 33:22]
  reg  btb_41_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_41_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_41_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_41_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_41_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_41_bht; // @[branch_predictor.scala 33:22]
  reg  btb_42_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_42_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_42_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_42_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_42_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_42_bht; // @[branch_predictor.scala 33:22]
  reg  btb_43_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_43_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_43_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_43_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_43_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_43_bht; // @[branch_predictor.scala 33:22]
  reg  btb_44_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_44_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_44_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_44_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_44_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_44_bht; // @[branch_predictor.scala 33:22]
  reg  btb_45_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_45_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_45_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_45_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_45_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_45_bht; // @[branch_predictor.scala 33:22]
  reg  btb_46_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_46_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_46_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_46_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_46_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_46_bht; // @[branch_predictor.scala 33:22]
  reg  btb_47_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_47_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_47_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_47_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_47_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_47_bht; // @[branch_predictor.scala 33:22]
  reg  btb_48_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_48_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_48_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_48_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_48_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_48_bht; // @[branch_predictor.scala 33:22]
  reg  btb_49_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_49_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_49_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_49_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_49_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_49_bht; // @[branch_predictor.scala 33:22]
  reg  btb_50_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_50_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_50_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_50_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_50_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_50_bht; // @[branch_predictor.scala 33:22]
  reg  btb_51_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_51_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_51_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_51_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_51_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_51_bht; // @[branch_predictor.scala 33:22]
  reg  btb_52_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_52_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_52_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_52_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_52_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_52_bht; // @[branch_predictor.scala 33:22]
  reg  btb_53_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_53_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_53_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_53_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_53_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_53_bht; // @[branch_predictor.scala 33:22]
  reg  btb_54_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_54_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_54_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_54_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_54_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_54_bht; // @[branch_predictor.scala 33:22]
  reg  btb_55_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_55_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_55_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_55_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_55_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_55_bht; // @[branch_predictor.scala 33:22]
  reg  btb_56_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_56_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_56_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_56_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_56_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_56_bht; // @[branch_predictor.scala 33:22]
  reg  btb_57_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_57_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_57_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_57_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_57_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_57_bht; // @[branch_predictor.scala 33:22]
  reg  btb_58_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_58_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_58_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_58_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_58_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_58_bht; // @[branch_predictor.scala 33:22]
  reg  btb_59_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_59_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_59_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_59_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_59_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_59_bht; // @[branch_predictor.scala 33:22]
  reg  btb_60_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_60_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_60_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_60_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_60_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_60_bht; // @[branch_predictor.scala 33:22]
  reg  btb_61_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_61_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_61_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_61_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_61_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_61_bht; // @[branch_predictor.scala 33:22]
  reg  btb_62_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_62_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_62_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_62_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_62_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_62_bht; // @[branch_predictor.scala 33:22]
  reg  btb_63_valid; // @[branch_predictor.scala 33:22]
  reg [9:0] btb_63_tag; // @[branch_predictor.scala 33:22]
  reg [3:0] btb_63_branch_type; // @[branch_predictor.scala 33:22]
  reg [63:0] btb_63_target_address; // @[branch_predictor.scala 33:22]
  reg  btb_63_select; // @[branch_predictor.scala 33:22]
  reg [1:0] btb_63_bht; // @[branch_predictor.scala 33:22]
  reg [5:0] btb_victim_ptr; // @[branch_predictor.scala 35:33]
  wire  _GEN_0 = btb_0_tag == io_i_addr[12:3] & btb_0_valid; // @[branch_predictor.scala 37:36 43:45 44:44]
  wire [63:0] _GEN_1 = btb_0_tag == io_i_addr[12:3] ? btb_0_target_address : 64'h0; // @[branch_predictor.scala 38:37 43:45 45:45]
  wire [3:0] _GEN_2 = btb_0_tag == io_i_addr[12:3] ? btb_0_branch_type : 4'h0; // @[branch_predictor.scala 39:42 43:45 46:50]
  wire  _GEN_3 = btb_0_tag == io_i_addr[12:3] & btb_0_select; // @[branch_predictor.scala 40:37 43:45 47:45]
  wire  _GEN_4 = btb_0_tag == io_i_addr[12:3] & ~btb_0_bht[1]; // @[branch_predictor.scala 41:36 43:45 48:44]
  wire  _GEN_5 = btb_1_tag == io_i_addr[12:3] ? btb_1_valid : _GEN_0; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_6 = btb_1_tag == io_i_addr[12:3] ? btb_1_target_address : _GEN_1; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_7 = btb_1_tag == io_i_addr[12:3] ? btb_1_branch_type : _GEN_2; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_8 = btb_1_tag == io_i_addr[12:3] ? btb_1_select : _GEN_3; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_9 = btb_1_tag == io_i_addr[12:3] ? ~btb_1_bht[1] : _GEN_4; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_10 = btb_2_tag == io_i_addr[12:3] ? btb_2_valid : _GEN_5; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_11 = btb_2_tag == io_i_addr[12:3] ? btb_2_target_address : _GEN_6; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_12 = btb_2_tag == io_i_addr[12:3] ? btb_2_branch_type : _GEN_7; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_13 = btb_2_tag == io_i_addr[12:3] ? btb_2_select : _GEN_8; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_14 = btb_2_tag == io_i_addr[12:3] ? ~btb_2_bht[1] : _GEN_9; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_15 = btb_3_tag == io_i_addr[12:3] ? btb_3_valid : _GEN_10; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_16 = btb_3_tag == io_i_addr[12:3] ? btb_3_target_address : _GEN_11; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_17 = btb_3_tag == io_i_addr[12:3] ? btb_3_branch_type : _GEN_12; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_18 = btb_3_tag == io_i_addr[12:3] ? btb_3_select : _GEN_13; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_19 = btb_3_tag == io_i_addr[12:3] ? ~btb_3_bht[1] : _GEN_14; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_20 = btb_4_tag == io_i_addr[12:3] ? btb_4_valid : _GEN_15; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_21 = btb_4_tag == io_i_addr[12:3] ? btb_4_target_address : _GEN_16; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_22 = btb_4_tag == io_i_addr[12:3] ? btb_4_branch_type : _GEN_17; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_23 = btb_4_tag == io_i_addr[12:3] ? btb_4_select : _GEN_18; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_24 = btb_4_tag == io_i_addr[12:3] ? ~btb_4_bht[1] : _GEN_19; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_25 = btb_5_tag == io_i_addr[12:3] ? btb_5_valid : _GEN_20; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_26 = btb_5_tag == io_i_addr[12:3] ? btb_5_target_address : _GEN_21; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_27 = btb_5_tag == io_i_addr[12:3] ? btb_5_branch_type : _GEN_22; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_28 = btb_5_tag == io_i_addr[12:3] ? btb_5_select : _GEN_23; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_29 = btb_5_tag == io_i_addr[12:3] ? ~btb_5_bht[1] : _GEN_24; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_30 = btb_6_tag == io_i_addr[12:3] ? btb_6_valid : _GEN_25; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_31 = btb_6_tag == io_i_addr[12:3] ? btb_6_target_address : _GEN_26; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_32 = btb_6_tag == io_i_addr[12:3] ? btb_6_branch_type : _GEN_27; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_33 = btb_6_tag == io_i_addr[12:3] ? btb_6_select : _GEN_28; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_34 = btb_6_tag == io_i_addr[12:3] ? ~btb_6_bht[1] : _GEN_29; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_35 = btb_7_tag == io_i_addr[12:3] ? btb_7_valid : _GEN_30; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_36 = btb_7_tag == io_i_addr[12:3] ? btb_7_target_address : _GEN_31; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_37 = btb_7_tag == io_i_addr[12:3] ? btb_7_branch_type : _GEN_32; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_38 = btb_7_tag == io_i_addr[12:3] ? btb_7_select : _GEN_33; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_39 = btb_7_tag == io_i_addr[12:3] ? ~btb_7_bht[1] : _GEN_34; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_40 = btb_8_tag == io_i_addr[12:3] ? btb_8_valid : _GEN_35; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_41 = btb_8_tag == io_i_addr[12:3] ? btb_8_target_address : _GEN_36; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_42 = btb_8_tag == io_i_addr[12:3] ? btb_8_branch_type : _GEN_37; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_43 = btb_8_tag == io_i_addr[12:3] ? btb_8_select : _GEN_38; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_44 = btb_8_tag == io_i_addr[12:3] ? ~btb_8_bht[1] : _GEN_39; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_45 = btb_9_tag == io_i_addr[12:3] ? btb_9_valid : _GEN_40; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_46 = btb_9_tag == io_i_addr[12:3] ? btb_9_target_address : _GEN_41; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_47 = btb_9_tag == io_i_addr[12:3] ? btb_9_branch_type : _GEN_42; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_48 = btb_9_tag == io_i_addr[12:3] ? btb_9_select : _GEN_43; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_49 = btb_9_tag == io_i_addr[12:3] ? ~btb_9_bht[1] : _GEN_44; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_50 = btb_10_tag == io_i_addr[12:3] ? btb_10_valid : _GEN_45; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_51 = btb_10_tag == io_i_addr[12:3] ? btb_10_target_address : _GEN_46; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_52 = btb_10_tag == io_i_addr[12:3] ? btb_10_branch_type : _GEN_47; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_53 = btb_10_tag == io_i_addr[12:3] ? btb_10_select : _GEN_48; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_54 = btb_10_tag == io_i_addr[12:3] ? ~btb_10_bht[1] : _GEN_49; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_55 = btb_11_tag == io_i_addr[12:3] ? btb_11_valid : _GEN_50; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_56 = btb_11_tag == io_i_addr[12:3] ? btb_11_target_address : _GEN_51; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_57 = btb_11_tag == io_i_addr[12:3] ? btb_11_branch_type : _GEN_52; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_58 = btb_11_tag == io_i_addr[12:3] ? btb_11_select : _GEN_53; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_59 = btb_11_tag == io_i_addr[12:3] ? ~btb_11_bht[1] : _GEN_54; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_60 = btb_12_tag == io_i_addr[12:3] ? btb_12_valid : _GEN_55; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_61 = btb_12_tag == io_i_addr[12:3] ? btb_12_target_address : _GEN_56; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_62 = btb_12_tag == io_i_addr[12:3] ? btb_12_branch_type : _GEN_57; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_63 = btb_12_tag == io_i_addr[12:3] ? btb_12_select : _GEN_58; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_64 = btb_12_tag == io_i_addr[12:3] ? ~btb_12_bht[1] : _GEN_59; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_65 = btb_13_tag == io_i_addr[12:3] ? btb_13_valid : _GEN_60; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_66 = btb_13_tag == io_i_addr[12:3] ? btb_13_target_address : _GEN_61; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_67 = btb_13_tag == io_i_addr[12:3] ? btb_13_branch_type : _GEN_62; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_68 = btb_13_tag == io_i_addr[12:3] ? btb_13_select : _GEN_63; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_69 = btb_13_tag == io_i_addr[12:3] ? ~btb_13_bht[1] : _GEN_64; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_70 = btb_14_tag == io_i_addr[12:3] ? btb_14_valid : _GEN_65; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_71 = btb_14_tag == io_i_addr[12:3] ? btb_14_target_address : _GEN_66; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_72 = btb_14_tag == io_i_addr[12:3] ? btb_14_branch_type : _GEN_67; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_73 = btb_14_tag == io_i_addr[12:3] ? btb_14_select : _GEN_68; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_74 = btb_14_tag == io_i_addr[12:3] ? ~btb_14_bht[1] : _GEN_69; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_75 = btb_15_tag == io_i_addr[12:3] ? btb_15_valid : _GEN_70; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_76 = btb_15_tag == io_i_addr[12:3] ? btb_15_target_address : _GEN_71; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_77 = btb_15_tag == io_i_addr[12:3] ? btb_15_branch_type : _GEN_72; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_78 = btb_15_tag == io_i_addr[12:3] ? btb_15_select : _GEN_73; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_79 = btb_15_tag == io_i_addr[12:3] ? ~btb_15_bht[1] : _GEN_74; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_80 = btb_16_tag == io_i_addr[12:3] ? btb_16_valid : _GEN_75; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_81 = btb_16_tag == io_i_addr[12:3] ? btb_16_target_address : _GEN_76; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_82 = btb_16_tag == io_i_addr[12:3] ? btb_16_branch_type : _GEN_77; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_83 = btb_16_tag == io_i_addr[12:3] ? btb_16_select : _GEN_78; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_84 = btb_16_tag == io_i_addr[12:3] ? ~btb_16_bht[1] : _GEN_79; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_85 = btb_17_tag == io_i_addr[12:3] ? btb_17_valid : _GEN_80; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_86 = btb_17_tag == io_i_addr[12:3] ? btb_17_target_address : _GEN_81; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_87 = btb_17_tag == io_i_addr[12:3] ? btb_17_branch_type : _GEN_82; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_88 = btb_17_tag == io_i_addr[12:3] ? btb_17_select : _GEN_83; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_89 = btb_17_tag == io_i_addr[12:3] ? ~btb_17_bht[1] : _GEN_84; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_90 = btb_18_tag == io_i_addr[12:3] ? btb_18_valid : _GEN_85; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_91 = btb_18_tag == io_i_addr[12:3] ? btb_18_target_address : _GEN_86; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_92 = btb_18_tag == io_i_addr[12:3] ? btb_18_branch_type : _GEN_87; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_93 = btb_18_tag == io_i_addr[12:3] ? btb_18_select : _GEN_88; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_94 = btb_18_tag == io_i_addr[12:3] ? ~btb_18_bht[1] : _GEN_89; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_95 = btb_19_tag == io_i_addr[12:3] ? btb_19_valid : _GEN_90; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_96 = btb_19_tag == io_i_addr[12:3] ? btb_19_target_address : _GEN_91; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_97 = btb_19_tag == io_i_addr[12:3] ? btb_19_branch_type : _GEN_92; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_98 = btb_19_tag == io_i_addr[12:3] ? btb_19_select : _GEN_93; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_99 = btb_19_tag == io_i_addr[12:3] ? ~btb_19_bht[1] : _GEN_94; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_100 = btb_20_tag == io_i_addr[12:3] ? btb_20_valid : _GEN_95; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_101 = btb_20_tag == io_i_addr[12:3] ? btb_20_target_address : _GEN_96; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_102 = btb_20_tag == io_i_addr[12:3] ? btb_20_branch_type : _GEN_97; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_103 = btb_20_tag == io_i_addr[12:3] ? btb_20_select : _GEN_98; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_104 = btb_20_tag == io_i_addr[12:3] ? ~btb_20_bht[1] : _GEN_99; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_105 = btb_21_tag == io_i_addr[12:3] ? btb_21_valid : _GEN_100; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_106 = btb_21_tag == io_i_addr[12:3] ? btb_21_target_address : _GEN_101; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_107 = btb_21_tag == io_i_addr[12:3] ? btb_21_branch_type : _GEN_102; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_108 = btb_21_tag == io_i_addr[12:3] ? btb_21_select : _GEN_103; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_109 = btb_21_tag == io_i_addr[12:3] ? ~btb_21_bht[1] : _GEN_104; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_110 = btb_22_tag == io_i_addr[12:3] ? btb_22_valid : _GEN_105; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_111 = btb_22_tag == io_i_addr[12:3] ? btb_22_target_address : _GEN_106; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_112 = btb_22_tag == io_i_addr[12:3] ? btb_22_branch_type : _GEN_107; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_113 = btb_22_tag == io_i_addr[12:3] ? btb_22_select : _GEN_108; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_114 = btb_22_tag == io_i_addr[12:3] ? ~btb_22_bht[1] : _GEN_109; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_115 = btb_23_tag == io_i_addr[12:3] ? btb_23_valid : _GEN_110; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_116 = btb_23_tag == io_i_addr[12:3] ? btb_23_target_address : _GEN_111; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_117 = btb_23_tag == io_i_addr[12:3] ? btb_23_branch_type : _GEN_112; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_118 = btb_23_tag == io_i_addr[12:3] ? btb_23_select : _GEN_113; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_119 = btb_23_tag == io_i_addr[12:3] ? ~btb_23_bht[1] : _GEN_114; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_120 = btb_24_tag == io_i_addr[12:3] ? btb_24_valid : _GEN_115; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_121 = btb_24_tag == io_i_addr[12:3] ? btb_24_target_address : _GEN_116; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_122 = btb_24_tag == io_i_addr[12:3] ? btb_24_branch_type : _GEN_117; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_123 = btb_24_tag == io_i_addr[12:3] ? btb_24_select : _GEN_118; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_124 = btb_24_tag == io_i_addr[12:3] ? ~btb_24_bht[1] : _GEN_119; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_125 = btb_25_tag == io_i_addr[12:3] ? btb_25_valid : _GEN_120; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_126 = btb_25_tag == io_i_addr[12:3] ? btb_25_target_address : _GEN_121; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_127 = btb_25_tag == io_i_addr[12:3] ? btb_25_branch_type : _GEN_122; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_128 = btb_25_tag == io_i_addr[12:3] ? btb_25_select : _GEN_123; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_129 = btb_25_tag == io_i_addr[12:3] ? ~btb_25_bht[1] : _GEN_124; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_130 = btb_26_tag == io_i_addr[12:3] ? btb_26_valid : _GEN_125; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_131 = btb_26_tag == io_i_addr[12:3] ? btb_26_target_address : _GEN_126; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_132 = btb_26_tag == io_i_addr[12:3] ? btb_26_branch_type : _GEN_127; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_133 = btb_26_tag == io_i_addr[12:3] ? btb_26_select : _GEN_128; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_134 = btb_26_tag == io_i_addr[12:3] ? ~btb_26_bht[1] : _GEN_129; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_135 = btb_27_tag == io_i_addr[12:3] ? btb_27_valid : _GEN_130; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_136 = btb_27_tag == io_i_addr[12:3] ? btb_27_target_address : _GEN_131; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_137 = btb_27_tag == io_i_addr[12:3] ? btb_27_branch_type : _GEN_132; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_138 = btb_27_tag == io_i_addr[12:3] ? btb_27_select : _GEN_133; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_139 = btb_27_tag == io_i_addr[12:3] ? ~btb_27_bht[1] : _GEN_134; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_140 = btb_28_tag == io_i_addr[12:3] ? btb_28_valid : _GEN_135; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_141 = btb_28_tag == io_i_addr[12:3] ? btb_28_target_address : _GEN_136; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_142 = btb_28_tag == io_i_addr[12:3] ? btb_28_branch_type : _GEN_137; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_143 = btb_28_tag == io_i_addr[12:3] ? btb_28_select : _GEN_138; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_144 = btb_28_tag == io_i_addr[12:3] ? ~btb_28_bht[1] : _GEN_139; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_145 = btb_29_tag == io_i_addr[12:3] ? btb_29_valid : _GEN_140; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_146 = btb_29_tag == io_i_addr[12:3] ? btb_29_target_address : _GEN_141; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_147 = btb_29_tag == io_i_addr[12:3] ? btb_29_branch_type : _GEN_142; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_148 = btb_29_tag == io_i_addr[12:3] ? btb_29_select : _GEN_143; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_149 = btb_29_tag == io_i_addr[12:3] ? ~btb_29_bht[1] : _GEN_144; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_150 = btb_30_tag == io_i_addr[12:3] ? btb_30_valid : _GEN_145; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_151 = btb_30_tag == io_i_addr[12:3] ? btb_30_target_address : _GEN_146; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_152 = btb_30_tag == io_i_addr[12:3] ? btb_30_branch_type : _GEN_147; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_153 = btb_30_tag == io_i_addr[12:3] ? btb_30_select : _GEN_148; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_154 = btb_30_tag == io_i_addr[12:3] ? ~btb_30_bht[1] : _GEN_149; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_155 = btb_31_tag == io_i_addr[12:3] ? btb_31_valid : _GEN_150; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_156 = btb_31_tag == io_i_addr[12:3] ? btb_31_target_address : _GEN_151; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_157 = btb_31_tag == io_i_addr[12:3] ? btb_31_branch_type : _GEN_152; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_158 = btb_31_tag == io_i_addr[12:3] ? btb_31_select : _GEN_153; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_159 = btb_31_tag == io_i_addr[12:3] ? ~btb_31_bht[1] : _GEN_154; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_160 = btb_32_tag == io_i_addr[12:3] ? btb_32_valid : _GEN_155; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_161 = btb_32_tag == io_i_addr[12:3] ? btb_32_target_address : _GEN_156; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_162 = btb_32_tag == io_i_addr[12:3] ? btb_32_branch_type : _GEN_157; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_163 = btb_32_tag == io_i_addr[12:3] ? btb_32_select : _GEN_158; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_164 = btb_32_tag == io_i_addr[12:3] ? ~btb_32_bht[1] : _GEN_159; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_165 = btb_33_tag == io_i_addr[12:3] ? btb_33_valid : _GEN_160; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_166 = btb_33_tag == io_i_addr[12:3] ? btb_33_target_address : _GEN_161; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_167 = btb_33_tag == io_i_addr[12:3] ? btb_33_branch_type : _GEN_162; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_168 = btb_33_tag == io_i_addr[12:3] ? btb_33_select : _GEN_163; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_169 = btb_33_tag == io_i_addr[12:3] ? ~btb_33_bht[1] : _GEN_164; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_170 = btb_34_tag == io_i_addr[12:3] ? btb_34_valid : _GEN_165; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_171 = btb_34_tag == io_i_addr[12:3] ? btb_34_target_address : _GEN_166; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_172 = btb_34_tag == io_i_addr[12:3] ? btb_34_branch_type : _GEN_167; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_173 = btb_34_tag == io_i_addr[12:3] ? btb_34_select : _GEN_168; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_174 = btb_34_tag == io_i_addr[12:3] ? ~btb_34_bht[1] : _GEN_169; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_175 = btb_35_tag == io_i_addr[12:3] ? btb_35_valid : _GEN_170; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_176 = btb_35_tag == io_i_addr[12:3] ? btb_35_target_address : _GEN_171; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_177 = btb_35_tag == io_i_addr[12:3] ? btb_35_branch_type : _GEN_172; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_178 = btb_35_tag == io_i_addr[12:3] ? btb_35_select : _GEN_173; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_179 = btb_35_tag == io_i_addr[12:3] ? ~btb_35_bht[1] : _GEN_174; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_180 = btb_36_tag == io_i_addr[12:3] ? btb_36_valid : _GEN_175; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_181 = btb_36_tag == io_i_addr[12:3] ? btb_36_target_address : _GEN_176; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_182 = btb_36_tag == io_i_addr[12:3] ? btb_36_branch_type : _GEN_177; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_183 = btb_36_tag == io_i_addr[12:3] ? btb_36_select : _GEN_178; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_184 = btb_36_tag == io_i_addr[12:3] ? ~btb_36_bht[1] : _GEN_179; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_185 = btb_37_tag == io_i_addr[12:3] ? btb_37_valid : _GEN_180; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_186 = btb_37_tag == io_i_addr[12:3] ? btb_37_target_address : _GEN_181; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_187 = btb_37_tag == io_i_addr[12:3] ? btb_37_branch_type : _GEN_182; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_188 = btb_37_tag == io_i_addr[12:3] ? btb_37_select : _GEN_183; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_189 = btb_37_tag == io_i_addr[12:3] ? ~btb_37_bht[1] : _GEN_184; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_190 = btb_38_tag == io_i_addr[12:3] ? btb_38_valid : _GEN_185; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_191 = btb_38_tag == io_i_addr[12:3] ? btb_38_target_address : _GEN_186; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_192 = btb_38_tag == io_i_addr[12:3] ? btb_38_branch_type : _GEN_187; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_193 = btb_38_tag == io_i_addr[12:3] ? btb_38_select : _GEN_188; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_194 = btb_38_tag == io_i_addr[12:3] ? ~btb_38_bht[1] : _GEN_189; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_195 = btb_39_tag == io_i_addr[12:3] ? btb_39_valid : _GEN_190; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_196 = btb_39_tag == io_i_addr[12:3] ? btb_39_target_address : _GEN_191; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_197 = btb_39_tag == io_i_addr[12:3] ? btb_39_branch_type : _GEN_192; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_198 = btb_39_tag == io_i_addr[12:3] ? btb_39_select : _GEN_193; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_199 = btb_39_tag == io_i_addr[12:3] ? ~btb_39_bht[1] : _GEN_194; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_200 = btb_40_tag == io_i_addr[12:3] ? btb_40_valid : _GEN_195; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_201 = btb_40_tag == io_i_addr[12:3] ? btb_40_target_address : _GEN_196; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_202 = btb_40_tag == io_i_addr[12:3] ? btb_40_branch_type : _GEN_197; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_203 = btb_40_tag == io_i_addr[12:3] ? btb_40_select : _GEN_198; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_204 = btb_40_tag == io_i_addr[12:3] ? ~btb_40_bht[1] : _GEN_199; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_205 = btb_41_tag == io_i_addr[12:3] ? btb_41_valid : _GEN_200; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_206 = btb_41_tag == io_i_addr[12:3] ? btb_41_target_address : _GEN_201; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_207 = btb_41_tag == io_i_addr[12:3] ? btb_41_branch_type : _GEN_202; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_208 = btb_41_tag == io_i_addr[12:3] ? btb_41_select : _GEN_203; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_209 = btb_41_tag == io_i_addr[12:3] ? ~btb_41_bht[1] : _GEN_204; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_210 = btb_42_tag == io_i_addr[12:3] ? btb_42_valid : _GEN_205; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_211 = btb_42_tag == io_i_addr[12:3] ? btb_42_target_address : _GEN_206; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_212 = btb_42_tag == io_i_addr[12:3] ? btb_42_branch_type : _GEN_207; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_213 = btb_42_tag == io_i_addr[12:3] ? btb_42_select : _GEN_208; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_214 = btb_42_tag == io_i_addr[12:3] ? ~btb_42_bht[1] : _GEN_209; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_215 = btb_43_tag == io_i_addr[12:3] ? btb_43_valid : _GEN_210; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_216 = btb_43_tag == io_i_addr[12:3] ? btb_43_target_address : _GEN_211; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_217 = btb_43_tag == io_i_addr[12:3] ? btb_43_branch_type : _GEN_212; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_218 = btb_43_tag == io_i_addr[12:3] ? btb_43_select : _GEN_213; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_219 = btb_43_tag == io_i_addr[12:3] ? ~btb_43_bht[1] : _GEN_214; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_220 = btb_44_tag == io_i_addr[12:3] ? btb_44_valid : _GEN_215; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_221 = btb_44_tag == io_i_addr[12:3] ? btb_44_target_address : _GEN_216; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_222 = btb_44_tag == io_i_addr[12:3] ? btb_44_branch_type : _GEN_217; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_223 = btb_44_tag == io_i_addr[12:3] ? btb_44_select : _GEN_218; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_224 = btb_44_tag == io_i_addr[12:3] ? ~btb_44_bht[1] : _GEN_219; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_225 = btb_45_tag == io_i_addr[12:3] ? btb_45_valid : _GEN_220; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_226 = btb_45_tag == io_i_addr[12:3] ? btb_45_target_address : _GEN_221; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_227 = btb_45_tag == io_i_addr[12:3] ? btb_45_branch_type : _GEN_222; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_228 = btb_45_tag == io_i_addr[12:3] ? btb_45_select : _GEN_223; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_229 = btb_45_tag == io_i_addr[12:3] ? ~btb_45_bht[1] : _GEN_224; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_230 = btb_46_tag == io_i_addr[12:3] ? btb_46_valid : _GEN_225; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_231 = btb_46_tag == io_i_addr[12:3] ? btb_46_target_address : _GEN_226; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_232 = btb_46_tag == io_i_addr[12:3] ? btb_46_branch_type : _GEN_227; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_233 = btb_46_tag == io_i_addr[12:3] ? btb_46_select : _GEN_228; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_234 = btb_46_tag == io_i_addr[12:3] ? ~btb_46_bht[1] : _GEN_229; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_235 = btb_47_tag == io_i_addr[12:3] ? btb_47_valid : _GEN_230; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_236 = btb_47_tag == io_i_addr[12:3] ? btb_47_target_address : _GEN_231; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_237 = btb_47_tag == io_i_addr[12:3] ? btb_47_branch_type : _GEN_232; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_238 = btb_47_tag == io_i_addr[12:3] ? btb_47_select : _GEN_233; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_239 = btb_47_tag == io_i_addr[12:3] ? ~btb_47_bht[1] : _GEN_234; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_240 = btb_48_tag == io_i_addr[12:3] ? btb_48_valid : _GEN_235; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_241 = btb_48_tag == io_i_addr[12:3] ? btb_48_target_address : _GEN_236; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_242 = btb_48_tag == io_i_addr[12:3] ? btb_48_branch_type : _GEN_237; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_243 = btb_48_tag == io_i_addr[12:3] ? btb_48_select : _GEN_238; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_244 = btb_48_tag == io_i_addr[12:3] ? ~btb_48_bht[1] : _GEN_239; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_245 = btb_49_tag == io_i_addr[12:3] ? btb_49_valid : _GEN_240; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_246 = btb_49_tag == io_i_addr[12:3] ? btb_49_target_address : _GEN_241; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_247 = btb_49_tag == io_i_addr[12:3] ? btb_49_branch_type : _GEN_242; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_248 = btb_49_tag == io_i_addr[12:3] ? btb_49_select : _GEN_243; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_249 = btb_49_tag == io_i_addr[12:3] ? ~btb_49_bht[1] : _GEN_244; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_250 = btb_50_tag == io_i_addr[12:3] ? btb_50_valid : _GEN_245; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_251 = btb_50_tag == io_i_addr[12:3] ? btb_50_target_address : _GEN_246; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_252 = btb_50_tag == io_i_addr[12:3] ? btb_50_branch_type : _GEN_247; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_253 = btb_50_tag == io_i_addr[12:3] ? btb_50_select : _GEN_248; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_254 = btb_50_tag == io_i_addr[12:3] ? ~btb_50_bht[1] : _GEN_249; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_255 = btb_51_tag == io_i_addr[12:3] ? btb_51_valid : _GEN_250; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_256 = btb_51_tag == io_i_addr[12:3] ? btb_51_target_address : _GEN_251; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_257 = btb_51_tag == io_i_addr[12:3] ? btb_51_branch_type : _GEN_252; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_258 = btb_51_tag == io_i_addr[12:3] ? btb_51_select : _GEN_253; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_259 = btb_51_tag == io_i_addr[12:3] ? ~btb_51_bht[1] : _GEN_254; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_260 = btb_52_tag == io_i_addr[12:3] ? btb_52_valid : _GEN_255; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_261 = btb_52_tag == io_i_addr[12:3] ? btb_52_target_address : _GEN_256; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_262 = btb_52_tag == io_i_addr[12:3] ? btb_52_branch_type : _GEN_257; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_263 = btb_52_tag == io_i_addr[12:3] ? btb_52_select : _GEN_258; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_264 = btb_52_tag == io_i_addr[12:3] ? ~btb_52_bht[1] : _GEN_259; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_265 = btb_53_tag == io_i_addr[12:3] ? btb_53_valid : _GEN_260; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_266 = btb_53_tag == io_i_addr[12:3] ? btb_53_target_address : _GEN_261; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_267 = btb_53_tag == io_i_addr[12:3] ? btb_53_branch_type : _GEN_262; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_268 = btb_53_tag == io_i_addr[12:3] ? btb_53_select : _GEN_263; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_269 = btb_53_tag == io_i_addr[12:3] ? ~btb_53_bht[1] : _GEN_264; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_270 = btb_54_tag == io_i_addr[12:3] ? btb_54_valid : _GEN_265; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_271 = btb_54_tag == io_i_addr[12:3] ? btb_54_target_address : _GEN_266; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_272 = btb_54_tag == io_i_addr[12:3] ? btb_54_branch_type : _GEN_267; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_273 = btb_54_tag == io_i_addr[12:3] ? btb_54_select : _GEN_268; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_274 = btb_54_tag == io_i_addr[12:3] ? ~btb_54_bht[1] : _GEN_269; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_275 = btb_55_tag == io_i_addr[12:3] ? btb_55_valid : _GEN_270; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_276 = btb_55_tag == io_i_addr[12:3] ? btb_55_target_address : _GEN_271; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_277 = btb_55_tag == io_i_addr[12:3] ? btb_55_branch_type : _GEN_272; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_278 = btb_55_tag == io_i_addr[12:3] ? btb_55_select : _GEN_273; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_279 = btb_55_tag == io_i_addr[12:3] ? ~btb_55_bht[1] : _GEN_274; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_280 = btb_56_tag == io_i_addr[12:3] ? btb_56_valid : _GEN_275; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_281 = btb_56_tag == io_i_addr[12:3] ? btb_56_target_address : _GEN_276; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_282 = btb_56_tag == io_i_addr[12:3] ? btb_56_branch_type : _GEN_277; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_283 = btb_56_tag == io_i_addr[12:3] ? btb_56_select : _GEN_278; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_284 = btb_56_tag == io_i_addr[12:3] ? ~btb_56_bht[1] : _GEN_279; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_285 = btb_57_tag == io_i_addr[12:3] ? btb_57_valid : _GEN_280; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_286 = btb_57_tag == io_i_addr[12:3] ? btb_57_target_address : _GEN_281; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_287 = btb_57_tag == io_i_addr[12:3] ? btb_57_branch_type : _GEN_282; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_288 = btb_57_tag == io_i_addr[12:3] ? btb_57_select : _GEN_283; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_289 = btb_57_tag == io_i_addr[12:3] ? ~btb_57_bht[1] : _GEN_284; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_290 = btb_58_tag == io_i_addr[12:3] ? btb_58_valid : _GEN_285; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_291 = btb_58_tag == io_i_addr[12:3] ? btb_58_target_address : _GEN_286; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_292 = btb_58_tag == io_i_addr[12:3] ? btb_58_branch_type : _GEN_287; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_293 = btb_58_tag == io_i_addr[12:3] ? btb_58_select : _GEN_288; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_294 = btb_58_tag == io_i_addr[12:3] ? ~btb_58_bht[1] : _GEN_289; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_295 = btb_59_tag == io_i_addr[12:3] ? btb_59_valid : _GEN_290; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_296 = btb_59_tag == io_i_addr[12:3] ? btb_59_target_address : _GEN_291; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_297 = btb_59_tag == io_i_addr[12:3] ? btb_59_branch_type : _GEN_292; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_298 = btb_59_tag == io_i_addr[12:3] ? btb_59_select : _GEN_293; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_299 = btb_59_tag == io_i_addr[12:3] ? ~btb_59_bht[1] : _GEN_294; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_300 = btb_60_tag == io_i_addr[12:3] ? btb_60_valid : _GEN_295; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_301 = btb_60_tag == io_i_addr[12:3] ? btb_60_target_address : _GEN_296; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_302 = btb_60_tag == io_i_addr[12:3] ? btb_60_branch_type : _GEN_297; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_303 = btb_60_tag == io_i_addr[12:3] ? btb_60_select : _GEN_298; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_304 = btb_60_tag == io_i_addr[12:3] ? ~btb_60_bht[1] : _GEN_299; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_305 = btb_61_tag == io_i_addr[12:3] ? btb_61_valid : _GEN_300; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_306 = btb_61_tag == io_i_addr[12:3] ? btb_61_target_address : _GEN_301; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_307 = btb_61_tag == io_i_addr[12:3] ? btb_61_branch_type : _GEN_302; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_308 = btb_61_tag == io_i_addr[12:3] ? btb_61_select : _GEN_303; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_309 = btb_61_tag == io_i_addr[12:3] ? ~btb_61_bht[1] : _GEN_304; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_310 = btb_62_tag == io_i_addr[12:3] ? btb_62_valid : _GEN_305; // @[branch_predictor.scala 43:45 44:44]
  wire [63:0] _GEN_311 = btb_62_tag == io_i_addr[12:3] ? btb_62_target_address : _GEN_306; // @[branch_predictor.scala 43:45 45:45]
  wire [3:0] _GEN_312 = btb_62_tag == io_i_addr[12:3] ? btb_62_branch_type : _GEN_307; // @[branch_predictor.scala 43:45 46:50]
  wire  _GEN_313 = btb_62_tag == io_i_addr[12:3] ? btb_62_select : _GEN_308; // @[branch_predictor.scala 43:45 47:45]
  wire  _GEN_314 = btb_62_tag == io_i_addr[12:3] ? ~btb_62_bht[1] : _GEN_309; // @[branch_predictor.scala 43:45 48:44]
  wire  _GEN_2627 = 6'h0 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_320 = 6'h0 == btb_victim_ptr | btb_0_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2628 = 6'h1 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_321 = 6'h1 == btb_victim_ptr | btb_1_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2629 = 6'h2 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_322 = 6'h2 == btb_victim_ptr | btb_2_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2630 = 6'h3 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_323 = 6'h3 == btb_victim_ptr | btb_3_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2631 = 6'h4 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_324 = 6'h4 == btb_victim_ptr | btb_4_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2632 = 6'h5 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_325 = 6'h5 == btb_victim_ptr | btb_5_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2633 = 6'h6 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_326 = 6'h6 == btb_victim_ptr | btb_6_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2634 = 6'h7 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_327 = 6'h7 == btb_victim_ptr | btb_7_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2635 = 6'h8 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_328 = 6'h8 == btb_victim_ptr | btb_8_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2636 = 6'h9 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_329 = 6'h9 == btb_victim_ptr | btb_9_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2637 = 6'ha == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_330 = 6'ha == btb_victim_ptr | btb_10_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2638 = 6'hb == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_331 = 6'hb == btb_victim_ptr | btb_11_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2639 = 6'hc == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_332 = 6'hc == btb_victim_ptr | btb_12_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2640 = 6'hd == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_333 = 6'hd == btb_victim_ptr | btb_13_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2641 = 6'he == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_334 = 6'he == btb_victim_ptr | btb_14_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2642 = 6'hf == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_335 = 6'hf == btb_victim_ptr | btb_15_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2643 = 6'h10 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_336 = 6'h10 == btb_victim_ptr | btb_16_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2644 = 6'h11 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_337 = 6'h11 == btb_victim_ptr | btb_17_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2645 = 6'h12 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_338 = 6'h12 == btb_victim_ptr | btb_18_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2646 = 6'h13 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_339 = 6'h13 == btb_victim_ptr | btb_19_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2647 = 6'h14 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_340 = 6'h14 == btb_victim_ptr | btb_20_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2648 = 6'h15 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_341 = 6'h15 == btb_victim_ptr | btb_21_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2649 = 6'h16 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_342 = 6'h16 == btb_victim_ptr | btb_22_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2650 = 6'h17 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_343 = 6'h17 == btb_victim_ptr | btb_23_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2651 = 6'h18 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_344 = 6'h18 == btb_victim_ptr | btb_24_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2652 = 6'h19 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_345 = 6'h19 == btb_victim_ptr | btb_25_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2653 = 6'h1a == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_346 = 6'h1a == btb_victim_ptr | btb_26_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2654 = 6'h1b == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_347 = 6'h1b == btb_victim_ptr | btb_27_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2655 = 6'h1c == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_348 = 6'h1c == btb_victim_ptr | btb_28_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2656 = 6'h1d == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_349 = 6'h1d == btb_victim_ptr | btb_29_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2657 = 6'h1e == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_350 = 6'h1e == btb_victim_ptr | btb_30_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2658 = 6'h1f == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_351 = 6'h1f == btb_victim_ptr | btb_31_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2659 = 6'h20 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_352 = 6'h20 == btb_victim_ptr | btb_32_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2660 = 6'h21 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_353 = 6'h21 == btb_victim_ptr | btb_33_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2661 = 6'h22 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_354 = 6'h22 == btb_victim_ptr | btb_34_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2662 = 6'h23 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_355 = 6'h23 == btb_victim_ptr | btb_35_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2663 = 6'h24 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_356 = 6'h24 == btb_victim_ptr | btb_36_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2664 = 6'h25 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_357 = 6'h25 == btb_victim_ptr | btb_37_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2665 = 6'h26 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_358 = 6'h26 == btb_victim_ptr | btb_38_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2666 = 6'h27 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_359 = 6'h27 == btb_victim_ptr | btb_39_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2667 = 6'h28 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_360 = 6'h28 == btb_victim_ptr | btb_40_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2668 = 6'h29 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_361 = 6'h29 == btb_victim_ptr | btb_41_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2669 = 6'h2a == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_362 = 6'h2a == btb_victim_ptr | btb_42_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2670 = 6'h2b == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_363 = 6'h2b == btb_victim_ptr | btb_43_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2671 = 6'h2c == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_364 = 6'h2c == btb_victim_ptr | btb_44_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2672 = 6'h2d == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_365 = 6'h2d == btb_victim_ptr | btb_45_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2673 = 6'h2e == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_366 = 6'h2e == btb_victim_ptr | btb_46_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2674 = 6'h2f == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_367 = 6'h2f == btb_victim_ptr | btb_47_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2675 = 6'h30 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_368 = 6'h30 == btb_victim_ptr | btb_48_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2676 = 6'h31 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_369 = 6'h31 == btb_victim_ptr | btb_49_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2677 = 6'h32 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_370 = 6'h32 == btb_victim_ptr | btb_50_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2678 = 6'h33 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_371 = 6'h33 == btb_victim_ptr | btb_51_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2679 = 6'h34 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_372 = 6'h34 == btb_victim_ptr | btb_52_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2680 = 6'h35 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_373 = 6'h35 == btb_victim_ptr | btb_53_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2681 = 6'h36 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_374 = 6'h36 == btb_victim_ptr | btb_54_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2682 = 6'h37 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_375 = 6'h37 == btb_victim_ptr | btb_55_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2683 = 6'h38 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_376 = 6'h38 == btb_victim_ptr | btb_56_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2684 = 6'h39 == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_377 = 6'h39 == btb_victim_ptr | btb_57_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2685 = 6'h3a == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_378 = 6'h3a == btb_victim_ptr | btb_58_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2686 = 6'h3b == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_379 = 6'h3b == btb_victim_ptr | btb_59_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2687 = 6'h3c == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_380 = 6'h3c == btb_victim_ptr | btb_60_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2688 = 6'h3d == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_381 = 6'h3d == btb_victim_ptr | btb_61_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2689 = 6'h3e == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_382 = 6'h3e == btb_victim_ptr | btb_62_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_2690 = 6'h3f == btb_victim_ptr; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire  _GEN_383 = 6'h3f == btb_victim_ptr | btb_63_valid; // @[branch_predictor.scala 33:22 66:{35,35}]
  wire [9:0] _GEN_384 = 6'h0 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_0_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_385 = 6'h1 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_1_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_386 = 6'h2 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_2_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_387 = 6'h3 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_3_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_388 = 6'h4 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_4_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_389 = 6'h5 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_5_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_390 = 6'h6 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_6_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_391 = 6'h7 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_7_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_392 = 6'h8 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_8_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_393 = 6'h9 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_9_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_394 = 6'ha == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_10_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_395 = 6'hb == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_11_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_396 = 6'hc == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_12_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_397 = 6'hd == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_13_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_398 = 6'he == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_14_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_399 = 6'hf == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_15_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_400 = 6'h10 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_16_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_401 = 6'h11 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_17_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_402 = 6'h12 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_18_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_403 = 6'h13 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_19_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_404 = 6'h14 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_20_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_405 = 6'h15 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_21_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_406 = 6'h16 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_22_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_407 = 6'h17 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_23_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_408 = 6'h18 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_24_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_409 = 6'h19 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_25_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_410 = 6'h1a == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_26_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_411 = 6'h1b == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_27_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_412 = 6'h1c == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_28_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_413 = 6'h1d == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_29_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_414 = 6'h1e == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_30_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_415 = 6'h1f == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_31_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_416 = 6'h20 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_32_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_417 = 6'h21 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_33_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_418 = 6'h22 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_34_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_419 = 6'h23 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_35_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_420 = 6'h24 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_36_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_421 = 6'h25 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_37_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_422 = 6'h26 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_38_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_423 = 6'h27 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_39_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_424 = 6'h28 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_40_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_425 = 6'h29 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_41_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_426 = 6'h2a == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_42_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_427 = 6'h2b == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_43_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_428 = 6'h2c == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_44_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_429 = 6'h2d == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_45_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_430 = 6'h2e == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_46_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_431 = 6'h2f == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_47_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_432 = 6'h30 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_48_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_433 = 6'h31 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_49_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_434 = 6'h32 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_50_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_435 = 6'h33 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_51_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_436 = 6'h34 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_52_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_437 = 6'h35 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_53_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_438 = 6'h36 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_54_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_439 = 6'h37 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_55_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_440 = 6'h38 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_56_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_441 = 6'h39 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_57_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_442 = 6'h3a == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_58_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_443 = 6'h3b == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_59_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_444 = 6'h3c == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_60_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_445 = 6'h3d == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_61_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_446 = 6'h3e == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_62_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [9:0] _GEN_447 = 6'h3f == btb_victim_ptr ? io_i_branch_resolve_pack_pc[12:3] : btb_63_tag; // @[branch_predictor.scala 33:22 67:{33,33}]
  wire [63:0] _GEN_448 = 6'h0 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_0_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_449 = 6'h1 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_1_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_450 = 6'h2 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_2_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_451 = 6'h3 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_3_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_452 = 6'h4 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_4_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_453 = 6'h5 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_5_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_454 = 6'h6 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_6_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_455 = 6'h7 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_7_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_456 = 6'h8 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_8_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_457 = 6'h9 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_9_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_458 = 6'ha == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_10_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_459 = 6'hb == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_11_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_460 = 6'hc == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_12_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_461 = 6'hd == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_13_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_462 = 6'he == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_14_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_463 = 6'hf == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_15_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_464 = 6'h10 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_16_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_465 = 6'h11 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_17_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_466 = 6'h12 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_18_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_467 = 6'h13 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_19_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_468 = 6'h14 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_20_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_469 = 6'h15 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_21_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_470 = 6'h16 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_22_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_471 = 6'h17 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_23_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_472 = 6'h18 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_24_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_473 = 6'h19 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_25_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_474 = 6'h1a == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_26_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_475 = 6'h1b == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_27_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_476 = 6'h1c == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_28_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_477 = 6'h1d == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_29_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_478 = 6'h1e == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_30_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_479 = 6'h1f == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_31_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_480 = 6'h20 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_32_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_481 = 6'h21 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_33_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_482 = 6'h22 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_34_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_483 = 6'h23 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_35_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_484 = 6'h24 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_36_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_485 = 6'h25 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_37_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_486 = 6'h26 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_38_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_487 = 6'h27 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_39_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_488 = 6'h28 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_40_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_489 = 6'h29 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_41_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_490 = 6'h2a == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_42_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_491 = 6'h2b == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_43_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_492 = 6'h2c == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_44_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_493 = 6'h2d == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_45_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_494 = 6'h2e == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_46_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_495 = 6'h2f == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_47_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_496 = 6'h30 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_48_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_497 = 6'h31 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_49_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_498 = 6'h32 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_50_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_499 = 6'h33 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_51_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_500 = 6'h34 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_52_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_501 = 6'h35 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_53_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_502 = 6'h36 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_54_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_503 = 6'h37 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_55_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_504 = 6'h38 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_56_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_505 = 6'h39 == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_57_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_506 = 6'h3a == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_58_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_507 = 6'h3b == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_59_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_508 = 6'h3c == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_60_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_509 = 6'h3d == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_61_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_510 = 6'h3e == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_62_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [63:0] _GEN_511 = 6'h3f == btb_victim_ptr ? io_i_branch_resolve_pack_target : btb_63_target_address; // @[branch_predictor.scala 33:22 68:{44,44}]
  wire [3:0] _btb_btb_victim_ptr_branch_type = {{1'd0}, io_i_branch_resolve_pack_branch_type}; // @[branch_predictor.scala 69:{41,41}]
  wire [3:0] _GEN_512 = 6'h0 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_0_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_513 = 6'h1 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_1_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_514 = 6'h2 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_2_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_515 = 6'h3 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_3_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_516 = 6'h4 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_4_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_517 = 6'h5 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_5_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_518 = 6'h6 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_6_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_519 = 6'h7 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_7_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_520 = 6'h8 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_8_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_521 = 6'h9 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_9_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_522 = 6'ha == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_10_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_523 = 6'hb == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_11_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_524 = 6'hc == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_12_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_525 = 6'hd == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_13_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_526 = 6'he == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_14_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_527 = 6'hf == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_15_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_528 = 6'h10 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_16_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_529 = 6'h11 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_17_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_530 = 6'h12 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_18_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_531 = 6'h13 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_19_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_532 = 6'h14 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_20_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_533 = 6'h15 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_21_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_534 = 6'h16 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_22_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_535 = 6'h17 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_23_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_536 = 6'h18 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_24_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_537 = 6'h19 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_25_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_538 = 6'h1a == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_26_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_539 = 6'h1b == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_27_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_540 = 6'h1c == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_28_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_541 = 6'h1d == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_29_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_542 = 6'h1e == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_30_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_543 = 6'h1f == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_31_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_544 = 6'h20 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_32_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_545 = 6'h21 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_33_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_546 = 6'h22 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_34_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_547 = 6'h23 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_35_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_548 = 6'h24 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_36_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_549 = 6'h25 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_37_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_550 = 6'h26 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_38_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_551 = 6'h27 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_39_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_552 = 6'h28 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_40_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_553 = 6'h29 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_41_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_554 = 6'h2a == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_42_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_555 = 6'h2b == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_43_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_556 = 6'h2c == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_44_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_557 = 6'h2d == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_45_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_558 = 6'h2e == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_46_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_559 = 6'h2f == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_47_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_560 = 6'h30 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_48_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_561 = 6'h31 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_49_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_562 = 6'h32 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_50_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_563 = 6'h33 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_51_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_564 = 6'h34 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_52_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_565 = 6'h35 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_53_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_566 = 6'h36 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_54_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_567 = 6'h37 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_55_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_568 = 6'h38 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_56_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_569 = 6'h39 == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_57_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_570 = 6'h3a == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_58_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_571 = 6'h3b == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_59_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_572 = 6'h3c == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_60_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_573 = 6'h3d == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_61_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_574 = 6'h3e == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_62_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire [3:0] _GEN_575 = 6'h3f == btb_victim_ptr ? _btb_btb_victim_ptr_branch_type : btb_63_branch_type; // @[branch_predictor.scala 33:22 69:{41,41}]
  wire  _GEN_576 = 6'h0 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_0_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_577 = 6'h1 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_1_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_578 = 6'h2 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_2_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_579 = 6'h3 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_3_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_580 = 6'h4 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_4_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_581 = 6'h5 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_5_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_582 = 6'h6 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_6_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_583 = 6'h7 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_7_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_584 = 6'h8 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_8_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_585 = 6'h9 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_9_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_586 = 6'ha == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_10_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_587 = 6'hb == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_11_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_588 = 6'hc == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_12_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_589 = 6'hd == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_13_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_590 = 6'he == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_14_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_591 = 6'hf == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_15_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_592 = 6'h10 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_16_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_593 = 6'h11 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_17_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_594 = 6'h12 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_18_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_595 = 6'h13 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_19_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_596 = 6'h14 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_20_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_597 = 6'h15 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_21_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_598 = 6'h16 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_22_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_599 = 6'h17 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_23_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_600 = 6'h18 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_24_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_601 = 6'h19 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_25_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_602 = 6'h1a == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_26_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_603 = 6'h1b == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_27_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_604 = 6'h1c == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_28_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_605 = 6'h1d == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_29_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_606 = 6'h1e == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_30_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_607 = 6'h1f == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_31_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_608 = 6'h20 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_32_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_609 = 6'h21 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_33_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_610 = 6'h22 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_34_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_611 = 6'h23 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_35_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_612 = 6'h24 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_36_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_613 = 6'h25 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_37_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_614 = 6'h26 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_38_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_615 = 6'h27 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_39_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_616 = 6'h28 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_40_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_617 = 6'h29 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_41_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_618 = 6'h2a == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_42_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_619 = 6'h2b == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_43_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_620 = 6'h2c == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_44_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_621 = 6'h2d == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_45_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_622 = 6'h2e == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_46_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_623 = 6'h2f == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_47_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_624 = 6'h30 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_48_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_625 = 6'h31 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_49_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_626 = 6'h32 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_50_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_627 = 6'h33 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_51_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_628 = 6'h34 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_52_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_629 = 6'h35 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_53_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_630 = 6'h36 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_54_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_631 = 6'h37 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_55_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_632 = 6'h38 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_56_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_633 = 6'h39 == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_57_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_634 = 6'h3a == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_58_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_635 = 6'h3b == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_59_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_636 = 6'h3c == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_60_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_637 = 6'h3d == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_61_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_638 = 6'h3e == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_62_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire  _GEN_639 = 6'h3f == btb_victim_ptr ? io_i_branch_resolve_pack_pc[2] : btb_63_select; // @[branch_predictor.scala 33:22 70:{36,36}]
  wire [1:0] _btb_bht_T = io_i_branch_resolve_pack_taken ? 2'h1 : 2'h0; // @[branch_predictor.scala 71:39]
  wire [1:0] _GEN_640 = 6'h0 == btb_victim_ptr ? _btb_bht_T : btb_0_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_641 = 6'h1 == btb_victim_ptr ? _btb_bht_T : btb_1_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_642 = 6'h2 == btb_victim_ptr ? _btb_bht_T : btb_2_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_643 = 6'h3 == btb_victim_ptr ? _btb_bht_T : btb_3_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_644 = 6'h4 == btb_victim_ptr ? _btb_bht_T : btb_4_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_645 = 6'h5 == btb_victim_ptr ? _btb_bht_T : btb_5_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_646 = 6'h6 == btb_victim_ptr ? _btb_bht_T : btb_6_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_647 = 6'h7 == btb_victim_ptr ? _btb_bht_T : btb_7_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_648 = 6'h8 == btb_victim_ptr ? _btb_bht_T : btb_8_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_649 = 6'h9 == btb_victim_ptr ? _btb_bht_T : btb_9_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_650 = 6'ha == btb_victim_ptr ? _btb_bht_T : btb_10_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_651 = 6'hb == btb_victim_ptr ? _btb_bht_T : btb_11_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_652 = 6'hc == btb_victim_ptr ? _btb_bht_T : btb_12_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_653 = 6'hd == btb_victim_ptr ? _btb_bht_T : btb_13_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_654 = 6'he == btb_victim_ptr ? _btb_bht_T : btb_14_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_655 = 6'hf == btb_victim_ptr ? _btb_bht_T : btb_15_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_656 = 6'h10 == btb_victim_ptr ? _btb_bht_T : btb_16_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_657 = 6'h11 == btb_victim_ptr ? _btb_bht_T : btb_17_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_658 = 6'h12 == btb_victim_ptr ? _btb_bht_T : btb_18_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_659 = 6'h13 == btb_victim_ptr ? _btb_bht_T : btb_19_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_660 = 6'h14 == btb_victim_ptr ? _btb_bht_T : btb_20_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_661 = 6'h15 == btb_victim_ptr ? _btb_bht_T : btb_21_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_662 = 6'h16 == btb_victim_ptr ? _btb_bht_T : btb_22_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_663 = 6'h17 == btb_victim_ptr ? _btb_bht_T : btb_23_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_664 = 6'h18 == btb_victim_ptr ? _btb_bht_T : btb_24_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_665 = 6'h19 == btb_victim_ptr ? _btb_bht_T : btb_25_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_666 = 6'h1a == btb_victim_ptr ? _btb_bht_T : btb_26_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_667 = 6'h1b == btb_victim_ptr ? _btb_bht_T : btb_27_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_668 = 6'h1c == btb_victim_ptr ? _btb_bht_T : btb_28_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_669 = 6'h1d == btb_victim_ptr ? _btb_bht_T : btb_29_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_670 = 6'h1e == btb_victim_ptr ? _btb_bht_T : btb_30_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_671 = 6'h1f == btb_victim_ptr ? _btb_bht_T : btb_31_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_672 = 6'h20 == btb_victim_ptr ? _btb_bht_T : btb_32_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_673 = 6'h21 == btb_victim_ptr ? _btb_bht_T : btb_33_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_674 = 6'h22 == btb_victim_ptr ? _btb_bht_T : btb_34_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_675 = 6'h23 == btb_victim_ptr ? _btb_bht_T : btb_35_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_676 = 6'h24 == btb_victim_ptr ? _btb_bht_T : btb_36_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_677 = 6'h25 == btb_victim_ptr ? _btb_bht_T : btb_37_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_678 = 6'h26 == btb_victim_ptr ? _btb_bht_T : btb_38_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_679 = 6'h27 == btb_victim_ptr ? _btb_bht_T : btb_39_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_680 = 6'h28 == btb_victim_ptr ? _btb_bht_T : btb_40_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_681 = 6'h29 == btb_victim_ptr ? _btb_bht_T : btb_41_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_682 = 6'h2a == btb_victim_ptr ? _btb_bht_T : btb_42_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_683 = 6'h2b == btb_victim_ptr ? _btb_bht_T : btb_43_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_684 = 6'h2c == btb_victim_ptr ? _btb_bht_T : btb_44_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_685 = 6'h2d == btb_victim_ptr ? _btb_bht_T : btb_45_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_686 = 6'h2e == btb_victim_ptr ? _btb_bht_T : btb_46_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_687 = 6'h2f == btb_victim_ptr ? _btb_bht_T : btb_47_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_688 = 6'h30 == btb_victim_ptr ? _btb_bht_T : btb_48_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_689 = 6'h31 == btb_victim_ptr ? _btb_bht_T : btb_49_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_690 = 6'h32 == btb_victim_ptr ? _btb_bht_T : btb_50_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_691 = 6'h33 == btb_victim_ptr ? _btb_bht_T : btb_51_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_692 = 6'h34 == btb_victim_ptr ? _btb_bht_T : btb_52_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_693 = 6'h35 == btb_victim_ptr ? _btb_bht_T : btb_53_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_694 = 6'h36 == btb_victim_ptr ? _btb_bht_T : btb_54_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_695 = 6'h37 == btb_victim_ptr ? _btb_bht_T : btb_55_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_696 = 6'h38 == btb_victim_ptr ? _btb_bht_T : btb_56_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_697 = 6'h39 == btb_victim_ptr ? _btb_bht_T : btb_57_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_698 = 6'h3a == btb_victim_ptr ? _btb_bht_T : btb_58_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_699 = 6'h3b == btb_victim_ptr ? _btb_bht_T : btb_59_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_700 = 6'h3c == btb_victim_ptr ? _btb_bht_T : btb_60_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_701 = 6'h3d == btb_victim_ptr ? _btb_bht_T : btb_61_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_702 = 6'h3e == btb_victim_ptr ? _btb_bht_T : btb_62_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [1:0] _GEN_703 = 6'h3f == btb_victim_ptr ? _btb_bht_T : btb_63_bht; // @[branch_predictor.scala 33:22 71:{33,33}]
  wire [5:0] _btb_victim_ptr_T_1 = btb_victim_ptr + 6'h1; // @[branch_predictor.scala 74:42]
  wire  _GEN_704 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_320 : btb_0_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_705 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_321 : btb_1_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_706 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_322 : btb_2_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_707 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_323 : btb_3_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_708 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_324 : btb_4_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_709 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_325 : btb_5_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_710 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_326 : btb_6_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_711 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_327 : btb_7_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_712 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_328 : btb_8_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_713 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_329 : btb_9_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_714 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_330 : btb_10_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_715 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_331 : btb_11_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_716 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_332 : btb_12_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_717 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_333 : btb_13_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_718 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_334 : btb_14_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_719 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_335 : btb_15_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_720 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_336 : btb_16_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_721 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_337 : btb_17_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_722 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_338 : btb_18_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_723 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_339 : btb_19_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_724 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_340 : btb_20_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_725 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_341 : btb_21_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_726 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_342 : btb_22_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_727 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_343 : btb_23_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_728 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_344 : btb_24_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_729 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_345 : btb_25_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_730 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_346 : btb_26_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_731 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_347 : btb_27_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_732 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_348 : btb_28_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_733 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_349 : btb_29_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_734 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_350 : btb_30_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_735 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_351 : btb_31_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_736 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_352 : btb_32_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_737 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_353 : btb_33_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_738 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_354 : btb_34_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_739 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_355 : btb_35_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_740 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_356 : btb_36_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_741 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_357 : btb_37_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_742 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_358 : btb_38_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_743 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_359 : btb_39_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_744 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_360 : btb_40_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_745 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_361 : btb_41_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_746 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_362 : btb_42_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_747 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_363 : btb_43_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_748 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_364 : btb_44_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_749 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_365 : btb_45_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_750 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_366 : btb_46_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_751 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_367 : btb_47_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_752 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_368 : btb_48_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_753 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_369 : btb_49_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_754 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_370 : btb_50_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_755 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_371 : btb_51_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_756 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_372 : btb_52_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_757 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_373 : btb_53_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_758 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_374 : btb_54_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_759 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_375 : btb_55_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_760 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_376 : btb_56_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_761 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_377 : btb_57_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_762 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_378 : btb_58_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_763 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_379 : btb_59_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_764 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_380 : btb_60_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_765 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_381 : btb_61_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_766 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_382 : btb_62_valid; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_767 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_383 : btb_63_valid; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_768 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_384 : btb_0_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_769 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_385 : btb_1_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_770 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_386 : btb_2_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_771 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_387 : btb_3_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_772 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_388 : btb_4_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_773 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_389 : btb_5_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_774 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_390 : btb_6_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_775 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_391 : btb_7_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_776 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_392 : btb_8_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_777 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_393 : btb_9_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_778 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_394 : btb_10_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_779 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_395 : btb_11_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_780 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_396 : btb_12_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_781 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_397 : btb_13_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_782 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_398 : btb_14_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_783 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_399 : btb_15_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_784 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_400 : btb_16_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_785 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_401 : btb_17_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_786 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_402 : btb_18_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_787 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_403 : btb_19_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_788 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_404 : btb_20_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_789 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_405 : btb_21_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_790 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_406 : btb_22_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_791 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_407 : btb_23_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_792 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_408 : btb_24_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_793 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_409 : btb_25_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_794 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_410 : btb_26_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_795 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_411 : btb_27_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_796 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_412 : btb_28_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_797 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_413 : btb_29_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_798 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_414 : btb_30_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_799 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_415 : btb_31_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_800 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_416 : btb_32_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_801 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_417 : btb_33_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_802 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_418 : btb_34_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_803 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_419 : btb_35_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_804 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_420 : btb_36_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_805 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_421 : btb_37_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_806 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_422 : btb_38_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_807 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_423 : btb_39_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_808 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_424 : btb_40_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_809 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_425 : btb_41_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_810 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_426 : btb_42_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_811 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_427 : btb_43_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_812 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_428 : btb_44_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_813 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_429 : btb_45_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_814 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_430 : btb_46_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_815 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_431 : btb_47_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_816 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_432 : btb_48_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_817 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_433 : btb_49_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_818 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_434 : btb_50_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_819 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_435 : btb_51_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_820 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_436 : btb_52_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_821 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_437 : btb_53_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_822 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_438 : btb_54_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_823 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_439 : btb_55_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_824 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_440 : btb_56_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_825 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_441 : btb_57_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_826 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_442 : btb_58_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_827 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_443 : btb_59_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_828 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_444 : btb_60_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_829 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_445 : btb_61_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_830 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_446 : btb_62_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [9:0] _GEN_831 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_447 : btb_63_tag; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_832 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_448 : btb_0_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_833 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_449 : btb_1_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_834 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_450 : btb_2_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_835 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_451 : btb_3_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_836 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_452 : btb_4_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_837 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_453 : btb_5_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_838 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_454 : btb_6_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_839 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_455 : btb_7_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_840 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_456 : btb_8_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_841 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_457 : btb_9_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_842 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_458 : btb_10_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_843 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_459 : btb_11_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_844 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_460 : btb_12_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_845 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_461 : btb_13_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_846 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_462 : btb_14_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_847 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_463 : btb_15_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_848 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_464 : btb_16_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_849 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_465 : btb_17_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_850 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_466 : btb_18_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_851 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_467 : btb_19_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_852 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_468 : btb_20_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_853 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_469 : btb_21_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_854 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_470 : btb_22_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_855 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_471 : btb_23_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_856 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_472 : btb_24_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_857 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_473 : btb_25_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_858 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_474 : btb_26_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_859 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_475 : btb_27_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_860 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_476 : btb_28_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_861 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_477 : btb_29_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_862 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_478 : btb_30_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_863 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_479 : btb_31_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_864 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_480 : btb_32_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_865 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_481 : btb_33_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_866 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_482 : btb_34_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_867 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_483 : btb_35_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_868 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_484 : btb_36_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_869 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_485 : btb_37_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_870 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_486 : btb_38_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_871 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_487 : btb_39_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_872 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_488 : btb_40_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_873 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_489 : btb_41_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_874 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_490 : btb_42_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_875 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_491 : btb_43_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_876 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_492 : btb_44_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_877 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_493 : btb_45_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_878 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_494 : btb_46_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_879 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_495 : btb_47_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_880 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_496 : btb_48_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_881 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_497 : btb_49_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_882 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_498 : btb_50_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_883 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_499 : btb_51_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_884 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_500 : btb_52_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_885 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_501 : btb_53_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_886 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_502 : btb_54_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_887 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_503 : btb_55_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_888 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_504 : btb_56_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_889 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_505 : btb_57_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_890 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_506 : btb_58_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_891 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_507 : btb_59_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_892 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_508 : btb_60_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_893 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_509 : btb_61_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_894 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_510 : btb_62_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [63:0] _GEN_895 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_511 : btb_63_target_address; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_896 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_512 : btb_0_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_897 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_513 : btb_1_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_898 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_514 : btb_2_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_899 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_515 : btb_3_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_900 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_516 : btb_4_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_901 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_517 : btb_5_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_902 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_518 : btb_6_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_903 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_519 : btb_7_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_904 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_520 : btb_8_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_905 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_521 : btb_9_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_906 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_522 : btb_10_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_907 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_523 : btb_11_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_908 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_524 : btb_12_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_909 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_525 : btb_13_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_910 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_526 : btb_14_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_911 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_527 : btb_15_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_912 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_528 : btb_16_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_913 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_529 : btb_17_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_914 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_530 : btb_18_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_915 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_531 : btb_19_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_916 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_532 : btb_20_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_917 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_533 : btb_21_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_918 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_534 : btb_22_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_919 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_535 : btb_23_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_920 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_536 : btb_24_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_921 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_537 : btb_25_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_922 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_538 : btb_26_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_923 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_539 : btb_27_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_924 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_540 : btb_28_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_925 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_541 : btb_29_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_926 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_542 : btb_30_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_927 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_543 : btb_31_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_928 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_544 : btb_32_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_929 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_545 : btb_33_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_930 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_546 : btb_34_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_931 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_547 : btb_35_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_932 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_548 : btb_36_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_933 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_549 : btb_37_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_934 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_550 : btb_38_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_935 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_551 : btb_39_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_936 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_552 : btb_40_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_937 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_553 : btb_41_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_938 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_554 : btb_42_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_939 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_555 : btb_43_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_940 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_556 : btb_44_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_941 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_557 : btb_45_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_942 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_558 : btb_46_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_943 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_559 : btb_47_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_944 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_560 : btb_48_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_945 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_561 : btb_49_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_946 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_562 : btb_50_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_947 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_563 : btb_51_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_948 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_564 : btb_52_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_949 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_565 : btb_53_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_950 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_566 : btb_54_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_951 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_567 : btb_55_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_952 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_568 : btb_56_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_953 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_569 : btb_57_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_954 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_570 : btb_58_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_955 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_571 : btb_59_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_956 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_572 : btb_60_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_957 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_573 : btb_61_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_958 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_574 : btb_62_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire [3:0] _GEN_959 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_575 : btb_63_branch_type; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_960 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_576 : btb_0_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_961 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_577 : btb_1_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_962 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_578 : btb_2_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_963 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_579 : btb_3_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_964 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_580 : btb_4_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_965 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_581 : btb_5_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_966 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_582 : btb_6_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_967 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_583 : btb_7_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_968 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_584 : btb_8_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_969 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_585 : btb_9_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_970 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_586 : btb_10_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_971 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_587 : btb_11_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_972 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_588 : btb_12_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_973 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_589 : btb_13_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_974 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_590 : btb_14_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_975 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_591 : btb_15_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_976 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_592 : btb_16_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_977 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_593 : btb_17_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_978 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_594 : btb_18_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_979 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_595 : btb_19_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_980 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_596 : btb_20_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_981 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_597 : btb_21_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_982 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_598 : btb_22_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_983 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_599 : btb_23_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_984 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_600 : btb_24_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_985 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_601 : btb_25_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_986 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_602 : btb_26_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_987 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_603 : btb_27_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_988 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_604 : btb_28_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_989 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_605 : btb_29_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_990 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_606 : btb_30_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_991 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_607 : btb_31_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_992 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_608 : btb_32_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_993 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_609 : btb_33_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_994 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_610 : btb_34_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_995 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_611 : btb_35_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_996 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_612 : btb_36_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_997 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_613 : btb_37_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_998 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_614 : btb_38_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_999 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_615 : btb_39_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1000 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_616 : btb_40_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1001 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_617 : btb_41_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1002 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_618 : btb_42_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1003 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_619 : btb_43_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1004 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_620 : btb_44_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1005 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_621 : btb_45_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1006 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_622 : btb_46_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1007 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_623 : btb_47_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1008 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_624 : btb_48_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1009 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_625 : btb_49_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1010 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_626 : btb_50_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1011 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_627 : btb_51_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1012 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_628 : btb_52_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1013 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_629 : btb_53_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1014 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_630 : btb_54_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1015 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_631 : btb_55_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1016 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_632 : btb_56_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1017 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_633 : btb_57_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1018 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_634 : btb_58_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1019 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_635 : btb_59_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1020 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_636 : btb_60_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1021 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_637 : btb_61_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1022 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_638 : btb_62_select; // @[branch_predictor.scala 65:121 33:22]
  wire  _GEN_1023 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_639 : btb_63_select; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1024 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_640 : btb_0_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1025 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_641 : btb_1_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1026 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_642 : btb_2_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1027 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_643 : btb_3_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1028 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_644 : btb_4_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1029 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_645 : btb_5_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1030 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_646 : btb_6_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1031 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_647 : btb_7_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1032 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_648 : btb_8_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1033 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_649 : btb_9_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1034 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_650 : btb_10_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1035 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_651 : btb_11_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1036 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_652 : btb_12_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1037 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_653 : btb_13_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1038 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_654 : btb_14_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1039 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_655 : btb_15_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1040 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_656 : btb_16_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1041 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_657 : btb_17_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1042 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_658 : btb_18_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1043 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_659 : btb_19_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1044 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_660 : btb_20_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1045 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_661 : btb_21_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1046 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_662 : btb_22_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1047 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_663 : btb_23_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1048 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_664 : btb_24_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1049 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_665 : btb_25_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1050 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_666 : btb_26_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1051 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_667 : btb_27_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1052 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_668 : btb_28_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1053 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_669 : btb_29_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1054 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_670 : btb_30_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1055 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_671 : btb_31_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1056 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_672 : btb_32_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1057 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_673 : btb_33_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1058 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_674 : btb_34_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1059 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_675 : btb_35_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1060 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_676 : btb_36_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1061 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_677 : btb_37_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1062 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_678 : btb_38_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1063 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_679 : btb_39_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1064 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_680 : btb_40_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1065 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_681 : btb_41_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1066 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_682 : btb_42_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1067 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_683 : btb_43_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1068 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_684 : btb_44_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1069 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_685 : btb_45_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1070 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_686 : btb_46_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1071 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_687 : btb_47_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1072 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_688 : btb_48_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1073 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_689 : btb_49_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1074 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_690 : btb_50_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1075 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_691 : btb_51_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1076 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_692 : btb_52_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1077 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_693 : btb_53_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1078 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_694 : btb_54_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1079 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_695 : btb_55_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1080 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_696 : btb_56_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1081 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_697 : btb_57_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1082 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_698 : btb_58_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1083 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_699 : btb_59_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1084 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_700 : btb_60_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1085 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_701 : btb_61_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1086 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_702 : btb_62_bht; // @[branch_predictor.scala 65:121 33:22]
  wire [1:0] _GEN_1087 = io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
    io_i_branch_resolve_pack_taken ? _GEN_703 : btb_63_bht; // @[branch_predictor.scala 65:121 33:22]
  wire  _T_131 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid; // @[branch_predictor.scala 87:42]
  wire  _T_136 = ~io_i_branch_resolve_pack_taken; // @[branch_predictor.scala 91:78]
  wire  _btb_0_bht_T = btb_0_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_0_bht_T_1 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_0_bht_T_2 = btb_0_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_0_bht_T_3 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_0_bht_T_4 = btb_0_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_0_bht_T_5 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_0_bht_T_6 = btb_0_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_0_bht_T_7 = io_i_branch_resolve_pack_taken & btb_0_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_0_bht_T_10 = _T_136 & _btb_0_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_0_bht_T_13 = _T_136 & _btb_0_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_0_bht_T_16 = _T_136 & _btb_0_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_0_bht_T_19 = _T_136 & _btb_0_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_0_bht_T_20 = _btb_0_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_21 = _btb_0_bht_T_16 ? 2'h3 : _btb_0_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_22 = _btb_0_bht_T_13 ? 2'h0 : _btb_0_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_23 = _btb_0_bht_T_10 ? 2'h2 : _btb_0_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_24 = _btb_0_bht_T_7 ? 2'h2 : _btb_0_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_25 = _btb_0_bht_T_5 ? 2'h0 : _btb_0_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_26 = _btb_0_bht_T_3 ? 2'h1 : _btb_0_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_0_bht_T_27 = _btb_0_bht_T_1 ? 2'h1 : _btb_0_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1089 = ~(btb_0_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_832; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1090 = ~(btb_0_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_960; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1091 = ~(btb_0_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_0_bht_T_27 : _GEN_1024; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1093 = btb_0_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1089 : _GEN_832; // @[branch_predictor.scala 89:71]
  wire  _GEN_1094 = btb_0_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1090 : _GEN_960; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1095 = btb_0_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1091 : _GEN_1024; // @[branch_predictor.scala 89:71]
  wire  _btb_1_bht_T = btb_1_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_1_bht_T_1 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_1_bht_T_2 = btb_1_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_1_bht_T_3 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_1_bht_T_4 = btb_1_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_1_bht_T_5 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_1_bht_T_6 = btb_1_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_1_bht_T_7 = io_i_branch_resolve_pack_taken & btb_1_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_1_bht_T_10 = _T_136 & _btb_1_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_1_bht_T_13 = _T_136 & _btb_1_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_1_bht_T_16 = _T_136 & _btb_1_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_1_bht_T_19 = _T_136 & _btb_1_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_1_bht_T_20 = _btb_1_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_21 = _btb_1_bht_T_16 ? 2'h3 : _btb_1_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_22 = _btb_1_bht_T_13 ? 2'h0 : _btb_1_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_23 = _btb_1_bht_T_10 ? 2'h2 : _btb_1_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_24 = _btb_1_bht_T_7 ? 2'h2 : _btb_1_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_25 = _btb_1_bht_T_5 ? 2'h0 : _btb_1_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_26 = _btb_1_bht_T_3 ? 2'h1 : _btb_1_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_1_bht_T_27 = _btb_1_bht_T_1 ? 2'h1 : _btb_1_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1096 = ~(btb_1_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_833; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1097 = ~(btb_1_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_961; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1098 = ~(btb_1_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_1_bht_T_27 : _GEN_1025; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1100 = btb_1_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1096 : _GEN_833; // @[branch_predictor.scala 89:71]
  wire  _GEN_1101 = btb_1_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1097 : _GEN_961; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1102 = btb_1_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1098 : _GEN_1025; // @[branch_predictor.scala 89:71]
  wire  _btb_2_bht_T = btb_2_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_2_bht_T_1 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_2_bht_T_2 = btb_2_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_2_bht_T_3 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_2_bht_T_4 = btb_2_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_2_bht_T_5 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_2_bht_T_6 = btb_2_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_2_bht_T_7 = io_i_branch_resolve_pack_taken & btb_2_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_2_bht_T_10 = _T_136 & _btb_2_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_2_bht_T_13 = _T_136 & _btb_2_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_2_bht_T_16 = _T_136 & _btb_2_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_2_bht_T_19 = _T_136 & _btb_2_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_2_bht_T_20 = _btb_2_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_21 = _btb_2_bht_T_16 ? 2'h3 : _btb_2_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_22 = _btb_2_bht_T_13 ? 2'h0 : _btb_2_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_23 = _btb_2_bht_T_10 ? 2'h2 : _btb_2_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_24 = _btb_2_bht_T_7 ? 2'h2 : _btb_2_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_25 = _btb_2_bht_T_5 ? 2'h0 : _btb_2_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_26 = _btb_2_bht_T_3 ? 2'h1 : _btb_2_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_2_bht_T_27 = _btb_2_bht_T_1 ? 2'h1 : _btb_2_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1103 = ~(btb_2_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_834; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1104 = ~(btb_2_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_962; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1105 = ~(btb_2_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_2_bht_T_27 : _GEN_1026; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1107 = btb_2_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1103 : _GEN_834; // @[branch_predictor.scala 89:71]
  wire  _GEN_1108 = btb_2_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1104 : _GEN_962; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1109 = btb_2_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1105 : _GEN_1026; // @[branch_predictor.scala 89:71]
  wire  _btb_3_bht_T = btb_3_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_3_bht_T_1 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_3_bht_T_2 = btb_3_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_3_bht_T_3 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_3_bht_T_4 = btb_3_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_3_bht_T_5 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_3_bht_T_6 = btb_3_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_3_bht_T_7 = io_i_branch_resolve_pack_taken & btb_3_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_3_bht_T_10 = _T_136 & _btb_3_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_3_bht_T_13 = _T_136 & _btb_3_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_3_bht_T_16 = _T_136 & _btb_3_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_3_bht_T_19 = _T_136 & _btb_3_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_3_bht_T_20 = _btb_3_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_21 = _btb_3_bht_T_16 ? 2'h3 : _btb_3_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_22 = _btb_3_bht_T_13 ? 2'h0 : _btb_3_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_23 = _btb_3_bht_T_10 ? 2'h2 : _btb_3_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_24 = _btb_3_bht_T_7 ? 2'h2 : _btb_3_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_25 = _btb_3_bht_T_5 ? 2'h0 : _btb_3_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_26 = _btb_3_bht_T_3 ? 2'h1 : _btb_3_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_3_bht_T_27 = _btb_3_bht_T_1 ? 2'h1 : _btb_3_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1110 = ~(btb_3_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_835; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1111 = ~(btb_3_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_963; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1112 = ~(btb_3_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_3_bht_T_27 : _GEN_1027; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1114 = btb_3_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1110 : _GEN_835; // @[branch_predictor.scala 89:71]
  wire  _GEN_1115 = btb_3_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1111 : _GEN_963; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1116 = btb_3_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1112 : _GEN_1027; // @[branch_predictor.scala 89:71]
  wire  _btb_4_bht_T = btb_4_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_4_bht_T_1 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_4_bht_T_2 = btb_4_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_4_bht_T_3 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_4_bht_T_4 = btb_4_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_4_bht_T_5 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_4_bht_T_6 = btb_4_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_4_bht_T_7 = io_i_branch_resolve_pack_taken & btb_4_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_4_bht_T_10 = _T_136 & _btb_4_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_4_bht_T_13 = _T_136 & _btb_4_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_4_bht_T_16 = _T_136 & _btb_4_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_4_bht_T_19 = _T_136 & _btb_4_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_4_bht_T_20 = _btb_4_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_21 = _btb_4_bht_T_16 ? 2'h3 : _btb_4_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_22 = _btb_4_bht_T_13 ? 2'h0 : _btb_4_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_23 = _btb_4_bht_T_10 ? 2'h2 : _btb_4_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_24 = _btb_4_bht_T_7 ? 2'h2 : _btb_4_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_25 = _btb_4_bht_T_5 ? 2'h0 : _btb_4_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_26 = _btb_4_bht_T_3 ? 2'h1 : _btb_4_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_4_bht_T_27 = _btb_4_bht_T_1 ? 2'h1 : _btb_4_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1117 = ~(btb_4_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_836; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1118 = ~(btb_4_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_964; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1119 = ~(btb_4_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_4_bht_T_27 : _GEN_1028; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1121 = btb_4_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1117 : _GEN_836; // @[branch_predictor.scala 89:71]
  wire  _GEN_1122 = btb_4_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1118 : _GEN_964; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1123 = btb_4_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1119 : _GEN_1028; // @[branch_predictor.scala 89:71]
  wire  _btb_5_bht_T = btb_5_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_5_bht_T_1 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_5_bht_T_2 = btb_5_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_5_bht_T_3 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_5_bht_T_4 = btb_5_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_5_bht_T_5 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_5_bht_T_6 = btb_5_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_5_bht_T_7 = io_i_branch_resolve_pack_taken & btb_5_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_5_bht_T_10 = _T_136 & _btb_5_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_5_bht_T_13 = _T_136 & _btb_5_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_5_bht_T_16 = _T_136 & _btb_5_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_5_bht_T_19 = _T_136 & _btb_5_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_5_bht_T_20 = _btb_5_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_21 = _btb_5_bht_T_16 ? 2'h3 : _btb_5_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_22 = _btb_5_bht_T_13 ? 2'h0 : _btb_5_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_23 = _btb_5_bht_T_10 ? 2'h2 : _btb_5_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_24 = _btb_5_bht_T_7 ? 2'h2 : _btb_5_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_25 = _btb_5_bht_T_5 ? 2'h0 : _btb_5_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_26 = _btb_5_bht_T_3 ? 2'h1 : _btb_5_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_5_bht_T_27 = _btb_5_bht_T_1 ? 2'h1 : _btb_5_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1124 = ~(btb_5_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_837; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1125 = ~(btb_5_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_965; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1126 = ~(btb_5_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_5_bht_T_27 : _GEN_1029; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1128 = btb_5_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1124 : _GEN_837; // @[branch_predictor.scala 89:71]
  wire  _GEN_1129 = btb_5_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1125 : _GEN_965; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1130 = btb_5_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1126 : _GEN_1029; // @[branch_predictor.scala 89:71]
  wire  _btb_6_bht_T = btb_6_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_6_bht_T_1 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_6_bht_T_2 = btb_6_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_6_bht_T_3 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_6_bht_T_4 = btb_6_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_6_bht_T_5 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_6_bht_T_6 = btb_6_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_6_bht_T_7 = io_i_branch_resolve_pack_taken & btb_6_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_6_bht_T_10 = _T_136 & _btb_6_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_6_bht_T_13 = _T_136 & _btb_6_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_6_bht_T_16 = _T_136 & _btb_6_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_6_bht_T_19 = _T_136 & _btb_6_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_6_bht_T_20 = _btb_6_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_21 = _btb_6_bht_T_16 ? 2'h3 : _btb_6_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_22 = _btb_6_bht_T_13 ? 2'h0 : _btb_6_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_23 = _btb_6_bht_T_10 ? 2'h2 : _btb_6_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_24 = _btb_6_bht_T_7 ? 2'h2 : _btb_6_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_25 = _btb_6_bht_T_5 ? 2'h0 : _btb_6_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_26 = _btb_6_bht_T_3 ? 2'h1 : _btb_6_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_6_bht_T_27 = _btb_6_bht_T_1 ? 2'h1 : _btb_6_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1131 = ~(btb_6_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_838; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1132 = ~(btb_6_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_966; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1133 = ~(btb_6_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_6_bht_T_27 : _GEN_1030; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1135 = btb_6_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1131 : _GEN_838; // @[branch_predictor.scala 89:71]
  wire  _GEN_1136 = btb_6_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1132 : _GEN_966; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1137 = btb_6_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1133 : _GEN_1030; // @[branch_predictor.scala 89:71]
  wire  _btb_7_bht_T = btb_7_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_7_bht_T_1 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_7_bht_T_2 = btb_7_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_7_bht_T_3 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_7_bht_T_4 = btb_7_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_7_bht_T_5 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_7_bht_T_6 = btb_7_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_7_bht_T_7 = io_i_branch_resolve_pack_taken & btb_7_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_7_bht_T_10 = _T_136 & _btb_7_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_7_bht_T_13 = _T_136 & _btb_7_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_7_bht_T_16 = _T_136 & _btb_7_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_7_bht_T_19 = _T_136 & _btb_7_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_7_bht_T_20 = _btb_7_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_21 = _btb_7_bht_T_16 ? 2'h3 : _btb_7_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_22 = _btb_7_bht_T_13 ? 2'h0 : _btb_7_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_23 = _btb_7_bht_T_10 ? 2'h2 : _btb_7_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_24 = _btb_7_bht_T_7 ? 2'h2 : _btb_7_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_25 = _btb_7_bht_T_5 ? 2'h0 : _btb_7_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_26 = _btb_7_bht_T_3 ? 2'h1 : _btb_7_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_7_bht_T_27 = _btb_7_bht_T_1 ? 2'h1 : _btb_7_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1138 = ~(btb_7_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_839; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1139 = ~(btb_7_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_967; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1140 = ~(btb_7_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_7_bht_T_27 : _GEN_1031; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1142 = btb_7_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1138 : _GEN_839; // @[branch_predictor.scala 89:71]
  wire  _GEN_1143 = btb_7_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1139 : _GEN_967; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1144 = btb_7_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1140 : _GEN_1031; // @[branch_predictor.scala 89:71]
  wire  _btb_8_bht_T = btb_8_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_8_bht_T_1 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_8_bht_T_2 = btb_8_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_8_bht_T_3 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_8_bht_T_4 = btb_8_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_8_bht_T_5 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_8_bht_T_6 = btb_8_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_8_bht_T_7 = io_i_branch_resolve_pack_taken & btb_8_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_8_bht_T_10 = _T_136 & _btb_8_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_8_bht_T_13 = _T_136 & _btb_8_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_8_bht_T_16 = _T_136 & _btb_8_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_8_bht_T_19 = _T_136 & _btb_8_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_8_bht_T_20 = _btb_8_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_21 = _btb_8_bht_T_16 ? 2'h3 : _btb_8_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_22 = _btb_8_bht_T_13 ? 2'h0 : _btb_8_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_23 = _btb_8_bht_T_10 ? 2'h2 : _btb_8_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_24 = _btb_8_bht_T_7 ? 2'h2 : _btb_8_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_25 = _btb_8_bht_T_5 ? 2'h0 : _btb_8_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_26 = _btb_8_bht_T_3 ? 2'h1 : _btb_8_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_8_bht_T_27 = _btb_8_bht_T_1 ? 2'h1 : _btb_8_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1145 = ~(btb_8_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_840; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1146 = ~(btb_8_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_968; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1147 = ~(btb_8_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_8_bht_T_27 : _GEN_1032; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1149 = btb_8_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1145 : _GEN_840; // @[branch_predictor.scala 89:71]
  wire  _GEN_1150 = btb_8_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1146 : _GEN_968; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1151 = btb_8_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1147 : _GEN_1032; // @[branch_predictor.scala 89:71]
  wire  _btb_9_bht_T = btb_9_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_9_bht_T_1 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_9_bht_T_2 = btb_9_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_9_bht_T_3 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_9_bht_T_4 = btb_9_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_9_bht_T_5 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_9_bht_T_6 = btb_9_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_9_bht_T_7 = io_i_branch_resolve_pack_taken & btb_9_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_9_bht_T_10 = _T_136 & _btb_9_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_9_bht_T_13 = _T_136 & _btb_9_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_9_bht_T_16 = _T_136 & _btb_9_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_9_bht_T_19 = _T_136 & _btb_9_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_9_bht_T_20 = _btb_9_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_21 = _btb_9_bht_T_16 ? 2'h3 : _btb_9_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_22 = _btb_9_bht_T_13 ? 2'h0 : _btb_9_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_23 = _btb_9_bht_T_10 ? 2'h2 : _btb_9_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_24 = _btb_9_bht_T_7 ? 2'h2 : _btb_9_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_25 = _btb_9_bht_T_5 ? 2'h0 : _btb_9_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_26 = _btb_9_bht_T_3 ? 2'h1 : _btb_9_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_9_bht_T_27 = _btb_9_bht_T_1 ? 2'h1 : _btb_9_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1152 = ~(btb_9_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_841; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1153 = ~(btb_9_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_969; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1154 = ~(btb_9_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_9_bht_T_27 : _GEN_1033; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1156 = btb_9_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1152 : _GEN_841; // @[branch_predictor.scala 89:71]
  wire  _GEN_1157 = btb_9_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1153 : _GEN_969; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1158 = btb_9_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1154 : _GEN_1033; // @[branch_predictor.scala 89:71]
  wire  _btb_10_bht_T = btb_10_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_10_bht_T_1 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_10_bht_T_2 = btb_10_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_10_bht_T_3 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_10_bht_T_4 = btb_10_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_10_bht_T_5 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_10_bht_T_6 = btb_10_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_10_bht_T_7 = io_i_branch_resolve_pack_taken & btb_10_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_10_bht_T_10 = _T_136 & _btb_10_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_10_bht_T_13 = _T_136 & _btb_10_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_10_bht_T_16 = _T_136 & _btb_10_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_10_bht_T_19 = _T_136 & _btb_10_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_10_bht_T_20 = _btb_10_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_21 = _btb_10_bht_T_16 ? 2'h3 : _btb_10_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_22 = _btb_10_bht_T_13 ? 2'h0 : _btb_10_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_23 = _btb_10_bht_T_10 ? 2'h2 : _btb_10_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_24 = _btb_10_bht_T_7 ? 2'h2 : _btb_10_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_25 = _btb_10_bht_T_5 ? 2'h0 : _btb_10_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_26 = _btb_10_bht_T_3 ? 2'h1 : _btb_10_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_10_bht_T_27 = _btb_10_bht_T_1 ? 2'h1 : _btb_10_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1159 = ~(btb_10_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_842; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1160 = ~(btb_10_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_970; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1161 = ~(btb_10_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_10_bht_T_27 : _GEN_1034; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1163 = btb_10_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1159 : _GEN_842; // @[branch_predictor.scala 89:71]
  wire  _GEN_1164 = btb_10_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1160 : _GEN_970; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1165 = btb_10_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1161 : _GEN_1034; // @[branch_predictor.scala 89:71]
  wire  _btb_11_bht_T = btb_11_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_11_bht_T_1 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_11_bht_T_2 = btb_11_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_11_bht_T_3 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_11_bht_T_4 = btb_11_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_11_bht_T_5 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_11_bht_T_6 = btb_11_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_11_bht_T_7 = io_i_branch_resolve_pack_taken & btb_11_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_11_bht_T_10 = _T_136 & _btb_11_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_11_bht_T_13 = _T_136 & _btb_11_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_11_bht_T_16 = _T_136 & _btb_11_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_11_bht_T_19 = _T_136 & _btb_11_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_11_bht_T_20 = _btb_11_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_21 = _btb_11_bht_T_16 ? 2'h3 : _btb_11_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_22 = _btb_11_bht_T_13 ? 2'h0 : _btb_11_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_23 = _btb_11_bht_T_10 ? 2'h2 : _btb_11_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_24 = _btb_11_bht_T_7 ? 2'h2 : _btb_11_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_25 = _btb_11_bht_T_5 ? 2'h0 : _btb_11_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_26 = _btb_11_bht_T_3 ? 2'h1 : _btb_11_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_11_bht_T_27 = _btb_11_bht_T_1 ? 2'h1 : _btb_11_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1166 = ~(btb_11_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_843; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1167 = ~(btb_11_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_971; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1168 = ~(btb_11_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_11_bht_T_27 : _GEN_1035; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1170 = btb_11_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1166 : _GEN_843; // @[branch_predictor.scala 89:71]
  wire  _GEN_1171 = btb_11_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1167 : _GEN_971; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1172 = btb_11_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1168 : _GEN_1035; // @[branch_predictor.scala 89:71]
  wire  _btb_12_bht_T = btb_12_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_12_bht_T_1 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_12_bht_T_2 = btb_12_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_12_bht_T_3 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_12_bht_T_4 = btb_12_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_12_bht_T_5 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_12_bht_T_6 = btb_12_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_12_bht_T_7 = io_i_branch_resolve_pack_taken & btb_12_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_12_bht_T_10 = _T_136 & _btb_12_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_12_bht_T_13 = _T_136 & _btb_12_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_12_bht_T_16 = _T_136 & _btb_12_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_12_bht_T_19 = _T_136 & _btb_12_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_12_bht_T_20 = _btb_12_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_21 = _btb_12_bht_T_16 ? 2'h3 : _btb_12_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_22 = _btb_12_bht_T_13 ? 2'h0 : _btb_12_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_23 = _btb_12_bht_T_10 ? 2'h2 : _btb_12_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_24 = _btb_12_bht_T_7 ? 2'h2 : _btb_12_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_25 = _btb_12_bht_T_5 ? 2'h0 : _btb_12_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_26 = _btb_12_bht_T_3 ? 2'h1 : _btb_12_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_12_bht_T_27 = _btb_12_bht_T_1 ? 2'h1 : _btb_12_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1173 = ~(btb_12_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_844; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1174 = ~(btb_12_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_972; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1175 = ~(btb_12_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_12_bht_T_27 : _GEN_1036; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1177 = btb_12_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1173 : _GEN_844; // @[branch_predictor.scala 89:71]
  wire  _GEN_1178 = btb_12_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1174 : _GEN_972; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1179 = btb_12_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1175 : _GEN_1036; // @[branch_predictor.scala 89:71]
  wire  _btb_13_bht_T = btb_13_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_13_bht_T_1 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_13_bht_T_2 = btb_13_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_13_bht_T_3 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_13_bht_T_4 = btb_13_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_13_bht_T_5 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_13_bht_T_6 = btb_13_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_13_bht_T_7 = io_i_branch_resolve_pack_taken & btb_13_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_13_bht_T_10 = _T_136 & _btb_13_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_13_bht_T_13 = _T_136 & _btb_13_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_13_bht_T_16 = _T_136 & _btb_13_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_13_bht_T_19 = _T_136 & _btb_13_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_13_bht_T_20 = _btb_13_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_21 = _btb_13_bht_T_16 ? 2'h3 : _btb_13_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_22 = _btb_13_bht_T_13 ? 2'h0 : _btb_13_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_23 = _btb_13_bht_T_10 ? 2'h2 : _btb_13_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_24 = _btb_13_bht_T_7 ? 2'h2 : _btb_13_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_25 = _btb_13_bht_T_5 ? 2'h0 : _btb_13_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_26 = _btb_13_bht_T_3 ? 2'h1 : _btb_13_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_13_bht_T_27 = _btb_13_bht_T_1 ? 2'h1 : _btb_13_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1180 = ~(btb_13_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_845; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1181 = ~(btb_13_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_973; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1182 = ~(btb_13_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_13_bht_T_27 : _GEN_1037; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1184 = btb_13_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1180 : _GEN_845; // @[branch_predictor.scala 89:71]
  wire  _GEN_1185 = btb_13_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1181 : _GEN_973; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1186 = btb_13_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1182 : _GEN_1037; // @[branch_predictor.scala 89:71]
  wire  _btb_14_bht_T = btb_14_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_14_bht_T_1 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_14_bht_T_2 = btb_14_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_14_bht_T_3 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_14_bht_T_4 = btb_14_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_14_bht_T_5 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_14_bht_T_6 = btb_14_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_14_bht_T_7 = io_i_branch_resolve_pack_taken & btb_14_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_14_bht_T_10 = _T_136 & _btb_14_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_14_bht_T_13 = _T_136 & _btb_14_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_14_bht_T_16 = _T_136 & _btb_14_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_14_bht_T_19 = _T_136 & _btb_14_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_14_bht_T_20 = _btb_14_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_21 = _btb_14_bht_T_16 ? 2'h3 : _btb_14_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_22 = _btb_14_bht_T_13 ? 2'h0 : _btb_14_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_23 = _btb_14_bht_T_10 ? 2'h2 : _btb_14_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_24 = _btb_14_bht_T_7 ? 2'h2 : _btb_14_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_25 = _btb_14_bht_T_5 ? 2'h0 : _btb_14_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_26 = _btb_14_bht_T_3 ? 2'h1 : _btb_14_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_14_bht_T_27 = _btb_14_bht_T_1 ? 2'h1 : _btb_14_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1187 = ~(btb_14_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_846; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1188 = ~(btb_14_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_974; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1189 = ~(btb_14_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_14_bht_T_27 : _GEN_1038; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_1190 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_13_tag == io_i_branch_resolve_pack_pc[12:3]
     | (btb_12_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_11_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_10_tag
     == io_i_branch_resolve_pack_pc[12:3] | (btb_9_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_8_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_7_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_6_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_5_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_4_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_3_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_2_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_1_tag == io_i_branch_resolve_pack_pc[12:3] | btb_0_tag ==
    io_i_branch_resolve_pack_pc[12:3]))))))))))))); // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_1191 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1187 : _GEN_846; // @[branch_predictor.scala 89:71]
  wire  _GEN_1192 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1188 : _GEN_974; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1193 = btb_14_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1189 : _GEN_1038; // @[branch_predictor.scala 89:71]
  wire  _btb_15_bht_T = btb_15_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_15_bht_T_1 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_15_bht_T_2 = btb_15_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_15_bht_T_3 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_15_bht_T_4 = btb_15_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_15_bht_T_5 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_15_bht_T_6 = btb_15_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_15_bht_T_7 = io_i_branch_resolve_pack_taken & btb_15_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_15_bht_T_10 = _T_136 & _btb_15_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_15_bht_T_13 = _T_136 & _btb_15_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_15_bht_T_16 = _T_136 & _btb_15_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_15_bht_T_19 = _T_136 & _btb_15_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_15_bht_T_20 = _btb_15_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_21 = _btb_15_bht_T_16 ? 2'h3 : _btb_15_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_22 = _btb_15_bht_T_13 ? 2'h0 : _btb_15_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_23 = _btb_15_bht_T_10 ? 2'h2 : _btb_15_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_24 = _btb_15_bht_T_7 ? 2'h2 : _btb_15_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_25 = _btb_15_bht_T_5 ? 2'h0 : _btb_15_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_26 = _btb_15_bht_T_3 ? 2'h1 : _btb_15_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_15_bht_T_27 = _btb_15_bht_T_1 ? 2'h1 : _btb_15_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1194 = ~(btb_15_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_847; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1195 = ~(btb_15_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_975; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1196 = ~(btb_15_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_15_bht_T_27 : _GEN_1039; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1198 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1194 : _GEN_847; // @[branch_predictor.scala 89:71]
  wire  _GEN_1199 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1195 : _GEN_975; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1200 = btb_15_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1196 : _GEN_1039; // @[branch_predictor.scala 89:71]
  wire  _btb_16_bht_T = btb_16_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_16_bht_T_1 = io_i_branch_resolve_pack_taken & btb_16_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_16_bht_T_2 = btb_16_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_16_bht_T_3 = io_i_branch_resolve_pack_taken & btb_16_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_16_bht_T_4 = btb_16_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_16_bht_T_5 = io_i_branch_resolve_pack_taken & btb_16_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_16_bht_T_6 = btb_16_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_16_bht_T_7 = io_i_branch_resolve_pack_taken & btb_16_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_16_bht_T_10 = _T_136 & _btb_16_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_16_bht_T_13 = _T_136 & _btb_16_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_16_bht_T_16 = _T_136 & _btb_16_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_16_bht_T_19 = _T_136 & _btb_16_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_16_bht_T_20 = _btb_16_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_21 = _btb_16_bht_T_16 ? 2'h3 : _btb_16_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_22 = _btb_16_bht_T_13 ? 2'h0 : _btb_16_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_23 = _btb_16_bht_T_10 ? 2'h2 : _btb_16_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_24 = _btb_16_bht_T_7 ? 2'h2 : _btb_16_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_25 = _btb_16_bht_T_5 ? 2'h0 : _btb_16_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_26 = _btb_16_bht_T_3 ? 2'h1 : _btb_16_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_16_bht_T_27 = _btb_16_bht_T_1 ? 2'h1 : _btb_16_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1201 = ~(btb_16_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_848; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1202 = ~(btb_16_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_976; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1203 = ~(btb_16_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_16_bht_T_27 : _GEN_1040; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1205 = btb_16_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1201 : _GEN_848; // @[branch_predictor.scala 89:71]
  wire  _GEN_1206 = btb_16_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1202 : _GEN_976; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1207 = btb_16_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1203 : _GEN_1040; // @[branch_predictor.scala 89:71]
  wire  _btb_17_bht_T = btb_17_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_17_bht_T_1 = io_i_branch_resolve_pack_taken & btb_17_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_17_bht_T_2 = btb_17_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_17_bht_T_3 = io_i_branch_resolve_pack_taken & btb_17_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_17_bht_T_4 = btb_17_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_17_bht_T_5 = io_i_branch_resolve_pack_taken & btb_17_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_17_bht_T_6 = btb_17_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_17_bht_T_7 = io_i_branch_resolve_pack_taken & btb_17_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_17_bht_T_10 = _T_136 & _btb_17_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_17_bht_T_13 = _T_136 & _btb_17_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_17_bht_T_16 = _T_136 & _btb_17_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_17_bht_T_19 = _T_136 & _btb_17_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_17_bht_T_20 = _btb_17_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_21 = _btb_17_bht_T_16 ? 2'h3 : _btb_17_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_22 = _btb_17_bht_T_13 ? 2'h0 : _btb_17_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_23 = _btb_17_bht_T_10 ? 2'h2 : _btb_17_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_24 = _btb_17_bht_T_7 ? 2'h2 : _btb_17_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_25 = _btb_17_bht_T_5 ? 2'h0 : _btb_17_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_26 = _btb_17_bht_T_3 ? 2'h1 : _btb_17_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_17_bht_T_27 = _btb_17_bht_T_1 ? 2'h1 : _btb_17_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1208 = ~(btb_17_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_849; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1209 = ~(btb_17_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_977; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1210 = ~(btb_17_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_17_bht_T_27 : _GEN_1041; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1212 = btb_17_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1208 : _GEN_849; // @[branch_predictor.scala 89:71]
  wire  _GEN_1213 = btb_17_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1209 : _GEN_977; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1214 = btb_17_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1210 : _GEN_1041; // @[branch_predictor.scala 89:71]
  wire  _btb_18_bht_T = btb_18_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_18_bht_T_1 = io_i_branch_resolve_pack_taken & btb_18_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_18_bht_T_2 = btb_18_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_18_bht_T_3 = io_i_branch_resolve_pack_taken & btb_18_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_18_bht_T_4 = btb_18_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_18_bht_T_5 = io_i_branch_resolve_pack_taken & btb_18_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_18_bht_T_6 = btb_18_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_18_bht_T_7 = io_i_branch_resolve_pack_taken & btb_18_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_18_bht_T_10 = _T_136 & _btb_18_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_18_bht_T_13 = _T_136 & _btb_18_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_18_bht_T_16 = _T_136 & _btb_18_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_18_bht_T_19 = _T_136 & _btb_18_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_18_bht_T_20 = _btb_18_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_21 = _btb_18_bht_T_16 ? 2'h3 : _btb_18_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_22 = _btb_18_bht_T_13 ? 2'h0 : _btb_18_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_23 = _btb_18_bht_T_10 ? 2'h2 : _btb_18_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_24 = _btb_18_bht_T_7 ? 2'h2 : _btb_18_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_25 = _btb_18_bht_T_5 ? 2'h0 : _btb_18_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_26 = _btb_18_bht_T_3 ? 2'h1 : _btb_18_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_18_bht_T_27 = _btb_18_bht_T_1 ? 2'h1 : _btb_18_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1215 = ~(btb_18_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_850; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1216 = ~(btb_18_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_978; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1217 = ~(btb_18_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_18_bht_T_27 : _GEN_1042; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1219 = btb_18_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1215 : _GEN_850; // @[branch_predictor.scala 89:71]
  wire  _GEN_1220 = btb_18_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1216 : _GEN_978; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1221 = btb_18_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1217 : _GEN_1042; // @[branch_predictor.scala 89:71]
  wire  _btb_19_bht_T = btb_19_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_19_bht_T_1 = io_i_branch_resolve_pack_taken & btb_19_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_19_bht_T_2 = btb_19_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_19_bht_T_3 = io_i_branch_resolve_pack_taken & btb_19_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_19_bht_T_4 = btb_19_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_19_bht_T_5 = io_i_branch_resolve_pack_taken & btb_19_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_19_bht_T_6 = btb_19_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_19_bht_T_7 = io_i_branch_resolve_pack_taken & btb_19_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_19_bht_T_10 = _T_136 & _btb_19_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_19_bht_T_13 = _T_136 & _btb_19_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_19_bht_T_16 = _T_136 & _btb_19_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_19_bht_T_19 = _T_136 & _btb_19_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_19_bht_T_20 = _btb_19_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_21 = _btb_19_bht_T_16 ? 2'h3 : _btb_19_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_22 = _btb_19_bht_T_13 ? 2'h0 : _btb_19_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_23 = _btb_19_bht_T_10 ? 2'h2 : _btb_19_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_24 = _btb_19_bht_T_7 ? 2'h2 : _btb_19_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_25 = _btb_19_bht_T_5 ? 2'h0 : _btb_19_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_26 = _btb_19_bht_T_3 ? 2'h1 : _btb_19_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_19_bht_T_27 = _btb_19_bht_T_1 ? 2'h1 : _btb_19_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1222 = ~(btb_19_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_851; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1223 = ~(btb_19_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_979; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1224 = ~(btb_19_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_19_bht_T_27 : _GEN_1043; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1226 = btb_19_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1222 : _GEN_851; // @[branch_predictor.scala 89:71]
  wire  _GEN_1227 = btb_19_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1223 : _GEN_979; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1228 = btb_19_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1224 : _GEN_1043; // @[branch_predictor.scala 89:71]
  wire  _btb_20_bht_T = btb_20_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_20_bht_T_1 = io_i_branch_resolve_pack_taken & btb_20_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_20_bht_T_2 = btb_20_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_20_bht_T_3 = io_i_branch_resolve_pack_taken & btb_20_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_20_bht_T_4 = btb_20_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_20_bht_T_5 = io_i_branch_resolve_pack_taken & btb_20_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_20_bht_T_6 = btb_20_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_20_bht_T_7 = io_i_branch_resolve_pack_taken & btb_20_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_20_bht_T_10 = _T_136 & _btb_20_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_20_bht_T_13 = _T_136 & _btb_20_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_20_bht_T_16 = _T_136 & _btb_20_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_20_bht_T_19 = _T_136 & _btb_20_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_20_bht_T_20 = _btb_20_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_21 = _btb_20_bht_T_16 ? 2'h3 : _btb_20_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_22 = _btb_20_bht_T_13 ? 2'h0 : _btb_20_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_23 = _btb_20_bht_T_10 ? 2'h2 : _btb_20_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_24 = _btb_20_bht_T_7 ? 2'h2 : _btb_20_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_25 = _btb_20_bht_T_5 ? 2'h0 : _btb_20_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_26 = _btb_20_bht_T_3 ? 2'h1 : _btb_20_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_20_bht_T_27 = _btb_20_bht_T_1 ? 2'h1 : _btb_20_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1229 = ~(btb_20_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_852; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1230 = ~(btb_20_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_980; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1231 = ~(btb_20_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_20_bht_T_27 : _GEN_1044; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1233 = btb_20_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1229 : _GEN_852; // @[branch_predictor.scala 89:71]
  wire  _GEN_1234 = btb_20_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1230 : _GEN_980; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1235 = btb_20_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1231 : _GEN_1044; // @[branch_predictor.scala 89:71]
  wire  _btb_21_bht_T = btb_21_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_21_bht_T_1 = io_i_branch_resolve_pack_taken & btb_21_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_21_bht_T_2 = btb_21_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_21_bht_T_3 = io_i_branch_resolve_pack_taken & btb_21_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_21_bht_T_4 = btb_21_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_21_bht_T_5 = io_i_branch_resolve_pack_taken & btb_21_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_21_bht_T_6 = btb_21_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_21_bht_T_7 = io_i_branch_resolve_pack_taken & btb_21_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_21_bht_T_10 = _T_136 & _btb_21_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_21_bht_T_13 = _T_136 & _btb_21_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_21_bht_T_16 = _T_136 & _btb_21_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_21_bht_T_19 = _T_136 & _btb_21_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_21_bht_T_20 = _btb_21_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_21 = _btb_21_bht_T_16 ? 2'h3 : _btb_21_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_22 = _btb_21_bht_T_13 ? 2'h0 : _btb_21_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_23 = _btb_21_bht_T_10 ? 2'h2 : _btb_21_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_24 = _btb_21_bht_T_7 ? 2'h2 : _btb_21_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_25 = _btb_21_bht_T_5 ? 2'h0 : _btb_21_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_26 = _btb_21_bht_T_3 ? 2'h1 : _btb_21_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_21_bht_T_27 = _btb_21_bht_T_1 ? 2'h1 : _btb_21_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1236 = ~(btb_21_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_853; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1237 = ~(btb_21_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_981; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1238 = ~(btb_21_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_21_bht_T_27 : _GEN_1045; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1240 = btb_21_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1236 : _GEN_853; // @[branch_predictor.scala 89:71]
  wire  _GEN_1241 = btb_21_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1237 : _GEN_981; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1242 = btb_21_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1238 : _GEN_1045; // @[branch_predictor.scala 89:71]
  wire  _btb_22_bht_T = btb_22_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_22_bht_T_1 = io_i_branch_resolve_pack_taken & btb_22_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_22_bht_T_2 = btb_22_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_22_bht_T_3 = io_i_branch_resolve_pack_taken & btb_22_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_22_bht_T_4 = btb_22_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_22_bht_T_5 = io_i_branch_resolve_pack_taken & btb_22_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_22_bht_T_6 = btb_22_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_22_bht_T_7 = io_i_branch_resolve_pack_taken & btb_22_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_22_bht_T_10 = _T_136 & _btb_22_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_22_bht_T_13 = _T_136 & _btb_22_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_22_bht_T_16 = _T_136 & _btb_22_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_22_bht_T_19 = _T_136 & _btb_22_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_22_bht_T_20 = _btb_22_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_21 = _btb_22_bht_T_16 ? 2'h3 : _btb_22_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_22 = _btb_22_bht_T_13 ? 2'h0 : _btb_22_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_23 = _btb_22_bht_T_10 ? 2'h2 : _btb_22_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_24 = _btb_22_bht_T_7 ? 2'h2 : _btb_22_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_25 = _btb_22_bht_T_5 ? 2'h0 : _btb_22_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_26 = _btb_22_bht_T_3 ? 2'h1 : _btb_22_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_22_bht_T_27 = _btb_22_bht_T_1 ? 2'h1 : _btb_22_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1243 = ~(btb_22_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_854; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1244 = ~(btb_22_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_982; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1245 = ~(btb_22_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_22_bht_T_27 : _GEN_1046; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1247 = btb_22_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1243 : _GEN_854; // @[branch_predictor.scala 89:71]
  wire  _GEN_1248 = btb_22_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1244 : _GEN_982; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1249 = btb_22_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1245 : _GEN_1046; // @[branch_predictor.scala 89:71]
  wire  _btb_23_bht_T = btb_23_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_23_bht_T_1 = io_i_branch_resolve_pack_taken & btb_23_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_23_bht_T_2 = btb_23_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_23_bht_T_3 = io_i_branch_resolve_pack_taken & btb_23_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_23_bht_T_4 = btb_23_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_23_bht_T_5 = io_i_branch_resolve_pack_taken & btb_23_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_23_bht_T_6 = btb_23_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_23_bht_T_7 = io_i_branch_resolve_pack_taken & btb_23_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_23_bht_T_10 = _T_136 & _btb_23_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_23_bht_T_13 = _T_136 & _btb_23_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_23_bht_T_16 = _T_136 & _btb_23_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_23_bht_T_19 = _T_136 & _btb_23_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_23_bht_T_20 = _btb_23_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_21 = _btb_23_bht_T_16 ? 2'h3 : _btb_23_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_22 = _btb_23_bht_T_13 ? 2'h0 : _btb_23_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_23 = _btb_23_bht_T_10 ? 2'h2 : _btb_23_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_24 = _btb_23_bht_T_7 ? 2'h2 : _btb_23_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_25 = _btb_23_bht_T_5 ? 2'h0 : _btb_23_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_26 = _btb_23_bht_T_3 ? 2'h1 : _btb_23_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_23_bht_T_27 = _btb_23_bht_T_1 ? 2'h1 : _btb_23_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1250 = ~(btb_23_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_855; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1251 = ~(btb_23_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_983; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1252 = ~(btb_23_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_23_bht_T_27 : _GEN_1047; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1254 = btb_23_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1250 : _GEN_855; // @[branch_predictor.scala 89:71]
  wire  _GEN_1255 = btb_23_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1251 : _GEN_983; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1256 = btb_23_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1252 : _GEN_1047; // @[branch_predictor.scala 89:71]
  wire  _btb_24_bht_T = btb_24_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_24_bht_T_1 = io_i_branch_resolve_pack_taken & btb_24_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_24_bht_T_2 = btb_24_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_24_bht_T_3 = io_i_branch_resolve_pack_taken & btb_24_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_24_bht_T_4 = btb_24_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_24_bht_T_5 = io_i_branch_resolve_pack_taken & btb_24_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_24_bht_T_6 = btb_24_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_24_bht_T_7 = io_i_branch_resolve_pack_taken & btb_24_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_24_bht_T_10 = _T_136 & _btb_24_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_24_bht_T_13 = _T_136 & _btb_24_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_24_bht_T_16 = _T_136 & _btb_24_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_24_bht_T_19 = _T_136 & _btb_24_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_24_bht_T_20 = _btb_24_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_21 = _btb_24_bht_T_16 ? 2'h3 : _btb_24_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_22 = _btb_24_bht_T_13 ? 2'h0 : _btb_24_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_23 = _btb_24_bht_T_10 ? 2'h2 : _btb_24_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_24 = _btb_24_bht_T_7 ? 2'h2 : _btb_24_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_25 = _btb_24_bht_T_5 ? 2'h0 : _btb_24_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_26 = _btb_24_bht_T_3 ? 2'h1 : _btb_24_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_24_bht_T_27 = _btb_24_bht_T_1 ? 2'h1 : _btb_24_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1257 = ~(btb_24_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_856; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1258 = ~(btb_24_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_984; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1259 = ~(btb_24_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_24_bht_T_27 : _GEN_1048; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1261 = btb_24_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1257 : _GEN_856; // @[branch_predictor.scala 89:71]
  wire  _GEN_1262 = btb_24_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1258 : _GEN_984; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1263 = btb_24_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1259 : _GEN_1048; // @[branch_predictor.scala 89:71]
  wire  _btb_25_bht_T = btb_25_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_25_bht_T_1 = io_i_branch_resolve_pack_taken & btb_25_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_25_bht_T_2 = btb_25_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_25_bht_T_3 = io_i_branch_resolve_pack_taken & btb_25_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_25_bht_T_4 = btb_25_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_25_bht_T_5 = io_i_branch_resolve_pack_taken & btb_25_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_25_bht_T_6 = btb_25_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_25_bht_T_7 = io_i_branch_resolve_pack_taken & btb_25_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_25_bht_T_10 = _T_136 & _btb_25_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_25_bht_T_13 = _T_136 & _btb_25_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_25_bht_T_16 = _T_136 & _btb_25_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_25_bht_T_19 = _T_136 & _btb_25_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_25_bht_T_20 = _btb_25_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_21 = _btb_25_bht_T_16 ? 2'h3 : _btb_25_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_22 = _btb_25_bht_T_13 ? 2'h0 : _btb_25_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_23 = _btb_25_bht_T_10 ? 2'h2 : _btb_25_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_24 = _btb_25_bht_T_7 ? 2'h2 : _btb_25_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_25 = _btb_25_bht_T_5 ? 2'h0 : _btb_25_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_26 = _btb_25_bht_T_3 ? 2'h1 : _btb_25_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_25_bht_T_27 = _btb_25_bht_T_1 ? 2'h1 : _btb_25_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1264 = ~(btb_25_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_857; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1265 = ~(btb_25_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_985; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1266 = ~(btb_25_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_25_bht_T_27 : _GEN_1049; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1268 = btb_25_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1264 : _GEN_857; // @[branch_predictor.scala 89:71]
  wire  _GEN_1269 = btb_25_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1265 : _GEN_985; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1270 = btb_25_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1266 : _GEN_1049; // @[branch_predictor.scala 89:71]
  wire  _btb_26_bht_T = btb_26_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_26_bht_T_1 = io_i_branch_resolve_pack_taken & btb_26_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_26_bht_T_2 = btb_26_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_26_bht_T_3 = io_i_branch_resolve_pack_taken & btb_26_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_26_bht_T_4 = btb_26_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_26_bht_T_5 = io_i_branch_resolve_pack_taken & btb_26_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_26_bht_T_6 = btb_26_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_26_bht_T_7 = io_i_branch_resolve_pack_taken & btb_26_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_26_bht_T_10 = _T_136 & _btb_26_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_26_bht_T_13 = _T_136 & _btb_26_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_26_bht_T_16 = _T_136 & _btb_26_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_26_bht_T_19 = _T_136 & _btb_26_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_26_bht_T_20 = _btb_26_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_21 = _btb_26_bht_T_16 ? 2'h3 : _btb_26_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_22 = _btb_26_bht_T_13 ? 2'h0 : _btb_26_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_23 = _btb_26_bht_T_10 ? 2'h2 : _btb_26_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_24 = _btb_26_bht_T_7 ? 2'h2 : _btb_26_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_25 = _btb_26_bht_T_5 ? 2'h0 : _btb_26_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_26 = _btb_26_bht_T_3 ? 2'h1 : _btb_26_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_26_bht_T_27 = _btb_26_bht_T_1 ? 2'h1 : _btb_26_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1271 = ~(btb_26_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_858; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1272 = ~(btb_26_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_986; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1273 = ~(btb_26_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_26_bht_T_27 : _GEN_1050; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1275 = btb_26_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1271 : _GEN_858; // @[branch_predictor.scala 89:71]
  wire  _GEN_1276 = btb_26_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1272 : _GEN_986; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1277 = btb_26_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1273 : _GEN_1050; // @[branch_predictor.scala 89:71]
  wire  _btb_27_bht_T = btb_27_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_27_bht_T_1 = io_i_branch_resolve_pack_taken & btb_27_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_27_bht_T_2 = btb_27_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_27_bht_T_3 = io_i_branch_resolve_pack_taken & btb_27_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_27_bht_T_4 = btb_27_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_27_bht_T_5 = io_i_branch_resolve_pack_taken & btb_27_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_27_bht_T_6 = btb_27_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_27_bht_T_7 = io_i_branch_resolve_pack_taken & btb_27_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_27_bht_T_10 = _T_136 & _btb_27_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_27_bht_T_13 = _T_136 & _btb_27_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_27_bht_T_16 = _T_136 & _btb_27_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_27_bht_T_19 = _T_136 & _btb_27_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_27_bht_T_20 = _btb_27_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_21 = _btb_27_bht_T_16 ? 2'h3 : _btb_27_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_22 = _btb_27_bht_T_13 ? 2'h0 : _btb_27_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_23 = _btb_27_bht_T_10 ? 2'h2 : _btb_27_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_24 = _btb_27_bht_T_7 ? 2'h2 : _btb_27_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_25 = _btb_27_bht_T_5 ? 2'h0 : _btb_27_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_26 = _btb_27_bht_T_3 ? 2'h1 : _btb_27_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_27_bht_T_27 = _btb_27_bht_T_1 ? 2'h1 : _btb_27_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1278 = ~(btb_27_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_859; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1279 = ~(btb_27_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_987; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1280 = ~(btb_27_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_27_bht_T_27 : _GEN_1051; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1282 = btb_27_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1278 : _GEN_859; // @[branch_predictor.scala 89:71]
  wire  _GEN_1283 = btb_27_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1279 : _GEN_987; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1284 = btb_27_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1280 : _GEN_1051; // @[branch_predictor.scala 89:71]
  wire  _btb_28_bht_T = btb_28_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_28_bht_T_1 = io_i_branch_resolve_pack_taken & btb_28_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_28_bht_T_2 = btb_28_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_28_bht_T_3 = io_i_branch_resolve_pack_taken & btb_28_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_28_bht_T_4 = btb_28_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_28_bht_T_5 = io_i_branch_resolve_pack_taken & btb_28_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_28_bht_T_6 = btb_28_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_28_bht_T_7 = io_i_branch_resolve_pack_taken & btb_28_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_28_bht_T_10 = _T_136 & _btb_28_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_28_bht_T_13 = _T_136 & _btb_28_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_28_bht_T_16 = _T_136 & _btb_28_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_28_bht_T_19 = _T_136 & _btb_28_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_28_bht_T_20 = _btb_28_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_21 = _btb_28_bht_T_16 ? 2'h3 : _btb_28_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_22 = _btb_28_bht_T_13 ? 2'h0 : _btb_28_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_23 = _btb_28_bht_T_10 ? 2'h2 : _btb_28_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_24 = _btb_28_bht_T_7 ? 2'h2 : _btb_28_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_25 = _btb_28_bht_T_5 ? 2'h0 : _btb_28_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_26 = _btb_28_bht_T_3 ? 2'h1 : _btb_28_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_28_bht_T_27 = _btb_28_bht_T_1 ? 2'h1 : _btb_28_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1285 = ~(btb_28_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_860; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1286 = ~(btb_28_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_988; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1287 = ~(btb_28_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_28_bht_T_27 : _GEN_1052; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1289 = btb_28_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1285 : _GEN_860; // @[branch_predictor.scala 89:71]
  wire  _GEN_1290 = btb_28_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1286 : _GEN_988; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1291 = btb_28_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1287 : _GEN_1052; // @[branch_predictor.scala 89:71]
  wire  _btb_29_bht_T = btb_29_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_29_bht_T_1 = io_i_branch_resolve_pack_taken & btb_29_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_29_bht_T_2 = btb_29_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_29_bht_T_3 = io_i_branch_resolve_pack_taken & btb_29_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_29_bht_T_4 = btb_29_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_29_bht_T_5 = io_i_branch_resolve_pack_taken & btb_29_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_29_bht_T_6 = btb_29_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_29_bht_T_7 = io_i_branch_resolve_pack_taken & btb_29_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_29_bht_T_10 = _T_136 & _btb_29_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_29_bht_T_13 = _T_136 & _btb_29_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_29_bht_T_16 = _T_136 & _btb_29_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_29_bht_T_19 = _T_136 & _btb_29_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_29_bht_T_20 = _btb_29_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_21 = _btb_29_bht_T_16 ? 2'h3 : _btb_29_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_22 = _btb_29_bht_T_13 ? 2'h0 : _btb_29_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_23 = _btb_29_bht_T_10 ? 2'h2 : _btb_29_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_24 = _btb_29_bht_T_7 ? 2'h2 : _btb_29_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_25 = _btb_29_bht_T_5 ? 2'h0 : _btb_29_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_26 = _btb_29_bht_T_3 ? 2'h1 : _btb_29_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_29_bht_T_27 = _btb_29_bht_T_1 ? 2'h1 : _btb_29_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1292 = ~(btb_29_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_861; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1293 = ~(btb_29_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_989; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1294 = ~(btb_29_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_29_bht_T_27 : _GEN_1053; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_1295 = btb_29_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_28_tag == io_i_branch_resolve_pack_pc[12:3]
     | (btb_27_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_26_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_25_tag
     == io_i_branch_resolve_pack_pc[12:3] | (btb_24_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_23_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_22_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_21_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_20_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_19_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_18_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_17_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_16_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_15_tag ==
    io_i_branch_resolve_pack_pc[12:3] | _GEN_1190)))))))))))))); // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_1296 = btb_29_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1292 : _GEN_861; // @[branch_predictor.scala 89:71]
  wire  _GEN_1297 = btb_29_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1293 : _GEN_989; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1298 = btb_29_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1294 : _GEN_1053; // @[branch_predictor.scala 89:71]
  wire  _btb_30_bht_T = btb_30_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_30_bht_T_1 = io_i_branch_resolve_pack_taken & btb_30_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_30_bht_T_2 = btb_30_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_30_bht_T_3 = io_i_branch_resolve_pack_taken & btb_30_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_30_bht_T_4 = btb_30_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_30_bht_T_5 = io_i_branch_resolve_pack_taken & btb_30_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_30_bht_T_6 = btb_30_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_30_bht_T_7 = io_i_branch_resolve_pack_taken & btb_30_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_30_bht_T_10 = _T_136 & _btb_30_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_30_bht_T_13 = _T_136 & _btb_30_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_30_bht_T_16 = _T_136 & _btb_30_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_30_bht_T_19 = _T_136 & _btb_30_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_30_bht_T_20 = _btb_30_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_21 = _btb_30_bht_T_16 ? 2'h3 : _btb_30_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_22 = _btb_30_bht_T_13 ? 2'h0 : _btb_30_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_23 = _btb_30_bht_T_10 ? 2'h2 : _btb_30_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_24 = _btb_30_bht_T_7 ? 2'h2 : _btb_30_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_25 = _btb_30_bht_T_5 ? 2'h0 : _btb_30_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_26 = _btb_30_bht_T_3 ? 2'h1 : _btb_30_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_30_bht_T_27 = _btb_30_bht_T_1 ? 2'h1 : _btb_30_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1299 = ~(btb_30_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_862; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1300 = ~(btb_30_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_990; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1301 = ~(btb_30_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_30_bht_T_27 : _GEN_1054; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1303 = btb_30_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1299 : _GEN_862; // @[branch_predictor.scala 89:71]
  wire  _GEN_1304 = btb_30_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1300 : _GEN_990; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1305 = btb_30_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1301 : _GEN_1054; // @[branch_predictor.scala 89:71]
  wire  _btb_31_bht_T = btb_31_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_31_bht_T_1 = io_i_branch_resolve_pack_taken & btb_31_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_31_bht_T_2 = btb_31_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_31_bht_T_3 = io_i_branch_resolve_pack_taken & btb_31_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_31_bht_T_4 = btb_31_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_31_bht_T_5 = io_i_branch_resolve_pack_taken & btb_31_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_31_bht_T_6 = btb_31_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_31_bht_T_7 = io_i_branch_resolve_pack_taken & btb_31_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_31_bht_T_10 = _T_136 & _btb_31_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_31_bht_T_13 = _T_136 & _btb_31_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_31_bht_T_16 = _T_136 & _btb_31_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_31_bht_T_19 = _T_136 & _btb_31_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_31_bht_T_20 = _btb_31_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_21 = _btb_31_bht_T_16 ? 2'h3 : _btb_31_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_22 = _btb_31_bht_T_13 ? 2'h0 : _btb_31_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_23 = _btb_31_bht_T_10 ? 2'h2 : _btb_31_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_24 = _btb_31_bht_T_7 ? 2'h2 : _btb_31_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_25 = _btb_31_bht_T_5 ? 2'h0 : _btb_31_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_26 = _btb_31_bht_T_3 ? 2'h1 : _btb_31_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_31_bht_T_27 = _btb_31_bht_T_1 ? 2'h1 : _btb_31_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1306 = ~(btb_31_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_863; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1307 = ~(btb_31_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_991; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1308 = ~(btb_31_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_31_bht_T_27 : _GEN_1055; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1310 = btb_31_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1306 : _GEN_863; // @[branch_predictor.scala 89:71]
  wire  _GEN_1311 = btb_31_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1307 : _GEN_991; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1312 = btb_31_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1308 : _GEN_1055; // @[branch_predictor.scala 89:71]
  wire  _btb_32_bht_T = btb_32_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_32_bht_T_1 = io_i_branch_resolve_pack_taken & btb_32_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_32_bht_T_2 = btb_32_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_32_bht_T_3 = io_i_branch_resolve_pack_taken & btb_32_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_32_bht_T_4 = btb_32_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_32_bht_T_5 = io_i_branch_resolve_pack_taken & btb_32_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_32_bht_T_6 = btb_32_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_32_bht_T_7 = io_i_branch_resolve_pack_taken & btb_32_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_32_bht_T_10 = _T_136 & _btb_32_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_32_bht_T_13 = _T_136 & _btb_32_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_32_bht_T_16 = _T_136 & _btb_32_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_32_bht_T_19 = _T_136 & _btb_32_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_32_bht_T_20 = _btb_32_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_21 = _btb_32_bht_T_16 ? 2'h3 : _btb_32_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_22 = _btb_32_bht_T_13 ? 2'h0 : _btb_32_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_23 = _btb_32_bht_T_10 ? 2'h2 : _btb_32_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_24 = _btb_32_bht_T_7 ? 2'h2 : _btb_32_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_25 = _btb_32_bht_T_5 ? 2'h0 : _btb_32_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_26 = _btb_32_bht_T_3 ? 2'h1 : _btb_32_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_32_bht_T_27 = _btb_32_bht_T_1 ? 2'h1 : _btb_32_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1313 = ~(btb_32_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_864; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1314 = ~(btb_32_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_992; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1315 = ~(btb_32_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_32_bht_T_27 : _GEN_1056; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1317 = btb_32_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1313 : _GEN_864; // @[branch_predictor.scala 89:71]
  wire  _GEN_1318 = btb_32_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1314 : _GEN_992; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1319 = btb_32_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1315 : _GEN_1056; // @[branch_predictor.scala 89:71]
  wire  _btb_33_bht_T = btb_33_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_33_bht_T_1 = io_i_branch_resolve_pack_taken & btb_33_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_33_bht_T_2 = btb_33_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_33_bht_T_3 = io_i_branch_resolve_pack_taken & btb_33_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_33_bht_T_4 = btb_33_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_33_bht_T_5 = io_i_branch_resolve_pack_taken & btb_33_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_33_bht_T_6 = btb_33_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_33_bht_T_7 = io_i_branch_resolve_pack_taken & btb_33_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_33_bht_T_10 = _T_136 & _btb_33_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_33_bht_T_13 = _T_136 & _btb_33_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_33_bht_T_16 = _T_136 & _btb_33_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_33_bht_T_19 = _T_136 & _btb_33_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_33_bht_T_20 = _btb_33_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_21 = _btb_33_bht_T_16 ? 2'h3 : _btb_33_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_22 = _btb_33_bht_T_13 ? 2'h0 : _btb_33_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_23 = _btb_33_bht_T_10 ? 2'h2 : _btb_33_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_24 = _btb_33_bht_T_7 ? 2'h2 : _btb_33_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_25 = _btb_33_bht_T_5 ? 2'h0 : _btb_33_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_26 = _btb_33_bht_T_3 ? 2'h1 : _btb_33_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_33_bht_T_27 = _btb_33_bht_T_1 ? 2'h1 : _btb_33_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1320 = ~(btb_33_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_865; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1321 = ~(btb_33_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_993; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1322 = ~(btb_33_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_33_bht_T_27 : _GEN_1057; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1324 = btb_33_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1320 : _GEN_865; // @[branch_predictor.scala 89:71]
  wire  _GEN_1325 = btb_33_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1321 : _GEN_993; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1326 = btb_33_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1322 : _GEN_1057; // @[branch_predictor.scala 89:71]
  wire  _btb_34_bht_T = btb_34_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_34_bht_T_1 = io_i_branch_resolve_pack_taken & btb_34_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_34_bht_T_2 = btb_34_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_34_bht_T_3 = io_i_branch_resolve_pack_taken & btb_34_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_34_bht_T_4 = btb_34_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_34_bht_T_5 = io_i_branch_resolve_pack_taken & btb_34_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_34_bht_T_6 = btb_34_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_34_bht_T_7 = io_i_branch_resolve_pack_taken & btb_34_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_34_bht_T_10 = _T_136 & _btb_34_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_34_bht_T_13 = _T_136 & _btb_34_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_34_bht_T_16 = _T_136 & _btb_34_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_34_bht_T_19 = _T_136 & _btb_34_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_34_bht_T_20 = _btb_34_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_21 = _btb_34_bht_T_16 ? 2'h3 : _btb_34_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_22 = _btb_34_bht_T_13 ? 2'h0 : _btb_34_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_23 = _btb_34_bht_T_10 ? 2'h2 : _btb_34_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_24 = _btb_34_bht_T_7 ? 2'h2 : _btb_34_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_25 = _btb_34_bht_T_5 ? 2'h0 : _btb_34_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_26 = _btb_34_bht_T_3 ? 2'h1 : _btb_34_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_34_bht_T_27 = _btb_34_bht_T_1 ? 2'h1 : _btb_34_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1327 = ~(btb_34_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_866; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1328 = ~(btb_34_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_994; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1329 = ~(btb_34_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_34_bht_T_27 : _GEN_1058; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1331 = btb_34_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1327 : _GEN_866; // @[branch_predictor.scala 89:71]
  wire  _GEN_1332 = btb_34_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1328 : _GEN_994; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1333 = btb_34_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1329 : _GEN_1058; // @[branch_predictor.scala 89:71]
  wire  _btb_35_bht_T = btb_35_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_35_bht_T_1 = io_i_branch_resolve_pack_taken & btb_35_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_35_bht_T_2 = btb_35_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_35_bht_T_3 = io_i_branch_resolve_pack_taken & btb_35_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_35_bht_T_4 = btb_35_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_35_bht_T_5 = io_i_branch_resolve_pack_taken & btb_35_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_35_bht_T_6 = btb_35_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_35_bht_T_7 = io_i_branch_resolve_pack_taken & btb_35_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_35_bht_T_10 = _T_136 & _btb_35_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_35_bht_T_13 = _T_136 & _btb_35_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_35_bht_T_16 = _T_136 & _btb_35_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_35_bht_T_19 = _T_136 & _btb_35_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_35_bht_T_20 = _btb_35_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_21 = _btb_35_bht_T_16 ? 2'h3 : _btb_35_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_22 = _btb_35_bht_T_13 ? 2'h0 : _btb_35_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_23 = _btb_35_bht_T_10 ? 2'h2 : _btb_35_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_24 = _btb_35_bht_T_7 ? 2'h2 : _btb_35_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_25 = _btb_35_bht_T_5 ? 2'h0 : _btb_35_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_26 = _btb_35_bht_T_3 ? 2'h1 : _btb_35_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_35_bht_T_27 = _btb_35_bht_T_1 ? 2'h1 : _btb_35_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1334 = ~(btb_35_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_867; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1335 = ~(btb_35_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_995; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1336 = ~(btb_35_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_35_bht_T_27 : _GEN_1059; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1338 = btb_35_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1334 : _GEN_867; // @[branch_predictor.scala 89:71]
  wire  _GEN_1339 = btb_35_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1335 : _GEN_995; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1340 = btb_35_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1336 : _GEN_1059; // @[branch_predictor.scala 89:71]
  wire  _btb_36_bht_T = btb_36_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_36_bht_T_1 = io_i_branch_resolve_pack_taken & btb_36_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_36_bht_T_2 = btb_36_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_36_bht_T_3 = io_i_branch_resolve_pack_taken & btb_36_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_36_bht_T_4 = btb_36_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_36_bht_T_5 = io_i_branch_resolve_pack_taken & btb_36_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_36_bht_T_6 = btb_36_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_36_bht_T_7 = io_i_branch_resolve_pack_taken & btb_36_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_36_bht_T_10 = _T_136 & _btb_36_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_36_bht_T_13 = _T_136 & _btb_36_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_36_bht_T_16 = _T_136 & _btb_36_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_36_bht_T_19 = _T_136 & _btb_36_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_36_bht_T_20 = _btb_36_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_21 = _btb_36_bht_T_16 ? 2'h3 : _btb_36_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_22 = _btb_36_bht_T_13 ? 2'h0 : _btb_36_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_23 = _btb_36_bht_T_10 ? 2'h2 : _btb_36_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_24 = _btb_36_bht_T_7 ? 2'h2 : _btb_36_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_25 = _btb_36_bht_T_5 ? 2'h0 : _btb_36_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_26 = _btb_36_bht_T_3 ? 2'h1 : _btb_36_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_36_bht_T_27 = _btb_36_bht_T_1 ? 2'h1 : _btb_36_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1341 = ~(btb_36_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_868; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1342 = ~(btb_36_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_996; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1343 = ~(btb_36_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_36_bht_T_27 : _GEN_1060; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1345 = btb_36_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1341 : _GEN_868; // @[branch_predictor.scala 89:71]
  wire  _GEN_1346 = btb_36_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1342 : _GEN_996; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1347 = btb_36_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1343 : _GEN_1060; // @[branch_predictor.scala 89:71]
  wire  _btb_37_bht_T = btb_37_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_37_bht_T_1 = io_i_branch_resolve_pack_taken & btb_37_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_37_bht_T_2 = btb_37_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_37_bht_T_3 = io_i_branch_resolve_pack_taken & btb_37_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_37_bht_T_4 = btb_37_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_37_bht_T_5 = io_i_branch_resolve_pack_taken & btb_37_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_37_bht_T_6 = btb_37_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_37_bht_T_7 = io_i_branch_resolve_pack_taken & btb_37_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_37_bht_T_10 = _T_136 & _btb_37_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_37_bht_T_13 = _T_136 & _btb_37_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_37_bht_T_16 = _T_136 & _btb_37_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_37_bht_T_19 = _T_136 & _btb_37_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_37_bht_T_20 = _btb_37_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_21 = _btb_37_bht_T_16 ? 2'h3 : _btb_37_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_22 = _btb_37_bht_T_13 ? 2'h0 : _btb_37_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_23 = _btb_37_bht_T_10 ? 2'h2 : _btb_37_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_24 = _btb_37_bht_T_7 ? 2'h2 : _btb_37_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_25 = _btb_37_bht_T_5 ? 2'h0 : _btb_37_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_26 = _btb_37_bht_T_3 ? 2'h1 : _btb_37_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_37_bht_T_27 = _btb_37_bht_T_1 ? 2'h1 : _btb_37_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1348 = ~(btb_37_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_869; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1349 = ~(btb_37_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_997; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1350 = ~(btb_37_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_37_bht_T_27 : _GEN_1061; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1352 = btb_37_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1348 : _GEN_869; // @[branch_predictor.scala 89:71]
  wire  _GEN_1353 = btb_37_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1349 : _GEN_997; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1354 = btb_37_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1350 : _GEN_1061; // @[branch_predictor.scala 89:71]
  wire  _btb_38_bht_T = btb_38_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_38_bht_T_1 = io_i_branch_resolve_pack_taken & btb_38_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_38_bht_T_2 = btb_38_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_38_bht_T_3 = io_i_branch_resolve_pack_taken & btb_38_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_38_bht_T_4 = btb_38_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_38_bht_T_5 = io_i_branch_resolve_pack_taken & btb_38_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_38_bht_T_6 = btb_38_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_38_bht_T_7 = io_i_branch_resolve_pack_taken & btb_38_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_38_bht_T_10 = _T_136 & _btb_38_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_38_bht_T_13 = _T_136 & _btb_38_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_38_bht_T_16 = _T_136 & _btb_38_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_38_bht_T_19 = _T_136 & _btb_38_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_38_bht_T_20 = _btb_38_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_21 = _btb_38_bht_T_16 ? 2'h3 : _btb_38_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_22 = _btb_38_bht_T_13 ? 2'h0 : _btb_38_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_23 = _btb_38_bht_T_10 ? 2'h2 : _btb_38_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_24 = _btb_38_bht_T_7 ? 2'h2 : _btb_38_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_25 = _btb_38_bht_T_5 ? 2'h0 : _btb_38_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_26 = _btb_38_bht_T_3 ? 2'h1 : _btb_38_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_38_bht_T_27 = _btb_38_bht_T_1 ? 2'h1 : _btb_38_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1355 = ~(btb_38_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_870; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1356 = ~(btb_38_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_998; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1357 = ~(btb_38_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_38_bht_T_27 : _GEN_1062; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1359 = btb_38_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1355 : _GEN_870; // @[branch_predictor.scala 89:71]
  wire  _GEN_1360 = btb_38_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1356 : _GEN_998; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1361 = btb_38_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1357 : _GEN_1062; // @[branch_predictor.scala 89:71]
  wire  _btb_39_bht_T = btb_39_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_39_bht_T_1 = io_i_branch_resolve_pack_taken & btb_39_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_39_bht_T_2 = btb_39_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_39_bht_T_3 = io_i_branch_resolve_pack_taken & btb_39_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_39_bht_T_4 = btb_39_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_39_bht_T_5 = io_i_branch_resolve_pack_taken & btb_39_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_39_bht_T_6 = btb_39_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_39_bht_T_7 = io_i_branch_resolve_pack_taken & btb_39_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_39_bht_T_10 = _T_136 & _btb_39_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_39_bht_T_13 = _T_136 & _btb_39_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_39_bht_T_16 = _T_136 & _btb_39_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_39_bht_T_19 = _T_136 & _btb_39_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_39_bht_T_20 = _btb_39_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_21 = _btb_39_bht_T_16 ? 2'h3 : _btb_39_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_22 = _btb_39_bht_T_13 ? 2'h0 : _btb_39_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_23 = _btb_39_bht_T_10 ? 2'h2 : _btb_39_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_24 = _btb_39_bht_T_7 ? 2'h2 : _btb_39_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_25 = _btb_39_bht_T_5 ? 2'h0 : _btb_39_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_26 = _btb_39_bht_T_3 ? 2'h1 : _btb_39_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_39_bht_T_27 = _btb_39_bht_T_1 ? 2'h1 : _btb_39_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1362 = ~(btb_39_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_871; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1363 = ~(btb_39_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_999; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1364 = ~(btb_39_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_39_bht_T_27 : _GEN_1063; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1366 = btb_39_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1362 : _GEN_871; // @[branch_predictor.scala 89:71]
  wire  _GEN_1367 = btb_39_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1363 : _GEN_999; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1368 = btb_39_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1364 : _GEN_1063; // @[branch_predictor.scala 89:71]
  wire  _btb_40_bht_T = btb_40_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_40_bht_T_1 = io_i_branch_resolve_pack_taken & btb_40_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_40_bht_T_2 = btb_40_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_40_bht_T_3 = io_i_branch_resolve_pack_taken & btb_40_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_40_bht_T_4 = btb_40_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_40_bht_T_5 = io_i_branch_resolve_pack_taken & btb_40_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_40_bht_T_6 = btb_40_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_40_bht_T_7 = io_i_branch_resolve_pack_taken & btb_40_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_40_bht_T_10 = _T_136 & _btb_40_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_40_bht_T_13 = _T_136 & _btb_40_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_40_bht_T_16 = _T_136 & _btb_40_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_40_bht_T_19 = _T_136 & _btb_40_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_40_bht_T_20 = _btb_40_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_21 = _btb_40_bht_T_16 ? 2'h3 : _btb_40_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_22 = _btb_40_bht_T_13 ? 2'h0 : _btb_40_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_23 = _btb_40_bht_T_10 ? 2'h2 : _btb_40_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_24 = _btb_40_bht_T_7 ? 2'h2 : _btb_40_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_25 = _btb_40_bht_T_5 ? 2'h0 : _btb_40_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_26 = _btb_40_bht_T_3 ? 2'h1 : _btb_40_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_40_bht_T_27 = _btb_40_bht_T_1 ? 2'h1 : _btb_40_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1369 = ~(btb_40_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_872; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1370 = ~(btb_40_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1000; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1371 = ~(btb_40_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_40_bht_T_27 : _GEN_1064; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1373 = btb_40_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1369 : _GEN_872; // @[branch_predictor.scala 89:71]
  wire  _GEN_1374 = btb_40_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1370 : _GEN_1000; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1375 = btb_40_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1371 : _GEN_1064; // @[branch_predictor.scala 89:71]
  wire  _btb_41_bht_T = btb_41_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_41_bht_T_1 = io_i_branch_resolve_pack_taken & btb_41_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_41_bht_T_2 = btb_41_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_41_bht_T_3 = io_i_branch_resolve_pack_taken & btb_41_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_41_bht_T_4 = btb_41_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_41_bht_T_5 = io_i_branch_resolve_pack_taken & btb_41_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_41_bht_T_6 = btb_41_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_41_bht_T_7 = io_i_branch_resolve_pack_taken & btb_41_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_41_bht_T_10 = _T_136 & _btb_41_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_41_bht_T_13 = _T_136 & _btb_41_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_41_bht_T_16 = _T_136 & _btb_41_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_41_bht_T_19 = _T_136 & _btb_41_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_41_bht_T_20 = _btb_41_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_21 = _btb_41_bht_T_16 ? 2'h3 : _btb_41_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_22 = _btb_41_bht_T_13 ? 2'h0 : _btb_41_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_23 = _btb_41_bht_T_10 ? 2'h2 : _btb_41_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_24 = _btb_41_bht_T_7 ? 2'h2 : _btb_41_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_25 = _btb_41_bht_T_5 ? 2'h0 : _btb_41_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_26 = _btb_41_bht_T_3 ? 2'h1 : _btb_41_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_41_bht_T_27 = _btb_41_bht_T_1 ? 2'h1 : _btb_41_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1376 = ~(btb_41_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_873; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1377 = ~(btb_41_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1001; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1378 = ~(btb_41_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_41_bht_T_27 : _GEN_1065; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1380 = btb_41_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1376 : _GEN_873; // @[branch_predictor.scala 89:71]
  wire  _GEN_1381 = btb_41_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1377 : _GEN_1001; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1382 = btb_41_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1378 : _GEN_1065; // @[branch_predictor.scala 89:71]
  wire  _btb_42_bht_T = btb_42_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_42_bht_T_1 = io_i_branch_resolve_pack_taken & btb_42_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_42_bht_T_2 = btb_42_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_42_bht_T_3 = io_i_branch_resolve_pack_taken & btb_42_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_42_bht_T_4 = btb_42_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_42_bht_T_5 = io_i_branch_resolve_pack_taken & btb_42_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_42_bht_T_6 = btb_42_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_42_bht_T_7 = io_i_branch_resolve_pack_taken & btb_42_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_42_bht_T_10 = _T_136 & _btb_42_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_42_bht_T_13 = _T_136 & _btb_42_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_42_bht_T_16 = _T_136 & _btb_42_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_42_bht_T_19 = _T_136 & _btb_42_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_42_bht_T_20 = _btb_42_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_21 = _btb_42_bht_T_16 ? 2'h3 : _btb_42_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_22 = _btb_42_bht_T_13 ? 2'h0 : _btb_42_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_23 = _btb_42_bht_T_10 ? 2'h2 : _btb_42_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_24 = _btb_42_bht_T_7 ? 2'h2 : _btb_42_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_25 = _btb_42_bht_T_5 ? 2'h0 : _btb_42_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_26 = _btb_42_bht_T_3 ? 2'h1 : _btb_42_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_42_bht_T_27 = _btb_42_bht_T_1 ? 2'h1 : _btb_42_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1383 = ~(btb_42_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_874; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1384 = ~(btb_42_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1002; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1385 = ~(btb_42_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_42_bht_T_27 : _GEN_1066; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1387 = btb_42_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1383 : _GEN_874; // @[branch_predictor.scala 89:71]
  wire  _GEN_1388 = btb_42_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1384 : _GEN_1002; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1389 = btb_42_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1385 : _GEN_1066; // @[branch_predictor.scala 89:71]
  wire  _btb_43_bht_T = btb_43_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_43_bht_T_1 = io_i_branch_resolve_pack_taken & btb_43_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_43_bht_T_2 = btb_43_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_43_bht_T_3 = io_i_branch_resolve_pack_taken & btb_43_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_43_bht_T_4 = btb_43_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_43_bht_T_5 = io_i_branch_resolve_pack_taken & btb_43_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_43_bht_T_6 = btb_43_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_43_bht_T_7 = io_i_branch_resolve_pack_taken & btb_43_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_43_bht_T_10 = _T_136 & _btb_43_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_43_bht_T_13 = _T_136 & _btb_43_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_43_bht_T_16 = _T_136 & _btb_43_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_43_bht_T_19 = _T_136 & _btb_43_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_43_bht_T_20 = _btb_43_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_21 = _btb_43_bht_T_16 ? 2'h3 : _btb_43_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_22 = _btb_43_bht_T_13 ? 2'h0 : _btb_43_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_23 = _btb_43_bht_T_10 ? 2'h2 : _btb_43_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_24 = _btb_43_bht_T_7 ? 2'h2 : _btb_43_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_25 = _btb_43_bht_T_5 ? 2'h0 : _btb_43_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_26 = _btb_43_bht_T_3 ? 2'h1 : _btb_43_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_43_bht_T_27 = _btb_43_bht_T_1 ? 2'h1 : _btb_43_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1390 = ~(btb_43_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_875; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1391 = ~(btb_43_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1003; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1392 = ~(btb_43_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_43_bht_T_27 : _GEN_1067; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1394 = btb_43_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1390 : _GEN_875; // @[branch_predictor.scala 89:71]
  wire  _GEN_1395 = btb_43_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1391 : _GEN_1003; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1396 = btb_43_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1392 : _GEN_1067; // @[branch_predictor.scala 89:71]
  wire  _btb_44_bht_T = btb_44_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_44_bht_T_1 = io_i_branch_resolve_pack_taken & btb_44_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_44_bht_T_2 = btb_44_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_44_bht_T_3 = io_i_branch_resolve_pack_taken & btb_44_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_44_bht_T_4 = btb_44_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_44_bht_T_5 = io_i_branch_resolve_pack_taken & btb_44_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_44_bht_T_6 = btb_44_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_44_bht_T_7 = io_i_branch_resolve_pack_taken & btb_44_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_44_bht_T_10 = _T_136 & _btb_44_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_44_bht_T_13 = _T_136 & _btb_44_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_44_bht_T_16 = _T_136 & _btb_44_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_44_bht_T_19 = _T_136 & _btb_44_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_44_bht_T_20 = _btb_44_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_21 = _btb_44_bht_T_16 ? 2'h3 : _btb_44_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_22 = _btb_44_bht_T_13 ? 2'h0 : _btb_44_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_23 = _btb_44_bht_T_10 ? 2'h2 : _btb_44_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_24 = _btb_44_bht_T_7 ? 2'h2 : _btb_44_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_25 = _btb_44_bht_T_5 ? 2'h0 : _btb_44_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_26 = _btb_44_bht_T_3 ? 2'h1 : _btb_44_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_44_bht_T_27 = _btb_44_bht_T_1 ? 2'h1 : _btb_44_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1397 = ~(btb_44_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_876; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1398 = ~(btb_44_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1004; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1399 = ~(btb_44_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_44_bht_T_27 : _GEN_1068; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_1400 = btb_44_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_43_tag == io_i_branch_resolve_pack_pc[12:3]
     | (btb_42_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_41_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_40_tag
     == io_i_branch_resolve_pack_pc[12:3] | (btb_39_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_38_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_37_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_36_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_35_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_34_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_33_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_32_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_31_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_30_tag ==
    io_i_branch_resolve_pack_pc[12:3] | _GEN_1295)))))))))))))); // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_1401 = btb_44_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1397 : _GEN_876; // @[branch_predictor.scala 89:71]
  wire  _GEN_1402 = btb_44_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1398 : _GEN_1004; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1403 = btb_44_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1399 : _GEN_1068; // @[branch_predictor.scala 89:71]
  wire  _btb_45_bht_T = btb_45_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_45_bht_T_1 = io_i_branch_resolve_pack_taken & btb_45_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_45_bht_T_2 = btb_45_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_45_bht_T_3 = io_i_branch_resolve_pack_taken & btb_45_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_45_bht_T_4 = btb_45_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_45_bht_T_5 = io_i_branch_resolve_pack_taken & btb_45_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_45_bht_T_6 = btb_45_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_45_bht_T_7 = io_i_branch_resolve_pack_taken & btb_45_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_45_bht_T_10 = _T_136 & _btb_45_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_45_bht_T_13 = _T_136 & _btb_45_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_45_bht_T_16 = _T_136 & _btb_45_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_45_bht_T_19 = _T_136 & _btb_45_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_45_bht_T_20 = _btb_45_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_21 = _btb_45_bht_T_16 ? 2'h3 : _btb_45_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_22 = _btb_45_bht_T_13 ? 2'h0 : _btb_45_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_23 = _btb_45_bht_T_10 ? 2'h2 : _btb_45_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_24 = _btb_45_bht_T_7 ? 2'h2 : _btb_45_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_25 = _btb_45_bht_T_5 ? 2'h0 : _btb_45_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_26 = _btb_45_bht_T_3 ? 2'h1 : _btb_45_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_45_bht_T_27 = _btb_45_bht_T_1 ? 2'h1 : _btb_45_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1404 = ~(btb_45_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_877; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1405 = ~(btb_45_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1005; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1406 = ~(btb_45_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_45_bht_T_27 : _GEN_1069; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1408 = btb_45_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1404 : _GEN_877; // @[branch_predictor.scala 89:71]
  wire  _GEN_1409 = btb_45_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1405 : _GEN_1005; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1410 = btb_45_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1406 : _GEN_1069; // @[branch_predictor.scala 89:71]
  wire  _btb_46_bht_T = btb_46_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_46_bht_T_1 = io_i_branch_resolve_pack_taken & btb_46_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_46_bht_T_2 = btb_46_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_46_bht_T_3 = io_i_branch_resolve_pack_taken & btb_46_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_46_bht_T_4 = btb_46_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_46_bht_T_5 = io_i_branch_resolve_pack_taken & btb_46_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_46_bht_T_6 = btb_46_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_46_bht_T_7 = io_i_branch_resolve_pack_taken & btb_46_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_46_bht_T_10 = _T_136 & _btb_46_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_46_bht_T_13 = _T_136 & _btb_46_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_46_bht_T_16 = _T_136 & _btb_46_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_46_bht_T_19 = _T_136 & _btb_46_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_46_bht_T_20 = _btb_46_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_21 = _btb_46_bht_T_16 ? 2'h3 : _btb_46_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_22 = _btb_46_bht_T_13 ? 2'h0 : _btb_46_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_23 = _btb_46_bht_T_10 ? 2'h2 : _btb_46_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_24 = _btb_46_bht_T_7 ? 2'h2 : _btb_46_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_25 = _btb_46_bht_T_5 ? 2'h0 : _btb_46_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_26 = _btb_46_bht_T_3 ? 2'h1 : _btb_46_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_46_bht_T_27 = _btb_46_bht_T_1 ? 2'h1 : _btb_46_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1411 = ~(btb_46_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_878; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1412 = ~(btb_46_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1006; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1413 = ~(btb_46_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_46_bht_T_27 : _GEN_1070; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1415 = btb_46_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1411 : _GEN_878; // @[branch_predictor.scala 89:71]
  wire  _GEN_1416 = btb_46_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1412 : _GEN_1006; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1417 = btb_46_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1413 : _GEN_1070; // @[branch_predictor.scala 89:71]
  wire  _btb_47_bht_T = btb_47_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_47_bht_T_1 = io_i_branch_resolve_pack_taken & btb_47_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_47_bht_T_2 = btb_47_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_47_bht_T_3 = io_i_branch_resolve_pack_taken & btb_47_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_47_bht_T_4 = btb_47_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_47_bht_T_5 = io_i_branch_resolve_pack_taken & btb_47_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_47_bht_T_6 = btb_47_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_47_bht_T_7 = io_i_branch_resolve_pack_taken & btb_47_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_47_bht_T_10 = _T_136 & _btb_47_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_47_bht_T_13 = _T_136 & _btb_47_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_47_bht_T_16 = _T_136 & _btb_47_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_47_bht_T_19 = _T_136 & _btb_47_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_47_bht_T_20 = _btb_47_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_21 = _btb_47_bht_T_16 ? 2'h3 : _btb_47_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_22 = _btb_47_bht_T_13 ? 2'h0 : _btb_47_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_23 = _btb_47_bht_T_10 ? 2'h2 : _btb_47_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_24 = _btb_47_bht_T_7 ? 2'h2 : _btb_47_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_25 = _btb_47_bht_T_5 ? 2'h0 : _btb_47_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_26 = _btb_47_bht_T_3 ? 2'h1 : _btb_47_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_47_bht_T_27 = _btb_47_bht_T_1 ? 2'h1 : _btb_47_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1418 = ~(btb_47_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_879; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1419 = ~(btb_47_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1007; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1420 = ~(btb_47_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_47_bht_T_27 : _GEN_1071; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1422 = btb_47_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1418 : _GEN_879; // @[branch_predictor.scala 89:71]
  wire  _GEN_1423 = btb_47_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1419 : _GEN_1007; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1424 = btb_47_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1420 : _GEN_1071; // @[branch_predictor.scala 89:71]
  wire  _btb_48_bht_T = btb_48_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_48_bht_T_1 = io_i_branch_resolve_pack_taken & btb_48_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_48_bht_T_2 = btb_48_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_48_bht_T_3 = io_i_branch_resolve_pack_taken & btb_48_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_48_bht_T_4 = btb_48_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_48_bht_T_5 = io_i_branch_resolve_pack_taken & btb_48_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_48_bht_T_6 = btb_48_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_48_bht_T_7 = io_i_branch_resolve_pack_taken & btb_48_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_48_bht_T_10 = _T_136 & _btb_48_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_48_bht_T_13 = _T_136 & _btb_48_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_48_bht_T_16 = _T_136 & _btb_48_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_48_bht_T_19 = _T_136 & _btb_48_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_48_bht_T_20 = _btb_48_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_21 = _btb_48_bht_T_16 ? 2'h3 : _btb_48_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_22 = _btb_48_bht_T_13 ? 2'h0 : _btb_48_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_23 = _btb_48_bht_T_10 ? 2'h2 : _btb_48_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_24 = _btb_48_bht_T_7 ? 2'h2 : _btb_48_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_25 = _btb_48_bht_T_5 ? 2'h0 : _btb_48_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_26 = _btb_48_bht_T_3 ? 2'h1 : _btb_48_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_48_bht_T_27 = _btb_48_bht_T_1 ? 2'h1 : _btb_48_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1425 = ~(btb_48_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_880; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1426 = ~(btb_48_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1008; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1427 = ~(btb_48_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_48_bht_T_27 : _GEN_1072; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1429 = btb_48_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1425 : _GEN_880; // @[branch_predictor.scala 89:71]
  wire  _GEN_1430 = btb_48_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1426 : _GEN_1008; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1431 = btb_48_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1427 : _GEN_1072; // @[branch_predictor.scala 89:71]
  wire  _btb_49_bht_T = btb_49_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_49_bht_T_1 = io_i_branch_resolve_pack_taken & btb_49_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_49_bht_T_2 = btb_49_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_49_bht_T_3 = io_i_branch_resolve_pack_taken & btb_49_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_49_bht_T_4 = btb_49_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_49_bht_T_5 = io_i_branch_resolve_pack_taken & btb_49_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_49_bht_T_6 = btb_49_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_49_bht_T_7 = io_i_branch_resolve_pack_taken & btb_49_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_49_bht_T_10 = _T_136 & _btb_49_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_49_bht_T_13 = _T_136 & _btb_49_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_49_bht_T_16 = _T_136 & _btb_49_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_49_bht_T_19 = _T_136 & _btb_49_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_49_bht_T_20 = _btb_49_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_21 = _btb_49_bht_T_16 ? 2'h3 : _btb_49_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_22 = _btb_49_bht_T_13 ? 2'h0 : _btb_49_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_23 = _btb_49_bht_T_10 ? 2'h2 : _btb_49_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_24 = _btb_49_bht_T_7 ? 2'h2 : _btb_49_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_25 = _btb_49_bht_T_5 ? 2'h0 : _btb_49_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_26 = _btb_49_bht_T_3 ? 2'h1 : _btb_49_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_49_bht_T_27 = _btb_49_bht_T_1 ? 2'h1 : _btb_49_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1432 = ~(btb_49_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_881; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1433 = ~(btb_49_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1009; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1434 = ~(btb_49_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_49_bht_T_27 : _GEN_1073; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1436 = btb_49_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1432 : _GEN_881; // @[branch_predictor.scala 89:71]
  wire  _GEN_1437 = btb_49_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1433 : _GEN_1009; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1438 = btb_49_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1434 : _GEN_1073; // @[branch_predictor.scala 89:71]
  wire  _btb_50_bht_T = btb_50_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_50_bht_T_1 = io_i_branch_resolve_pack_taken & btb_50_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_50_bht_T_2 = btb_50_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_50_bht_T_3 = io_i_branch_resolve_pack_taken & btb_50_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_50_bht_T_4 = btb_50_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_50_bht_T_5 = io_i_branch_resolve_pack_taken & btb_50_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_50_bht_T_6 = btb_50_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_50_bht_T_7 = io_i_branch_resolve_pack_taken & btb_50_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_50_bht_T_10 = _T_136 & _btb_50_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_50_bht_T_13 = _T_136 & _btb_50_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_50_bht_T_16 = _T_136 & _btb_50_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_50_bht_T_19 = _T_136 & _btb_50_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_50_bht_T_20 = _btb_50_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_21 = _btb_50_bht_T_16 ? 2'h3 : _btb_50_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_22 = _btb_50_bht_T_13 ? 2'h0 : _btb_50_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_23 = _btb_50_bht_T_10 ? 2'h2 : _btb_50_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_24 = _btb_50_bht_T_7 ? 2'h2 : _btb_50_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_25 = _btb_50_bht_T_5 ? 2'h0 : _btb_50_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_26 = _btb_50_bht_T_3 ? 2'h1 : _btb_50_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_50_bht_T_27 = _btb_50_bht_T_1 ? 2'h1 : _btb_50_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1439 = ~(btb_50_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_882; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1440 = ~(btb_50_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1010; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1441 = ~(btb_50_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_50_bht_T_27 : _GEN_1074; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1443 = btb_50_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1439 : _GEN_882; // @[branch_predictor.scala 89:71]
  wire  _GEN_1444 = btb_50_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1440 : _GEN_1010; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1445 = btb_50_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1441 : _GEN_1074; // @[branch_predictor.scala 89:71]
  wire  _btb_51_bht_T = btb_51_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_51_bht_T_1 = io_i_branch_resolve_pack_taken & btb_51_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_51_bht_T_2 = btb_51_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_51_bht_T_3 = io_i_branch_resolve_pack_taken & btb_51_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_51_bht_T_4 = btb_51_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_51_bht_T_5 = io_i_branch_resolve_pack_taken & btb_51_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_51_bht_T_6 = btb_51_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_51_bht_T_7 = io_i_branch_resolve_pack_taken & btb_51_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_51_bht_T_10 = _T_136 & _btb_51_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_51_bht_T_13 = _T_136 & _btb_51_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_51_bht_T_16 = _T_136 & _btb_51_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_51_bht_T_19 = _T_136 & _btb_51_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_51_bht_T_20 = _btb_51_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_21 = _btb_51_bht_T_16 ? 2'h3 : _btb_51_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_22 = _btb_51_bht_T_13 ? 2'h0 : _btb_51_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_23 = _btb_51_bht_T_10 ? 2'h2 : _btb_51_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_24 = _btb_51_bht_T_7 ? 2'h2 : _btb_51_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_25 = _btb_51_bht_T_5 ? 2'h0 : _btb_51_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_26 = _btb_51_bht_T_3 ? 2'h1 : _btb_51_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_51_bht_T_27 = _btb_51_bht_T_1 ? 2'h1 : _btb_51_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1446 = ~(btb_51_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_883; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1447 = ~(btb_51_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1011; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1448 = ~(btb_51_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_51_bht_T_27 : _GEN_1075; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1450 = btb_51_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1446 : _GEN_883; // @[branch_predictor.scala 89:71]
  wire  _GEN_1451 = btb_51_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1447 : _GEN_1011; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1452 = btb_51_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1448 : _GEN_1075; // @[branch_predictor.scala 89:71]
  wire  _btb_52_bht_T = btb_52_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_52_bht_T_1 = io_i_branch_resolve_pack_taken & btb_52_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_52_bht_T_2 = btb_52_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_52_bht_T_3 = io_i_branch_resolve_pack_taken & btb_52_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_52_bht_T_4 = btb_52_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_52_bht_T_5 = io_i_branch_resolve_pack_taken & btb_52_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_52_bht_T_6 = btb_52_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_52_bht_T_7 = io_i_branch_resolve_pack_taken & btb_52_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_52_bht_T_10 = _T_136 & _btb_52_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_52_bht_T_13 = _T_136 & _btb_52_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_52_bht_T_16 = _T_136 & _btb_52_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_52_bht_T_19 = _T_136 & _btb_52_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_52_bht_T_20 = _btb_52_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_21 = _btb_52_bht_T_16 ? 2'h3 : _btb_52_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_22 = _btb_52_bht_T_13 ? 2'h0 : _btb_52_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_23 = _btb_52_bht_T_10 ? 2'h2 : _btb_52_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_24 = _btb_52_bht_T_7 ? 2'h2 : _btb_52_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_25 = _btb_52_bht_T_5 ? 2'h0 : _btb_52_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_26 = _btb_52_bht_T_3 ? 2'h1 : _btb_52_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_52_bht_T_27 = _btb_52_bht_T_1 ? 2'h1 : _btb_52_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1453 = ~(btb_52_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_884; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1454 = ~(btb_52_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1012; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1455 = ~(btb_52_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_52_bht_T_27 : _GEN_1076; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1457 = btb_52_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1453 : _GEN_884; // @[branch_predictor.scala 89:71]
  wire  _GEN_1458 = btb_52_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1454 : _GEN_1012; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1459 = btb_52_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1455 : _GEN_1076; // @[branch_predictor.scala 89:71]
  wire  _btb_53_bht_T = btb_53_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_53_bht_T_1 = io_i_branch_resolve_pack_taken & btb_53_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_53_bht_T_2 = btb_53_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_53_bht_T_3 = io_i_branch_resolve_pack_taken & btb_53_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_53_bht_T_4 = btb_53_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_53_bht_T_5 = io_i_branch_resolve_pack_taken & btb_53_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_53_bht_T_6 = btb_53_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_53_bht_T_7 = io_i_branch_resolve_pack_taken & btb_53_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_53_bht_T_10 = _T_136 & _btb_53_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_53_bht_T_13 = _T_136 & _btb_53_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_53_bht_T_16 = _T_136 & _btb_53_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_53_bht_T_19 = _T_136 & _btb_53_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_53_bht_T_20 = _btb_53_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_21 = _btb_53_bht_T_16 ? 2'h3 : _btb_53_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_22 = _btb_53_bht_T_13 ? 2'h0 : _btb_53_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_23 = _btb_53_bht_T_10 ? 2'h2 : _btb_53_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_24 = _btb_53_bht_T_7 ? 2'h2 : _btb_53_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_25 = _btb_53_bht_T_5 ? 2'h0 : _btb_53_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_26 = _btb_53_bht_T_3 ? 2'h1 : _btb_53_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_53_bht_T_27 = _btb_53_bht_T_1 ? 2'h1 : _btb_53_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1460 = ~(btb_53_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_885; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1461 = ~(btb_53_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1013; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1462 = ~(btb_53_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_53_bht_T_27 : _GEN_1077; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1464 = btb_53_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1460 : _GEN_885; // @[branch_predictor.scala 89:71]
  wire  _GEN_1465 = btb_53_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1461 : _GEN_1013; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1466 = btb_53_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1462 : _GEN_1077; // @[branch_predictor.scala 89:71]
  wire  _btb_54_bht_T = btb_54_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_54_bht_T_1 = io_i_branch_resolve_pack_taken & btb_54_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_54_bht_T_2 = btb_54_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_54_bht_T_3 = io_i_branch_resolve_pack_taken & btb_54_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_54_bht_T_4 = btb_54_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_54_bht_T_5 = io_i_branch_resolve_pack_taken & btb_54_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_54_bht_T_6 = btb_54_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_54_bht_T_7 = io_i_branch_resolve_pack_taken & btb_54_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_54_bht_T_10 = _T_136 & _btb_54_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_54_bht_T_13 = _T_136 & _btb_54_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_54_bht_T_16 = _T_136 & _btb_54_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_54_bht_T_19 = _T_136 & _btb_54_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_54_bht_T_20 = _btb_54_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_21 = _btb_54_bht_T_16 ? 2'h3 : _btb_54_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_22 = _btb_54_bht_T_13 ? 2'h0 : _btb_54_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_23 = _btb_54_bht_T_10 ? 2'h2 : _btb_54_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_24 = _btb_54_bht_T_7 ? 2'h2 : _btb_54_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_25 = _btb_54_bht_T_5 ? 2'h0 : _btb_54_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_26 = _btb_54_bht_T_3 ? 2'h1 : _btb_54_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_54_bht_T_27 = _btb_54_bht_T_1 ? 2'h1 : _btb_54_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1467 = ~(btb_54_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_886; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1468 = ~(btb_54_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1014; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1469 = ~(btb_54_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_54_bht_T_27 : _GEN_1078; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1471 = btb_54_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1467 : _GEN_886; // @[branch_predictor.scala 89:71]
  wire  _GEN_1472 = btb_54_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1468 : _GEN_1014; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1473 = btb_54_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1469 : _GEN_1078; // @[branch_predictor.scala 89:71]
  wire  _btb_55_bht_T = btb_55_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_55_bht_T_1 = io_i_branch_resolve_pack_taken & btb_55_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_55_bht_T_2 = btb_55_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_55_bht_T_3 = io_i_branch_resolve_pack_taken & btb_55_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_55_bht_T_4 = btb_55_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_55_bht_T_5 = io_i_branch_resolve_pack_taken & btb_55_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_55_bht_T_6 = btb_55_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_55_bht_T_7 = io_i_branch_resolve_pack_taken & btb_55_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_55_bht_T_10 = _T_136 & _btb_55_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_55_bht_T_13 = _T_136 & _btb_55_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_55_bht_T_16 = _T_136 & _btb_55_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_55_bht_T_19 = _T_136 & _btb_55_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_55_bht_T_20 = _btb_55_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_21 = _btb_55_bht_T_16 ? 2'h3 : _btb_55_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_22 = _btb_55_bht_T_13 ? 2'h0 : _btb_55_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_23 = _btb_55_bht_T_10 ? 2'h2 : _btb_55_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_24 = _btb_55_bht_T_7 ? 2'h2 : _btb_55_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_25 = _btb_55_bht_T_5 ? 2'h0 : _btb_55_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_26 = _btb_55_bht_T_3 ? 2'h1 : _btb_55_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_55_bht_T_27 = _btb_55_bht_T_1 ? 2'h1 : _btb_55_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1474 = ~(btb_55_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_887; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1475 = ~(btb_55_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1015; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1476 = ~(btb_55_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_55_bht_T_27 : _GEN_1079; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1478 = btb_55_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1474 : _GEN_887; // @[branch_predictor.scala 89:71]
  wire  _GEN_1479 = btb_55_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1475 : _GEN_1015; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1480 = btb_55_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1476 : _GEN_1079; // @[branch_predictor.scala 89:71]
  wire  _btb_56_bht_T = btb_56_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_56_bht_T_1 = io_i_branch_resolve_pack_taken & btb_56_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_56_bht_T_2 = btb_56_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_56_bht_T_3 = io_i_branch_resolve_pack_taken & btb_56_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_56_bht_T_4 = btb_56_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_56_bht_T_5 = io_i_branch_resolve_pack_taken & btb_56_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_56_bht_T_6 = btb_56_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_56_bht_T_7 = io_i_branch_resolve_pack_taken & btb_56_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_56_bht_T_10 = _T_136 & _btb_56_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_56_bht_T_13 = _T_136 & _btb_56_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_56_bht_T_16 = _T_136 & _btb_56_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_56_bht_T_19 = _T_136 & _btb_56_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_56_bht_T_20 = _btb_56_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_21 = _btb_56_bht_T_16 ? 2'h3 : _btb_56_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_22 = _btb_56_bht_T_13 ? 2'h0 : _btb_56_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_23 = _btb_56_bht_T_10 ? 2'h2 : _btb_56_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_24 = _btb_56_bht_T_7 ? 2'h2 : _btb_56_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_25 = _btb_56_bht_T_5 ? 2'h0 : _btb_56_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_26 = _btb_56_bht_T_3 ? 2'h1 : _btb_56_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_56_bht_T_27 = _btb_56_bht_T_1 ? 2'h1 : _btb_56_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1481 = ~(btb_56_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_888; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1482 = ~(btb_56_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1016; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1483 = ~(btb_56_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_56_bht_T_27 : _GEN_1080; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1485 = btb_56_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1481 : _GEN_888; // @[branch_predictor.scala 89:71]
  wire  _GEN_1486 = btb_56_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1482 : _GEN_1016; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1487 = btb_56_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1483 : _GEN_1080; // @[branch_predictor.scala 89:71]
  wire  _btb_57_bht_T = btb_57_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_57_bht_T_1 = io_i_branch_resolve_pack_taken & btb_57_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_57_bht_T_2 = btb_57_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_57_bht_T_3 = io_i_branch_resolve_pack_taken & btb_57_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_57_bht_T_4 = btb_57_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_57_bht_T_5 = io_i_branch_resolve_pack_taken & btb_57_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_57_bht_T_6 = btb_57_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_57_bht_T_7 = io_i_branch_resolve_pack_taken & btb_57_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_57_bht_T_10 = _T_136 & _btb_57_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_57_bht_T_13 = _T_136 & _btb_57_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_57_bht_T_16 = _T_136 & _btb_57_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_57_bht_T_19 = _T_136 & _btb_57_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_57_bht_T_20 = _btb_57_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_21 = _btb_57_bht_T_16 ? 2'h3 : _btb_57_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_22 = _btb_57_bht_T_13 ? 2'h0 : _btb_57_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_23 = _btb_57_bht_T_10 ? 2'h2 : _btb_57_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_24 = _btb_57_bht_T_7 ? 2'h2 : _btb_57_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_25 = _btb_57_bht_T_5 ? 2'h0 : _btb_57_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_26 = _btb_57_bht_T_3 ? 2'h1 : _btb_57_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_57_bht_T_27 = _btb_57_bht_T_1 ? 2'h1 : _btb_57_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1488 = ~(btb_57_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_889; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1489 = ~(btb_57_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1017; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1490 = ~(btb_57_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_57_bht_T_27 : _GEN_1081; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1492 = btb_57_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1488 : _GEN_889; // @[branch_predictor.scala 89:71]
  wire  _GEN_1493 = btb_57_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1489 : _GEN_1017; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1494 = btb_57_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1490 : _GEN_1081; // @[branch_predictor.scala 89:71]
  wire  _btb_58_bht_T = btb_58_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_58_bht_T_1 = io_i_branch_resolve_pack_taken & btb_58_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_58_bht_T_2 = btb_58_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_58_bht_T_3 = io_i_branch_resolve_pack_taken & btb_58_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_58_bht_T_4 = btb_58_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_58_bht_T_5 = io_i_branch_resolve_pack_taken & btb_58_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_58_bht_T_6 = btb_58_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_58_bht_T_7 = io_i_branch_resolve_pack_taken & btb_58_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_58_bht_T_10 = _T_136 & _btb_58_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_58_bht_T_13 = _T_136 & _btb_58_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_58_bht_T_16 = _T_136 & _btb_58_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_58_bht_T_19 = _T_136 & _btb_58_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_58_bht_T_20 = _btb_58_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_21 = _btb_58_bht_T_16 ? 2'h3 : _btb_58_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_22 = _btb_58_bht_T_13 ? 2'h0 : _btb_58_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_23 = _btb_58_bht_T_10 ? 2'h2 : _btb_58_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_24 = _btb_58_bht_T_7 ? 2'h2 : _btb_58_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_25 = _btb_58_bht_T_5 ? 2'h0 : _btb_58_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_26 = _btb_58_bht_T_3 ? 2'h1 : _btb_58_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_58_bht_T_27 = _btb_58_bht_T_1 ? 2'h1 : _btb_58_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1495 = ~(btb_58_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_890; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1496 = ~(btb_58_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1018; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1497 = ~(btb_58_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_58_bht_T_27 : _GEN_1082; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1499 = btb_58_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1495 : _GEN_890; // @[branch_predictor.scala 89:71]
  wire  _GEN_1500 = btb_58_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1496 : _GEN_1018; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1501 = btb_58_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1497 : _GEN_1082; // @[branch_predictor.scala 89:71]
  wire  _btb_59_bht_T = btb_59_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_59_bht_T_1 = io_i_branch_resolve_pack_taken & btb_59_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_59_bht_T_2 = btb_59_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_59_bht_T_3 = io_i_branch_resolve_pack_taken & btb_59_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_59_bht_T_4 = btb_59_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_59_bht_T_5 = io_i_branch_resolve_pack_taken & btb_59_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_59_bht_T_6 = btb_59_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_59_bht_T_7 = io_i_branch_resolve_pack_taken & btb_59_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_59_bht_T_10 = _T_136 & _btb_59_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_59_bht_T_13 = _T_136 & _btb_59_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_59_bht_T_16 = _T_136 & _btb_59_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_59_bht_T_19 = _T_136 & _btb_59_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_59_bht_T_20 = _btb_59_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_21 = _btb_59_bht_T_16 ? 2'h3 : _btb_59_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_22 = _btb_59_bht_T_13 ? 2'h0 : _btb_59_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_23 = _btb_59_bht_T_10 ? 2'h2 : _btb_59_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_24 = _btb_59_bht_T_7 ? 2'h2 : _btb_59_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_25 = _btb_59_bht_T_5 ? 2'h0 : _btb_59_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_26 = _btb_59_bht_T_3 ? 2'h1 : _btb_59_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_59_bht_T_27 = _btb_59_bht_T_1 ? 2'h1 : _btb_59_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1502 = ~(btb_59_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_891; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1503 = ~(btb_59_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1019; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1504 = ~(btb_59_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_59_bht_T_27 : _GEN_1083; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_1505 = btb_59_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_58_tag == io_i_branch_resolve_pack_pc[12:3]
     | (btb_57_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_56_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_55_tag
     == io_i_branch_resolve_pack_pc[12:3] | (btb_54_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_53_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_52_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_51_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_50_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_49_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_48_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_47_tag ==
    io_i_branch_resolve_pack_pc[12:3] | (btb_46_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_45_tag ==
    io_i_branch_resolve_pack_pc[12:3] | _GEN_1400)))))))))))))); // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_1506 = btb_59_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1502 : _GEN_891; // @[branch_predictor.scala 89:71]
  wire  _GEN_1507 = btb_59_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1503 : _GEN_1019; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1508 = btb_59_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1504 : _GEN_1083; // @[branch_predictor.scala 89:71]
  wire  _btb_60_bht_T = btb_60_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_60_bht_T_1 = io_i_branch_resolve_pack_taken & btb_60_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_60_bht_T_2 = btb_60_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_60_bht_T_3 = io_i_branch_resolve_pack_taken & btb_60_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_60_bht_T_4 = btb_60_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_60_bht_T_5 = io_i_branch_resolve_pack_taken & btb_60_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_60_bht_T_6 = btb_60_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_60_bht_T_7 = io_i_branch_resolve_pack_taken & btb_60_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_60_bht_T_10 = _T_136 & _btb_60_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_60_bht_T_13 = _T_136 & _btb_60_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_60_bht_T_16 = _T_136 & _btb_60_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_60_bht_T_19 = _T_136 & _btb_60_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_60_bht_T_20 = _btb_60_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_21 = _btb_60_bht_T_16 ? 2'h3 : _btb_60_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_22 = _btb_60_bht_T_13 ? 2'h0 : _btb_60_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_23 = _btb_60_bht_T_10 ? 2'h2 : _btb_60_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_24 = _btb_60_bht_T_7 ? 2'h2 : _btb_60_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_25 = _btb_60_bht_T_5 ? 2'h0 : _btb_60_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_26 = _btb_60_bht_T_3 ? 2'h1 : _btb_60_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_60_bht_T_27 = _btb_60_bht_T_1 ? 2'h1 : _btb_60_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1509 = ~(btb_60_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_892; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1510 = ~(btb_60_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1020; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1511 = ~(btb_60_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_60_bht_T_27 : _GEN_1084; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1513 = btb_60_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1509 : _GEN_892; // @[branch_predictor.scala 89:71]
  wire  _GEN_1514 = btb_60_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1510 : _GEN_1020; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1515 = btb_60_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1511 : _GEN_1084; // @[branch_predictor.scala 89:71]
  wire  _btb_61_bht_T = btb_61_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_61_bht_T_1 = io_i_branch_resolve_pack_taken & btb_61_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_61_bht_T_2 = btb_61_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_61_bht_T_3 = io_i_branch_resolve_pack_taken & btb_61_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_61_bht_T_4 = btb_61_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_61_bht_T_5 = io_i_branch_resolve_pack_taken & btb_61_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_61_bht_T_6 = btb_61_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_61_bht_T_7 = io_i_branch_resolve_pack_taken & btb_61_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_61_bht_T_10 = _T_136 & _btb_61_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_61_bht_T_13 = _T_136 & _btb_61_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_61_bht_T_16 = _T_136 & _btb_61_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_61_bht_T_19 = _T_136 & _btb_61_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_61_bht_T_20 = _btb_61_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_21 = _btb_61_bht_T_16 ? 2'h3 : _btb_61_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_22 = _btb_61_bht_T_13 ? 2'h0 : _btb_61_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_23 = _btb_61_bht_T_10 ? 2'h2 : _btb_61_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_24 = _btb_61_bht_T_7 ? 2'h2 : _btb_61_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_25 = _btb_61_bht_T_5 ? 2'h0 : _btb_61_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_26 = _btb_61_bht_T_3 ? 2'h1 : _btb_61_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_61_bht_T_27 = _btb_61_bht_T_1 ? 2'h1 : _btb_61_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1516 = ~(btb_61_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_893; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1517 = ~(btb_61_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1021; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1518 = ~(btb_61_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_61_bht_T_27 : _GEN_1085; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1520 = btb_61_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1516 : _GEN_893; // @[branch_predictor.scala 89:71]
  wire  _GEN_1521 = btb_61_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1517 : _GEN_1021; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1522 = btb_61_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1518 : _GEN_1085; // @[branch_predictor.scala 89:71]
  wire  _btb_62_bht_T = btb_62_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_62_bht_T_1 = io_i_branch_resolve_pack_taken & btb_62_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_62_bht_T_2 = btb_62_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_62_bht_T_3 = io_i_branch_resolve_pack_taken & btb_62_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_62_bht_T_4 = btb_62_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_62_bht_T_5 = io_i_branch_resolve_pack_taken & btb_62_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_62_bht_T_6 = btb_62_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_62_bht_T_7 = io_i_branch_resolve_pack_taken & btb_62_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_62_bht_T_10 = _T_136 & _btb_62_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_62_bht_T_13 = _T_136 & _btb_62_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_62_bht_T_16 = _T_136 & _btb_62_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_62_bht_T_19 = _T_136 & _btb_62_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_62_bht_T_20 = _btb_62_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_21 = _btb_62_bht_T_16 ? 2'h3 : _btb_62_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_22 = _btb_62_bht_T_13 ? 2'h0 : _btb_62_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_23 = _btb_62_bht_T_10 ? 2'h2 : _btb_62_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_24 = _btb_62_bht_T_7 ? 2'h2 : _btb_62_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_25 = _btb_62_bht_T_5 ? 2'h0 : _btb_62_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_26 = _btb_62_bht_T_3 ? 2'h1 : _btb_62_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_62_bht_T_27 = _btb_62_bht_T_1 ? 2'h1 : _btb_62_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1523 = ~(btb_62_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_894; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1524 = ~(btb_62_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1022; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1525 = ~(btb_62_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_62_bht_T_27 : _GEN_1086; // @[branch_predictor.scala 91:111 94:36]
  wire [63:0] _GEN_1527 = btb_62_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1523 : _GEN_894; // @[branch_predictor.scala 89:71]
  wire  _GEN_1528 = btb_62_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1524 : _GEN_1022; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1529 = btb_62_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1525 : _GEN_1086; // @[branch_predictor.scala 89:71]
  wire  _btb_63_bht_T = btb_63_bht == 2'h0; // @[branch_predictor.scala 95:71]
  wire  _btb_63_bht_T_1 = io_i_branch_resolve_pack_taken & btb_63_bht == 2'h0; // @[branch_predictor.scala 95:57]
  wire  _btb_63_bht_T_2 = btb_63_bht == 2'h1; // @[branch_predictor.scala 96:71]
  wire  _btb_63_bht_T_3 = io_i_branch_resolve_pack_taken & btb_63_bht == 2'h1; // @[branch_predictor.scala 96:57]
  wire  _btb_63_bht_T_4 = btb_63_bht == 2'h2; // @[branch_predictor.scala 97:71]
  wire  _btb_63_bht_T_5 = io_i_branch_resolve_pack_taken & btb_63_bht == 2'h2; // @[branch_predictor.scala 97:57]
  wire  _btb_63_bht_T_6 = btb_63_bht == 2'h3; // @[branch_predictor.scala 98:71]
  wire  _btb_63_bht_T_7 = io_i_branch_resolve_pack_taken & btb_63_bht == 2'h3; // @[branch_predictor.scala 98:57]
  wire  _btb_63_bht_T_10 = _T_136 & _btb_63_bht_T; // @[branch_predictor.scala 100:58]
  wire  _btb_63_bht_T_13 = _T_136 & _btb_63_bht_T_2; // @[branch_predictor.scala 101:58]
  wire  _btb_63_bht_T_16 = _T_136 & _btb_63_bht_T_4; // @[branch_predictor.scala 102:58]
  wire  _btb_63_bht_T_19 = _T_136 & _btb_63_bht_T_6; // @[branch_predictor.scala 103:58]
  wire [1:0] _btb_63_bht_T_20 = _btb_63_bht_T_19 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_21 = _btb_63_bht_T_16 ? 2'h3 : _btb_63_bht_T_20; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_22 = _btb_63_bht_T_13 ? 2'h0 : _btb_63_bht_T_21; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_23 = _btb_63_bht_T_10 ? 2'h2 : _btb_63_bht_T_22; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_24 = _btb_63_bht_T_7 ? 2'h2 : _btb_63_bht_T_23; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_25 = _btb_63_bht_T_5 ? 2'h0 : _btb_63_bht_T_24; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_26 = _btb_63_bht_T_3 ? 2'h1 : _btb_63_bht_T_25; // @[Mux.scala 101:16]
  wire [1:0] _btb_63_bht_T_27 = _btb_63_bht_T_1 ? 2'h1 : _btb_63_bht_T_26; // @[Mux.scala 101:16]
  wire [63:0] _GEN_1530 = ~(btb_63_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_target : _GEN_895; // @[branch_predictor.scala 91:111 92:47]
  wire  _GEN_1531 = ~(btb_63_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    io_i_branch_resolve_pack_pc[2] : _GEN_1023; // @[branch_predictor.scala 91:111 93:39]
  wire [1:0] _GEN_1532 = ~(btb_63_select != io_i_branch_resolve_pack_pc[2] & ~io_i_branch_resolve_pack_taken) ?
    _btb_63_bht_T_27 : _GEN_1087; // @[branch_predictor.scala 91:111 94:36]
  wire  _GEN_1533 = btb_63_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_62_tag == io_i_branch_resolve_pack_pc[12:3]
     | (btb_61_tag == io_i_branch_resolve_pack_pc[12:3] | (btb_60_tag == io_i_branch_resolve_pack_pc[12:3] | _GEN_1505))
    ); // @[branch_predictor.scala 89:71 90:33]
  wire [63:0] _GEN_1534 = btb_63_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1530 : _GEN_895; // @[branch_predictor.scala 89:71]
  wire  _GEN_1535 = btb_63_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1531 : _GEN_1023; // @[branch_predictor.scala 89:71]
  wire [1:0] _GEN_1536 = btb_63_tag == io_i_branch_resolve_pack_pc[12:3] ? _GEN_1532 : _GEN_1087; // @[branch_predictor.scala 89:71]
  wire  entry_found = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid & _GEN_1533; // @[branch_predictor.scala 86:17 87:87]
  wire [63:0] _GEN_1538 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1093 :
    _GEN_832; // @[branch_predictor.scala 87:87]
  wire  _GEN_1539 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1094 : _GEN_960; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1540 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1095 :
    _GEN_1024; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1541 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1100 :
    _GEN_833; // @[branch_predictor.scala 87:87]
  wire  _GEN_1542 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1101 : _GEN_961; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1543 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1102 :
    _GEN_1025; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1544 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1107 :
    _GEN_834; // @[branch_predictor.scala 87:87]
  wire  _GEN_1545 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1108 : _GEN_962; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1546 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1109 :
    _GEN_1026; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1547 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1114 :
    _GEN_835; // @[branch_predictor.scala 87:87]
  wire  _GEN_1548 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1115 : _GEN_963; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1549 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1116 :
    _GEN_1027; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1550 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1121 :
    _GEN_836; // @[branch_predictor.scala 87:87]
  wire  _GEN_1551 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1122 : _GEN_964; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1552 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1123 :
    _GEN_1028; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1553 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1128 :
    _GEN_837; // @[branch_predictor.scala 87:87]
  wire  _GEN_1554 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1129 : _GEN_965; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1555 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1130 :
    _GEN_1029; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1556 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1135 :
    _GEN_838; // @[branch_predictor.scala 87:87]
  wire  _GEN_1557 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1136 : _GEN_966; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1558 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1137 :
    _GEN_1030; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1559 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1142 :
    _GEN_839; // @[branch_predictor.scala 87:87]
  wire  _GEN_1560 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1143 : _GEN_967; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1561 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1144 :
    _GEN_1031; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1562 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1149 :
    _GEN_840; // @[branch_predictor.scala 87:87]
  wire  _GEN_1563 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1150 : _GEN_968; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1564 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1151 :
    _GEN_1032; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1565 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1156 :
    _GEN_841; // @[branch_predictor.scala 87:87]
  wire  _GEN_1566 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1157 : _GEN_969; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1567 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1158 :
    _GEN_1033; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1568 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1163 :
    _GEN_842; // @[branch_predictor.scala 87:87]
  wire  _GEN_1569 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1164 : _GEN_970; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1570 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1165 :
    _GEN_1034; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1571 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1170 :
    _GEN_843; // @[branch_predictor.scala 87:87]
  wire  _GEN_1572 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1171 : _GEN_971; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1573 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1172 :
    _GEN_1035; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1574 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1177 :
    _GEN_844; // @[branch_predictor.scala 87:87]
  wire  _GEN_1575 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1178 : _GEN_972; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1576 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1179 :
    _GEN_1036; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1577 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1184 :
    _GEN_845; // @[branch_predictor.scala 87:87]
  wire  _GEN_1578 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1185 : _GEN_973; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1579 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1186 :
    _GEN_1037; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1580 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1191 :
    _GEN_846; // @[branch_predictor.scala 87:87]
  wire  _GEN_1581 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1192 : _GEN_974; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1582 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1193 :
    _GEN_1038; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1583 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1198 :
    _GEN_847; // @[branch_predictor.scala 87:87]
  wire  _GEN_1584 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1199 : _GEN_975; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1585 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1200 :
    _GEN_1039; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1586 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1205 :
    _GEN_848; // @[branch_predictor.scala 87:87]
  wire  _GEN_1587 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1206 : _GEN_976; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1588 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1207 :
    _GEN_1040; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1589 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1212 :
    _GEN_849; // @[branch_predictor.scala 87:87]
  wire  _GEN_1590 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1213 : _GEN_977; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1591 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1214 :
    _GEN_1041; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1592 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1219 :
    _GEN_850; // @[branch_predictor.scala 87:87]
  wire  _GEN_1593 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1220 : _GEN_978; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1594 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1221 :
    _GEN_1042; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1595 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1226 :
    _GEN_851; // @[branch_predictor.scala 87:87]
  wire  _GEN_1596 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1227 : _GEN_979; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1597 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1228 :
    _GEN_1043; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1598 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1233 :
    _GEN_852; // @[branch_predictor.scala 87:87]
  wire  _GEN_1599 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1234 : _GEN_980; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1600 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1235 :
    _GEN_1044; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1601 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1240 :
    _GEN_853; // @[branch_predictor.scala 87:87]
  wire  _GEN_1602 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1241 : _GEN_981; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1603 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1242 :
    _GEN_1045; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1604 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1247 :
    _GEN_854; // @[branch_predictor.scala 87:87]
  wire  _GEN_1605 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1248 : _GEN_982; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1606 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1249 :
    _GEN_1046; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1607 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1254 :
    _GEN_855; // @[branch_predictor.scala 87:87]
  wire  _GEN_1608 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1255 : _GEN_983; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1609 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1256 :
    _GEN_1047; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1610 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1261 :
    _GEN_856; // @[branch_predictor.scala 87:87]
  wire  _GEN_1611 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1262 : _GEN_984; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1612 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1263 :
    _GEN_1048; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1613 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1268 :
    _GEN_857; // @[branch_predictor.scala 87:87]
  wire  _GEN_1614 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1269 : _GEN_985; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1615 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1270 :
    _GEN_1049; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1616 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1275 :
    _GEN_858; // @[branch_predictor.scala 87:87]
  wire  _GEN_1617 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1276 : _GEN_986; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1618 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1277 :
    _GEN_1050; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1619 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1282 :
    _GEN_859; // @[branch_predictor.scala 87:87]
  wire  _GEN_1620 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1283 : _GEN_987; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1621 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1284 :
    _GEN_1051; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1622 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1289 :
    _GEN_860; // @[branch_predictor.scala 87:87]
  wire  _GEN_1623 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1290 : _GEN_988; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1624 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1291 :
    _GEN_1052; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1625 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1296 :
    _GEN_861; // @[branch_predictor.scala 87:87]
  wire  _GEN_1626 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1297 : _GEN_989; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1627 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1298 :
    _GEN_1053; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1628 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1303 :
    _GEN_862; // @[branch_predictor.scala 87:87]
  wire  _GEN_1629 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1304 : _GEN_990; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1630 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1305 :
    _GEN_1054; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1631 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1310 :
    _GEN_863; // @[branch_predictor.scala 87:87]
  wire  _GEN_1632 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1311 : _GEN_991; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1633 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1312 :
    _GEN_1055; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1634 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1317 :
    _GEN_864; // @[branch_predictor.scala 87:87]
  wire  _GEN_1635 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1318 : _GEN_992; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1636 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1319 :
    _GEN_1056; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1637 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1324 :
    _GEN_865; // @[branch_predictor.scala 87:87]
  wire  _GEN_1638 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1325 : _GEN_993; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1639 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1326 :
    _GEN_1057; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1640 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1331 :
    _GEN_866; // @[branch_predictor.scala 87:87]
  wire  _GEN_1641 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1332 : _GEN_994; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1642 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1333 :
    _GEN_1058; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1643 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1338 :
    _GEN_867; // @[branch_predictor.scala 87:87]
  wire  _GEN_1644 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1339 : _GEN_995; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1645 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1340 :
    _GEN_1059; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1646 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1345 :
    _GEN_868; // @[branch_predictor.scala 87:87]
  wire  _GEN_1647 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1346 : _GEN_996; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1648 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1347 :
    _GEN_1060; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1649 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1352 :
    _GEN_869; // @[branch_predictor.scala 87:87]
  wire  _GEN_1650 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1353 : _GEN_997; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1651 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1354 :
    _GEN_1061; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1652 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1359 :
    _GEN_870; // @[branch_predictor.scala 87:87]
  wire  _GEN_1653 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1360 : _GEN_998; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1654 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1361 :
    _GEN_1062; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1655 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1366 :
    _GEN_871; // @[branch_predictor.scala 87:87]
  wire  _GEN_1656 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1367 : _GEN_999; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1657 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1368 :
    _GEN_1063; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1658 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1373 :
    _GEN_872; // @[branch_predictor.scala 87:87]
  wire  _GEN_1659 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1374 : _GEN_1000; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1660 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1375 :
    _GEN_1064; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1661 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1380 :
    _GEN_873; // @[branch_predictor.scala 87:87]
  wire  _GEN_1662 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1381 : _GEN_1001; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1663 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1382 :
    _GEN_1065; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1664 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1387 :
    _GEN_874; // @[branch_predictor.scala 87:87]
  wire  _GEN_1665 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1388 : _GEN_1002; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1666 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1389 :
    _GEN_1066; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1667 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1394 :
    _GEN_875; // @[branch_predictor.scala 87:87]
  wire  _GEN_1668 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1395 : _GEN_1003; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1669 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1396 :
    _GEN_1067; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1670 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1401 :
    _GEN_876; // @[branch_predictor.scala 87:87]
  wire  _GEN_1671 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1402 : _GEN_1004; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1672 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1403 :
    _GEN_1068; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1673 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1408 :
    _GEN_877; // @[branch_predictor.scala 87:87]
  wire  _GEN_1674 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1409 : _GEN_1005; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1675 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1410 :
    _GEN_1069; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1676 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1415 :
    _GEN_878; // @[branch_predictor.scala 87:87]
  wire  _GEN_1677 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1416 : _GEN_1006; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1678 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1417 :
    _GEN_1070; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1679 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1422 :
    _GEN_879; // @[branch_predictor.scala 87:87]
  wire  _GEN_1680 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1423 : _GEN_1007; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1681 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1424 :
    _GEN_1071; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1682 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1429 :
    _GEN_880; // @[branch_predictor.scala 87:87]
  wire  _GEN_1683 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1430 : _GEN_1008; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1684 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1431 :
    _GEN_1072; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1685 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1436 :
    _GEN_881; // @[branch_predictor.scala 87:87]
  wire  _GEN_1686 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1437 : _GEN_1009; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1687 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1438 :
    _GEN_1073; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1688 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1443 :
    _GEN_882; // @[branch_predictor.scala 87:87]
  wire  _GEN_1689 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1444 : _GEN_1010; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1690 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1445 :
    _GEN_1074; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1691 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1450 :
    _GEN_883; // @[branch_predictor.scala 87:87]
  wire  _GEN_1692 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1451 : _GEN_1011; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1693 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1452 :
    _GEN_1075; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1694 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1457 :
    _GEN_884; // @[branch_predictor.scala 87:87]
  wire  _GEN_1695 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1458 : _GEN_1012; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1696 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1459 :
    _GEN_1076; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1697 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1464 :
    _GEN_885; // @[branch_predictor.scala 87:87]
  wire  _GEN_1698 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1465 : _GEN_1013; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1699 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1466 :
    _GEN_1077; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1700 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1471 :
    _GEN_886; // @[branch_predictor.scala 87:87]
  wire  _GEN_1701 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1472 : _GEN_1014; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1702 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1473 :
    _GEN_1078; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1703 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1478 :
    _GEN_887; // @[branch_predictor.scala 87:87]
  wire  _GEN_1704 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1479 : _GEN_1015; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1705 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1480 :
    _GEN_1079; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1706 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1485 :
    _GEN_888; // @[branch_predictor.scala 87:87]
  wire  _GEN_1707 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1486 : _GEN_1016; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1708 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1487 :
    _GEN_1080; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1709 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1492 :
    _GEN_889; // @[branch_predictor.scala 87:87]
  wire  _GEN_1710 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1493 : _GEN_1017; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1711 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1494 :
    _GEN_1081; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1712 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1499 :
    _GEN_890; // @[branch_predictor.scala 87:87]
  wire  _GEN_1713 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1500 : _GEN_1018; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1714 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1501 :
    _GEN_1082; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1715 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1506 :
    _GEN_891; // @[branch_predictor.scala 87:87]
  wire  _GEN_1716 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1507 : _GEN_1019; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1717 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1508 :
    _GEN_1083; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1718 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1513 :
    _GEN_892; // @[branch_predictor.scala 87:87]
  wire  _GEN_1719 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1514 : _GEN_1020; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1720 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1515 :
    _GEN_1084; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1721 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1520 :
    _GEN_893; // @[branch_predictor.scala 87:87]
  wire  _GEN_1722 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1521 : _GEN_1021; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1723 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1522 :
    _GEN_1085; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1724 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1527 :
    _GEN_894; // @[branch_predictor.scala 87:87]
  wire  _GEN_1725 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1528 : _GEN_1022; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1726 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1529 :
    _GEN_1086; // @[branch_predictor.scala 87:87]
  wire [63:0] _GEN_1727 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1534 :
    _GEN_895; // @[branch_predictor.scala 87:87]
  wire  _GEN_1728 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1535 : _GEN_1023; // @[branch_predictor.scala 87:87]
  wire [1:0] _GEN_1729 = io_i_branch_resolve_pack_valid & io_i_branch_resolve_pack_prediction_valid ? _GEN_1536 :
    _GEN_1087; // @[branch_predictor.scala 87:87]
  wire  _GEN_1730 = _GEN_2627 | _GEN_704; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1731 = _GEN_2628 | _GEN_705; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1732 = _GEN_2629 | _GEN_706; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1733 = _GEN_2630 | _GEN_707; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1734 = _GEN_2631 | _GEN_708; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1735 = _GEN_2632 | _GEN_709; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1736 = _GEN_2633 | _GEN_710; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1737 = _GEN_2634 | _GEN_711; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1738 = _GEN_2635 | _GEN_712; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1739 = _GEN_2636 | _GEN_713; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1740 = _GEN_2637 | _GEN_714; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1741 = _GEN_2638 | _GEN_715; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1742 = _GEN_2639 | _GEN_716; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1743 = _GEN_2640 | _GEN_717; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1744 = _GEN_2641 | _GEN_718; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1745 = _GEN_2642 | _GEN_719; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1746 = _GEN_2643 | _GEN_720; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1747 = _GEN_2644 | _GEN_721; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1748 = _GEN_2645 | _GEN_722; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1749 = _GEN_2646 | _GEN_723; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1750 = _GEN_2647 | _GEN_724; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1751 = _GEN_2648 | _GEN_725; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1752 = _GEN_2649 | _GEN_726; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1753 = _GEN_2650 | _GEN_727; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1754 = _GEN_2651 | _GEN_728; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1755 = _GEN_2652 | _GEN_729; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1756 = _GEN_2653 | _GEN_730; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1757 = _GEN_2654 | _GEN_731; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1758 = _GEN_2655 | _GEN_732; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1759 = _GEN_2656 | _GEN_733; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1760 = _GEN_2657 | _GEN_734; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1761 = _GEN_2658 | _GEN_735; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1762 = _GEN_2659 | _GEN_736; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1763 = _GEN_2660 | _GEN_737; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1764 = _GEN_2661 | _GEN_738; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1765 = _GEN_2662 | _GEN_739; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1766 = _GEN_2663 | _GEN_740; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1767 = _GEN_2664 | _GEN_741; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1768 = _GEN_2665 | _GEN_742; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1769 = _GEN_2666 | _GEN_743; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1770 = _GEN_2667 | _GEN_744; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1771 = _GEN_2668 | _GEN_745; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1772 = _GEN_2669 | _GEN_746; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1773 = _GEN_2670 | _GEN_747; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1774 = _GEN_2671 | _GEN_748; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1775 = _GEN_2672 | _GEN_749; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1776 = _GEN_2673 | _GEN_750; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1777 = _GEN_2674 | _GEN_751; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1778 = _GEN_2675 | _GEN_752; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1779 = _GEN_2676 | _GEN_753; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1780 = _GEN_2677 | _GEN_754; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1781 = _GEN_2678 | _GEN_755; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1782 = _GEN_2679 | _GEN_756; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1783 = _GEN_2680 | _GEN_757; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1784 = _GEN_2681 | _GEN_758; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1785 = _GEN_2682 | _GEN_759; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1786 = _GEN_2683 | _GEN_760; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1787 = _GEN_2684 | _GEN_761; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1788 = _GEN_2685 | _GEN_762; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1789 = _GEN_2686 | _GEN_763; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1790 = _GEN_2687 | _GEN_764; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1791 = _GEN_2688 | _GEN_765; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1792 = _GEN_2689 | _GEN_766; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_1793 = _GEN_2690 | _GEN_767; // @[branch_predictor.scala 111:{35,35}]
  wire  _GEN_2114 = _T_131 & ~entry_found ? _GEN_1730 : _GEN_704; // @[branch_predictor.scala 110:103]
  wire  _GEN_2115 = _T_131 & ~entry_found ? _GEN_1731 : _GEN_705; // @[branch_predictor.scala 110:103]
  wire  _GEN_2116 = _T_131 & ~entry_found ? _GEN_1732 : _GEN_706; // @[branch_predictor.scala 110:103]
  wire  _GEN_2117 = _T_131 & ~entry_found ? _GEN_1733 : _GEN_707; // @[branch_predictor.scala 110:103]
  wire  _GEN_2118 = _T_131 & ~entry_found ? _GEN_1734 : _GEN_708; // @[branch_predictor.scala 110:103]
  wire  _GEN_2119 = _T_131 & ~entry_found ? _GEN_1735 : _GEN_709; // @[branch_predictor.scala 110:103]
  wire  _GEN_2120 = _T_131 & ~entry_found ? _GEN_1736 : _GEN_710; // @[branch_predictor.scala 110:103]
  wire  _GEN_2121 = _T_131 & ~entry_found ? _GEN_1737 : _GEN_711; // @[branch_predictor.scala 110:103]
  wire  _GEN_2122 = _T_131 & ~entry_found ? _GEN_1738 : _GEN_712; // @[branch_predictor.scala 110:103]
  wire  _GEN_2123 = _T_131 & ~entry_found ? _GEN_1739 : _GEN_713; // @[branch_predictor.scala 110:103]
  wire  _GEN_2124 = _T_131 & ~entry_found ? _GEN_1740 : _GEN_714; // @[branch_predictor.scala 110:103]
  wire  _GEN_2125 = _T_131 & ~entry_found ? _GEN_1741 : _GEN_715; // @[branch_predictor.scala 110:103]
  wire  _GEN_2126 = _T_131 & ~entry_found ? _GEN_1742 : _GEN_716; // @[branch_predictor.scala 110:103]
  wire  _GEN_2127 = _T_131 & ~entry_found ? _GEN_1743 : _GEN_717; // @[branch_predictor.scala 110:103]
  wire  _GEN_2128 = _T_131 & ~entry_found ? _GEN_1744 : _GEN_718; // @[branch_predictor.scala 110:103]
  wire  _GEN_2129 = _T_131 & ~entry_found ? _GEN_1745 : _GEN_719; // @[branch_predictor.scala 110:103]
  wire  _GEN_2130 = _T_131 & ~entry_found ? _GEN_1746 : _GEN_720; // @[branch_predictor.scala 110:103]
  wire  _GEN_2131 = _T_131 & ~entry_found ? _GEN_1747 : _GEN_721; // @[branch_predictor.scala 110:103]
  wire  _GEN_2132 = _T_131 & ~entry_found ? _GEN_1748 : _GEN_722; // @[branch_predictor.scala 110:103]
  wire  _GEN_2133 = _T_131 & ~entry_found ? _GEN_1749 : _GEN_723; // @[branch_predictor.scala 110:103]
  wire  _GEN_2134 = _T_131 & ~entry_found ? _GEN_1750 : _GEN_724; // @[branch_predictor.scala 110:103]
  wire  _GEN_2135 = _T_131 & ~entry_found ? _GEN_1751 : _GEN_725; // @[branch_predictor.scala 110:103]
  wire  _GEN_2136 = _T_131 & ~entry_found ? _GEN_1752 : _GEN_726; // @[branch_predictor.scala 110:103]
  wire  _GEN_2137 = _T_131 & ~entry_found ? _GEN_1753 : _GEN_727; // @[branch_predictor.scala 110:103]
  wire  _GEN_2138 = _T_131 & ~entry_found ? _GEN_1754 : _GEN_728; // @[branch_predictor.scala 110:103]
  wire  _GEN_2139 = _T_131 & ~entry_found ? _GEN_1755 : _GEN_729; // @[branch_predictor.scala 110:103]
  wire  _GEN_2140 = _T_131 & ~entry_found ? _GEN_1756 : _GEN_730; // @[branch_predictor.scala 110:103]
  wire  _GEN_2141 = _T_131 & ~entry_found ? _GEN_1757 : _GEN_731; // @[branch_predictor.scala 110:103]
  wire  _GEN_2142 = _T_131 & ~entry_found ? _GEN_1758 : _GEN_732; // @[branch_predictor.scala 110:103]
  wire  _GEN_2143 = _T_131 & ~entry_found ? _GEN_1759 : _GEN_733; // @[branch_predictor.scala 110:103]
  wire  _GEN_2144 = _T_131 & ~entry_found ? _GEN_1760 : _GEN_734; // @[branch_predictor.scala 110:103]
  wire  _GEN_2145 = _T_131 & ~entry_found ? _GEN_1761 : _GEN_735; // @[branch_predictor.scala 110:103]
  wire  _GEN_2146 = _T_131 & ~entry_found ? _GEN_1762 : _GEN_736; // @[branch_predictor.scala 110:103]
  wire  _GEN_2147 = _T_131 & ~entry_found ? _GEN_1763 : _GEN_737; // @[branch_predictor.scala 110:103]
  wire  _GEN_2148 = _T_131 & ~entry_found ? _GEN_1764 : _GEN_738; // @[branch_predictor.scala 110:103]
  wire  _GEN_2149 = _T_131 & ~entry_found ? _GEN_1765 : _GEN_739; // @[branch_predictor.scala 110:103]
  wire  _GEN_2150 = _T_131 & ~entry_found ? _GEN_1766 : _GEN_740; // @[branch_predictor.scala 110:103]
  wire  _GEN_2151 = _T_131 & ~entry_found ? _GEN_1767 : _GEN_741; // @[branch_predictor.scala 110:103]
  wire  _GEN_2152 = _T_131 & ~entry_found ? _GEN_1768 : _GEN_742; // @[branch_predictor.scala 110:103]
  wire  _GEN_2153 = _T_131 & ~entry_found ? _GEN_1769 : _GEN_743; // @[branch_predictor.scala 110:103]
  wire  _GEN_2154 = _T_131 & ~entry_found ? _GEN_1770 : _GEN_744; // @[branch_predictor.scala 110:103]
  wire  _GEN_2155 = _T_131 & ~entry_found ? _GEN_1771 : _GEN_745; // @[branch_predictor.scala 110:103]
  wire  _GEN_2156 = _T_131 & ~entry_found ? _GEN_1772 : _GEN_746; // @[branch_predictor.scala 110:103]
  wire  _GEN_2157 = _T_131 & ~entry_found ? _GEN_1773 : _GEN_747; // @[branch_predictor.scala 110:103]
  wire  _GEN_2158 = _T_131 & ~entry_found ? _GEN_1774 : _GEN_748; // @[branch_predictor.scala 110:103]
  wire  _GEN_2159 = _T_131 & ~entry_found ? _GEN_1775 : _GEN_749; // @[branch_predictor.scala 110:103]
  wire  _GEN_2160 = _T_131 & ~entry_found ? _GEN_1776 : _GEN_750; // @[branch_predictor.scala 110:103]
  wire  _GEN_2161 = _T_131 & ~entry_found ? _GEN_1777 : _GEN_751; // @[branch_predictor.scala 110:103]
  wire  _GEN_2162 = _T_131 & ~entry_found ? _GEN_1778 : _GEN_752; // @[branch_predictor.scala 110:103]
  wire  _GEN_2163 = _T_131 & ~entry_found ? _GEN_1779 : _GEN_753; // @[branch_predictor.scala 110:103]
  wire  _GEN_2164 = _T_131 & ~entry_found ? _GEN_1780 : _GEN_754; // @[branch_predictor.scala 110:103]
  wire  _GEN_2165 = _T_131 & ~entry_found ? _GEN_1781 : _GEN_755; // @[branch_predictor.scala 110:103]
  wire  _GEN_2166 = _T_131 & ~entry_found ? _GEN_1782 : _GEN_756; // @[branch_predictor.scala 110:103]
  wire  _GEN_2167 = _T_131 & ~entry_found ? _GEN_1783 : _GEN_757; // @[branch_predictor.scala 110:103]
  wire  _GEN_2168 = _T_131 & ~entry_found ? _GEN_1784 : _GEN_758; // @[branch_predictor.scala 110:103]
  wire  _GEN_2169 = _T_131 & ~entry_found ? _GEN_1785 : _GEN_759; // @[branch_predictor.scala 110:103]
  wire  _GEN_2170 = _T_131 & ~entry_found ? _GEN_1786 : _GEN_760; // @[branch_predictor.scala 110:103]
  wire  _GEN_2171 = _T_131 & ~entry_found ? _GEN_1787 : _GEN_761; // @[branch_predictor.scala 110:103]
  wire  _GEN_2172 = _T_131 & ~entry_found ? _GEN_1788 : _GEN_762; // @[branch_predictor.scala 110:103]
  wire  _GEN_2173 = _T_131 & ~entry_found ? _GEN_1789 : _GEN_763; // @[branch_predictor.scala 110:103]
  wire  _GEN_2174 = _T_131 & ~entry_found ? _GEN_1790 : _GEN_764; // @[branch_predictor.scala 110:103]
  wire  _GEN_2175 = _T_131 & ~entry_found ? _GEN_1791 : _GEN_765; // @[branch_predictor.scala 110:103]
  wire  _GEN_2176 = _T_131 & ~entry_found ? _GEN_1792 : _GEN_766; // @[branch_predictor.scala 110:103]
  wire  _GEN_2177 = _T_131 & ~entry_found ? _GEN_1793 : _GEN_767; // @[branch_predictor.scala 110:103]
  assign io_o_branch_predict_pack_valid = btb_63_tag == io_i_addr[12:3] ? btb_63_valid : _GEN_310; // @[branch_predictor.scala 43:45 44:44]
  assign io_o_branch_predict_pack_target = btb_63_tag == io_i_addr[12:3] ? btb_63_target_address : _GEN_311; // @[branch_predictor.scala 43:45 45:45]
  assign io_o_branch_predict_pack_branch_type = btb_63_tag == io_i_addr[12:3] ? btb_63_branch_type : _GEN_312; // @[branch_predictor.scala 43:45 46:50]
  assign io_o_branch_predict_pack_select = btb_63_tag == io_i_addr[12:3] ? btb_63_select : _GEN_313; // @[branch_predictor.scala 43:45 47:45]
  assign io_o_branch_predict_pack_taken = btb_63_tag == io_i_addr[12:3] ? ~btb_63_bht[1] : _GEN_314; // @[branch_predictor.scala 43:45 48:44]
  always @(posedge clock) begin
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_0_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_0_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_0_valid <= _GEN_2114;
      end
    end else begin
      btb_0_valid <= _GEN_2114;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_0_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_0_tag <= _GEN_768;
      end
    end else begin
      btb_0_tag <= _GEN_768;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_0_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_0_branch_type <= _GEN_896;
      end
    end else begin
      btb_0_branch_type <= _GEN_896;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_0_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_0_target_address <= _GEN_1538;
      end
    end else begin
      btb_0_target_address <= _GEN_1538;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_0_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_0_select <= _GEN_1539;
      end
    end else begin
      btb_0_select <= _GEN_1539;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_0_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h0 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_0_bht <= 2'h1;
        end else begin
          btb_0_bht <= 2'h0;
        end
      end else begin
        btb_0_bht <= _GEN_1540;
      end
    end else begin
      btb_0_bht <= _GEN_1540;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_1_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_1_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_1_valid <= _GEN_2115;
      end
    end else begin
      btb_1_valid <= _GEN_2115;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_1_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_1_tag <= _GEN_769;
      end
    end else begin
      btb_1_tag <= _GEN_769;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_1_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_1_branch_type <= _GEN_897;
      end
    end else begin
      btb_1_branch_type <= _GEN_897;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_1_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_1_target_address <= _GEN_1541;
      end
    end else begin
      btb_1_target_address <= _GEN_1541;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_1_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_1_select <= _GEN_1542;
      end
    end else begin
      btb_1_select <= _GEN_1542;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_1_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_1_bht <= 2'h1;
        end else begin
          btb_1_bht <= 2'h0;
        end
      end else begin
        btb_1_bht <= _GEN_1543;
      end
    end else begin
      btb_1_bht <= _GEN_1543;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_2_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_2_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_2_valid <= _GEN_2116;
      end
    end else begin
      btb_2_valid <= _GEN_2116;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_2_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_2_tag <= _GEN_770;
      end
    end else begin
      btb_2_tag <= _GEN_770;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_2_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_2_branch_type <= _GEN_898;
      end
    end else begin
      btb_2_branch_type <= _GEN_898;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_2_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_2_target_address <= _GEN_1544;
      end
    end else begin
      btb_2_target_address <= _GEN_1544;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_2_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_2_select <= _GEN_1545;
      end
    end else begin
      btb_2_select <= _GEN_1545;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_2_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_2_bht <= 2'h1;
        end else begin
          btb_2_bht <= 2'h0;
        end
      end else begin
        btb_2_bht <= _GEN_1546;
      end
    end else begin
      btb_2_bht <= _GEN_1546;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_3_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_3_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_3_valid <= _GEN_2117;
      end
    end else begin
      btb_3_valid <= _GEN_2117;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_3_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_3_tag <= _GEN_771;
      end
    end else begin
      btb_3_tag <= _GEN_771;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_3_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_3_branch_type <= _GEN_899;
      end
    end else begin
      btb_3_branch_type <= _GEN_899;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_3_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_3_target_address <= _GEN_1547;
      end
    end else begin
      btb_3_target_address <= _GEN_1547;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_3_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_3_select <= _GEN_1548;
      end
    end else begin
      btb_3_select <= _GEN_1548;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_3_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_3_bht <= 2'h1;
        end else begin
          btb_3_bht <= 2'h0;
        end
      end else begin
        btb_3_bht <= _GEN_1549;
      end
    end else begin
      btb_3_bht <= _GEN_1549;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_4_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_4_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_4_valid <= _GEN_2118;
      end
    end else begin
      btb_4_valid <= _GEN_2118;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_4_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_4_tag <= _GEN_772;
      end
    end else begin
      btb_4_tag <= _GEN_772;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_4_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_4_branch_type <= _GEN_900;
      end
    end else begin
      btb_4_branch_type <= _GEN_900;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_4_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_4_target_address <= _GEN_1550;
      end
    end else begin
      btb_4_target_address <= _GEN_1550;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_4_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_4_select <= _GEN_1551;
      end
    end else begin
      btb_4_select <= _GEN_1551;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_4_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h4 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_4_bht <= 2'h1;
        end else begin
          btb_4_bht <= 2'h0;
        end
      end else begin
        btb_4_bht <= _GEN_1552;
      end
    end else begin
      btb_4_bht <= _GEN_1552;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_5_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_5_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_5_valid <= _GEN_2119;
      end
    end else begin
      btb_5_valid <= _GEN_2119;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_5_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_5_tag <= _GEN_773;
      end
    end else begin
      btb_5_tag <= _GEN_773;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_5_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_5_branch_type <= _GEN_901;
      end
    end else begin
      btb_5_branch_type <= _GEN_901;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_5_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_5_target_address <= _GEN_1553;
      end
    end else begin
      btb_5_target_address <= _GEN_1553;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_5_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_5_select <= _GEN_1554;
      end
    end else begin
      btb_5_select <= _GEN_1554;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_5_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h5 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_5_bht <= 2'h1;
        end else begin
          btb_5_bht <= 2'h0;
        end
      end else begin
        btb_5_bht <= _GEN_1555;
      end
    end else begin
      btb_5_bht <= _GEN_1555;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_6_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_6_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_6_valid <= _GEN_2120;
      end
    end else begin
      btb_6_valid <= _GEN_2120;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_6_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_6_tag <= _GEN_774;
      end
    end else begin
      btb_6_tag <= _GEN_774;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_6_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_6_branch_type <= _GEN_902;
      end
    end else begin
      btb_6_branch_type <= _GEN_902;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_6_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_6_target_address <= _GEN_1556;
      end
    end else begin
      btb_6_target_address <= _GEN_1556;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_6_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_6_select <= _GEN_1557;
      end
    end else begin
      btb_6_select <= _GEN_1557;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_6_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h6 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_6_bht <= 2'h1;
        end else begin
          btb_6_bht <= 2'h0;
        end
      end else begin
        btb_6_bht <= _GEN_1558;
      end
    end else begin
      btb_6_bht <= _GEN_1558;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_7_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_7_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_7_valid <= _GEN_2121;
      end
    end else begin
      btb_7_valid <= _GEN_2121;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_7_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_7_tag <= _GEN_775;
      end
    end else begin
      btb_7_tag <= _GEN_775;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_7_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_7_branch_type <= _GEN_903;
      end
    end else begin
      btb_7_branch_type <= _GEN_903;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_7_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_7_target_address <= _GEN_1559;
      end
    end else begin
      btb_7_target_address <= _GEN_1559;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_7_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_7_select <= _GEN_1560;
      end
    end else begin
      btb_7_select <= _GEN_1560;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_7_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h7 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_7_bht <= 2'h1;
        end else begin
          btb_7_bht <= 2'h0;
        end
      end else begin
        btb_7_bht <= _GEN_1561;
      end
    end else begin
      btb_7_bht <= _GEN_1561;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_8_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_8_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_8_valid <= _GEN_2122;
      end
    end else begin
      btb_8_valid <= _GEN_2122;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_8_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_8_tag <= _GEN_776;
      end
    end else begin
      btb_8_tag <= _GEN_776;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_8_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_8_branch_type <= _GEN_904;
      end
    end else begin
      btb_8_branch_type <= _GEN_904;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_8_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_8_target_address <= _GEN_1562;
      end
    end else begin
      btb_8_target_address <= _GEN_1562;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_8_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_8_select <= _GEN_1563;
      end
    end else begin
      btb_8_select <= _GEN_1563;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_8_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h8 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_8_bht <= 2'h1;
        end else begin
          btb_8_bht <= 2'h0;
        end
      end else begin
        btb_8_bht <= _GEN_1564;
      end
    end else begin
      btb_8_bht <= _GEN_1564;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_9_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_9_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_9_valid <= _GEN_2123;
      end
    end else begin
      btb_9_valid <= _GEN_2123;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_9_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_9_tag <= _GEN_777;
      end
    end else begin
      btb_9_tag <= _GEN_777;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_9_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_9_branch_type <= _GEN_905;
      end
    end else begin
      btb_9_branch_type <= _GEN_905;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_9_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_9_target_address <= _GEN_1565;
      end
    end else begin
      btb_9_target_address <= _GEN_1565;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_9_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_9_select <= _GEN_1566;
      end
    end else begin
      btb_9_select <= _GEN_1566;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_9_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h9 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_9_bht <= 2'h1;
        end else begin
          btb_9_bht <= 2'h0;
        end
      end else begin
        btb_9_bht <= _GEN_1567;
      end
    end else begin
      btb_9_bht <= _GEN_1567;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_10_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_10_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_10_valid <= _GEN_2124;
      end
    end else begin
      btb_10_valid <= _GEN_2124;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'ha == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_10_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_10_tag <= _GEN_778;
      end
    end else begin
      btb_10_tag <= _GEN_778;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'ha == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_10_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_10_branch_type <= _GEN_906;
      end
    end else begin
      btb_10_branch_type <= _GEN_906;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'ha == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_10_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_10_target_address <= _GEN_1568;
      end
    end else begin
      btb_10_target_address <= _GEN_1568;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'ha == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_10_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_10_select <= _GEN_1569;
      end
    end else begin
      btb_10_select <= _GEN_1569;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_10_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'ha == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_10_bht <= 2'h1;
        end else begin
          btb_10_bht <= 2'h0;
        end
      end else begin
        btb_10_bht <= _GEN_1570;
      end
    end else begin
      btb_10_bht <= _GEN_1570;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_11_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_11_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_11_valid <= _GEN_2125;
      end
    end else begin
      btb_11_valid <= _GEN_2125;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hb == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_11_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_11_tag <= _GEN_779;
      end
    end else begin
      btb_11_tag <= _GEN_779;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hb == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_11_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_11_branch_type <= _GEN_907;
      end
    end else begin
      btb_11_branch_type <= _GEN_907;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hb == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_11_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_11_target_address <= _GEN_1571;
      end
    end else begin
      btb_11_target_address <= _GEN_1571;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hb == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_11_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_11_select <= _GEN_1572;
      end
    end else begin
      btb_11_select <= _GEN_1572;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_11_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hb == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_11_bht <= 2'h1;
        end else begin
          btb_11_bht <= 2'h0;
        end
      end else begin
        btb_11_bht <= _GEN_1573;
      end
    end else begin
      btb_11_bht <= _GEN_1573;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_12_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_12_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_12_valid <= _GEN_2126;
      end
    end else begin
      btb_12_valid <= _GEN_2126;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hc == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_12_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_12_tag <= _GEN_780;
      end
    end else begin
      btb_12_tag <= _GEN_780;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hc == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_12_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_12_branch_type <= _GEN_908;
      end
    end else begin
      btb_12_branch_type <= _GEN_908;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hc == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_12_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_12_target_address <= _GEN_1574;
      end
    end else begin
      btb_12_target_address <= _GEN_1574;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hc == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_12_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_12_select <= _GEN_1575;
      end
    end else begin
      btb_12_select <= _GEN_1575;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_12_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hc == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_12_bht <= 2'h1;
        end else begin
          btb_12_bht <= 2'h0;
        end
      end else begin
        btb_12_bht <= _GEN_1576;
      end
    end else begin
      btb_12_bht <= _GEN_1576;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_13_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_13_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_13_valid <= _GEN_2127;
      end
    end else begin
      btb_13_valid <= _GEN_2127;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hd == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_13_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_13_tag <= _GEN_781;
      end
    end else begin
      btb_13_tag <= _GEN_781;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hd == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_13_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_13_branch_type <= _GEN_909;
      end
    end else begin
      btb_13_branch_type <= _GEN_909;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hd == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_13_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_13_target_address <= _GEN_1577;
      end
    end else begin
      btb_13_target_address <= _GEN_1577;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hd == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_13_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_13_select <= _GEN_1578;
      end
    end else begin
      btb_13_select <= _GEN_1578;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_13_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hd == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_13_bht <= 2'h1;
        end else begin
          btb_13_bht <= 2'h0;
        end
      end else begin
        btb_13_bht <= _GEN_1579;
      end
    end else begin
      btb_13_bht <= _GEN_1579;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_14_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_14_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_14_valid <= _GEN_2128;
      end
    end else begin
      btb_14_valid <= _GEN_2128;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'he == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_14_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_14_tag <= _GEN_782;
      end
    end else begin
      btb_14_tag <= _GEN_782;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'he == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_14_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_14_branch_type <= _GEN_910;
      end
    end else begin
      btb_14_branch_type <= _GEN_910;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'he == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_14_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_14_target_address <= _GEN_1580;
      end
    end else begin
      btb_14_target_address <= _GEN_1580;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'he == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_14_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_14_select <= _GEN_1581;
      end
    end else begin
      btb_14_select <= _GEN_1581;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_14_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'he == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_14_bht <= 2'h1;
        end else begin
          btb_14_bht <= 2'h0;
        end
      end else begin
        btb_14_bht <= _GEN_1582;
      end
    end else begin
      btb_14_bht <= _GEN_1582;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_15_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_15_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_15_valid <= _GEN_2129;
      end
    end else begin
      btb_15_valid <= _GEN_2129;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hf == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_15_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_15_tag <= _GEN_783;
      end
    end else begin
      btb_15_tag <= _GEN_783;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hf == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_15_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_15_branch_type <= _GEN_911;
      end
    end else begin
      btb_15_branch_type <= _GEN_911;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hf == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_15_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_15_target_address <= _GEN_1583;
      end
    end else begin
      btb_15_target_address <= _GEN_1583;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hf == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_15_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_15_select <= _GEN_1584;
      end
    end else begin
      btb_15_select <= _GEN_1584;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_15_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'hf == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_15_bht <= 2'h1;
        end else begin
          btb_15_bht <= 2'h0;
        end
      end else begin
        btb_15_bht <= _GEN_1585;
      end
    end else begin
      btb_15_bht <= _GEN_1585;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_16_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_16_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_16_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_16_valid <= _GEN_2130;
      end
    end else begin
      btb_16_valid <= _GEN_2130;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_16_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h10 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_16_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_16_tag <= _GEN_784;
      end
    end else begin
      btb_16_tag <= _GEN_784;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_16_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h10 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_16_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_16_branch_type <= _GEN_912;
      end
    end else begin
      btb_16_branch_type <= _GEN_912;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_16_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h10 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_16_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_16_target_address <= _GEN_1586;
      end
    end else begin
      btb_16_target_address <= _GEN_1586;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_16_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h10 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_16_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_16_select <= _GEN_1587;
      end
    end else begin
      btb_16_select <= _GEN_1587;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_16_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h10 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_16_bht <= 2'h1;
        end else begin
          btb_16_bht <= 2'h0;
        end
      end else begin
        btb_16_bht <= _GEN_1588;
      end
    end else begin
      btb_16_bht <= _GEN_1588;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_17_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_17_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_17_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_17_valid <= _GEN_2131;
      end
    end else begin
      btb_17_valid <= _GEN_2131;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_17_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h11 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_17_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_17_tag <= _GEN_785;
      end
    end else begin
      btb_17_tag <= _GEN_785;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_17_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h11 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_17_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_17_branch_type <= _GEN_913;
      end
    end else begin
      btb_17_branch_type <= _GEN_913;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_17_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h11 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_17_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_17_target_address <= _GEN_1589;
      end
    end else begin
      btb_17_target_address <= _GEN_1589;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_17_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h11 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_17_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_17_select <= _GEN_1590;
      end
    end else begin
      btb_17_select <= _GEN_1590;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_17_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h11 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_17_bht <= 2'h1;
        end else begin
          btb_17_bht <= 2'h0;
        end
      end else begin
        btb_17_bht <= _GEN_1591;
      end
    end else begin
      btb_17_bht <= _GEN_1591;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_18_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_18_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_18_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_18_valid <= _GEN_2132;
      end
    end else begin
      btb_18_valid <= _GEN_2132;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_18_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h12 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_18_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_18_tag <= _GEN_786;
      end
    end else begin
      btb_18_tag <= _GEN_786;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_18_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h12 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_18_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_18_branch_type <= _GEN_914;
      end
    end else begin
      btb_18_branch_type <= _GEN_914;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_18_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h12 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_18_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_18_target_address <= _GEN_1592;
      end
    end else begin
      btb_18_target_address <= _GEN_1592;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_18_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h12 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_18_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_18_select <= _GEN_1593;
      end
    end else begin
      btb_18_select <= _GEN_1593;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_18_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h12 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_18_bht <= 2'h1;
        end else begin
          btb_18_bht <= 2'h0;
        end
      end else begin
        btb_18_bht <= _GEN_1594;
      end
    end else begin
      btb_18_bht <= _GEN_1594;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_19_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_19_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_19_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_19_valid <= _GEN_2133;
      end
    end else begin
      btb_19_valid <= _GEN_2133;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_19_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h13 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_19_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_19_tag <= _GEN_787;
      end
    end else begin
      btb_19_tag <= _GEN_787;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_19_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h13 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_19_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_19_branch_type <= _GEN_915;
      end
    end else begin
      btb_19_branch_type <= _GEN_915;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_19_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h13 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_19_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_19_target_address <= _GEN_1595;
      end
    end else begin
      btb_19_target_address <= _GEN_1595;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_19_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h13 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_19_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_19_select <= _GEN_1596;
      end
    end else begin
      btb_19_select <= _GEN_1596;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_19_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h13 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_19_bht <= 2'h1;
        end else begin
          btb_19_bht <= 2'h0;
        end
      end else begin
        btb_19_bht <= _GEN_1597;
      end
    end else begin
      btb_19_bht <= _GEN_1597;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_20_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_20_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_20_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_20_valid <= _GEN_2134;
      end
    end else begin
      btb_20_valid <= _GEN_2134;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_20_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h14 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_20_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_20_tag <= _GEN_788;
      end
    end else begin
      btb_20_tag <= _GEN_788;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_20_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h14 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_20_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_20_branch_type <= _GEN_916;
      end
    end else begin
      btb_20_branch_type <= _GEN_916;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_20_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h14 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_20_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_20_target_address <= _GEN_1598;
      end
    end else begin
      btb_20_target_address <= _GEN_1598;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_20_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h14 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_20_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_20_select <= _GEN_1599;
      end
    end else begin
      btb_20_select <= _GEN_1599;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_20_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h14 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_20_bht <= 2'h1;
        end else begin
          btb_20_bht <= 2'h0;
        end
      end else begin
        btb_20_bht <= _GEN_1600;
      end
    end else begin
      btb_20_bht <= _GEN_1600;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_21_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_21_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_21_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_21_valid <= _GEN_2135;
      end
    end else begin
      btb_21_valid <= _GEN_2135;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_21_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h15 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_21_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_21_tag <= _GEN_789;
      end
    end else begin
      btb_21_tag <= _GEN_789;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_21_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h15 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_21_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_21_branch_type <= _GEN_917;
      end
    end else begin
      btb_21_branch_type <= _GEN_917;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_21_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h15 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_21_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_21_target_address <= _GEN_1601;
      end
    end else begin
      btb_21_target_address <= _GEN_1601;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_21_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h15 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_21_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_21_select <= _GEN_1602;
      end
    end else begin
      btb_21_select <= _GEN_1602;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_21_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h15 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_21_bht <= 2'h1;
        end else begin
          btb_21_bht <= 2'h0;
        end
      end else begin
        btb_21_bht <= _GEN_1603;
      end
    end else begin
      btb_21_bht <= _GEN_1603;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_22_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_22_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_22_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_22_valid <= _GEN_2136;
      end
    end else begin
      btb_22_valid <= _GEN_2136;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_22_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h16 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_22_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_22_tag <= _GEN_790;
      end
    end else begin
      btb_22_tag <= _GEN_790;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_22_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h16 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_22_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_22_branch_type <= _GEN_918;
      end
    end else begin
      btb_22_branch_type <= _GEN_918;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_22_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h16 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_22_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_22_target_address <= _GEN_1604;
      end
    end else begin
      btb_22_target_address <= _GEN_1604;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_22_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h16 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_22_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_22_select <= _GEN_1605;
      end
    end else begin
      btb_22_select <= _GEN_1605;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_22_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h16 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_22_bht <= 2'h1;
        end else begin
          btb_22_bht <= 2'h0;
        end
      end else begin
        btb_22_bht <= _GEN_1606;
      end
    end else begin
      btb_22_bht <= _GEN_1606;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_23_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_23_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_23_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_23_valid <= _GEN_2137;
      end
    end else begin
      btb_23_valid <= _GEN_2137;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_23_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h17 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_23_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_23_tag <= _GEN_791;
      end
    end else begin
      btb_23_tag <= _GEN_791;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_23_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h17 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_23_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_23_branch_type <= _GEN_919;
      end
    end else begin
      btb_23_branch_type <= _GEN_919;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_23_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h17 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_23_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_23_target_address <= _GEN_1607;
      end
    end else begin
      btb_23_target_address <= _GEN_1607;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_23_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h17 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_23_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_23_select <= _GEN_1608;
      end
    end else begin
      btb_23_select <= _GEN_1608;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_23_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h17 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_23_bht <= 2'h1;
        end else begin
          btb_23_bht <= 2'h0;
        end
      end else begin
        btb_23_bht <= _GEN_1609;
      end
    end else begin
      btb_23_bht <= _GEN_1609;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_24_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_24_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_24_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_24_valid <= _GEN_2138;
      end
    end else begin
      btb_24_valid <= _GEN_2138;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_24_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h18 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_24_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_24_tag <= _GEN_792;
      end
    end else begin
      btb_24_tag <= _GEN_792;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_24_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h18 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_24_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_24_branch_type <= _GEN_920;
      end
    end else begin
      btb_24_branch_type <= _GEN_920;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_24_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h18 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_24_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_24_target_address <= _GEN_1610;
      end
    end else begin
      btb_24_target_address <= _GEN_1610;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_24_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h18 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_24_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_24_select <= _GEN_1611;
      end
    end else begin
      btb_24_select <= _GEN_1611;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_24_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h18 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_24_bht <= 2'h1;
        end else begin
          btb_24_bht <= 2'h0;
        end
      end else begin
        btb_24_bht <= _GEN_1612;
      end
    end else begin
      btb_24_bht <= _GEN_1612;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_25_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_25_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_25_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_25_valid <= _GEN_2139;
      end
    end else begin
      btb_25_valid <= _GEN_2139;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_25_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h19 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_25_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_25_tag <= _GEN_793;
      end
    end else begin
      btb_25_tag <= _GEN_793;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_25_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h19 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_25_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_25_branch_type <= _GEN_921;
      end
    end else begin
      btb_25_branch_type <= _GEN_921;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_25_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h19 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_25_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_25_target_address <= _GEN_1613;
      end
    end else begin
      btb_25_target_address <= _GEN_1613;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_25_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h19 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_25_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_25_select <= _GEN_1614;
      end
    end else begin
      btb_25_select <= _GEN_1614;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_25_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h19 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_25_bht <= 2'h1;
        end else begin
          btb_25_bht <= 2'h0;
        end
      end else begin
        btb_25_bht <= _GEN_1615;
      end
    end else begin
      btb_25_bht <= _GEN_1615;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_26_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_26_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_26_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_26_valid <= _GEN_2140;
      end
    end else begin
      btb_26_valid <= _GEN_2140;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_26_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1a == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_26_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_26_tag <= _GEN_794;
      end
    end else begin
      btb_26_tag <= _GEN_794;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_26_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1a == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_26_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_26_branch_type <= _GEN_922;
      end
    end else begin
      btb_26_branch_type <= _GEN_922;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_26_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1a == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_26_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_26_target_address <= _GEN_1616;
      end
    end else begin
      btb_26_target_address <= _GEN_1616;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_26_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1a == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_26_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_26_select <= _GEN_1617;
      end
    end else begin
      btb_26_select <= _GEN_1617;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_26_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1a == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_26_bht <= 2'h1;
        end else begin
          btb_26_bht <= 2'h0;
        end
      end else begin
        btb_26_bht <= _GEN_1618;
      end
    end else begin
      btb_26_bht <= _GEN_1618;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_27_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_27_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_27_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_27_valid <= _GEN_2141;
      end
    end else begin
      btb_27_valid <= _GEN_2141;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_27_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1b == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_27_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_27_tag <= _GEN_795;
      end
    end else begin
      btb_27_tag <= _GEN_795;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_27_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1b == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_27_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_27_branch_type <= _GEN_923;
      end
    end else begin
      btb_27_branch_type <= _GEN_923;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_27_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1b == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_27_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_27_target_address <= _GEN_1619;
      end
    end else begin
      btb_27_target_address <= _GEN_1619;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_27_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1b == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_27_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_27_select <= _GEN_1620;
      end
    end else begin
      btb_27_select <= _GEN_1620;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_27_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1b == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_27_bht <= 2'h1;
        end else begin
          btb_27_bht <= 2'h0;
        end
      end else begin
        btb_27_bht <= _GEN_1621;
      end
    end else begin
      btb_27_bht <= _GEN_1621;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_28_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_28_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_28_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_28_valid <= _GEN_2142;
      end
    end else begin
      btb_28_valid <= _GEN_2142;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_28_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1c == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_28_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_28_tag <= _GEN_796;
      end
    end else begin
      btb_28_tag <= _GEN_796;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_28_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1c == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_28_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_28_branch_type <= _GEN_924;
      end
    end else begin
      btb_28_branch_type <= _GEN_924;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_28_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1c == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_28_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_28_target_address <= _GEN_1622;
      end
    end else begin
      btb_28_target_address <= _GEN_1622;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_28_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1c == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_28_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_28_select <= _GEN_1623;
      end
    end else begin
      btb_28_select <= _GEN_1623;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_28_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1c == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_28_bht <= 2'h1;
        end else begin
          btb_28_bht <= 2'h0;
        end
      end else begin
        btb_28_bht <= _GEN_1624;
      end
    end else begin
      btb_28_bht <= _GEN_1624;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_29_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_29_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_29_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_29_valid <= _GEN_2143;
      end
    end else begin
      btb_29_valid <= _GEN_2143;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_29_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1d == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_29_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_29_tag <= _GEN_797;
      end
    end else begin
      btb_29_tag <= _GEN_797;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_29_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1d == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_29_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_29_branch_type <= _GEN_925;
      end
    end else begin
      btb_29_branch_type <= _GEN_925;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_29_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1d == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_29_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_29_target_address <= _GEN_1625;
      end
    end else begin
      btb_29_target_address <= _GEN_1625;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_29_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1d == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_29_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_29_select <= _GEN_1626;
      end
    end else begin
      btb_29_select <= _GEN_1626;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_29_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1d == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_29_bht <= 2'h1;
        end else begin
          btb_29_bht <= 2'h0;
        end
      end else begin
        btb_29_bht <= _GEN_1627;
      end
    end else begin
      btb_29_bht <= _GEN_1627;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_30_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_30_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_30_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_30_valid <= _GEN_2144;
      end
    end else begin
      btb_30_valid <= _GEN_2144;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_30_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1e == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_30_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_30_tag <= _GEN_798;
      end
    end else begin
      btb_30_tag <= _GEN_798;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_30_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1e == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_30_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_30_branch_type <= _GEN_926;
      end
    end else begin
      btb_30_branch_type <= _GEN_926;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_30_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1e == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_30_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_30_target_address <= _GEN_1628;
      end
    end else begin
      btb_30_target_address <= _GEN_1628;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_30_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1e == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_30_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_30_select <= _GEN_1629;
      end
    end else begin
      btb_30_select <= _GEN_1629;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_30_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1e == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_30_bht <= 2'h1;
        end else begin
          btb_30_bht <= 2'h0;
        end
      end else begin
        btb_30_bht <= _GEN_1630;
      end
    end else begin
      btb_30_bht <= _GEN_1630;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_31_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_31_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_31_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_31_valid <= _GEN_2145;
      end
    end else begin
      btb_31_valid <= _GEN_2145;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_31_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1f == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_31_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_31_tag <= _GEN_799;
      end
    end else begin
      btb_31_tag <= _GEN_799;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_31_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1f == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_31_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_31_branch_type <= _GEN_927;
      end
    end else begin
      btb_31_branch_type <= _GEN_927;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_31_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1f == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_31_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_31_target_address <= _GEN_1631;
      end
    end else begin
      btb_31_target_address <= _GEN_1631;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_31_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1f == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_31_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_31_select <= _GEN_1632;
      end
    end else begin
      btb_31_select <= _GEN_1632;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_31_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h1f == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_31_bht <= 2'h1;
        end else begin
          btb_31_bht <= 2'h0;
        end
      end else begin
        btb_31_bht <= _GEN_1633;
      end
    end else begin
      btb_31_bht <= _GEN_1633;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_32_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_32_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_32_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_32_valid <= _GEN_2146;
      end
    end else begin
      btb_32_valid <= _GEN_2146;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_32_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h20 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_32_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_32_tag <= _GEN_800;
      end
    end else begin
      btb_32_tag <= _GEN_800;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_32_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h20 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_32_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_32_branch_type <= _GEN_928;
      end
    end else begin
      btb_32_branch_type <= _GEN_928;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_32_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h20 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_32_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_32_target_address <= _GEN_1634;
      end
    end else begin
      btb_32_target_address <= _GEN_1634;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_32_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h20 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_32_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_32_select <= _GEN_1635;
      end
    end else begin
      btb_32_select <= _GEN_1635;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_32_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h20 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_32_bht <= 2'h1;
        end else begin
          btb_32_bht <= 2'h0;
        end
      end else begin
        btb_32_bht <= _GEN_1636;
      end
    end else begin
      btb_32_bht <= _GEN_1636;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_33_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_33_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_33_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_33_valid <= _GEN_2147;
      end
    end else begin
      btb_33_valid <= _GEN_2147;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_33_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h21 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_33_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_33_tag <= _GEN_801;
      end
    end else begin
      btb_33_tag <= _GEN_801;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_33_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h21 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_33_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_33_branch_type <= _GEN_929;
      end
    end else begin
      btb_33_branch_type <= _GEN_929;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_33_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h21 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_33_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_33_target_address <= _GEN_1637;
      end
    end else begin
      btb_33_target_address <= _GEN_1637;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_33_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h21 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_33_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_33_select <= _GEN_1638;
      end
    end else begin
      btb_33_select <= _GEN_1638;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_33_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h21 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_33_bht <= 2'h1;
        end else begin
          btb_33_bht <= 2'h0;
        end
      end else begin
        btb_33_bht <= _GEN_1639;
      end
    end else begin
      btb_33_bht <= _GEN_1639;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_34_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_34_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_34_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_34_valid <= _GEN_2148;
      end
    end else begin
      btb_34_valid <= _GEN_2148;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_34_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h22 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_34_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_34_tag <= _GEN_802;
      end
    end else begin
      btb_34_tag <= _GEN_802;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_34_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h22 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_34_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_34_branch_type <= _GEN_930;
      end
    end else begin
      btb_34_branch_type <= _GEN_930;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_34_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h22 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_34_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_34_target_address <= _GEN_1640;
      end
    end else begin
      btb_34_target_address <= _GEN_1640;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_34_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h22 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_34_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_34_select <= _GEN_1641;
      end
    end else begin
      btb_34_select <= _GEN_1641;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_34_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h22 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_34_bht <= 2'h1;
        end else begin
          btb_34_bht <= 2'h0;
        end
      end else begin
        btb_34_bht <= _GEN_1642;
      end
    end else begin
      btb_34_bht <= _GEN_1642;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_35_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_35_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_35_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_35_valid <= _GEN_2149;
      end
    end else begin
      btb_35_valid <= _GEN_2149;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_35_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h23 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_35_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_35_tag <= _GEN_803;
      end
    end else begin
      btb_35_tag <= _GEN_803;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_35_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h23 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_35_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_35_branch_type <= _GEN_931;
      end
    end else begin
      btb_35_branch_type <= _GEN_931;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_35_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h23 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_35_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_35_target_address <= _GEN_1643;
      end
    end else begin
      btb_35_target_address <= _GEN_1643;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_35_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h23 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_35_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_35_select <= _GEN_1644;
      end
    end else begin
      btb_35_select <= _GEN_1644;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_35_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h23 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_35_bht <= 2'h1;
        end else begin
          btb_35_bht <= 2'h0;
        end
      end else begin
        btb_35_bht <= _GEN_1645;
      end
    end else begin
      btb_35_bht <= _GEN_1645;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_36_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_36_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_36_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_36_valid <= _GEN_2150;
      end
    end else begin
      btb_36_valid <= _GEN_2150;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_36_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h24 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_36_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_36_tag <= _GEN_804;
      end
    end else begin
      btb_36_tag <= _GEN_804;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_36_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h24 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_36_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_36_branch_type <= _GEN_932;
      end
    end else begin
      btb_36_branch_type <= _GEN_932;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_36_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h24 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_36_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_36_target_address <= _GEN_1646;
      end
    end else begin
      btb_36_target_address <= _GEN_1646;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_36_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h24 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_36_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_36_select <= _GEN_1647;
      end
    end else begin
      btb_36_select <= _GEN_1647;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_36_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h24 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_36_bht <= 2'h1;
        end else begin
          btb_36_bht <= 2'h0;
        end
      end else begin
        btb_36_bht <= _GEN_1648;
      end
    end else begin
      btb_36_bht <= _GEN_1648;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_37_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_37_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_37_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_37_valid <= _GEN_2151;
      end
    end else begin
      btb_37_valid <= _GEN_2151;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_37_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h25 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_37_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_37_tag <= _GEN_805;
      end
    end else begin
      btb_37_tag <= _GEN_805;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_37_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h25 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_37_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_37_branch_type <= _GEN_933;
      end
    end else begin
      btb_37_branch_type <= _GEN_933;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_37_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h25 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_37_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_37_target_address <= _GEN_1649;
      end
    end else begin
      btb_37_target_address <= _GEN_1649;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_37_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h25 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_37_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_37_select <= _GEN_1650;
      end
    end else begin
      btb_37_select <= _GEN_1650;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_37_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h25 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_37_bht <= 2'h1;
        end else begin
          btb_37_bht <= 2'h0;
        end
      end else begin
        btb_37_bht <= _GEN_1651;
      end
    end else begin
      btb_37_bht <= _GEN_1651;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_38_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_38_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_38_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_38_valid <= _GEN_2152;
      end
    end else begin
      btb_38_valid <= _GEN_2152;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_38_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h26 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_38_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_38_tag <= _GEN_806;
      end
    end else begin
      btb_38_tag <= _GEN_806;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_38_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h26 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_38_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_38_branch_type <= _GEN_934;
      end
    end else begin
      btb_38_branch_type <= _GEN_934;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_38_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h26 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_38_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_38_target_address <= _GEN_1652;
      end
    end else begin
      btb_38_target_address <= _GEN_1652;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_38_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h26 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_38_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_38_select <= _GEN_1653;
      end
    end else begin
      btb_38_select <= _GEN_1653;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_38_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h26 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_38_bht <= 2'h1;
        end else begin
          btb_38_bht <= 2'h0;
        end
      end else begin
        btb_38_bht <= _GEN_1654;
      end
    end else begin
      btb_38_bht <= _GEN_1654;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_39_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_39_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_39_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_39_valid <= _GEN_2153;
      end
    end else begin
      btb_39_valid <= _GEN_2153;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_39_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h27 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_39_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_39_tag <= _GEN_807;
      end
    end else begin
      btb_39_tag <= _GEN_807;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_39_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h27 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_39_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_39_branch_type <= _GEN_935;
      end
    end else begin
      btb_39_branch_type <= _GEN_935;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_39_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h27 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_39_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_39_target_address <= _GEN_1655;
      end
    end else begin
      btb_39_target_address <= _GEN_1655;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_39_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h27 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_39_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_39_select <= _GEN_1656;
      end
    end else begin
      btb_39_select <= _GEN_1656;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_39_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h27 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_39_bht <= 2'h1;
        end else begin
          btb_39_bht <= 2'h0;
        end
      end else begin
        btb_39_bht <= _GEN_1657;
      end
    end else begin
      btb_39_bht <= _GEN_1657;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_40_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_40_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_40_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_40_valid <= _GEN_2154;
      end
    end else begin
      btb_40_valid <= _GEN_2154;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_40_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h28 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_40_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_40_tag <= _GEN_808;
      end
    end else begin
      btb_40_tag <= _GEN_808;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_40_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h28 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_40_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_40_branch_type <= _GEN_936;
      end
    end else begin
      btb_40_branch_type <= _GEN_936;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_40_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h28 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_40_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_40_target_address <= _GEN_1658;
      end
    end else begin
      btb_40_target_address <= _GEN_1658;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_40_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h28 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_40_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_40_select <= _GEN_1659;
      end
    end else begin
      btb_40_select <= _GEN_1659;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_40_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h28 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_40_bht <= 2'h1;
        end else begin
          btb_40_bht <= 2'h0;
        end
      end else begin
        btb_40_bht <= _GEN_1660;
      end
    end else begin
      btb_40_bht <= _GEN_1660;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_41_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_41_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_41_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_41_valid <= _GEN_2155;
      end
    end else begin
      btb_41_valid <= _GEN_2155;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_41_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h29 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_41_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_41_tag <= _GEN_809;
      end
    end else begin
      btb_41_tag <= _GEN_809;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_41_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h29 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_41_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_41_branch_type <= _GEN_937;
      end
    end else begin
      btb_41_branch_type <= _GEN_937;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_41_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h29 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_41_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_41_target_address <= _GEN_1661;
      end
    end else begin
      btb_41_target_address <= _GEN_1661;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_41_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h29 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_41_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_41_select <= _GEN_1662;
      end
    end else begin
      btb_41_select <= _GEN_1662;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_41_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h29 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_41_bht <= 2'h1;
        end else begin
          btb_41_bht <= 2'h0;
        end
      end else begin
        btb_41_bht <= _GEN_1663;
      end
    end else begin
      btb_41_bht <= _GEN_1663;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_42_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_42_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_42_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_42_valid <= _GEN_2156;
      end
    end else begin
      btb_42_valid <= _GEN_2156;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_42_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2a == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_42_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_42_tag <= _GEN_810;
      end
    end else begin
      btb_42_tag <= _GEN_810;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_42_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2a == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_42_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_42_branch_type <= _GEN_938;
      end
    end else begin
      btb_42_branch_type <= _GEN_938;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_42_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2a == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_42_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_42_target_address <= _GEN_1664;
      end
    end else begin
      btb_42_target_address <= _GEN_1664;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_42_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2a == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_42_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_42_select <= _GEN_1665;
      end
    end else begin
      btb_42_select <= _GEN_1665;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_42_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2a == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_42_bht <= 2'h1;
        end else begin
          btb_42_bht <= 2'h0;
        end
      end else begin
        btb_42_bht <= _GEN_1666;
      end
    end else begin
      btb_42_bht <= _GEN_1666;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_43_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_43_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_43_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_43_valid <= _GEN_2157;
      end
    end else begin
      btb_43_valid <= _GEN_2157;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_43_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2b == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_43_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_43_tag <= _GEN_811;
      end
    end else begin
      btb_43_tag <= _GEN_811;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_43_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2b == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_43_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_43_branch_type <= _GEN_939;
      end
    end else begin
      btb_43_branch_type <= _GEN_939;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_43_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2b == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_43_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_43_target_address <= _GEN_1667;
      end
    end else begin
      btb_43_target_address <= _GEN_1667;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_43_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2b == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_43_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_43_select <= _GEN_1668;
      end
    end else begin
      btb_43_select <= _GEN_1668;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_43_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2b == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_43_bht <= 2'h1;
        end else begin
          btb_43_bht <= 2'h0;
        end
      end else begin
        btb_43_bht <= _GEN_1669;
      end
    end else begin
      btb_43_bht <= _GEN_1669;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_44_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_44_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_44_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_44_valid <= _GEN_2158;
      end
    end else begin
      btb_44_valid <= _GEN_2158;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_44_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2c == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_44_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_44_tag <= _GEN_812;
      end
    end else begin
      btb_44_tag <= _GEN_812;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_44_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2c == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_44_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_44_branch_type <= _GEN_940;
      end
    end else begin
      btb_44_branch_type <= _GEN_940;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_44_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2c == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_44_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_44_target_address <= _GEN_1670;
      end
    end else begin
      btb_44_target_address <= _GEN_1670;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_44_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2c == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_44_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_44_select <= _GEN_1671;
      end
    end else begin
      btb_44_select <= _GEN_1671;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_44_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2c == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_44_bht <= 2'h1;
        end else begin
          btb_44_bht <= 2'h0;
        end
      end else begin
        btb_44_bht <= _GEN_1672;
      end
    end else begin
      btb_44_bht <= _GEN_1672;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_45_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_45_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_45_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_45_valid <= _GEN_2159;
      end
    end else begin
      btb_45_valid <= _GEN_2159;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_45_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2d == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_45_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_45_tag <= _GEN_813;
      end
    end else begin
      btb_45_tag <= _GEN_813;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_45_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2d == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_45_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_45_branch_type <= _GEN_941;
      end
    end else begin
      btb_45_branch_type <= _GEN_941;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_45_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2d == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_45_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_45_target_address <= _GEN_1673;
      end
    end else begin
      btb_45_target_address <= _GEN_1673;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_45_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2d == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_45_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_45_select <= _GEN_1674;
      end
    end else begin
      btb_45_select <= _GEN_1674;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_45_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2d == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_45_bht <= 2'h1;
        end else begin
          btb_45_bht <= 2'h0;
        end
      end else begin
        btb_45_bht <= _GEN_1675;
      end
    end else begin
      btb_45_bht <= _GEN_1675;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_46_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_46_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_46_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_46_valid <= _GEN_2160;
      end
    end else begin
      btb_46_valid <= _GEN_2160;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_46_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2e == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_46_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_46_tag <= _GEN_814;
      end
    end else begin
      btb_46_tag <= _GEN_814;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_46_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2e == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_46_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_46_branch_type <= _GEN_942;
      end
    end else begin
      btb_46_branch_type <= _GEN_942;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_46_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2e == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_46_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_46_target_address <= _GEN_1676;
      end
    end else begin
      btb_46_target_address <= _GEN_1676;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_46_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2e == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_46_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_46_select <= _GEN_1677;
      end
    end else begin
      btb_46_select <= _GEN_1677;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_46_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2e == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_46_bht <= 2'h1;
        end else begin
          btb_46_bht <= 2'h0;
        end
      end else begin
        btb_46_bht <= _GEN_1678;
      end
    end else begin
      btb_46_bht <= _GEN_1678;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_47_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_47_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_47_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_47_valid <= _GEN_2161;
      end
    end else begin
      btb_47_valid <= _GEN_2161;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_47_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2f == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_47_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_47_tag <= _GEN_815;
      end
    end else begin
      btb_47_tag <= _GEN_815;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_47_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2f == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_47_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_47_branch_type <= _GEN_943;
      end
    end else begin
      btb_47_branch_type <= _GEN_943;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_47_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2f == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_47_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_47_target_address <= _GEN_1679;
      end
    end else begin
      btb_47_target_address <= _GEN_1679;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_47_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2f == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_47_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_47_select <= _GEN_1680;
      end
    end else begin
      btb_47_select <= _GEN_1680;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_47_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h2f == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_47_bht <= 2'h1;
        end else begin
          btb_47_bht <= 2'h0;
        end
      end else begin
        btb_47_bht <= _GEN_1681;
      end
    end else begin
      btb_47_bht <= _GEN_1681;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_48_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_48_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_48_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_48_valid <= _GEN_2162;
      end
    end else begin
      btb_48_valid <= _GEN_2162;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_48_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h30 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_48_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_48_tag <= _GEN_816;
      end
    end else begin
      btb_48_tag <= _GEN_816;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_48_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h30 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_48_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_48_branch_type <= _GEN_944;
      end
    end else begin
      btb_48_branch_type <= _GEN_944;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_48_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h30 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_48_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_48_target_address <= _GEN_1682;
      end
    end else begin
      btb_48_target_address <= _GEN_1682;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_48_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h30 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_48_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_48_select <= _GEN_1683;
      end
    end else begin
      btb_48_select <= _GEN_1683;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_48_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h30 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_48_bht <= 2'h1;
        end else begin
          btb_48_bht <= 2'h0;
        end
      end else begin
        btb_48_bht <= _GEN_1684;
      end
    end else begin
      btb_48_bht <= _GEN_1684;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_49_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_49_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_49_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_49_valid <= _GEN_2163;
      end
    end else begin
      btb_49_valid <= _GEN_2163;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_49_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h31 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_49_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_49_tag <= _GEN_817;
      end
    end else begin
      btb_49_tag <= _GEN_817;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_49_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h31 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_49_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_49_branch_type <= _GEN_945;
      end
    end else begin
      btb_49_branch_type <= _GEN_945;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_49_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h31 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_49_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_49_target_address <= _GEN_1685;
      end
    end else begin
      btb_49_target_address <= _GEN_1685;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_49_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h31 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_49_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_49_select <= _GEN_1686;
      end
    end else begin
      btb_49_select <= _GEN_1686;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_49_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h31 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_49_bht <= 2'h1;
        end else begin
          btb_49_bht <= 2'h0;
        end
      end else begin
        btb_49_bht <= _GEN_1687;
      end
    end else begin
      btb_49_bht <= _GEN_1687;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_50_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_50_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_50_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_50_valid <= _GEN_2164;
      end
    end else begin
      btb_50_valid <= _GEN_2164;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_50_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h32 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_50_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_50_tag <= _GEN_818;
      end
    end else begin
      btb_50_tag <= _GEN_818;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_50_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h32 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_50_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_50_branch_type <= _GEN_946;
      end
    end else begin
      btb_50_branch_type <= _GEN_946;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_50_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h32 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_50_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_50_target_address <= _GEN_1688;
      end
    end else begin
      btb_50_target_address <= _GEN_1688;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_50_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h32 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_50_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_50_select <= _GEN_1689;
      end
    end else begin
      btb_50_select <= _GEN_1689;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_50_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h32 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_50_bht <= 2'h1;
        end else begin
          btb_50_bht <= 2'h0;
        end
      end else begin
        btb_50_bht <= _GEN_1690;
      end
    end else begin
      btb_50_bht <= _GEN_1690;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_51_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_51_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_51_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_51_valid <= _GEN_2165;
      end
    end else begin
      btb_51_valid <= _GEN_2165;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_51_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h33 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_51_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_51_tag <= _GEN_819;
      end
    end else begin
      btb_51_tag <= _GEN_819;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_51_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h33 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_51_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_51_branch_type <= _GEN_947;
      end
    end else begin
      btb_51_branch_type <= _GEN_947;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_51_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h33 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_51_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_51_target_address <= _GEN_1691;
      end
    end else begin
      btb_51_target_address <= _GEN_1691;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_51_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h33 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_51_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_51_select <= _GEN_1692;
      end
    end else begin
      btb_51_select <= _GEN_1692;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_51_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h33 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_51_bht <= 2'h1;
        end else begin
          btb_51_bht <= 2'h0;
        end
      end else begin
        btb_51_bht <= _GEN_1693;
      end
    end else begin
      btb_51_bht <= _GEN_1693;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_52_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_52_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_52_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_52_valid <= _GEN_2166;
      end
    end else begin
      btb_52_valid <= _GEN_2166;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_52_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h34 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_52_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_52_tag <= _GEN_820;
      end
    end else begin
      btb_52_tag <= _GEN_820;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_52_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h34 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_52_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_52_branch_type <= _GEN_948;
      end
    end else begin
      btb_52_branch_type <= _GEN_948;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_52_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h34 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_52_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_52_target_address <= _GEN_1694;
      end
    end else begin
      btb_52_target_address <= _GEN_1694;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_52_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h34 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_52_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_52_select <= _GEN_1695;
      end
    end else begin
      btb_52_select <= _GEN_1695;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_52_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h34 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_52_bht <= 2'h1;
        end else begin
          btb_52_bht <= 2'h0;
        end
      end else begin
        btb_52_bht <= _GEN_1696;
      end
    end else begin
      btb_52_bht <= _GEN_1696;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_53_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_53_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_53_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_53_valid <= _GEN_2167;
      end
    end else begin
      btb_53_valid <= _GEN_2167;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_53_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h35 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_53_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_53_tag <= _GEN_821;
      end
    end else begin
      btb_53_tag <= _GEN_821;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_53_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h35 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_53_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_53_branch_type <= _GEN_949;
      end
    end else begin
      btb_53_branch_type <= _GEN_949;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_53_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h35 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_53_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_53_target_address <= _GEN_1697;
      end
    end else begin
      btb_53_target_address <= _GEN_1697;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_53_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h35 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_53_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_53_select <= _GEN_1698;
      end
    end else begin
      btb_53_select <= _GEN_1698;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_53_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h35 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_53_bht <= 2'h1;
        end else begin
          btb_53_bht <= 2'h0;
        end
      end else begin
        btb_53_bht <= _GEN_1699;
      end
    end else begin
      btb_53_bht <= _GEN_1699;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_54_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_54_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_54_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_54_valid <= _GEN_2168;
      end
    end else begin
      btb_54_valid <= _GEN_2168;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_54_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h36 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_54_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_54_tag <= _GEN_822;
      end
    end else begin
      btb_54_tag <= _GEN_822;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_54_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h36 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_54_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_54_branch_type <= _GEN_950;
      end
    end else begin
      btb_54_branch_type <= _GEN_950;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_54_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h36 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_54_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_54_target_address <= _GEN_1700;
      end
    end else begin
      btb_54_target_address <= _GEN_1700;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_54_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h36 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_54_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_54_select <= _GEN_1701;
      end
    end else begin
      btb_54_select <= _GEN_1701;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_54_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h36 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_54_bht <= 2'h1;
        end else begin
          btb_54_bht <= 2'h0;
        end
      end else begin
        btb_54_bht <= _GEN_1702;
      end
    end else begin
      btb_54_bht <= _GEN_1702;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_55_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_55_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_55_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_55_valid <= _GEN_2169;
      end
    end else begin
      btb_55_valid <= _GEN_2169;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_55_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h37 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_55_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_55_tag <= _GEN_823;
      end
    end else begin
      btb_55_tag <= _GEN_823;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_55_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h37 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_55_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_55_branch_type <= _GEN_951;
      end
    end else begin
      btb_55_branch_type <= _GEN_951;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_55_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h37 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_55_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_55_target_address <= _GEN_1703;
      end
    end else begin
      btb_55_target_address <= _GEN_1703;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_55_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h37 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_55_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_55_select <= _GEN_1704;
      end
    end else begin
      btb_55_select <= _GEN_1704;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_55_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h37 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_55_bht <= 2'h1;
        end else begin
          btb_55_bht <= 2'h0;
        end
      end else begin
        btb_55_bht <= _GEN_1705;
      end
    end else begin
      btb_55_bht <= _GEN_1705;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_56_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_56_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_56_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_56_valid <= _GEN_2170;
      end
    end else begin
      btb_56_valid <= _GEN_2170;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_56_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h38 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_56_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_56_tag <= _GEN_824;
      end
    end else begin
      btb_56_tag <= _GEN_824;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_56_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h38 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_56_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_56_branch_type <= _GEN_952;
      end
    end else begin
      btb_56_branch_type <= _GEN_952;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_56_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h38 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_56_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_56_target_address <= _GEN_1706;
      end
    end else begin
      btb_56_target_address <= _GEN_1706;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_56_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h38 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_56_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_56_select <= _GEN_1707;
      end
    end else begin
      btb_56_select <= _GEN_1707;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_56_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h38 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_56_bht <= 2'h1;
        end else begin
          btb_56_bht <= 2'h0;
        end
      end else begin
        btb_56_bht <= _GEN_1708;
      end
    end else begin
      btb_56_bht <= _GEN_1708;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_57_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_57_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_57_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_57_valid <= _GEN_2171;
      end
    end else begin
      btb_57_valid <= _GEN_2171;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_57_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h39 == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_57_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_57_tag <= _GEN_825;
      end
    end else begin
      btb_57_tag <= _GEN_825;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_57_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h39 == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_57_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_57_branch_type <= _GEN_953;
      end
    end else begin
      btb_57_branch_type <= _GEN_953;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_57_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h39 == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_57_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_57_target_address <= _GEN_1709;
      end
    end else begin
      btb_57_target_address <= _GEN_1709;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_57_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h39 == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_57_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_57_select <= _GEN_1710;
      end
    end else begin
      btb_57_select <= _GEN_1710;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_57_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h39 == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_57_bht <= 2'h1;
        end else begin
          btb_57_bht <= 2'h0;
        end
      end else begin
        btb_57_bht <= _GEN_1711;
      end
    end else begin
      btb_57_bht <= _GEN_1711;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_58_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_58_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_58_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_58_valid <= _GEN_2172;
      end
    end else begin
      btb_58_valid <= _GEN_2172;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_58_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3a == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_58_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_58_tag <= _GEN_826;
      end
    end else begin
      btb_58_tag <= _GEN_826;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_58_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3a == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_58_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_58_branch_type <= _GEN_954;
      end
    end else begin
      btb_58_branch_type <= _GEN_954;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_58_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3a == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_58_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_58_target_address <= _GEN_1712;
      end
    end else begin
      btb_58_target_address <= _GEN_1712;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_58_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3a == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_58_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_58_select <= _GEN_1713;
      end
    end else begin
      btb_58_select <= _GEN_1713;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_58_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3a == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_58_bht <= 2'h1;
        end else begin
          btb_58_bht <= 2'h0;
        end
      end else begin
        btb_58_bht <= _GEN_1714;
      end
    end else begin
      btb_58_bht <= _GEN_1714;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_59_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_59_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_59_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_59_valid <= _GEN_2173;
      end
    end else begin
      btb_59_valid <= _GEN_2173;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_59_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3b == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_59_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_59_tag <= _GEN_827;
      end
    end else begin
      btb_59_tag <= _GEN_827;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_59_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3b == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_59_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_59_branch_type <= _GEN_955;
      end
    end else begin
      btb_59_branch_type <= _GEN_955;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_59_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3b == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_59_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_59_target_address <= _GEN_1715;
      end
    end else begin
      btb_59_target_address <= _GEN_1715;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_59_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3b == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_59_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_59_select <= _GEN_1716;
      end
    end else begin
      btb_59_select <= _GEN_1716;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_59_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3b == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_59_bht <= 2'h1;
        end else begin
          btb_59_bht <= 2'h0;
        end
      end else begin
        btb_59_bht <= _GEN_1717;
      end
    end else begin
      btb_59_bht <= _GEN_1717;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_60_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_60_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_60_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_60_valid <= _GEN_2174;
      end
    end else begin
      btb_60_valid <= _GEN_2174;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_60_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3c == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_60_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_60_tag <= _GEN_828;
      end
    end else begin
      btb_60_tag <= _GEN_828;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_60_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3c == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_60_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_60_branch_type <= _GEN_956;
      end
    end else begin
      btb_60_branch_type <= _GEN_956;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_60_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3c == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_60_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_60_target_address <= _GEN_1718;
      end
    end else begin
      btb_60_target_address <= _GEN_1718;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_60_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3c == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_60_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_60_select <= _GEN_1719;
      end
    end else begin
      btb_60_select <= _GEN_1719;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_60_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3c == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_60_bht <= 2'h1;
        end else begin
          btb_60_bht <= 2'h0;
        end
      end else begin
        btb_60_bht <= _GEN_1720;
      end
    end else begin
      btb_60_bht <= _GEN_1720;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_61_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_61_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_61_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_61_valid <= _GEN_2175;
      end
    end else begin
      btb_61_valid <= _GEN_2175;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_61_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3d == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_61_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_61_tag <= _GEN_829;
      end
    end else begin
      btb_61_tag <= _GEN_829;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_61_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3d == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_61_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_61_branch_type <= _GEN_957;
      end
    end else begin
      btb_61_branch_type <= _GEN_957;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_61_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3d == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_61_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_61_target_address <= _GEN_1721;
      end
    end else begin
      btb_61_target_address <= _GEN_1721;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_61_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3d == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_61_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_61_select <= _GEN_1722;
      end
    end else begin
      btb_61_select <= _GEN_1722;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_61_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3d == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_61_bht <= 2'h1;
        end else begin
          btb_61_bht <= 2'h0;
        end
      end else begin
        btb_61_bht <= _GEN_1723;
      end
    end else begin
      btb_61_bht <= _GEN_1723;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_62_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_62_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_62_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_62_valid <= _GEN_2176;
      end
    end else begin
      btb_62_valid <= _GEN_2176;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_62_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3e == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_62_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_62_tag <= _GEN_830;
      end
    end else begin
      btb_62_tag <= _GEN_830;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_62_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3e == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_62_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_62_branch_type <= _GEN_958;
      end
    end else begin
      btb_62_branch_type <= _GEN_958;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_62_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3e == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_62_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_62_target_address <= _GEN_1724;
      end
    end else begin
      btb_62_target_address <= _GEN_1724;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_62_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3e == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_62_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_62_select <= _GEN_1725;
      end
    end else begin
      btb_62_select <= _GEN_1725;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_62_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3e == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_62_bht <= 2'h1;
        end else begin
          btb_62_bht <= 2'h0;
        end
      end else begin
        btb_62_bht <= _GEN_1726;
      end
    end else begin
      btb_62_bht <= _GEN_1726;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_63_valid <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (io_i_branch_presolve_pack_valid) begin // @[branch_predictor.scala 121:42]
      if (btb_63_tag == io_i_branch_presolve_pack_pc[12:3]) begin // @[branch_predictor.scala 123:68]
        btb_63_valid <= 1'h0; // @[branch_predictor.scala 124:30]
      end else begin
        btb_63_valid <= _GEN_2177;
      end
    end else begin
      btb_63_valid <= _GEN_2177;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_63_tag <= 10'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3f == btb_victim_ptr) begin // @[branch_predictor.scala 112:33]
        btb_63_tag <= io_i_branch_resolve_pack_pc[12:3]; // @[branch_predictor.scala 112:33]
      end else begin
        btb_63_tag <= _GEN_831;
      end
    end else begin
      btb_63_tag <= _GEN_831;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_63_branch_type <= 4'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3f == btb_victim_ptr) begin // @[branch_predictor.scala 114:41]
        btb_63_branch_type <= _btb_btb_victim_ptr_branch_type; // @[branch_predictor.scala 114:41]
      end else begin
        btb_63_branch_type <= _GEN_959;
      end
    end else begin
      btb_63_branch_type <= _GEN_959;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_63_target_address <= 64'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3f == btb_victim_ptr) begin // @[branch_predictor.scala 113:44]
        btb_63_target_address <= io_i_branch_resolve_pack_target; // @[branch_predictor.scala 113:44]
      end else begin
        btb_63_target_address <= _GEN_1727;
      end
    end else begin
      btb_63_target_address <= _GEN_1727;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_63_select <= 1'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3f == btb_victim_ptr) begin // @[branch_predictor.scala 115:36]
        btb_63_select <= io_i_branch_resolve_pack_pc[2]; // @[branch_predictor.scala 115:36]
      end else begin
        btb_63_select <= _GEN_1728;
      end
    end else begin
      btb_63_select <= _GEN_1728;
    end
    if (reset) begin // @[branch_predictor.scala 33:22]
      btb_63_bht <= 2'h0; // @[branch_predictor.scala 33:22]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      if (6'h3f == btb_victim_ptr) begin // @[branch_predictor.scala 116:33]
        if (io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 71:39]
          btb_63_bht <= 2'h1;
        end else begin
          btb_63_bht <= 2'h0;
        end
      end else begin
        btb_63_bht <= _GEN_1729;
      end
    end else begin
      btb_63_bht <= _GEN_1729;
    end
    if (reset) begin // @[branch_predictor.scala 35:33]
      btb_victim_ptr <= 6'h0; // @[branch_predictor.scala 35:33]
    end else if (_T_131 & ~entry_found) begin // @[branch_predictor.scala 110:103]
      btb_victim_ptr <= _btb_victim_ptr_T_1; // @[branch_predictor.scala 119:24]
    end else if (io_i_branch_resolve_pack_valid & ~io_i_branch_resolve_pack_prediction_valid &
      io_i_branch_resolve_pack_taken) begin // @[branch_predictor.scala 65:121]
      btb_victim_ptr <= _btb_victim_ptr_T_1; // @[branch_predictor.scala 74:24]
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
  btb_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  btb_0_tag = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  btb_0_branch_type = _RAND_2[3:0];
  _RAND_3 = {2{`RANDOM}};
  btb_0_target_address = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  btb_0_select = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  btb_0_bht = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  btb_1_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  btb_1_tag = _RAND_7[9:0];
  _RAND_8 = {1{`RANDOM}};
  btb_1_branch_type = _RAND_8[3:0];
  _RAND_9 = {2{`RANDOM}};
  btb_1_target_address = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  btb_1_select = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  btb_1_bht = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  btb_2_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  btb_2_tag = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  btb_2_branch_type = _RAND_14[3:0];
  _RAND_15 = {2{`RANDOM}};
  btb_2_target_address = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  btb_2_select = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  btb_2_bht = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  btb_3_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  btb_3_tag = _RAND_19[9:0];
  _RAND_20 = {1{`RANDOM}};
  btb_3_branch_type = _RAND_20[3:0];
  _RAND_21 = {2{`RANDOM}};
  btb_3_target_address = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  btb_3_select = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  btb_3_bht = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  btb_4_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  btb_4_tag = _RAND_25[9:0];
  _RAND_26 = {1{`RANDOM}};
  btb_4_branch_type = _RAND_26[3:0];
  _RAND_27 = {2{`RANDOM}};
  btb_4_target_address = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  btb_4_select = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  btb_4_bht = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  btb_5_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  btb_5_tag = _RAND_31[9:0];
  _RAND_32 = {1{`RANDOM}};
  btb_5_branch_type = _RAND_32[3:0];
  _RAND_33 = {2{`RANDOM}};
  btb_5_target_address = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  btb_5_select = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  btb_5_bht = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  btb_6_valid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  btb_6_tag = _RAND_37[9:0];
  _RAND_38 = {1{`RANDOM}};
  btb_6_branch_type = _RAND_38[3:0];
  _RAND_39 = {2{`RANDOM}};
  btb_6_target_address = _RAND_39[63:0];
  _RAND_40 = {1{`RANDOM}};
  btb_6_select = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  btb_6_bht = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  btb_7_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  btb_7_tag = _RAND_43[9:0];
  _RAND_44 = {1{`RANDOM}};
  btb_7_branch_type = _RAND_44[3:0];
  _RAND_45 = {2{`RANDOM}};
  btb_7_target_address = _RAND_45[63:0];
  _RAND_46 = {1{`RANDOM}};
  btb_7_select = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  btb_7_bht = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  btb_8_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  btb_8_tag = _RAND_49[9:0];
  _RAND_50 = {1{`RANDOM}};
  btb_8_branch_type = _RAND_50[3:0];
  _RAND_51 = {2{`RANDOM}};
  btb_8_target_address = _RAND_51[63:0];
  _RAND_52 = {1{`RANDOM}};
  btb_8_select = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  btb_8_bht = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  btb_9_valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  btb_9_tag = _RAND_55[9:0];
  _RAND_56 = {1{`RANDOM}};
  btb_9_branch_type = _RAND_56[3:0];
  _RAND_57 = {2{`RANDOM}};
  btb_9_target_address = _RAND_57[63:0];
  _RAND_58 = {1{`RANDOM}};
  btb_9_select = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  btb_9_bht = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  btb_10_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  btb_10_tag = _RAND_61[9:0];
  _RAND_62 = {1{`RANDOM}};
  btb_10_branch_type = _RAND_62[3:0];
  _RAND_63 = {2{`RANDOM}};
  btb_10_target_address = _RAND_63[63:0];
  _RAND_64 = {1{`RANDOM}};
  btb_10_select = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  btb_10_bht = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  btb_11_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  btb_11_tag = _RAND_67[9:0];
  _RAND_68 = {1{`RANDOM}};
  btb_11_branch_type = _RAND_68[3:0];
  _RAND_69 = {2{`RANDOM}};
  btb_11_target_address = _RAND_69[63:0];
  _RAND_70 = {1{`RANDOM}};
  btb_11_select = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  btb_11_bht = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  btb_12_valid = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  btb_12_tag = _RAND_73[9:0];
  _RAND_74 = {1{`RANDOM}};
  btb_12_branch_type = _RAND_74[3:0];
  _RAND_75 = {2{`RANDOM}};
  btb_12_target_address = _RAND_75[63:0];
  _RAND_76 = {1{`RANDOM}};
  btb_12_select = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  btb_12_bht = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  btb_13_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  btb_13_tag = _RAND_79[9:0];
  _RAND_80 = {1{`RANDOM}};
  btb_13_branch_type = _RAND_80[3:0];
  _RAND_81 = {2{`RANDOM}};
  btb_13_target_address = _RAND_81[63:0];
  _RAND_82 = {1{`RANDOM}};
  btb_13_select = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  btb_13_bht = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  btb_14_valid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  btb_14_tag = _RAND_85[9:0];
  _RAND_86 = {1{`RANDOM}};
  btb_14_branch_type = _RAND_86[3:0];
  _RAND_87 = {2{`RANDOM}};
  btb_14_target_address = _RAND_87[63:0];
  _RAND_88 = {1{`RANDOM}};
  btb_14_select = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  btb_14_bht = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  btb_15_valid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  btb_15_tag = _RAND_91[9:0];
  _RAND_92 = {1{`RANDOM}};
  btb_15_branch_type = _RAND_92[3:0];
  _RAND_93 = {2{`RANDOM}};
  btb_15_target_address = _RAND_93[63:0];
  _RAND_94 = {1{`RANDOM}};
  btb_15_select = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  btb_15_bht = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  btb_16_valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  btb_16_tag = _RAND_97[9:0];
  _RAND_98 = {1{`RANDOM}};
  btb_16_branch_type = _RAND_98[3:0];
  _RAND_99 = {2{`RANDOM}};
  btb_16_target_address = _RAND_99[63:0];
  _RAND_100 = {1{`RANDOM}};
  btb_16_select = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  btb_16_bht = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  btb_17_valid = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  btb_17_tag = _RAND_103[9:0];
  _RAND_104 = {1{`RANDOM}};
  btb_17_branch_type = _RAND_104[3:0];
  _RAND_105 = {2{`RANDOM}};
  btb_17_target_address = _RAND_105[63:0];
  _RAND_106 = {1{`RANDOM}};
  btb_17_select = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  btb_17_bht = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  btb_18_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  btb_18_tag = _RAND_109[9:0];
  _RAND_110 = {1{`RANDOM}};
  btb_18_branch_type = _RAND_110[3:0];
  _RAND_111 = {2{`RANDOM}};
  btb_18_target_address = _RAND_111[63:0];
  _RAND_112 = {1{`RANDOM}};
  btb_18_select = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  btb_18_bht = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  btb_19_valid = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  btb_19_tag = _RAND_115[9:0];
  _RAND_116 = {1{`RANDOM}};
  btb_19_branch_type = _RAND_116[3:0];
  _RAND_117 = {2{`RANDOM}};
  btb_19_target_address = _RAND_117[63:0];
  _RAND_118 = {1{`RANDOM}};
  btb_19_select = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  btb_19_bht = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  btb_20_valid = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  btb_20_tag = _RAND_121[9:0];
  _RAND_122 = {1{`RANDOM}};
  btb_20_branch_type = _RAND_122[3:0];
  _RAND_123 = {2{`RANDOM}};
  btb_20_target_address = _RAND_123[63:0];
  _RAND_124 = {1{`RANDOM}};
  btb_20_select = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  btb_20_bht = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  btb_21_valid = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  btb_21_tag = _RAND_127[9:0];
  _RAND_128 = {1{`RANDOM}};
  btb_21_branch_type = _RAND_128[3:0];
  _RAND_129 = {2{`RANDOM}};
  btb_21_target_address = _RAND_129[63:0];
  _RAND_130 = {1{`RANDOM}};
  btb_21_select = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  btb_21_bht = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  btb_22_valid = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  btb_22_tag = _RAND_133[9:0];
  _RAND_134 = {1{`RANDOM}};
  btb_22_branch_type = _RAND_134[3:0];
  _RAND_135 = {2{`RANDOM}};
  btb_22_target_address = _RAND_135[63:0];
  _RAND_136 = {1{`RANDOM}};
  btb_22_select = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  btb_22_bht = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  btb_23_valid = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  btb_23_tag = _RAND_139[9:0];
  _RAND_140 = {1{`RANDOM}};
  btb_23_branch_type = _RAND_140[3:0];
  _RAND_141 = {2{`RANDOM}};
  btb_23_target_address = _RAND_141[63:0];
  _RAND_142 = {1{`RANDOM}};
  btb_23_select = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  btb_23_bht = _RAND_143[1:0];
  _RAND_144 = {1{`RANDOM}};
  btb_24_valid = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  btb_24_tag = _RAND_145[9:0];
  _RAND_146 = {1{`RANDOM}};
  btb_24_branch_type = _RAND_146[3:0];
  _RAND_147 = {2{`RANDOM}};
  btb_24_target_address = _RAND_147[63:0];
  _RAND_148 = {1{`RANDOM}};
  btb_24_select = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  btb_24_bht = _RAND_149[1:0];
  _RAND_150 = {1{`RANDOM}};
  btb_25_valid = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  btb_25_tag = _RAND_151[9:0];
  _RAND_152 = {1{`RANDOM}};
  btb_25_branch_type = _RAND_152[3:0];
  _RAND_153 = {2{`RANDOM}};
  btb_25_target_address = _RAND_153[63:0];
  _RAND_154 = {1{`RANDOM}};
  btb_25_select = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  btb_25_bht = _RAND_155[1:0];
  _RAND_156 = {1{`RANDOM}};
  btb_26_valid = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  btb_26_tag = _RAND_157[9:0];
  _RAND_158 = {1{`RANDOM}};
  btb_26_branch_type = _RAND_158[3:0];
  _RAND_159 = {2{`RANDOM}};
  btb_26_target_address = _RAND_159[63:0];
  _RAND_160 = {1{`RANDOM}};
  btb_26_select = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  btb_26_bht = _RAND_161[1:0];
  _RAND_162 = {1{`RANDOM}};
  btb_27_valid = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  btb_27_tag = _RAND_163[9:0];
  _RAND_164 = {1{`RANDOM}};
  btb_27_branch_type = _RAND_164[3:0];
  _RAND_165 = {2{`RANDOM}};
  btb_27_target_address = _RAND_165[63:0];
  _RAND_166 = {1{`RANDOM}};
  btb_27_select = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  btb_27_bht = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  btb_28_valid = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  btb_28_tag = _RAND_169[9:0];
  _RAND_170 = {1{`RANDOM}};
  btb_28_branch_type = _RAND_170[3:0];
  _RAND_171 = {2{`RANDOM}};
  btb_28_target_address = _RAND_171[63:0];
  _RAND_172 = {1{`RANDOM}};
  btb_28_select = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  btb_28_bht = _RAND_173[1:0];
  _RAND_174 = {1{`RANDOM}};
  btb_29_valid = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  btb_29_tag = _RAND_175[9:0];
  _RAND_176 = {1{`RANDOM}};
  btb_29_branch_type = _RAND_176[3:0];
  _RAND_177 = {2{`RANDOM}};
  btb_29_target_address = _RAND_177[63:0];
  _RAND_178 = {1{`RANDOM}};
  btb_29_select = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  btb_29_bht = _RAND_179[1:0];
  _RAND_180 = {1{`RANDOM}};
  btb_30_valid = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  btb_30_tag = _RAND_181[9:0];
  _RAND_182 = {1{`RANDOM}};
  btb_30_branch_type = _RAND_182[3:0];
  _RAND_183 = {2{`RANDOM}};
  btb_30_target_address = _RAND_183[63:0];
  _RAND_184 = {1{`RANDOM}};
  btb_30_select = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  btb_30_bht = _RAND_185[1:0];
  _RAND_186 = {1{`RANDOM}};
  btb_31_valid = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  btb_31_tag = _RAND_187[9:0];
  _RAND_188 = {1{`RANDOM}};
  btb_31_branch_type = _RAND_188[3:0];
  _RAND_189 = {2{`RANDOM}};
  btb_31_target_address = _RAND_189[63:0];
  _RAND_190 = {1{`RANDOM}};
  btb_31_select = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  btb_31_bht = _RAND_191[1:0];
  _RAND_192 = {1{`RANDOM}};
  btb_32_valid = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  btb_32_tag = _RAND_193[9:0];
  _RAND_194 = {1{`RANDOM}};
  btb_32_branch_type = _RAND_194[3:0];
  _RAND_195 = {2{`RANDOM}};
  btb_32_target_address = _RAND_195[63:0];
  _RAND_196 = {1{`RANDOM}};
  btb_32_select = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  btb_32_bht = _RAND_197[1:0];
  _RAND_198 = {1{`RANDOM}};
  btb_33_valid = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  btb_33_tag = _RAND_199[9:0];
  _RAND_200 = {1{`RANDOM}};
  btb_33_branch_type = _RAND_200[3:0];
  _RAND_201 = {2{`RANDOM}};
  btb_33_target_address = _RAND_201[63:0];
  _RAND_202 = {1{`RANDOM}};
  btb_33_select = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  btb_33_bht = _RAND_203[1:0];
  _RAND_204 = {1{`RANDOM}};
  btb_34_valid = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  btb_34_tag = _RAND_205[9:0];
  _RAND_206 = {1{`RANDOM}};
  btb_34_branch_type = _RAND_206[3:0];
  _RAND_207 = {2{`RANDOM}};
  btb_34_target_address = _RAND_207[63:0];
  _RAND_208 = {1{`RANDOM}};
  btb_34_select = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  btb_34_bht = _RAND_209[1:0];
  _RAND_210 = {1{`RANDOM}};
  btb_35_valid = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  btb_35_tag = _RAND_211[9:0];
  _RAND_212 = {1{`RANDOM}};
  btb_35_branch_type = _RAND_212[3:0];
  _RAND_213 = {2{`RANDOM}};
  btb_35_target_address = _RAND_213[63:0];
  _RAND_214 = {1{`RANDOM}};
  btb_35_select = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  btb_35_bht = _RAND_215[1:0];
  _RAND_216 = {1{`RANDOM}};
  btb_36_valid = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  btb_36_tag = _RAND_217[9:0];
  _RAND_218 = {1{`RANDOM}};
  btb_36_branch_type = _RAND_218[3:0];
  _RAND_219 = {2{`RANDOM}};
  btb_36_target_address = _RAND_219[63:0];
  _RAND_220 = {1{`RANDOM}};
  btb_36_select = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  btb_36_bht = _RAND_221[1:0];
  _RAND_222 = {1{`RANDOM}};
  btb_37_valid = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  btb_37_tag = _RAND_223[9:0];
  _RAND_224 = {1{`RANDOM}};
  btb_37_branch_type = _RAND_224[3:0];
  _RAND_225 = {2{`RANDOM}};
  btb_37_target_address = _RAND_225[63:0];
  _RAND_226 = {1{`RANDOM}};
  btb_37_select = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  btb_37_bht = _RAND_227[1:0];
  _RAND_228 = {1{`RANDOM}};
  btb_38_valid = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  btb_38_tag = _RAND_229[9:0];
  _RAND_230 = {1{`RANDOM}};
  btb_38_branch_type = _RAND_230[3:0];
  _RAND_231 = {2{`RANDOM}};
  btb_38_target_address = _RAND_231[63:0];
  _RAND_232 = {1{`RANDOM}};
  btb_38_select = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  btb_38_bht = _RAND_233[1:0];
  _RAND_234 = {1{`RANDOM}};
  btb_39_valid = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  btb_39_tag = _RAND_235[9:0];
  _RAND_236 = {1{`RANDOM}};
  btb_39_branch_type = _RAND_236[3:0];
  _RAND_237 = {2{`RANDOM}};
  btb_39_target_address = _RAND_237[63:0];
  _RAND_238 = {1{`RANDOM}};
  btb_39_select = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  btb_39_bht = _RAND_239[1:0];
  _RAND_240 = {1{`RANDOM}};
  btb_40_valid = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  btb_40_tag = _RAND_241[9:0];
  _RAND_242 = {1{`RANDOM}};
  btb_40_branch_type = _RAND_242[3:0];
  _RAND_243 = {2{`RANDOM}};
  btb_40_target_address = _RAND_243[63:0];
  _RAND_244 = {1{`RANDOM}};
  btb_40_select = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  btb_40_bht = _RAND_245[1:0];
  _RAND_246 = {1{`RANDOM}};
  btb_41_valid = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  btb_41_tag = _RAND_247[9:0];
  _RAND_248 = {1{`RANDOM}};
  btb_41_branch_type = _RAND_248[3:0];
  _RAND_249 = {2{`RANDOM}};
  btb_41_target_address = _RAND_249[63:0];
  _RAND_250 = {1{`RANDOM}};
  btb_41_select = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  btb_41_bht = _RAND_251[1:0];
  _RAND_252 = {1{`RANDOM}};
  btb_42_valid = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  btb_42_tag = _RAND_253[9:0];
  _RAND_254 = {1{`RANDOM}};
  btb_42_branch_type = _RAND_254[3:0];
  _RAND_255 = {2{`RANDOM}};
  btb_42_target_address = _RAND_255[63:0];
  _RAND_256 = {1{`RANDOM}};
  btb_42_select = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  btb_42_bht = _RAND_257[1:0];
  _RAND_258 = {1{`RANDOM}};
  btb_43_valid = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  btb_43_tag = _RAND_259[9:0];
  _RAND_260 = {1{`RANDOM}};
  btb_43_branch_type = _RAND_260[3:0];
  _RAND_261 = {2{`RANDOM}};
  btb_43_target_address = _RAND_261[63:0];
  _RAND_262 = {1{`RANDOM}};
  btb_43_select = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  btb_43_bht = _RAND_263[1:0];
  _RAND_264 = {1{`RANDOM}};
  btb_44_valid = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  btb_44_tag = _RAND_265[9:0];
  _RAND_266 = {1{`RANDOM}};
  btb_44_branch_type = _RAND_266[3:0];
  _RAND_267 = {2{`RANDOM}};
  btb_44_target_address = _RAND_267[63:0];
  _RAND_268 = {1{`RANDOM}};
  btb_44_select = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  btb_44_bht = _RAND_269[1:0];
  _RAND_270 = {1{`RANDOM}};
  btb_45_valid = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  btb_45_tag = _RAND_271[9:0];
  _RAND_272 = {1{`RANDOM}};
  btb_45_branch_type = _RAND_272[3:0];
  _RAND_273 = {2{`RANDOM}};
  btb_45_target_address = _RAND_273[63:0];
  _RAND_274 = {1{`RANDOM}};
  btb_45_select = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  btb_45_bht = _RAND_275[1:0];
  _RAND_276 = {1{`RANDOM}};
  btb_46_valid = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  btb_46_tag = _RAND_277[9:0];
  _RAND_278 = {1{`RANDOM}};
  btb_46_branch_type = _RAND_278[3:0];
  _RAND_279 = {2{`RANDOM}};
  btb_46_target_address = _RAND_279[63:0];
  _RAND_280 = {1{`RANDOM}};
  btb_46_select = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  btb_46_bht = _RAND_281[1:0];
  _RAND_282 = {1{`RANDOM}};
  btb_47_valid = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  btb_47_tag = _RAND_283[9:0];
  _RAND_284 = {1{`RANDOM}};
  btb_47_branch_type = _RAND_284[3:0];
  _RAND_285 = {2{`RANDOM}};
  btb_47_target_address = _RAND_285[63:0];
  _RAND_286 = {1{`RANDOM}};
  btb_47_select = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  btb_47_bht = _RAND_287[1:0];
  _RAND_288 = {1{`RANDOM}};
  btb_48_valid = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  btb_48_tag = _RAND_289[9:0];
  _RAND_290 = {1{`RANDOM}};
  btb_48_branch_type = _RAND_290[3:0];
  _RAND_291 = {2{`RANDOM}};
  btb_48_target_address = _RAND_291[63:0];
  _RAND_292 = {1{`RANDOM}};
  btb_48_select = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  btb_48_bht = _RAND_293[1:0];
  _RAND_294 = {1{`RANDOM}};
  btb_49_valid = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  btb_49_tag = _RAND_295[9:0];
  _RAND_296 = {1{`RANDOM}};
  btb_49_branch_type = _RAND_296[3:0];
  _RAND_297 = {2{`RANDOM}};
  btb_49_target_address = _RAND_297[63:0];
  _RAND_298 = {1{`RANDOM}};
  btb_49_select = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  btb_49_bht = _RAND_299[1:0];
  _RAND_300 = {1{`RANDOM}};
  btb_50_valid = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  btb_50_tag = _RAND_301[9:0];
  _RAND_302 = {1{`RANDOM}};
  btb_50_branch_type = _RAND_302[3:0];
  _RAND_303 = {2{`RANDOM}};
  btb_50_target_address = _RAND_303[63:0];
  _RAND_304 = {1{`RANDOM}};
  btb_50_select = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  btb_50_bht = _RAND_305[1:0];
  _RAND_306 = {1{`RANDOM}};
  btb_51_valid = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  btb_51_tag = _RAND_307[9:0];
  _RAND_308 = {1{`RANDOM}};
  btb_51_branch_type = _RAND_308[3:0];
  _RAND_309 = {2{`RANDOM}};
  btb_51_target_address = _RAND_309[63:0];
  _RAND_310 = {1{`RANDOM}};
  btb_51_select = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  btb_51_bht = _RAND_311[1:0];
  _RAND_312 = {1{`RANDOM}};
  btb_52_valid = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  btb_52_tag = _RAND_313[9:0];
  _RAND_314 = {1{`RANDOM}};
  btb_52_branch_type = _RAND_314[3:0];
  _RAND_315 = {2{`RANDOM}};
  btb_52_target_address = _RAND_315[63:0];
  _RAND_316 = {1{`RANDOM}};
  btb_52_select = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  btb_52_bht = _RAND_317[1:0];
  _RAND_318 = {1{`RANDOM}};
  btb_53_valid = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  btb_53_tag = _RAND_319[9:0];
  _RAND_320 = {1{`RANDOM}};
  btb_53_branch_type = _RAND_320[3:0];
  _RAND_321 = {2{`RANDOM}};
  btb_53_target_address = _RAND_321[63:0];
  _RAND_322 = {1{`RANDOM}};
  btb_53_select = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  btb_53_bht = _RAND_323[1:0];
  _RAND_324 = {1{`RANDOM}};
  btb_54_valid = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  btb_54_tag = _RAND_325[9:0];
  _RAND_326 = {1{`RANDOM}};
  btb_54_branch_type = _RAND_326[3:0];
  _RAND_327 = {2{`RANDOM}};
  btb_54_target_address = _RAND_327[63:0];
  _RAND_328 = {1{`RANDOM}};
  btb_54_select = _RAND_328[0:0];
  _RAND_329 = {1{`RANDOM}};
  btb_54_bht = _RAND_329[1:0];
  _RAND_330 = {1{`RANDOM}};
  btb_55_valid = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  btb_55_tag = _RAND_331[9:0];
  _RAND_332 = {1{`RANDOM}};
  btb_55_branch_type = _RAND_332[3:0];
  _RAND_333 = {2{`RANDOM}};
  btb_55_target_address = _RAND_333[63:0];
  _RAND_334 = {1{`RANDOM}};
  btb_55_select = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  btb_55_bht = _RAND_335[1:0];
  _RAND_336 = {1{`RANDOM}};
  btb_56_valid = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  btb_56_tag = _RAND_337[9:0];
  _RAND_338 = {1{`RANDOM}};
  btb_56_branch_type = _RAND_338[3:0];
  _RAND_339 = {2{`RANDOM}};
  btb_56_target_address = _RAND_339[63:0];
  _RAND_340 = {1{`RANDOM}};
  btb_56_select = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  btb_56_bht = _RAND_341[1:0];
  _RAND_342 = {1{`RANDOM}};
  btb_57_valid = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  btb_57_tag = _RAND_343[9:0];
  _RAND_344 = {1{`RANDOM}};
  btb_57_branch_type = _RAND_344[3:0];
  _RAND_345 = {2{`RANDOM}};
  btb_57_target_address = _RAND_345[63:0];
  _RAND_346 = {1{`RANDOM}};
  btb_57_select = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  btb_57_bht = _RAND_347[1:0];
  _RAND_348 = {1{`RANDOM}};
  btb_58_valid = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  btb_58_tag = _RAND_349[9:0];
  _RAND_350 = {1{`RANDOM}};
  btb_58_branch_type = _RAND_350[3:0];
  _RAND_351 = {2{`RANDOM}};
  btb_58_target_address = _RAND_351[63:0];
  _RAND_352 = {1{`RANDOM}};
  btb_58_select = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  btb_58_bht = _RAND_353[1:0];
  _RAND_354 = {1{`RANDOM}};
  btb_59_valid = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  btb_59_tag = _RAND_355[9:0];
  _RAND_356 = {1{`RANDOM}};
  btb_59_branch_type = _RAND_356[3:0];
  _RAND_357 = {2{`RANDOM}};
  btb_59_target_address = _RAND_357[63:0];
  _RAND_358 = {1{`RANDOM}};
  btb_59_select = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  btb_59_bht = _RAND_359[1:0];
  _RAND_360 = {1{`RANDOM}};
  btb_60_valid = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  btb_60_tag = _RAND_361[9:0];
  _RAND_362 = {1{`RANDOM}};
  btb_60_branch_type = _RAND_362[3:0];
  _RAND_363 = {2{`RANDOM}};
  btb_60_target_address = _RAND_363[63:0];
  _RAND_364 = {1{`RANDOM}};
  btb_60_select = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  btb_60_bht = _RAND_365[1:0];
  _RAND_366 = {1{`RANDOM}};
  btb_61_valid = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  btb_61_tag = _RAND_367[9:0];
  _RAND_368 = {1{`RANDOM}};
  btb_61_branch_type = _RAND_368[3:0];
  _RAND_369 = {2{`RANDOM}};
  btb_61_target_address = _RAND_369[63:0];
  _RAND_370 = {1{`RANDOM}};
  btb_61_select = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  btb_61_bht = _RAND_371[1:0];
  _RAND_372 = {1{`RANDOM}};
  btb_62_valid = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  btb_62_tag = _RAND_373[9:0];
  _RAND_374 = {1{`RANDOM}};
  btb_62_branch_type = _RAND_374[3:0];
  _RAND_375 = {2{`RANDOM}};
  btb_62_target_address = _RAND_375[63:0];
  _RAND_376 = {1{`RANDOM}};
  btb_62_select = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  btb_62_bht = _RAND_377[1:0];
  _RAND_378 = {1{`RANDOM}};
  btb_63_valid = _RAND_378[0:0];
  _RAND_379 = {1{`RANDOM}};
  btb_63_tag = _RAND_379[9:0];
  _RAND_380 = {1{`RANDOM}};
  btb_63_branch_type = _RAND_380[3:0];
  _RAND_381 = {2{`RANDOM}};
  btb_63_target_address = _RAND_381[63:0];
  _RAND_382 = {1{`RANDOM}};
  btb_63_select = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  btb_63_bht = _RAND_383[1:0];
  _RAND_384 = {1{`RANDOM}};
  btb_victim_ptr = _RAND_384[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
