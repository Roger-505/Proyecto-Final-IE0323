module test;

reg [2:0] A = 3'b011;
reg [2:0] B = 3'b011;
reg [2:0] C;

initial
    begin
        //A = 3'b010; // Asignar el valor a A
        //B = 3'b011; // Asignar el valor a B

        C = A + B;  // Realizar la suma y asignar el resultado a C
        $display(" C = %b", C);
    end
endmodule