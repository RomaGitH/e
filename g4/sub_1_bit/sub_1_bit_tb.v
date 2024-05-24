`default_nettype none
`define DUMPSTR(x) `"sub_1_bit_tb.vcd`"
`timescale 100 ns / 10 ns

module sub_1_bit_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg  a0, b0, bi;
wire s0, bo;

sub_1_bit UUT (
           .A(a0),
           .B(b0),
           .Bin(bi),
           .D(s0),
           .Bout(bo)
         );

integer i;
reg [2:0] i_b;

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, sub_1_bit_tb);
  for (i = 0;i<8 ;i=i+1)
  begin
      i_b = i;
      a0 = i_b[2]; 
      b0 = i_b[1]; 
      bi = i_b[0]; 
      #1;      
  end


    #(DURATION) $display("End of simulation");
   $finish;
end

endmodule
