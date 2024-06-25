module SEA_ALGORITHM_TB;

    reg clk;
    reg reset;
    reg data_rdy;
    reg [255:0] data_in;
    reg [255:0] key_in;
    wire [255:0] enc_data_final;
    wire [255:0] dec_data_final;
    wire enc_complete;
    wire dec_complete;
    reg [15:0] no_of_round;
    integer start_time, end_time;

    SEA_ALGORITHM SEA_ALGORITHM_INST (
        .clk(clk),
        .reset(reset),
        .data_rdy(data_rdy),
        .no_of_round(no_of_round),
        .enc_complete(enc_complete),
        .dec_complete(dec_complete),
        .enc_data_final(enc_data_final),
        .dec_data_final(dec_data_final),
        .data_in(data_in),
        .key_in(key_in)
    );

    initial begin
        clk = 0;
        reset = 0;
        data_rdy = 0;
        start_time = 0;
        end_time = 0;
    end

    always
        #20 clk = ~clk;

    initial begin
        #100 reset = 1;
        data_in = 256'h185;
        key_in = 256'h100;
        data_rdy = 1'b1;
        no_of_round = 16'd7;
        start_time = $time;  // Record the start time
    end

    always @(posedge clk) begin
        if (enc_complete && dec_complete && data_rdy) begin
            end_time = $time;  // Record the end time
            $display("INPUT DATA==%b", data_in);
            $display("ENCRYPT DATA==%b", enc_data_final);
            $display("DECRYPT DATA==%b", dec_data_final);
            $display("Time taken for encryption and decryption: %0d time units", end_time - start_time);
            #100 $finish;
        end
    end

endmodule




//1MB
 `timescale 1ns/1ps
/*module tb_SEA_ALGORITHM;

// Constants
localparam CHUNK_SIZE = 256;
localparam TOTAL_BITS = 8192;
localparam NUM_CHUNKS = TOTAL_BITS / CHUNK_SIZE;

// Clock and reset
reg clk;
reg reset;
reg data_rdy;

// Inputs
reg [255:0] data_in;
reg [255:0] key_in;
reg [15:0] no_of_round;

// Outputs
wire [255:0] enc_data_final;
wire [255:0] dec_data_final;
wire enc_complete;
wire dec_complete;

// Timing variables
reg [31:0] start_time, end_time;
reg [31:0] enc_time, dec_time;

// Buffer to hold original data for verification
reg [255:0] data_buffer [0:NUM_CHUNKS-1];

integer i;

// Instantiate the SEA_ALGORITHM module
SEA_ALGORITHM dut (
    .clk(clk),
    .reset(reset),
    .data_rdy(data_rdy),
    .data_in(data_in),
    .key_in(key_in),
    .no_of_round(no_of_round),
    .enc_data_final(enc_data_final),
    .dec_data_final(dec_data_final),
    .enc_complete(enc_complete),
    .dec_complete(dec_complete)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Initialize and provide inputs
initial begin
    // Initialize signals
    reset = 0;
    data_rdy = 0;
    data_in = 256'd0;
    key_in = 256'h1;
    no_of_round = 16'd1; // Example number of rounds, adjust as necessary
    
    // Apply reset
    #15 reset = 1;

    // Provide input data in chunks
    for (i = 0; i < NUM_CHUNKS; i = i + 1) begin
        @(posedge clk);
        data_rdy = 1;
        data_in = i; // Use random data for testing
        data_buffer[i] = data_in;
    end
    start_time = $time;
    // Wait for encryption to complete
  
    wait(enc_complete);
    end_time = $time;
    enc_time = end_time - start_time;
    $display("Encryption time: %0d ns", enc_time);
    $display("Encryption complete.");

    // Wait for decryption to complete
    start_time = $time;
    wait(dec_complete);
    end_time = $time;
    dec_time = end_time - start_time;
    $display("Decryption time: %0d ns", dec_time);
    $display("Decryption complete.");

    $display("Test completed.");
    $finish;
end
endmodule


    


*/
