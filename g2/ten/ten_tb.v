`default_nettype none
`define DUMPSTR(x) `"ten_tb.vcd`"
`timescale 100 ns / 10 ns

module ten_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg [4:0] A0;

wire p0;

ten UUT (
           .A(A0),
           .P(p0)
         );

integer i;

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, ten_tb);

  for (i = 0;i<32 ; i = i+1 ) 
  begin
      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      #1
      A0 = i;
  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
