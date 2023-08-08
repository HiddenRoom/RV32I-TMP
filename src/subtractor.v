`ifndef __SUB__
`define __SUB__

`include "adder.v"
`include "twosComplement.v"

module subtractor
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] dIn0, //dIn0 will be the minuend.
  input   [NUM_SIZE - 1:0] dIn1, //dIn1 will be the subtrahend.

  output  overflow,
  output  [NUM_SIZE - 1:0] dOut
);

  wire [NUM_SIZE - 1:0] twosComp;

  twosComplement #(.NUM_SIZE(NUM_SIZE)) twosCompNegative(.dIn(dIn1), .twosComp(twosComp));

  adder #(.NUM_SIZE(NUM_SIZE)) subtraction(.dIn0(dIn0), .dIn1(twosComp), .overflow(overflow), .dOut(dOut));

endmodule

`endif
