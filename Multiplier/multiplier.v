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
 
 
module multiplier
(

	input wire [7:0] A,B,
	input wire reset,clock, 
	
	output wire [15:0] S
);	
	
	
	reg [15:0] reg_S;
	reg [15:0] reg_A;
	reg [7:0] reg_B;
	
	reg [4:0] counter; 
	
	
	initial begin
	
		reg_S = 0;
	   counter = 8;
		reg_A = { 8'b00000000, A };
		reg_B = B;
	
	end
	
	
	always @( posedge clock) begin

		if(reset == 1'b1) begin
		  
		  reg_S = 0;
		  
		end
		
		else begin
			if (counter) begin	
				if(reg_B[0] == 1'b1 )begin
					reg_S <= reg_S + reg_A;
					
				end 
		   end
			
			
	   end	
   end	

  always @( negedge clock ) begin
		
		if(reset == 1'b1) begin
		  counter = 8;
		  reg_A = { 8'b00000000, A };
		  reg_B = B;
		end
		else begin 
			if (counter) begin	
				reg_B <= (reg_B >> 1);
				reg_A <= (reg_A << 1);
			end
			counter = (counter - 1);
		end
  end
  
  assign S = reg_S;	 

endmodule
