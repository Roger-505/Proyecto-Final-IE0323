`include "celdaTipica.v" // Es necesario hacer este include ??

/* Definición de módulo para la celda inicial de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */
module celdaInicial (
    input p , q, An-1, Bn-1,
    output Pinit, Qinit // valor default de las variables de estado presente para el estado de partida input p = 0 , q = 1 ??? 
);
    /* Evaluar celda típica en el estado inicial a: 01 */
    celdaTipica celdaInit (.p(0), .q(1), .Ai(An-1), .Bi(Bn-1), .P(Pinit), .Q(Qinit));
endmodule