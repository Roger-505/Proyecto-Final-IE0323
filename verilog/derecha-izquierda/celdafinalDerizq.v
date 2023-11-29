/* Definición de módulo para la celda final de la 
   red iterativa analizando las palabras de derecha a izquierda
*/

module celdaFinalDerIzq (
    input p, An_1, Bn_1,
    output Z
); 
    /* wires para la construcción de las funciones lógicas
    de P */
    wire s0, s1, s2;

    /* función lógica para la variable de próximo estado P */
    assign s0 = ~An_1 | Bn_1;
    assign s1 = ~An_1 & Bn_1;
    assign s2 = p & s0;    

    assign Z = s2 | s1;

endmodule