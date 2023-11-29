/* Definición de módulo para la celda típica de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */

module celdaTipicaIzqDer (
    input p, q, Ai, Bi,
    output reg P, Q
); 

    //asignacion de estados a:01, b:10, c:11
    reg [1:0] a = 2'b01;
    reg [1:0] b = 2'b10;
    reg [1:0] c = 2'b11;

    always @(p or q or Ai or Bi) begin 
        // always cada vez que p, q, Ai o Bi cambien se ejecuta lo siguiente segun corresponda
        // Y asi cambiar el proximo estado P, segun el estado actual p, q, y A y B. 
        
        // estado presente a
        if (p == a[1] && q == a[0]) begin  
            if (Ai == Bi)
            begin
                // si los bits son iguales, próximo estado a 
                P = a[1];
                Q = a[0];
            end 
            else if (Ai > Bi)
            begin
                // si AB=10, próximo estado b
                P = b[1];
                Q = b[0];
            end 
            else if (Ai < Bi)
            begin
                // si AB=01, próximo estado c
                P = c[1];
                Q = c[0];
            end 
        end
        // estado presente b
        else if (p == b[1] && q == b[0]) begin 
            // el próximo estado siempre es b con estado presente b
            P = b[1];
            Q = b[0];
        end 

        // estado presente c 
        else if (p == c[1] && q == c[0]) begin 
            // el próximo estado siempre es c con estado presente c
            P = c[1];
            Q = c[0];
        end 
    end
endmodule