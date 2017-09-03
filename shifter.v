module shifter(in,shift,out);
  input [15:0] in;
  input [1:0] shift;
  reg temp;
  output reg [15:0] out;

  always @(*) begin
    if (shift == 2'b0)
      out = in;
    else if (shift == 2'b01)
       out = in << 1;
    else if (shift == 2'b10)
       out = in >> 1;
    else if (shift == 2'b11) begin
       temp = in[15];
       out = in >> 1;
       out[15] = temp;
    end   
    else
       out = in;  
  end

endmodule
