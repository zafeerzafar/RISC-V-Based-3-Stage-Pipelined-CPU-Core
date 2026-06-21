module Control_Reg (
    input logic [2:0] load,
    br_type,
    input logic [1:0] wb_sel,
    store,
    input logic RegWrite,
    Stall_MW,
    wr_en,
    rd_en,
    rst,
    clk,
    output logic [2:0] load_MW,
    br_typeMW,
    output logic [1:0] wb_sel_MW,
    store_MW,
    output logic RegWrite_MW,
    wr_en_MW,
    rd_en_MW
);

  //Hold the control signals for stage 3
  always_ff @(posedge clk) begin
    if (rst) begin
      load_MW <= 3'b0;
      br_typeMW <= 3'b0;
      store_MW <= 2'b0;
      wb_sel_MW <= 2'b0;
      RegWrite_MW <= 1'b0;
      wr_en_MW <= 1'b1;
      rd_en_MW <= 1'b0;
    end else begin
      if (Stall_MW) begin
        load_MW <= load_MW;
        br_typeMW <= br_typeMW;
        store_MW <= store_MW;
        wb_sel_MW <= wb_sel_MW;
        RegWrite_MW <= RegWrite_MW;
        wr_en_MW <= wr_en_MW;
        rd_en_MW <= rd_en_MW;
      end else begin
        load_MW <= load;
        br_typeMW <= br_type;
        store_MW <= store;
        wb_sel_MW <= wb_sel;
        RegWrite_MW <= RegWrite;
        wr_en_MW <= wr_en;
        rd_en_MW <= rd_en;
      end
    end
  end

endmodule
