/* Red iterativa 
   -------------
    Conductual */

// redIterativa red1 #(.N(3)) (.A(3'b010), .B(3'b000), .Zout(salida));

module redIterativaDerIzq
#( parameter N = 3 ) (
    input [N - 1:0] A, B,
    output wire Zout
);
    wire [N - 1:0] P; // modificar tamaño de vectores de próximo estado. P[0] y Q[0] no están siendo utilizados. 
    // variables de estado en vectores por aparte, o meter de dos bits en un solo array para visualizar en gtkwave?????????
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
        //celdaTipica celdas (.P(P[i]));        
        end
    endgenerate
endmodule