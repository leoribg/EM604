module regB (inputB, clk, rst, load, enable, outB);

input [7:0] inputB;
input clk, rst, load, enable;

output reg [8:0] outB;

always @( posedge clk or posedge rst)
begin
	if (rst == 1'b1)
		outB <= 8'b0000_0000;
	else
		begin
			if(enable == 1'b1)
				if(load == 1'b1)
					outB <= {1'b0, inputB[7:0]};
		end
end
endmodule
		