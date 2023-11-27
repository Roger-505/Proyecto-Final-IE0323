/* Definición de módulo para la celda típica de la 
   red iterativa analizando las palabras de derecha a izquierda
   modo conductual*/
   
module celdaTipicaDerIzq (
    input p, Ai, Bi,
    output reg P
); 

    //asignacion de estados a=1, b=0
    reg a = 1'b1;
    reg b = 1'b0;

    always @(p or Ai or Bi) begin // always cada vez que p, Ai o Bi cambien se ejecuta lo siguiente segun corresponda
                                 // Y asi cambiar el proximo estado P, segun el estado actual p y A y B. 
        
        if (Ai <= Bi && p == a) P = a;

        else if (Ai > Bi && p == a) P=b;
        
        else if (Ai >= Bi && p == b) P=b;

        else if (Ai < Bi && p == b) P=a; 

    end
endmodule