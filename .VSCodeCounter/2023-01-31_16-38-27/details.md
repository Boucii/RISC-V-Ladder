# Details

Date : 2023-01-31 16:38:27

Directory d:\\StudyDocuments\\OOOCoreDesign\\sbttest\\chisel-template - ladder_be\\src\\test\\scala\\ladder

Total : 33 files,  2691 codes, 493 comments, 489 blanks, all 3673 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
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

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)