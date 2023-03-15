package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
//import scala.util.control.Breaks._
//assuming unified reservation station and depth of 64
//这个需要单另的reg来存uop吗,目测是需要的

class Reservation_Station extends Module with consts{
   val io = IO(new Bundle{
     val i_dispatch_packs = Input(Vec(2,new uop()))
     
     val o_issue_packs=Output(Vec(2,new uop())) 
     val i_wakeup_port=Input(UInt(128.W))

     val i_ex_res_packs=Input(Vec(2,new valid_uop_pack()))

     val i_branch_resolve_pack=Input(new branch_resolve_pack())

     val o_full = Output(Bool())//
     val i_exception = Input(Bool())
     val i_rollback_valid = Input(Bool())
     //val i_rollback_num = Input(UInt(6.W))
     val i_available_funcs = Input(Vec(7, UInt(2.W)))

     //used to make sure issue loads and stores only when they are the first of ROB,
     //and a better solution is down here, but not fully implemented
      val i_ROB_first_entry = Input(UInt(7.W))
   }) 
     //val uops = Reg(Vec(2,new uop()))
     val uops = Wire((Vec(2,new uop())))
     uops:=io.i_dispatch_packs

     val reservation_station = Seq.fill(RS_size)(Module(new Reservation_Station_Slot()))
     val reservation_station_valid = Wire(UInt(RS_size.W))
     val reservation_station_valid_withmask = Wire(UInt(RS_size.W))
     val temp = Wire(Vec(RS_size,Bool()))
     for (i <- 0 until RS_size) {
       temp(i) := ((reservation_station(i).io.o_valid))
     }
     val write_idx1 = Wire(UInt((rs_idx_len).W))
     val write_idx2 = Wire(UInt((rs_idx_len).W))

     reservation_station_valid := temp.asUInt()
     write_idx1:=PriorityEncoder(~(reservation_station_valid)) //可能错的不是他,是用到他的变量
     reservation_station_valid_withmask:= reservation_station_valid |(UIntToOH(write_idx1))
     write_idx2:=PriorityEncoder(~(reservation_station_valid_withmask))//TODO:这个可以改成反向寻找的优先编码器

     //Issue Logic
     val indexes = VecInit.tabulate(RS_size){_.U}
     val available_funcs = Wire(UInt(7.W))

     val temp2=Wire(Vec(7,Bool()))
     for (i <- 0 until 7) {
       temp2(i) := io.i_available_funcs(i).orR
     }
     available_funcs := temp2.asUInt()

     val slots_can_issue = (VecInit.tabulate(RS_size){ i=> reservation_station(i).io.o_ready_to_issue && ((reservation_station(i).io.o_uop.func_code & available_funcs).orR).asBool})
     val issue1_idx = Wire(UInt((rs_idx_len).W))
     issue1_idx := PriorityEncoder(slots_can_issue.asUInt())

     val issue1_func_code = Wire(UInt(7.W)) 
     issue1_func_code := MuxCase(FU_NUL, Seq.tabulate(RS_size)(i=>i).map(i => ((i.U === issue1_idx) -> reservation_station(i).io.o_uop.func_code)))
     val available_funcs_with_mask = Wire(Vec(7, UInt(2.W)))
     available_funcs_with_mask:=io.i_available_funcs
     available_funcs_with_mask(OHToUInt(issue1_func_code)):=io.i_available_funcs(OHToUInt(issue1_func_code))-1.U //optimize this OHToUInt

     val temp3=Wire(Vec(7,Bool()))
     for (i <- 0 until 7) {
       temp3(i) := available_funcs_with_mask(i).orR
     }

     val available_funcs2_bits = temp3.asUInt()
     val slots_can_issue2 = (VecInit.tabulate(RS_size){i=> (slots_can_issue(i) && ((i.U=/=issue1_idx)) &&
          ((reservation_station(i).io.o_uop.func_code & available_funcs2_bits).orR).asBool)})

     val issue2_idx = Wire(UInt((rs_idx_len).W))
     issue2_idx := PriorityEncoder(slots_can_issue2.asUInt)

     val issue_num= Wire(UInt(2.W))
     issue_num := MuxCase(0.U,Seq(
         (issue1_idx===((RS_size-1)).U && issue2_idx===((RS_size-1).U)) -> 0.U,
         ((issue1_idx===(RS_size-1).U && issue2_idx=/=(RS_size-1).U) || (issue1_idx=/=(RS_size-1).U && issue2_idx===(RS_size-1).U)) ->1.U,
         (issue1_idx=/=(RS_size-1).U && issue2_idx=/=(RS_size-1).U )->2.U
     ))
     val issue0_valid =Wire(Bool())
     val issue1_valid = Wire(Bool())
     issue0_valid:= issue_num ===1.U || issue_num ===2.U
     issue1_valid:= issue_num ===2.U

