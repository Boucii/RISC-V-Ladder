package Ladder

import chisel3._ 
import chisel3.ExplicitCompileOptions.Strict
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.BitPat
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
import chisel3.stage._

//test:runMain Ladder.GenVerilog
object GenVerilog extends App{
(new ChiselStage).execute(
  Array(
    "-X", "verilog",
    "-e", "verilog", 
    "--target-dir", "genrtl"), 
  Seq(ChiselGeneratorAnnotation(() => new Ladder()))
)
}

/*
class GCDSpec extends AnyFreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
  test(new Back_End_With_Decode()).withAnnotations(Seq( WriteVcdAnnotation )) { c =>
    c.io.i_fetch_pack.valid.poke(false.B)
    c.io.i_fetch_pack.bits.pc.poke(0.U)
    c.io.i_fetch_pack.bits.insts(0).poke(0.U)
    c.io.i_fetch_pack.bits.insts(1).poke(0.U)
    c.io.i_fetch_pack.bits.branch_predict_packs(0).valid.poke(false.B)
    c.io.i_fetch_pack.bits.branch_predict_packs(1).valid.poke(false.B)
    c.clock.step(1)
    c.io.i_fetch_pack.bits.pc.poke(0.U)
    c.io.i_fetch_pack.bits.insts(0).poke(0x00508093.U)
    c.io.i_fetch_pack.bits.insts(1).poke(0x00419263.U)

    c.io.i_fetch_pack.bits.branch_predict_packs(1).valid.poke(true.B)
    c.io.i_fetch_pack.bits.branch_predict_packs(1).is_branch.poke(true.B)
    c.io.i_fetch_pack.bits.branch_predict_packs(1).taken.poke(false.B)
    c.io.i_fetch_pack.bits.branch_predict_packs(1).target.poke(0.U)
    c.io.i_fetch_pack.valid.poke(true.B)
    c.clock.step(1)
    c.io.i_fetch_pack.bits.pc.poke(0.U)
    c.io.i_fetch_pack.bits.insts(0).poke(0x00510113.U)
    c.io.i_fetch_pack.bits.insts(1).poke(0x00510213.U)
    c.io.i_fetch_pack.bits.branch_predict_packs(0).valid.poke(false.B)
    c.io.i_fetch_pack.bits.branch_predict_packs(1).valid.poke(false.B)
    c.clock.step(1)
    c.io.i_fetch_pack.bits.pc.poke(0.U)
    c.io.i_fetch_pack.bits.insts(0).poke(0x00520113.U)
    c.io.i_fetch_pack.bits.insts(1).poke(0x00528213.U)
    c.clock.step(1)
    c.io.i_fetch_pack.bits.pc.poke(0.U)
    c.io.i_fetch_pack.bits.insts(0).poke(0x00110233.U)
    c.io.i_fetch_pack.bits.insts(1).poke(0x00110233.U)
    c.clock.step(1)
    c.io.i_fetch_pack.valid.poke(false.B)
    c.clock.step(1)
    c.io.i_fetch_pack.valid.poke(false.B)
    c.clock.step(1)
    c.clock.step(1)
    c.clock.step(1)
    c.clock.step(1)
    c.clock.step(1)
    c.clock.step(1)

  }}
}
//test -- -DwriteVcd=1 
//test -- -DwriteVcd=1 --debug 
*/
