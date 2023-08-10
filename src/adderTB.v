`include "adder.v"

module adder_testbench;

  parameter NUM_SIZE = 32;
  parameter NUM_TESTS = 5;

  reg signed [NUM_SIZE - 1:0] dIn0, dIn1;
  reg signed [NUM_SIZE - 1:0] sum;
  wire overflow;

  compare #(.NUM_SIZE(NUM_SIZE)) dut (
    .dIn0(dIn0),
    .dIn1(dIn1),
    .overflow(overflow),
    .sum(sum)
  );

  // Test cases
  initial begin
    // Random test cases
    repeat (NUM_TESTS) begin
      dIn0 = $random;
      dIn1 = $random;
      #10;
      $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
      $display("sum: %d, Overflow: %b", sum, overflow);
    end

    $finish;
  end

endmodule






