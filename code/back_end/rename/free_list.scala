package Ladder

import chisel3._

//this is currently unbypassable,can this be bypassed?
class Free_List extends module{
    val io=IO(new Bundle{
        val i_free_list_reqs=Input(Vec(2, Bool()))
        val o_allocated_pregs=Output(Vec(2,UInt(7.W)))
        val o_full=Output(Bool())

        val i_commit_packs=Input(Vec(2,commit_pack()))
        val i_rollback_packs=Input(Vec(2,rollback_pack()))
    })
    assert(((io.i_commit_packs(0).valid || io.i_commit_packs(1).valid) &&(io.i_rollpack_packs(0).valid || io.i_rollback_packs(1).valid)),
        "rollback and commit cannot happen at the same time")

    val free_queue=Module(new Free_Queue())

    //allocate new pregs to dsts
    io.o_full:=free_queue.full
    o_allocated_preg0:=free_queue.io.o_preg0//allocate only one for same dsts?
    o_allocated_preg1:=free_queue.io.o_preg1

    //add to free lists (commit+rollback)
    free_queue.io.i_wen0:= ((io.i_commit_packs(0).valid && io.i_commit_packs(0).arch_dst.B ) || (io.i_commit_packs(1).valid && io.i_commit_packs(1).arch_dst.B ) 
        || (io.i_rollbacks(0).valid && io.rollbacks(0).arch_dst.B) || (io.i_rollbacks(1).valid && io.rollbacks(1).arch_dst.B))
    free_queue.io.i_wen1:=(((io.i_commit_packs(0).valid && io.i_commit_packs(0).arch_dst.B ) && (io.i_commit_packs(1).valid && io.i_commit_packs(1).arch_dst.B ) )
        || ((io.i_rollbacks(0).valid && io.rollbacks(0).arch_dst.B) && (io.i_rollbacks(1).valid && io.rollbacks(1).arch_dst.B)))
    /*
        write_0:                                                            
        1.any flush,then dont write
        3.2rollback && this inst writes preg ->idx0_new
        2.1rollback && this inst writes preg ->idx_new_theonerollback
        5.2commit && this inst writes preg   ->idx0_stale
        4.1commit && this inst writes preg   ->idx_stale_theonecommit
        aka.when theres 0, then 0,when no 0, but there's 1, then 1

        write_1:
        1.any flush,then dont write
        3.2rollback && this inst writes preg ->idx1_new
        2.1rollback && this inst writes preg ->0_new
        5.2commit && this inst writes preg   ->idx1_stale
        4.1commit && this inst writes preg   ->0_stale  
        
    */
    free_queue.wpregidx0:=MuxCase(0.U,Seq(
            ((io.i_commit_packs(0).valid && io.i_commit_packs(0).arch_dst.B)) -> io.i_commit_packs(0).preg_idx,
            (!(io.i_commit_packs(0).valid && io.i_commit_packs(0).arch_dst.B) && (io.i_commit_packs(1).valid && io.i_commit_packs(1).arch_dst.B)) -> io.i_commit_packs(1).preg_idx,
            ((io.i_rollback_packs(0).valid && io.i_rollback_packs(0).arch_dst.B)) -> io.i_rollback_packs(0).stale_dst,
            (!(io.i_rollback_packs(0).valid && io.i_rollback_packs(0).arch_dst.B) && (io.i_rollback_packs(1).valid && io.i_rollback_packs(1).arch_dst.B)) -> io.i_rollback_packs(1).stale_dst,
        )
    )
    free_queue.wpregidx1:=MuxCase(0.U,Seq(
            (io.i_commit_packs(1).valid && io.i_commit_packs(1).arch_dst.B) -> io.i_commit_packs(1).preg_idx,//when only 1, wen1=0
            (io.i_rollback_packs(1).valid && io.i_rollback_packs(1).arch_dst.B) -> io.i_rollbacks(1).stale_dst,
        )
    )
}
class Free_Queue extends module{
    val io=IO(new Bundle{
        val i_wen0=Input(Bool())
        val i_wen1=Input(Bool())

        val i_allocate_req0 = Input(Bool())
        val i_allocate_req1 = Input(Bool())

        val i_wpregidx0=Input(UInt(7.W))
        val i_wpregidx1=Input(UInt(7.W))

        val o_full=Output(Bool())

        val o_preg_idx0=Output(UInt(7.W))
        val o_preg1_idx=Output(UInt(7.W))
    })
    val queue=RegInit(Vec(127,UInt(8.W)))
    val head=RegInit(0.U(8.W))
    val tail=RegInit(0.U(8.W))
    val full=RegInit(false.B)
    val empty=RegInit(true.B)

    val next_full = Wire(Bool())
    val next_empty = Wire(Bool())

    full := next_full
    empty := next_empty

    next_full := ((tail +1.U === head) || (tail === 127.U && head === 0.U)) || (tail +2.U ===head)
    next_empty := (tail === head)

    io.full:=full

    //init
    when(rst){
       for(i<-0 until 127){
            queue(i):=i.U
        }
    }
    //allocate
    io.o_preg_idx0:=queue(head)
    io.o_preg_idx1:=queue(head+1.U)

    when(io.i_allocate_req0 && io.i_allocate_req1){
        head:=head+2.U
    }.elsewhen(io.wen0){
        head:=head+1.U
    }

    //i_commit_packsate
    when(io.i_wen0 && io.i_wen1){
        queue(tail):=io.i_wpregidx0
        queue(tail+1.U):=io.i_wpregidx1
        tail:=tail+2.U
    }.elsewhen(io.wen1){
        queue(tail):=io.i_wpregidx1
        tail:=tail+1.U
    }
}