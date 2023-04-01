import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void pmem_read_dpi(input longint raddr, output longint rdata);
import "DPI-C" function void pmem_write_dpi(input longint waddr, input longint wdata, input byte wmask);

module automatic dpic
(
    input wire clk,
    input wire  stop,
    
    //regfile dpi
    input wire[63:0] regs0,
    input wire[63:0] regs1,
    input wire[63:0] regs2,
    input wire[63:0] regs3,
    input wire[63:0] regs4,
    input wire[63:0] regs5,
    input wire[63:0] regs6,
    input wire[63:0] regs7,
    input wire[63:0] regs8,
    input wire[63:0] regs9,
    input wire[63:0] regs10,
    input wire[63:0] regs11,
    input wire[63:0] regs12,
    input wire[63:0] regs13,
    input wire[63:0] regs14,
    input wire[63:0] regs15,
    input wire[63:0] regs16,
    input wire[63:0] regs17,
    input wire[63:0] regs18,
    input wire[63:0] regs19,
    input wire[63:0] regs20,
    input wire[63:0] regs21,
    input wire[63:0] regs22,
    input wire[63:0] regs23,
    input wire[63:0] regs24,
    input wire[63:0] regs25,
    input wire[63:0] regs26,
    input wire[63:0] regs27,
    input wire[63:0] regs28,
    input wire[63:0] regs29,
    input wire[63:0] regs30,
    input wire[63:0] regs31,

    //dcache
    output data_valid,
    input data_ready,
    input addr_valid,
    output addr_ready,

    input Mwout,
    input [63:0] Maddr,
    input Men,
    input [31:0] Mlen,
    output [63:0] MdataIn,
    input [63:0] MdataOut
);

wire[63:0] regs[0:31];
                    
    assign regs[0] = regs0;
    assign regs[1] = regs1;
    assign regs[2] = regs2;
    assign regs[3] = regs3;
    assign regs[4] = regs4;
    assign regs[5] = regs5;
    assign regs[6] = regs6;
    assign regs[7] = regs7;
    assign regs[8] = regs8;
    assign regs[9] = regs9;
    assign regs[10] = regs10;
    assign regs[11] = regs11;
    assign regs[12] = regs12;
    assign regs[13] = regs13;
    assign regs[14] = regs14;
    assign regs[15] = regs15;
    assign regs[16] = regs16;
    assign regs[17] = regs17;
    assign regs[18] = regs18;
    assign regs[19] = regs19;
    assign regs[20] = regs20;
    assign regs[21] = regs21;
    assign regs[22] = regs22;
    assign regs[23] = regs23;
    assign regs[24] = regs24;
    assign regs[25] = regs25;
    assign regs[26] = regs26;
    assign regs[27] = regs27;
    assign regs[28] = regs28;
    assign regs[29] = regs29;
    assign regs[30] = regs30;
    assign regs[31] = regs31;

initial set_gpr_ptr(regs);  // rf为通用寄存器的二维数组变量

  export "DPI-C" function Check;
  function bit Check();
    return stop;
  endfunction

reg [7:0] wmask;

  always @(*) begin
  case(Mlen) 
    1: wmask = 8'h01;
    2: wmask = 8'h03;
    4: wmask = 8'h0f;
    8: wmask = 8'hff;
    default: assign wmask = 8'h00;
  endcase
  end

//we are setting 3 cycles of mem delay
  reg [63:0] mem_buf0;
  reg [63:0] mem_buf1;
  reg [63:0] mem_buf2;

  reg mem_req0;
  reg mem_req1;
  reg mem_req2;

  always @(posedge clk) begin
    mem_buf2 = mem_buf1;
    mem_buf1 = mem_buf0;

    mem_req2 = mem_req1;
    mem_req1 = mem_req0;
  end

  //assign data_valid = mem_req2;
  assign data_valid = mem_req0;
  assign addr_ready = 1'b1;

  //assign MdataIn = mem_buf2;
  assign MdataIn = mem_buf0;

  always @(posedge clk) begin
	  if(Men && !Mwout && addr_valid) begin
        	pmem_read_dpi(Maddr, mem_buf0);
		mem_req0 = 1'b1;
  	  end else if(Men && Mwout && addr_valid && data_ready)begin 
          	pmem_write_dpi(Maddr, MdataOut,wmask);
		mem_req0 = 1'b0;//only mem read need to wait for data valid, mem write just pass.
		//and mem_req 4 write must not be 1 since it will influce the
		//data valid signal later
	  end else begin
		mem_buf0 = 64'b0;
		mem_req0 = 1'b0;
	  end

    end

endmodule
