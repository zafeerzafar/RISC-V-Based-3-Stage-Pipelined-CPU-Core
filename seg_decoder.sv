module seg_decoder (
    input  logic [2:0] seg_sel,
    output logic [7:0] segment
);

  always_comb begin
    case (seg_sel)
      0: segment = 8'b11111110;
      1: segment = 8'b11111101;
      2: segment = 8'b11111011;
      3: segment = 8'b11110111;
      4: segment = 8'b11101111;
      5: segment = 8'b11011111;
      6: segment = 8'b10111111;
      7: segment = 8'b01111111;
    endcase
  end

endmodule
