class allocation_res_pack extends Bundle{
    val rob_idx = UInt(7.W)
    val valid = Bool()
}
class Reorder_Buffer extends Module{
    val io =IO(new Bundle{
        //val i_flush = Input(Bool())
        val o_empty = Output(Bool())
        val o_full =Output(Bool())

        //from and to decode stage
        val i_rob_allocation_reqs = Input(Vec(2,Bool()))
        val o_rob_allocation_ress = Output(Vec(2,new allocation_res_pack()))

        //to rename stage 
        val o_roll_back_pack = Output(Vec(2,new valid_uop_pack()))
        //from exe stage
        val i_ex_res_packs = Input(Vec(2,new valid_uop_pack()))
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        //commit stage
        val o_commit_packs = Output(Vec(2,new valid_uop_pack()))
        //output to load/store
        val o_rob_head = Output(UInt(7.W))

        //for debug
        val dbg_commit_ptr = Output(UInt(7.W))
        val dbg_allocate_ptr = Output(UInt(7.W))
        //val rob_state = Output(s_normal.asUInt())
    })

    val commit_ptr = RegInit(0.U(7.W))//rob head
    val allocate_ptr = RegInit(0.U(7.W))//rob tail

    commit_ptr:=0.U
    allocate_ptr:=0.U

    val s_reset :: s_normal :: s_rollback :: s_full :: Nil = Enum(4)//modify this FULL added make 1 slot available also full
    val rob_state = RegInit(s_normal)

    io.dbg_commit_ptr:=commit_ptr
    io.dbg_allocate_ptr:=allocate_ptr
    printf("rob_state:%d\n",rob_state)
    //io.rob_state:=rob_state

    val num_to_roll_back = RegInit(0.U(7.W))
    //!!!!!!改了branchresolvepakc的结果
    num_to_roll_back := MuxCase(0.U,Seq(
      (io.i_branch_resolve_pack.valid === true.B && commit_ptr-2.U > io.i_branch_resolve_pack.rob_idx) ->2.U,
      (io.i_branch_resolve_pack.valid === true.B && commit_ptr-2.U === io.i_branch_resolve_pack.rob_idx) ->2.U,
      (io.i_branch_resolve_pack.valid === true.B && commit_ptr-1.U === io.i_branch_resolve_pack.rob_idx) ->1.U
    )) 
    io.o_rob_head := commit_ptr

    //rob entries: should we wrap this in module or bundle?
    val rob_valid = RegInit(VecInit(Seq.fill(128){false.B}))
    val rob_uop = Reg(Vec(128, new uop()))
    val rob_exception = Reg(Vec(128, Bool()))
    val rob_done = Reg(Vec(128, Bool())) // is this instr written back and ready to commit?

    val will_commit = Wire(Vec(2,Bool()))
    val can_commit = Wire(Vec(2,Bool()))

    can_commit(0) := (rob_valid(commit_ptr)) && (rob_done(commit_ptr))
    can_commit(1) := rob_valid(commit_ptr+1.U) && rob_done(commit_ptr+1.U)

    will_commit(0) := can_commit(0) && (rob_state===s_normal || rob_state===s_full )
    will_commit(1) := can_commit(0) && can_commit(1) && (rob_state===s_normal || rob_state===s_full)

    //dispatch unit TODO:ptr pass 127??consider full???consider exception
      io.o_commit_packs(0).valid := (will_commit(0))&& (rob_state===s_normal || rob_state===s_full )
      io.o_commit_packs(1).valid := (will_commit(1))&&(will_commit(0))&& (rob_state===s_normal || rob_state===s_full )
      io.o_commit_packs(0).uop := (rob_uop(commit_ptr))
      io.o_commit_packs(1).uop := (rob_uop(commit_ptr+1.U))

      io.o_rob_allocation_ress(0).valid := !(rob_state===s_rollback || rob_state===s_full ) && io.i_rob_allocation_reqs(0)
      io.o_rob_allocation_ress(1).valid := !(rob_state===s_rollback || rob_state===s_full ) && io.i_rob_allocation_reqs(1) && io.i_rob_allocation_reqs(0) //dispatch 会req1 而不req0吗
      
