package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.BitPat
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

//this module is used in the following scenario:
//when executing a store in lsu, and the memory returns in more than one cycle( weather it's for cache miss or anything else)
//if an interrupt occurs, due to the axi bus transactions can't br canceled, we must finish the store instruction and then deal 
//with the interrupt. When the store is commited(commit_ptr changed), we can go on unmask the interrupt signal.
class Interrupt_Mask extends Module{
    val io = IO(new Bundle{
    	val i_lsu_uop_valid = Input(Bool())
    	val i_rob_idx  = Input(UInt(8.W))
        val i_lsu_uop_rob_idx = Input(UInt(8.W))

        val i_interrupt = Input(Bool())
        val o_interrupt_with_mask = Output(Bool())
    })
    val mask = RegInit(false.B)
    val next_mask = Wire(Bool())
    mask := next_mask
    val cmt_ptr = RegInit(0.U(8.W))
    next_mask := mask
    when(io.i_lsu_uop_valid && io.i_lsu_uop_rob_idx===io.i_rob_idx){
    	next_mask := true.B 
    	cmt_ptr := io.i_rob_idx 
    	}
    when(mask===true.B && io.i_rob_idx =/= cmt_ptr){
    	next_mask := false.B
    }
    io.o_interrupt_with_mask := Mux(next_mask,false.B,io.i_interrupt)
}