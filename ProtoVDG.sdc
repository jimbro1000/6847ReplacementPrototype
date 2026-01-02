## Generated SDC file "ProtoVDG.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

## DATE    "Mon Dec 29 16:08:34 2025"

##
## DEVICE  "EPM7128SLC84-10"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {pixel_clock} -period 279.365 -waveform { 0.000 139.682 } [get_ports {Clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {FSn}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {HSn}]
set_output_delay -clock [get_clocks {pixel_clock}] -min 1 [get_ports {FSn}]
set_output_delay -clock [get_clocks {pixel_clock}] -min 1 [get_ports {HSn}] -add_delay
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[0]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[1]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[2]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[3]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[4]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[5]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[6]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[7]}]
set_output_delay -clock [get_clocks {pixel_clock}] -max 2 [get_ports {RGB[8]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[0]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[1]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[2]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[3]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[4]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[5]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[6]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[7]}]
set_output_delay -add_delay  -clock [get_clocks {pixel_clock}] -min 1 [get_ports {RGB[8]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

