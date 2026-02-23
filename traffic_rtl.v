module TrafficControl(
    input reset,	
    output reg [1:0] NS,   // North-South traffic lights (00: Red, 01: Green, 10: Yellow)
    output reg [1:0] EW,  // East-West traffic lights (00: Red, 01: Green, 10: Yellow)
	output reg REW,
	output reg GEW,
	output reg YEW,
	output reg RNS,
	output reg GNS,
	output reg YNS    );
	
	wire clk;
	//internal oscillator
	OSCH #("2.08") osc_int (
               .STDBY(1'b0),									 
               .OSC(clk),
               .SEDSTDBY());
	
	
    // State encoding
    parameter RED    = 2'b00;
    parameter GREEN  = 2'b01;
    parameter YELLOW = 2'b10;

    // Timing parameters (assuming clk is 1 Hz for simplicity)
    parameter GREEN_TIME  = 2;
    parameter YELLOW_TIME = 10;

    // State machine states
    parameter S_NS_GREEN  = 2'b00;
    parameter S_NS_YELLOW = 2'b01;
    parameter S_EW_GREEN  = 2'b10;
    parameter S_EW_YELLOW = 2'b11;

    reg [1:0] current_state, next_state;
    reg [3:0] timer;

    // State machine logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S_NS_GREEN;
            timer <= 0;
        end else begin
            if (timer == 0) begin
                case (current_state)
                    S_NS_GREEN: timer <= GREEN_TIME;
                    S_NS_YELLOW: timer <= YELLOW_TIME;
                    S_EW_GREEN: timer <= GREEN_TIME;
                    S_EW_YELLOW: timer <= YELLOW_TIME;
                endcase
                current_state = next_state;
            end else begin
                timer <= timer - 1;
            end
        end
    end


    // Next state logic
    always @(*) begin
        case (current_state)
            S_NS_GREEN: 
			if (timer == 0) next_state <= S_NS_YELLOW;
				else next_state <= current_state;
            S_NS_YELLOW: 
			if (timer == 0) next_state <= S_EW_GREEN; 
				else next_state <= current_state;
            S_EW_GREEN: 
			if (timer == 0) next_state <= S_EW_YELLOW; 
				else next_state <= current_state;
            S_EW_YELLOW: 
			if (timer == 0) next_state <= S_NS_GREEN; 
				else next_state <= current_state;
            default: next_state <= S_NS_GREEN;
        endcase
    end


    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            NS <= RED;
            EW <= RED;
        end else begin
            case (current_state)
                S_NS_GREEN: begin
                    NS <= GREEN;
                    EW <= RED;
                end
                S_NS_YELLOW: begin
                    NS <= YELLOW;
                    EW <= RED;
                end
                S_EW_GREEN: begin
                    NS <= RED;
                   EW <= GREEN;
                end
                S_EW_YELLOW: begin
                   NS <= RED;
                   EW <= YELLOW;
                end
                default: begin
                   NS <= RED;
                    EW <= RED;
                end
            endcase
        end
    end
	 //EW traffic lights to LED
always @(*) begin
	if (EW==2'b00)  REW<=1;
		else REW<=0;
	if (EW==2'b01) GEW<=1;
		else GEW<=0;
	if (EW==2'b10)  YEW<=1;
		else YEW<=0;
	end
	
	//NS traffic lights to LED
always @(*) begin
	if (NS==2'b00) RNS<=1;
		else RNS<=0;
	if (NS==2'b01) GNS<=1;
		else GNS<=0;
	if (NS==2'b10) YNS<=1;
		else YNS<=0;
	end

endmodule
