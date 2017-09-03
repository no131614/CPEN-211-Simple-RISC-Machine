module datapath_tb;
 
	reg [2:0] readnum,writenum;
	reg clk,vsel,loada,loadb,asel,bsel,loadc,loads,write;
	reg [1:0] shift,ALUop;
	reg [15:0] datapath_in;
	wire status;
	wire [15:0] datapath_out;
	
	datapath dut(clk,readnum,vsel,loada,loadb,shift,asel,bsel,ALUop,loadc,loads,writenum,write,datapath_in,status,datapath_out);
	initial begin
	clk = 1'b0; #5
	forever begin
		clk = 1'b1; #5;
		clk = 1'b0; #5;
		end
	end

	initial begin
		
		
		datapath_in = 16'b111;
		vsel = 1'b1;
		writenum = 3'b0;  
		readnum = 3'b0; 
		write = 1'b1;
		loadb = 1'b1; #20;
		loadb = 1'b0;
		datapath_in = 16'b10;
		writenum = 3'b1;
		readnum = 3'b1;
		write = 1'b1;
		loada = 1'b1; #20;
		loada = 1'b0;
		ALUop = 2'b0;
		asel = 1'b0; 
		bsel = 1'b0; 
		shift = 2'b01; 
		vsel = 1'b1; 
		loads = 1'b1;
		//status = 1'b1; 
		loadc = 1'b1; #20;
		loadc = 1'b0;
		vsel = 1'b0;
		write = 1'b1;
		writenum = 3'b010; 

	#20 $display("%b %b", datapath_out, status);
	$stop;

	end
	





endmodule
