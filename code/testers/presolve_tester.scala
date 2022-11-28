class GCDSpec extends AnyFreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
  test(new branch_presolve) { c =>
    c.clock.step(1)
    c.io.i_fetch_pack.pc.poke(0x100.U)
    c.io.i_fetch_pack.insts(0).poke("b000000001100011".U)
    c.io.i_fetch_pack.insts(1).poke("b0".U)
    c.io.i_branch_predict_pack.valid.poke(false.B)
    c.io.o_branch_presolve_pack.mispred.expect(true.B)
  }}
}