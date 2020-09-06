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
        
        $dumpfile("dump.vcd");
        $dumpvars;
        $display("+-----+----------+----------+--------+----------+");
        $display("| clk |  A       |    B     | opcode | ALU_Out  |");
        $display("+-----+----------+----------+--------+----------+");
        $monitor("|  %b | %b  | %b  | %b  | %b |", clk, A, B, opcode, ALU_Out);

        // Initialise state of ports 

        clk = 1'b0;       //initially set clock to low
        A = 8'b00000001;
        B = 8'b00000001;

        // Test for ADD operation
        opcode = 4'b0000; // Set opcode to value for ADD operation
        #10
        A = 8'b00001010;
        B = 8'b00000101;
        #10

        // Test for SUB
        opcode = 4'b0001; //Set opcode to value for SUB operation
        #10
        A = 8'b11111111;
        B = 8'b11111111;
        #10
        A = 8'b00000000;
        B = 8'b00000001; //Test overflow
        #10

        // Test MUL
        opcode = 4'b0001; //Set opcode to value for MUL operation
        $finish;
    end

    always 
        #5 clk = !clk;
endmodule