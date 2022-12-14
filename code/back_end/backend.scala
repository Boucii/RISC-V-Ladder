package Ladder
/*
1.查看流水线的reg是否放进去了
2.统计stall信号,flush信号以及exception的关系
3.regfile读塞进去
4.regfile写
5.dcacheio重新放一下
*/
class Back_End extends Module{
    val io = IO(new Bundle{
        val i_decode_packs = Input(Vec(2,new uop()))

        val o_branch_resolve_pack = Output(new branch_resolve_pack())
        val o_stall = Output(Bool())
        val o_exception = Output(Bool())

        val Dcache_io = new DcacheIO()

    }) 
    val rename  = Module(new Rename())
    val dispatch = Module(new Dispatch())
    val reservation_station = Module(new Reservation_Station())
    val phy_reg = Module(new RegFile())
    val execute =Module(new Execute())
    val rob = Module(new Reorder_Buffer())

    //connect rename input
    rename.io.i_decode_packs    := io.i_decode_packs
    rename.io.i_commit_packs    := rob.io.o_commit_packs
    rename.io.i_rollback_packs  := rob.io.o_rollback_packs
    rename.io.i_exception       := rob.io.o_exception
    rename.io.i_stall           := rob.io.o_full || reservation_station.io.o_full 

    //connect dispatch input
    dispatch.io.i_rename_packs              := rename.io.o_rename_packs
    dispatch.io.i_rob_busy                  := rob.io.o_full//???
    dispatch.io.i_rob_allocation_ress       := rob.io.o_rob_allocation_ress
    dispatch.io.i_reservation_station_full  := reservation_station.io.o_full
    dispatch.io.i_branch_resolve_pack       := execute.io.o_branch_resolve_pack
    dispatch.io.i_exception                 := rob.io.o_exception

    //connect reservation station input
    reservation_station.io.i_dispatch_packs := dispatch.io.o_dispatch_packs
    reservation_station.io.i_wakeup_port := rename.io.o_written_back_table
    reservation_station.io.i_branch_resolve_pack := execute.io.o_branch_resolve_pack
    reservation_station.io.i_exception := rob.io.o_exception//???
    reservation_station.io.i_available_funcs := execute.io.o_available_funcs//???

    //connect execute input //??regfileread
    //this increses the critical path, i suppose
    exceute.io.i_exception := rob.io.o_exception
    execute.io.i_issue_res_packs := reservation_station.io.o_issue_res_packs
    execute.io.i_ROB_first_entry := rob.io.o_rob_head
    when(execute.io.i_issue_res_packs(0).op1_sel === SRC_RS){
        execute.io.i_issue_res_packs(0).src1_value := regfile.io.o_rdata1 
    }
    when(execute.io.i_issue_res_packs(0).op2_sel === SRC_RS){
        execute.io.i_issue_res_packs(0).src2_value := regfile.io.o_rdata2
    }
    when(execute.io.i_issue_res_packs(1).op1_sel === SRC_RS){
        execute.io.i_issue_res_packs(1).src1_value := regfile.io.o_rdata3 
    }
    when(execute.io.i_issue_res_packs(1).op2_sel === SRC_RS){
        execute.io.i_issue_res_packs(1).src2_value := regfile.io.o_rdata4 
    }

    //dcache
    execute.io.dcache_io.valid      := io.dcache_io.valid  
    execute.io.dcache_io.MdataIn    := io.dcache_io.MdataIn  
    io.dcache_io.ready              :=execute.io.dcache_io.ready  
    io.dcache_io.Mwout              :=execute.io.dcache_io.Mwout  
    io.dcache_io.Maddr              :=execute.io.dcache_io.Maddr  
    io.dcache_io.Men                :=execute.io.dcache_io.Men    
    io.dcache_io.Mlen               :=execute.io.dcache_io.Mlen   
    io.dcache_io.MdataOut           :=execute.io.dcache_io.MdataOut

    //connect rob input
    rob.io.i_rob_allocation_reqs := dispatch.io.o_rob_allocation_reqs
    rob.io.i_ex_res_packs := execute.io.o_ex_res_packs
    rob.io.i_branch_resolve_pack := execute.io.o_branch_resolve_pack

    //connect regfile input
    regfile.io.i_raddr1 := reservation_station.io.o_issue_packs(0).phy_rs1 
    regfile.io.i_raddr2 := reservation_station.io.o_issue_packs(0).phy_rs2 
    regfile.io.i_raddr3 := reservation_station.io.o_issue_packs(1).phy_rs1 
    regfile.io.i_raddr4 := reservation_station.io.o_issue_packs(1).phy_rs2 

    regfile.io.i_waddr1     := rob.io.o_commit_packs(0).uop.phy_dst
    regfile.io.i_waddr2     := rob.io.o_commit_packs(1).uop.phy_dst
    regfile.io.i_wdata1     := rob.io.o_commit_packs(0).uop.dst_value
    regfile.io.i_wdata2     := rob.io.o_commit_packs(1).uop.dst_value
                            
    regfile.io.i_wenable1   := rob.io.o_commit_packs(0).valid && rob.io.o_commit_packs(0).uop.arch_dst =/= 0.U
    regfile.io.i_wenable2   := rob.io.o_commit_packs(1).valid && rob.io.o_commit_packs(1).uop.arch_dst =/= 0.U
    
    //connect back_end output
    io.o_branch_resolve_pack := execute.io.o_branch_resolve_pack
    io.o_stall := rob.io.o_full || reservation_station.io.o_full 
    io.o_exception := rob.io.o_exception
}