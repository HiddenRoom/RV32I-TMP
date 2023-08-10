`ifndef __NUM__
`define __NUM__

`include "halfAdder.v"
`include "fullAdder.v"

module adder
#(
  parameter NUM_SIZE = 32
)
(
  input   [NUM_SIZE - 1:0] dIn0, //in case of sub dIn0 will be the minuend
  input   [NUM_SIZE - 1:0] dIn1, //in case of sub dIn1 will be the subtrahend

  output  overflow,
  output  [NUM_SIZE - 1:0] sum
);

  wire [NUM_SIZE - 1:0] carries;

  halfAdder firstAdder(.a(dIn0[0]), .b(dIn1[0]), .sum(sum[0]), .carry(carries[0]));

  genvar i;
  generate
    for(i = 1; i < NUM_SIZE - 1; i = i + 1) 
      begin
        fullAdder adder(.a(dIn0[i]), .b(dIn1[i]), .cIn(carries[i - 1]), .sum(sum[i]), .cOut(carries[i]));
      end
  endgenerate

  fullAdder lastAdder(.a(dIn0[NUM_SIZE - 1]), .b(dIn1[NUM_SIZE - 1]), .cIn(carries[NUM_SIZE - 2]), .sum(sum[NUM_SIZE - 1]), .cOut(carries[NUM_SIZE - 1]));

  xor(overflow, carries[NUM_SIZE - 2], carries[NUM_SIZE - 1]);

endmodule

`endif
