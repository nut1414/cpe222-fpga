module VendingMachine(
 input clk,
 input five,
 input ten,
 output change,
 output done
);
  parameter [2:0] A = 3'b000,
                  B = 3'b001,
                  C = 3'b010,
                  D = 3'b011,
                  E = 3'b100;


  reg [2:0] state, next;
  always @(posedge clk) begin
    state <= next;
  end
  wire full;

  Counter ct(
    .clk(clk),
    .enable(state == D || state == E),
    .full(full),
  );

  always @(*) begin
    next = state;
    case (state)
      A: if (five)     next = B;
         else if (ten) next = C;
      B: if (five)     next = C;
         else if (ten) next = D;
        //  else done =  1;
      C: if (five)     next = D;
         else if (ten) next = E;
        //  else change = 1;
      D: if (five)     next = B;
         else if (ten) next = C;
         else if (full)next = A;
      E: if (five)     next = B;
         else if (ten) next = C;
         else if (full)next = A;
      default: next = A;
    endcase
    // if (full == 1'b1 && (state == D || state == E)) next = A;
  end
  
  assign done = (state == D) || (state == E);
  assign change = (state == E);
endmodule