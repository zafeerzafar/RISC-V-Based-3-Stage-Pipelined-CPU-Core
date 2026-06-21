module Three_stage_Pipeline (
    input logic clk,
    rst,
    output logic [6:0] Display,
    output logic [7:0] segment
);


  logic [31:0] Instruction_F, ALU_result_DE, readData, rdata2_DE, mem_data;
  logic [3:0] ALU_control, mask;
  logic [2:0] br_type, load, load_MW, br_typeMW;
  logic [1:0] wb_sel, wb_sel_MW, store, store_MW;
  logic
      RegWrite,
      RegWrite_MW,
      wr_en,
      wr_en_MW,
      rd_en,
      rd_en_MW,
      sel_A,
      sel_B,
      cs,
      Stall_Out,
      Stall_DMOut,
      Stall_MW,
      clk_new;

  // Data_Path
  DataPath DP (
      ALU_result_DE,
      Instruction_F,
      rdata2_DE,
      mask,
      cs,
      Stall_Out,
      Stall_MW,
      readData,
      ALU_control,
      br_typeMW,
      load_MW,
      wb_sel_MW,
      store_MW,
      RegWrite_MW,
      sel_A,
      sel_B,
      clk,
      rst,
      Stall_DMOut
  );

  // Controller 
  Controller CU (
      Instruction_F[6:0],
      Instruction_F[31:25],
      Instruction_F[14:12],
      ALU_control,
      br_type,
      load,
      wb_sel,
      store,
      RegWrite,
      wr_en,
      rd_en,
      sel_A,
      sel_B
  );

  //Stage 2 contorl signal register
  Control_Reg CR (
      load,
      br_type,
      wb_sel,
      store,
      RegWrite,
      Stall_MW,
      wr_en,
      rd_en,
      rst,
      clk,
      load_MW,
      br_typeMW,
      wb_sel_MW,
      store_MW,
      RegWrite_MW,
      wr_en_MW,
      rd_en_MW
  );

  //Data Memory
  DataMemory DM (
      readData,
      Stall_DMOut,
      ALU_result_DE,
      rdata2_DE,
      mask,
      wr_en_MW,
      rd_en_MW,
      cs,
      clk,
      rst,
      Stall_Out
  );

  //clock frquency reduced from 100MHz to 50Hz
  clk_freq_divider CFD (
      clk,
      clk_new
  );

  //7-segment display for FPGA
  Seven_Seg_Display SSD (
      .clk_new (clk_new),
      .mem_data(DM.Data_Mem[0]),
      .Display (Display),
      .segment (segment)
  );

endmodule
