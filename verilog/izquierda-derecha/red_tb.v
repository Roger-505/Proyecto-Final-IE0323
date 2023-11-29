/* Testbench para el diseño de la red iterativa
   analizando las palabras de bits A y B de 
   izquierda a derecha, con casos explícitos */

`timescale 1 ns/10 ps // Definición de timescale 

module redIterativaIzqDer_tb;
    /* tamaño de bits N de las palabras A y B,
       y tiempo period para cada combinación
       binaria entre A y B */
    localparam N = 4, period = 20;

    // Declaración de las palabras A y B de N bits
    reg [N - 1:0] A = 0; 
    reg [N - 1:0] B = 0;

    // Salida Z de la red iterativa
    wire Zout; 

    /* instanciación del módulo redIterativaIzqDer como 
       una descripción nombrada */
    redIterativaIzqDer  #(.N(N)) DUT (.A(A), .B(B), .Zout(Zout));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("red_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo redIterativaIzqDer_tb */
            $dumpvars(1, redIterativaIzqDer_tb); 

            // PALABRAS DE DISTINTOS TAMAÑOS

            /* Pruebas en base a algunas combinaciones binarias
               entre A y B. 
               *** Si A >  B => Zout = 0 *** 
               *** Si A <= B => Zout = 1 *** 
            */
            A = 4'b1111;   // A = 10
            B = 4'b0100;   // B = 4
            #period;

            A = 4'b0011;   // A = 3
            B = 4'b0100;   // B = 4
            #period;

            A = 4'b1000;   // A = 8
            B = 4'b0000;   // B = 0
            #period;

            A = 4'b0000;   // A = 0
            B = 4'b0000;   // B = 0
            #period; // OJO CON ESTO
            $finish;
        end
endmodule 