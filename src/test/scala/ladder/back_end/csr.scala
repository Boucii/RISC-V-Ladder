package Ladder

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.util._
import chisel3.util.experimental.decode._
import chisel3.experimental.BundleLiterals._

class CSR extends Module with consts{
    val io = IO(new Bundle{
        val i_exception = Input(Bool())
        val i_interrupt = Input(Bool())
        val i_commit_packs = Input(Vec(2,new valid_uop_pack()))
        val o_pc_redirect_target = Output(UInt(64.W))
        val o_pc_redirect_valid = Output(Bool())

        val o_commit_packs_modified = Output(Vec(2,new valid_uop_pack())) //commitpacks considering csr insts
        //for debugging
        val o_mepc    = Output(UInt(64.W))
        val o_mtvec   = Output(UInt(64.W))
        val o_mcause  = Output(UInt(64.W))
        val o_mstatus = Output(UInt(64.W))
    })
    //dontTouch(io)
    //csr regfile
    val mepc    = RegInit(0.U(64.W))
    val mtvec   = RegInit(0.U(64.W))
    val mcause  = RegInit(0.U(64.W))  
    val mstatus = RegInit(0xa00001800L.U(64.W))//tobe decided each bit

    io.o_mepc := mepc
    io.o_mtvec := mtvec
    io.o_mcause := mcause
    io.o_mstatus := mstatus

    //csr read write logic
    //a.commit packs is ecall, mret and valid, and b.interrput/exception :ab are exclusive 
    //each commit packs can only has one csr write/read valid
    //when there's ecall, mret and ebreak, it should and only be the valid inst in a cmt pack, and it's the first of the cmt pack 
    val commit0_is_csr_rw = Wire(Bool())
    val commit1_is_csr_rw = Wire(Bool())
    val csr_addr = Wire(UInt(12.W))
    val csr_wdata = Wire(UInt(64.W))
    val csr_rdata = Wire(UInt(64.W))
    commit0_is_csr_rw := io.i_commit_packs(0).valid &&
            io.i_commit_packs(0).uop.func_code === FU_CSR && (
            io.i_commit_packs(0).uop.alu_sel === CSR_CSRRC ||
            io.i_commit_packs(0).uop.alu_sel === CSR_CSRRW ||
            io.i_commit_packs(0).uop.alu_sel === CSR_CSRRS 
            )
    commit1_is_csr_rw := io.i_commit_packs(1).valid &&
            io.i_commit_packs(1).uop.func_code === FU_CSR && (
            io.i_commit_packs(1).uop.alu_sel === CSR_CSRRC ||
            io.i_commit_packs(1).uop.alu_sel === CSR_CSRRW ||
            io.i_commit_packs(1).uop.alu_sel === CSR_CSRRS 
            )
    csr_addr := Mux(commit0_is_csr_rw, io.i_commit_packs(0).uop.inst(31,20), io.i_commit_packs(1).uop.inst(31,20))
    csr_rdata := MuxCase(0.U,Seq(
        (csr_addr === 0x300.U)-> mstatus,
        (csr_addr === 0x342.U)-> mcause,
        (csr_addr === 0x341.U)-> mepc,
        (csr_addr === 0x305.U)-> mtvec
    ))
    csr_wdata := MuxCase(0.U,Seq(
        (commit0_is_csr_rw && io.i_commit_packs(0).uop.alu_sel === CSR_CSRRC) -> (csr_rdata & (~io.i_commit_packs(0).uop.src1_value)),
        (commit0_is_csr_rw && io.i_commit_packs(0).uop.alu_sel === CSR_CSRRW) -> (io.i_commit_packs(0).uop.src1_value),
        (commit0_is_csr_rw && io.i_commit_packs(0).uop.alu_sel === CSR_CSRRS) -> (csr_rdata | (io.i_commit_packs(0).uop.src1_value)),
        (commit1_is_csr_rw && io.i_commit_packs(1).uop.alu_sel === CSR_CSRRC) -> (csr_rdata & (~io.i_commit_packs(1).uop.src1_value)),
        (commit1_is_csr_rw && io.i_commit_packs(1).uop.alu_sel === CSR_CSRRW) -> (io.i_commit_packs(1).uop.src1_value),
        (commit1_is_csr_rw && io.i_commit_packs(1).uop.alu_sel === CSR_CSRRS) -> (csr_rdata | (io.i_commit_packs(1).uop.src1_value))
    ))

    assert(!(commit0_is_csr_rw && commit1_is_csr_rw),"cmt 0 and 1 are all csr insts\n")

    when(commit0_is_csr_rw || commit1_is_csr_rw){//其实就是commitpacks(0)是不是csr读写,这个逻辑改一下
        when(csr_addr===0x300.U){
            mstatus := csr_wdata
        }.elsewhen(csr_addr===0x342.U){
            mcause := csr_wdata
        }.elsewhen(csr_addr===0x341.U){
            mepc := csr_wdata
        }.elsewhen(csr_addr===0x305.U){ 
            mtvec := csr_wdata
        }
    }.elsewhen(commit0_is_csr_rw && io.i_commit_packs(0).uop.alu_sel === CSR_ECALL){
        mcause := 11.U
        mepc := io.i_commit_packs(0).uop.pc//software add 4 later
    }

    io.o_commit_packs_modified := io.i_commit_packs
    when(commit0_is_csr_rw){
        io.o_commit_packs_modified(0).uop.dst_value := csr_rdata
    }
    when(commit1_is_csr_rw){
        io.o_commit_packs_modified(1).uop.dst_value := csr_rdata
    }

    //exception and interrupt and trap
    assert(io.i_exception =/= true.B ,"not implemented any exception yet!\n")

    io.o_pc_redirect_valid := io.i_exception || io.i_interrupt || 
            (io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_CSR && io.i_commit_packs(0).uop.alu_sel === CSR_ECALL)|| (io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_CSR && io.i_commit_packs(1).uop.alu_sel === CSR_ECALL)||
            (io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_CSR && io.i_commit_packs(0).uop.alu_sel === CSR_EBREAK)||(io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_CSR && io.i_commit_packs(1).uop.alu_sel === CSR_EBREAK)||
            (io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_CSR && io.i_commit_packs(0).uop.alu_sel === CSR_MRET)||  (io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_CSR && io.i_commit_packs(1).uop.alu_sel === CSR_MRET)
    io.o_pc_redirect_target := MuxCase(0.U(64.W),Seq(
        (io.i_interrupt) -> 0.U(64.W),//specify which kind of itrpt
        (io.i_exception) -> 0.U(64.W),//same
        ((io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_CSR && io.i_commit_packs(0).uop.alu_sel === CSR_ECALL)||(io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_CSR && io.i_commit_packs(1).uop.alu_sel === CSR_ECALL)) -> mtvec,
        ((io.i_commit_packs(0).valid && io.i_commit_packs(0).uop.func_code === FU_CSR && io.i_commit_packs(0).uop.alu_sel === CSR_MRET)||(io.i_commit_packs(1).valid && io.i_commit_packs(1).uop.func_code === FU_CSR && io.i_commit_packs(1).uop.alu_sel === CSR_MRET)) -> mepc
    ))
}
