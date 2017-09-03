module datapath(clk,readnum,vsel,loada,loadb,shift,asel,bsel,ALUop,loadc,loads,writenum,write,datapath_in,status,datapath_out);
	
	input [2:0] readnum,writenum;
	input clk,vsel,loada,loadb,asel,bsel,loadc,loads,write;
	input [1:0] shift,ALUop;
	input [15:0] datapath_in;
	output status;
	output [15:0] datapath_out;
	
	wire [15:0] data_in, data_out, regA_out, regB_out, shiftB_out, Ain, Bin, ALUout;
	wire state;
	

	sourcemux sMUX(datapath_out,datapath_in,vsel,data_in);
	regfile datapathreg(writenum,write,data_in,clk,readnum,data_out);
	pipelinereg regA(data_out,loada,clk,regA_out);
	pipelinereg regB(data_out,loadb,clk,regB_out);
	shifter shifterB(regB_out,shift,shiftB_out);
	sourcemux muxA(regA_out,16'b0,asel,Ain);
	sourcemux muxB(shiftB_out,{11'b0,datapath_in[4:0]},bsel,Bin);
	ALU datapathALU(Ain,Bin,ALUop,ALUout,state);
	pipelinereg_status statusReg(state,loads,clk,status);
	pipelinereg regC(ALUout,loadc,clk,datapath_out);
	
 endmodule
