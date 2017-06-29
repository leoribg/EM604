`timescale 1ns/10ps // escala X resolução;
module project2_TB;
	
	reg tb_clock, tb_reset;
	reg [8:0] tb_in_address_A,tb_in_address_B;

	wire [(8-1):0] tb_out_quocient; 	 
	wire [(8):0] tb_out_remainder;
	wire tb_finished;
	//

	//
	
	// Disponibilizando o DUT(Device-Under-Test):
	project2 DUT(
		.rst(tb_reset),
		.clk(tb_clock), 
		.addressA(tb_in_address_A), 
		.addressB(tb_in_address_B), 
		.quotientFlag(tb_out_quocient), 
		.remainderFlag(tb_out_remainder), 
		.finished(tb_finished)

	);	
		
		
	initial begin
        //Iniciar o clock em 0;
		tb_clock = 1'b0;
		//Endereço das Memórias ROM
		tb_in_address_A = 9'b000000000;
		tb_in_address_B = 9'b000000001;
		
		tb_reset = 1'b1;
        #30  tb_reset = 1'b0;
		#3000;
		$stop; //$finish;
	end
	
	always  begin
		#20 tb_clock = ~tb_clock;
	end
	
endmodule