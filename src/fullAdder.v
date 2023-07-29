`ifndef __HALFADDER__
`define __HALFADDER__

module fullAdder
(
  input a,
  input b,
  input cIn,

  output sum,
  output cOut
);
  
  wire sumAB, carryAB, sumCInSumAB, carryCInSumAB;

  halfAdder halfAdderAB(.a(a), .b(b), .sum(sumAB), .carry(carryAB));
  halfAdder halfAdderCInSumAB(.a(cIn), .b(sumAB), .sum(sum), .carry(carryCInSumAB));

  or(cOut, carryAB, carryCInSumAB);

endmodule

`endif
