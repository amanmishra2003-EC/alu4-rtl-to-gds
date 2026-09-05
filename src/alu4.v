module alu4 (
    input        clk,
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] OP,
    output reg [3:0] Y,
    output reg       ZERO
);

always @(posedge clk) begin
    case (OP)
        3'b000: Y <= A + B;
        3'b001: Y <= A - B;
        3'b010: Y <= A & B;
        3'b011: Y <= A | B;
        3'b100: Y <= A ^ B;
        3'b101: Y <= ~A;
        default: Y <= 4'b0000;
    endcase

    if (Y == 4'b0000)
        ZERO <= 1'b1;
    else
        ZERO <= 1'b0;
end

endmodule
