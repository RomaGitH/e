module bcd_dec (
    input wire [0:3] i,
    output wire [9:0] o
);

reg [9:0] o_reg;

always @* begin
    o_reg = 0;
    o_reg[i]=1;    
end

assign o = o_reg; 


endmodule