`ifndef __SUB__
`define __SUB__

`include "adder.v"
`include "twosComplement.v"

module subtractor
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] minuend, //dIn0 will be the minuend.
  input   [NUM_SIZE - 1:0] subtrahend, //dIn1 will be the subtrahend.

  output  overflow,
  output  [NUM_SIZE - 1:0] difference
);

  wire [NUM_SIZE - 1:0] twosComp;

  twosComplement #(.NUM_SIZE(NUM_SIZE)) twosCompNegative(.dIn(subtrahend), .twosComp(twosComp));

  adder #(.NUM_SIZE(NUM_SIZE)) subtraction(.dIn0(minuend), .dIn1(twosComp), .overflow(overflow), .sum(difference));

endmodule

`endif
