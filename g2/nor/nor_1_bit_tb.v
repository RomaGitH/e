`default_nettype none
`define DUMPSTR(x) `"nor_1_bit_tb.vcd`"
`timescale 100 ns / 10 ns

module nor_1_bit_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg a0, b0;

wire c0;

nor_1_bit UUT (
           .a(a0),
           .b(b0),
           .c(c0)
         );

integer i;
reg [1:0] i_b;

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, nor_1_bit_tb);

  for (i = 0;i<4 ; i = i+1 ) 
  begin
      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      
      #1
      i_b = i;
      a0 = i_b[0];
      b0 = i_b[1]; 
  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
