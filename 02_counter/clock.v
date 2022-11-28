module clkDivider (
  input clk48MHz,
  output clk1Hz
);
  reg [24:0] counter;
  always @(posedge clk48MHz) begin
    counter <= counter + 1;
    if (counter == 25'd24_000_000) begin
      counter <= 0;
      clk1Hz <= ~clk1Hz;
    end

  end 
endmodule