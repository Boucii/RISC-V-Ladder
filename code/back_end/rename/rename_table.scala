class rename_req_pack extends Bundle
{
  val arch_rs1 = UInt(5.W)
  val arch_rs2 = UInt(5.W)
  val arch_dst = UInt(5.W)
}
class rename_res_pack extends Bundle
{
  val arch_rs1 = UInt(5.W)
  val arch_rs2 = UInt(5.W)
  val arch_dst = UInt(5.W)
}
class Rename_Table extends Module{
    val io=IO(new Bundle{
        val i_rename_req_packs=Input(Vec(2,new rename_req_pack()))
        val o_rename_res_packs=Output(Vec(2,new rename_res_pack()))

        val i_allocation_pack=Input(new allocation_pack())

        val i_commit_packss=Input(Vec(2,new rename_req_pack()))
        val i_rollback_packs=Input(Vec(2,new rename_req_pack()))

        val i_exception=Input(Bool())
        //val i_branch_backuptables //well....what to do with this one..
    })
    val rename_table = RegInit(VecInit(Seq.fill(32)(0.U(7.W))))
    val commit_rename_table = RegInit(VecInit(Seq.fill(32)(0.U(7.W))))

    //write logic
    when(i_commit_packs(0).valid){
        commit_rename_table(i_commit_packs(0).uop.arch_dst):=i_commit_packs(0).uop.phy_dst
    }
    when(i_commit_packs(1).valid){
        commit_rename_table(i_commit_packs(1).uop.arch_dst):=i_commit_packs(1).uop.phy_dst
    }
    when(i_rollback_pack(0).valid){
        commit_rename_table(i_rollback_pack(0).uop.arch_dst):=i_rollback_pack(0).uop.stale_dst
    }
    when(i_rollback_pack(1).valid){
        commit_rename_table(i_rollback_pack(1).uop.arch_dst):=i_rollback_pack(1).uop.stale_dst
    }
    when(i_allocation_pack(0).valid){
        rename_table(i_allocation_pack(0).uop.arch_dst):=i_allocation_pack(0).uop.phy_dst
        rename_table(i_allocation_pack(1).uop.arch_dst):=i_allocation_pack(0).uop.phy_dst
    }

    //read logic
    for(i<-0 until 2){
        io.o_rename_res_packs(i).arch_rs1:=rename_table(io.i_rename_req_packs(i).arch_rs1)
        io.o_rename_res_packs(i).arch_rs2:=rename_table(io.i_rename_req_packs(i).arch_rs2)
        io.o_rename_res_packs(i).arch_dst:=rename_table(io.i_rename_req_packs(i).arch_dst_old)
    }

    //exception logic
    when(i_exception){
        rename_table:=commit_rename_table
    }
}