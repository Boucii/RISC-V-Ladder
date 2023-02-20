package Ladder
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

//add stall and exception and rbk
class Decoder extends Module with consts{
    val io = IO(new Bundle {
        val i_fetch_pack = Flipped(Decoupled(new fetch_pack()))
        val o_decode_packs = Output(Vec(2,new uop()))

        val i_exception = Input(Bool())
        val i_branch_resolve_pack = Input(new branch_resolve_pack())
        val i_stall = Input(Bool())
    })
    val inst_valid = Wire(Vec(2,Bool()))
    val wires = List(
      List( inst_valid(0), 
            io.o_decode_packs(0).func_code  , 
            io.o_decode_packs(0).regWen     , 
            io.o_decode_packs(0).inst_type  , 
            io.o_decode_packs(0).op1_sel    , 
            io.o_decode_packs(0).op2_sel    , 
            io.o_decode_packs(0).alu_sel    , 
            io.o_decode_packs(0).branch_type, 
            io.o_decode_packs(0).mem_type
      ),
      List( inst_valid(1),
            io.o_decode_packs(1).func_code  , 
            io.o_decode_packs(1).regWen     , 
            io.o_decode_packs(1).inst_type  , 
            io.o_decode_packs(1).op1_sel    , 
            io.o_decode_packs(1).op2_sel    , 
            io.o_decode_packs(1).alu_sel    , 
            io.o_decode_packs(1).branch_type, 
            io.o_decode_packs(1).mem_type
      )
    )
    val default_table = List(N,BitPat.dontCare(7),N,BitPat.dontCare(7),BitPat.dontCare(3),BitPat.dontCare(3),BitPat.dontCare(5),BitPat.dontCare(4),BitPat.dontCare(2))

    io.i_fetch_pack.ready:= !io.i_stall && !io.i_exception && (!(io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred)) 
    val table = decode_table.table 
    val uops = RegInit(0.U.asTypeOf(Vec(2,new uop())))//aka uop
    val insts = Wire(Vec(2,UInt(64.W)))

  when(io.i_fetch_pack.valid && (!io.i_stall) && (!(io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred)) && (!io.i_exception)){
    for(i <- 0 until 2){
       uops(i).valid := io.i_fetch_pack.bits.valids(i)
       uops(i).pc:=io.i_fetch_pack.bits.pc+Mux(i.U===0.U,0.U,4.U)
       uops(i).inst:=io.i_fetch_pack.bits.insts(i)
       uops(i).branch_predict_pack := io.i_fetch_pack.bits.branch_predict_pack
    }
  }.elsewhen(io.i_stall && (!io.i_exception)){
    for(i <- 0 until 2){
       uops(i) := uops(i)
    }
  }otherwise{
    for(i <- 0 until 2){
       uops(i).valid := false.B
       uops(i).pc:=0.U
       uops(i).inst:=0.U
       uops(i).branch_predict_pack := DontCare
    }
  }
    io.o_decode_packs:=uops

    insts(0) := uops(0).inst
    insts(1) := uops(1).inst

    for( i <- 0 until default_table.size ){
      val partial_tab = table.map(j => j._1->j._2(i))
      val default_entry = default_table(i)
      wires(0)(i):=decoder(QMCMinimizer,insts(0),TruthTable(partial_tab,default_entry))
      wires(1)(i):=decoder(QMCMinimizer,insts(1),TruthTable(partial_tab,default_entry))
    }

    //val decode_info = (VecInit.tabulate(2){i=>Wire(new DecodeInfo()).decode(uops(i).inst,decode_table.table)})

    val immI=VecInit.tabulate(2){i=>Mux(insts(i)(31)=/=1.U,insts(i)(31,20),Cat(0xfffffffffffffL.U,insts(i)(31,20)))}
    val immS=VecInit.tabulate(2){i=>Mux(insts(i)(31)=/=1.U,Cat(insts(i)(31,25),insts(i)(11,7)),Cat(Cat(0xffffffffL.U,insts(i)(31,25)),insts(i)(11,7)))}
    val immU=VecInit.tabulate(2){i=>insts(i)(31,12)<<12}
    val immJ=VecInit.tabulate(2){i=>(Mux(insts(i)(31)===1.U,0xfffffffffffL.U,insts(i)(31,31))<<20).asUInt+(insts(i)(19,12)<<12).asUInt+(insts(i)(20,20)<<11).asUInt+(insts(i)(30,21)<<1).asUInt} //optimization?}
    val immB=VecInit.tabulate(2){i=>(Mux(insts(i)(31)=/=1.U,insts(i)(31,31),0xfffffffffffL.U)<<12).asUInt+(insts(i)(7,7)<<11).asUInt+(insts(i)(30,25)<<5).asUInt+(insts(i)(11,8)<<1).asUInt}

