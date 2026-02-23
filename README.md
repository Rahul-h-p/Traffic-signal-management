# Traffic-signal-management<br>
Author- Rahul H P <br>
DATE: 11/02/2026 <br>

<h2>Controlling of traffic signal light using LMX03LF 6900C FPGA</h2> 
<h3>FPGA Device Information</h3> 
<p>
  Voltage: 2.5V/3.3V<br>
  LUT: 6864<br> 
  Registers: 6864<br> 
  EBR Bits: 234K<br> 
  EBR Blocks: 26<br>
  Dis RAM: 54912<br>
  DSP: -<br>
  PLL: 2<br>
  DLL: 0<br>
  PCS: -<br>
  APIO: <br>
  PIO Cells: 336<br>
  PIO Pins: 207<br>
  Max Programmable IOs: 206<br>
</p>
<h3>MachX03LF Starter kit</h3>
<h6>Figure 1: Top view</h6><br>
<img width="435" height="324" alt="{2B1CA43B-8A27-4E01-8212-11462ADC1EEB}" src="https://github.com/user-attachments/assets/a36e23a7-40fd-4aef-88f7-c6f934a7c202" />
<p>LEDs allocated for user logic representation are D9,D8,D7,D6,D5,D4,D3. LED D2 is reserved for SED error.<br> Push button SW1 can be used as rest button.<br> USB mini-B Socket is used to connect to PC.</p>
<h3>On-chip Oscillator</h3>
<p>Every MachXO3L/LF device has an internal CMOS oscillator. The oscillator output can be routed as a clock to the clock
tree or as a reference clock to the sysCLOCK PLL using general routing resources. The oscillator frequency can be
divided by internal logic. There is a dedicated programming bit and a user input to enable/disable the oscillator. The
oscillator frequency ranges from 2.08 MHz to 133 MHz. The software default value of the Master Clock (MCLK) is
nominally 2.08 MHz.</p>
<h6>Table 1: Available MCLK Frequencies</h6>
<p><img width="563" height="127" alt="{09775338-1707-40E9-8617-9CD2E17E16B8}" src="https://github.com/user-attachments/assets/5540b0ca-f7dc-4b25-bf70-8d7b880c0707" />
</p>
<h3>References</h3>
<h4>MachX03 Family datasheet</h4> <p>https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/925/MachXO3_Family_DataSheet.pdf</p>
<h4>MachX03LF Starter Kit</h4> <p>[SEUMachXO3LFDemoUG115.pdf](https://github.com/user-attachments/files/25476480/SEUMachXO3LFDemoUG115.pdf)
</p>
