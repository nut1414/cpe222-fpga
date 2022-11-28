module Counter (
  input clk,
  input reset,
  output reg [2:0] count = 3'd0 // 000 three bit 
  // output reg [2:0] count2 // for nonblocking assignment example
);

  //posedge, negedge
  always @(posedge clk) begin
    if (reset == 1'b1) 
      count <= 0;
    else
      count <= count + 1; // <= non-blocking assignment
    // count2 <= count2 + 1;
    /*
    count <= count + 1; // non-blocking assignment
    count2 <= count + 1; // count2 is now have the same value as count because non-blocking
    */
    /*
    count = count + 1; // blocking assignment
    count2 = count + 1; // (count + 1) + 1
    */
  end

endmodule