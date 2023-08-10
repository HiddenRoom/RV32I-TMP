`ifndef __TWOSCOMP__
`define __TWOSCOMP__

`include "adder.v"

module twosComplement
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] dIn,

  output  [NUM_SIZE - 1:0] twosComp
);

  wire ignore;

  wire [NUM_SIZE - 1:0] onesComp;
  assign onesComp = ~dIn;

  adder #(.NUM_SIZE(NUM_SIZE)) twosCompAdder(.dIn0(onesComp), .dIn1({{NUM_SIZE - 1{1'b0}}, 1'b1}), .overflow(ignore), .sum(twosComp));

endmodule

`endif
