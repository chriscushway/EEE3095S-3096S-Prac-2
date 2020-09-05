module ALU_tb();

    reg clk;
    reg[3:0] opcode;
    reg [7:0] A,B;
    wire [7:0] ALU_Out, acc;

    ALU ut(
        .clk(clk),
        .A(A),
        .B(B),
        .opcode(opcode),
        .acc(acc),
        .ALU_Out(ALU_Out)    
        );

    initial begin 
        $display("clk A B acc opcode ALU_Out");
        $monitor("%b %b %b %b %b %b", clk, A, B, acc, opcode, ALU_Out);
        $dumpfile("dump.vcd");
        $dumpvars;

        clk = 1'b1; //initially set clock
        A = 8'b00000001;
        B = 8'b00000001;
        #5 clk = !clk;
        #5 clk = !clk;
        opcode = 4'b0000;
        repeat(11) begin 
            #5 clk = !clk;
        end
        
    end
endmodule