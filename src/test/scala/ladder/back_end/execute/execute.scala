package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
import scala.collection.mutable.{ArrayBuffer}

//memu 没有做rollback
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
        val i_rollback_valid = Input(Bool()) // ROB is still rolling back, this is duplicated with o_resolvepack.valid && mispred

        //for interrupt mask
        val o_lsu_uop_valid = Output(Bool()) 
        val o_lsu_uop_rob_idx = Output(UInt(8.W)) 
    })

    //lets do this for now. imrove this by adding a virtual exunit class 
    val func_units =ArrayBuffer[Function_Unit]()
    val alu1 = Module(new ALU())
    val alu2 = Module(new ALU())
    val bru = Module(new BRU())
    val lsu = Module(new LSU())
    val mul = Module(new MUL())
    val div = Module(new DIV())
    val csr_bf = Module(new CSR_BF())

    func_units += alu1
    func_units += alu2
    func_units += bru
    func_units += lsu
    func_units += mul
    func_units += div
    func_units += csr_bf

    lsu.io.i_ROB_first_entry :=io.i_ROB_first_entry
    lsu.io.dcache_io.data_valid      := io.dcache_io.data_valid  
    lsu.io.dcache_io.MdataIn         := io.dcache_io.MdataIn  
    io.dcache_io.addr_valid          :=lsu.io.dcache_io.addr_valid  
    io.dcache_io.data_ready          :=lsu.io.dcache_io.data_ready
    lsu.io.dcache_io.addr_ready := io.dcache_io.addr_ready

    io.dcache_io.Mwout          :=lsu.io.dcache_io.Mwout  
    io.dcache_io.Maddr          :=lsu.io.dcache_io.Maddr  
    io.dcache_io.Men            :=lsu.io.dcache_io.Men    
    io.dcache_io.Mlen           :=lsu.io.dcache_io.Mlen   
    io.dcache_io.MdataOut       :=lsu.io.dcache_io.MdataOut

    for(i <- 0 until 7){
        io.o_available_funcs(i):=0.U
    }

    //io.o_available_funcs(0):=(Mux(alu1.io.o_available,1.U,0.U) + Mux(alu2.io.o_available,1.U,0.U) )
    //TODO: index available_funcs with FU_xxx
    io.o_available_funcs(0):=MuxCase(0.U,Seq(
        ((alu1.io.o_available)&&(!alu2.io.o_available)) -> 1.U,
        (!(alu1.io.o_available)&&(alu2.io.o_available)) -> 1.U,
        ((alu1.io.o_available)&&(alu2.io.o_available)) -> 2.U
    ))
    io.o_available_funcs(1):=Mux(bru.io.o_available,1.U,0.U)
    io.o_available_funcs(2):=Mux(lsu.io.o_available,1.U,0.U)
    io.o_available_funcs(3):=Mux(mul.io.o_available,1.U,0.U)
    io.o_available_funcs(4):=Mux(div.io.o_available,1.U,0.U)
    io.o_available_funcs(5):=Mux(csr_bf.io.o_available,1.U,0.U)


    //when alu1 available, and at least 1 alu inst
    alu1.io.i_select := !io.i_rollback_valid &&  Mux(((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU)||
                    ((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_ALU)))&&(alu1.io.o_available),true.B,false.B)  
    //when alu2 available, and 2 alu insts ,or 1 alu inst and alu1 unavailable
    alu2.io.i_select := !io.i_rollback_valid &&  Mux((alu2.io.o_available)&&(
        ((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_ALU)&&(io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU))||
        ((((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_ALU))||((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU)))
        &&(!(alu1.io.o_available)))),true.B,false.B)
        
    bru.io.i_select := !io.i_rollback_valid && Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_BRU)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_BRU)),true.B,false.B)

    lsu.io.i_select := !io.i_rollback_valid && Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_MEM)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_MEM)),true.B,false.B)

    mul.io.i_select := !io.i_rollback_valid && Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_MUL)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_MUL)),true.B,false.B)

    div.io.i_select := !io.i_rollback_valid && Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_DIV)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_DIV)),true.B,false.B)

    csr_bf.io.i_select := !io.i_rollback_valid && Mux(((io.i_issue_res_packs(1).valid)&&(io.i_issue_res_packs(1).func_code === FU_CSR)) || 
                            ((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_CSR)),true.B,false.B)

    alu1.io.i_uop:= Mux((io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU),io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    //when alu1 is busy and inst 0 is alu
    alu2.io.i_uop:= Mux(!alu1.io.o_available && (io.i_issue_res_packs(0).valid)&&(io.i_issue_res_packs(0).func_code === FU_ALU),io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    bru.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_BRU,io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    lsu.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_MEM,io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    mul.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_MUL,io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    div.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_DIV,io.i_issue_res_packs(0),io.i_issue_res_packs(1))
    csr_bf.io.i_uop := Mux(io.i_issue_res_packs(0).func_code === FU_CSR,io.i_issue_res_packs(0),io.i_issue_res_packs(1))

    alu1.io.i_exception    := io.i_exception
    alu2.io.i_exception    := io.i_exception
    bru.io.i_exception     := io.i_exception
    lsu.io.i_exception     := io.i_exception
    mul.io.i_exception     := io.i_exception
    div.io.i_exception     := io.i_exception
    csr_bf.io.i_exception     := io.i_exception

    alu1.io.i_rollback_valid := io.i_rollback_valid
    alu2.io.i_rollback_valid := io.i_rollback_valid
    bru.io.i_rollback_valid  := io.i_rollback_valid
    lsu.io.i_rollback_valid  := io.i_rollback_valid
    mul.io.i_rollback_valid  := io.i_rollback_valid
    div.io.i_rollback_valid  := io.i_rollback_valid
    csr_bf.io.i_rollback_valid  := io.i_rollback_valid

    alu1.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx
    alu2.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx
    bru.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx//not needed
    lsu.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx//not implemented
    mul.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx
    div.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx
    csr_bf.io.i_rollback_rob_idx := io.o_branch_resolve_pack.rob_idx

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
    //io.o_branch_resolve_pack.valid := Mux(io.i_exception, false.B ,bru.io.o_branch_resolve_pack.valid)
    io.o_branch_resolve_pack.valid := bru.io.o_branch_resolve_pack.valid

    val issue_idx1 = Wire(UInt(log2Ceil(func_units.length).W))//the idxes of fu that are selected to exit the exu (to rob)
    val issue_idx2 = Wire(UInt(log2Ceil(func_units.length).W))//TODO:rename this to anything else, could be confusing 

    issue_idx1 := PriorityEncoder(Seq(alu1.io.o_ex_res_pack.valid,alu2.io.o_ex_res_pack.valid,
            bru.io.o_ex_res_pack.valid,lsu.io.o_ex_res_pack.valid, mul.io.o_ex_res_pack.valid,
            div.io.o_ex_res_pack.valid,csr_bf.io.o_ex_res_pack.valid))
    issue_idx2 := (func_units.length).U-1.U-PriorityEncoder(Seq(alu1.io.o_ex_res_pack.valid,alu2.io.o_ex_res_pack.valid ,
            bru.io.o_ex_res_pack.valid,lsu.io.o_ex_res_pack.valid, mul.io.o_ex_res_pack.valid,
            div.io.o_ex_res_pack.valid,csr_bf.io.o_ex_res_pack.valid).reverse)

    for(i <- 0 until func_units.length){// use switch case to connect specialized function unit
        func_units(i).io.i_select_to_commit:= (i.U ===issue_idx1 || i.U === issue_idx2) && func_units(i).io.o_ex_res_pack.valid && (!io.i_rollback_valid)
    }

    io.o_ex_res_packs(0).uop := MuxCase(func_units(0).io.o_ex_res_pack.uop,for(i <- 0 until func_units.length)yield((i.U===issue_idx1) ->func_units(i).io.o_ex_res_pack.uop ))
    io.o_ex_res_packs(1).uop := MuxCase(func_units(0).io.o_ex_res_pack.uop,for(i <- 0 until func_units.length)yield((i.U===issue_idx2) ->func_units(i).io.o_ex_res_pack.uop ))

    io.o_ex_res_packs(0).valid :=Mux(io.i_exception, false.B, MuxCase(false.B,for(i <- 0 until func_units.length)yield((i.U===issue_idx1) ->func_units(i).io.o_ex_res_pack.valid )))
    io.o_ex_res_packs(1).valid :=Mux(io.i_exception, false.B, MuxCase(false.B,for(i <- 0 until func_units.length)yield((i.U===issue_idx2) ->func_units(i).io.o_ex_res_pack.valid )) && (issue_idx1=/=issue_idx2))

    io.o_lsu_uop_valid := lsu.io.o_lsu_uop_valid
    io.o_lsu_uop_rob_idx := lsu.io.o_lsu_uop_rob_idx

    //this can be improved by merge the two valid
    assert(((io.o_ex_res_packs(0).valid && io.o_ex_res_packs(0).uop.valid)||(!io.o_ex_res_packs(0).valid)),"exu pack valid, but uop not valid")
    assert(((io.o_ex_res_packs(1).valid && io.o_ex_res_packs(1).uop.valid)||(!io.o_ex_res_packs(1).valid)),"exu pack valid, but uop not valid")
}
