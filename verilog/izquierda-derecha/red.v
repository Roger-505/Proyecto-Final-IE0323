/* Definición de módulo para la red iterativa analizando 
   las palabras de izquierda a derecha */

module redIterativaIzqDer
#( parameter N = 3 ) (
    input [N - 1:0] A, B,
    output Zout
);
    // FIXME: modificar tamaño de vectores de próximo estado. P[0] y Q[0] no están siendo utilizados. 
    /* arrays con las variables de próximo estado P y Q para las celdas de la red iterativa */
    wire [N - 1:0] P; 
    wire [N - 1:0] Q; 
    genvar i; // variable para la elaboración del bloque generate correspondiente a la celda en la posicón i

    /* bloque generate para generar las celdas que conforman la red iterativa por medio de un ciclo for.
       genera una celda inicial, una celda final, y N - 2 celdas típicas */
    generate 
        for (i = N - 1; i >= 0 ; i = i - 1) 
        begin 
            case (i)
                // generar una instancia de celdaInicial en la posición N - 1 de la red. 
                N - 1 : 
                begin
                    celdaInicial celdaInit (.An_1(A[N - 1]), .Bn_1(B[N - 1]), .Pinit(P[N - 1]), .Qinit(Q[N - 1]));
                end 
                // generar una instancia de celdaFinal en la posición 0 de la red. 
                0 : 
                begin
                    celdaFinal celdaFin (.pout(P[1]), .qout(Q[1]), .A0(A[0]), .B0(B[0]), .Zout(Zout)); 
                    /* P[1] y Q[1] son los próximos estados de la última celda típica, 
                    y por tanto son el estado presente de la celda final*/
                end 
                // generar N - 2 instancias de celdaTipica, entre la celda inicial y la celda final
                default : 
                begin
                    celdaTipica celdaTyp (.p(P[i + 1]), .q(Q[i + 1]), .Ai(A[i]), .Bi(B[i]), .P(P[i]), .Q(Q[i]));
                    /* de forma similar a la celda final, el estado presente de una celda tipica es el próximo estado
                       de la celda anterior. corresponde al estado presente P[i + 1] y Q[i + 1] */
                end 
            endcase      
        end
    endgenerate
endmodule