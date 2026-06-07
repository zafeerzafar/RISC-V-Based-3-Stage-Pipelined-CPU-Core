module Reg_File (
    input logic [31:0] wdata,
    input logic [4:0] raddr1,
    raddr2,
    waddr,
    input logic RegWrite_MW,
    clk,
    rst,
    output logic [31:0] rdata1,
    rdata2
);

  logic [31:0] Reg_Mem[0:31];

  initial begin
    $readmemh("C:/Users/zafee/Desktop/Lab8/Lab8/register_File.txt", Reg_Mem);
  end

  always_comb begin
    if (raddr1 == 0) rdata1 = 0;
    else rdata1 = Reg_Mem[raddr1];
  end

  always_comb begin
    if (raddr2 == 0) rdata2 = 0;
    else rdata2 = Reg_Mem[raddr2];
  end

  always_ff @(posedge clk) begin
    if (RegWrite_MW && (waddr != 0)) begin
      Reg_Mem[waddr] <= wdata;
    end
  end

endmodule
