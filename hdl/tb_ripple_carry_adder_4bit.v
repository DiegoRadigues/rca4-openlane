`timescale 1ns/1ps

module tb_ripple_carry_adder_4bit;
    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;
    integer    i, j;
    reg  [4:0] expected;

    // DUT
    ripple_carry_adder_4bit DUT (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        // VCD (ouvre-le depuis hdl/)
        $dumpfile("rca.vcd");
        $dumpvars(0, tb_ripple_carry_adder_4bit);

        $display("  A   B  Cin | Cout  Sum  (= expected)");

        // init stable visible
        A=0; B=0; Cin=0; #10;

        // balaye TOUTES les combinaisons 16x16, Cin=0 puis Cin=1
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i; B = j; Cin = 0; #10;
                expected = i + j + 0;
                if ({Cout,Sum} !== expected) begin
                    $display("ERR: A=%0d B=%0d Cin=0 -> {%b,%b} != %0d", A,B,Cout,Sum,expected);
                    $fatal(1);
                end else begin
                    $display("%2d + %2d + 0 -> {%0d,%b} = %2d", A,B,Cout,Sum,expected);
                end

                A = i; B = j; Cin = 1; #10;
                expected = i + j + 1;
                if ({Cout,Sum} !== expected) begin
                    $display("ERR: A=%0d B=%0d Cin=1 -> {%b,%b} != %0d", A,B,Cout,Sum,expected);
                    $fatal(1);
                end else begin
                    $display("%2d + %2d + 1 -> {%0d,%b} = %2d", A,B,Cout,Sum,expected);
                end
            end
        end

        $display("All test cases passed ✅");
        $finish;
    end
endmodule
