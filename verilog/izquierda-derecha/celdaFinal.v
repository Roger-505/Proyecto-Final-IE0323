/* Definición de módulo para la celda final de la 
   red iterativa analizando las palabras de izquierda 
   a derecha */

module celdaFinalIzqDer(
    input pout, qout, A0, B0,
    output reg Zout
);

    //asignacion de estados a:01, b:10, c:11
    reg [1:0] a = 2'b01;
    reg [1:0] b = 2'b10;
    reg [1:0] c = 2'b11;

    always @(pout or qout or A0 or B0) begin 
        // always cada vez que pout, qout, A0 o B0 cambien se ejecuta lo siguiente segun corresponda
        // Y asi cambiar la salida Z
        
        // estado presente a
        if (pout == a[1] && qout == a[0]) begin  
            if (A0 == B0)
            begin
                // si los bits son iguales, Zout = 1
                Zout = 1;
            end 
            else if (A0 > B0)
            begin
                // si AB=10, Zout = 0
                Zout = 0;
            end 
            else if (A0 < B0)
            begin
                // si AB=01, Zout = 1
                Zout = 1;
            end 
        end
        // estado presente b
        else if (pout == b[1] && qout == b[0]) begin 
            // el próximo estado siempre es b con estado presente b, entonces Zout = 0
            Zout = 0;
        end 

        // estado presente c 
        else if (pout == c[1] && qout == c[0]) begin 
            // el próximo estado siempre es c con estado presente c, entonces Zout = 1
            Zout = 1;
        end 
    end

endmodule