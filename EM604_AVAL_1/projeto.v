/****************************************************************************
 *                                                                          *
 *  UNIVERSIDADE FEDERAL DE ITAJUBA 1S/2017 - EM604                  		 *
 *                                                                          *
 *  Function: 74181 Behavior System			                                  *
 *                                                                          *
 *  Written by: Leonardo Gonçalves                                          *
 *                                                                          *
 *  Last modified: April 24, 2017                                            *
 *                                                                          *
 ****************************************************************************/
 
 module projeto(S, A, B, M, CIN_N, F, COUT_N);
 
 input wire [3:0] A, B;
 input wire [2:0] S;
 input wire CIN_N, M;
 output wire [3:0] F;
 output COUT_N;
 wire cout, COUT_N;
 
 projeto2b P1(S, A[1:0], B[1:0], M, CIN_N, F[1:0], cout);
 projeto2b P2(S, A[3:2], B[3:2], M, cout, F[3:2], COUT_N);
 
 endmodule
 
 module projeto2b(S, A, B, M, CIN_N, F, COUT_N);
 
 input wire [1:0] A, B;
 input wire [2:0] S;
 input wire CIN_N, M;
 output reg [1:0] F;
 output reg COUT_N;
 
 always @(S or A or B)
 begin
	if(M)
		begin
			case (S)
				4'b000:
					begin
						F <= ~A;
					end
					
				4'b001:
					begin
						F <= ~(A|B);
					end
					
				4'b010:
					begin
						F <= ~A & B;
					end
					
				4'b011:
					begin
						F <= 2'b00;
					end
					
				4'b100:
					begin
						F <= ~(A&B);
					end
					
				default:
					begin
					end
				
			endcase
		end
	else
		begin
				case (S)
					4'b000:
						begin
							F <= A;
						end
						
					4'b001:
						begin
							{COUT_N,F} = (A + B + CIN_N);
						end
						
					4'b010:
						begin
							{COUT_N,F} = (A + CIN_N + 1); //1st stage
						end
						
					4'b110:
						begin
							{COUT_N,F} = (A + CIN_N); //2nd stage
						end
						
					4'b011:
						begin
							{COUT_N,F} = (B + CIN_N + 1); //1st stage
						end
					
					4'b111:
						begin
							{COUT_N,F} = (B + CIN_N); //2nd stage
						end
						
					4'b100:
						begin
							{COUT_N,F} = (A + B + CIN_N);
						end
						
					default:
						begin
						end
				endcase
		end
	
 end
 endmodule
 