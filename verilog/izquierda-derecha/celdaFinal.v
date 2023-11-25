/* Definición de módulo para la celda final de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */
module celdaFinal(
    input pout, qout, A0, B0,
    output Zout
);
    wire s0, s1;
    // Se podrá hacer esto instanciando a celdaTipica ?????

    /* Función lógica para la variable Z de salida, igual a Q en
    el módulo de celda típica */
    assign s0 = ~A0 | B0;
    assign s1 = pout | s0; 
    assign Zout = qout & s1; 

endmodule