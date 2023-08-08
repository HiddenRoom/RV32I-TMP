`ifndef __COMP__
`define __COMP__

`include "subtractor.v"

module compare 
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] dIn0, //dIn0 is right side of comparison
  input   [NUM_SIZE - 1:0] dIn1, //dIn1 is left side of comparison

  output  overflow,

  output  equal,
  output  greaterThan,
  output  lessThan
);

  wire ignore;

  wire [NUM_SIZE - 1:0] sub;

  subtractor #(.NUM_SIZE(NUM_SIZE)) comparison(.dIn0(dIn0), .dIn1(dIn1), .overflow(overflow), .dOut(sub));

  assign equal = ~(|sub);
  assign greaterThan = (~sub[NUM_SIZE - 1]) & (~equal) | (overflowSub);
  assign lessThan = sub[NUM_SIZE - 1];

endmodule

`endif
