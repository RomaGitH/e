module sub_1_bit (
    input wire A,
    input wire B,
    input wire Bin,
    output wire D,
    output wire Bout
);
    
assign D = (!A)*(!B)*Bin + (!A)*B*(!Bin) + A*(!B)*(!Bin) + A*B*Bin;
assign Bout = (!A)*(!B)*Bin + (!A)*B*(!Bin) + (!A)*B*Bin + A*B*Bin;



/* A*B+((!A)*B+A*(!B))*Cin;
 */
endmodule