      io.o_roll_back_pack(0).valid := rob_state===s_rollback
      io.o_roll_back_pack(1).valid := (num_to_roll_back === 2.U) && rob_state===s_rollback
      
      io.o_roll_back_pack(0).uop:=rob_uop(commit_ptr)
      io.o_roll_back_pack(1).uop:=rob_uop(commit_ptr-1.U)

      io.o_rob_allocation_ress(0).rob_idx := allocate_ptr
      io.o_rob_allocation_ress(1).rob_idx := allocate_ptr+1.U

    when(rob_state === s_normal){
      when(io.i_rob_allocation_reqs(0) && io.i_rob_allocation_reqs(1)){
        rob_valid(allocate_ptr) := true.B
        rob_done(allocate_ptr) := false.B
        rob_valid(allocate_ptr+1.U) := true.B
        rob_done(allocate_ptr+1.U) := false.B
        allocate_ptr := allocate_ptr + 2.U 
      }.elsewhen(io.i_rob_allocation_reqs(0) || io.i_rob_allocation_reqs(1)){
        rob_valid(allocate_ptr) := true.B
        allocate_ptr := allocate_ptr + 1.U
        rob_done(allocate_ptr) := false.B
      }//otherwise no allocation

      when(io.i_ex_res_packs(0).valid){
        rob_valid(io.i_ex_res_packs(0).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop
        rob_exception(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop.exception
        rob_done(io.i_ex_res_packs(0).uop.rob_idx) := true.B
      }
      when(io.i_ex_res_packs(1).valid){
        rob_valid(io.i_ex_res_packs(1).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop
        rob_exception(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop.exception
        rob_done(io.i_ex_res_packs(1).uop.rob_idx) := true.B
      }
      //commit

      when(will_commit(0) && will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1.U) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    when(rob_state === s_full){

      //when full cannot allocate ,but can roll back,exe write and commit
      when(io.i_ex_res_packs(0).valid){
        rob_valid(io.i_ex_res_packs(0).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop
        rob_exception(io.i_ex_res_packs(0).uop.rob_idx) := io.i_ex_res_packs(0).uop.exception
        rob_done(io.i_ex_res_packs(0).uop.rob_idx) := true.B
      }
      when(io.i_ex_res_packs(1).valid){
        rob_valid(io.i_ex_res_packs(1).uop.rob_idx) := true.B
        rob_uop(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop
        rob_exception(io.i_ex_res_packs(1).uop.rob_idx) := io.i_ex_res_packs(1).uop.exception
        rob_done(io.i_ex_res_packs(1).uop.rob_idx) := true.B
      }
      //commit
      when(will_commit(0) && will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1.U) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    when(rob_state === s_rollback){
      commit_ptr := commit_ptr - num_to_roll_back
    }


    (rob_exception(commit_ptr)===true.B && will_commit(0)===true.B || 
          (rob_exception(commit_ptr+1.U)===true.B && will_commit(0)===true.B && will_commit(1)===true.B))

    val is_full =Wire(Bool()) //consider dynamic action
    is_full := (allocate_ptr + 2.U) === commit_ptr || (allocate_ptr + 1.U) === commit_ptr
    io.o_empty :=  commit_ptr === allocate_ptr  
    io.o_full := is_full


    switch (rob_state) {
       is (s_reset) {//optimize this reset for exception
         rob_state := s_normal
       }
       is (s_normal) {
          when (io.i_branch_resolve_pack.mispred && !io.i_branch_resolve_pack.valid) {
            rob_state := s_rollback
          }.elsewhen (is_full) {
            rob_state := s_full
          }
       }
       is (s_rollback) {
         when (io.i_branch_resolve_pack.rob_idx === commit_ptr) {//????
           rob_state := s_normal
         }
       }
       is(s_full) {
          when(will_commit(0)){
            rob_state:= s_normal
          }
       }

     }
}
/*
class Reorder_Buffer extends Module{
    val io =IO(new Bundle{
        val flush = Input(Bool())
        val o_empty = Output(Bool())
        val o_full =Output(Bool())

        //from and to decode stage
        val i_rob_allocation_reqs = Input(Vec(2,Bool()))
        val o_rob_allocation_ress = Output(Vec(2,new allocation_res_pack()))
        //to rename stage 
        val o_roll_back_pack = Output(Vec(2,new roll_back_pack()))
        //from exe stage
        val i_ex_result_packs = Input(Valid(Vec(2,new ex_result_pack())))
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        //commit stage
        val o_commit_pack = Output(new commit_pack())
        //output to load/store
        val o_rob_head = Output(UInt(7.W))
    })

    val commit_ptr = RegInit(0.U(7.W))//rob head
    val allocate_ptr = RegInit(0.U(7.W))//rob tail

    commit_ptr:=0.U
    allocate_ptr:=0.U

    val s_normal :: s_rollback :: s_full :: Nil = Enum(4)//modify this FULL added make 1 slot available also full
    val rob_state = RegInit(s_reset)

    val num_to_roll_back = RegInit(0.U(7.W))
    num_to_roll_back := Muxcase(0.U,seq(
      i_branch_resolve_pack.valid === true.B && commit_ptr-2 > i_branch_resolve_pack.uop.rob_idx ->2.U
      i_branch_resolve_pack.valid === true.B && commit_ptr-2 === i_branch_resolve_pack.uop.rob_idx ->2.U
      i_branch_resolve_pack.valid === true.B && commit_ptr-1 === i_branch_resolve_pack.uop.rob_idx ->1.U
    )) 
    io.o_rob_head := commit_ptr

    //rob entries: should we wrap this in module or bundle?
    val rob_valid = RegInit(VecInit(Seq.fill(128){false.B}))
    val rob_uop = Reg(Vec(128, new MicroOp()))
    val rob_exception = Reg(Vec(128, Bool()))
    val rob_done = Reg(Vec(128, Bool())) // is this instr written back and ready to commit?

    val will_commit = Vec(2,Bool())
    val can_commit = Vec(2,Bool())
    //dispatch unit TODO:ptr pass 127??consider full???consider exception


    when(rob_state === s_normal){
      when(io.i_rob_allocation_reqs(0) && io.i_rob_allocation_reqs(1)){
        //rob_uop(allocate_ptr) := io.i_allocate_uops(0) write when write back
        rob_valid(allocate_ptr) := true.B
        rob_done(allocate_ptr) := false.B
        rob_valid(allocate_ptr+1.U) := true.B
        rob_done(allocate_ptr+1.U) := false.B
        allocate_ptr := allocate_ptr + 2.U 
      }.elsewhen(io.i_rob_allocation_reqs(0) || io.i_rob_allocation_reqs(1)){
        //rob_uop(allocate_ptr) := io.i_allocate_uops(1)
        rob_valid(allocate_ptr) := true.B
        allocate_ptr := allocate_ptr + 1.U
        rob_done(allocate_ptr) := false.B
      }//otherwise no allocation

      when(i_ex_result_packs(0).valid){
        rob_valid(i_ex_result_packs(0).rob_idx) := true.B
        rob_uop(i_ex_result_packs(0).rob_idx) := i_ex_result_pack.uop
        rob_exception(i_ex_result_packs(0).rob_idx) := i_ex_result_pack.exception
        rob_done(i_ex_result_packs(0).rob_idx) := true.B
      }
      when(i_ex_result_packs(1).valid){
        rob_valid(i_ex_result_packs(1).rob_idx) := true.B
        rob_uop(i_ex_result_packs(1).rob_idx) := i_ex_result_pack.uop
        rob_exception(i_ex_result_packs(1).rob_idx) := i_ex_result_pack.exception
        rob_done(i_ex_result_packs(1).rob_idx) := true.B
      }
      //commit
      io.o_commit_pack.valid(0) := will_commit(0)
      io.o_commit_pack.valid(1) := will_commit(1)&&will_commit(0)
      io.o_commit_pack.uops(0) := rob_uop(commit_ptr)
      io.o_commit_pack.uops(1) := rob_uop(commit_ptr+1)

      can_commit(0) := rob_valid(commit_ptr) && rob_done(commit_ptr)
      can_commit(1) := rob_valid(commit_ptr+1) && rob_done(commit_ptr+1)

      will_commit(0) := can_commit(0)
      will_commit(1) := will_commit(0) && can_commit(1) //control conflict within 2 here? aka 1nc=>2nc 

      io.o_commit_pack(0).uop:=rob_uop(commit_ptr)
      io.o_commit_pack(1).uop:=rob_uop(commit_ptr+1)

      when(will_commit(0) && will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    when(rob_state === s_full){
      allocation_res_pack(0).valid := false.B
      allocation_res_pack(1).valid := false.B

      //when full cannot allocate ,but can roll back,exe write and commit
      when(i_ex_result_packs(0).valid){
        rob_valid(i_ex_result_packs(0).rob_idx) := true.B
        rob_uop(i_ex_result_packs(0).rob_idx) := i_ex_result_pack.uop
        rob_exception(i_ex_result_packs(0).rob_idx) := i_ex_result_pack.exception
        rob_done(i_ex_result_packs(0).rob_idx) := true.B
      }
      when(i_ex_result_packs(1).valid){
        rob_valid(i_ex_result_packs(1).rob_idx) := true.B
        rob_uop(i_ex_result_packs(1).rob_idx) := i_ex_result_pack.uop
        rob_exception(i_ex_result_packs(1).rob_idx) := i_ex_result_pack.exception
        rob_done(i_ex_result_packs(1).rob_idx) := true.B
      }
      //commit
      io.o_commit_pack.valid(0) := will_commit(0)
      io.o_commit_pack.valid(1) := will_commit(1)&&will_commit(0)
      io.o_commit_pack.uops(0) := rob_uop(commit_ptr)
      io.o_commit_pack.uops(1) := rob_uop(commit_ptr+1)
     
      can_commit(0) := rob_valid(commit_ptr) && rob_done(commit_ptr)
      can_commit(1) := rob_valid(commit_ptr+1) && rob_done(commit_ptr+1)
     
      will_commit(0) := can_commit(0)
      will_commit(1) := will_commit(0) && can_commit(1) //control conflict within 2 here? aka 1nc=>2nc 
     
      io.o_commit_pack(0).uop:=rob_uop(commit_ptr)
      io.o_commit_pack(1).uop:=rob_uop(commit_ptr+1)
     
      when(will_commit(0) && will_commit(1)){
        rob_valid(commit_ptr) := false.B
        rob_valid(commit_ptr+1) := false.B
        commit_ptr := commit_ptr + 2.U
      }.elsewhen(will_commit(0)){
        rob_valid(commit_ptr) := false.B
        commit_ptr := commit_ptr + 1.U
      }
    }
    when(rob_state === s_rollback){
      //when rollback, no allocation,no exe write, no commit
      allocation_res_pack(0).valid := false.B
      allocation_res_pack(1).valid := false.B
      io.o_commit_pack.valid(0) := false.B
      io.o_commit_pack.valid(1) := false.B

      io.o_roll_back_pack.valid(0) := true.B
      io.o_roll_back_pack.valid(1) := (num_to_roll_back === 2.U)

      io.o_roll_back_pack(0).uop:=rob_uop(rollback_ptr)
      io.o_roll_back_pack(1).uop:=rob_uop(rollback_ptr-1)

      io.o_commit_pack(0).valid := false.B
      io.o_commit_pack(1).valid := false.B

      rollback_ptr := rollback_ptr - num_to_roll_back
    }


    io.o_exception=rob_exception(commit_ptr)||rob_exception(commit_ptr+1)

    val is_full =Bool()
    io.o_empty :=  commit_ptr === allocate_ptr  
    io.o_full := (allocate_ptr + 2.U) === commit_ptr //?

    when(is_full){

    }
    switch (rob_state) {
       is (s_reset) {
         rob_state := s_normal
       }
       is (s_normal) {
         when (exception) {
            //exceptions can be dealt with in one cyc
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
*/