`timescale 1ns/1ps
module TrafficControl_tb;

    // Inputs
    
    reg reset;

    // Outputs
	
   wire [1:0] NS;
   wire [1:0] EW;

    TrafficControl dut (
        .reset(reset),
        .NS(NS),
        .EW(EW)
    );

    initial begin
        reset = 0;

        #200;
        reset = 1;
        #400;
        reset = 0;

     $monitor("Time: %d, NS: %b, EW: %b", $time, NS, EW);

        #300;
        $finish;
    end

endmodule
