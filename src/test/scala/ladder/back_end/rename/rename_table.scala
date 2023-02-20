package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3._
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class rename_req_pack extends Bundle
{
  val arch_rs1 = UInt(5.W)
  val arch_rs2 = UInt(5.W)
  val arch_dst = UInt(5.W)
}
class rename_res_pack extends Bundle
{
  val phy_rs1 = UInt(7.W)
  val phy_rs2 = UInt(7.W)
  val phy_dst = UInt(7.W)
}
class Rename_Table extends Module{
    val io=IO(new Bundle{
        val i_rename_req_packs=Input(Vec(2,new rename_req_pack()))
        val o_rename_res_packs=Output(Vec(2,new rename_res_pack()))

        val i_allocation_pack=Input(Vec(2,new uop()))

        val i_commit_packs=Input(Vec(2,new commit_pack()))
        val i_rollback_packs=Input(Vec(2,new rollback_pack()))

        val i_exception=Input(Bool())
        //val i_branch_backuptables //well....what to do with this one..
        
        //for decode and dpi-c arch regs
        val o_commit_rename_table = Output(Vec(32,UInt(7.W)))
    })
    val rename_table = RegInit(VecInit(Seq.fill(32)(0.U(7.W))))
    val commit_rename_table = RegInit(VecInit(Seq.fill(32)(0.U(7.W))))
    io.o_commit_rename_table:=commit_rename_table

    //write logic
    when(io.i_commit_packs(0).valid){
        commit_rename_table(io.i_commit_packs(0).uop.arch_dst):=io.i_commit_packs(0).uop.phy_dst
    }
    when(io.i_commit_packs(1).valid){
        commit_rename_table(io.i_commit_packs(1).uop.arch_dst):=io.i_commit_packs(1).uop.phy_dst
    }
    when(io.i_rollback_packs(0).valid){
        rename_table(io.i_rollback_packs(0).uop.arch_dst):=io.i_rollback_packs(0).uop.stale_dst
    }
    when(io.i_rollback_packs(1).valid){
        rename_table(io.i_rollback_packs(1).uop.arch_dst):=io.i_rollback_packs(1).uop.stale_dst
    }
    when(io.i_allocation_pack(0).valid && io.i_allocation_pack(0).arch_dst =/= 0.U){
        rename_table(io.i_allocation_pack(0).arch_dst):=io.i_allocation_pack(0).phy_dst
    }
    when(io.i_allocation_pack(1).valid && io.i_allocation_pack(1).arch_dst =/= 0.U){
        rename_table(io.i_allocation_pack(1).arch_dst):=io.i_allocation_pack(1).phy_dst
    }                                                                                

    //read logic
    for(i<-0 until 2){
        io.o_rename_res_packs(i).phy_rs1:=rename_table(io.i_rename_req_packs(i).arch_rs1)
        io.o_rename_res_packs(i).phy_rs2:=rename_table(io.i_rename_req_packs(i).arch_rs2)
        io.o_rename_res_packs(i).phy_dst:=rename_table(io.i_rename_req_packs(i).arch_dst)
    }

    //exception logic
    when(io.i_exception){
        rename_table:=commit_rename_table
    }
}
