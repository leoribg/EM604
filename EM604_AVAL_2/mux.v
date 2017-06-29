module AddSub (inputP, inputB, ctrlS, out);
input [8:0] inputB, inputP;
input ctrlS;

output [8:0] out;
assign out = (ctrlS == 1'b1) ? inputP + inputB : inputP - inputB;

endmodule

