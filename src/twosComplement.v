`ifndef __TWOSCOMP__
`define __TWOSCOMP__

`include "adder.v"

module twosComplement
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] dIn,

  output  [NUM_SIZE - 1:0] twosComplement
);

  wire ignore;

  wire [NUM_SIZE - 1:0] onesComplement;
  assign onesComplement = ~dIn;

  adder #(ADDER_SIZE = NUM_SIZE) twosCompAdder(.dIn0(onesComplement), .dIn1({{NUM_SIZE{1'b0}}, 1'b1}), .overflow(ignore), .dOut(twosComplement));

endmodule

`endif
