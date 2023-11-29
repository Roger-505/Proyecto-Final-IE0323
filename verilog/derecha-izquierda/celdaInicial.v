module celdaInicialDerIzq (
    input A0, B0,
    output Pinit
);
    reg a = 1'b1; //estado inicial 

    celdaTipicaDerIzq celdaInit (.p(a), .Ai(A0), .Bi(B0), .P(Pinit)); /* Evaluar celda típica en el estado inicial a: 1 */

endmodule