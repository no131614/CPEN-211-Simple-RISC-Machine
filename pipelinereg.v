module pipelinereg(in,load,clk,out);
	input [15:0] in;
	input load,clk;
	output reg [15:0] out;
	wire [15:0] mxout,dffout;
	reg [15:0] dffin,mxin;

	MuxPLR #(16) Mux(mxin,in,load,mxout);
	vDFF2 #(16) DFF(clk,dffin,dffout);
	
	
	always@(*)begin
		dffin = mxout;
		mxin = dffout;
		out = dffout;
	end
endmodule


module vDFF2(clk, in, out) ;
	parameter n=1;
	input clk;
	input [n-1:0] in;
	output [n-1:0] out;
	reg [n-1:0] out;
	
	always @(posedge clk)
		out = in;
endmodule

module MuxPLR(in0,in1,load,out);
  	parameter k=1;
	input [k-1:0] in0,in1;
	input load;
	output reg[k-1:0] out;
	

	always @(*) begin
		case(load)
		 1'b0: out = in0;
		 1'b1: out = in1;
		 default: out = {k{1'bx}};
		endcase
	end
endmodule

module pipelinereg_status(in,load,clk,out);
	input in;
	input load,clk;
	output reg out;
	wire mxout,dffout;
	reg dffin,mxin;

	MuxPLR #(1) Mux(mxin,in,load,mxout);
	vDFF2 #(1) DFF(clk,dffin,dffout);
	
	
	always@(*)begin
		dffin = mxout;
		mxin = dffout;
		out = dffout;
	end
endmodule

	