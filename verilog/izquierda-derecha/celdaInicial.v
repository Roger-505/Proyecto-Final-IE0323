/* Definición de módulo para la celda inicial de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */

module celdaInicial (
    input An_1, Bn_1,
    output Pinit, Qinit 
);  

    reg pinit = 1'b0; // variable de estado p = 0 del estado inicial
    reg qinit = 1'b1; // variable de estado q = 1 del estado inicial

    /* Evaluar celda típica en el estado inicial a: 01. Se realiza 
       una instanciación nombrada */
    celdaTipica celdaInit (.p(pinit), .q(qinit), .Ai(An_1), .Bi(Bn_1), .P(Pinit), .Q(Qinit));
endmodule