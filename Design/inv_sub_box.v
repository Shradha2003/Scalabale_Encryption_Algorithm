module inv_sub_box(input [3:0] data_in, output reg [3:0] data_out);

// Substitution logic for encryption can be implemented here

always @* begin
    case(data_in)
        4'b0000: data_out = 4'b1111; // Example substitution
        4'b0001: data_out = 4'b1110; // Example substitution
        4'b0010: data_out = 4'b1101; // Example substitution
        4'b0011: data_out = 4'b1100; // Example substitution
        4'b0100: data_out = 4'b1011; // Example substitution
        4'b0101: data_out = 4'b1010; // Example substitution
        4'b0110: data_out = 4'b1001; // Example substitution
        4'b0111: data_out = 4'b1000; // Example substitution
        4'b1000: data_out = 4'b0111; // Example substitution
        4'b1001: data_out = 4'b0110; // Example substitution
        4'b1010: data_out = 4'b0101; // Example substitution
        4'b1011: data_out = 4'b0100; // Example substitution
        4'b1100: data_out = 4'b0011; // Example substitution
        4'b1101: data_out = 4'b0010; // Example substitution
        4'b1110: data_out = 4'b0001; // Example substitution
        4'b1111: data_out = 4'b0000; // Example substitution
        default: data_out = 4'b0000; // Default output (you might want to change this)
    endcase
end

endmodule
