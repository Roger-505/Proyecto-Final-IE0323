/* Red iterativa 
   -------------
    Conductual */

// redIterativa red1 #(.N(3)) (.A(3'b010), .B(3'b000), .Zout(salida));
module redIterativa
#( parameter N = 3 ) (
    input [N - 1:0] A, B,
    output wire Zout
);
    wire [N - 1:0] P; // modificar tamaño de vectores de próximo estado. P[0] y Q[0] no están siendo utilizados. 
    wire [N - 1:0] Q; // variables de estado en vectores por aparte, o meter de dos bits en un solo array para visualizar en gtkwave?????????
    genvar i;

    generate 
        for (i = N - 1; i >= 0 ; i = i - 1) // instancias de celdaInicial y celdaFinal dentro del for/generate????
        begin 
            case (i)
                N - 1 : begin
                    celdaInicial celdaInit (.An_1(A[N - 1]), .Bn_1(B[N - 1]), .Pinit(P[N - 1]), .Qinit(Q[N - 1]));
                end 
                0 : begin
                    celdaFinal celdaFin (.A0(A[0]), .B0(B[0]), .pout(P[1]), .qout(Q[1]), .Zout(Zout)); 
                    /* P[1] y Q[1] son los próximos estados de la última celda típica, 
                    y por tanto son el estado presente de la celda final*/
                end 
                default : begin
                    celdaTipica celdaTyp (.p(P[i + 1]), .q(Q[i + 1]), .Ai(A[i]), .Bi(B[i]), .P(P[i]), .Q(Q[i]));
                end 
            endcase
        //celdaTipica celdas (.P(P[i]));        
        end
    endgenerate
endmodule