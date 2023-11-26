/* Definición de módulo para la celda típica de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */

module celdaTipica (
    input p, q, Ai, Bi,
    output P, Q
); 
    /* wires para la construcción de las funciones lógicas
    de P y Q */
    wire s0, s1, s2; 

    /* función lógica para la variable de estado P 
    correspondiente al MSB de la asignación de estado */
    assign s0 = Ai ^ Bi;
    assign P = p | s0;

    /* función lógica para la variable Q de estado correspondinete al LSB de 
    la asignación de estados */
    assign s1 = ~Ai | Bi; 
    assign s2 = p | s1; 
    assign Q = q & s2; 
endmodule