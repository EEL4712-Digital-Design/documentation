module SimpleLogic (
    input  logic A, B, C, D,
    output logic Z
);
    assign Z = (B & ~C) | ~A | D;
endmodule
