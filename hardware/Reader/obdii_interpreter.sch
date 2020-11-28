EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 12 17
Title "CANnect Reader | OBD-II Interpreter"
Date "2020-11-27"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: OBD"
$EndDescr
Text HLabel 1400 2500 0    50   BiDi ~ 0
K-Line
Text HLabel 1400 3250 0    50   BiDi ~ 0
L-Line
Text HLabel 1400 4600 0    50   BiDi ~ 0
HS_CAN_High
Text HLabel 1400 4700 0    50   BiDi ~ 0
HS_CAN_Low
Text HLabel 1400 1800 0    50   BiDi ~ 0
J1850_BUS+
Text HLabel 1400 1900 0    50   BiDi ~ 0
J1850_BUS-
Text HLabel 1400 5950 0    50   Output ~ 0
STN2110_TX
$Sheet
S 2450 3050 1350 500 
U 5FA83833
F0 "ISO 9141/ISO 14230 Transceiver" 50
F1 "transceiver_iso9141.sch" 50
F2 "~ISO_K_TX~" I R 3800 3250 50 
F3 "PWR_CTRL" I L 2450 3450 50 
F4 "~ISO_L_TX~" I R 3800 3350 50 
F5 "K-Line" B L 2450 3150 50 
F6 "L-Line" B L 2450 3250 50 
$EndSheet
$Sheet
S 2450 4550 1350 450 
U 5FAEE035
F0 "High Speed CAN Transceiver" 50
F1 "transceiver_can_hs.sch" 50
F2 "HS_CAN_High" B L 2450 4600 50 
F3 "HS_CAN_Low" B L 2450 4700 50 
F4 "~PWR_CTRL~" I L 2450 4900 50 
F5 "HS_CAN_TX" I R 3800 4700 50 
F6 "HS_CAN_RX" O R 3800 4600 50 
$EndSheet
Text HLabel 1400 6050 0    50   Input ~ 0
STN2110_RX
$Sheet
S 2450 1700 1350 400 
U 5FB3FEAD
F0 "SAE J1850 VPW/PWM Transceiver" 50
F1 "transceiver_sae71850.sch" 50
F2 "~J1850_BUS+_VH~" I R 3800 1800 50 
F3 "J1850_BUS+_TX" O R 3800 1900 50 
F4 "J1850_BUS-_TX" I R 3800 2000 50 
F5 "J1850_BUS+" B L 2450 1800 50 
F6 "J1850_BUS-" B L 2450 1900 50 
$EndSheet
$Sheet
S 2450 2400 1350 400 
U 5FB4CA84
F0 "Comparator Transceiver" 50
F1 "transceiver_comparator.sch" 50
F2 "~ISO_RX~" O R 3800 2500 50 
F3 "K-Line" B L 2450 2500 50 
F4 "J1850_BUS+" I L 2450 2600 50 
F5 "J1850_BUS-" I L 2450 2700 50 
F6 "PWM_RX" O R 3800 2600 50 
F7 "VPW_RX" O R 3800 2700 50 
$EndSheet
Wire Wire Line
	1400 1800 1950 1800
Wire Wire Line
	2450 1900 2150 1900
Wire Wire Line
	1400 2500 1700 2500
Wire Wire Line
	1400 3250 2450 3250
Wire Wire Line
	1700 2500 1700 3150
Wire Wire Line
	1700 3150 2450 3150
Connection ~ 1700 2500
Wire Wire Line
	1700 2500 2450 2500
Wire Wire Line
	1950 1800 1950 2600
Wire Wire Line
	1950 2600 2450 2600
Connection ~ 1950 1800
Wire Wire Line
	1950 1800 2450 1800
Wire Wire Line
	2150 1900 2150 2700
Wire Wire Line
	2150 2700 2450 2700
Connection ~ 2150 1900
Wire Wire Line
	2150 1900 1400 1900
Wire Wire Line
	1400 4600 2450 4600
Wire Wire Line
	2450 4700 1400 4700
Wire Wire Line
	1400 5300 2150 5300
Wire Wire Line
	2450 4900 2150 4900
Wire Wire Line
	2150 4900 2150 5300
Text HLabel 1400 5850 0    50   Output ~ 0
~SLEEP_OBD~
Text HLabel 1400 3450 0    50   Input ~ 0
PWR_CTRL
Wire Wire Line
	1400 3450 2450 3450
Connection ~ 2150 5300
Text HLabel 1400 5300 0    50   Output ~ 0
~PWR_CTRL~
Wire Wire Line
	3800 2500 4200 2500
Wire Wire Line
	4200 2500 4200 3150
Wire Wire Line
	7300 4400 4350 4400
Wire Wire Line
	1400 5950 7300 5950
Wire Wire Line
	1400 6050 7300 6050
