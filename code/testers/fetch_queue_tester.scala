//令queue的深度为4，即queue（3）
test(new Fetch_Queue()){ c =>
    // Example testsequence showing the use and behavior of Queue
    c.io.in.valid.poke(false.B)
    c.io.out.ready.poke(false.B)
    c.clock.step(1)
    c.io.in.bits.pc.poke(1.U)
    c.io.in.bits.inst.poke(1.U)
    c.io.in.valid.poke(true.B)
    c.clock.step(1)
    c.io.in.valid.poke(false.B)
    c.clock.step(1)
    c.io.in.bits.pc.poke(2.U)
    c.io.in.bits.inst.poke(2.U)
    c.io.in.valid.poke(true.B)
    c.io.full.expect(false.B)
    c.clock.step(1)
    c.io.in.valid.poke(false.B)
    c.clock.step(1)
    c.io.in.bits.pc.poke(3.U)
    c.io.in.bits.inst.poke(3.U)
    c.io.in.valid.poke(true.B)  
    c.clock.step(1)
    c.io.in.valid.poke(false.B)
    c.clock.step(1)
    c.io.in.bits.pc.poke(4.U)
    c.io.in.bits.inst.poke(4.U)
    c.io.in.valid.poke(true.B) 
    c.io.full.expect(true.B)
    c.io.out.ready.poke(true.B)
    c.io.out.bits.pc.expect(1.U)
    c.clock.step(1)
    c.io.out.bits.pc.expect(2.U)
    c.clock.step(1)
    c.io.out.bits.pc.expect(3.U)
    c.clock.step(1)
    c.io.out.bits.pc.expect(4.U)
    
}