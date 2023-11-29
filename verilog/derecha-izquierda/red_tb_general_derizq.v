/* Testbench para el diseño de la red iterativa
   analizando las palabras de bits A y B de 
   izquierda a derecha, con casos generales */

`timescale 1 ns /10 ps // Definición de timescale 

module redIterativaIzqDer_general_tb;
    /* tamaño de bits N de las palabras A y B,
       y tiempo period para cada combinación
       binaria entre A y B */
    localparam N = 2, period = 20;

    // Declaración de las palabras A y B de N bits
    reg [N - 1:0] A;
    reg [N - 1:0] B;

    // índices utilizados para los for de las pruebas
    integer A_counter;
    integer B_counter;
    integer counter; 


    // Salida Z de la red iterativa
    wire Zout; 

    /* instanciación del módulo redIterativaIzqDer como 
       una descripción nombrada */
    redIterativaDerIzq  #(.N(N)) DUT (.A(A), .B(B), .Zout(Zout));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("red_general_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo redIterativaIzqDer_tb */
            $dumpvars(1, redIterativaIzqDer_general_tb);
            
            // Casos de esquina entre A y B

            for (counter = 0 ; counter < 4 ; counter = counter + 1)
            begin
                case (counter)
                    0 : begin A = {N{1'b1}}; B ={N{1'b1}};end
                    1 : begin A = {N{1'b1}}; B ={N{1'b0}};end
                    2 : begin A = {N{1'b0}}; B ={N{1'b1}};end
                    3 : begin A = {N{1'b0}}; B ={N{1'b0}};end
                endcase   
                #period;  
                if (A <= B  && Zout==1)
                
                    $display("\n A = %b \n B = %b \n A =< B y Zout = %b. Prueba exitosa\n", A, B, Zout); 
            
                else if (A > B && Zout==0)
                
                    $display("\n A = %b \n B = %b \n A > B y Zout = %b. Prueba exitosa\n", A, B, Zout);

                else 
                    $display("Falló red iterativa %b %b %b", A, B, Zout);        
            end

            for (A_counter = 0; A_counter < 2**N ; A_counter = A_counter + 1)
            begin
                for (B_counter = 0; B_counter < 2**N; B_counter = B_counter + 1)
                begin 
                    // A > B y Zout = 0
                    if (A > B && Zout == 0)
                    begin
                        $display("\n A = %b \n B = %b \n A > B y Zout = %b. Prueba exitosa\n", A, B, Zout); 
                    end 
                    // A <= B y Zout = 1
                    else if (A <= B && Zout == 1)
                    begin
                        $display("\n A = %b \n B = %b \n A <= B y Zout = %b. Prueba exitosa\n", A, B, Zout); 
                    end 
                    // Prueba fallida
                    else 
                    begin
                        $display("\n A = %b \n B = %b \n A <= B y Zout = %b. Prueba fallida\n", A, B, Zout); 
                    end 
                    B = B + 1;
                    /* Al llegar a la última iteración del loop, no realizar #period
                       para evitar pruebas innecesarias al visualizar las formas de onda
                       en gtkwave
                    */
                    if (B_counter != 2**N - 1)
                    begin
                        #period;
                    end 
                end 
                A = A + 1; 
                if (A_counter != 2**N - 1)
                begin
                    #period;
                end 
            end 

            $finish;
        end
endmodule 
