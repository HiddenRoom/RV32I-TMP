`include "compare.v"

module compare_testbench;

  parameter NUM_SIZE = 32;
  parameter NUM_TESTS = 5;

  reg signed [31:0] data0 = -2000000000;
  reg signed [32:0] data1 = -2000000000;

  reg signed [NUM_SIZE - 1:0] dIn0, dIn1;
  wire equal, greaterThan, lessThan;

  compare #(.NUM_SIZE(NUM_SIZE)) dut (
    .leftOperand(dIn0),
    .rightOperand(dIn1),
    .equal(equal),
    .greaterThan(greaterThan),
    .lessThan(lessThan)
  );

  // Test cases
  initial begin
    $display("%b, %b", data0, data1);
    $display("Testing compare module...");

    // Test case: Equal numbers
    dIn0 = 32'h12345678;
    dIn1 = 32'h12345678;
    #10;
    $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
    $display("Equal: %b, Greater: %b, Less: %b", equal, greaterThan, lessThan);

    // Test case: Greater than
    dIn0 = 32'h87654321;
    dIn1 = 32'h12345678;
    #10;
    $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
    $display("Equal: %b, Greater: %b, Less: %b", equal, greaterThan, lessThan);

    // Test case: Less than
    dIn0 = 32'h12345678;
    dIn1 = 32'h87654321;
    #10;
    $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
    $display("Equal: %b, Greater: %b, Less: %b", equal, greaterThan, lessThan);

    // Random test cases
    repeat (NUM_TESTS) begin
      dIn0 = $random;
      dIn1 = $random;
      #10;
      $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
      $display("Equal: %b, Greater: %b, Less: %b", equal, greaterThan, lessThan);
    end

    $finish;
  end

endmodule






