package Ladder

import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Ladder_nodpic extends Module {
  val io = IO(new Bundle {
    //icache io
    val icache_io = new IcacheIO()
    //dcache io
    val dcache_io = new DcacheIO()
    val i_interrupt = Input(Bool())
  })
  val front_end = Module(new Front_End())
  val back_end = Module(new Back_End_With_Decode())

  //connect front end input
  val last_branch_resolve_pack = RegInit(0.U.asTypeOf(new branch_resolve_pack()))
  last_branch_resolve_pack := back_end.io.o_branch_resolve_pack
  //when backend branch resolve flush, the front end just have to flush one cycle
  front_end.io.i_branch_resolve_pack := Mux(last_branch_resolve_pack.asUInt === back_end.io.o_branch_resolve_pack.asUInt, 
       0.U.asTypeOf(new branch_resolve_pack()), back_end.io.o_branch_resolve_pack)
  front_end.io.i_pc_redirect_valid := back_end.io.o_pc_redirect_valid
  front_end.io.i_pc_redirect_target := back_end.io.o_pc_redirect_target

  front_end.io.icache_io.i_addr_ready := io.icache_io.i_addr_ready
  front_end.io.icache_io.i_data_valid := io.icache_io.i_data_valid
  io.icache_io.o_wen := front_end.io.icache_io.o_wen 
  io.icache_io.o_addr := front_end.io.icache_io.o_addr
  io.icache_io.o_addr_valid := front_end.io.icache_io.o_addr_valid
  front_end.io.icache_io.i_data := io.icache_io.i_data

  //connect back end input
  back_end.io.i_fetch_pack <> front_end.io.o_fetch_pack
  back_end.io.i_interrupt := io.i_interrupt

  back_end.io.dcache_io.data_valid  := io.dcache_io.data_valid  
  back_end.io.dcache_io.MdataIn     := io.dcache_io.MdataIn  
  io.dcache_io.addr_valid          :=back_end.io.dcache_io.addr_valid  
  io.dcache_io.data_ready          :=back_end.io.dcache_io.data_ready
  back_end.io.dcache_io.addr_ready := io.dcache_io.addr_ready

  io.dcache_io.Mwout              :=back_end.io.dcache_io.Mwout  
  io.dcache_io.Maddr              :=back_end.io.dcache_io.Maddr  
  io.dcache_io.Men                :=back_end.io.dcache_io.Men    
  io.dcache_io.Mlen               :=back_end.io.dcache_io.Mlen   
  io.dcache_io.MdataOut           :=back_end.io.dcache_io.MdataOut
}
