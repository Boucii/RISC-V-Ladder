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
genvar i;
generate
    for(i=0; i<32; i=i+1) begin
        assign regs[i] = regs{i};
    end
endgenerate

initial set_gpr_ptr(regs);  // rf为通用寄存器的二维数组变量

  export "DPI-C" function Check;
  function bit Check();
    return stop;
  endfunction

wire [7:0] wmask;

  case(Mlen) 
    1: wmask = 8'h01;
    2: wmask = 8'h03;
    4: wmask = 8'h0f;
    8: wmask = 8'hff;
    default: wmask = 8'h00;
  endcase

//we are setting 3 cycles of mem delay
  reg [63:0] mem_buf0;
  reg [63:0] mem_buf1;
  reg [63:0] mem_buf2;

  reg mem_req0;
  reg mem_req1;
  reg mem_req2;

  assign data_valid = mem_req2;
  assign addr_ready = 1'b1;
  assign MdataIn = mem_buf2;

  always @(*) begin
    mem_buf2 = mem_buf1;
    mem_buf1 = mem_buf0;

    mem_req2 = mem_req1;
    mem_req1 = mem_req0;
  end

  always @(*) begin
	  if(MEN && !Mwout && addr_valid) BEGIN
        	PMEM_READ_DPI(RADDR, MEM_BUF0);
	  end 
    if(Men && Mwout && addr_valid && data_ready) 
          pmem_write_dpi(Maddr, MdataOut , wmask);
    end

endmodule