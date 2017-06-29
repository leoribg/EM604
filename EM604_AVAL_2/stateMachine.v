module stateMachine (rst, clk, signalOut, enA, enB, ini_div, addressA, addressB, addressBus);

input rst, clk, signalOut;
input [8:0] addressA, addressB;

output reg [8:0] addressBus ;
output reg  enA, enB, ini_div;
reg [2:0] state;
 
reg	[2:0] now, next;
reg	[8:0] aAddress, bAddress;
reg	okA, okB;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011,  S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;

always @ (negedge clk, posedge rst) // rst state
	if (rst)
			now <= S0;
	else	
			now	<=	next;	 
			

always @ (*) //handle state changes
begin
	case (now)
		S0:	next	<=	S1;
		
		S1:	next	<=	S2;
	
		S2:		if (okA)	next	<=	S3;
					else		next	<=	S2;
		
		S3:		next	<=	S4;
		
		S4:		if(okB)	next	<=	S5;
					else		next	<=	S4;
		
		S5:	if (!signalOut)	next	<=	S0;
					else			next	<=	S6;
		
		S6:	next	<=	S6;
		
		default	next	<=	S0;
	endcase
end


always @ (now)
begin 
	case (now)
		S0:	
			begin
				ini_div	<=	1'b0;
				enA		<=	1'b0;
				enB		<=	1'b0;
				okA		<=	1'b0;
				okB		<=	1'b0;
				aAddress		<=	addressA;
				bAddress		<=	addressB;
				state <= S0;
			end
		//read Addresses
		S1:
			begin	
				ini_div	<=	1'b0;
				enA		<=	1'b0;
				enB		<=	1'b0;
				addressBus	<=	aAddress;
				okA		<=	1'b0;
				okB		<=	1'b0;
				state <= S1;
			end
		//send a to ROM
		S2:
			begin
				ini_div	<=	1'b0;
				enA		<=	1'b1;
				enB		<=	1'b0;
				okA		<=	1'b1;
				okB		<=	1'b0;
				state <= S2;
			end
		//store a value
		S3:
			begin
				ini_div	<=	1'b0;
				enA		<=	1'b0;
				enB		<=	1'b0;
				addressBus	<= bAddress;
				okA		<=	1'b1;
				okB		<=	1'b0;
				state <= S3;
			end
		 //send b to ROM
		S4:
			begin
				ini_div	<=	1'b0;
				enA		<=	1'b0;
				enB		<=	1'b1;
				okA		<=	1'b1;
				okB		<=	1'b1;
				state <= S4;
			end
		//store b value
		S5:	
			begin
				ini_div	<=	1'b0;
				enA		<=	1'b0;
				enB		<=	1'b0;
				okA		<=	1'b1;
				okB		<=	1'b1;
				state <= S5;
			end
		//check data in previous always
		S6:	
			begin
				ini_div	<=	1'b1;
				enA		<=	1'b0;
				enB		<=	1'b0;
				okA		<=	1'b0;
				okB		<=	1'b0;
				state <= S6;
			end
		//start division
	endcase
end
		
endmodule 
			
				
		
		
	 	 



 

