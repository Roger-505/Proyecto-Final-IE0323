/* Definición de módulo para la red iterativa analizando 
   las palabras de derecha a izquierda */

module redIterativaDerIzq
#( parameter N = 3 ) (
    input [N - 1:0] A, B,
    output wire Zout
);
    wire [N - 2:0] P; 
    genvar i;

    generate 
        for (i = 0; i <= N-1; i = i + 1) // instancias de celdaInicial y celdaFinal dentro del for/generate????
        begin 
            case (i)
                0 : begin
                    celdaInicialDerIzq celdaInit (.A0(A[0]), .B0(B[0]), .Pinit(P[0]));
                end 
                N-1 : begin
                    celdaFinalDerIzq celdaFin (.An_1(A[N-1]), .Bn_1(B[N-1]), .p(P[N-2]), .Z(Zout)); 
                    /* P[1] y Q[1] son los próximos estados de la última celda típica, 
                    y por tanto son el estado presente de la celda final*/
                end 
                default : begin
                    celdaTipicaDerIzq celdaTyp (.p(P[i - 1]), .Ai(A[i]), .Bi(B[i]), .P(P[i]) );
                end 
            endcase   
        end
    endgenerate
endmodule