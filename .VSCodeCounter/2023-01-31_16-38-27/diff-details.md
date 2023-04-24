# Diff Details

Date : 2023-01-31 16:38:27

Directory d:\\StudyDocuments\\OOOCoreDesign\\sbttest\\chisel-template - ladder_be\\src\\test\\scala\\ladder

Total : 70 files,  -146078 codes, 470 comments, 454 blanks, all -145154 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [genrtl/ALU.v](/genrtl/ALU.v) | Verilog | -349 | -1 | -1 | -351 |
| [genrtl/Arch_RegFile.v](/genrtl/Arch_RegFile.v) | Verilog | -4,259 | 0 | -1 | -4,260 |
| [genrtl/BPU.v](/genrtl/BPU.v) | Verilog | -56,061 | -1 | -1 | -56,063 |
| [genrtl/BRU.v](/genrtl/BRU.v) | Verilog | -312 | -1 | -1 | -314 |
| [genrtl/Back_End_With_Decode.anno.json](/genrtl/Back_End_With_Decode.anno.json) | JSON | -17,589 | 0 | 0 | -17,589 |
| [genrtl/Back_End_With_Decode.v](/genrtl/Back_End_With_Decode.v) | Verilog | -2,556 | 0 | -1 | -2,557 |
| [genrtl/Branch_Presolve.v](/genrtl/Branch_Presolve.v) | Verilog | -61 | 0 | -1 | -62 |
| [genrtl/Busy_Table.v](/genrtl/Busy_Table.v) | Verilog | -565 | -1 | -1 | -567 |
| [genrtl/CSR.v](/genrtl/CSR.v) | Verilog | -239 | -1 | -1 | -241 |
| [genrtl/CSR_BF.v](/genrtl/CSR_BF.v) | Verilog | -197 | -1 | -1 | -199 |
| [genrtl/DIV.v](/genrtl/DIV.v) | Verilog | -255 | -1 | -1 | -257 |
| [genrtl/Decoder.v](/genrtl/Decoder.v) | Verilog | -1,740 | -1 | -1 | -1,742 |
| [genrtl/Dispatch.v](/genrtl/Dispatch.v) | Verilog | -635 | -1 | -1 | -637 |
| [genrtl/Divider.v](/genrtl/Divider.v) | Verilog | -173 | -1 | -1 | -175 |
| [genrtl/Execute.v](/genrtl/Execute.v) | Verilog | -1,251 | 0 | -1 | -1,252 |
| [genrtl/Fetch_Queue.v](/genrtl/Fetch_Queue.v) | Verilog | -102 | 0 | -1 | -103 |
| [genrtl/Fetch_Res.v](/genrtl/Fetch_Res.v) | Verilog | -30 | 0 | -1 | -31 |
| [genrtl/Front_End.anno.json](/genrtl/Front_End.anno.json) | JSON | -32 | 0 | 0 | -32 |
| [genrtl/Front_End.v](/genrtl/Front_End.v) | Verilog | -378 | 0 | -1 | -379 |
| [genrtl/Full_Adder.v](/genrtl/Full_Adder.v) | Verilog | -10 | 0 | -1 | -11 |
| [genrtl/IF1_IF2.v](/genrtl/IF1_IF2.v) | Verilog | -120 | -1 | -1 | -122 |
| [genrtl/IF2_IF3.v](/genrtl/IF2_IF3.v) | Verilog | -121 | -1 | -1 | -123 |
| [genrtl/LSU.v](/genrtl/LSU.v) | Verilog | -280 | -1 | -1 | -282 |
| [genrtl/MUL.v](/genrtl/MUL.v) | Verilog | -268 | -1 | -1 | -270 |
| [genrtl/Multiplier.v](/genrtl/Multiplier.v) | Verilog | -238 | -1 | -1 | -240 |
| [genrtl/PC_Gen.v](/genrtl/PC_Gen.v) | Verilog | -85 | -1 | -1 | -87 |
| [genrtl/Partial_Products_Gen.v](/genrtl/Partial_Products_Gen.v) | Verilog | -958 | 0 | -1 | -959 |
| [genrtl/Queue.v](/genrtl/Queue.v) | Verilog | -353 | -1 | -1 | -355 |
| [genrtl/RegFile.v](/genrtl/RegFile.v) | Verilog | -3,149 | -1 | -1 | -3,151 |
| [genrtl/Rename.v](/genrtl/Rename.v) | Verilog | -1,017 | -1 | -1 | -1,019 |
| [genrtl/Rename_Table.v](/genrtl/Rename_Table.v) | Verilog | -1,676 | -1 | -1 | -1,678 |
| [genrtl/Reorder_Buffer.v](/genrtl/Reorder_Buffer.v) | Verilog | -25,660 | -1 | -1 | -25,662 |
| [genrtl/Reservation_Station.v](/genrtl/Reservation_Station.v) | Verilog | -21,036 | -1 | -1 | -21,038 |
| [genrtl/Reservation_Station_Slot.v](/genrtl/Reservation_Station_Slot.v) | Verilog | -564 | -1 | -1 | -566 |
| [genrtl/Wallace_Tree.v](/genrtl/Wallace_Tree.v) | Verilog | -6,091 | 0 | -1 | -6,092 |
| [genrtl/Wallace_Tree_Cell.v](/genrtl/Wallace_Tree_Cell.v) | Verilog | -334 | 0 | -1 | -335 |
| [genrtl/front_end_control.v](/genrtl/front_end_control.v) | Verilog | -25 | 0 | -1 | -26 |
| [src/test/scala/ladder/back_end/arch_regfile.scala](/src/test/scala/ladder/back_end/arch_regfile.scala) | Scala | 17 | 0 | 3 | 20 |
| [src/test/scala/ladder/back_end/commit/rob.scala](/src/test/scala/ladder/back_end/commit/rob.scala) | Scala | 161 | 40 | 31 | 232 |
| [src/test/scala/ladder/back_end/csr.scala](/src/test/scala/ladder/back_end/csr.scala) | Scala | 86 | 7 | 8 | 101 |
| [src/test/scala/ladder/back_end/decoder.scala](/src/test/scala/ladder/back_end/decoder.scala) | Scala | 115 | 9 | 10 | 134 |
| [src/test/scala/ladder/back_end/dispatch/dispatch.scala](/src/test/scala/ladder/back_end/dispatch/dispatch.scala) | Scala | 38 | 8 | 6 | 52 |
| [src/test/scala/ladder/back_end/execute/execute.scala](/src/test/scala/ladder/back_end/execute/execute.scala) | Scala | 120 | 33 | 33 | 186 |
| [src/test/scala/ladder/back_end/execute/execute_unit.scala](/src/test/scala/ladder/back_end/execute/execute_unit.scala) | Scala | 343 | 30 | 68 | 441 |
| [src/test/scala/ladder/back_end/execute/mul_div/booth.scala](/src/test/scala/ladder/back_end/execute/mul_div/booth.scala) | Scala | 56 | 1 | 6 | 63 |
| [src/test/scala/ladder/back_end/execute/mul_div/div.scala](/src/test/scala/ladder/back_end/execute/mul_div/div.scala) | Scala | 103 | 2 | 18 | 123 |
| [src/test/scala/ladder/back_end/execute/mul_div/mul.scala](/src/test/scala/ladder/back_end/execute/mul_div/mul.scala) | Scala | 71 | 9 | 13 | 93 |
| [src/test/scala/ladder/back_end/execute/mul_div/wallace_tree.scala](/src/test/scala/ladder/back_end/execute/mul_div/wallace_tree.scala) | Scala | 127 | 11 | 23 | 161 |
| [src/test/scala/ladder/back_end/issue/reservation_station.scala](/src/test/scala/ladder/back_end/issue/reservation_station.scala) | Scala | 109 | 32 | 30 | 171 |
| [src/test/scala/ladder/back_end/issue/reservation_station_slot.scala](/src/test/scala/ladder/back_end/issue/reservation_station_slot.scala) | Scala | 137 | 9 | 31 | 177 |
| [src/test/scala/ladder/back_end/regfile.scala](/src/test/scala/ladder/back_end/regfile.scala) | Scala | 53 | 2 | 12 | 67 |
| [src/test/scala/ladder/back_end/rename/busy_table.scala](/src/test/scala/ladder/back_end/rename/busy_table.scala) | Scala | 69 | 14 | 18 | 101 |
| [src/test/scala/ladder/back_end/rename/free_list.scala](/src/test/scala/ladder/back_end/rename/free_list.scala) | Scala | 89 | 27 | 21 | 137 |
| [src/test/scala/ladder/back_end/rename/rename.scala](/src/test/scala/ladder/back_end/rename/rename.scala) | Scala | 54 | 14 | 15 | 83 |
| [src/test/scala/ladder/back_end/rename/rename_table.scala](/src/test/scala/ladder/back_end/rename/rename_table.scala) | Scala | 60 | 5 | 9 | 74 |
| [src/test/scala/ladder/backend_with_decode.scala](/src/test/scala/ladder/backend_with_decode.scala) | Scala | 103 | 23 | 21 | 147 |
| [src/test/scala/ladder/consts.scala](/src/test/scala/ladder/consts.scala) | Scala | 80 | 25 | 7 | 112 |
| [src/test/scala/ladder/defs.scala](/src/test/scala/ladder/defs.scala) | Scala | 118 | 84 | 22 | 224 |
| [src/test/scala/ladder/front_end/branch_predictor.scala](/src/test/scala/ladder/front_end/branch_predictor.scala) | Scala | 87 | 20 | 9 | 116 |
| [src/test/scala/ladder/front_end/branch_presolve.scala](/src/test/scala/ladder/front_end/branch_presolve.scala) | Scala | 48 | 8 | 3 | 59 |
| [src/test/scala/ladder/front_end/fetch_queue.scala](/src/test/scala/ladder/front_end/fetch_queue.scala) | Scala | 26 | 0 | 4 | 30 |
| [src/test/scala/ladder/front_end/fetchres.scala](/src/test/scala/ladder/front_end/fetchres.scala) | Scala | 24 | 0 | 3 | 27 |
| [src/test/scala/ladder/front_end/front_end.scala](/src/test/scala/ladder/front_end/front_end.scala) | Scala | 62 | 12 | 19 | 93 |
| [src/test/scala/ladder/front_end/front_end_control.scala](/src/test/scala/ladder/front_end/front_end_control.scala) | Scala | 31 | 0 | 5 | 36 |
| [src/test/scala/ladder/front_end/if1_if2.scala](/src/test/scala/ladder/front_end/if1_if2.scala) | Scala | 30 | 0 | 7 | 37 |
| [src/test/scala/ladder/front_end/if2_if3.scala](/src/test/scala/ladder/front_end/if2_if3.scala) | Scala | 31 | 0 | 6 | 37 |
| [src/test/scala/ladder/front_end/pc_gen.scala](/src/test/scala/ladder/front_end/pc_gen.scala) | Scala | 36 | 0 | 7 | 43 |
| [src/test/scala/ladder/insts.scala](/src/test/scala/ladder/insts.scala) | Scala | 154 | 10 | 8 | 172 |
| [src/test/scala/ladder/ladder.scala](/src/test/scala/ladder/ladder.scala) | Scala | 18 | 51 | 2 | 71 |
| [src/test/scala/ladder/muldiv_test.scala](/src/test/scala/ladder/muldiv_test.scala) | Scala | 35 | 7 | 11 | 53 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details