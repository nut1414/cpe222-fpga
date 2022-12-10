module Counter (
  input clk,
  input enable,
  output reg full,
);
  reg [25:0] counter;
  always @(posedge clk) begin
    if (enable == 1'b1) begin
      full = 1'b0;
      counter <= counter + 1;
    end
    if (enable == 1'b0) begin
      full = 1'b0;
    end
    if (counter == 26'd48_000_000) begin
      full = 1'b1;
      counter <= 0;
    end 

  end 
endmodule