/* Test becnh para red iterativa analizando
   las palabras de izquierda a derecha */

`timescale 1 ns/10 ps 

module red_tb (
    output Zout 
);
    localparam N = 4, period = 20;
    reg [N - 1:0] A; 
    reg [N - 1:0] B; 


    redIterativa  #(.N(N)) red1 (.A(A), .B(B), .Zout(Zout));

    initial 
        begin
            $dumpfile("red_tb.vcd");
            $dumpvars(0, red_tb);

            A = 4'b1010;
            B = 4'b0100;
            #period;

            A = 4'b0011;
            B = 4'b0100;
            #period;

            A = 4'b1000;
            B = 4'b0000;
            #period;

            A = 4'b0000;
            B = 4'b0000;
            #period;
        end
endmodule 