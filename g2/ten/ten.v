
module ten (
    input wire [4:0] A,
    output wire P
);

integer decimal;
integer s;
integer i;

assign P = s;

always @* begin   
decimal = A[4]*16 + A[3]*8 + A[2]*4 + A[1]*2 + A[0]*1;
s = 1;
for (i = 2; i<decimal; i = i + 1 ) 
    begin
        if ((decimal % i == 0) && s == 1)
        begin
            s = 0;
        end
    end
end
    
endmodule
