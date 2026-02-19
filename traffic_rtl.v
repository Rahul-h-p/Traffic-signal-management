//-----------Traffic Control signal light---------------
module Traffic Control(input reset,
                       output reg [1:0] NS, EW, //NORTH-SOUTH and East-WEST traffic light (00: RED, 01:GREEN, 10: YELLOW)
                       output reg RNS, GNS, YNS, 
                       output reg REW, GEW, YEW
                      );
  
wire clk;
  //*******Internal Oscillator********
  OSCH #("2.08") osc_inst(.STDBY(1'b0),
                          .OSC(clk),
                          .SEDSTDBY());
