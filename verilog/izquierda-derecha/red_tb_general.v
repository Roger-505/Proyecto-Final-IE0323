/* Test becnh para red iterativa analizando
   las palabras de izquierda a derecha */

`timescale 1 ns /10 ps z

module red_tb (
    output Zout 
);
    localparam N = 3, period = 20; // justificar el period ????????????
    reg [N - 1:0] A;
    reg [N - 1:0] B;

    integer i = 0;
    integer j = 0;

    redIterativa  #(.N(N)) red1 (.A(A), .B(B), .Zout(Zout));

    initial 
        begin
            $dumpfile("red_tb.vcd");
            $dumpvars(0, red_tb);

            A = {N{1'b0}}; 
            B = {N{1'b0}};
            #period;

            for ( i = 0; i < 2**N ; i = i + 1)
            begin
                for ( j = 0; j < 2**N; j = j + 1)
                begin 
                    if (A > B && Zout == 0)
                    begin
                        $display("\n A = %b \n B = %b \n A > B y Zout = %b. Prueba exitosa\n", A, B, Zout); 
                    end 
                    else if (A <= B && Zout == 1)
                    begin
                        $display("\n A = %b \n B = %b \n A <= B y Zout = %b. Prueba exitosa\n", A, B, Zout); 
                    end 
                    else 
                    begin
                        $display("\n A = %b \n B = %b \n A <= B y Zout = %b. Prueba fallida\n", A, B, Zout); 
                    end 
                    B = B + 1;
                    if (j != 2**N - 1)
                    begin
                        #period;
                    end 
                end 
                A = A + 1; 
                if (i != 2**N - 1)
                begin
                    #period;
                end 
            end 
            $finish;
        end
endmodule 
