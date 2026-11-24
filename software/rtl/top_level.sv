module top_level (
    input  logic [3:0] sw,
    output logic [0:0] leds
);
    SimpleLogic circuit (
        .A(sw[0]),
        .B(sw[1]),
        .C(sw[2]),
        .D(sw[3]),
        .Z(leds[0])
    );
endmodule
