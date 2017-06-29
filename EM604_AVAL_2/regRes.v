module regRes(  quoc, rest, fim, quociente_final, resto_final);

input fim;
input [7:0] quoc;
input [8:0] rest;

output reg [7:0] quociente_final;
output reg [8:0] resto_final;

always @ (fim)
begin

	if (fim)
		 
			if(fim == 1'b1)
		begin
			quociente_final <= quoc;
			resto_final <= rest;
		end
end
endmodule	

	