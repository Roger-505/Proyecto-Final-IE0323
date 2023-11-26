/* Testbench para la celda final correspondiente al
   diseño de la red iterativa analizando las palabras 
   de bits A y B de izquierda a derecha */

`timescale 1 ns/10 ps // Definición del timescale

module celdaFinal_tb; 
    /* Rango de tiempo period correspondiente
       a cada combinación binaria de las palabras 
       A y B */
    localparam period = 20;

    /* variable utilizada para el índice del for de pruebas */
    integer counter; 

    /* Declaración de bits de prueba correspondientes
       a las palabras A y B */
    reg A0, B0;

    /* variables de estado presente p y q, y salida
       Z para la celda final */
    reg [1:0] estado;      // p = estado[1], q = estado[0] 

    /* Salida de la red iterativa Z */
    wire Zout; 

    /* instanciación de celdaFinal como una descripción 
       nombrada para someterla a pruebas */
    celdaFinal DUT (.pout(estado[1]), .qout(estado[0]), .Zout(Zout), .A0(A0), .B0(B0));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("celdaFinal_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo celdaFinal_tb */
            $dumpvars(1, celdaFinal_tb); 

            /* Pruebas en base a la tabla de 
               transición de estados */
            for (counter = 0 ; counter < 3 ; counter = counter + 1)
            begin
                case (counter)
                    0 : estado = 2'b01; // *** Estado presente: a:01 ***
                    1 : estado = 2'b10; // *** Estado presente: b:10 ***
                    2 : estado = 2'b11; // *** Estado presente: c:11 ***
                endcase 
                A0 = 0; B0 = 0;     //AB = 00
                #period;
                A0 = 0; B0 = 1;     //AB = 01
                #period;
                A0 = 1; B0 = 0;     //AB = 10
                #period
                A0 = 1; B0 = 1;     //AB = 11
                #period;
            end 
            $finish;
        end
endmodule 