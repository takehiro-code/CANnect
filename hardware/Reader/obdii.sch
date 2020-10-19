EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 5 9
Title ""
Date "2020-10-18"
Rev "0.0.1"
Comp "CANtech"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1250 1550 0    50   BiDi ~ 0
K-Line
Text HLabel 1250 1750 0    50   BiDi ~ 0
L-Line
Text HLabel 1250 800  0    50   BiDi ~ 0
HS_CAN_High
Text HLabel 1250 950  0    50   BiDi ~ 0
HS_CAN_Low
Text HLabel 1250 1100 0    50   Input ~ 0
SW_CAN
Text HLabel 1250 1250 0    50   BiDi ~ 0
J1850_BUS+
Text HLabel 1250 1400 0    50   BiDi ~ 0
J1850_BUS-
Text HLabel 1250 1900 0    50   BiDi ~ 0
MS_CAN_High
Text HLabel 1250 2050 0    50   BiDi ~ 0
MS_CAN_Low
Text HLabel 1250 2950 0    50   Output ~ 0
STN2110_TX
$Comp
L CANtech:STN2120 U??
U 1 1 5FA4C6F8
P 5800 2800
F 0 "U??" H 6000 2500 50  0000 L CNB
F 1 "STN2120" H 6000 2400 50  0000 L CNB
F 2 "" H 6100 2450 50  0000 C CNN
F 3 "https://www.scantool.net/scantool/downloads/206/stn21xx_ds_c.pdf" H 6000 2300 50  0000 L CNN
	1    5800 2800
	1    0    0    -1  
$EndComp
Text HLabel 1250 2250 0    50   Input ~ 0
PWR_CTRL
$Sheet
S 2350 1450 1000 400 
U 5FA83833
F0 "ISO 9141/ISO 14230 Transceiver" 50
F1 "transceiver_iso9141.sch" 50
F2 "~ISO_RX~" O R 3350 1550 50 
F3 "~ISO_K_TX~" I R 3350 1650 50 
F4 "PWR_CTRL" I L 2350 1750 50 
F5 "~ISO_L_TX~" I R 3350 1750 50 
F6 "K-Line" B L 2350 1550 50 
F7 "L-Line" B L 2350 1650 50 
$EndSheet
$Sheet
S 2350 750  1150 400 
U 5FAEE035
F0 "High Speed CAN Transceiver" 50
F1 "transceiver_can_hs.sch" 50
$EndSheet
Text HLabel 1250 3050 0    50   Input ~ 0
STN2110_RX
Wire Wire Line
	1250 3050 4500 3050
Wire Wire Line
	1250 2950 4500 2950
$EndSCHEMATC
