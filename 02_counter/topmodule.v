module TopModule(
  output [2:0] led,

  );
  wire clk48MHz;
  reg reset = 1'b0;
  SB_HFOSC osc(
    .CLKHFPU(1'b1),
    .CLKHFEN(1'b1),
    .CLKHF(clk48MHz),
  );

  wire clk1Hz;
  clkDivider clkDiv(
    .clk48MHz(clk48MHz),
    .clk1Hz(clk1Hz)
  );
  Counter c1(.clk(clk1Hz), .reset(reset), .count(led));
endmodule

//G0 G1 G6 G3 better clock pin

