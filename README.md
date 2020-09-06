# EEE3095S-3096S-Prac-2
This is the codebase for the second EEE3095S/3096S practical

### Prerequisites for compiling and running 
* Must have a verilog compiler such as iverilog installed

### How to compile and run

To compile the code use
```iverilog -Wall -o main Prac2_CSHCHR001_LBNIZA001.v Prac2_CSHCHR001_LBNIZA001_tb.v```

To run the code use 
```vvp main```

If you intend to see the output signals and value of ports it is recommended to use GTKWave, however, you can use [EDA playground](https://edaplayground.com/) to achieve this as well by copying the test bench code and the module code into the appropriate text boxes.

If you have GTKWave installed you can use the command 

```gtkwave <myDumpFile.vcd>```

where ```<myDumpfile.vcd>``` should be replaced with the dumpfile listed in the testbench code.
