module TopModule(
  input five,
  input ten,
  output done,
  output change,
  );
  wire clk;
  SB_HFOSC osc(
    .CLKHFPU(1'b1),
    .CLKHFEN(1'b1),
    .CLKHF(clk),
  );

  wire five_debounce;
  wire ten_debounce;
  wire full;
  PushButton_Debouncer pbdbfive(
    .clk(clk),
    .PB(~five),
    .PB_up(five_debounce), 
  );
  PushButton_Debouncer pbdbten(
    .clk(clk),
    .PB(~ten),
    .PB_up(ten_debounce), 
  );
  VendingMachine vdmc(
    .clk(clk),
    .five(five_debounce),
    .ten(ten_debounce),
    .done(done),
    .change(change)
  );
  
endmodule


