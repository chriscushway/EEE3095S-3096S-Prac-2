//--------------------------------------------------------
// Design name : ALU
// Authors     : CSHCHR001, LBNIZA001
// Function    : Emulate an VS-ALU
//--------------------------------------------------------

module ALU(clk,A,B,opcode,acc,ALU_Out);
    input clk;
    input [3:0] opcode;
    input [7:0] A,B;
    output reg[7:0] ALU_Out,acc;
    // reg [7:0] acc;

    always@(posedge clk) 
        begin
            case(opcode)
                4'b0000: //ADD
                    acc = A + B;                   
                // 4'b0001: //SUB
                //     //do logic here
                // 4'b0010: //MUL
                //     //multiply here
                // 4'b0011: //DIV
                //     //do logic here
                // 4'b0100: //ADDA
                //     //do logic here
                // 4'b0101: //MULA
                //     //do logic here
                // 4'b0110: //MAC
                //     //do logic here
                // 4'b0111: //ROL
                //     //do logic here
                // 4'b1000: //ROR
                //     //do logic here
                // 4'b1001: //AND
                //     //do logic here
                // 4'b1010: //OR
                //     //do logic here
                // 4'b1011: //XOR
                //     //do logic here
                // 4'b1100: //NAND
                //     //do logic here
                // 4'b1101: //ETH
                //     //do logic here
                // 4'b1110: //GTH
                //     //do logic here
                // 4'b1111: //LTH
                //     //do logic here         
                // default: //do addition on default
            endcase
            ALU_Out <= acc;        
        end
endmodule