module tb_ALU;
    reg [31:0] a, b;
    reg [3:0]  opcode;
    wire [31:0] x, y;

    ALU dut (
        .a(a), .b(b),
        .opcode(opcode),
        .x(x), .y(y)
        );

    integer i;

    initial begin
        a = 32'h0000_000C;
        b = 32'h0000_0004;
        opcode = 4'd0;
        #20;

        for (i=0; i<16; i=i+1) begin
            opcode = i;
            #10;
        end

        $finish;
    end

endmodule
