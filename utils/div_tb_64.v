
`timescale 1ns / 1ps
//此tb为《CPU设计实战》实验tb
module div_tb;

	// Inputs
	reg div_clk;
	reg resetn;
	wire div;
	reg div_signed;
	reg [63:0] x;
	reg [63:0] y;

	// Outputs
	wire [63:0] s;
	wire [63:0] r;
	wire complete;
	wire in_ready;

	// Instantiate the Unit Under Test (UUT)
	Divider uut (
		.clock(div_clk), 
		.reset(!resetn), 
  		.io_i_dividend(x),
  		.io_i_divisor(y),
  		.io_i_div_valid(1'b1),
  		.io_i_divw(1'b0),
  		.io_i_div_signed(div_signed),
  		.io_i_flush(1'b0),
  		.io_o_out_ready(in_ready),
  		.io_o_out_valid(complete),
  		.io_o_quotient(s),
  		.io_o_remainder(r)
	);

	initial begin
		// Initialize Inputs
		resetn = 0;
      #100;
		resetn = 1;
	end
initial
begin
    div_clk = 1'b0;
    forever
    begin
	     #5 div_clk = 1'b1;
	     #5 div_clk = 1'b0;
	 end
end	

//产生除法命令，正在进行除法
reg div_is_run;
integer wait_clk;
initial
begin
    div_is_run <= 1'b0;
    forever
    begin
	     @(posedge div_clk);
        if (!resetn || complete)
	     begin
	         div_is_run <= 1'b0;
		      wait_clk <= {$random}%4;
	     end
	     else
	     begin
	         repeat (wait_clk)@(posedge div_clk);
	         div_is_run <= 1'b1;
				wait_clk <= 0;
	     end
    end
end
////随机生成有符号乘法控制信号和乘数
assign div = div_is_run;
always @(posedge div_clk)
begin
    if (!resetn || complete)
    begin
		  div_signed <= {$random}%2; 
		  x[31:0]          <= $random; 
		  x[63:32]          <= $random; 
		  y[31:0]          <= $random;  ////被除数随机产生 0 的概率很小，基本可忽略
		  y[63:32]          <= $random;  ////被除数随机产生 0 的概率很小，基本可忽略
    end
    //else if (!div_is_run)
    else if (complete)
	 begin
		  div_signed <= {$random}%2; 
		  x[31:0]          <= $random; 
		  x[63:32]          <= $random; 
		  y[31:0]          <= $random;  ////被除数随机产生 0 的概率很小，基本可忽略
		  y[63:32]          <= $random;  ////被除数随机产生 0 的概率很小，基本可忽略
	 end
end

//-----{计算参考结果}begin
//第一步，求 x 和 y 的绝对值，并判断商和余数的符号
wire x_signed = x[63] & div_signed;               //x 的符号位，做无符号时认为是 0
wire y_signed = y[63] & div_signed;               //y 的符号位，做无符号时认为是 0
wire [63:0] x_abs;
wire [63:0] y_abs;
assign x_abs = ({64{x_signed}}^x) + x_signed;     //此处异或运算必须加括号
assign y_abs = ({64{y_signed}}^y) + y_signed;     //因为 verilog 中+的优先级更高
wire s_ref_signed = (x[63]^y[63]) & div_signed;   //运算结果商的符号位，做无符号时认为是 0
wire r_ref_signed = x[63] & div_signed;           //运算结果余数的符号位，做无符号时认为是 0

//第二步，求得商和余数的绝对值
reg [63:0] s_ref_abs;
reg [63:0] r_ref_abs;
always @(div_clk)
begin
    s_ref_abs <= x_abs/y_abs;
    r_ref_abs <= x_abs-s_ref_abs*y_abs; 
end

//第三步，依据商和余数的符号位调整
wire [63:0] s_ref;
wire [63:0] r_ref;
///此处异或运算必须加括号，因为 verilog 中+的优先级更高
assign s_ref = ({64{s_ref_signed}}^s_ref_abs) + s_ref_signed;//??? 
assign r_ref = ({64{r_ref_signed}}^r_ref_abs) + r_ref_signed;
//-----{计算参考结果}end
//判断结果是否正确
wire s_ok;
wire r_ok;
assign s_ok = s_ref==s;
assign r_ok = r_ref==r;
reg [6:0] time_out;

////输出结果,将各 32 位(不论是有符号还是无符号数)扩展成 33 位有符号数，以便以 16 进制形式打印
wire signed [64:0] x_d     = {div_signed&x[63],x};
wire signed [64:0] y_d     = {div_signed&y[63],y};
wire signed [64:0] s_d     = {div_signed&s[63],s};
wire signed [64:0] r_d     = {div_signed&r[63],r};
wire signed [64:0] s_ref_d = {div_signed&s_ref[63],s_ref};
wire signed [64:0] r_ref_d = {div_signed&r_ref[63],r_ref};
always @(posedge div_clk)
begin
    if (complete && div) //除法完成
    begin
	     if (s_ok && r_ok)
		  begin
		      $display("[time@%t]: x=%x, y=%x, signed=%x, s=%x, r=%x, s_OK=%b, r_OK=%b",
                      $time,x_d,y_d,div_signed,s_d,r_d,s_ok,r_ok);
		  end
		  else 
		  if (~(s_ok && r_ok))
		  begin
		      $display("[time@%t]Error: x=%x, y=%x, signed=%x, s=%x, r=%x, s_ref=%x, r_ref=%x, s_OK=%b, r_OK=%b",
                      $time,x_d,y_d,div_signed,s_d,r_d,s_ref_d,r_ref_d,s_ok,r_ok);
	         $finish;
		  end
    end
end
always @(posedge div_clk)
begin
    if (!resetn || !div_is_run || complete)
	 begin
	     time_out <= 6'd0;
	 end
    else
    begin
	     time_out <= time_out + 1'b1;
    end
end
always @(posedge div_clk)
begin	    
    if (time_out == 7'd66)
	 begin
		  $display("Error: div no end in 65 clk!");
		  $finish;
	 end
end
 
endmodule