    //IOs

   for(i <- 0 until 2){
     //io.o_decode_packs(i).valid := io.i_fetch_pack.valid && inst_valid(i)//to be modified//wrong!
     //io.o_decode_packs(i).valid := inst_valid(i) && uops(i).valid
     io.o_decode_packs(i).valid := inst_valid(i) && uops(i).valid &&(!io.i_stall) && (!io.i_exception) && (!(io.i_branch_resolve_pack.valid && io.i_branch_resolve_pack.mispred))
     io.o_decode_packs(i).imm := MuxCase(0.U,Seq(
         (io.o_decode_packs(i).inst_type === I_TYPE)->immI(i),
         (io.o_decode_packs(i).inst_type === U_TYPE)->immU(i),
         (io.o_decode_packs(i).inst_type === S_TYPE) ->immS(i),
         (io.o_decode_packs(i).inst_type === J_TYPE) -> immJ(i),
         (io.o_decode_packs(i).inst_type === B_TYPE) ->immB(i),
         (io.o_decode_packs(i).inst_type === R_TYPE) ->0.U(64.W),
     ))
     io.o_decode_packs(i).arch_rs1:= insts(i)(19,15)
     io.o_decode_packs(i).arch_rs2:= insts(i)(24,20)
     io.o_decode_packs(i).arch_dst:= Mux(io.o_decode_packs(i).regWen, insts(i)(11,7), 0.U)
     /*
     io.o_decode_packs(i).arch_dst:= MuxCase(insts(i)(11,7),Seq(
        (io.o_decode_packs(i).inst_type === S_TYPE) ->immS(i),
        (io.o_decode_packs(i).inst_type === B_TYPE) ->immB(i),
     ))*/
     io.o_decode_packs(i).src1_valid:=MuxCase(false.B,Seq(
       (io.o_decode_packs(i).op1_sel === SRC_RS )-> false.B,
       (io.o_decode_packs(i).op1_sel === SRC_IMM) ->true.B,
       (io.o_decode_packs(i).op1_sel === SRC_PC )->true.B,
       (io.o_decode_packs(i).op1_sel === SRC_ZERO) -> true.B,
       (io.o_decode_packs(i).op1_sel === SRC_N )-> true.B,
     ))
      io.o_decode_packs(i).src2_valid:=MuxCase(false.B,Seq(
        (io.o_decode_packs(i).op2_sel === SRC_RS   )-> false.B,
        (io.o_decode_packs(i).op2_sel === SRC_IMM )->true.B,
        (io.o_decode_packs(i).op2_sel === SRC_PC  )->true.B,
        (io.o_decode_packs(i).op2_sel === SRC_ZERO )-> true.B,
        (io.o_decode_packs(i).op2_sel === SRC_N    )-> true.B,
      ))
      io.o_decode_packs(i).src1_value:=MuxCase(0.U,Seq(
        (io.o_decode_packs(i).op1_sel === SRC_IMM) ->io.o_decode_packs(i).imm,
        (io.o_decode_packs(i).op1_sel === SRC_PC )->io.o_decode_packs(i).pc,
        (io.o_decode_packs(i).op1_sel === SRC_ZERO) -> 0.U(64.W)
      )) 
      io.o_decode_packs(i).src2_value:=MuxCase(0.U,Seq(
        (io.o_decode_packs(i).op2_sel === SRC_IMM) ->io.o_decode_packs(i).imm,
        (io.o_decode_packs(i).op2_sel === SRC_PC )->io.o_decode_packs(i).pc,
        (io.o_decode_packs(i).op2_sel === SRC_ZERO) -> 0.U(64.W)
      ))
   }
}
