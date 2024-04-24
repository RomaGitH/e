module nor_1_bit (
    input wire a,
    input wire b,
    output wire c  
);

assign c = !(a || b) ;


endmodule