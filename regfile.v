module RLE(in,load,clk,out);
	input [15:0] in;
	input load,clk;
	output reg [15:0] out;
        wire [15:0] mxout;
	wire [15:0] dffout;
	reg [15:0] dffin;
	reg [15:0] mxin;
          

	  MuxRLE #(16) Mux(mxin,in,load,mxout);
	  vDFF #(16) DFF(clk,dffin,dffout);
	
	  always @(*) begin
	   dffin = mxout;
	   mxin = dffout;
	   out = dffout;
	  end
   	  
endmodule
	
module Dec(a, b);

 parameter n=2 ;
 parameter m=4 ;

 input [n-1:0] a ;
 output [m-1:0] b ;
 
 wire [m-1:0] b = 1<<a ;

endmodule

module MuxRLE(in0,in1,load,out);
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
	
	
//D-Flip Flop Module

module vDFF(clk, in, out) ;
	parameter n=1;
	input clk;
	input [n-1:0] in;
	output [n-1:0] out;
	reg [n-1:0] out;
	
	
	always @(posedge clk)
		out=in;
endmodule

module ANDs(in,write,out);
 input [7:0] in;
 input write;
 output [7:0] out;

 assign out[0] = in[0] & write;
 assign out[1] = in[1] & write;
 assign out[2] = in[2] & write;
 assign out[3] = in[3] & write;
 assign out[4] = in[4] & write;
 assign out[5] = in[5] & write;
 assign out[6] = in[6] & write;
 assign out[7] = in[7] & write;

 
endmodule

module MuxMain(in0,in1,in2,in3,in4,in5,in6,in7,load,out);
  	parameter k=1;
	input [k-1:0] in0,in1,in2,in3,in4,in5,in6,in7;
	input [7:0] load;
	output reg[k-1:0] out;
	

	always @(*) begin
		case(load)
		 8'b00000001: out = in0;
		 8'b00000010: out = in1;
		 8'b00000100: out = in2;
		 8'b00001000: out = in3;
		 8'b00010000: out = in4;
		 8'b00100000: out = in5;
		 8'b01000000: out = in6;
		 8'b10000000: out = in7;
		 default: out = {k{1'bx}};
		endcase
	end
endmodule
	

module regfile(writenum,write,data_in,clk,readnum,data_out);
 
 input [15:0] data_in;
 input [2:0] writenum, readnum;
 input clk, write;
 output [15:0] data_out;
 wire [15:0] RLE_out0, RLE_out1, RLE_out2, RLE_out3, RLE_out4, RLE_out5, RLE_out6, RLE_out7;
 wire [7:0] dec_out0, dec_out1, AND_out;

 Dec #(3,8) dec0(writenum,dec_out0); 
 Dec #(3,8) dec1(readnum,dec_out1);
 ANDs ands(dec_out0,write,AND_out);
 RLE R0(data_in, AND_out[0], clk, RLE_out0);
 RLE R1(data_in, AND_out[1], clk, RLE_out1);
 RLE R2(data_in, AND_out[2], clk, RLE_out2);
 RLE R3(data_in, AND_out[3], clk, RLE_out3);
 RLE R4(data_in, AND_out[4], clk, RLE_out4);
 RLE R5(data_in, AND_out[5], clk, RLE_out5);
 RLE R6(data_in, AND_out[6], clk, RLE_out6);
 RLE R7(data_in, AND_out[7], clk, RLE_out7);
 
 MuxMain #(16) BIGMux(RLE_out0, RLE_out1, RLE_out2, RLE_out3, RLE_out4, RLE_out5, RLE_out6, RLE_out7, dec_out1, data_out);

endmodule




