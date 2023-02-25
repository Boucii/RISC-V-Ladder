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
     val i_available_funcs = Input(Vec(7, UInt(2.W)))

     //used to make sure issue loads and stores only when they are the first of ROB,
     //and a better solution is down here, but not fully implemented
      val i_ROB_first_entry = Input(UInt(7.W))
   }) 
     //val uops = Reg(Vec(2,new uop()))
     val uops = Wire((Vec(2,new uop())))
     uops:=io.i_dispatch_packs

     val reservation_station = Seq.fill(64)(Module(new Reservation_Station_Slot()))
     val reservation_station_valid = Wire(UInt(64.W))
     val reservation_station_valid_withmask = Wire(UInt(64.W))
     val temp = Wire(Vec(64,Bool()))
     for (i <- 0 until 64) {
       temp(i) := ((reservation_station(i).io.o_valid))
     }
     val write_idx1 = Wire(UInt(6.W))
     val write_idx2 = Wire(UInt(6.W))

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
     reservation_station_valid := temp.asUInt()
     write_idx1:=PriorityEncoder(~(reservation_station_valid)) //可能错的不是他,是用到他的变量
     reservation_station_valid_withmask:= reservation_station_valid |(UIntToOH(write_idx1))
     write_idx2:=PriorityEncoder(~(reservation_station_valid_withmask))//TODO:这个可以改成反向寻找的优先编码器

     //printf("rsvalid=%x\n",reservation_station_valid)


     //Issue Logic
     //val idx1 = indexes.minBy(age_considering_issue(_))//????wtf is this???
     //TODO:funccode of the 1st issue inst must mask out all the relavent func codes when comparing the 2nd issue inst's func code
     val indexes = VecInit.tabulate(64){_.U}
     val available_funcs = Wire(UInt(7.W))

     val temp2=Wire(Vec(7,Bool()))
     for (i <- 0 until 7) {
       temp2(i) := io.i_available_funcs(i).orR
     }
     available_funcs := temp2.asUInt()

     val age_considering_issue = VecInit.tabulate(64){ i=> (reservation_station(i).io.o_age | (~Fill(8,reservation_station(i).io.o_ready_to_issue) )
        | ~(Fill(8,(reservation_station(i).io.o_uop.func_code & available_funcs).orR)))}

     val idx_age_group = indexes zip age_considering_issue //seq of tuple (idx,age)
     val issue1_idx = Wire(UInt(6.W))
     issue1_idx :=(idx_age_group.reduceLeft((a,b)=>{(Mux(a._2<b._2,a._1,b._1),Mux(a._2<b._2,a._2,b._2))}))._1 //find the smallest element

     val issue1_func_code = Wire(UInt(7.W)) 
     issue1_func_code := MuxCase(FU_NUL, Seq.tabulate(64)(i=>i).map(i => ((i.U === issue1_idx) -> reservation_station(i).io.o_uop.func_code)))
     val dbg_ages = VecInit.tabulate(64){ i=> (reservation_station(i).io.o_age)}
     val available_funcs_with_mask = Wire(Vec(7, UInt(2.W)))
     available_funcs_with_mask:=io.i_available_funcs
     /*
     when(issue1_func_code === FU_ALU) {
      printf(":aAAAA")
       available_funcs_with_mask(0) := Mux(io.i_available_funcs(0)===0.U,io.i_available_funcs(0), (available_funcs(0)-1.U))
     }.elsewhen(issue1_func_code === FU_BRU) {
       available_funcs_with_mask(1) := Mux(io.i_available_funcs(1)===0.U,available_funcs(1), (available_funcs(1)-1.U))
     }.elsewhen(issue1_func_code === FU_MEM) {
       available_funcs_with_mask(2) := Mux(io.i_available_funcs(2)===0.U,available_funcs(2), (available_funcs(2)-1.U))
     }.elsewhen(issue1_func_code === FU_MUL) {
       available_funcs_with_mask(3) := Mux(io.i_available_funcs(3)===0.U,available_funcs(3), (available_funcs(3)-1.U))
     }.elsewhen(issue1_func_code === FU_DIV) {
       available_funcs_with_mask(4) := Mux(io.i_available_funcs(4)===0.U,available_funcs(4), (available_funcs(4)-1.U))
     }.elsewhen(issue1_func_code === FU_CSR) {
       available_funcs_with_mask(5) := Mux(io.i_available_funcs(5)===0.U,available_funcs(5), (available_funcs(5)-1.U))
     }.elsewhen(issue1_func_code === FU_NUL) {
       available_funcs_with_mask(6) := Mux(io.i_available_funcs(6)===0.U,available_funcs(6), (available_funcs(6)-1.U))
     }*/
     available_funcs_with_mask(OHToUInt(issue1_func_code)):=io.i_available_funcs(OHToUInt(issue1_func_code))-1.U //optimize this OHToUInt

     val temp3=Wire(Vec(7,Bool()))
     for (i <- 0 until 7) {
       temp3(i) := available_funcs_with_mask(i).orR
     }
     val available_funcs2_bits = temp3.asUInt()
     val age_considering_issue_2 = VecInit.tabulate(64){i=> (age_considering_issue(i)| Fill(8,(i.U===issue1_idx).asUInt())
       | ~Fill(8,(reservation_station(i).io.o_uop.func_code & available_funcs2_bits).orR))}

     val idx_age_group2 = indexes zip age_considering_issue_2

     val issue2_idx = Wire(UInt(6.W))
     issue2_idx := idx_age_group2.reduceRight(((a,b)=>{(Mux(a._2<b._2,a._1,b._1),Mux(a._2<b._2,a._2,b._2))}))._1

     val issue_num= Wire(UInt(2.W))
     issue_num := MuxCase(0.U,Seq(
         (issue1_idx===63.U && issue2_idx===63.U) -> 0.U,
         ((issue1_idx===63.U && issue2_idx=/=63.U) || (issue1_idx=/=63.U && issue2_idx===63.U)) ->1.U,
         (issue1_idx=/=63.U && issue2_idx=/=63.U )->2.U
     ))
     //age update logic -exterior
     val issued_age_pack = RegInit(0.U.asTypeOf(new age_pack()))
     val next_max_age = Wire(UInt(8.W))
     val issue0_valid =Wire(Bool())
     val issue1_valid = Wire(Bool())
     issue0_valid:= issue_num ===1.U || issue_num ===2.U
     issue1_valid:= issue_num ===2.U

      val write_num = Wire(UInt(2.W))
      write_num := MuxCase(0.U,Seq(
         (write_idx1===63.U || write_idx2===63.U) -> 0.U,//full
         (!(write_idx1===63.U || write_idx2===63.U) && (uops(0).valid && uops(1).valid)) -> 2.U,
         (!(write_idx1===63.U || write_idx2===63.U) && ((uops(0).valid && !uops(1).valid) || (!uops(0).valid && uops(1).valid))) ->1.U
      ))//需要考虑 writeidx到底能不能等于63呢,得把这个选项排除掉,得额外考虑满的情况

    //what about rollbacks????this is a BUG
     next_max_age := issued_age_pack.max_age- issue_num + write_num

     issued_age_pack.issue_valid(0) := issue0_valid
     issued_age_pack.issue_valid(1) := issue1_valid
     issued_age_pack.max_age := next_max_age
     issued_age_pack.issued_ages(0) := MuxCase(63.U,(for(i <- 0 to 63)yield(i.U===issue1_idx)->reservation_station(i).io.o_age))
     issued_age_pack.issued_ages(1) := MuxCase(63.U,(for(i <- 0 to 63)yield(i.U===issue2_idx)->reservation_station(i).io.o_age))
     when(io.i_exception){
        issued_age_pack := 0.U.asTypeOf(new age_pack())
     }     

     io.o_full := issued_age_pack.max_age>60.U

     io.o_issue_packs(0):=MuxCase(reservation_station(0).io.o_uop,(for(i <- 0 to 63)yield(i.U===issue1_idx)->reservation_station(i).io.o_uop))
     io.o_issue_packs(1):=MuxCase(reservation_station(0).io.o_uop,(for(i <- 0 to 63)yield(i.U===issue2_idx)->reservation_station(i).io.o_uop))
     io.o_issue_packs(0).valid := issue0_valid
     io.o_issue_packs(1).valid := issue1_valid

     for (i <- 0 until 64){//connect input ports
     reservation_station(i).io.i_issue_granted := Mux((i.U===issue1_idx || i.U===issue2_idx) && !(io.i_exception || io.i_rollback_valid),true.B,false.B)
     reservation_station(i).io.i_branch_resolve_pack := io.i_branch_resolve_pack
     reservation_station(i).io.i_exception := io.i_exception
     reservation_station(i).io.i_wakeup_port := io.i_wakeup_port
     reservation_station(i).io.i_age_pack:= issued_age_pack
     reservation_station(i).io.i_allocated_idx := Mux(write_idx2===i.U,1.U,0.U)
     reservation_station(i).io.i_write_slot := MuxCase(false.B,Seq(
        (i.U===write_idx1) -> uops(0).valid,
        (i.U===write_idx2) -> uops(1).valid
      )
     )//Mux((i.U===write_idx1||i.U===write_idx2)&&(!io.o_full),true.B,false.B)//and we have things to write_idx1,改一改这个的逻辑,尽量让他和uopvalid解耦
     //通过加一点num_write之类的
     reservation_station(i).io.i_uop := Mux(i.U===write_idx1,uops(0),uops(1))//rewrite this with mux??

     reservation_station(i).io.i_exe_dst1 := Mux(io.i_ex_res_packs(0).valid  ,io.i_ex_res_packs(0).uop.phy_dst,0.U)
     reservation_station(i).io.i_exe_dst2 := Mux(io.i_ex_res_packs(1).valid  ,io.i_ex_res_packs(1).uop.phy_dst,0.U)
     
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
