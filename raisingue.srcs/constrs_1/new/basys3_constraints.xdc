# Fichier de contraintes pour Basys 3 - LEDs
# Connecte le signal leds[7:0] aux 8 LEDs de la carte

## Horloge
#set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports { CLK }]; # Horloge 100MHz
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports {PCLOCK} ]
create_clock -add -name sysclk_pin -period 10.00 -waveform { 0 5 } [get_ports {PCLOCK} ]

## Bouton Reset

#set_property PACKAGE_PIN U18 [get_ports {Opcode[1]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {Opcode[1]}]
set_property PACKAGE_PIN W19 [get_ports {IRST}]
	set_property IOSTANDARD LVCMOS33 [get_ports {IRST}]
#set_property -dict { PACKAGE_PIN R2  IOSTANDARD LVCMOS33 } [get_ports { RST }]; # Bouton Reset (BTNU)

# LEDs
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports { PC_out[0] }]; # LED0
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports { PC_out[1] }]; # LED1
set_property -dict { PACKAGE_PIN U19  IOSTANDARD LVCMOS33 } [get_ports { PC_out[2] }]; # LED2
set_property -dict { PACKAGE_PIN V19  IOSTANDARD LVCMOS33 } [get_ports { PC_out[3] }]; # LED3
set_property -dict { PACKAGE_PIN W18  IOSTANDARD LVCMOS33 } [get_ports { PC_out[4] }]; # LED4
set_property -dict { PACKAGE_PIN U15  IOSTANDARD LVCMOS33 } [get_ports { PC_out[5] }]; # LED5
set_property -dict { PACKAGE_PIN U14  IOSTANDARD LVCMOS33 } [get_ports { PC_out[6] }]; # LED6
set_property -dict { PACKAGE_PIN V14  IOSTANDARD LVCMOS33 } [get_ports { PC_out[7] }]; # LED7


set_property -dict { PACKAGE_PIN V13  IOSTANDARD LVCMOS33 } [get_ports { OUT0[0] }]; # LED0
set_property -dict { PACKAGE_PIN V3   IOSTANDARD LVCMOS33 } [get_ports { OUT0[1] }]; # LED1
set_property -dict { PACKAGE_PIN W3   IOSTANDARD LVCMOS33 } [get_ports { OUT0[2] }]; # LED2
set_property -dict { PACKAGE_PIN U3   IOSTANDARD LVCMOS33 } [get_ports { OUT0[3] }]; # LED3
set_property -dict { PACKAGE_PIN P3   IOSTANDARD LVCMOS33 } [get_ports { OUT0[4] }]; # LED4
set_property -dict { PACKAGE_PIN N3   IOSTANDARD LVCMOS33 } [get_ports { OUT0[5] }]; # LED5
set_property -dict { PACKAGE_PIN P1   IOSTANDARD LVCMOS33 } [get_ports { OUT0[6] }]; # LED6
set_property -dict { PACKAGE_PIN L1   IOSTANDARD LVCMOS33 } [get_ports { OUT0[7] }]; # LED7

#set_property PACKAGE_PIN V13 [get_ports {OUT0[0]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[0]}]
#set_property PACKAGE_PIN V3 [get_ports {OUT0[1]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[1]}]
#set_property PACKAGE_PIN W3 [get_ports {OUT0[2]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[2]}]
#set_property PACKAGE_PIN U3 [get_ports {OUT0[3]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[3]}]
#set_property PACKAGE_PIN P3 [get_ports {OUT0[4]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[4]}]
#set_property PACKAGE_PIN N3 [get_ports {OUT0[5]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[5]}]
#set_property PACKAGE_PIN P1 [get_ports {OUT0[6]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[6]}]
#set_property PACKAGE_PIN L1 [get_ports {OUT0[7]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {OUT0[7]}]

### PC LEDS
#set_property -dict { PACKAGE_PIN P1  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[0] }]; # LED0
#set_property -dict { PACKAGE_PIN N3  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[1] }]; # LED1
#set_property -dict { PACKAGE_PIN P3  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[2] }]; # LED2
#set_property -dict { PACKAGE_PIN U3  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[3] }]; # LED3
#set_property -dict { PACKAGE_PIN W3  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[4] }]; # LED4
#set_property -dict { PACKAGE_PIN V3  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[5] }]; # LED5
#set_property -dict { PACKAGE_PIN V13  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[6] }]; # LED6
##set_property -dict { PACKAGE_PIN V13  IOSTANDARD LVCMOS33 } [get_ports { pc_leds[7] }]; # LED7
#
### CLK LED
#set_property -dict { PACKAGE_PIN L1  IOSTANDARD LVCMOS33 } [get_ports { clk_led }]; # LED7
#
## Afficheurs 7 segments (seg[6:0] = {a,b,c,d,e,f,g})
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[6] }]; # a
set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[5] }]; # b
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[4] }]; # c
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[3] }]; # d
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[2] }]; # e
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[1] }]; # f
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports { ss_seg[0] }]; # g

## Anodes des afficheurs 7 segments
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports { ss_an[0] }]; # AN0 (droit)
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports { ss_an[1] }]; # AN1
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports { ss_an[2] }]; # AN2
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports { ss_an[3] }]; # AN3 (gauche)