`include "compare.v"

module compare_testbench;

  parameter NUM_SIZE = 32;
  parameter NUM_TESTS = 5;

  reg [NUM_SIZE - 1:0] dIn0, dIn1;
  wire overflowAdd, overflowSub, equal, greaterThan, lessThan;

  compare #(.NUM_SIZE(NUM_SIZE)) uut (
    .dIn0(dIn0),
    .dIn1(dIn1),
    .overflowAdd(overflowAdd),
    .overflowSub(overflowSub),
    .equal(equal),
    .greaterThan(greaterThan),
    .lessThan(lessThan)
  );

  // Test cases
  initial begin
    $display("Testing compare module...");

    // Test case: Equal numbers
    dIn0 = 12345678;
    dIn1 = 12345678;
    #10;
    $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
    $display("Equal: %b, Greater: %b, Less: %b, OverflowAdd: %b, OverflowSub: %b", equal, greaterThan, lessThan, overflowAdd, overflowSub);

    // Test case: Greater than
    dIn0 = 87654321;
    dIn1 = 12345678;
    #10;
    $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
    $display("Equal: %b, Greater: %b, Less: %b, OverflowAdd: %b, OverflowSub: %b", equal, greaterThan, lessThan, overflowAdd, overflowSub);

    // Test case: Less than
    dIn0 = 53425;
    dIn1 = 654321;
    #10;
    $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
    $display("Equal: %b, Greater: %b, Less: %b, OverflowAdd: %b, OverflowSub: %b", equal, greaterThan, lessThan, overflowAdd, overflowSub);

    // Random test cases
    repeat (NUM_TESTS) begin
      dIn0 = $random * 2;
      dIn1 = $random * 2;
      #10;
      $display("Input: dIn0 = %d, dIn1 = %d", dIn0, dIn1);
      $display("Equal: %b, Greater: %b, Less: %b, OverflowAdd: %b, OverflowSub: %b", equal, greaterThan, lessThan, overflowAdd, overflowSub);
    end

    $finish;
  end

endmodule






