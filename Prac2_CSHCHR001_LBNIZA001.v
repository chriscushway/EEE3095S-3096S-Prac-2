//--------------------------------------------------------
// Design name : ALU
// Authors     : CSHCHR001, LBNIZA001
// Function    : Emulate an VS-ALU
//--------------------------------------------------------

module ALU(clk,A,B,opcode,ALU_Out);
    input clk;
    input [3:0] opcode;
    input [7:0] A,B; 
    output reg[7:0] ALU_Out;
    reg [7:0] acc = 8'b00000000; //initialise reg to 0

    always@(posedge clk) 
        begin
            case(opcode)
                4'b0000: //ADD
                    acc = A + B;                   
                4'b0001: //SUB
                    acc = A - B;
                4'b0010: //MUL
                    acc = A * B;
                4'b0011: //DIV
                    acc = A / B;
                4'b0100: //ADDA
                    acc = acc + A;
                4'b0101: //MULA
                    acc = acc * A;
                4'b0110: //MAC
                    acc = acc + (A * B);
                4'b0111: //ROL
                    acc = A << 1;
                4'b1000: //ROR
                    acc = A >> 1;
                4'b1001: //AND
                    acc = A & B;
                4'b1010: //OR
                    acc = A | B;
                4'b1011: //XOR
                    acc = A ^ B;
                4'b1100: //NAND
                    acc = ! (A & B); 
                4'b1101: //ETH
                    if (A == B) begin 
                        acc = 8'hFF;
                    end else begin
                        acc = 0;
                    end
                4'b1110: //GTH
                    if (A > B) begin 
                        acc = 8'hFF;
                    end else begin
                        acc = 0;
                    end
                4'b1111: //LTH
                    if (A < B) begin 
                        acc = 8'hFF;
                    end else begin
                        acc = 0;
                    end        
                default: //do addition on default
                    acc = A + B;
            endcase
            ALU_Out <= acc;        
        end
endmodule