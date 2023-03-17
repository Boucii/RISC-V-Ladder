package Ladder

import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class front_end_control extends Module
{
   val io =IO(new Bundle {
        val i_pc_redirect_valid = Input(new Bool())
        val i_icache_data_valid = Input(Bool())
        val i_icache_addr_ready = Input(Bool())
        //val i_cache_fetch_valid = Input(Bool())//aka.valid fetch
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        val i_branch_presolve_pack = Input(new branch_presolve_pack())
        val i_fetch_queue_full = Input(Bool())

        val o_stage1_stall = Output(Bool())
        val o_stage2_stall = Output(Bool())
        //val o_stage3_stall = Output(Bool())//this is actually stage3 fetch invalid
                             
        val o_stage1_flush = Output(Bool())
        val o_stage2_flush = Output(Bool())
        //val o_stage3_flush = Output(Bool())//means flush everything inside fetchqueue
		val o_fetch_queue_flush = Output(Bool())
   })
   io.o_fetch_queue_flush := io.i_pc_redirect_valid || (io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred)
   io.o_stage2_flush := io.o_fetch_queue_flush
   io.o_stage1_flush := io.o_stage2_flush || (io.i_branch_presolve_pack.valid && io.i_branch_presolve_pack.taken)
     
   io.o_stage2_stall := (io.i_fetch_queue_full || (!io.i_icache_data_valid)) &&(!io.o_stage2_flush)///??
   io.o_stage1_stall := (!io.i_icache_addr_ready || io.o_stage2_stall) && (!io.o_stage1_flush)
}
