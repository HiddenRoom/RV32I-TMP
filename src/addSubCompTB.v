`include "addSubComp.v"

module addSubComp_tb;

  parameter NUM_SIZE = 32;

  reg signed [NUM_SIZE - 1:0] dIn0, dIn1;
  wire overflowAdd, overflowSub;
  wire signed [NUM_SIZE - 1:0] add, sub;
  wire equal, greaterThan, lessThan;

  addSubComp #(NUM_SIZE) dut(.dIn0(dIn0), .dIn1(dIn1), .overflowAdd(overflowAdd), .overflowSub(overflowSub), .add(add), .sub(sub), .equal(equal), .greaterThan(greaterThan), .lessThan(lessThan));

  integer numTests = 10; // Change this to the number of test cases you want to run
  integer i;

  initial begin
    $display("Testbench started.");
    $display("------------------------------");

    for (i = 0; i < numTests; i = i + 1) begin
      dIn0 = $random;
      dIn1 = $random;

      // Print inputs
      $display("Test %0d: dIn0=%d, dIn1=%d", i, dIn0, dIn1);

      // Wait a few time units for the output to stabilize
      #10;

      // Print outputs
      $display("Result: equal=%b, greaterThan=%b, lessThan=%b\nadd=%d, sub=%d, overflowAdd=%b, overflowSub=%d\n", equal, greaterThan, lessThan, add, sub, overflowAdd, overflowSub);

      $display("------------------------------");
    end

    $display("Testbench finished.");
    $finish;
  end

endmodule

