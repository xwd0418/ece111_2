//1-bit ALU testbench code
`timescale 1ns/1ps
module alu_top_testbench;
parameter N = 4;
logic clock, reset;
logic [N-1:0] operand1, operand2;
logic [N:0] result;
logic [1:0] operation;

// Instantiate design under test
alu_top #(.N(N)) design_instance(
 .clk(clock),
 .reset(reset),
 .operand1(operand1), 
 .operand2(operand2), 
 .operation(operation), 
 .result(result)
);

initial begin
// Initialize Inputs
reset = 1;
clock = 0;
operand1 = 0;
operand2 = 0;
operation = 0;

// Wait 20 ns for global reset to finish and start counter
#20ns;
reset = 0;

#20ns
operand1 = 0;
operand2 = 1;
operation = 0;

#20ns;
operand1 = 1;
operand2 = 1;
operation = 1;

#20ns;
operand1 = 1;
operand2 = 1;
operation = 2;

#20ns;
operand1 = 12;
operand2 = 10;
operation = 3;

#20ns;
operand1 = 7;
operand2 = 4;
operation = 0;

#20ns;
operand1 = 0;
operand2 = 2;
operation = 1;

#20ns;
operand1 = 6;
operand2 = 3;
operation = 2;


#20ns;
operand1 = 11;
operand2 = 2;
operation = 3;


#20ns;
operand1 = 7;
operand2 = 10;
operation = 0;


// Wait for 10ns
#20ns;

// terminate simulation
$stop();
end

// Clock generator logic
always begin
  #10ns clock = 1'b1;
  #10ns clock = 1'b0;  
  $display(" time=%0t,  clk=%b  reset=%b  operation=%d, operand1=%d, operand2=%d, result=%d",$time, clock, reset, operation, operand1, operand2, result );
end

// Print input and output signals
initial begin
 $display(" time=%0t,  clk=%b  reset=%b  operation=%d, operand1=%d, operand2=%d, result=%d",$time, clock, reset, operation, operand1, operand2, result );
end
endmodule