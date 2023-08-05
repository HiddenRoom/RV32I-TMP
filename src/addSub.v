`ifndef __ADDSUB__
`define __ADDSUB__

`include "adder.v"
`include "twosComplement.v"

module addSub
#(
  parameter NUM_SIZE = 32
)
(
  input   add, //high is add low is sub
  input   [ADDER_SIZE - 1:0] dIn0, //in case of sub dIn0 will be the minuend
  input   [ADDER_SIZE - 1:0] dIn1, //in case of sub dIn1 will be the subtrahend

  output  overflow,
  output  [ADDER_SIZE - 1:0] dOut
);

  wire [NUM_SIZE - 1:0] twosComp;

  twosComplement #(NUM_SIZE = NUM_SIZE) twosCompNegative(.dIn(dIn1), .twosComplement(twosComp));

  wire [NUM_SIZE - 1:0] dIn1Used;
  assign dIn1Used = (dIn1 & {NUM_SIZE{add}}) | (twosComp & {NUM_SIZE{~add}});

  adder #(ADDER_SIZE = NUM_SIZE) addSub(.dIn0(dIn0), .dIn1(dIn1Used), .overflow(overflow), .dOut(dOut));

endmodule

`endif
