module Mux ( // 2 to 1 mux
  input a,
  input b,
  input s,
  output f
);

  // first way  
  assign f = (~s & a) | (s & b); 

endmodule


module Mux ( // 2 to 1 mux
  input a,
  input b,
  input s,
  output reg f // note the reg here
  // reg doesn't mean it is a register,
  // it means it might be a register/or latch
);

  // second way
  always @(*) begin
    f = (~s & a) | (s & b);
  end


endmodule


module Mux ( // 2 to 1 mux
  input a,
  input b,
  input s,
  output reg f  // note the reg here
  // reg doesn't mean it is a register,
  // it means it might be a register/or latch
);

  // third way
  always @(*) begin
    if (s == 1'b0) begin
      f = a;
    end else begin
      f = b;
    end
  end

endmodule

module Mux(
  input a,
  input b,
  input c,
  input d,
  input s1,
  input s0,
  output reg f  // note the reg here
  // reg doesn't mean it is a register,
  // it means it might be a register/or latch
)
  always @(*) begin
    if ({s1,s0} == 2'b00) begin
      f = a;
    end else if ({s1,s0} == 2'b01) begin
      f = b;
    end else if ({s1,s0} == 2'b10) begin
      f = c;
    end /*else if ({s1,s0} == 2'b11) begin  
      // if this last if statement doesn't exist f would have to store the last value
      // then it would be a latch
      f = d
    end*/
  end
endmodule


module Mux(
  input a,
  input b,
  input c,
  input d,
  input s1,
  input s0,
  output f  // note the reg here
  // reg doesn't mean it is a register,
  // it means it might be a register/or latch
)
  reg out;
  always @(*) begin
    if ({s1,s0} == 2'b00) begin
      out = a;
    end else if ({s1,s0} == 2'b01) begin
      out = b;
    end else if ({s1,s0} == 2'b10) begin
      out = c;
    end /*else if ({s1,s0} == 2'b11) begin  
      // if this last if statement doesn't exist f would have to store the last value
      // then it would be a latch
      out = d
    end*/
  end
  assign f = out;

endmodule