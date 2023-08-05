`ifndef __ADDER__
`define __ADDER__

`include "halfAdder.v"
`include "fullAdder.v"

module adder
#(
  parameter ADDER_SIZE = 32
)
(
  input   [ADDER_SIZE - 1:0] dIn0, //in case of sub dIn0 will be the minuend
  input   [ADDER_SIZE - 1:0] dIn1, //in case of sub dIn1 will be the subtrahend

  output  overflow,
  output  [ADDER_SIZE - 1:0] dOut
);

  wire [ADDER_SIZE - 1:0] carries;

  halfAdder firstAdder(.a(dIn0[0]), .b(dIn1[0]), .sum(dOut[0]), .carry(carries[0]));

  genvar i;
  for(i = 1; i < ADDER_SIZE - 1; i = i + 1) begin: middleAdders
  begin
    fullAdder adder(.a(dIn0[i]), .b(dIn1[i]), .cIn(carries[i - 1]), .sum(dOut[i]), .cOut(carries[i]));
  end

  fullAdder lastAdder(.a(dIn0[ADDER_SIZE - 1]), .b(dIn1[ADDER_SIZE - 1]), .cIn(carries[ADDER_SIZE - 2]), .sum(dOut[ADDER_SIZE - 1]), .cOut(carries[ADDER_SIZE - 1]));

  xor(overflow, carries[ADDER_SIZE - 2], carries[ADDER_SIZE - 1]);

endmodule

`endif
