/****************************************************************************
 *                                                                          *
 *  UNIVERSIDADE FEDERAL DE ITAJUBA 1S/2017 - EM604                  		 *
 *                                                                          *
 *  Function: Multiplier System			                                  *
 *                                                                          *
 *  Written by: Leonardo Gonçalves                                          *
 *                                                                          *
 *  Last modified: April 15, 2017                                           *
 *                                                                          *
 ****************************************************************************/
 
 
 module multiplier (A, B, loadA, loadB, clk, rst, S);
 
 input wire loadA, loadB, clk, rst;
 input wire [7:0] A, B;
 output reg [15:0] S;
 
 reg [15:0] regA;
 reg [7:0] regB;
 //reg [15:0] S;
 integer count;
 
 initial
 begin
	//if(loadA == 1'b1 && loadB == 1'b1)
		//begin
			S <= 0;
			count <= 8;
			regA <= { 8'b00000000, A };
			regB <= B;
		//end
 end
 
 always @( posedge clk ) 
 begin
	if (rst == 1'b1)
		begin
			S <= 0;
		end
	if (count) 
		begin	
			if(regB[0] == 1'b1 )
				begin
					S <= S + regA;
				end 
		end	
 end
 
 always @( negedge clk ) 
 begin
 	if (rst == 1'b1)
		begin
			if(loadA == 1'b1 && loadB == 1'b1)
			begin
				count = 8;
				regA <= { 8'b00000000, A };
				regB <= B;
			end
		end
	if (count) 
		begin	
			regB <= (regB >> 1);
			regA <= (regA << 1);
		end
	count = (count - 1);
 end
	
 //assign S = S;	
 
 endmodule
 