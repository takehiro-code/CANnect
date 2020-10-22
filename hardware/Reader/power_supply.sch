EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 18
Title "CANnect Reader | Power Supply"
Date "2020-10-20"
Rev "0.0.01"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: PS"
$EndDescr
$Comp
L power:GND #PWR0109
U 1 1 5F9CD91F
P 3350 4350
F 0 "#PWR0109" H 3350 4100 50  0001 C CNN
F 1 "GND" H 3355 4177 50  0000 C CNN
F 2 "" H 3350 4350 50  0001 C CNN
F 3 "" H 3350 4350 50  0001 C CNN
	1    3350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2800 3350 2800
$Comp
L Device:C C_PS_1
U 1 1 5F9D0FD9
P 3350 3350
F 0 "C_PS_1" H 3465 3396 50  0000 L CNN
F 1 "4.7uF" H 3465 3305 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 3388 3200 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 3350 3350 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 3350 3350 50  0001 C CNN "Part Name"
	1    3350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3200 3350 2800
$Sheet
S 4000 2450 1400 950 
U 5F9EA8B0
F0 "Voltage Regulator (5V)" 50
F1 "voltage_regulator_5v.sch" 50
F2 "Enable_Signal" I L 4000 2550 50 
F3 "Supply_Voltage" I L 4000 2650 50 
F4 "Sync_Signal" I L 4000 3000 50 
F5 "Fixed_5V" O R 5400 2800 50 
F6 "PGood" O R 5400 2900 50 
F7 "Spread_Spectrum_Enable" I L 4000 3100 50 
$EndSheet
Connection ~ 3350 2800
NoConn ~ 4000 3000
NoConn ~ 4000 3100
NoConn ~ 5400 2900
$Comp
L power:GND #PWR0110
U 1 1 5F9FBA67
P 5800 4350
F 0 "#PWR0110" H 5800 4100 50  0001 C CNN
F 1 "GND" H 5805 4177 50  0000 C CNN
F 2 "" H 5800 4350 50  0001 C CNN
F 3 "" H 5800 4350 50  0001 C CNN
	1    5800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5F9FC0C0
P 5800 1350
F 0 "#PWR0111" H 5800 1200 50  0001 C CNN
F 1 "+5V" H 5815 1523 50  0000 C CNN
F 2 "" H 5800 1350 50  0001 C CNN
F 3 "" H 5800 1350 50  0001 C CNN
	1    5800 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2800 5800 2800
Wire Wire Line
	5800 4350 5800 2800
Connection ~ 5800 2800
$Comp
L power:+3.3V #PWR0113
U 1 1 5F9FE7BA
P 8950 1350
F 0 "#PWR0113" H 8950 1200 50  0001 C CNN
F 1 "+3.3V" H 8965 1523 50  0000 C CNN
F 2 "" H 8950 1350 50  0001 C CNN
F 3 "" H 8950 1350 50  0001 C CNN
	1    8950 1350
	1    0    0    -1  
$EndComp
$Sheet
S 1700 2450 1500 750 
U 5F9AE5F2
F0 "Overvoltage Protection" 50
F1 "overvoltage_protection.sch" 50
F2 "Raw_Voltage" I L 1700 2800 50 
F3 "Protected_Voltage" O R 3200 2800 50 
$EndSheet
Wire Wire Line
	3350 2550 3350 2650
Wire Wire Line
	3350 2550 4000 2550
Wire Wire Line
	4000 2650 3350 2650
Connection ~ 3350 2650
Wire Wire Line
	3350 2650 3350 2800
$Comp
L power:+12V #PWR0121
U 1 1 5FA66599
P 3350 1400
F 0 "#PWR0121" H 3350 1250 50  0001 C CNN
F 1 "+12V" H 3365 1573 50  0000 C CNN
F 2 "" H 3350 1400 50  0001 C CNN
F 3 "" H 3350 1400 50  0001 C CNN
	1    3350 1400
	1    0    0    -1  
$EndComp
Connection ~ 3350 2550
$Comp
L CANtech:VRaw #V0102
U 1 1 5FD5C101
P 1100 1350
F 0 "#V0102" H 1100 1350 50  0001 C CNN
F 1 "VRaw" H 1158 1337 50  0000 L CNN
F 2 "" H 1100 1350 50  0001 C CNN
F 3 "" H 1100 1350 50  0001 C CNN
	1    1100 1350
	1    0    0    -1  
