module dec_bin_prio (
    input wire [0:7] i,
    output wire [0:2] o
);

assign o = i[7] ? 3'b111 : // 7
           i[6] ? 3'b110 : // 6 
           i[5] ? 3'b101 : // 5 
           i[4] ? 3'b100 : // 4 
           i[3] ? 3'b011 : // 3 
           i[2] ? 3'b010 : // 2 
           i[1] ? 3'b001 : // 1 
           3'b000 ;// 0 ;


    
endmodule