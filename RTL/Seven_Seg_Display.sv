module Seven_Seg_Display (
    input logic clk_new,
    input logic [31:0] mem_data,
    output logic [6:0] Display,
    output logic [7:0] segment
);

  logic [3:0] data;
  logic [2:0] seg_sel;

  mux8x1 data_mux (
      mem_data,
      seg_sel,
      data
  );

  selection sel_counter (
      clk_new,
      seg_sel
  );

  seg_decoder decoder1 (
      seg_sel,
      segment
  );

  data_decoder decoder2 (
      data,
      Display
  );

endmodule
