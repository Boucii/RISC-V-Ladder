package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Rename extends Module{
    val io=IO(new Bundle{
        val i_decode_packs=Input(Vec(2,new uop()))
        val i_commit_packs=Input(Vec(2,new commit_pack()))
        val i_rollback_packs=Input(Vec(2,new rollback_pack))

        val o_free_list_empty = Output(Bool())
        val o_rename_packs=Output(Vec(2,new uop()))
        val o_written_back_table=Output(UInt(128.W))

        val i_exception = Input(Bool())
        val i_stall = Input(Bool())
    })
    val rename_table=Module(new Rename_Table()) 
    //val free_list=Module(new Free_List())
    val busy_table=Module(new Busy_Table())

    //exchange 0,1 if invalid , valid
    val uops = Reg(Vec(2,new uop()))
    uops(0) := Mux(io.i_stall, uops(0), Mux((!io.i_decode_packs(0).valid && io.i_decode_packs(1).valid), io.i_decode_packs(1), io.i_decode_packs(0)))
    uops(1) := Mux(io.i_stall, uops(1), Mux((!io.i_decode_packs(0).valid && io.i_decode_packs(1).valid), io.i_decode_packs(0), io.i_decode_packs(1)))

    //rename table -------------------
    for(i <- 0 until 2){
        rename_table.io.i_rename_req_packs(i).arch_rs1 := Mux(uops(i).valid,uops(i).arch_rs1,0.U)
        rename_table.io.i_rename_req_packs(i).arch_rs2 := Mux(uops(i).valid,uops(i).arch_rs2,0.U)
        rename_table.io.i_rename_req_packs(i).arch_dst := Mux(uops(i).valid,uops(i).arch_dst,0.U)
    }
    rename_table.io.i_commit_packs := io.i_commit_packs
    rename_table.io.i_rollback_packs := io.i_rollback_packs
    rename_table.io.i_allocation_pack:=io.o_rename_packs

    rename_table.io.i_exception:= io.i_exception
    /*
    //free list-----------------------
    free_list.io.i_free_list_reqs(0):= uops(0).valid && (uops(0).arch_dst =/= 0.U)
    free_list.io.i_free_list_reqs(1):= uops(1).valid && (uops(1).arch_dst =/= 0.U)

    free_list.io.i_commit_packs := io.i_commit_packs
    free_list.io.i_rollback_packs := io.i_rollback_packs
    */

    io.o_rename_packs := uops
    io.rename_packs(0).valid := Mux((io.i_exception || io.rollback_packa(0).valid || io.rollback_packs(1).valid) ,false.B,uops(0).valid)
    io.rename_packs(1).valid := Mux((io.i_exception || io.rollback_packa(0).valid || io.rollback_packs(1).valid) ,false.B,uops(1).valid)
    io.o_free_list_empty := busy_table.io.o_empty

    io.o_rename_packs(0).phy_rs1 := rename_table.io.o_rename_res_packs(0).phy_rs1
    io.o_rename_packs(0).phy_rs2 := rename_table.io.o_rename_res_packs(0).phy_rs2
    io.o_rename_packs(0).stale_dst := rename_table.io.o_rename_res_packs(0).phy_dst
    io.o_rename_packs(0).phy_dst := busy_table.io.o_allocated_pregs(0)

    io.o_rename_packs(1).phy_rs1 := Mux(uops(0).arch_dst === uops(1).arch_rs1, busy_table.io.o_allocated_pregs(0), rename_table.io.o_rename_res_packs(1).phy_rs1)
    io.o_rename_packs(1).phy_rs2 := Mux(uops(0).arch_dst === uops(1).arch_rs2, busy_table.io.o_allocated_pregs(0), rename_table.io.o_rename_res_packs(1).phy_rs2)
    io.o_rename_packs(1).stale_dst := Mux(uops(0).arch_dst === uops(1).arch_dst, busy_table.io.o_allocated_pregs(0), rename_table.io.o_rename_res_packs(1).phy_dst)
    io.o_rename_packs(1).phy_dst := busy_table.io.o_allocated_pregs(1)

    //busy table----------------------
    busy_table.io.i_allocated_uops := io.o_rename_packs
    busy_table.io.i_commit_packs := io.i_commit_packs
    busy_table.io.i_rollback_packs := io.i_rollback_packs
    busy_table.io.i_free_list_reqs(0):= uops(0).valid && (uops(0).arch_dst =/= 0.U)
    busy_table.io.i_free_list_reqs(1):= uops(1).valid && (uops(1).arch_dst =/= 0.U)
    busy_table.io.i_exception := io.i_exception

    io.o_written_back_table := busy_table.io.o_written_back

    printf("phydst0=%d ,phy_dst1=%d\n",io.o_rename_packs(0).phy_dst,io.o_rename_packs(1).phy_dst)
}