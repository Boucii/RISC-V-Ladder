package Ladder

import chisel3._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.BitPat
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

//64 bits radix-8 booth multiplier
class Multiplier extends Module{
    val io = IO(new Bundle{
        val i_mul_valid       = Input(Bool())
        val i_flush           = Input(Bool())
        val i_mulw            = Input(Bool())
        val i_mul_signed      = Input(UInt(2.W))	
        val i_multiplicand    = Input(UInt(64.W))
        val i_multiplier	  = Input(UInt(64.W))
        val o_mul_ready	    = Output(Bool())
        val o_out_valid	    = Output(Bool())
        val o_result_hi	    = Output(UInt(64.W))
        val o_result_lo	    = Output(UInt(64.W))
    })
    val state = RegInit(0.U(3.W))
    val next_state = Wire(UInt(3.W))
    state := next_state
    next_state := Mux(io.i_flush, 0.U, state + 1.U)

    io.o_out_valid := Mux(state===7.U, true.B, false.B)
    io.o_mul_ready := Mux(state===0.U, true.B, false.B)

    val multiplier	= Reg(UInt(64.W))
    val multiplicand	= Reg(UInt(64.W))
    multiplier := Mux(io.i_mul_valid, io.i_multiplier, multiplier)
    multiplicand := Mux(io.i_mul_valid, io.i_multiplicand, multiplicand)

    val partial_products = Wire(Vec(22, UInt(131.W)) )
    //reotate left by 3 each partial product, 22 pps, (22-1)*3+64+1(sign/unsigned ext)+2(pp*4 overflow) +1(flip by bit and +1 overflow)
    val booth_x = Wire(UInt(131.W))
    //scan 4b each time, so [65,62],[62,59]....[2,-1]
    val booth_y = Wire(UInt(67.W))
    val x_64 = Wire(UInt(131.W))
    val y_64 = Wire(UInt(67.W))
    //val x_32 = Wire(UInt(131.W))
    //val y_32 = Wire(UInt(67.W))

    x_64 := MuxCase(0.U, Seq(
            (io.i_mul_signed === 0.U) -> Cat(0.U(67.W),multiplicand),
            (io.i_mul_signed === 1.U) -> 0.U(131.W),
            (io.i_mul_signed === 2.U) -> Cat(Fill(67,multiplicand(63)),multiplicand),
            (io.i_mul_signed === 3.U) -> Cat(Fill(67,multiplicand(63)),multiplicand)
            ))
    y_64 := MuxCase(0.U, Seq(
            (io.i_mul_signed === 0.U) -> Cat(Cat(0.U(2.W),multiplier),0.U(1.W)),
            (io.i_mul_signed === 1.U) -> 0.U(67.W),
            (io.i_mul_signed === 2.U) -> Cat(Cat(0.U(2.W),multiplier),0.U(1.W)),
            (io.i_mul_signed === 3.U) -> Cat(Cat(Fill(2,multiplier(63)),multiplier),0.U(1.W))
            ))
    //x_32 := Cat(Fill(99,multiplicand(31)),multiplicand(31,0)) 
    //y_32 := Cat(Cat(Fill(34,multiplier(31)),multiplier(31,0)),0.U(1.W))

    //booth_x := Mux(io.i_mulw, x_32, x_64)
    //booth_y := Mux(io.i_mulw, y_32, y_64)
    booth_x := x_64
    booth_y := y_64

    val partial_products_gen = Module(new Partial_Products_Gen())
    val wallace = Module(new Wallace_Tree())

    partial_products_gen.io.i_x := booth_x
    partial_products_gen.io.i_y := booth_y
    partial_products := partial_products_gen.io.o_partial_products

    val cout = Wire(UInt(131.W))
    val sout = Wire(UInt(131.W))

    wallace.io.i_partial_products := partial_products
    cout := wallace.io.o_c
    sout := wallace.io.o_s

    val sum = Wire(UInt(131.W))
    sum := (cout<<1) + sout

    when(io.i_mulw){
        io.o_result_hi := Fill(64,sum(31))
        io.o_result_lo := Cat(Fill(32,sum(31)),sum(31,0))
    }.otherwise{
        io.o_result_hi := sum(127,64)
        io.o_result_lo := sum(63,0)
    }
}