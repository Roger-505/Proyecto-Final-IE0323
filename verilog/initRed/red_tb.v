// Varias definiciones de módulos en un solo .v ??
//`include "XOR.v"

`timescale 1 ns/10 ps //porque 10ps???

module red_tb; 
    localparam N = 3, period = 20;
    reg [N - 1:0] A; // syntax error ???????
    reg [N - 1:0] B; 

    wire P2, Q2, P1, Q1, P0, Q0;
    reg pinit = 1b'0;
    reg qinit = 1b'1;
    
    // wire [N - 1:0] P, [N - 1:0] Q;

    // palabras de prueba
    //A = 3b'110;
    //B = 3b'101;


    celdaTipica C2 (.p(pinit), .q(qinit), .Ai(A[N - 1]), .Bi(B[N - 1]), .P(P2), .Q(Q2));

    celdaTipica C1 (.p(P2), .q(Q2), .Ai(A[N - 2]), .Bi(B[N - 2]), .P(P1), .Q(Q1));

    celdaTipica C0 (.p(P1), .q(Q1), .Ai(A[N - 3]), .Bi(B[N - 3]), .P(P0), .Q(Q0));

    initial 
        begin
            $dumpfile("red_tb.vcd");
            $dumpvars(1, red_tb); //porque se le pasa un 1 como parámetro ??
            A[N - 1] = 1; // 1b'1 ?????
            B[N - 1] = 1;

            #period;
            A[N - 2] = 1;
            B[N - 2] = 0;

            #period;
            A[N - 3] = 0;
            B[N - 3] = 1;

            #period;
        end
endmodule 