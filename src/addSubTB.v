`include "addSub.v"

module addSub_tb;

  parameter NUM_SIZE = 32;

  reg add;
  reg signed [NUM_SIZE - 1:0] dIn0, dIn1;
  wire overflow;
  wire signed [NUM_SIZE - 1:0] dOut;

  addSub #(NUM_SIZE) dut(.add(add), .dIn0(dIn0), .dIn1(dIn1), .overflow(overflow), .dOut(dOut));

  integer numTests = 10; // Change this to the number of test cases you want to run
  integer i;

  initial begin
    $display("Testbench started.");
    $display("------------------------------");

    for (i = 0; i < numTests; i = i + 1) begin
      // Generate random inputs
      add = $random;
      dIn0 = $random;
      dIn1 = $random;

      // Print inputs
      $display("Test %0d: add=%b, dIn0=%d, dIn1=%d", i, add, dIn0, dIn1);

      // Wait a few time units for the output to stabilize
      #10;

      // Print whether it was an addition or subtraction
      if (add)
        $display("Operation: Addition");
      else
        $display("Operation: Subtraction");

      // Print outputs
      $display("Result: overflow=%b, dOut=%d", overflow, dOut);

      $display("------------------------------");
    end

    $display("Testbench finished.");
    $finish;
  end

endmodule

