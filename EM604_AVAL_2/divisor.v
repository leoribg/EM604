module divisor (clk, rst, quotient, remainder, ini_div, divEnd, state, signalOut, A, B, enA, enB);
input enA, enB;
input  rst, clk, ini_div;
input [7:0] A, B; 

output [8:0] remainder;  
output [7:0] quotient;
output [2:0] state ;
output divEnd, signalOut; 

wire [8:0] pOut, bOut, sumOut;
wire [7:0] Out_A, Out_B;
wire loadA, loadB, loadP, enableA, enableB, enableP, shift, CtrlS, c_outP, c_outA;

assign remainder = pOut;
	 
	divisorSM DSM(ini_div, clk, pOut[8], loadA, loadB, loadP, enableA, enableB, enableP, shift, divEnd, CtrlS, state);
	regA		RA(Out_A, ~c_outP, shift, clk, rst, loadA, enableA, quotient, c_outA);
	regP		RP(sumOut, shift, clk, rst, loadP, enableP, c_outA, c_outP, pOut);
	regB		RB(Out_B, clk, rst, loadB, enableB, bOut);
	RegAB 	RAB(clk, rst, A, B, enA, enB, signalOut, Out_A, Out_B);
	AddSub	AS(pOut, bOut, CtrlS, sumOut);

 endmodule 