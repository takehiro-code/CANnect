EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 5 14
Title ""
Date "2020-10-18"
Rev "0.0.1"
Comp "CANtech"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1650 3700 0    50   BiDi ~ 0
K-Line
Text HLabel 1650 3800 0    50   BiDi ~ 0
L-Line
Text HLabel 2150 6050 0    50   BiDi ~ 0
HS_CAN_High
Text HLabel 2150 6200 0    50   BiDi ~ 0
HS_CAN_Low
Text HLabel 1500 2100 0    50   Input ~ 0
SW_CAN
Text HLabel 1550 2850 0    50   BiDi ~ 0
J1850_BUS+
Text HLabel 1550 2950 0    50   BiDi ~ 0
J1850_BUS-
Text HLabel 2150 5350 0    50   BiDi ~ 0
MS_CAN_High
Text HLabel 2150 5500 0    50   BiDi ~ 0
MS_CAN_Low
Text HLabel 5600 5950 0    50   Output ~ 0
STN2110_TX
Text HLabel 1800 3900 0    50   Input ~ 0
PWR_CTRL
$Sheet
S 2650 3650 1000 400 
U 5FA83833
F0 "ISO 9141/ISO 14230 Transceiver" 50
F1 "transceiver_iso9141.sch" 50
F2 "~ISO_RX~" O R 3650 3750 50 
F3 "~ISO_K_TX~" I R 3650 3850 50 
F4 "PWR_CTRL" I L 2650 3950 50 
F5 "~ISO_L_TX~" I R 3650 3950 50 
F6 "K-Line" B L 2650 3750 50 
F7 "L-Line" B L 2650 3850 50 
$EndSheet
$Sheet
S 2450 5550 1150 450 
U 5FAEE035
F0 "High Speed CAN Transceiver" 50
F1 "transceiver_can_hs.sch" 50
F2 "HS_CAN_High" B L 2450 5600 50 
F3 "HS_CAN_Low" B L 2450 5750 50 
F4 "~PWR_CTRL~" I L 2450 5900 50 
F5 "HS_CAN_TX" I R 3600 5750 50 
F6 "HS_CAN_RX" O R 3600 5600 50 
$EndSheet
Text HLabel 5600 6050 0    50   Input ~ 0
STN2110_RX
Text HLabel 1800 4050 0    50   Input ~ 0
~PWR_CTRL~
Wire Wire Line
	1800 3900 2100 3900
Wire Wire Line
	1650 3700 2100 3700
Wire Wire Line
	1650 3800 2100 3800
$Sheet
S 2500 4500 1150 500 
U 5FB34A7C
F0 "Medium Speed CAN Transceiver" 50
F1 "transceiver_can_ms.sch" 50
F2 "MS_CAN_High" B L 2500 4600 50 
F3 "MS_CAN_Low" B L 2500 4750 50 
F4 "~PWR_CTRL~" I L 2500 4850 50 
F5 "MS_CAN_TX" I R 3650 4600 50 
F6 "MS_CAN_RX" O R 3650 4750 50 
$EndSheet
$Sheet
S 2250 2050 1550 400 
U 5FB3FEAD
F0 "SAE J1850 VPW/PWM Transceiver" 50
F1 "transceiver_sae71850.sch" 50
F2 "~J1850_BUS+_VH~" I R 3800 2150 50 
F3 "J1850_BUS+_TX" O R 3800 2250 50 
F4 "J1850_BUS+" O L 2250 2150 50 
F5 "J1850_BUS-_TX" I R 3800 2350 50 
F6 "J1850_BUS-" O L 2250 2250 50 
$EndSheet
$Sheet
S 2250 2750 1450 400 
U 5FB4CA84
F0 "Comparator Transceiver" 50
F1 "transceiver_comparator.sch" 50
F2 "~ISO_RX~" O R 3700 2850 50 
F3 "K-Line" B L 2250 2850 50 
F4 "J1850_BUS+" I L 2250 2950 50 
F5 "J1850_BUS-" I L 2250 3050 50 
F6 "PWM_RX" O R 3700 2950 50 
F7 "VPW_RX" O R 3700 3050 50 
$EndSheet
$Sheet
S 2400 950  1300 500 
U 5FBCBEA5
F0 "Single Wire CAN Transceiver" 50
F1 "transceiver_sw_can.sch" 50
F2 "SW_CAN" B L 2400 1050 50 
F3 "SW_CAN_TX" I R 3700 1050 50 
F4 "SW_CAN_RX" O R 3700 1150 50 
F5 "SW_CAN_MODE0" I R 3700 1250 50 
F6 "SW_CAN_MODE1" I R 3700 1350 50 
F7 "SW_CAN_LOAD" B L 2400 1150 50 
$EndSheet
$Sheet
S 6400 2300 1800 1800
U 5FC0631B
F0 "OBDII Chip" 50
F1 "obdii_chip.sch" 50
$EndSheet
$EndSCHEMATC
