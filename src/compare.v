`ifndef __COMP__
`define __COMP__

`include "subtractor.v"

module compare 
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] leftOperand, //leftOperand is right side of comparison
  input   [NUM_SIZE - 1:0] rightOperand, //rightOperand is left side of comparison

  output  equal,
  output  greaterThan,
  output  lessThan
);

  wire ignore;

  wire [NUM_SIZE:0] sub;

  subtractor #(.NUM_SIZE(NUM_SIZE + 1)) comparison(.minuend({leftOperand[NUM_SIZE - 1], leftOperand}), .subtrahend({rightOperand[NUM_SIZE - 1], rightOperand}), .overflow(ignore), .difference(sub));
  assign equal = ~(|sub);
  assign greaterThan = (~sub[NUM_SIZE]) & (~equal);
  assign lessThan = sub[NUM_SIZE];

endmodule

`endif
