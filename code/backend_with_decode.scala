package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

/*
1.查看流水线的reg是否放进去了
2.统计stall信号,flush信号以及exception的关系
3.regfile读塞进去
4.regfile写
5.dcacheio重新放一下
6.merge uop.valid and pack.valid
7.remove src valid in uop
*/
class Back_End_With_Decode extends Module with consts{
    val io = IO(new Bundle{
        val i_fetch_pack = Flipped(Decoupled(new fetch_pack()))

        //val i_decode_packs = Input(Vec(2,new uop()))

        val o_branch_resolve_pack = Output(new branch_resolve_pack())
        val o_stall = Output(Bool())
        val o_pc_redirect_valid = Output(Bool()) //ecall,mret,exception,interrupt
        val o_pc_redirect_target = Output(UInt(64.W))

        val dcache_io = new DcacheIO()

        val i_interrupt = Input(Bool())
    }) 
    val decode = Module(new Decoder())
    val rename  = Module(new Rename())
    val dispatch = Module(new Dispatch())
    val reservation_station = Module(new Reservation_Station())
    val regfile = Module(new RegFile())
    val execute =Module(new Execute())
    val rob = Module(new Reorder_Buffer())
    val csr = Module(new CSR())
    val interrupt_mask = Module(new Interrupt_Mask())

    //connect decode input
    decode.io.i_fetch_pack <> io.i_fetch_pack
    decode.io.i_exception := csr.io.o_pc_redirect_valid
    decode.io.i_branch_resolve_pack := io.o_branch_resolve_pack
    decode.io.i_stall := io.o_stall

    //connect rename input
    rename.io.i_decode_packs    := decode.io.o_decode_packs
    rename.io.i_commit_packs    := csr.io.o_commit_packs_modified
    rename.io.i_rollback_packs  := rob.io.o_rollback_packs
    rename.io.i_exception       := csr.io.o_pc_redirect_valid
    rename.io.i_stall           := rob.io.o_full || reservation_station.io.o_full 

    //connect dispatch input
    dispatch.io.i_rename_packs              := rename.io.o_rename_packs
    dispatch.io.i_rob_busy                  := rob.io.o_full//???
    dispatch.io.i_rob_allocation_ress       := rob.io.o_rob_allocation_ress
    dispatch.io.i_reservation_station_full  := reservation_station.io.o_full
    dispatch.io.i_branch_resolve_pack       := execute.io.o_branch_resolve_pack
    dispatch.io.i_exception                 := csr.io.o_pc_redirect_valid

    //connect reservation station input
    //csr insts are not bypassed because they are actually executed when commited, not in exu
    val written_back_table_with_bypass = Wire(UInt(128.W))
    written_back_table_with_bypass := rename.io.o_written_back_table | 
            UIntToOH((execute.io.o_ex_res_packs(0).uop.phy_dst ) & Fill(7,((execute.io.o_ex_res_packs(0).valid).asUInt())) & Fill(7,((execute.io.o_ex_res_packs(0).uop.func_code =/= FU_CSR).asUInt())))   |
            UIntToOH((execute.io.o_ex_res_packs(1).uop.phy_dst ) & Fill(7,((execute.io.o_ex_res_packs(1).valid).asUInt())) & Fill(7,((execute.io.o_ex_res_packs(1).uop.func_code =/= FU_CSR).asUInt())))
    reservation_station.io.i_dispatch_packs := dispatch.io.o_dispatch_packs
    reservation_station.io.i_wakeup_port := written_back_table_with_bypass
    reservation_station.io.i_branch_resolve_pack := execute.io.o_branch_resolve_pack
    reservation_station.io.i_exception := csr.io.o_pc_redirect_valid//???
    reservation_station.io.i_available_funcs := execute.io.o_available_funcs//???
    reservation_station.io.i_ex_res_packs := execute.io.o_ex_res_packs

    //connect execute input //??regfileread
    //this increses the critical path, i suppose
    execute.io.i_exception := csr.io.o_pc_redirect_valid
    execute.io.i_issue_res_packs := reservation_station.io.o_issue_packs
    execute.io.i_ROB_first_entry := rob.io.o_rob_head
    execute.io.i_rollback_valid := rob.io.o_rollback_packs(0).valid || rob.io.o_rollback_packs(1).valid


