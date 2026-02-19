//-----------Traffic Control signal light---------------
module Traffic Control(input reset,
                       output reg [1:0] NS, EW, //NORTH-SOUTH and East-WEST traffic light (00: RED, 01:YELLOW, 10: GREEN)
                       output reg RNS, GNS, YNS, 
                       output reg REW, GEW, YEW,
                       output reg clk);
  parameter
