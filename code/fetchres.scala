class Fetch_Res extends Module{
    val io =IO( new Bundle{
        val i_fetch_res_pack = Flipped(Valid(imem_fetch_res_interface))
        val i_branch_predict_pack = new branch_predict_pack().asInput

        val o_fetch_pack = new Decoupled(fetch_pack)

    })
}