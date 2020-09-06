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

        clk = 1'b0;      //initially set clock to low
        A = 8'b00000001; //set A and B as equal values
        B = 8'b00000001;
      
        // Test for LTH operation
        opcode = 4'b0110; // Set opcode to value for LTH operation
        #10
        A = 8'b00001010; //case where A > B
        B = 8'b00000101;
        #10
        A = 8'b00000010; //case where B > A
        B = 8'b00011001;
        #10
        A = 8'b00000010; //case where B > A
        B = A;
        #10

        $finish;
    end

    always 
        #5 clk = !clk;
endmodule