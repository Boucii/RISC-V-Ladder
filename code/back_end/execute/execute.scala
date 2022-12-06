class Execute extends Module{
    val io=IO(new Bundle{
        val i_=Input(UInt(32.W))

        //to phy-regfile
        val i_issue_res_packs = Input(Vec(2, new issue_res_pack()))
        val i_pregs_read = Input(Vec(4, UInt(64.W))) 

        //to issue(reservation station)
        val o_func_code = Output(UInt(x.W))//??
        val o_func_mask = Output(Vec)//??

        //to rob
        val o_ex_res_packs = Output(Vec(2, new o_ex_result_pack()))//rename result to res 

        val out=Output(UInt(32.W))
    })

    //lets do this for now. imrove this by adding a virtual exunit class 

    val exu1 = Module(new exu1()) //alu,mul,br
    val exu2 = Module(new exu2()) //alu,div,mem

    io.o_func_code :=0.U
    io.o_func_mask :=0.U

    io.o_ex_res_packs(0) := exu1.io.o_ex_res_pack
    io.o_ex_res_packs(1) := exu2.io.o_ex_res_pack



}