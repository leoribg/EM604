module RegAB (clk, rst, inputA, inputB, enA, enB, signalOut, outA, outB);

input clk, rst, enA, enB;
input	[7:0]inputA, inputB;
 
output [7:0] outA, outB;
output reg signalOut;

reg	[7:0] auxA, auxB;
reg okA, okB;

assign outA = auxA;
assign outB = auxB;

always @ (posedge clk or posedge rst)
begin
	if(rst)
	begin
		auxA <= 8'b0000_0000;
		auxB <= 8'b0000_0000;
	end	
	else if(enA == 1'b1)
		begin
			auxA <= inputA;
			okA = 1'b1;
		end
	else	if(enB == 1'b1)
		begin
			auxB <= inputB;
			okB = 1'b1;
		end
	else
		if(okA & okB)
				signalOut <= 1'b1;
end	
endmodule
 