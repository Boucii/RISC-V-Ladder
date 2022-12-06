//assuming unified reservation station and depth of 64
class Reservation_Station extends Module{
   val io = IO(new Bundle{
     val i_dispatch_packs = Input(Vec(2,dispatch_pack()))
     
     val o_issue_packs=Output(Vec(2,issue_pack())) 
     val i_wakeups=//...

     val i_flush=Input(Bool())
     val i_mispred_resolve_pack=//...

     val o_full = Output(Bool())//
     val i_available_funcs = Input(Vec(4, Bool()))//TODO: tobemodified
   }) 
     val reservation_station = Vec(64, Module(new Reservation_Station_Slot()))

     for (i <- 0 until 64){//connect input ports
          reservation_station(i).io.i_issue_granted := Mux(i===issue1_idx || i===issue2_idx,true.B,false.B)
     }
     //Issue Logic
     //val idx1 = indexes.minBy(age_considering_issue(_))//????wtf is this???
     //TODO:funccode of the 1st issue inst must mask out all the relavent func codes when comparing the 2nd issue inst's func code
     val indexes = VecInit.tabulate(64){_.U}
     val age_considering_issue = VecInit.tabulate(64){i=> (age(i) | Fill(8,reservation_station(i).io.o_ready_to_issue) +
          | !(Fill(8,(reservation_station(i).io.uop.funccode & io.i_available_funcs).reduce(_||_))))}

     val idx_age_group = indexes zip age_considering_issue //seq of tuple (idx,age)
     val issue1_idx = idx_age_group.reduceLeft((a,b)=>{(Mux(a._2<b._2,a._1,b._1)),(Mux(a._2<b._2,a._2,b._2))})

     val age_considering_issue_2 = VecInit.tabulate(64){i=> (age_considering_issue(i) +
          | Fill(8,reservation_station(i).io.uop.funccode & io.i_available_funcs & !(reservation_station(i).io.uop.funccode)))}

     val idx_age_group2 = indexes zip age_considering_issue_2

     val issue2_idx = idx_age_group2.reduceRight((a,b)=>{(Mux(a._2<b._2,a._1,b._1)),(Mux(a._2<b._2,a._2,b._2))})

     val issue_num= Muxcase(0.U{
          issue1_idx===issue2_idx && reservation_station(issue1_idx).io.o_ready_to_issue===true.B =>1
          issue1_idx===issue2_idx && reservation_station(issue1_idx).io.o_ready_to_issue===false.B =>0
          issue1_idx=!=issue2_idx && reservation_station(issue1_idx).io.o_ready_to_issue===true.B && reservation_station(issue2_idx).io.o_ready_to_issue ===true =>2
          issue1_idx=!=issue2_idx && reservation_station(issue1_idx).io.o_ready_to_issue===true.B && reservation_station(issue2_idx).io.o_ready_to_issueready2 ===false =>1
          issue1_idx=!=issue2_idx && reservation_station(issue1_idx).io.o_ready_to_issue===false.B && reservation_station(issue2_idx).io.o_ready_to_issueready2 ===true =>1
          issue1_idx=!=issue2_idx && reservation_station(issue1_idx).io.o_ready_to_issue===false.B && reservation_station(issue2_idx).io.o_ready_to_issueready2 ===false =>1
          })

     //age update logic -exterior
     val issued_age_pack = Reg(new age_pack())
     issued_age_pack.issue_valid(0) := issue_num ===1.U || issue_num ===2.U
     issued_age_pack.issue_valid(1) := issue_num ===2.U
     issued_age_pack.max_age := issued_age_pack.max_age+1 - issue_num
     issued_age_pack.allocated_idx := 
     issued_age_pack.issued_ages(0) := reservation_station(issue1_idx).io.age
     issued_age_pack.issued_ages(1) := reservation_station(issue2_idx2).io.age
     
}