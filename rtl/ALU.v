module ALU(
    input [31:0] a,b,
    input [3:0] opcode,
    output reg [31:0] x,y
    );
always@ (*)
    begin
    x = 32'b0;
    y = 32'b0;
        case(opcode)
            4'd0: x[0] = |a;
            4'd1: x[0] = &a;
            4'd2: x[0] = ^a;
            4'd3: x = a & b;
            4'd4: x = a | b;
            4'd5: x = a ^ b;
            4'd6: x[0] = a > b;
            4'd7: x[0] = a < b;
            4'd8: x[0] = !a;
            4'd9: x[0] = a==b;
            4'd10: {y[0],x} = a + b;
            4'd11: x = a - b;
            4'd12: {y,x} = a * b;
            4'd13: x = a>>b[4:0];
            4'd14: x = a<<b[4:0];
            4'd15: x = ~a;
            default: $display("Error");
        endcase
    end
endmodule
