module debouncer(
    input wire clk,
    input wire btn_in,
    output reg btn_out
);
    reg [19:0] counter;
    reg btn_prev;
    
    initial begin
        counter = 0;
        btn_prev = 0;
        btn_out = 0;
    end
    
    always @(posedge clk) begin
        if (btn_in != btn_prev) begin
            counter <= 0;
            btn_prev <= btn_in;
        end
        else if (counter < 1000000) begin  // 10ms debounce at 100MHz
            counter <= counter + 1;
        end
        else begin
            btn_out <= btn_prev;
        end
    end
endmodule

module single_digit_encoder(
    input wire clk,          // 100MHz clock
    input wire reset,        // BTN0 (debounced) - asynchronous reset
    input wire start,        // BTN1 (debounced) - starts encoding
    input wire [3:0] digit,  // 4-bit binary digit from switches
    output reg led,          // LED output for Morse code
    output wire state_led    // High when encoding is in progress
);
    // State encoding
    localparam IDLE            = 2'd0;
    localparam ENCODING_DIGIT = 2'd1;
    
    // Morse code look-up
    reg [4:0] morse_pattern;
    reg [2:0] pattern_length;
    
    // Timing constants (100MHz clock) - parameters for easy simulation override
    parameter DOT_CYCLES   = 100_000_000;   // 1 second ON
    parameter DASH_CYCLES  = 300_000_000;   // 3 seconds ON
    parameter SPACE_CYCLES = 50_000_000;    // 0.5 second OFF between elements
    
    // Internal registers
    reg [31:0] counter;           // general-purpose timer
    reg [2:0] current_element;    // which dot/dash we are sending
    reg [1:0] current_state;      // FSM state
    reg is_space;                 // flag: 0 = sending symbol, 1 = sending inter-element space
    reg start_prev;               // for rising edge detection
    reg [3:0] temp_digit;         // latched digit to be sent
    
    assign state_led = (current_state != IDLE);
    
    // Morse pattern generation (combinational)
    always @(*) begin
        case(temp_digit)
            4'd0: begin morse_pattern = 5'b00000; pattern_length = 5; end
            4'd1: begin morse_pattern = 5'b10000; pattern_length = 5; end
            4'd2: begin morse_pattern = 5'b11000; pattern_length = 5; end
            4'd3: begin morse_pattern = 5'b11100; pattern_length = 5; end
            4'd4: begin morse_pattern = 5'b11110; pattern_length = 5; end
            4'd5: begin morse_pattern = 5'b11111; pattern_length = 5; end
            4'd6: begin morse_pattern = 5'b01111; pattern_length = 5; end
            4'd7: begin morse_pattern = 5'b00111; pattern_length = 5; end
            4'd8: begin morse_pattern = 5'b00011; pattern_length = 5; end
            4'd9: begin morse_pattern = 5'b00001; pattern_length = 5; end
            default: begin morse_pattern = 5'b00000; pattern_length = 0; end
        endcase
    end
    
    // Sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            led <= 0;
            counter <= 0;
            current_element <= 0;
            current_state <= IDLE;
            is_space <= 0;
            start_prev <= 0;
            temp_digit <= 0;
        end
        else begin
            start_prev <= start;  // edge detection
            
            case (current_state)
                IDLE: begin
                    led <= 0;
                    // Rising edge on start stores the switch value and begins encoding
                    if (start && !start_prev) begin
                        temp_digit <= digit;
                        current_state <= ENCODING_DIGIT;
                        current_element <= 0;
                        counter <= 0;
                        is_space <= 0;
                    end
                end
                
                ENCODING_DIGIT: begin
                    if (current_element < pattern_length) begin
                        if (!is_space) begin
                            // Sending a dot or dash
                            led <= 1;
                            if (morse_pattern[pattern_length - 1 - current_element]) begin
                                // Dot: 1 second
                                if (counter >= DOT_CYCLES - 1) begin
                                    counter <= 0;
                                    if (current_element == pattern_length - 1) begin
                                        // Last element finished - go to IDLE, no trailing space
                                        current_state <= IDLE;
                                        led <= 0;
                                    end
                                    else begin
                                        is_space <= 1;   // go to inter-element space
                                    end
                                end
                                else begin
                                    counter <= counter + 1;
                                end
                            end
                            else begin
                                // Dash: 3 seconds
                                if (counter >= DASH_CYCLES - 1) begin
                                    counter <= 0;
                                    if (current_element == pattern_length - 1) begin
                                        current_state <= IDLE;
                                        led <= 0;
                                    end
                                    else begin
                                        is_space <= 1;
                                    end
                                end
                                else begin
                                    counter <= counter + 1;
                                end
                            end
                        end
                        else begin
                            // Inter-element space (0.5 second OFF)
                            led <= 0;
                            if (counter >= SPACE_CYCLES - 1) begin
                                counter <= 0;
                                is_space <= 0;
                                current_element <= current_element + 1;
                            end
                            else begin
                                counter <= counter + 1;
                            end
                        end
                    end
                    else begin
                        // Safety: if we ever get here, return to IDLE
                        led <= 0;
                        current_state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule

module morse_top_phase1(
    input wire clk,              // 100MHz on-board clock
    input wire btn0,             // BTN0 - Asynchronous reset
    input wire btn1,             // BTN1 - Start encoding
    input wire [3:0] switches,   // SW3-SW0 : digit in binary
    output wire led,             // LD0 - Morse output
    output wire state_led        // LD1 - High while encoding
);
    wire btn0_db, btn1_db;
    
    // Debounce the two pushbuttons
    debouncer db0 (.clk(clk), .btn_in(btn0), .btn_out(btn0_db));
    debouncer db1 (.clk(clk), .btn_in(btn1), .btn_out(btn1_db));
    
    // Single-digit Morse encoder
    single_digit_encoder encoder(
        .clk(clk),
        .reset(btn0_db),
        .start(btn1_db),
        .digit(switches),
        .led(led),
        .state_led(state_led)
    );
endmodule
