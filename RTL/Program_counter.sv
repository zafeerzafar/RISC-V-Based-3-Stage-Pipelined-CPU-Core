module Program_counter (
    input logic [31:0] PC_new,
    input logic rst,
    clk,
    flush,
    output logic [31:0] PC
);

  always_ff @(posedge clk) begin
    if (rst) PC <= 0;
    else if (flush) PC <= 32'h00000013;
    else PC <= PC_new;
  end

endmodule
