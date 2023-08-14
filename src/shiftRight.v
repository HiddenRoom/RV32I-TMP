`ifndef __SHIFTRIGHT__ 
`define __SHIFTRIGHT__ 

module shiftRight
#(
  parameter NUM_SIZE = 32
)
(
  input [$clog2(NUM_SIZE) - 1:0] shamt,
  input [NUM_SIZE - 1:0] dIn0,

  output [NUM_SIZE - 1:0] dOut
);

  assign dOut = dIn0 >> shamt;

endmodule

`endif