      val write_num = Wire(UInt(2.W))
      write_num := MuxCase(0.U,Seq(
         (write_idx1===(RS_size-1).U || write_idx2===(RS_size-1).U) -> 0.U,//full
         (!(write_idx1===(RS_size-1).U || write_idx2===(RS_size-1).U) && (uops(0).valid && uops(1).valid)) -> 2.U,
         (!(write_idx1===(RS_size-1).U || write_idx2===(RS_size-1).U) && ((uops(0).valid && !uops(1).valid) || (!uops(0).valid && uops(1).valid))) ->1.U
      ))//需要考虑 writeidx到底能不能等于63呢,得把这个选项排除掉,得额外考虑满的情况

     //when got 1 dispatch valid,
     io.o_full := (write_idx1===(RS_size-1).U || write_idx2 ===(RS_size-1).U)

     io.o_issue_packs(0):=MuxCase(reservation_station(0).io.o_uop,(for(i <- 0 to (RS_size-1))yield(i.U===issue1_idx)->reservation_station(i).io.o_uop))
     io.o_issue_packs(1):=MuxCase(reservation_station(0).io.o_uop,(for(i <- 0 to (RS_size-1))yield(i.U===issue2_idx)->reservation_station(i).io.o_uop))
     io.o_issue_packs(0).valid := issue0_valid
     io.o_issue_packs(1).valid := issue1_valid

