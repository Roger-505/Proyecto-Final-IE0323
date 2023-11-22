// todos los módulos tienen que venir en un mismo archivo ??????????????
`include "celdaTipica.v" // Es necesario hacer este include ??

/* Definición de módulo para la celda inicial de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */
module celdaInicial (
    input An_1, Bn_1,
    output Pinit, Qinit // valor default de las variables de estado presente para el estado de partida input p = 0 , q = 1 ??? 
);
    /* Evaluar celda típica en el estado inicial a: 01 */
    celdaTipica celdaInit (.p(1'b0), .q(1'b1), .Ai(An_1), .Bi(Bn_1), .P(Pinit), .Q(Qinit));
endmodule