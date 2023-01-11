package Ladder
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Front_End extends Module
{
    val io = IO(new Bundle{
        //connect icache

        //from back_end
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        val i_stall = Input(new Bool())

        //to back_end
        val o_decode_packs = Output(Vec(2,new uop()))
    })
    val pc_gen = new PC_Gen()
    val bpu = new BPU()
    val imem = new Icache()
    val if1_if2 = new IF1_IF2()
    val if2_if3 = new IF2_IF3()
    val branch_presolve = new Branch_Presolve()
    val fetch_queue = new Fetch_Queue()
    val front_end_control = new front_end_control()
    val fetch_res = new Fetch_Res()

    val decoder = new Decoder()

    val stage1_flush = new Stage
    val stage2_flush = new Stage
    val stage3_flush = new Stage
    val stage1_stall = new Stage
    val stage2_stall = new Stage
    val stage3_stall = new Stage

    /*fetch control*/
    front_end_control.io.i_imem_stall_req := imem.io.o_stall
    front_end_control.io.i_branch_presolve := branch_presolve.io.o_branch_presolve
    

    /*stage 1 : fetch and predict*/
    pc_gen.io.i_stall := front_end_control.io.o_stage1_stall
    pc_gen.io.i_flush := front_end_control.io.o_stage1_flush
    pc_gen.io.i_branch_predict_pack := bpu.io.o_branch_predict_pack
    pc_gen.io.b_branch_presolve_pack := branch_presolve.io.o_branch_presolve_pack
    pc_gen.io.b_branch_resolve_pack := io.i_branch_resolve_pack

    icache.io.i_imem_fetch_req_interface.i_pc := pc_gen.io.o_pc
    icache.io.i_imem_fetch_req_interface.i_flush_s1 := front_end_control.io.o_stage1_flush
    icache.io.i_imem_fetch_req_interface.i_flush_s2 := front_end_control.io.o_stage2_flush

    bpu.io.i_branch_presolve_pack := branch_presolve.io.o_branch_presolve_pack
    bpu.io.i_branch_resolve_pack := io.i_branch_resolve_pack

    /*stage 1 and stage 2*/
    if1_if2.i_stall := front_end_control.io.o_stage1_stall
    if1_if2.i_flush := front_end_control.io.o_stage1_flush
    if1_if2.ipc := pc_gen.o_pc
    if1_if2.i_branch_predict_pack := bpu.o_branch_predict_pack

    /*stage 2 : fetching, and generate predict (1cycle delayed)*/

    /*stage 2 and stage 3*/
    if2_if3.io.i_stall := front_end_control.io.o_stage2_stall
    if2_if3.io_i_flush := front_end_control.io.o_stage2_flush
    if2_if3.io.i_pc := if1_if2.io.o_pc
    if2_if3.io.i_branch_predict_pack := if1_if2.io.o_branch_predict_pack

    /*stage 3 : fetch to fetch queue, presolve branch*/
    fetch_queue.io.in := fetch_res.io.o_fetch_pack
    branch_presolve.io.i_fetch_pack := fetch_res.io.o_fetch_pack
    branch_presolve.io.i_branch_predict_pack := if2_if3.io.i_branch_predict_pack

    fetch_res.io.i_fetch_pack := icache.io.o_imem_fetch_res_interface
    fetch_res.io.i_branch_predict_pack := if2_if3.io.o_branch_predict_pack

    fetch_queue.io.i_fetch_pack.fetch_res := fetch_res.io.o_fetch_pack
 
    /*stage 4 : decode from fetch queue*/
    decoder.io.i_fetch_pack := fetch_queue.io.out

    /*connect to back_end*/
    io.o_decode_packs := decoder.io.o_decode_packs
}

