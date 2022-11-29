class front_end_control extends Module
{
   val io =IO(new Bundle {
        val i_imem_stall_req = Bool(INPUT)
        val i_branch_presolve = Bool(INPUT)
        val i_fetch_queue_full = Bool(INPUT)

        val o_stage1_stall = Bool(OUTPUT)
        val o_stage2_stall = Bool(OUTPUT)
        val o_stage3_stall = Bool(OUTPUT)
            
        val o_stage1_flush = Bool(OUTPUT)
        val o_stage2_flush = Bool(OUTPUT)
        val o_stage3_flush = Bool(OUTPUT)
   })
   o_stage3_flush := 0.B 
   o_stage2_flush := o_stage3_flush | i_branch_presolve.mispredict
   o_stage1_flush := o_stage2_flush

   o_stage3_stall := i_fetch_queue_full
   o_stage2_stall := o_stage3_stall | i_imem_stall_req 
   o_stage1_stall := o_stage2_stall 

}