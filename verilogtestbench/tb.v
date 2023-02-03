`timescale 1ns / 1ps
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN

module back_end;
    // Inputs
    reg clk;
    reg resetn;

    reg fetch_pack_valid;
    reg [63:0] pc;
    reg [31:0] insts_0;
    reg [31:0] insts_1;
    reg branch_predict_pack_valid;
    reg [63:0] branch_predict_pack_target;
    reg branch_predict_pack_select;
    reg branch_predict_pack_taken;
    reg [3:0] branch_predict_pack_branch_type;
    reg fetch_pack_valid0;
    reg fetch_pack_valid1;

    reg dcache_io_valid;
    reg [63:0] dcache_io_MdataIn;

    reg i_interrupt;

    // Instantiate the Unit Under Test (UUT)
    Back_End_With_Decode uut (
        .clock(clk), 
        .reset(!resetn), 
        .io_i_fetch_pack_valid(fetch_pack_valid),
        .io_i_fetch_pack_bits_pc(pc),
        .io_i_fetch_pack_bits_insts_0(insts_0),
        .io_i_fetch_pack_bits_insts_1(insts_1),

        .io_i_fetch_pack_bits_branch_predict_pack_valid(branch_predict_pack_valid),
        .io_i_fetch_pack_bits_branch_predict_pack_target(branch_predict_pack_target),
        .io_i_fetch_pack_bits_branch_predict_pack_branch_type(branch_predict_pack_branch_type),
        .io_i_fetch_pack_bits_branch_predict_pack_select(branch_predict_pack_selec),
        .io_i_fetch_pack_bits_branch_predict_pack_taken(branch_predict_pack_taken),

        .io_i_interrupt(i_interrupt),
        .io_i_fetch_pack_bits_valids_0(fetch_pack_valid0),
        .io_i_fetch_pack_bits_valids_1(fetch_pack_valid1),

        .io_dcache_io_data_valid(dcache_io_valid),
        .io_dcache_io_addr_ready(dcache_io_valid),
        .io_dcache_io_MdataIn(dcache_io_MdataIn)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        resetn = 0;

        i_interrupt = 1'b0;
        fetch_pack_valid0 = 1'b0;
        fetch_pack_valid1 = 1'b0;
        fetch_pack_valid = 1'b0;
        pc = 64'h00000000;
        insts_0 = 32'h00000000;
        insts_1 = 32'h00000000;
    
        branch_predict_pack_valid = 1'b0;
        branch_predict_pack_target = 64'b0;
        branch_predict_pack_select = 1'b0 ;
        branch_predict_pack_taken = 1'b0;
        branch_predict_pack_branch_type= 4'b0;

        dcache_io_valid = 1'b0;
        dcache_io_MdataIn = 64'h0000000000000000;

        #10;
        fetch_pack_valid = 1'b1;
        pc = 64'h00000004;
        fetch_pack_valid0 = 1'b1;
        fetch_pack_valid1 = 1'b1;
        fetch_pack_valid = 1'b1;
        insts_0 = 32'h00508093; //x1=5
        //insts_1 = 32'h0030a2a3; //x3 = 内存5
        insts_1 = 32'h0030a2a3; //x3 = 内存5

		#100;
        resetn = 1;
        #10 
        fetch_pack_valid1 = 1'b0;
        insts_0 = 32'h0030a2a3;
        #10
        fetch_pack_valid0 = 1'b0;
        fetch_pack_valid1 = 1'b0;
        fetch_pack_valid = 1'b0;
        #70
        i_interrupt = 1'b1;
        #10
        branch_predict_pack_valid = 1'b0;
        fetch_pack_valid0 = 1'b0;
        fetch_pack_valid1 = 1'b0;
        fetch_pack_valid = 1'b0;
		#200;
        //should stuck on insts1
        dcache_io_MdataIn = 64'h0000000000004321;
        dcache_io_valid = 1'b1;

        //passed

        /*
        #10;
        insts_0 = 32'h34109173;
        insts_1 = 32'h3411a173;

        #10
        insts_0=32'h30200073;//mret ,redirect to pc=15
        insts_1=32'h3410b273;//should be flushed
        //insts_1=32'h30200073;
        //should all be flushed
        #10;
        insts_0 = 32'h34109173;
        insts_1 = 32'h3411a173;

        #10
        insts_0=32'h30200073;//mret ,redirect to pc=15
        insts_1=32'h3410b273;//should be flushed
        //insts_1=32'h30200073;
        */
        #10
        fetch_pack_valid = 1'b0;

        #200 
        $finish(1);
    end
    always #5 clk = ~clk;

endmodule