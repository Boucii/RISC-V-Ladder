test(new PC_Gen()){ c =>
    c.io.o_pc.expect(0x80000000L.U)
    //setup
    c.io.i_stall.poke(false.B)
    c.io.i_branch_predict_pack.valid.poke(false.B)
    c.io.i_branch_presolve_pack.mispred.poke(false.B)
    c.io.i_branch_presolve_pack.mispred.poke(false.B)
    c.clock.step(1)
    c.io.o_pc.expect(0x80000008L.U)
    
    c.clock.step(1)
    c.io.o_pc.expect(0x80000010L.U)

    //test stall
    c.io.i_stall.poke(true.B)
    c.clock.step(1)
    c.io.o_pc.expect(0x80000010L.U)

    //branchresolve test
    c.io.i_branch_resolve_pack.mispred.poke(true.B)
    c.io.i_branch_resolve_pack.target.poke(0x100.U)
    c.clock.step(1)
    c.io.o_pc.expect(0x100.U)

    c.io.i_branch_presolve_pack.mispred.poke(true.B)
    c.io.i_branch_presolve_pack.target.poke(0x200.U)
    c.clock.step(1)
    c.io.o_pc.expect(0x100.U)

    //branchpredict test
    c.io.i_branch_predict_pack.valid.poke(true.B)
    c.io.i_branch_predict_pack.taken.poke(true.B)
    c.io.i_branch_predict_pack.target.poke(0x300.U)

    c.clock.step(1)
    c.io.o_pc.expect(0x100.U)

    c.io.i_branch_resolve_pack.mispred.poke(false.B)
    c.clock.step(1)
    c.io.o_pc.expect(0x200.U)

    c.io.i_branch_presolve_pack.mispred.poke(false.B)
    c.clock.step(1)
    c.io.o_pc.expect(0x300.U)

    //shut
    c.io.i_stall.poke(false.B)
    c.io.i_branch_predict_pack.valid.poke(false.B)
    c.io.i_branch_resolve_pack.mispred.poke(false.B)
    c.io.i_branch_presolve_pack.mispred.poke(false.B)

    c.clock.step(1)
    c.io.o_pc.expect(0x308.U)
}