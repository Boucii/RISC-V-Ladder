class Fetch_Queue extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(new fetchpack))
    val out = Decoupled(new fetchpack)
    val full = Output(Bool())
    val empty = Output(Bool())
  })
  val queue = Module(new Queue(new fetchpack(), entries=64))
  queue.io.enq <> io.in
  io.out <> queue.io.deq
  io.full := !queue.io.enq.ready
  io.empty := !queue.io.deq.valid
}