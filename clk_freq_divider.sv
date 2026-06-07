module clk_freq_divider (
    input  logic clk,
    output logic clk_new
);

  logic [17:0] count = 0;

  always_ff @(posedge clk) begin
    if (count == '1) begin
      count <= 0;
    end else begin
      count <= count + 1;
    end
  end

  assign clk_new = count[17];

endmodule
