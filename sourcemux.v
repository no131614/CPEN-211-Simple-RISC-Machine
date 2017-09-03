module sourcemux(muxin0,muxin1,select,muxout);
	parameter k=1;
	input[15:0] muxin0,muxin1;
	input select;
	output reg [15:0] muxout;
	

	always @(*) begin
		case(select)
		 1'b0: muxout = muxin0;
		 1'b1: muxout = muxin1;
		 default: muxout = {k{1'bx}};
		endcase
	end
endmodule
	
