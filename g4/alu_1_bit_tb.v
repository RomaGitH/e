`default_nettype none
`define DUMPSTR(x) `"alu_1_bit_tb.vcd`"
`timescale 100 ns / 10 ns

module alu_1_bit_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg  a0, b0 , ci0;
wire  o0, z0, p0;
reg [2:0] opt0;
wire co0;

alu_1_bit UUT (
    .A(a0),
    .B(b0),
    .Cin(ci0),
    .Op(opt0),
    .O(o0),
    .Z(z0),
    .P(p0),
    .Cout(co0)
           
         );

integer i, j;
reg [2:0] i_b;

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, alu_1_bit_tb);
  for (i = 0;i<8 ;i=i+1)
  	begin
  	    for(j=0;j<8;j=j+1)
            begin
                #2;
                i_b = i;
                a0 = i_b[2];
                b0 = i_b[1];
                ci0 = i_b[0];
                opt0 = j;
                
            end	
  end


    #(DURATION) $display("End of simulation");
   $finish;
end

endmodule

