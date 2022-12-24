//import scala.util.control.Breaks._
//assuming unified reservation station and depth of 64
//这个需要单另的reg来存uop吗,目测是需要的
class Reservation_Station extends Module{
   val io = IO(new Bundle{
     val i_dispatch_packs = Input(Vec(2,new uop()))
     
     val o_issue_packs=Output(Vec(2,new uop())) 
     val i_wakeup_port=Input(UInt(128.W))

     val i_branch_resolve_pack=Input(new branch_resolve_pack())

     val o_full = Output(Bool())//
     val i_exception = Input(Bool())
     val i_available_funcs = Input(Vec(7, UInt(2.W)))
   }) 
     val uops = Reg(Vec(2,new uop()))
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

     write_idx1:=PriorityEncoder(reservation_station_valid) //可能错的不是他,是用到他的变量
     reservation_station_valid := temp.asUInt()
     reservation_station_valid_withmask:= reservation_station_valid & !(UIntToOH(write_idx1))
     write_idx2:=PriorityEncoder(reservation_station_valid_withmask)



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

     val age_considering_issue = VecInit.tabulate(64){ i=> (reservation_station(i).io.o_age | Fill(8,reservation_station(i).io.o_ready_to_issue) 
        | !(Fill(8,(reservation_station(i).io.o_uop.func_code & available_funcs).orR)))}

     val idx_age_group = indexes zip age_considering_issue //seq of tuple (idx,age)
     val issue1_idx = Wire(UInt(7.W))
     issue1_idx :=(idx_age_group.reduceLeft((a,b)=>{(Mux(a._2<b._2,a._1,b._1),Mux(a._2<b._2,a._2,b._2))}))._1 //find the smallest element

     val age_considering_issue_2 = VecInit.tabulate(64){i=> (age_considering_issue(i) 
          | Fill(8,reservation_station(i).io.o_uop.func_code & available_funcs & !(reservation_station(i).io.o_uop.func_code)))}

     val idx_age_group2 = indexes zip age_considering_issue_2

     val issue2_idx = Wire(UInt(7.W))
     issue2_idx := idx_age_group2.reduceRight(((a,b)=>{(Mux(a._2<b._2,a._1,b._1),Mux(a._2<b._2,a._2,b._2))}))._1

     val issue_num= Wire(UInt(2.W))
     issue_num := MuxCase(0.U,Seq(
         (issue1_idx===255.U && issue2_idx===255.U) -> 0.U,
         ((issue1_idx===255.U && issue2_idx=/=255.U) || (issue1_idx=/=255.U && issue2_idx===255.U)) ->1.U,
         (issue1_idx===255.U && issue2_idx===255.U )->2.U
     ))
     //age update logic -exterior
     val issued_age_pack = Reg(new age_pack())
     val next_max_age = Wire(UInt(8.W))
     val issue0_valid =Wire(Bool())
     val issue1_valid = Wire(Bool())
     issue0_valid:= issue_num ===1.U || issue_num ===2.U
     issue1_valid:= issue_num ===2.U

     issued_age_pack.issue_valid(0) := issue0_valid
     issued_age_pack.issue_valid(1) := issue1_valid
     issued_age_pack.max_age := issued_age_pack.max_age+1.U - issue_num
     issued_age_pack.issued_ages(0) := 0.U//reservation_station(issue1_idx.litValue.toInt).io.o_age
     issued_age_pack.issued_ages(1) := 0.U//reservation_station(issue2_idx.litValue.toInt).io.o_age
     
     next_max_age := issued_age_pack.max_age+1.U - issue_num

     io.o_full := next_max_age>252.U

     io.o_issue_packs(0):=MuxCase(reservation_station(0).io.o_uop,(for(i <- 0 to 63)yield(i.U===issue1_idx)->reservation_station(i).io.o_uop))
     io.o_issue_packs(1):=MuxCase(reservation_station(0).io.o_uop,(for(i <- 0 to 63)yield(i.U===issue2_idx)->reservation_station(i).io.o_uop))
     io.o_issue_packs(0).valid := issue0_valid
     io.o_issue_packs(1).valid := issue1_valid

     for (i <- 0 until 64){//connect input ports
     reservation_station(i).io.i_issue_granted := Mux(i.U===issue1_idx || i.U===issue2_idx,true.B,false.B)
     reservation_station(i).io.i_branch_resolve_pack := io.i_branch_resolve_pack
     reservation_station(i).io.i_exception := io.i_exception
     reservation_station(i).io.i_wakeup_port := io.i_wakeup_port
     reservation_station(i).io.i_age_pack:= issued_age_pack
     reservation_station(i).io.i_allocated_idx := Mux(issue2_idx===i.U,1.U,0.U)
     reservation_station(i).io.i_write_slot := Mux(i.U===write_idx1||i.U===write_idx2,true.B,false.B)
     reservation_station(i).io.i_uop := Mux(i.U===write_idx1,uops(0),uops(1))//rewrite this with mux??
     }
}