`timescale 1ns / 1ps
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN

module front_end_tb;
    // Inputs
    reg clk;
    reg resetn;

    reg [63:0] io_icache_io_i_data;
    reg        io_icache_io_i_data_valid;
    reg        io_icache_io_i_addr_ready;
    reg        io_i_branch_resolve_pack_valid;
    reg        io_i_branch_resolve_pack_mispred;
    reg        io_i_branch_resolve_pack_taken;
    reg [63:0] io_i_branch_resolve_pack_pc;
    reg [63:0] io_i_branch_resolve_pack_target;
    reg [7:0]  io_i_branch_resolve_pack_rob_idx;
    reg        io_i_branch_resolve_pack_prediction_valid;
    reg [2:0]  io_i_branch_resolve_pack_branch_type;
    reg        io_i_pc_redirect_valid;
    reg [63:0] io_i_pc_redirect_target;
    reg        io_o_fetch_pack_ready;

    // Instantiate the Unit Under Test (UUT)
    Front_End uut (
        .clock(clk), 
        .reset(!resetn), 
        .io_icache_io_i_data(io_icache_io_i_data),
        .io_icache_io_i_data_valid(io_icache_io_i_data_valid),
        .io_icache_io_i_addr_ready(io_icache_io_i_addr_ready),
        .io_i_branch_resolve_pack_valid(io_i_branch_resolve_pack_valid),
        .io_i_branch_resolve_pack_mispred(io_i_branch_resolve_pack_mispred),
        .io_i_branch_resolve_pack_taken(io_i_branch_resolve_pack_taken),
        .io_i_branch_resolve_pack_pc(io_i_branch_resolve_pack_pc),
        .io_i_branch_resolve_pack_target(io_i_branch_resolve_pack_target),
        .io_i_branch_resolve_pack_rob_idx(io_i_branch_resolve_pack_rob_idx),
        .io_i_branch_resolve_pack_prediction_valid(io_i_branch_resolve_pack_prediction_valid),
        .io_i_branch_resolve_pack_branch_type(io_i_branch_resolve_pack_branch_type),
        .io_i_pc_redirect_valid(io_i_pc_redirect_valid),
        .io_i_pc_redirect_target(io_i_pc_redirect_target),
        .io_o_fetch_pack_ready(io_o_fetch_pack_ready)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        resetn = 0;

       io_icache_io_i_data=64'b0;
       io_icache_io_i_data_valid=1'b0;
       io_icache_io_i_addr_ready=1'b0;
       io_i_branch_resolve_pack_valid=1'b0;
       io_i_branch_resolve_pack_mispred=1'b0;
       io_i_branch_resolve_pack_taken=1'b0;
       io_i_branch_resolve_pack_pc=64'b0;
       io_i_branch_resolve_pack_target=64'b0;
       io_i_branch_resolve_pack_rob_idx=8'b0;
       io_i_branch_resolve_pack_prediction_valid=1'b0;
       io_i_branch_resolve_pack_branch_type=3'b0;
       io_i_pc_redirect_valid=1'b0;
       io_i_pc_redirect_target=64'b0;
       io_o_fetch_pack_ready=1'b0;

        #10;
        
        io_o_fetch_pack_ready = 1'b1;
        io_icache_io_i_addr_ready = 1'b1;
		#100;
        resetn = 1;

        #10;
        io_i_branch_resolve_pack_valid = 1'b1;
        io_i_branch_resolve_pack_mispred = 1'b0;
        io_i_branch_resolve_pack_taken = 1'b1;
        io_i_branch_resolve_pack_prediction_valid = 1'b1;
        io_i_branch_resolve_pack_pc = 64'h1230;
        io_i_branch_resolve_pack_target = 64'h5678;

        io_icache_io_i_data_valid = 1'b1;
        io_icache_io_i_data[31:0] = 32'h00510113;
        io_icache_io_i_data[63:32] = 32'h00510213;

        #10
        io_i_branch_resolve_pack_valid = 1'b0;
        io_icache_io_i_data[31:0] = 32'h00110233;
        io_icache_io_i_data[63:32] =32'h40110133;
        #20
        io_i_pc_redirect_valid = 1'b1;
        io_i_pc_redirect_target = 64'h8;
        #30
        io_i_pc_redirect_valid = 1'b0;
        io_i_branch_resolve_pack_valid = 1'b1;
        io_i_branch_resolve_pack_mispred = 1'b1;
        io_i_branch_resolve_pack_taken = 1'b1;
        io_i_branch_resolve_pack_prediction_valid = 1'b1;
        io_i_branch_resolve_pack_pc = 64'h4328;
        io_i_branch_resolve_pack_target = 64'h890a;


        #10
        io_i_branch_resolve_pack_valid = 1'b0;
        io_i_pc_redirect_valid = 1'b0;
    //    fetch_pack_valid = 1'b0;
            #20
        io_i_pc_redirect_valid = 1'b1;
        io_i_pc_redirect_target = 64'h61230;
        #10
         io_i_pc_redirect_valid = 1'b0;       

        #100 
        $finish(1);
    end
    always #5 clk = ~clk;

endmodule