module In_Mem (
    input  logic [31:0] PC,
    output logic [31:0] Instruction
);

  logic [31:0] Mem[0:127];

  initial begin
    $readmemh("C:/Users/zafee/Desktop/Lab8/Lab8/imem.txt", Mem);
  end

  always_comb begin
    Instruction = Mem[PC[31:2]];
  end

endmodule
