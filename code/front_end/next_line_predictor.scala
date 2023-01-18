//add i_ o_
class btb_pack extends Bundle{
    val valid = Bool()
    val branch_type = UInt(4.U)
    val target_address = UInt(64.W)//needs compress,perhaps
}
class update_pack extends Bundle{
    val btb_pack = new btb_pack()
    val bht = UInt(2.W)
}
class Next_Line_Predictor extends Module {
    val io = new Bundle{
        val i_addr = Input(UInt(64.W))//addr of the fetch pack,aligned to 8 bytes
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        val i_branch_presolve_pack = Input(new branch_presolve_pack())//what happens when both pre and resolve valid

        val o_prediction_packs = Output(Vec(2, new branch_prediction_pack()))
        //val o_bht_prediction = Output(Vec(2,bht_prediction_pack(1.W)))
    }
    //this is messed up
    def btb_size = 512//aka btb size, bht size is 2bits*channel_idx_len
    def channel_size = btb_size/(btb_pack.getWidth/8) //two channels, since one fetchpack made of 2 insts
    def channel_idx_len = log2Ceil(channel_size)

    val branch_resolve_we = Wire(Vec(2,Bool())) 
    val branch_presolve_we = Wire(Vec(2,Bool())) 
    val branch_resolve_write_idx = Wire(UInt(channel_idx_len.W))
    val branch_presolve_write_idx = Wire(UInt(channel_idx_len.W))
    val read_idx = Wire(Vec(2,UInt(channel_idx_len.W)))
    val branch_resolve_wdata = Wire(new update_pack())
    val branch_presolve_wdata = Wire(new btb_pack()) //presolve updates btb except 4 bht, while resolve updates all of the btb
    val rdata = Wire(Vec(2,new update_pack()))
    
    //aligned to 8 bytes
    read_idx := io.i_addr(channel_idx_len+2,3)//和fetchpack地址(8bytes)对齐

    branch_resolve_we(0) := (!(io.i_branch_resolve_pack.pc(2).asBool) && io.i_branch_resolve_pack.valid)
    branch_presolve_we(0) := (io.i_branch_presolve_pack.valid && io.i_branch_presolve_pack.mispred && (!io.i_branch_resolve_pack.pc(2).asBool))
    branch_resolve_we(1) := (io.i_branch_resolve_pack.pc(2).asBool && io.i_branch_resolve_pack.valid)
    branch_presolve_we(1) := (io.i_branch_presolve_pack.valid && io.i_branch_presolve_pack.mispred && (io.i_branch_resolve_pack.pc(2).asBool))

    branch_resolve_write_idx := i_io.i_branch_resolve_pack.pc(channel_idx_len+2,3)//和fetchpack地址(8bytes)对齐
    branch_presolve_write_idx := i_io.i_branch_presolve_pack.pc(channel_idx_len+2,3)//和fetchpack地址(8bytes)对齐

    branch_resolve_wdata.bht := MuxCase(0.U,Seq(
        (io.i_branch_resolve_pack.taken && io.i_branch_resolve_pack.counter   )   === 0.U -> 1.U(2.W)
        (io.i_branch_resolve_pack.taken && io.i_branch_resolve_pack.counter   )   === 1.U -> 3.U(2.W)
        (io.i_branch_resolve_pack.taken && io.i_branch_resolve_pack.counter   )   === 2.U -> 3.U(2.W)
        (io.i_branch_resolve_pack.taken && io.i_branch_resolve_pack.counter   )   === 3.U -> 3.U(2.W)
        ((!io.i_branch_resolve_pack.taken) && io.i_branch_resolve_pack.counter)   === 0.U -> 0.U(2.W)
        ((!io.i_branch_resolve_pack.taken) && io.i_branch_resolve_pack.counter)   === 1.U -> 0.U(2.W)
        ((!io.i_branch_resolve_pack.taken) && io.i_branch_resolve_pack.counter)   === 2.U -> 0.U(2.W)
        ((!io.i_branch_resolve_pack.taken) && io.i_branch_resolve_pack.counter)   === 3.U -> 2.U(2.W)
    ))
    branch_resolve_wdata.target_address := io.branch_resolve_pack.target_address
    branch_resolve_wdata.valid := true.B //tobe decided
    branch_resolve_wdata.branch_type := io.i_branch_resolve_pack.branch_type

    branch_presolve_wdata.

    val bht = Vec(2,SyncReadMem(channel_idx_len, new UInt(2.W))) //two channels 4 two insts in a fetch pack
    val btb = Vec(2,SyncReadMem(channel_idx_len, new btb_pack()))
    assert(presolve and resolve not the same addr)
    //resolve update and read
    for(i<- 0 until 2){
        bht(i).write(branch_resolve_write_idx(i),branch_resolve_wdata.bht,branch_resolve_we(i))
    }
    for(i<- 0 until 2){
        btb(i).write(branch_resolve_write_idx(i),branch_resolve_wdata.btb_pack,branch_resolve_we(i))
    }
    //read
    for(i<- 0 until 2){
        rdata(i).btb_pack := btb(i).read(read_idx)
    }
    //presolve
    for(i<- 0 until 2){
        btb(i).write(branch_presolve_write_idx(i),branch_presolve_wdata.btb_pack,branch_presolve_we(i))
    }

    io.o_prediction_packs := rdata //改一改
}