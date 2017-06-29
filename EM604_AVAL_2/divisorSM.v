module divisorSM(ini_div, clk, bitP, loadA, loadB, loadP, enableA, enableB, enableP, shift, divEnd, ctrlS, state);

input clk, bitP, ini_div;
output reg loadA, loadB, loadP, enableA, enableB, enableP, shift, divEnd, ctrlS;
output [2:0]state;



reg [3:0] cont;
reg [2:0] now, next;
			
assign state = now;

parameter  Inicio = 3'b000, Desloca = 3'b001, Subtrai = 3'b010, EsqQuoc = 3'b011, Restaura = 3'b100, Fim = 3'b101 ;

always@ (negedge clk)
begin
case (now)
			Inicio : begin
			cont <= 4'b0000;
			next <= Desloca;
			end
			Desloca: next <= Subtrai;
			Subtrai: next <= EsqQuoc;
			EsqQuoc: next <= Restaura;
			Restaura: if (cont >= 7) 
			begin
				next <= Fim;
			end
			else begin
				 cont <= cont + 1'b1;
				 next <= Desloca;
		   end
			Fim: next <= Fim;
endcase
end

 
always@ (now)
begin
	if(ini_div)
	begin
		now <= next;
	end
	else 
	begin
		now <= Inicio;
	end
end
	
	
always @ (posedge clk)
begin
	case(now)
	
		Inicio: begin
				enableA <= 1'b1; 
				enableB <= 1'b1; 
				enableP <= 1'b0; 
				loadA <= 1'b1; 
				loadB <= 1'b1; 
				loadP <= 1'b0; 
				shift  <= 1'b0; 
				divEnd <= 1'b0;
				ctrlS <= 1'b0;
		end
				
		Desloca:	begin
				
				enableA <= 1'b1; 
				enableB <= 1'b0; 
				enableP <= 1'b1;
				loadA <= 1'b0; 
				loadB <= 1'b0; 
				loadP <= 1'b0; 
				shift  <= 1'b1; 
				divEnd <= 1'b0;
				ctrlS <= 1'b0;
		end
			
		Subtrai: begin
		
				enableA <= 1'b0; 
				enableB <= 1'b0; 
				enableP <= 1'b1;
				loadA <= 1'b0; 
				loadB <= 1'b0; 
				loadP <= 1'b1; 
				shift  <= 1'b0;
				divEnd <= 1'b0;
				ctrlS <= 1'b0;
			end
			
		EsqQuoc:	begin
				enableA <= 1'b1; 
				enableB <= 1'b0; 
				enableP <= 1'b0;
				loadA <= 1'b0; 
				loadB <= 1'b0; 
				loadP <= 1'b0;  
				shift  <= 1'b0;
				divEnd <= 1'b0;
				ctrlS <= 1'b0;
		end
				
		Restaura:	begin
				
				loadA <= 1'b0; 
				loadB <= 1'b0; 
				enableA <= 1'b0; 
				enableB <= 1'b0; 
				enableP <= 1'b1;
				shift  <= 1'b0;
				divEnd <= 1'b0;
				if(bitP == 1'b1)
				begin
					ctrlS <= 1'b1;
					loadP <= 1'b1;
				end	
				else
				begin
					ctrlS <= 1'b0;
					loadP <= 1'b0; 
				end
		end
				
		Fim: 	begin
				loadA <= 1'b0; 
				loadB <= 1'b0; 
				loadP <= 1'b0; 
				enableA <= 1'b0; 
				enableB <= 1'b0; 
				enableP <= 1'b0;
				shift  <= 1'b0;
				divEnd <= 1'b1;
				ctrlS <= 1'b0;
		end
	endcase
end

endmodule

