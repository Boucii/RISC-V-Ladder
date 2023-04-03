package Ladder

import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Front_End extends Module
{
    val io = IO(new Bundle{
        //connect icache
        val icache_io = new IcacheIO()

        //from back_end
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        //val i_back_end_stall = Input(new Bool())// this is kinda unessesary

        val i_pc_redirect_valid = Input(new Bool())
        val i_pc_redirect_target = Input(UInt(64.W))

        //to back_end
        val o_fetch_pack = Decoupled(new fetch_pack())
    })
    val pc_gen = Module(new PC_Gen())
    val bpu = Module(new BPU())
    val if1_if2 = Module(new IF1_IF2())
    val if2_if3 = Module(new IF2_IF3())
    val branch_presolve = Module(new Branch_Presolve())
    val fetch_queue = Module(new Fetch_Queue())
    val front_end_control = Module(new front_end_control())
    val fetch_res = Module(new Fetch_Res())

    /*fetch control*/
    front_end_control.io.i_pc_redirect_valid := io.i_pc_redirect_valid
    front_end_control.io.i_icache_addr_ready := io.icache_io.i_addr_ready
    front_end_control.io.i_icache_data_valid := io.icache_io.i_data_valid
    front_end_control.io.i_branch_presolve_pack := branch_presolve.io.o_branch_presolve_pack
    front_end_control.io.i_branch_resolve_pack := io.i_branch_resolve_pack
    front_end_control.io.i_fetch_queue_full := fetch_queue.io.full


    /*stage 1 : fetch and predict*/
    pc_gen.io.i_stall := front_end_control.io.o_stage1_stall
    pc_gen.io.i_pc_redirect_valid := io.i_pc_redirect_valid
    pc_gen.io.i_pc_redirect_target := io.i_pc_redirect_target
    pc_gen.io.i_branch_predict_pack := bpu.io.o_branch_predict_pack
    pc_gen.io.i_branch_presolve_pack := branch_presolve.io.o_branch_presolve_pack
    pc_gen.io.i_branch_resolve_pack := io.i_branch_resolve_pack

    io.icache_io.o_wen := false.B
    io.icache_io.o_addr := Cat(pc_gen.io.o_pc(63,3),0.U(3.W))
    io.icache_io.o_addr_valid := front_end_control.io.o_stage1_stall
      //io.icache_io.o_rwen := pc_gen.io.o_stage1_flush
    io.icache_io.o_stall1 := front_end_control.io.o_stage1_stall||front_end_control.io.o_stage1_flush
    io.icache_io.o_stall2 := front_end_control.io.o_stage2_stall||front_end_control.io.o_stage1_flush

    bpu.io.i_addr := pc_gen.io.o_pc
    bpu.io.i_branch_presolve_pack := branch_presolve.io.o_branch_presolve_pack
    bpu.io.i_branch_resolve_pack := io.i_branch_resolve_pack

    /*stage 1 and stage 2*/
    if1_if2.io.i_stall := front_end_control.io.o_stage1_stall
    if1_if2.io.i_flush := front_end_control.io.o_stage1_flush
    if1_if2.io.i_pc := pc_gen.io.o_pc
    if1_if2.io.i_branch_predict_pack := bpu.io.o_branch_predict_pack

    /*stage 2 : fetching, and generate predict (1cycle delayed)*/

    /*stage 2 and stage 3*/
    if2_if3.io.i_stall := front_end_control.io.o_stage2_stall
    if2_if3.io.i_flush := front_end_control.io.o_stage2_flush //|| !if1_if2.io.o_fetch_valid 
    if2_if3.io.i_pc := if1_if2.io.o_pc
    if2_if3.io.i_branch_predict_pack := if1_if2.io.o_branch_predict_pack
    if2_if3.io.i_fetch_valid := if1_if2.io.o_fetch_valid

    /*stage 3 : fetch to fetch queue, presolve branch*/
    branch_presolve.io.i_fetch_pack := fetch_res.io.o_fetch_pack.bits
	fetch_res.io.o_fetch_pack.ready := true.B //this is ugly, remove this decouple later

    fetch_res.io.i_pc := if2_if3.io.o_pc
    fetch_res.io.i_flush := front_end_control.io.o_fetch_queue_flush || !if2_if3.io.o_fetch_valid
    fetch_res.io.i_stall := front_end_control.io.o_stage2_stall//this port and flush port is used to prevent write fetchqueue
	fetch_res.io.i_branch_presolve_pack := branch_presolve.io.o_branch_presolve_pack
    fetch_res.io.i_fetch_res := io.icache_io.i_data
    fetch_res.io.i_branch_predict_pack := if2_if3.io.o_branch_predict_pack

    fetch_queue.io.in  <> fetch_res.io.o_fetch_pack_with_presolve
    fetch_queue.io.i_flush := front_end_control.io.o_fetch_queue_flush
 
    /*connect to back_end*/
    io.o_fetch_pack <> fetch_queue.io.out
}

