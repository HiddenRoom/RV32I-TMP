`include "shiftLeft.v"
`include "shiftRight.v"

module shiftTB;

  // Parameters
  parameter NUM_SIZE = 32;
  parameter NUM_TESTS = 10;

  // Inputs
  reg [$clog2(NUM_SIZE) - 1:0] shamt;
  reg [NUM_SIZE - 1:0] dIn0;

  // Outputs
  wire [NUM_SIZE - 1:0] dOut;

  // Instantiate the module
  shiftRight #(NUM_SIZE) dut (
    .shamt(shamt),
    .dIn0(dIn0),
    .dOut(dOut)
  );

  integer i;

  // Initialize inputs and perform tests
  initial begin
    $display("Starting testbench...");

    // Perform multiple tests with random inputs
    for (i = 0; i < NUM_TESTS; i = i + 1) 
    begin
      // Generate random inputs
      dIn0 = $random;

      // Generate random shift amount
      shamt = $random % NUM_SIZE;

      // Display test information
      $display("index %0d: Input: %b, Shift: %d, Output: %b", i, dIn0, shamt, dOut);

      // Wait for a few time units
      #10;
    end

    $display("Testbench completed.");
    $finish;  // End the simulation
  end

endmodule
