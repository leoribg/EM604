
module EM604_divisor_v0
(
	input wire [7:0] A, B,
	input wire clk,rst,ini_div,loadA, loadB,
	output wire [7:0] Q, R, 
	output wire fim_div			
);	
 
reg [7:0] regA, regB;
reg [8:0] regP,Result_reg;
reg Overflow;

integer count = 0;
 
reg state[2:0];
reg nextstate[2:0];

localparam state_inicio[2:0] = 3'b000;
localparam state_desloca[2:0] = 3'b001;
localparam state_subtrai[2:0] = 3'b011;
localparam state_escquoc[2:0] = 3'b010;
localparam state_restaura[2:0] = 3'b110;
localparam state_fim[2:0] = 3'b111;
 
// 
reg nested_state[1:0];
reg next_nested_state[1:0];
 
localparam S0[1:0] = 2'b00; 
localparam S1[1:0] = 2'b01; 
localparam S2[1:0] = 2'b11; 
// 
 
always @(negedge clk or rst) begin
	if (rst) begin
		state <= state_inicio;
		nextstate <=state_inicio;
		next_nested_state = 2'b00;
		Result_reg <= 0;
		regP <= 9'b000000000;
	end
	else begin
		state <= nextstate;
		nested_state = next_nested_state;
	end
end

always @* begin
	case(state)
		//
		state_inicio: begin
			if(ini_div) begin
				regA <= A; // deve ser carregados separadamente....
				regB <= B; //
				count <= 0;
				nextstate <= state_desloca;
			end
		end
		//
		state_desloca: begin
			case(nested_state)
				S0: begin
					regP <= regP << 1;
					next_nested_state = S1;
				end
				S1: begin
					regP [0] <= regA[7];
					next_nested_state = S2;
				end
				S2:begin
					regA <= (regA << 1);
					nextstate = state_subtrai;
				end
			endcase			  
		end
		//	
		state_subtrai: begin
			{Overflow, Result_reg} <= (regP - regB);
			nextstate = state_escquoc;
		  
		end
		//
		state_escquoc: begin
		  
			if (Overflow)begin
				regA[0] <= 1'b0;
				nextstate = state_restaura;
			end
			else begin
				regP <= Result_reg;
				regA[0] <= 1'b1;
				nextstate = state_restaura;
			end
		end		
		//
		state_restaura: begin
			if(count < 7) begin
				nextstate = state_desloca;
				count = count + 1;
			end
			else begin
				nextstate = state_fim;
			end
		end			
		//
		state_fim: begin
		end			
		default: nextstate = state_inicio;
	endcase
end
/* 
always @( posedge clk ) 
 begin
	 if(count)
		 begin
			 count <= count - 1;
			 regP <= regP << 1;
			 regP [0] <= regA[7];
			 regA <= regA << 1;
			 {Overflow, Result_reg} <= regP - regB;
			 if (Overflow)
				 begin
					regA[0] <= 1'b0;
				 end
			 else
				 begin
					regP <= Result_reg;
					regA[0] <= 1'b1;
				 end
		 end
	 else
		 begin
			//count = 8;
			//regP = 9'b000000000;
		 end
 end

assign Q = regA;
assign R = regP;

endmodule

*/





