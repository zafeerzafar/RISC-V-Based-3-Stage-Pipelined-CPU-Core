module tb_Three_stage_Pipeline;

  logic clk, rst;
  logic [7:0] segment;
  logic [6:0] Display;

  Three_stage_Pipeline DUT (
      .clk(clk),
      .rst(rst),
      .Display(Display),
      .segment(segment)
  );

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial begin
    rst = 1;
    @(posedge clk);
    rst = 0;
    @(posedge clk);
    @(posedge clk);
    repeat (500) @(posedge clk);

    $stop;
  end

  initial begin
    $monitor("Seg = %b, Output = %b", segment, Display);
  end
endmodule
