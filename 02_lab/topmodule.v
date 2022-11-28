module TopModule(
  input PB,
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
  wire enable;
  clkDivider clkDiv(
    .clk48MHz(clk48MHz),
    .clk1Hz(clk1Hz)
  );
  PushButton_Debouncer pbdb(
    .clk(clk48MHz),
    .PB(~PB),
    .PB_up(enable),
    // .PB_down(led[1]),
    // .PB_state(led[2])
  );
  Counter c1(.clk(clk48MHz), .reset(reset), .enable(enable), .count(led));

  // assign led[0] = (PB == 1'b1) ? 1 : 0 ;
endmodule

//G0 G1 G6 G3 better clock pin

