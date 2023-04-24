package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class S011HD1P_X32Y2D128_BW extends BlackBox{
    val io = IO(new Bundle{
        val Q = Output(UInt(128.W))
        val CLK = Input(Clock())
        val CEN = Input(Bool())
        val WEN = Input(Bool())
        val BWEN = Input(UInt(128.W))
        val A = Input(UInt(6.W))
        val D = Input(UInt(128.W))
    })
}
