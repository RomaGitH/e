`default_nettype none
`define DUMPSTR(x) `"sum_1_bit_tb.vcd`"
`timescale 100 ns / 10 ns

module sum_1_bit_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg  a0, b0, ci;
wire s0, co;

sum_1_bit UUT (
           .A(a0),
           .B(b0),
           .Cin(ci),
           .S(s0),
           .Cout(co)
         );

integer i;
reg [2:0] i_b;

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, sum_1_bit_tb);
  for (i = 0;i<8 ;i=i+1)
  begin
      i_b = i;
      a0 = i_b[2]; 
      b0 = i_b[1]; 
      ci = i_b[0]; 
      #1;      
  end


    #(DURATION) $display("End of simulation");
   $finish;
end

endmodule
