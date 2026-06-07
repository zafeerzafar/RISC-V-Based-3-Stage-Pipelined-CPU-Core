module mux8x1 (
    input  logic [31:0] mem_data,
    input  logic [ 2:0] seg_sel,
    output logic [ 3:0] data
);

  always_comb begin
    case (seg_sel)
      0: data = mem_data[3:0];
      1: data = mem_data[7:4];
      2: data = mem_data[11:8];
      3: data = mem_data[15:12];
      4: data = mem_data[19:16];
      5: data = mem_data[23:20];
      6: data = mem_data[27:24];
      7: data = mem_data[31:28];
    endcase
  end

endmodule
