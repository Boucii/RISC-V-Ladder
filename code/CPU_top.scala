package Ladder

class Ladder extends Module {
  val io = new Bundle {
    //icache io
    //dcache io
  }
  val front_end = Module(new Front_End())
  val back_end = Module(new Back_End())

  //connect front end and back end
  front_end.i_branch_resolve_pack := back_end.o_branch_resolve_pack
  front_end.i_stall := back_end.o_stall

  back_end.i_decode_packs := front_end.o_decode_packs

  //connect icache
  //connect dcache
}