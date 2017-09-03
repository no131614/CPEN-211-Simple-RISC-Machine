module ALU(Ain,Bin,ALUop,ALUout,status);

	input [15:0] Ain,Bin;
	input [1:0] ALUop;
	output reg status;
	output reg [15:0] ALUout;

	always@(*)begin
		case(ALUop)
		 2'b00: ALUout = Ain + Bin;
		 2'b01: ALUout = Ain - Bin;
		 2'b10: ALUout = Ain & Bin;
		 2'b11: ALUout =  ~Bin;
		endcase
	end
	
	always@(*)begin
		case(ALUout)
		 16'b0: status = 1'b1;
		 default: status = 1'b0;
		endcase
	end
endmodule
