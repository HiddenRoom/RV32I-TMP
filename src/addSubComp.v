`ifndef __ADDSUBCOMP__
`define __ADDSUBCOMP__

`include "adder.v"
`include "twosComplement.v"

module addSubComp
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] dIn0, //in case of sub dIn0 will be the minuend. dIn0 is right side of comparison
  input   [NUM_SIZE - 1:0] dIn1, //in case of sub dIn1 will be the subtrahend. dIn1 is left side of comparison

  output  overflowAdd,
  output  overflowSub,
  output  [NUM_SIZE - 1:0] add,
  output  [NUM_SIZE - 1:0] sub,
  output  equal,
  output  greaterThan,
  output  lessThan
);

  wire [NUM_SIZE - 1:0] twosComp;

  twosComplement #(.NUM_SIZE(NUM_SIZE)) twosCompNegative(.dIn(dIn1), .twosComp(twosComp));

  adder #(.NUM_SIZE(NUM_SIZE)) addition(.dIn0(dIn0), .dIn1(dIn1), .overflow(overflowAdd), .dOut(add));
  adder #(.NUM_SIZE(NUM_SIZE)) subtraction(.dIn0(dIn0), .dIn1(twosComp), .overflow(overflowSub), .dOut(sub));

  assign equal = ~(|sub);
  assign greaterThan = (~sub[NUM_SIZE - 1]) & (~equal) & (~overflowAdd) | (overflowSub);
  assign lessThan = sub[NUM_SIZE - 1] & (~overflowSub) | (overflowAdd);

endmodule

`endif