$Sheet
S 7300 800  1800 5800
U 5FC0631B
F0 "OBDII Chip" 50
F1 "obdii_chip.sch" 50
F2 "UART_TX" O L 7300 6050 50 
F3 "UART_RX" I L 7300 5950 50 
F4 "HS_CAN_TX" O L 7300 4700 50 
F5 "HS_CAN_RX" I L 7300 4600 50 
F6 "~OBD_ACT_LED~" O L 7300 4400 50 
F7 "~RESET_HW~" O L 7300 6400 50 
F8 "~HOST_ACT_LED~" O L 7300 4300 50 
F9 "STATUS_LED" O L 7300 4200 50 
F10 "RESET_SW" I L 7300 6300 50 
F11 "ANALOG_IN" I L 7300 6500 50 
F12 "~ISO_RX~" I L 7300 3150 50 
F13 "~VPW_RX~" I L 7300 2700 50 
F14 "~SLEEP~" I L 7300 5850 50 
F15 "PWM_RX" I L 7300 2600 50 
F16 "J1850_BUS+_TX" O L 7300 1900 50 
F17 "~J1850_BUS+_VH~" O L 7300 1800 50 
F18 "J1850_BUS-_TX" O L 7300 2000 50 
F19 "~PWR_CTRL~" O L 7300 5300 50 
F20 "~ISO_L_TX~" O L 7300 3350 50 
F21 "~ISO_K_TX~" O L 7300 3250 50 
$EndSheet
Wire Wire Line
	1400 6500 4750 6500
Text HLabel 1400 6400 0    50   Output ~ 0
~RESET_OBD_HW~
Text HLabel 1400 6300 0    50   Output ~ 0
RESET_OBD_SW
Text HLabel 1400 6500 0    50   Input ~ 0
Analog_Voltage
Wire Wire Line
	3800 4600 7300 4600
Wire Wire Line
	3800 4700 7300 4700
Wire Wire Line
	4200 3150 7300 3150
Wire Wire Line
	3800 3250 7300 3250
Wire Wire Line
	3800 3350 7300 3350
Wire Wire Line
	3800 2600 7300 2600
Wire Wire Line
	3800 2700 7300 2700
Wire Wire Line
	3800 1900 7300 1900
Wire Wire Line
	3800 2000 7300 2000
Wire Wire Line
	3800 1800 7300 1800
$Comp
L CANtech:Header_Pin_4 J_OBD_2
U 1 1 5FCDCC00
P 5450 6750
F 0 "J_OBD_2" H 5728 6558 50  0000 L CNN
F 1 "Header_Pin_4" H 5450 6750 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5450 6750 50  0001 C CNN
F 3 "" H 5450 6750 50  0001 C CNN
	1    5450 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 6800 5250 5300
Wire Wire Line
	5350 6800 5350 5850
Wire Wire Line
	5550 6800 5550 6300
Wire Wire Line
	5650 6400 5650 6800
Connection ~ 5250 5300
Wire Wire Line
	5250 5300 7300 5300
Connection ~ 5350 5850
Wire Wire Line
	5350 5850 7300 5850
Connection ~ 5550 6300
Wire Wire Line
	5550 6300 7300 6300
Connection ~ 5650 6400
Wire Wire Line
	5650 6400 7300 6400
Wire Wire Line
	1400 5850 5350 5850
Wire Wire Line
	2150 5300 5250 5300
Wire Wire Line
	1400 6300 5550 6300
Wire Wire Line
	1400 6400 5650 6400
Wire Wire Line
	4450 4200 7300 4200
Wire Wire Line
	4650 4300 7300 4300
Wire Wire Line
	4650 4300 4650 6800
Wire Wire Line
	4450 6800 4450 4200
Wire Wire Line
	4350 6800 4350 4400
$Comp
L CANtech:Header_Pin_4 J_OBD_1
U 1 1 5FCEC5FD
P 4550 6750
F 0 "J_OBD_1" H 4828 6558 50  0000 L CNN
F 1 "Header_Pin_4" H 4550 6750 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4550 6750 50  0001 C CNN
F 3 "" H 4550 6750 50  0001 C CNN
	1    4550 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 6800 4750 6500
Connection ~ 4750 6500
Wire Wire Line
	4750 6500 7300 6500
Wire Notes Line
	2450 750  2450 1250
Wire Notes Line
	2450 1250 3800 1250
Wire Notes Line
	3800 1250 3800 750 
Wire Notes Line
	3800 750  2450 750 
Text Notes 2550 900  0    50   ~ 0
SW CAN Transceiver removed
Wire Notes Line
	2450 3750 2450 4250
Wire Notes Line
	2450 4250 3800 4250
Wire Notes Line
	3800 4250 3800 3750
Wire Notes Line
	3800 3750 2450 3750
Text Notes 2550 3900 0    50   ~ 0
MS CAN Transceiver removed
$EndSCHEMATC
