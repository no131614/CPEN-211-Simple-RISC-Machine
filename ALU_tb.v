module ALU_tb;

	reg [15:0] Ain,Bin;
	reg [1:0] ALUop;
	wire status;
	wire [15:0] ALUout;

	ALU dut(Ain,Bin,ALUop,ALUout,status);

	initial begin
	
	Ain = 16'b0000000000000000; Bin = 16'b0000000000000000; ALUop = 2'b00;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0000000000000000; Bin = 16'b0000000000000000; ALUop = 2'b01;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0000000000000000; Bin = 16'b0000000000000000; ALUop = 2'b10;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0000000000000000; Bin = 16'b0000000000000000; ALUop = 2'b11;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b1111111111111111; Bin = 16'b1111111111111111; ALUop = 2'b00;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b1111111111111111; Bin = 16'b1111111111111111; ALUop = 2'b01;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b1111111111111111; Bin = 16'b1111111111111111; ALUop = 2'b10;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b1111111111111111; Bin = 16'b1111111111111111; ALUop = 2'b11;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0100100010011101; Bin = 16'b0111001100110100; ALUop = 2'b00;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0100100010011101; Bin = 16'b0111001100110100; ALUop = 2'b01;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0100100010011101; Bin = 16'b0111001100110100; ALUop = 2'b10;
	#10 $display("%b %b", ALUout, status);
	
	Ain = 16'b0100100010011101; Bin = 16'b0111001100110100; ALUop = 2'b11;
	#10 $display("%b %b", ALUout, status);
	
	$stop;
	
	end
endmodule

	