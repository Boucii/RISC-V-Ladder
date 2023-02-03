package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class dpic extends BlackBox{
  val io = IO(new Bundle{
    val clk = Input(Clock())
    val stop = Input(Bool())

    val data_valid = Output(Bool())
    val data_ready = Input(Bool())
    val addr_ready = Output(Bool())
    val addr_valid = Input(Bool())
    val Mwout = Input(Bool())
    val Maddr = Input(Bool())
    val Men = Input(Bool())
    val Mlen = Input(Bool())
    val MdataIn = Input(Bool())
    val MdataOut = Input(UInt(64.W))

    //regfile dpi
    val regs0 = Input(UInt(64.W))
    val regs1 = Input(UInt(64.W))
    val regs2 = Input(UInt(64.W))
    val regs3 = Input(UInt(64.W))
    val regs4 = Input(UInt(64.W))
    val regs5 = Input(UInt(64.W))
    val regs6 = Input(UInt(64.W))
    val regs7 = Input(UInt(64.W))
    val regs8 = Input(UInt(64.W))
    val regs9 = Input(UInt(64.W))
    val regs10 = Input(UInt(64.W))
    val regs11 = Input(UInt(64.W))
    val regs12 = Input(UInt(64.W))
    val regs13 = Input(UInt(64.W))
    val regs14 = Input(UInt(64.W))
    val regs15 = Input(UInt(64.W))
    val regs16 = Input(UInt(64.W))
    val regs17 = Input(UInt(64.W))
    val regs18 = Input(UInt(64.W))
    val regs19 = Input(UInt(64.W))
    val regs20 = Input(UInt(64.W))
    val regs21 = Input(UInt(64.W))
    val regs22 = Input(UInt(64.W))
    val regs23 = Input(UInt(64.W))
    val regs24 = Input(UInt(64.W))
    val regs25 = Input(UInt(64.W))
    val regs26 = Input(UInt(64.W))
    val regs27 = Input(UInt(64.W))
    val regs28 = Input(UInt(64.W))
    val regs29 = Input(UInt(64.W))
    val regs30 = Input(UInt(64.W))
    val regs31 = Input(UInt(64.W))
  })
}