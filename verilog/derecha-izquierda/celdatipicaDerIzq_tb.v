/* Testbench para la celda típica correspondiente al
   diseño de la red iterativa analizando las palabras 
   de bits A y B de derecha a izquierda */

`timescale 1 ns/10 ps // Definición del timescale

module celdaTipicaDerIzq_tb; 
    /* Rango de tiempo period correspondiente
       a cada combinación binaria de las palabras 
       A y B */
    localparam period = 20;

    /* variable utilizada para for de pruebas */
    integer counter; 

    /* Declaración de bits de prueba correspondientes
       a las palabras A y B */
    reg Ai, Bi;

    /* variables de próximo estado P 
       y de estado presente p, para la 
       celda típica */
    reg p;            // p = estado
    wire P;           // P = prox_estado
    /* instanciación de celdaTípica para someterla
       a pruebas */
    celdaTipicaDerIzq DUT (.p(p), .P(P), .Ai(Ai), .Bi(Bi));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("celdaTipicaDerIzq_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo celdaTipica_tb */
            $dumpvars(1, celdaTipicaDerIzq_tb); 

            /* Pruebas en base a la tabla de 
               transición de estados */
            for (counter = 0 ; counter < 2 ; counter = counter + 1)
            begin
                case (counter)
                    0 : p = 1'b1; // *** Estado presente: a:1 ***
                    1 : p = 1'b0; // *** Estado presente: b:0 ***
                endcase 
                Ai = 0; Bi = 0;     //AB = 00
                #period;
                Ai = 0; Bi = 1;     //AB = 01
                #period;
                Ai = 1; Bi = 0;     //AB = 10
                #period
                Ai = 1; Bi = 1;     //AB = 11
                #period;
            end 
            $finish;
        end
endmodule