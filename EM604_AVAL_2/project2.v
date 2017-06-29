module project2 ( rst,clk, addressA, addressB, quotientFlag, remainderFlag, finished);
input rst, clk;
input [8:0]addressA, addressB;
output [7:0]quotientFlag;
output [8:0]remainderFlag;
output finished;

 
wire [7:0] outMem, quoc;
wire [8:0] addressBus, remainder;
wire ini_div, signalOut, enA, enB, divEnd;
assign finished = divEnd;
assign quotientFlag = quoc;
assign remainderFlag = remainder;


memROM				MROM(clk, addressBus, 1, outMem);
stateMachine		SM(rst, clk, signalOut, enA, enB, ini_div, addressA, addressB , addressBus);
divisor				DIV(clk, rst, quoc , remainder, ini_div, divEnd, estado, signalOut, outMem, outMem, enA, enB);

endmodule