     for (i <- 0 until RS_size){//connect input ports
     reservation_station(i).io.i_issue_granted := Mux((i.U===issue1_idx || i.U===issue2_idx) && !(io.i_exception || io.i_rollback_valid),true.B,false.B)
     reservation_station(i).io.i_branch_resolve_pack := io.i_branch_resolve_pack
     reservation_station(i).io.i_exception := io.i_exception
     reservation_station(i).io.i_wakeup_port := io.i_wakeup_port
     reservation_station(i).io.i_allocated_idx := Mux(write_idx2===i.U,1.U,0.U)
     reservation_station(i).io.i_write_slot := MuxCase(false.B,Seq(
        ((i.U===write_idx1) && (write_idx1=/=(RS_size-1).U)) -> uops(0).valid,
        ((i.U===write_idx2) && (write_idx2=/=(RS_size-1).U)) -> uops(1).valid
      )
     )//Mux((i.U===write_idx1||i.U===write_idx2)&&(!io.o_full),true.B,false.B)//and we have things to write_idx1,改一改这个的逻辑,尽量让他和uopvalid解耦
     //通过加一点num_write之类的
     reservation_station(i).io.i_uop := Mux(i.U===write_idx1,uops(0),uops(1))//rewrite this with mux??

     //if ex_res is a csr inst, put dst to zero
     reservation_station(i).io.i_exe_dst1 := Mux(io.i_ex_res_packs(0).valid && io.i_ex_res_packs(0).uop.func_code=/=FU_CSR  ,io.i_ex_res_packs(0).uop.phy_dst,0.U)
     reservation_station(i).io.i_exe_dst2 := Mux(io.i_ex_res_packs(1).valid && io.i_ex_res_packs(1).uop.func_code=/=FU_CSR  ,io.i_ex_res_packs(1).uop.phy_dst,0.U)
     
     reservation_station(i).io.i_exe_value1 := io.i_ex_res_packs(0).uop.dst_value
     reservation_station(i).io.i_exe_value2 := io.i_ex_res_packs(1).uop.dst_value

     reservation_station(i).io.i_ROB_first_entry := io.i_ROB_first_entry

     }
     //printf("iuopsrc1value=%d\n",uops(0).src1_value)
     //printf("iuopsrc2value=%d\n",uops(0).src2_value)
     //printf("iuopsrc1value1=%d\n",uops(1).src1_value)
     //printf("iuopsrc2value1=%d\n",uops(1).src2_value)
     //printf("----\n")
}
/*  //this is a half-done better plan
    //this is used to make sure loads and stores execute in the right order,
    //an ls inst can be issued only after last inflight ls is executed.
    //the highest bit is the valid bit, and the other 7 bits are the rob_idx of the last ls inst
    //the current plan is just to let loads and stores to issue only when they are the first of rob
    
    val last_inflight_ls_rob_idx = RegInit(0.U(8.W))
    val next_last_inflight_ls_rob_idx = Wire(UInt(8.W))
    last_inflight_ls_rob_idx := next_last_inflight_ls_rob_idx
    when(io.i_exception){
      next_last_inflight_ls_rob_idx := 0.U
    }.elsewhen(io.i_rollback_pack.valid(0) && io.i_rollback_pack(0).uop.func_code === FU_MEM){
      next_last_inflight_ls_rob_idx := Cat(1.U(1.W), io.i_rollback_pack.uop.stale_ls_rob_idx)
    }.elsewhen(io.i_rollback_pack.valid(1) && io.i_rollback_pack(1).uop.func_code === FU_MEM){//implies that 0 is not mem inst
      next_last_inflight_ls_rob_idx := Cat(1.U(1.W), io.i_rollback_pack(1).uop.stale_ls_rob_idx)
    }.elsewhen(uops(1).valid && uops(1).func_code === FU_MEM){
      next_last_inflight_ls_rob_idx :=  Cat(1.U(1.W), uops(1).rob_idx)
    }.elsewhen(uops(0).valid && uops(0).func_code === FU_MEM){//cat yixia
      next_last_inflight_ls_rob_idx :=  Cat(1.U(1.W), uops(0).rob_idx)
    }.elsewhen(io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_MEM  &&  io.i_commit_packs(1).uop.rob_idx === last_inflight_ls_rob_idx){
      next_last_inflight_ls_rob_idx := 0.U
    }.elsewhen(io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_MEM  &&  io.i_commit_packs(0).uop.rob_idx === last_inflight_ls_rob_idx){
      next_last_inflight_ls_rob_idx := 0.U
    }otherwise{
      next_last_inflight_ls_rob_idx := last_inflight_ls_rob_idx
    }

    when(io.i_exception){
      uops(0).stale_ls_rob_idx := 0.U
    }.elsewhen(io.i_rollback_pack.valid(0) && io.i_rollback_pack(0).uop.func_code === FU_MEM){
      uops(0).stale_ls_rob_idx := Cat(1.U(1.W), io.i_rollback_pack(0).uop.stale_ls_rob_idx)
    }.elsewhen(io.i_rollback_pack.valid(1) && io.i_rollback_pack(1).uop.func_code === FU_MEM){
      uops(0).stale_ls_rob_idx := Cat(1.U(1.W), io.i_rollback_pack(1).uop.stale_ls_rob_idx)
    }.elsewhen(io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_MEM  &&  io.i_commit_packs(1).uop.rob_idx === last_inflight_ls_rob_idx){
      uops(0).stale_ls_rob_idx := 0.U
    }.elsewhen(io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_MEM  &&  io.i_commit_packs(0).uop.rob_idx === last_inflight_ls_rob_idx){
      uops(0).stale_ls_rob_idx := 0.U
    }.otherwise{
      uops(0).stale_ls_rob_idx := last_inflight_ls_rob_idx
    }
    
    when(io.i_exception){
      uops(1).stale_ls_rob_idx := 0.U
    }.elsewhen(io.i_rollback_pack.valid(0) && io.i_rollback_pack(0).uop.func_code === FU_MEM){
      uops(1).stale_ls_rob_idx := Cat(1.U(1.W), io.i_rollback_pack(0).uop.stale_ls_rob_idx)
    }.elsewhen(io.i_rollback_pack.valid(1) && io.i_rollback_pack(1).uop.func_code === FU_MEM){//implys that 0 is not mem inst
      uops(1).stale_ls_rob_idx := Cat(1.U(1.W), io.i_rollback_pack(1).uop.stale_ls_rob_idx)
    }.elsewhen(uops(0).valid && uops(0).func_code === FU_MEM){
      uops(1).stale_ls_rob_idx := Cat(1.U(1.W), uops(0).rob_idx)
    }.elsewhen(io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_MEM  &&  io.i_commit_packs(1).uop.rob_idx === last_inflight_ls_rob_idx){
      uops(1).stale_ls_rob_idx := 0.U
    }.elsewhen(io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_MEM  &&  io.i_commit_packs(0).uop.rob_idx === last_inflight_ls_rob_idx){
      uops(1).stale_ls_rob_idx := 0.U
    }.otherwise{
      uops(1).stale_ls_rob_idx := last_inflight_ls_rob_idx
*/
