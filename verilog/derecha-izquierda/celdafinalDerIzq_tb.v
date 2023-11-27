/* Testbench para la celda inicial correspondiente al
   diseño de la red iterativa analizando las palabras 
   de bits A y B de izquierda a derecha */

`timescale 1 ns/10 ps // Definición del timescale

module celdaFinalDerIzq_tb; 
    /* Rango de tiempo period correspondiente
       a cada combinación binaria de las palabras 
       A y B */
    localparam period = 20;
    
    /* variable utilizada para el índice del for de pruebas */
    integer counter; 


    /* Declaración de bits de prueba correspondientes
       a las palabras A y B */
    reg An_1, Bn_1;

    /* variable de estado presente p, y salida
    Z para la celda final */
    reg p;      // p = estado presente

    /* Salida de la red iterativa Z */
    wire Zout; 

    /* instanciación de celdaInicial como una descripción 
       nombrada  para someterla a pruebas */
    celdaFinalDerIzq DUT (.p(p), .Z(Zout), .An_1(An_1), .Bn_1(Bn_1));
    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("celdaFinal_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo celdaInicial_tb */
            $dumpvars(1, celdaFinalDerIzq_tb); 

            /* Pruebas en base a la tabla de 
               transición de estados */
            for (counter = 0 ; counter < 2 ; counter = counter + 1)
            begin
                case (counter)
                    0 : p = 1'b1; // *** Estado presente: a:1 ***
                    1 : p = 1'b0; // *** Estado presente: b:0 ***
                endcase 
                An_1 = 0; Bn_1 = 0;     //AB = 00
                #period;
                An_1 = 0; Bn_1 = 1;     //AB = 01
                #period;
                An_1 = 1; Bn_1 = 0;     //AB = 10
                #period
                An_1 = 1; Bn_1 = 1;     //AB = 11
                #period;
            end 
            $finish;
        end
endmodule 