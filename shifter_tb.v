module shifter_dut;
 
 reg [15:0] in; 
 wire [15:0] out;
 reg [1:0] shift;

 
 shifter dut(in,shift,out);

 initial begin 
    
    in = 16'b1111000011001111; //First test input value
    shift = 2'b0; #20;
    shift = 2'b01; #20;
    shift = 2'b10; #20;
    shift = 2'b11; #20;
    in = 16'b1111111111111111; //Second test input value
    shift = 2'b0; #20;
    shift = 2'b01; #20;
    shift = 2'b10; #20;
    shift = 2'b11; #20;
    in = 16'b0; //Third test input value
    shift = 2'b0; #20;
    shift = 2'b01; #20;
    shift = 2'b10; #20;
    shift = 2'b11; #20;
    
   end

endmodule
