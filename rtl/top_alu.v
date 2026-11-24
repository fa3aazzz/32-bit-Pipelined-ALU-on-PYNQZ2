module top_alu (
    input wire clk
    );

    wire [31:0] vio_a, vio_b, alu_x, alu_y;
    wire [3:0]  vio_opcode;
    
    reg [31:0] a_reg, b_reg, x_reg, y_reg;
    reg [3:0] opcode_reg;
    
    always @(posedge clk)
        begin
            a_reg <= vio_a;
            b_reg <= vio_b;
            opcode_reg <= vio_opcode;
            x_reg <= alu_x;
            y_reg <= alu_y;
        end

    ALU u_alu (
        .a(a_reg),
        .b(b_reg),
        .opcode(opcode_reg),
        .x(alu_x),
        .y(alu_y)
        );

    vio_0 u_vio (
        .clk(clk),
        .probe_out0(vio_a),
        .probe_out1(vio_b),
        .probe_out2(vio_opcode),
        .probe_in0(x_reg),
        .probe_in1(y_reg)
        );

endmodule
