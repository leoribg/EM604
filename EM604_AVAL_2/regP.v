module regP (inputP, desloc, clk, rst, load, enable, c_in, c_out ,outP);

input [8:0]inputP;
input clk, rst, load, enable, c_in, desloc;

output [8:0]outP;
output c_out;
reg [8:0] out;

assign outP = out;
assign c_out = out[8];

always @ (posedge clk or posedge rst)
begin 
	if(rst == 1'b1) 
		out <= 9'b000000000;
		
	else if(enable == 1'b1)
		if(load == 1'b1)
			out <= inputP;
			
		else if(desloc == 1'b1)
			out <= {out[7:0], c_in};
end

endmodule
				
				
