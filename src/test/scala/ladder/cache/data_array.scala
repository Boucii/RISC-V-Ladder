package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class Data_Array extends Module{
    val io = IO(new Bundle{
        val i_ren = Input(Bool())
        val i_wen = Input(Bool())
        val i_wstrb = Input(UInt(16.W))
        val i_addr = Input(UInt(7.W))
        val i_wdata = Input(UInt(128.W))
        val o_rdata = Output(UInt(128.W))
    })
    val wen_external = Wire(UInt(2.W))
    val ren_external = Wire(UInt(2.W))
    val cen_external = Wire(UInt(2.W))
    val bwen_external = Wire(Vec(16,UInt(8.W)))
    val q_external = Wire(Vec(2,UInt(128.W)))
    wen_external := MuxCase(0.U,Seq(
        (io.i_addr(6) === "b0".U) -> "b01".U,
        (io.i_addr(6) === "b1".U) -> "b10".U,
    )) & Fill(2,io.i_wen)
    ren_external := MuxCase(0.U,Seq(
        (io.i_addr(6) === "b0".U) -> "b01".U,
        (io.i_addr(6) === "b1".U) -> "b10".U,
    )) & Fill(2,io.i_ren)
    cen_external := (wen_external | ren_external)
    for(i <- 0 to 15){
        bwen_external(i) := Fill(8,~io.i_wstrb(i))
    }
    val srams = Seq.fill(2)(Module(new S011HD1P_X32Y2D128_BW()))
    for(i <- 0 to 1){
        srams(i).io.CLK := clock
        //srams(i).io.CEN := ~cen_external(i)
        srams(i).io.CEN := 0.U
        srams(i).io.WEN := ~wen_external(i)
        srams(i).io.BWEN := bwen_external.asUInt() 
        srams(i).io.A := io.i_addr(5,0)
        srams(i).io.D := io.i_wdata
        q_external(i) := srams(i).io.Q 
    }
    val ren_external_reg = RegInit(0.U(2.W))
    ren_external_reg := ren_external

    val last_wen = RegInit(false.B)
    val last_waddr = RegInit(0.U(7.W))
    val last_wdata = RegInit(0.U(128.W))

    last_wen   := io.i_wen
    last_waddr := io.i_addr
    last_wdata := io.i_wdata

    io.o_rdata := Mux(last_wen && last_waddr===io.i_addr,last_wdata,
        MuxCase(0.U,Seq(
        (ren_external_reg === "b01".U) -> q_external(0),
        (ren_external_reg === "b10".U) -> q_external(1),
    )) 
    )
}
