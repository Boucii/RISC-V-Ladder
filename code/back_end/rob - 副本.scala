class Reorder_Buffer extends Module{
    val io =IO(new Bundle{
        //from and to decode stage
        val i_allocate_valids =
        val i_allocate_uops =
        
        val flush = Input(Bool())

        val o_empty = Output(Bool())
        val o_full =Output(Bool())

        val i_ex_result_pack = Output(Vec(2,new ex_result_pack()))))
        //commit stage
        val o_commit_pack = Output(new commit_pack())


    })
    val commit_ptr = RegInit(0.U(log2Ceil(numRobRows).W))//rob head
    val allocate_ptr = RegInit(0.U(log2Ceil(numRobRows).W))//rob tail
    val mispred_ptr = UInt()
    commit_ptr:=0.U
    allocate_ptr:=0.U
    mispred_ptr:=0.U

    val will_commit = Wire(Vec(2,Bool()))
    val can_commit = Wire(Vec(2,Bool()))

    val s_reset :: s_normal :: s_rollback :: s_wait_till_empty :: Nil = Enum(4)//modify this
    val rob_state = RegInit(s_reset)

    io.o_commit_pack.valid(0) := will_commit(0)
    io.o_commit_pack.valid(1) := will_commit(1)
    io.o_commit_pack.uops(0) := rob_uop(commit_ptr)
    io.o_commit_pack.uops(1) := rob_uop(commit_ptr+1)

    //rob entries: should we wrap this in module or bundle?
    val rob_valid = RegInit(VecInit(Seq.fill(numRobRows){false.B}))
    val rob_uop = Reg(Vec(numRobRows, new MicroOp()))
    val rob_exception = Reg(Vec(numRobRows, Bool()))
    val rob_done = Reg(Vec(numRobRows, Bool())) // is this instr written back and ready to commit?

    when(will_commit(0)){
      rob_valid(commit_ptr) := false.B 
    }
    when(will_commit(1)){
      rob_valid(commit_ptr+1) := false.B
    }

    //dispatch unit
    when(io.i_dispatch_pack.valid(0)){
      rob_uop(allocate_ptr) := io.i_allocate_uops(0)
      rob_valid(allocate_ptr) := true.B
      allocate_ptr := allocate_ptr + 1.U //+1+1 seems not working
      rob_done(allocate_ptr) := false.B
    }
    when(io.i_dispatch_pack.valid(1)){
      rob_uop(allocate_ptr) := io.i_allocate_uops(1)
      rob_valid(allocate_ptr) := true.B
      allocate_ptr := allocate_ptr + 1.U
      rob_done(allocate_ptr) := false.B
    }

    //write from exe, aka write back
    when(i_ex_result_pack.valid && rob_state === s_normal){
      rob_valid(i_ex_result_pack(0).rob_idx) := true.B
      rob_uop(i_ex_result_pack(0).rob_idx) := i_ex_result_pack.uop
      rob_exception(i_ex_result_pack(0).rob_idx) := i_ex_result_pack.exception
      rob_done(i_ex_result_pack(0).rob_idx) := true.B


      rob_valid(i_ex_result_pack(1).rob_idx) := true.B
      rob_uop(i_ex_result_pack(1).rob_idx) := i_ex_result_pack.uop
      rob_exception(i_ex_result_pack(1).rob_idx) := i_ex_result_pack.exception
      rob_done(i_ex_result_pack(1).rob_idx) := true.B
    }

    //commit
    can_commit(0) := rob_valid(commit_ptr) && rob_done(commit_ptr)
    can_commit(1) := rob_valid(commit_ptr+1) && rob_done(commit_ptr+1)

    will_commit(0) := rob_valid(
    will_commit(1) := rob_valid(  

    when(rob_state===s_normal){
      o_commit_pack:=rob(commit_ptr,commit_ptr+1)
      when(will_commit(0) && will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    //exception
    when(rob_state===s_normal){
      allocate_ptr:=0.U
      commit_ptr:=0.U
    }

    io.commit_pack.valid(0) := will_commit(0)
    io.commit_pack.valid(1) := will_commit(1)
    io.commit_pack.uops(0) := rob_uop(commit_ptr)
    io.commit_pack.uops(1) := rob_uop(commit_ptr+1)

    io.o_empty :=  commit_ptr === allocate_ptr  
    io.o_full := (allocate_ptr + 2.U) === commit_ptr //?

    will_commit(0) = can_commit(0) && !rob_exception(commit_ptr)
    will_commit(1) = can_commit(1) &&!rob_exception


    
    switch (rob_state) {
       is (s_reset) {
         rob_state := s_normal
       }
       is (s_normal) {
         when (exception) {
           ; //rob_state := s_rollback roll back within1 cycle
         }.elsewhen(mispred){
             rob_state := s_rollback
         }
       }
       is (s_rollback) {
         when (allocate_ptr  === commit_ptr) {
           rob_state := s_normal
         }
       }

     }
}