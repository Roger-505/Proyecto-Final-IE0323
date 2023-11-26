`timescale 1 ns/10 ps 

module red_tb(
    reg [N - 1:0] A; 
    reg [N - 1:0] B; 
    output reg Z
); 
    localparam N = 4, period = 20;
    reg p0 = 1'b0;
    wire P2, P1, P;

  //Pruebas específicas.

    celdaTipica C2 (.p(pinit), .Ai(A[N - 1]), .Bi(B[N - 1]), .P(P2));

    celdaTipica C1 (.p(P2), .Ai(A[N - 2]), .Bi(B[N - 2]), .P(P1));

    celdaTipica C0 (.p(P1), .Ai(A[N - 3]), .Bi(B[N - 3]), .P(P0));


    celdaTipica C2 (.p(p0), .Ai(A[0]), .Bi(B[0]), .P(P1));

    celdaTipica C1 (.p(P1), .Ai(A[N-3]), .Bi(B[N -3]), .P(P2));

    celdaTipica C0 (.p(P2), .Ai(A[N - 2]), .Bi(B[N - 2]), .P(P));





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
