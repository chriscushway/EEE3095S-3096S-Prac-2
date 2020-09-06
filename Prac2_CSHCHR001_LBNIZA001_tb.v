module ALU_tb();

    reg clk;
    reg[3:0] opcode;
    reg [7:0] A,B, acc;
    wire [7:0] ALU_Out;

    ALU ut(
        .clk(clk),
        .A(A),
        .B(B),
        .opcode(opcode),
        .ALU_Out(ALU_Out)
        );

    initial begin 
        $display("clk A B acc opcode ALU_Out");
        $monitor("%b %b %b %b %b %b", clk, A, B, opcode, ALU_Out);
        $dumpfile("dump.vcd");
        $dumpvars;

        acc = ALU_Out;
        clk = 1'b1; //initially set clock to high
        A = 8'b00000001;
        B = 8'b00000001;
        opcode = 4'b0000; // Set opcode to value for ADD operation
       
        
        #5 clk = !clk;
        #5 clk = !clk;
        #5 clk = !clk;
        #5 clk = !clk;

    end
endmodule