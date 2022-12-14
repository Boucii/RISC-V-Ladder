package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3._
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
import scala.collection.mutable.{ArrayBuffer}

//what happens if two consecutive branch
class Execute extends Module with consts{
    val io=IO(new Bundle{
        //val i_=Input(UInt(32.W))

        val i_issue_res_packs = Input(Vec(2, new uop()))
        //to phy-regfile
        //physical reg read finished in previous module
        //val i_pregs_read = Input(Vec(4, UInt(64.W))) 

        //to issue(reservation station)
        val o_available_funcs = Output(Vec(7,UInt(2.W)))
        //val o_func_code = Output(UInt(x.W))//??
        //val o_func_mask = Output(Vec)//??

        //to rob
        val o_ex_res_packs = Output(Vec(2, new valid_uop_pack()))//rename result to res 
        val i_ROB_first_entry = Input(UInt(8.W))
        val dcache_io = (new DcacheIO())

        val o_branch_resolve_pack=Output(new branch_resolve_pack())

        //when mispred,clear insts later than the mispred inst
        //when exception , clear all 
         
        val i_exception = Input(Bool())
    })

    //lets do this for now. imrove this by adding a virtual exunit class 
    val func_units =ArrayBuffer[Function_Unit]()
    val exu1 = Module(new ALU())
    val exu2 = Module(new ALU())
    val bru = Module(new BRU())
    val lsu = Module(new LSU())

    func_units += exu1
    func_units += exu2
    func_units += bru
    func_units += lsu

    lsu.io.i_ROB_first_entry :=io.i_ROB_first_entry
    lsu.io.dcache_io.valid      := io.dcache_io.valid  
    lsu.io.dcache_io.MdataIn    := io.dcache_io.MdataIn  
    io.dcache_io.ready          :=lsu.io.dcache_io.ready  
                             
    io.dcache_io.Mwout          :=lsu.io.dcache_io.Mwout  
    io.dcache_io.Maddr          :=lsu.io.dcache_io.Maddr  
    io.dcache_io.Men            :=lsu.io.dcache_io.Men    
    io.dcache_io.Mlen           :=lsu.io.dcache_io.Mlen   
    io.dcache_io.MdataOut       :=lsu.io.dcache_io.MdataOut

    for(i <- 0 until 7){
        io.o_available_funcs(i):=0.U
    }

    io.o_available_funcs(0):=Mux(exu1.io.o_available,1.U,0.U)+Mux(exu2.io.o_available,1.U,0.U)
    io.o_available_funcs(1):=Mux(bru.io.o_available,1.U,0.U)
    io.o_available_funcs(2):=Mux(lsu.io.o_available,1.U,0.U)

    //when exu1 available, and at least 1 alu inst
    exu1.io.i_select := Mux(((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU)||
                    ((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_ALU)))&&(exu1.io.o_available),true.B,false.B)  
    //when exu2 available, and 2 alu insts ,or 1 alu inst and exu1 unavailable
    exu2.io.i_select := Mux((exu2.io.o_available)&&(
        ((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_ALU)&&(io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU))||
        ((((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_ALU))||((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU)))
        &&(!(exu1.io.o_available)))),true.B,false.B)
        
    bru.io.i_select := Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_BRU)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_BRU)),true.B,false.B)
    lsu.io.i_select := Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_MEM)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_MEM)),true.B,false.B)

    exu1.io.i_uop:= Mux((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU),io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    //when exu1 is busy and inst 0 is alu
    exu2.io.i_uop:= Mux(!exu1.io.o_available && (io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU),io.i_issue_res_packs(0),io.i_issue_res_packs(1))

    bru.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_BRU,io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    lsu.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_MEM,io.i_issue_res_packs(0),io.i_issue_res_packs(1))

    exu1.io.i_exceptions    := io.i_exception
    exu2.io.i_exceptions    := io.i_exception
    bru.io.i_exceptions     := io.i_exception
    lsu.io.i_exceptions     := io.i_exception
/*????????
    when((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_BRU)){
        bru.io.i_select := true.B
        bru.io.i_uop := io.i_issue_res_packs(0)

    }.elsewhen((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_BRU)){
        bru.io.i_select :=true.B
        bru.io.i_uop := io.i_issue_res_packs(1)
    }.otherwise{
        bru.io.i_select := false.B
        bru.io.i_uop := io.i_issue_res_packs(0)
    }
    */
    io.o_branch_resolve_pack := bru.io.o_branch_resolve_pack
    io.o_branch_resolve_pack.valid := Mux(io.i_exception, false.B ,bru.io.o_branch_resolve_pack.valid)

    val issue_idx1 = Wire(UInt(2.W))
    val issue_idx2 = Wire(UInt(2.W))

    issue_idx1 := PriorityEncoder(Seq(exu1.io.o_ex_res_pack.valid,exu2.io.o_ex_res_pack.valid ,bru.io.o_ex_res_pack.valid,lsu.io.o_ex_res_pack.valid))
    issue_idx2 := (func_units.length).U-1.U-PriorityEncoder(Seq(exu1.io.o_ex_res_pack.valid,exu2.io.o_ex_res_pack.valid ,bru.io.o_ex_res_pack.valid,lsu.io.o_ex_res_pack.valid).reverse)

    for(i <- 0 until func_units.length){// use switch case to connect specialized function unit
        func_units(i).io.i_select_to_commit:= (i.U ===issue_idx1 || i.U === issue_idx2)
    }

    io.o_ex_res_packs(0).uop := MuxCase(func_units(0).io.o_ex_res_pack.uop,for(i <- 0 until func_units.length)yield((i.U===issue_idx1) ->func_units(i).io.o_ex_res_pack.uop ))
    io.o_ex_res_packs(1).uop := MuxCase(func_units(0).io.o_ex_res_pack.uop,for(i <- 0 until func_units.length)yield((i.U===issue_idx2) ->func_units(i).io.o_ex_res_pack.uop ))

    io.o_ex_res_packs(0).valid :=Mux(io.i_exception, false.B, MuxCase(false.B,for(i <- 0 until func_units.length)yield((i.U===issue_idx1) ->func_units(i).io.o_ex_res_pack.valid )))
    io.o_ex_res_packs(1).valid :=Mux(io.i_exception, false.B, MuxCase(false.B,for(i <- 0 until func_units.length)yield((i.U===issue_idx2) ->func_units(i).io.o_ex_res_pack.valid )) && (issue_idx1=/=issue_idx2))

}