    when(execute.io.i_issue_res_packs(0).op1_sel === SRC_RS && (!execute.io.i_issue_res_packs(0).src1_valid)){
        execute.io.i_issue_res_packs(0).src1_value := regfile.io.o_rdata1
    }
    when(execute.io.i_issue_res_packs(0).op2_sel === SRC_RS && (!execute.io.i_issue_res_packs(0).src2_valid)){
        execute.io.i_issue_res_packs(0).src2_value := regfile.io.o_rdata2
    }
    when(execute.io.i_issue_res_packs(1).op1_sel === SRC_RS && (!execute.io.i_issue_res_packs(1).src1_valid)){
        execute.io.i_issue_res_packs(1).src1_value := regfile.io.o_rdata3
    }
    when(execute.io.i_issue_res_packs(1).op2_sel === SRC_RS && (!execute.io.i_issue_res_packs(1).src2_valid)){
        execute.io.i_issue_res_packs(1).src2_value := regfile.io.o_rdata4
    }

    //dcache
    execute.io.dcache_io.data_valid  := io.dcache_io.data_valid  
    execute.io.dcache_io.MdataIn     := io.dcache_io.MdataIn  
    io.dcache_io.addr_valid          :=execute.io.dcache_io.addr_valid  
    io.dcache_io.data_ready          :=execute.io.dcache_io.data_ready
    execute.io.dcache_io.addr_ready := io.dcache_io.addr_ready

    io.dcache_io.Mwout              :=execute.io.dcache_io.Mwout  
    io.dcache_io.Maddr              :=execute.io.dcache_io.Maddr  
    io.dcache_io.Men                :=execute.io.dcache_io.Men    
    io.dcache_io.Mlen               :=execute.io.dcache_io.Mlen   
    io.dcache_io.MdataOut           :=execute.io.dcache_io.MdataOut

    //connect rob input
    rob.io.i_rob_allocation_reqs := dispatch.io.o_rob_allocation_reqs
    rob.io.i_ex_res_packs := execute.io.o_ex_res_packs
    rob.io.i_branch_resolve_pack := execute.io.o_branch_resolve_pack
    rob.io.i_interrupt := interrupt_mask.io.o_interrupt_with_mask
    rob.io.i_csr_pc_redirect := csr.io.o_pc_redirect_valid

    //connect csr input
    csr.io.i_exception := rob.io.o_exception
    csr.io.i_interrupt := interrupt_mask.io.o_interrupt_with_mask
    csr.io.i_commit_packs := rob.io.o_commit_packs

    //connect to interrupt mask input
    interrupt_mask.io.i_lsu_uop_valid := execute.io.o_lsu_uop_valid
    interrupt_mask.io.i_rob_idx := rob.io.o_rob_head
    interrupt_mask.io.i_lsu_uop_rob_idx := execute.io.o_lsu_uop_rob_idx
    interrupt_mask.io.i_interrupt := io.i_interrupt

    //connect regfile input
    regfile.io.i_raddr1 := reservation_station.io.o_issue_packs(0).phy_rs1 
    regfile.io.i_raddr2 := reservation_station.io.o_issue_packs(0).phy_rs2 
    regfile.io.i_raddr3 := reservation_station.io.o_issue_packs(1).phy_rs1 
    regfile.io.i_raddr4 := reservation_station.io.o_issue_packs(1).phy_rs2 

    regfile.io.i_waddr1     := csr.io.o_commit_packs_modified(0).uop.phy_dst
    regfile.io.i_waddr2     := csr.io.o_commit_packs_modified(1).uop.phy_dst
    regfile.io.i_wdata1     := csr.io.o_commit_packs_modified(0).uop.dst_value
    regfile.io.i_wdata2     := csr.io.o_commit_packs_modified(1).uop.dst_value
                            
    regfile.io.i_wenable1   := csr.io.o_commit_packs_modified(0).valid && csr.io.o_commit_packs_modified(0).uop.arch_dst =/= 0.U
    regfile.io.i_wenable2   := csr.io.o_commit_packs_modified(1).valid && csr.io.o_commit_packs_modified(1).uop.arch_dst =/= 0.U
    
    //connect back_end output
    io.o_branch_resolve_pack := execute.io.o_branch_resolve_pack
    io.o_stall := rob.io.o_full || reservation_station.io.o_full || rename.io.o_free_list_empty
    io.o_pc_redirect_valid := csr.io.o_pc_redirect_valid
    io.o_pc_redirect_target := csr.io.o_pc_redirect_target

    //for decode and dpi-c arch regs
    val arch_regs = Module(new Arch_RegFile)
    val arch_regs_output = Wire(Vec(32,UInt(64.W)))
    arch_regs.io.i_pregs := regfile.io.o_pregs
    arch_regs.io.i_rename_table := rename.io.o_commit_rename_table
    arch_regs_output := arch_regs.io.o_arch_regs
    dontTouch(arch_regs_output)
}