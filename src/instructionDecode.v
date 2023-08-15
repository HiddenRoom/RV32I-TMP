`ifndef __INSTRUCTIONDECODE__
`define __INSTRUCTIONDECODE__

module instructionDecode
(
  input [31:0] instruction,

  //outputs for each possible instruction 
  //outputs for rd, rs1, rs2, and immediates
  //outputs for if rd, rs1, rs2, and immediates are used/valid
);

  wire [6:0] opcode;
  assign opcode = instruction[6:0];
  wire [6:0] funct7;
  assign funct6 = instruction[31:25];
  wire [2:0] funct3;
  assign funct3 = instruction[14:12];

  wire [4:0] rd, rs1, rs2;
  assign rd = instruction[11:7]
  assign rs1 = instruction[19:15]
  assign rs2 = instruction[24:20]

  wire aluImmediate;
  assign aluImmediate = &(opcode ^ (~7'b0010011))

  wire load;
  assign load = &(opcode ^ (~7'b0000011))

endmodule

`endif
