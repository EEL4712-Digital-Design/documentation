module SimpleLogic_tb;
    timeunit 1ns;
    timeprecision 1ps;

    logic A, B, C, D;
    logic Z;

    SimpleLogic dut (.A(A), .B(B), .C(C), .D(D), .Z(Z));

    initial begin
        {A, B, C, D} = 4'b0000;
        #10 A = 1'b1;
        #10 B = 1'b1;
        #10 C = 1'b1;
        #10 D = 1'b1;
        #10 $finish;
    end
endmodule
