package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class dpic_axi_ver extends BlackBox{
  val io = IO(new Bundle{
    val clk = Input(Clock())
    val rst = Input(Reset())
    val stop = Input(Bool())

    val axi_readAddr_ready        =Output(UInt(1.W))           
    val axi_readAddr_valid        =Input(UInt(1.W))         
    val axi_readAddr_bits_addr    =Input(UInt(64.W))
    val axi_readAddr_bits_prot    =Input(UInt(3.W))
    val axi_readData_ready        =Input(UInt(1.W))         
    val axi_readData_valid        =Output(UInt(1.W))          
    val axi_readData_bits_data    =Output(UInt(128.W))
    val axi_readData_bits_resp    =Output(UInt(2.W)) 
    val axi_writeAddr_ready       =Output(UInt(1.W))      
    val axi_writeAddr_valid       =Input(UInt(1.W))         
    val axi_writeAddr_bits_addr   =Input(UInt(64.W))  
    val axi_writeAddr_bits_prot   =Input(UInt(3.W))  
    val axi_writeData_ready       =Output(UInt(1.W))          
    val axi_writeData_valid       =Input(UInt(1.W))         
    val axi_writeData_bits_data   =Input(UInt(128.W))  
    val axi_writeData_bits_strb   =Input(UInt(16.W))  
    val axi_writeResp_ready       =Input(UInt(1.W))         
    val axi_writeResp_valid       =Output(UInt(1.W))          
    val axi_writeResp_bits        =Output(UInt(2.W))  

    //regfile dpi
    val regs0 = Input(UInt(64.W))
    val regs1 = Input(UInt(64.W))
    val regs2 = Input(UInt(64.W))
    val regs3 = Input(UInt(64.W))
    val regs4 = Input(UInt(64.W))
    val regs5 = Input(UInt(64.W))
    val regs6 = Input(UInt(64.W))
    val regs7 = Input(UInt(64.W))
    val regs8 = Input(UInt(64.W))
    val regs9 = Input(UInt(64.W))
    val regs10 = Input(UInt(64.W))
    val regs11 = Input(UInt(64.W))
    val regs12 = Input(UInt(64.W))
    val regs13 = Input(UInt(64.W))
    val regs14 = Input(UInt(64.W))
    val regs15 = Input(UInt(64.W))
    val regs16 = Input(UInt(64.W))
    val regs17 = Input(UInt(64.W))
    val regs18 = Input(UInt(64.W))
    val regs19 = Input(UInt(64.W))
    val regs20 = Input(UInt(64.W))
    val regs21 = Input(UInt(64.W))
    val regs22 = Input(UInt(64.W))
    val regs23 = Input(UInt(64.W))
    val regs24 = Input(UInt(64.W))
    val regs25 = Input(UInt(64.W))
    val regs26 = Input(UInt(64.W))
    val regs27 = Input(UInt(64.W))
    val regs28 = Input(UInt(64.W))
    val regs29 = Input(UInt(64.W))
    val regs30 = Input(UInt(64.W))
    val regs31 = Input(UInt(64.W))
  })
}

