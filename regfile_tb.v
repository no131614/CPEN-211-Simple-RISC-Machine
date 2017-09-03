module regfile_dut;
 
 reg clk, write;
 reg [15:0] data_in; 
 wire [15:0] data_out;
 reg [2:0] writenum, readnum;

 
 regfile dut(writenum,write,data_in,clk,readnum,data_out);

	initial begin
	clk = 1'b0; #5
	forever begin
		clk = 1'b1; #5;
		clk = 1'b0; #5;
		end
	end

 initial begin 
    
   
    data_in = 16'b0000000000101010; //represents 42 in binary 
    writenum = 3'b010; //write the value to R2
    readnum = 3'b010; //reads the value in R2
    write = 1'b1; #20; //write the value
    
    data_in = 16'b0000000000000001; //represents 1 in binary
    write = 1'b0; #20; //do not write the value
   
    data_in = 16'b0000000111111111;
    writenum = 3'b001; //write the value to R1
    readnum = 3'b001; //reads the value in R1
    write = 1'b1; #20; // write the value
    
    $stop;
   end

endmodule
