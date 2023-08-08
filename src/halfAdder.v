`ifndef __HALFADDER__
`define __HALFADDER__

module halfAdder
(
  input   a,
  input   b,

  output  sum,
  output  carry
);

  xor(sum, a, b);
  and(carry, a, b);

endmodule

`endif
