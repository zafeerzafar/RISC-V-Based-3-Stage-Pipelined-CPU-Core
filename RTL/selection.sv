module selection (
    input logic clk_new,
    output logic [2:0] seg_sel
);

  always_ff @(posedge clk_new) begin
    if (seg_sel > 7) begin
      seg_sel <= 0;
    end else begin
      seg_sel <= seg_sel + 1;
    end
  end

endmodule
