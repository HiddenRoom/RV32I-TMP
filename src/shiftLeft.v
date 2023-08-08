`ifndef __SHIFTLEFT__ 
`define __SHIFTLEFT__ 

module shiftLeft
#(
  parameter NUM_SIZE = 32
)
(
  input [2 ** NUM_SIZE - 1:0] shamt,
  input [NUM_SIZE - 1:0] dIn0,

  output [NUM_SIZE - 1:0] dOut
);

  genvar i;

endmodule

`endif
