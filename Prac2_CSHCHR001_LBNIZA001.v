//--------------------------------------------------------
// Design name : ALU
// Authors     : CSHCHR001, LBNIZA001
// Function    : Emulate an VS-ALU
//--------------------------------------------------------

module alu (clk, A, B, opcode, acc, res)
    input clk;
    input [3:0] opcode;
    input [7:0] A,B;
    output[7:0] res;
    reg [7:0] acc;

endmodule