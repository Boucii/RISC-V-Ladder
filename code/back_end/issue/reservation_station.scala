//import scala.util.control.Breaks._
//assuming unified reservation station and depth of 64
//这个需要单另的reg来存uop吗,目测是需要的
class Reservation_Station extends Module{
   val io = IO(new Bundle{
     val i_dispatch_packs = Input(Vec(2,uop()))//bare uop
     
     val o_issue_packs=Output(Vec(2,uop())) 
     val i_wakeup_port=Input(UInt(128.W))

     val i_branch_resolve_pack=Input(new prediction_resolve_pack())

     val o_full = Output(Bool())//
     //available funcs: all 7 funccodes, the number in each index stands for the number of that specific available funcunits.
     val i_available_funcs = Input(Vec(7, UInt(2.W)))//TODO: tobemodified
   }) 
     val reservation_station = Vec(64, Module(new Reservation_Station_Slot()))
     val reservation_station_valid = Wire(UInt(64.W))
     val reservation_station_valid_withmask = Wire(UInt(64.W))
     reservation_station_valid_withmask:=reservation_station_valid & !(UIntToOH(idx1))
     for (i <- 0 until 64) {
       reservation_station_valid(i) := reservation_station(i).io.o_valid
     }
     val write_idx1 = Wire(UInt(6.W))//???width and that 64,width?
     val write_idx2 = Wire(UInt(6.W))
     write_idx1:=PriorityEncoder(reservation_station_valid)
     write_idx2:=PriorityEncoder(reservation_station_valid_withmask)
/*
     for(i<-0 until 64){
          when(!reservation_station(i).io.o_valid){
               reservation_station(i).io.write_slot:=true.B&& i_dispatch_packs(0).valid 
          }
          break
     }     
     for(i<-63 until -1){
          when(!reservation_station(i).io.o_valid){
               reservation_station(i).io.write_slot:=true.B && i_dispatch_packs(1).valid 
          }
          break
     }
*/
     for (i <- 0 until 64){//connect input ports
          reservation_station(i).io.i_issue_granted := Mux(i===issue1_idx || i===issue2_idx,true.B,false.B)
          reservation_station(i).io.i_branch_resolve_pack := io.i_branch_resolve_pack
          reservation_station(i).io.i_exception := io.i_exception
          reservation_station(i).io.i_wakeup_port := io.i_wakeup_port
          reservation_station(i).io.i_age_pack:= issued_age_pack
          reservation_station(i).io.i_allocated_idx := Mux(issue2_idx===i,1.U,0.U)
          reservation_station(i).io.i_write_slot := Mux(i===write_idx1||i===write_idx2,true.B,false.B)
          reservation_station(i).io.i_uop := Mux(i===write_idx1,io.i_dispatch_packs(0),io.i_dispatch_packs(1))
     }

     //Issue Logic
     //val idx1 = indexes.minBy(age_considering_issue(_))//????wtf is this???
     //TODO:funccode of the 1st issue inst must mask out all the relavent func codes when comparing the 2nd issue inst's func code
     val indexes = VecInit.tabulate(64){_.U}
     val available_funcs = UInt(7.W)
     for (i <- 0 until 7) {
       available_funcs(i) := io.i_available_funcs(i).orR
     }
     available_funcs
     val age_considering_issue = VecInit.tabulate(64){i=> (age(i) | Fill(8,reservation_station(i).io.o_ready_to_issue) 
          | !(Fill(8,(reservation_station(i).io.uop.funccode & available_funcs).reduce(_||_))))}

     val idx_age_group = indexes zip age_considering_issue //seq of tuple (idx,age)
     val issue1_idx = idx_age_group.reduceLeft((a,b)=>{(Mux(a._2<b._2,a._1,b._1)),(Mux(a._2<b._2,a._2,b._2))}) //find the smallest element

     val age_considering_issue_2 = VecInit.tabulate(64){i=> (age_considering_issue(i) +
          | Fill(8,reservation_station(i).io.uop.funccode & available_funcs & !(reservation_station(i).io.uop.funccode)))}

     val idx_age_group2 = indexes zip age_considering_issue_2

     val issue2_idx = idx_age_group2.reduceRight((a,b)=>{(Mux(a._2<b._2,a._1,b._1)),(Mux(a._2<b._2,a._2,b._2))})

     val issue_num= Wire(UInt(2.W))
     issue_num = MuxCase(0.U,Array(
         issue1_idx===255.U && issue2_idx===255.U -> 0.U,
         issue1_idx===255.U && issue2_idx=/=255.U || issue1_idx=/=255.U && issue2_idx===255.U ->1.U
         issue1_idx===255.U && issue2_idx===255.U ->2.U
     ))

     //age update logic -exterior
     val issued_age_pack = Reg(new age_pack())
     val next_max_age = Wire(UInt(8.W))
     val issue0_valid =Wire(Bool())
     val issue1_valid = Wire(Bool())
     issue0_valid:= issue_num ===1.U || issue_num ===2.U
     issue1_valid:= issue_num ===2.U

     next_max_age := issued_age_pack.max_age+1 - issue_num

     issued_age_pack.issue_valid(0) := issue0_valid
     issued_age_pack.issue_valid(1) := issue1_valid
     issued_age_pack.max_age := issued_age_pack.max_age+1 - issue_num
     issued_age_pack.allocated_idx := 
     issued_age_pack.issued_ages(0) := reservation_station(issue1_idx).io.age
     issued_age_pack.issued_ages(1) := reservation_station(issue2_idx2).io.age
     
     io.o_full := next_max_age>252.U

     io.o_issue_packs(0).uop:=reservation_station(idx1).io.o_uop
     io.o_issue_packs(1).uop:=reservation_station(idx2).io.o_uop
     io.o_issue_packs(0).uop.valid := issue0_valid
     io.o_issue_packs(1).uop.valid := issue1_valid
}