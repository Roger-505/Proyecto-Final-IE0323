module celdaFinal (
    input p, An_1, Bn_1,
    output Z
); 
    reg a = 1'b1;
    reg b = 1'b0;

    always @(p or Ai or Bi) begin
        
        if (An_1 < Bn_1 && p == b) Z = 1;

        else if (An_1 <= Bn_1 && p == a) Z = 1;

        else Z= 0 

    end

endmodule