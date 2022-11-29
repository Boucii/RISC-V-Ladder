class GCDSpec extends AnyFreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {
  test(new if1_if2) { c =>
    c.clock.step(1)
    c.io.i_stall.poke(0.U)
    c.io.i_flush.poke(0.U)
    c.io.i_pc.poke(0x100.U)
    c.io.i_branch_predict_pack.valid.poke(true.B)
    c.io.i_branch_predict_pack.taken.poke(true.B)
    c.io.i_branch_predict_pack.target.poke(0x200.U)

    c.clock.step(1)
    c.io.o_pc.expect(0x100.U)
    c.io.o_branch_predict_pack.valid.expect(true.B)
    c.io.o_branch_predict_pack.taken.expect(true.B)
    c.io.o_branch_predict_pack.target.expect(0x200.U)

    c.io.i_pc.poke(0x200.U)
    c.io.i_branch_predict_pack.valid.poke(false.B)
    c.io.i_branch_predict_pack.taken.poke(false.B)
    c.io.i_branch_predict_pack.target.poke(0x300.U)

    c.io.o_pc.expect(0x100.U)
    c.io.o_branch_predict_pack.valid.expect(true.B)
    c.io.o_branch_predict_pack.taken.expect(true.B)
    c.io.o_branch_predict_pack.target.expect(0x200.U)

    c.clock.step(1)
    c.io.o_pc.expect(0x200.U)
    c.io.o_branch_predict_pack.valid.expect(false.B)
    c.io.o_branch_predict_pack.taken.expect(false.B)
    c.io.o_branch_predict_pack.target.expect(0x300.U)
    c.io.i_stall.poke(true.B)
    c.io.i_pc.poke(0x100.U)
    c.io.i_branch_predict_pack.valid.poke(true.B)
    c.io.i_branch_predict_pack.taken.poke(true.B)
    c.io.i_branch_predict_pack.target.poke(0x200.U)

    c.clock.step(1)
    c.io.o_pc.expect(0x200.U)
    c.io.o_branch_predict_pack.valid.expect(false.B)
    c.io.o_branch_predict_pack.taken.expect(false.B)
    c.io.o_branch_predict_pack.target.expect(0x300.U)
    c.io.i_flush.poke(true.B)

    c.clock.step(1)
    c.io.o_pc.expect(0.U)
    c.io.o_branch_predict_pack.valid.expect(false.B)
    c.io.o_branch_predict_pack.taken.expect(false.B)
    c.io.o_branch_predict_pack.target.expect(0x0.U)
  }}
}