$EndComp
Text HLabel 8250 4900 2    50   Output ~ 0
Analog_Voltage
$Sheet
S 4000 4650 1550 450 
U 5FD5D295
F0 "Voltage Sense" 50
F1 "voltage_sense.sch" 50
F2 "Analog_Voltage" O R 5550 4900 50 
$EndSheet
$Sheet
S 6500 2450 1650 950 
U 5FF30350
F0 "Voltage Regulator (3.3V)" 50
F1 "voltage_regulator_3.3V.sch" 50
F2 "Enable_Signal" I L 6500 2550 50 
F3 "Supply_Voltage" I L 6500 2650 50 
F4 "Sync_Signal" I L 6500 3000 50 
F5 "3.3V" O R 8150 2800 50 
F6 "PGood" O R 8150 2900 50 
F7 "Spread_Spectrum_Enable" I L 6500 3100 50 
$EndSheet
Wire Wire Line
	5800 2800 5950 2800
Wire Wire Line
	5950 2800 5950 2650
Wire Wire Line
	5950 2550 6500 2550
Wire Wire Line
	6500 2650 5950 2650
Connection ~ 5950 2650
Wire Wire Line
	5950 2650 5950 2550
Wire Wire Line
	8150 2800 8950 2800
$Comp
L power:GND #PWR0106
U 1 1 5FF439F1
P 8950 4100
F 0 "#PWR0106" H 8950 3850 50  0001 C CNN
F 1 "GND" H 8955 3927 50  0000 C CNN
F 2 "" H 8950 4100 50  0001 C CNN
F 3 "" H 8950 4100 50  0001 C CNN
	1    8950 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4100 8950 2800
Connection ~ 8950 2800
Wire Wire Line
	5550 4900 8250 4900
$Comp
L 2828322:282832-2 J_PS_1
U 1 1 5F928400
P 2300 1800
F 0 "J_PS_1" V 2489 1928 60  0000 L CNN
F 1 "282832-2" V 2595 1928 60  0000 L CNN
F 2 "footprints:282832-2" H 2700 1740 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 2300 1800 60  0000 C CNN
F 4 "282832-2" V 2300 1800 50  0001 C CNN "Part Number"
F 5 "282832-2" H 2300 1800 50  0001 C CNN "Part Name"
	1    2300 1800
	0    1    1    0   
$EndComp
$Comp
L 2828322:282832-2 J_PS_2
U 1 1 5F9327D0
P 7300 1650
F 0 "J_PS_2" V 7489 1778 60  0000 L CNN
F 1 "282832-2" V 7595 1778 60  0000 L CNN
F 2 "footprints:282832-2" H 7700 1590 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 7300 1650 60  0000 C CNN
F 4 "282832-2" V 7300 1650 50  0001 C CNN "Part Number"
F 5 "282832-2" H 7300 1650 50  0001 C CNN "Part Name"
	1    7300 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 1550 7200 1550
Wire Wire Line
	7200 1550 7200 1650
Wire Wire Line
	7300 1650 7300 1550
Wire Wire Line
	7300 1550 8950 1550
Connection ~ 5800 1550
Wire Wire Line
	5800 1550 5800 2800
Connection ~ 8950 1550
Wire Wire Line
	8950 1550 8950 2800
Wire Wire Line
	5800 1350 5800 1550
Wire Wire Line
	8950 1350 8950 1550
Wire Wire Line
	3350 1400 3350 1650
Wire Wire Line
	1100 1400 1100 1650
Wire Wire Line
	2200 1800 2200 1650
Wire Wire Line
	2200 1650 1100 1650
Connection ~ 1100 1650
Wire Wire Line
	1100 1650 1100 2800
Wire Wire Line
	2300 1800 2300 1650
Wire Wire Line
	2300 1650 3350 1650
Connection ~ 3350 1650
Wire Wire Line
	3350 1650 3350 2550
Wire Wire Line
	3350 3500 3350 4350
Wire Wire Line
	1100 2800 1700 2800
$EndSCHEMATC
