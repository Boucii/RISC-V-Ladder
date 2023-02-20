package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Ladder extends Module {
  val io = IO(new Bundle {
    //icache io
    val icache_io = new IcacheIO()
    //dcache io
    val dcache_io = new DcacheIO()
    val i_interrupt = Input(Bool())
    //cmt_dbg
    val o_dbg_commit_packs = Output(Vec(2,new valid_uop_pack()))
  })
  val front_end = Module(new Front_End())
  val back_end = Module(new Back_End_With_Decode())
  val dpic = Module(new dpic())

  //connect front end input
  val last_branch_resolve_pack = RegInit(0.U.asTypeOf(new branch_resolve_pack()))
  last_branch_resolve_pack := back_end.io.o_branch_resolve_pack
  //when backend branch resolve flush, the front end just have to flush one cycle
  front_end.io.i_branch_resolve_pack := Mux(last_branch_resolve_pack.asUInt === back_end.io.o_branch_resolve_pack.asUInt, 
       0.U.asTypeOf(new branch_resolve_pack()), back_end.io.o_branch_resolve_pack)
  front_end.io.i_pc_redirect_valid := back_end.io.o_pc_redirect_valid
  front_end.io.i_pc_redirect_target := back_end.io.o_pc_redirect_target

  front_end.io.icache_io.i_addr_ready := io.icache_io.i_addr_ready
  front_end.io.icache_io.i_data_valid := io.icache_io.i_data_valid
  io.icache_io.o_wen := front_end.io.icache_io.o_wen 
  io.icache_io.o_addr := front_end.io.icache_io.o_addr
  io.icache_io.o_addr_valid := front_end.io.icache_io.o_addr_valid
  front_end.io.icache_io.i_data := io.icache_io.i_data

  //connect back end input
  back_end.io.i_fetch_pack <> front_end.io.o_fetch_pack
  back_end.io.i_interrupt := io.i_interrupt

  back_end.io.dcache_io.data_valid  := dpic.io.data_valid//io.dcache_io.data_valid  
  back_end.io.dcache_io.MdataIn     := dpic.io.MdataIn//io.dcache_io.MdataIn  
  io.dcache_io.addr_valid          :=back_end.io.dcache_io.addr_valid  
  io.dcache_io.data_ready          :=back_end.io.dcache_io.data_ready
  back_end.io.dcache_io.addr_ready := dpic.io.addr_ready //io.dcache_io.addr_ready

  io.dcache_io.Mwout              :=back_end.io.dcache_io.Mwout  
  io.dcache_io.Maddr              :=back_end.io.dcache_io.Maddr  
  io.dcache_io.Men                :=back_end.io.dcache_io.Men    
  io.dcache_io.Mlen               :=back_end.io.dcache_io.Mlen   
  io.dcache_io.MdataOut           :=back_end.io.dcache_io.MdataOut

  io.o_dbg_commit_packs := back_end.io.o_dbg_commit_packs

  //connect dpi-c ports
  dpic.io.clk := clock
  dpic.io.stop := back_end.io.o_dbg_stop
  dpic.io.data_ready := back_end.io.dcache_io.data_ready
  dpic.io.addr_valid := back_end.io.dcache_io.addr_valid
  dpic.io.Mwout := back_end.io.dcache_io.Mwout
  dpic.io.Maddr := back_end.io.dcache_io.Maddr
  dpic.io.Men     :=back_end.io.dcache_io.Men    
  dpic.io.Mlen      :=back_end.io.dcache_io.Mlen   
  dpic.io.MdataOut  :=back_end.io.dcache_io.MdataOut

  dpic.io.regs0  :=  back_end.io.o_dbg_arch_regs(0)
  dpic.io.regs1  :=  back_end.io.o_dbg_arch_regs(1)
  dpic.io.regs2  :=  back_end.io.o_dbg_arch_regs(2)
  dpic.io.regs3  :=  back_end.io.o_dbg_arch_regs(3)
  dpic.io.regs4  :=  back_end.io.o_dbg_arch_regs(4)
  dpic.io.regs5  :=  back_end.io.o_dbg_arch_regs(5)
  dpic.io.regs6  :=  back_end.io.o_dbg_arch_regs(6)
  dpic.io.regs7  :=  back_end.io.o_dbg_arch_regs(7)
  dpic.io.regs8  :=  back_end.io.o_dbg_arch_regs(8)
  dpic.io.regs9  :=  back_end.io.o_dbg_arch_regs(9)
  dpic.io.regs10 :=  back_end.io.o_dbg_arch_regs(10)
  dpic.io.regs11 :=  back_end.io.o_dbg_arch_regs(11)
  dpic.io.regs12 :=  back_end.io.o_dbg_arch_regs(12)
  dpic.io.regs13 :=  back_end.io.o_dbg_arch_regs(13)
  dpic.io.regs14 :=  back_end.io.o_dbg_arch_regs(14)
  dpic.io.regs15 :=  back_end.io.o_dbg_arch_regs(15)
  dpic.io.regs16 :=  back_end.io.o_dbg_arch_regs(16)
  dpic.io.regs17 :=  back_end.io.o_dbg_arch_regs(17)
  dpic.io.regs18 :=  back_end.io.o_dbg_arch_regs(18)
  dpic.io.regs19 :=  back_end.io.o_dbg_arch_regs(19)
  dpic.io.regs20 :=  back_end.io.o_dbg_arch_regs(20)
  dpic.io.regs21 :=  back_end.io.o_dbg_arch_regs(21)
  dpic.io.regs22 :=  back_end.io.o_dbg_arch_regs(22)
  dpic.io.regs23 :=  back_end.io.o_dbg_arch_regs(23)
  dpic.io.regs24 :=  back_end.io.o_dbg_arch_regs(24)
  dpic.io.regs25 :=  back_end.io.o_dbg_arch_regs(25)
  dpic.io.regs26 :=  back_end.io.o_dbg_arch_regs(26)
  dpic.io.regs27 :=  back_end.io.o_dbg_arch_regs(27)
  dpic.io.regs28 :=  back_end.io.o_dbg_arch_regs(28)
  dpic.io.regs29 :=  back_end.io.o_dbg_arch_regs(29)
  dpic.io.regs30 :=  back_end.io.o_dbg_arch_regs(30)
  dpic.io.regs31 :=  back_end.io.o_dbg_arch_regs(31)
}
