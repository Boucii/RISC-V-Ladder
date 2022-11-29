class Reorder_Buffer extends Module{
    val io =IO(new Bundle{
        //from and to decode stage
        val i_allocate_valids =
        val i_allocate_uops =

        val o_empty = Output(Bool())
        val o_full =Output(Bool())

        //commit stage
        val o_commit_pack = Output(new commit_pack())


    })
    val commit_ptr = UInt()
    val allocate_ptr = UInt()
    val mispred_ptr = UInt()

    val s_reset :: s_normal :: s_rollback :: s_wait_till_empty :: Nil = Enum(4)//modify this
    val rob_state = RegInit(s_reset)

    commit_ptr:=0.U
    allocate_ptr:=0.U
    mispred_ptr:=0.U


    //rob entries: should we wrap this in module or bundle?
    val rob_valid = RegInit(VecInit(Seq.fill(numRobRows){false.B}))
    val uop = Reg(Vec(numRobRows, new MicroOp()))
    val rob_exception = Reg(Vec(numRobRows, Bool()))

}