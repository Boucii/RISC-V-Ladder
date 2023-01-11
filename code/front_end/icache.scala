package Ladder
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._
class icache_io extends Bundle{

}
//TODO: implement using C++ verilator
class icache extends Module
{
   val io =IO( new Bundle {
      //TODO: should we make this decoupled? 
      val i_imem_fetch_req_interface = new imem_fetch_req_interface().asInput
      val o_imem_fetch_res_interface = Valid(imem_fetch_res_interface.asOutput)
      val o_stall = Bool(Output)
   })
}