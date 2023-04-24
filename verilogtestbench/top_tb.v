`timescale 1ns / 1ps
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN

module Ladder_tb;
    // Inputs
    reg clk;
    reg resetn;

    reg [63:0] io_icache_io_i_data;
    reg        io_icache_io_i_addr_ready;
    reg        io_icache_io_i_data_valid;
    reg        io_dcache_io_data_valid;
    reg        io_dcache_io_addr_ready;
    reg [63:0] io_dcache_io_MdataIn;
    reg        io_i_interrupt;


    Ladder uut1 (
        .clock(clk),
        .reset(!resetn), 
        .io_icache_io_o_wen(io_icache_io_o_wen),
        .io_icache_io_o_addr(io_icache_io_o_addr),
        .io_icache_io_i_data(io_icache_io_i_data),
        .io_icache_io_i_addr_ready(io_icache_io_i_addr_ready),
        .io_icache_io_o_addr_valid(io_icache_io_o_addr_valid),
        .io_icache_io_i_data_valid(io_icache_io_i_data_valid),
        .io_dcache_io_data_valid(io_dcache_io_data_valid),
        .io_dcache_io_data_ready(io_dcache_io_data_ready),
        .io_dcache_io_addr_valid(io_dcache_io_addr_valid),
        .io_dcache_io_addr_ready(io_dcache_io_addr_ready),
        .io_dcache_io_Mwout(io_dcache_io_Mwout),
        .io_dcache_io_Maddr(io_dcache_io_Maddr),
        .io_dcache_io_Men(io_dcache_io_Men),
        .io_dcache_io_Mlen(io_dcache_io_Mlen),
        .io_dcache_io_MdataIn(io_dcache_io_MdataIn),
        .io_dcache_io_MdataOut(io_dcache_io_MdataOut),
        .io_i_interrupt(io_i_interrupt)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        resetn = 0;

    io_icache_io_i_data = 64'h0;
    io_icache_io_i_addr_ready = 1'b0;
    io_icache_io_i_data_valid = 1'b0;
    io_dcache_io_data_valid = 1'b0;
    io_dcache_io_addr_ready = 1'b0;
    io_dcache_io_MdataIn = 64'b0;
    io_i_interrupt = 1'b0;

        #10;
    io_icache_io_i_addr_ready = 1'b1; 
    io_icache_io_i_data_valid = 1'b1;
    io_icache_io_i_data[31:0] = 32'h00508093;
    io_icache_io_i_data[63:32] = 32'h00508113;

		#100;
        resetn = 1;

        #10;
    io_icache_io_i_data[31:0] = 32'h00510113;//x2=5
    io_icache_io_i_data[63:32] = 32'h00508093;//x1=5

        #20;
    io_icache_io_i_data[31:0] = 32'h022081b3;//x3 = 25
    io_icache_io_i_data[63:32] = 32'h00508093; //x1=10  
        #10;
    io_icache_io_i_data[31:0] = 32'h40110133;//sub x2, x2 ,x1
    io_icache_io_i_data[63:32] = 32'h00110233;//add x4, x2 ,x1

        #15
    io_icache_io_i_addr_ready = 1'b0; 
    io_icache_io_i_data_valid = 1'b0;        

        #300 
        $finish(1);
    end
    always #5 clk = ~clk;

endmodule