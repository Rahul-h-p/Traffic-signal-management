//-----------Traffic Control signal light---------------
module Traffic Control(input reset,
                       output reg [1:0] NS, EW, //NORTH-SOUTH and East-WEST traffic light (00: RED, 01:YELLOW, 10: GREEN)
                       output reg RNS, GNS, YNS, 
                       output reg REW, GEW, YEW,
                       output reg clk);
  parameter CLOCK_DIVIDER=2080000;
  reg [31:0] counter=0;
  reg divided_clock;

  //*******Internal Oscillator********
  defparam OSCJ_inst.NOM_FREQ="2.08";
  OSCJ OSCJ_inst(.STDBY(1'b0),
