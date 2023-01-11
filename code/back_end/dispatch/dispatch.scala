package Ladder

import chisel3._

class Dispatch extends Module{
    val io=IO(new Bundle{
        val i_rename_packs=Input(Vec(2,new uop()))
        val i_rob_busy = Input(Bool()) // this seems to be redundent
        val i_rob_allocation_ress=Input(Vec(2,new allocation_res_pack()))
        //from reservation station
        val i_reservation_station_full=Input(new Bool())//when rs has 0 or 1 free,stall anyway
        //from exection unit
        val i_branch_resolve_pack=Input(new branch_resolve_pack())
        //to rob
        val o_rob_allocation_reqs=Output(Vec(2,new rob_allocation_req_pack()))
        //val i_rob_full=Input(new Bool()) //this seems to be redundent since when rob full,allocation req = invalid
        val o_dispatch_packs=Output(Vec(2,new uop()))

        val i_exception = Input(Bool())
    })
    //we have to check both of rh e allocation valid, since two of the insts perhaps have one inst invalid.(edge of a branch)
    //val stall_for_rob = (io.i_rob_allocation_ress(0).valid ^ uops(0).valid)|| (io.i_rob_allocation_ress(1).valid ^ uops(1).valid)
    //TODO:this stall was decoupled, consider it further
    val stall = io.i_reservation_station_full 

    val uops=Reg(Vec(2, new uop()))
    uops:=Mux(stall,uops,io.i_rename_packs)//this seems not really necessary, since stall also works for formal stage
    when(io.i_exception){
        uops(0).valid:=false.B
        uops(1).valid:=false.B
    }
    //we dont have to check if theres a branch mispred,cause when that happens, rob wont allocate for insts, but we add it anyway(latancy increse)
    io.o_rob_allocation_reqs(0).valid:=Mux(io.i_reservation_station_full || (io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred) ,false.B,uops(0).valid)
    io.o_rob_allocation_reqs(1).valid:=Mux(io.i_reservation_station_full || (io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred) ,false.B,uops(1).valid)

    io.o_rob_allocation_reqs(0).uop := uops(0) 
    io.o_rob_allocation_reqs(1).uop := uops(1) 

    io.o_dispatch_packs(0) := uops(0)
    io.o_dispatch_packs(1) := uops(1)
    when((io.i_branch_resolve_pack.valid&&io.i_branch_resolve_pack.mispred)||stall){
        io.o_dispatch_packs(0).valid:=false.B
        io.o_dispatch_packs(1).valid:=false.B
    }
    io.o_dispatch_packs(0).rob_idx:=io.i_rob_allocation_ress(0).rob_idx
    io.o_dispatch_packs(1).rob_idx:=io.i_rob_allocation_ress(1).rob_idx
}