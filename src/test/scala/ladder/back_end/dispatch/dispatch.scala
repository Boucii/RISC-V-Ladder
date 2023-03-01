package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Dispatch extends Module{
    val io=IO(new Bundle{
        val i_rename_packs=Input(Vec(2,new uop()))
        val i_rob_busy = Input(Bool()) // this seems to be redundent, (from later: no it's not)
        val i_rob_allocation_ress=Input(Vec(2,new allocation_res_pack()))
        //from reservation station
        val i_reservation_station_full=Input(new Bool())//when rs has 0 or 1 free,stall anyway
        //from exection unit
        //the details of rollback, check rename and decoder io module.
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
    val stall = io.i_reservation_station_full || io.i_rob_busy

    val uops=RegInit(0.U.asTypeOf(Vec(2, new uop())))
    uops:=Mux(stall,uops,io.i_rename_packs)//this seems not really necessary, since stall also works for formal stage
    //this logic should be changed when decode doesn't block front end input when rbk. 
    when(io.i_exception || (io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred)){
        uops(0).valid:=false.B
        uops(1).valid:=false.B
    }
    //1.we dont have to check if theres a branch mispred,cause when that happens, rob wont allocate for insts
    //and we MUST not mask the allocation req when mispred, the logic is explained in rob the file, the rollback log part.
    //this also implies that the insts in dispatch are always flushed when rbk. since all insts before a certain br must be already at or after rs. 
    //aka. insts are inorder in brfore rs.
    //2.another case is when stall and rollback happen in the same time,we should manually tuen req=uopvalid in order to let rob rollback those two insts.
    //stall && (rbk)->uopvalid
    //!stall && rbk ->uopvalid
    //stall && !rbk -> false
    //!stall && !rbk ->uopvalid

    io.o_rob_allocation_reqs(0).valid:=Mux(((io.i_reservation_station_full || io.i_rob_busy) && !(io.i_branch_resolve_pack.mispred && io.i_branch_resolve_pack.valid)) ,false.B,uops(0).valid)
    io.o_rob_allocation_reqs(1).valid:=Mux(((io.i_reservation_station_full || io.i_rob_busy) && !(io.i_branch_resolve_pack.mispred && io.i_branch_resolve_pack.valid)) ,false.B,uops(1).valid)

    io.o_rob_allocation_reqs(0).uop := uops(0) 
    io.o_rob_allocation_reqs(1).uop := uops(1) 

    io.o_dispatch_packs(0) := uops(0)
    io.o_dispatch_packs(1) := uops(1)
    io.o_dispatch_packs(0).valid := uops(0).valid
    io.o_dispatch_packs(1).valid := uops(1).valid
    when((io.i_branch_resolve_pack.valid&&io.i_branch_resolve_pack.mispred)||stall){
        io.o_dispatch_packs(0).valid:=false.B
        io.o_dispatch_packs(1).valid:=false.B
    }
    io.o_dispatch_packs(0).rob_idx:=io.i_rob_allocation_ress(0).rob_idx
    io.o_dispatch_packs(1).rob_idx:=io.i_rob_allocation_ress(1).rob_idx
}
