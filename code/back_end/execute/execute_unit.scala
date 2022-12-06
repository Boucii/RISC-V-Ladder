class ALU extends Module{
    val io=IO(new Bundle{
        val i_uop=Input(new uop)

        val o_ex_res_pack=Output(new ex_result_pack)()
    })
}