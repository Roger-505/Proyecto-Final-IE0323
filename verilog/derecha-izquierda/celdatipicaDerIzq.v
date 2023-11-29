/* Definición de módulo para la celda típica de la 
   red iterativa analizando las palabras de derecha a izquierda
*/
   
module celdaTipicaDerIzq (
    input p, Ai, Bi,
    output P
); 

    /* wires para la construcción de las funciones lógicas
    de P */
    wire s0, s1, s2;

    /* función lógica para la variable de próximo estado P */
    assign s0 = ~Ai | Bi;
    assign s1 = ~Ai & Bi;
    assign s2 = p & s0;    

    assign P = s2 | s1;
endmodule