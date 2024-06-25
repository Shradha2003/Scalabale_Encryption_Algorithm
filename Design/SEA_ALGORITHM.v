module SEA_ALGORITHM(
input clk,
input reset,
input data_rdy,
input [255:0] data_in,
input [255:0] key_in,
input [15:0] no_of_round,
output  [255:0] enc_data_final,
output  [255:0] dec_data_final,
output  enc_complete,
output  dec_complete
);


wire [255:0] enc_data;
wire [255:0] key_gen_out;

reg [15:0] enc_count;
reg [15:0] dec_count;
reg [255:0] dec_data_in;
reg [255:0] data_in_t;
reg [255:0] key_in_t;
reg [255:0] key_in_de_t;
wire [255:0] dec_data_out;
reg [255:0] memkey [0:261];  // Properly index the array

assign enc_complete=enc_count==no_of_round+16'd1;
assign dec_complete=dec_count==16'd65535;

assign enc_data_final=(enc_complete)?enc_data:256'd0;
assign dec_data_final=(dec_complete)?dec_data_out:256'd0;

// Main state machine
always @(posedge clk) begin
    if (~reset) begin
        data_in_t <= 256'd0;
        key_in_t <= 256'd0;
        enc_count <= 16'd0;
        dec_count <= 16'd0;
        dec_data_in <= 256'd0;
        key_in_de_t <= 256'd0;
    end else if (data_rdy & enc_count==16'd0)
           begin
        
            data_in_t <= data_in;
            key_in_t <= key_in;
            enc_count <= enc_count+16'd1;
            dec_count <= no_of_round;
            memkey[0] <= key_in;
           end 
           else if (data_rdy & enc_count > 16'd0 & enc_count <= no_of_round) begin
            key_in_t <= key_gen_out;
            data_in_t <= enc_data;
            memkey[enc_count] <= key_gen_out;
            enc_count <= enc_count + 16'd1;
        end 
        else if (data_rdy & enc_count > no_of_round & dec_count == no_of_round) begin
            key_in_de_t <= memkey[dec_count];
            dec_data_in <= enc_data;
            dec_count <= dec_count - 16'd1;
        end else if (data_rdy & enc_count > no_of_round & dec_count >= 16'd0 & dec_count <= no_of_round) begin
            key_in_de_t <= memkey[dec_count];
            dec_data_in <= dec_data_out;
            dec_count <= dec_count - 16'd1;
        end
        else
        begin
        data_in_t<=data_in_t;
        key_in_t<=key_in_t;
        enc_count<=enc_count;
        dec_count<=dec_count;
        end
    end
// Instantiate submodules
Encryption Encryption_INST(
    .data_in(data_in_t),
    .key_in(key_in_t[127:0]),
    .data_out(enc_data)
);

Decryption Decryption_INST(
    .data_in(dec_data_in),
    .key_in(key_in_de_t[127:0]),
    .data_out(dec_data_out)
);

final_keygen inst_key(
    .key_in(key_in_t),
    .key_out(key_gen_out)
);

endmodule
