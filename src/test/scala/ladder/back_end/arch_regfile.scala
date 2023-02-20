package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Arch_RegFile extends Module {
    val io = IO(new Bundle{
        val i_pregs = Input(Vec(128,UInt(64.W)))
        val i_rename_table = Input(Vec(32,UInt(7.W)))

        val o_arch_regs = Output(Vec(32,UInt(64.W)))
    })
    for(i <- 0 until 32){
        io.o_arch_regs(i) := io.i_pregs(io.i_rename_table(i))
    }
}