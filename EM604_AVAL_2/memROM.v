module memROM (control, address, readEn, out);

input control, readEn;
input [8:0] address;
output reg [7:0] out;
reg [7:0] pos [0:511];
reg [8:0] index; 

initial begin 
	pos [9'd0] = 8'b00011011;// 27
	pos [9'd1] = 8'b00000101;// 5
	pos [9'd2] = 8'b000100001;// 33
	pos [9'd3] = 8'b00000011;// 3
	
	index = 9'd4;
	while( index < 9'd512)
		begin
			pos[index] = 8'b11111111;
			index = index + 9'd1;
		end
end

always @(posedge control)
begin
	if ( readEn == 1)
		out <= pos[address];
end
endmodule
	
 
	
 