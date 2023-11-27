/* Testbench para la celda inicial correspondiente al
   diseño de la red iterativa analizando las palabras 
   de bits A y B de izquierda a derecha */

`timescale 1 ns/10 ps // Definición del timescale

module celdaInicialDerIzq_tb; 
    /* Rango de tiempo period correspondiente
       a cada combinación binaria de las palabras 
       A y B */
    localparam period = 20;

    /* Declaración de bits de prueba correspondientes
       a las palabras A y B */
    reg A0, B0;

    /* variable de próximo estado P para la
       celda Inicial */
    wire P;      // P = prox_estado[1]

    /* instanciación de celdaInicial como una descripción 
       nombrada  para someterla a pruebas */
    celdaInicialDerIzq DUT (.Pinit(P),.A0(A0), .B0(B0));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("celdaInicialDerizq_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo celdaInicial_tb */
            $dumpvars(1, celdaInicialDerIzq_tb); 

            /* Pruebas en base a la tabla de 
               transición de estados */
            A0 = 0; B0 = 0;     //AB = 00
            #period;
            A0 = 0; B0 = 1;     //AB = 01
            #period;
            A0 = 1; B0 = 0;     //AB = 10
            #period;
            A0 = 1; B0 = 1;     //AB = 11
            #period;
            $finish;
        end
endmodule 