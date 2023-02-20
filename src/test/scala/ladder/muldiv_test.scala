package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.BitPat
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class divtest extends AnyFreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
  test(new Execute()).withAnnotations(Seq( WriteVcdAnnotation )) { c =>
//initial input:

c.io.i_issue_res_packs(0).valid.poke(false.B)
c.io.i_issue_res_packs(0).rob_idx.poke(0.U)
c.io.i_issue_res_packs(1).valid.poke(false.B)
c.io.i_exception.poke(false.B)
c.io.i_rollback_valid.poke(false.B)
//initial combinational logic output:

c.io.o_ex_res_packs(0).valid.expect(false.B)
c.io.o_ex_res_packs(0).uop.dst_value.expect(0.U)
c.io.o_ex_res_packs(1).valid.expect(false.B)
c.io.o_ex_res_packs(1).uop.dst_value.expect(0.U)
c.io.o_branch_resolve_pack.valid.expect(false.B)


//clock=0
c.clock.step(1)
c.io.i_issue_res_packs(0).valid.poke(true.B)
c.io.i_issue_res_packs(0).func_code.poke(16.U)
c.io.i_issue_res_packs(0).src1_value.poke(9.U)
c.io.i_issue_res_packs(0).src2_value.poke(4.U)
c.io.i_issue_res_packs(0).alu_sel.poke(0.U)
c.io.i_issue_res_packs(0).inst.poke(0x02114233)
c.io.i_issue_res_packs(1).valid.poke(false.B)


//clock=1
c.clock.step(1)


//clock=2.0
for(i <- 0 until 70){
  c.clock.step(1)
}

  }}
}
//test -- -DwriteVcd=1 
//test -- -DwriteVcd=1 --debug 