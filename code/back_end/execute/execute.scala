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
        val i_ROB_first_entry = Input(UInt(7.W))

        val o_prediction_resolve_pack=Output(new prediction_resolve_pack())
    })

    //lets do this for now. imrove this by adding a virtual exunit class 
    val func_units =ArrayBuffer[Function_Unit]()
    val exu1 = Module(new ALU())
    val exu2 = Module(new ALU())
    val bru = Module(new BRU())

    func_units += exu1
    func_units += exu2
    func_units += bru

    for(i <= func_units.length-1){// use switch case to connect specialized function unit
        func_units(i).io.i_uop := io.i_issue_res_packs(i).uop
        func_units(i).io.i_select := io.i_issue_res_packs(i).valid//???

        io.o_ex_res_packs(i) := func_units(i).io.o_ex_res_pack//??
        if(func_units(i).isInstanceOf[BRU]){
            io.o_prediction_resolve_pack := func_units(i).io.o_prediction_resolve_pack
        }
        if(func_units(i).isInstanceOf[LSU]){
            func_units(i).io.i_ROB_first_entry:=io.i_ROB_first_entry
        }
    }

    //select which function to input logic
    //select the ouput unit
    //those two pass 4 now

    io.o_func_code :=0.U
    io.o_func_mask :=0.U

    io.o_ex_res_packs(0) := exu1.io.o_ex_res_pack
    io.o_ex_res_packs(1) := exu2.io.o_ex_res_pack
}