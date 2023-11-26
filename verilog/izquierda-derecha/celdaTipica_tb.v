/* Testbench para la celda típica correspondiente al
   diseño de la red iterativa analizando las palabras 
   de bits A y B de izquierda a derecha */

`timescale 1 ns/10 ps // Definición del timescale

module celdaTipica_tb; 
    /* Rango de tiempo period correspondiente
       a cada combinación binaria de las palabras 
       A y B */
    localparam period = 20;

    /* variable utilizada para for de pruebas */
    integer counter; 

    /* Declaración de bits de prueba correspondientes
       a las palabras A y B */
    reg Ai, Bi;

    /* variables de próximo estado P y Q 
       y de estado presente p y q para la 
       celda típica */
    reg [1:0] estado;            // p = estado[1], q = estado[0] 
    wire [1:0] prox_estado;      // P = prox_estado[1], Q = prox_estado[0] 

    /* instanciación de celdaTípica para someterla
       a pruebas */
    celdaTipica DUT (.p(estado[1]), .q(estado[0]), .P(prox_estado[1]), .Q(prox_estado[0]), .Ai(Ai), .Bi(Bi));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("celdaTipica_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo celdaTipica_tb */
            $dumpvars(1, celdaTipica_tb); 

            /* Pruebas en base a la tabla de 
               transición de estados */
            for (counter = 0 ; counter < 3 ; counter = counter + 1)
            begin
                case (counter)
                    0 : estado = 2'b01; // *** Estado presente: a:01 ***
                    1 : estado = 2'b10; // *** Estado presente: b:10 ***
                    2 : estado = 2'b11; // *** Estado presente: c:11 ***
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