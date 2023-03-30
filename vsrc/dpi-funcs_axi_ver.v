import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void pmem_read_dpi(input longint raddr, output longint rdata);
import "DPI-C" function void pmem_write_dpi(input longint waddr, input longint wdata, input byte wmask);

module automatic dpic
(
    input wire clk,
    input wire rst;
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

    //cache
    output wire        axi_readAddr_ready,
    input  wire        axi_readAddr_valid,
    input  wire[63:0]  axi_readAddr_bits_addr,
    input  wire[2:0]   axi_readAddr_bits_prot,
    input  wire        axi_readData_ready,
    output wire        axi_readData_valid,
    output wire[127:0] axi_readData_bits_data,
    output wire[1:0]   axi_readData_bits_resp,
    output wire        axi_writeAddr_ready,
    input  wire        axi_writeAddr_valid,
    input  wire[63:0]  axi_writeAddr_bits_addr,
    input  wire[2:0]   axi_writeAddr_bits_prot,
    output wire        axi_writeData_ready,
    input  wire        axi_writeData_valid,
    input  wire[127:0] axi_writeData_bits_data,
    input  wire[15:0]  axi_writeData_bits_strb,
    input  wire        axi_writeResp_ready,
    output wire        axi_writeResp_valid,
    output wire[1:0]   axi_writeResp_bits
    
    /*
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
    */
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

//we are setting 3 cycles of mem delay
  reg [63:0] mem_bufl;
  reg [63:0] mem_bufh;

  reg[2:0] state;//idle,readaddr,writeaddr,writedata,
  always @(posedge clk) begin
    if(rst) begin
      state <= 0;
    end 
    else begin
      case(state)
        3'b0:
          begin
            if(axi_readAddr_valid) begin
              state <= 1;
            end
            else if(axi_readData_ready) begin
              state <=2;
            end else begin
              state <=0;
            end
          end
        3'b1:begin
            if(axi_readData_ready) begin
              state <= 0;
            end else begin
              state <=1;
            end
        end
        3'b2:begin
            if(axi_writeData_valid) begin
              state <=3;
            end else begin
              state <=2;
            end
        end
        3'b3: begin
          if(axi_writeResp_ready) begin
              state<=0;
            end else begin
              state<=3;
            end
        end
      endcase
  end
  end

  assign  output wire        axi_readAddr_ready  = state == 0? 1, 0;
  assign  output wire        axi_readData_valid  = state == 1? 1, 0;
  assign  output wire[127:0] axi_readData_bits_data = state == 1? (mem_bufh,mem_bufl), 0;
  assign  output wire[1:0]   axi_readData_bits_resp = state == 0;
  assign  output wire        axi_writeAddr_ready = state == 0? 1, 0;
  assign  output wire        axi_writeData_ready = state == 2? 1, 0;
  assign  output wire        axi_writeResp_valid = state == 3? 1, 0;
  assign  output wire[1:0]   axi_writeResp_bits  = state == 0;

  always @(posedge clk) begin
    if(state == 1) begin
      pmem_read_dpi(Maddr, mem_bufl);
      pmem_read_dpi(Maddr+8, mem_bufh);
    end
    if(state == 3) begin
      pmem_write_dpi(Maddr, axi_writeData_bits_data[63:0],axi_writeData_bits_strb[7:0]);
      pmem_write_dpi(Maddr+8, axi_writeData_bits_data[127:64],axi_writeData_bits_strb[15:8]);
    end
    end
endmodule
