package ladder

import chisel3._

class Free_List extends module{
    val io=IO(new Bundle{
        val i_free_list_reqs=Input(Vec(2,new uop()))
        val o_allocated_pregs=Output(Vec(2,UInt(7.W)))
        val o_full=Output(Bool())

        val i_commit_packs=Input(Vec(2,commit_pack()))
        val i_rollback=Input(Vec(2,rollback_pack()))
    })
    val free_queue=free_queue

    //allocate new pregs to dsts
    io.full:=free_queue.full
    allocated.preg0:=free_queue.preg0//allocate only one for same dsts?
    allocated.preg1:=free_queue.preg1

    //add to free lists (commit+rollback)
    free_queue.wen0:=i_commit_packs.valid0 || rollback.valid0
    free_queue.wen1:=i_commit_packs.rollback0 || rollback.valid1

    freequeu.req0=req.pr0
    freequeu.req1=req.pr1

    val sel=UInt(2.W)
    sel(1):=(i_commit_packs.valid0 && !i_commit_packs.valid1 && !(ealloc.valid1&&(i_commit_packs.uop.pregidx1===i_commit_packs.uop.pregidx0)))
    sel(0):=(i_commit_packs.valid1&&i_commit_packs.valid0&&(i_commit_packs.uop.pregidx1===i_commit_packs.uop.pregidx0))
    Muxcase(sel,Array(
         0.U -> rollback.pregidx,
         1.U -> i_commit_packs.old,
         2.U -> i_commit_packs.newpreg,
    ))

    free_queue.wpregidx0:=Mux(i_commit_packs.commit.preg1idx=!=i_commit_packs.commit.preg0idx,i_commit_packs.pregidx0,rollback.pregidx0)
    free_queue.wpregidx1:=Mux(i_commit_packs.commit.pregidx=!=0,i_commit_packs.pregidx1,rollback.pregidx1)
}
class Free_Queue extends module{
    val io=IO(new Bundle{
        val wen0=Input(Bool())
        val wen1=Input(Bool())

        val wpregidx0=Input(UInt(5.W))
        val wpregidx1=Input(UInt(5.W))

        val full=Output(Bool())

        val preg0=Output(UInt(5.W))
        val preg1=Output(UInt(5.W))
    })
    val queue=RegInit(Vec(127,UInt(8.W)))
    val head=RegInit(0.U(8.W))
    val tail=RegInit(0.U(8.W))
    val full=RegInit(false.B)
    val empty=RegInit(true.B)

    full := tail +1.U === head || (tail === 127.U && head === 0.U)
    empty := tail === head

    io.full:=full
    //init
    when(rst){
       for(i<-0 until 127){
            queue(i):=i.U
        }
    }
    //allocate
    io.preg0:=queue(head)
    io.preg1:=queue(head+1.U)

    when(io.wen0&&io.wen1){
        head:=head+2.U
    }.elsewhen(io.wen1){
        head:=head+1.U
    }

    //i_commit_packsate
    when(io.wen0&&io.wen1){
        queue(tail):=io.wpregidx0
        queue(tail+1.U):=io.wpregidx1
        tail:=tail+2.U
    }.elsewhen(io.wen1){
        queue(tail):=io.wpregidx1
        tail:=tail+1.U
    }
}