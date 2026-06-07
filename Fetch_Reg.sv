module Fetch_Reg (
    input logic [31:0] Instruction,
    input logic [31:0] PC,
    input rst,
    clk,
    Stall,
    flush,
    output logic [31:0] Instruction_F,
    output logic [31:0] PC_F
);

  //Register_1 for PC value 
  always_ff @(posedge clk) begin  // Hold PC value
    if (rst) begin
      PC_F <= 32'h0;
    end else begin
      if (Stall) begin
        PC_F <= PC_F;
      end else begin
        PC_F <= PC;
      end
    end
  end

  //Register_2 for instuctions 
  always_ff @(posedge clk) begin  // Hold instructions
    if (rst) begin
      Instruction_F <= 32'h0;
    end
    if (flush) begin
      Instruction_F <= 32'h00000013;  //addi x0,x0,0
    end
    if (Stall) begin
      Instruction_F <= Instruction_F;
    end else begin
      Instruction_F <= Instruction;
    end
  end


endmodule
