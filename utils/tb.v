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
    reg [31:0] pc;
    reg [31:0] insts_0;
    reg [31:0] insts_1;
    reg branch_predict_packs_0_valid;
    reg branch_predict_packs_0_is_branch;
    reg branch_predict_packs_0_taken;
    reg [31:0] branch_predict_packs_0_target;
    reg branch_predict_packs_1_valid;
    reg branch_predict_packs_1_is_branch;
    reg branch_predict_packs_1_taken;
    reg [31:0] branch_predict_packs_1_target;

    reg dcache_io_valid;
    reg [63:0] dcache_io_MdataIn;

    // Instantiate the Unit Under Test (UUT)
    Back_End_With_Decode uut (
        .clock(clk), 
        .reset(!resetn), 
        .io_i_fetch_pack_valid(fetch_pack_valid),
        .io_i_fetch_pack_bits_pc(pc),
        .io_i_fetch_pack_bits_insts_0(insts_0),
        .io_i_fetch_pack_bits_insts_1(insts_1),
        .io_i_fetch_pack_bits_branch_predict_packs_0_valid(branch_predict_packs_0_valid),
        .io_i_fetch_pack_bits_branch_predict_packs_0_is_branch(branch_predict_packs_0_is_branch),
        .io_i_fetch_pack_bits_branch_predict_packs_0_taken(branch_predict_packs_0_taken),
        .io_i_fetch_pack_bits_branch_predict_packs_0_target(branch_predict_packs_0_target),
        .io_i_fetch_pack_bits_branch_predict_packs_1_valid(branch_predict_packs_1_valid),
        .io_i_fetch_pack_bits_branch_predict_packs_1_is_branch(branch_predict_packs_1_is_branch),
        .io_i_fetch_pack_bits_branch_predict_packs_1_taken(branch_predict_packs_1_taken),
        .io_i_fetch_pack_bits_branch_predict_packs_1_target(branch_predict_packs_1_target),

        .io_dcache_io_valid(io_dcache_io_valid),
        .io_dcache_io_MdataIn(io_dcache_io_MdataIn)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        resetn = 0;

        fetch_pack_valid = 1'b0;
        pc = 32'h00000000;
        insts_0 = 32'h00000000;
        insts_1 = 32'h00000000;
        branch_predict_packs_0_valid = 1'b0;
        branch_predict_packs_0_is_branch = 1'b0;
        branch_predict_packs_0_taken = 1'b0;
        branch_predict_packs_0_target = 32'h00000000;
        branch_predict_packs_1_valid = 1'b0;
        branch_predict_packs_1_is_branch = 1'b0;
        branch_predict_packs_1_taken = 1'b0;
        branch_predict_packs_1_target = 32'h00000000;

        dcache_io_valid = 1'b0;
        dcache_io_MdataIn = 64'h0000000000000000;

        #10;
        fetch_pack_valid = 1'b1;
        pc = 32'h00000004;
        insts_0 = 32'h00508093;
        insts_1 = 32'h00508113;

		#100;
        resetn = 1;

        #10;
        insts_0 = 32'h00510113;
        insts_1 = 32'h00510213;

        #10
        insts_0=32'h00110233;
        insts_1=32'h40110133;
        #10
        fetch_pack_valid = 1'b0;

        #200 
        $finish(1);
    end
    always #5 clk = ~clk;

endmodule