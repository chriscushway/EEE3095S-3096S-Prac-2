module ALU_tb();

    reg clk;
    reg [3:0] opcode;
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
        opcode = 4'b0010; //Set opcode to value for MUL operation
        #10
        A = 8'b00001000;
        B = 8'b00000001;
        #10
        A = 8'b00001000;
        B = 8'b00000010;
        #10

        // Test DIV
        opcode = 4'b0011; //Set opcode to value for DIV operation
        #10
        A = 8'b00001000;
        B = 8'b00000001;
        #10
        A = 8'b00001000;
        B = 8'b00001000;
        #10

        // Test ADDA
        opcode = 4'b0100; //Set opcode to value for ADDA operation
        ut.acc = 8'b00000010; //set acc to some meaningful value
        #10
        A = 8'b00001010;
        #10
        A = 8'b00010000;
        #10

        // Test MULA
        opcode = 4'b0101; //Set opcode to value for MULA operation
        #10
        A = 8'b00001000; 
        #10
        A = 8'b00000100;
        #10

        // Test MAC
        opcode = 4'b0110; //Set opcode to value for MAC operation
        ut.acc = 8'b00000000; // reset acc value to make results easier to follow
        #10
        A = 8'b00001000;
        B = 8'b00000001;
        #10
        A = 8'b00110100;
        B = 8'b00000010;
        #10
        A = 8'b00000100;
        B = 8'b00001010;
        #10


        // Test 2 for MAC operation
        ut.acc = 8'b00000101;
        #10
        A = 8'b00001010;
        B = 8'b00000101;
        #10
        A = 8'b00100010;
        B = 8'b00011001;
        #10

        // Test ROL
        opcode = 4'b0111; //Set opcode to value for ROL operation
        #10
        A = 8'b10110001; //No need to have a value for B since we only apply operator onto value of A
        #10
        A = 8'b00001000;
        #10
        A = 8'b10000000;
        #10

        // Test ROR
        opcode = 4'b1000; //Set opcode to value for ROR operation
        #10
        A = 8'b10110001; //No need to have a value for B since we only apply operator onto value of A
        #10
        A = 8'b00001000;
        #10
        A = 8'b00000001;
        #10

        // Test AND
        opcode = 4'b1001; //Set opcode to value for AND operation
        #10
        A = 8'b10101010;
        B = 8'b01010101;
        #10
        A = 8'b10101010;
        B = 8'b00001010;
        #10

        // Test OR
        opcode = 4'b1010; //Set opcode to value for OR operation
        #10
        A = 8'b00001000;
        B = 8'b00000001;
        #10
        A = 8'b00001000;
        B = 8'b00000010;
        #10

         // Test XOR
        opcode = 4'b1011; //Set opcode to value for XOR operation
        #10
        A = 8'b00000000;
        B = 8'b00000001;
        #10
        A = 8'b00001000;
        B = 8'b00000010;
        #10
        A = 8'b00001000;
        B = 8'b00001010;
        #10

        // Test NAND
        opcode = 4'b1100; //Set opcode to value for NAND operation
        #10
        A = 8'b00001001;
        B = 8'b00000001;
        #10
        A = 8'b10101010;
        B = 8'b01010101;
        #10

        // Test ETH
        opcode = 4'b1101; //Set opcode to value for ETH operation
        #10
        A = 8'b00001001;
        B = 8'b00001001;
        #10
        A = 8'b10101010;
        B = 8'b01010101;
        #10

        // Test GTH
        opcode = 4'b1110; //Set opcode to value for GTH operation
        #10
        A = 8'b00001001;
        B = 8'b00001001;
        #10
        A = 8'b10101010;
        B = 8'b01010101;
        #10
        A = 8'b00001010;
        B = 8'b01010101;
        #10

        // Test LTH
        opcode = 4'b1111; //Set opcode to value for LTH operation
        #10
        A = 8'b00001001;
        B = 8'b00001001;
        #10
        A = 8'b10101010;
        B = 8'b01010101;
        #10
        A = 8'b00001010;
        B = 8'b01010101;
        #10

        $finish;
    end

    always 
        #5 clk = !clk;
endmodule