
`default_nettype none
`timescale 100 ns / 10 ns

module SPSR_4_bits_tb();

parameter DURATION = 10;
reg clk0 = 0;
always #0.5 clk0 = ~clk0;

reg  d0, en;
wire q0, q1, q2 ,q3;

SPSR_4_bits UUT (.clk(clk0), .D(d0), .en(en), .Q0(q0), .Q1(q1), .Q2(q2), .Q3(q3));
integer i;
reg [3:0] i_b;

initial begin
  // Directly specify the VCD file name without using macros
  $dumpfile("SPSR_4_bits_tb.vcd");
  // Dump variables for the jk_tb module
  $dumpvars(0, SPSR_4_bits_tb);
  i_b = 4'b0100;
  en = 1;
  for (i = 0;i<4 ; i = i+1) begin
    d0 = i_b[i];
    #1;
  end
   #1;
  en = 0;

    
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule


