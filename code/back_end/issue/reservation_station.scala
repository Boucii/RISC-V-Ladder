//assuming unified reservation station and depth of 64
class Reservation_Station extends Module{
   val io = IO(new Bundle{

        val i_available_funcs = Input(Vec(4, Bool()))//TODO: tobemodified
   }) 
   //age logic
     val issued_age_pack = Reg(new age_pack())
     issued_age_pack.issue_valid(0) := issue_valid0
     issued_age_pack.issue_valid(1) := issue_valid1
     issued_age_pack.max_age := issued_age_pack.max_age+1 - issue_valid0.U - issue_valid1.U
     issued_age_pack.allocated_idx := 
     issued_age_pack.issued_ages(0) := reservation_station(idx1).io.age
     issued_age_pack.issued_ages(1) := reservation_station(idx2).io.age

     val issue_valid0 = Bool()
     val issue_valid1 = Bool()

     val age = RegInit(0.U(8.W))

   //Issue select logic
    val selOH1 = PriorityEncodeOH(age_queue.io.o_ready_to_issue && (i_available_funcs & age_queue.io.uop.funccode).reduce(||))
    val sel1idx = PriorityEncode(age_queue.io.o_ready_to_issue && (i_available_funcs & age_queue.io.uop.funccode).reduce(||))

    reservation_station(sel1idx).io.i_issue_granted := true.B//rewrite with Mux
 
    val i_available_funcs_for_2nd_slot = ~(reservation_station(sel1idx).io.uop.funccode) & io.i_available_funcs
    val sel2idx = PriorityEncode(age_queue.io.o_ready_to_issue && (i_available_funcs_for_2nd_slot & age_queue.io.uop.funccode).reduce(||))

    reservation_station(sel1idx).io.i_issue_granted := true.B//rewrite with Mux

}