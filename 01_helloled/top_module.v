module OpenOneLed (
  input b1,
  input b2,
  output reg led1,
  output reg led2,
  output reg led3,
  output reg led4,
);
  

always @(*) begin

    if ({b1, b2} == 2'b00) begin
      led1 = 1;
      led2 = 0;
      led3 = 0;
      led4 = 0;
    end
    else if({b1, b2} == 2'b01) begin
      led1 = 0;
      led2 = 1;
      led3 = 0;
      led4 = 0;
    end
    else if({b1, b2} == 2'b10) begin
      led1 = 0;
      led2 = 0;
      led3 = 1;
      led4 = 0;
    end
    else if({b1, b2} == 2'b11) begin
      led1 = 0;
      led2 = 0;
      led3 = 0;
      led4 = 1;
    end
    
end
  
endmodule