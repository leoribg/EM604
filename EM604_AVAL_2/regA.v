module regA (inputA, c_in, shift, clk, rst, load, enable, outA, c_out);

input [7:0] inputA;
input clk, rst, load, enable, shift;
input c_in;

output [7:0] outA;
output c_out;

reg[7:0] out;
 

assign outA = out;
assign c_out = out[7];

always @(posedge clk or posedge rst)

	if(rst == 1'b1)	
		out <= 8'b0000_0000;
	
	else	if(enable == 1'b1)
		
				if(load == 1'b1) 
					out <= inputA;
					
				else	if( shift == 1'b1)
						out <= out<<1;
				else
							out <= {out[7:1], c_in};
endmodule
