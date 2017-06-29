module regResp (clk, rst, quoc, rest, fim_div, quocienteFim, restoFim);

input clk, rst, fim_div;
input [7:0] quoc;
input [8:0] rest;

output reg [7:0] quocienteFim;
output reg [8:0] restoFim;

always @ (posedge clk or posedge rst)
begin
	if (rst == 1'b1)
		begin
			quocienteFim <= 8'b0000_0000;
			restoFim <= 9'b000000000;
		end
	else
		if(fim_div)
			begin
				quocienteFim <= quoc;
				restoFim <= rest;
			end
 end
endmodule
