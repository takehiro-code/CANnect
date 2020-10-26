EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 15 19
Title "CANnect Reader | Power Supply"
Date "2020-10-25"
Rev "0.0.03"
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
Wire Wire Line
	3350 3200 3350 2800
Connection ~ 3350 2800
$Comp
L power:+5V #PWR0111
U 1 1 5F9FC0C0
P 5800 1650
F 0 "#PWR0111" H 5800 1500 50  0001 C CNN
F 1 "+5V" H 5815 1823 50  0000 C CNN
F 2 "" H 5800 1650 50  0001 C CNN
F 3 "" H 5800 1650 50  0001 C CNN
	1    5800 1650
	1    0    0    -1  
$EndComp
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
Text HLabel 6400 5200 2    50   Output ~ 0
Analog_Voltage
$Sheet
S 2150 4950 1550 450 
U 5FD5D295
F0 "Voltage Sense" 50
F1 "voltage_sense.sch" 50
F2 "Analog_Voltage" O R 3700 5200 50 
$EndSheet
Wire Wire Line
	3700 5200 6400 5200
$Comp
L 2828322:282832-2 J_PS_2
U 1 1 5F9327D0
P 6550 2500
F 0 "J_PS_2" V 6739 2628 60  0000 L CNN
F 1 "282832-2" V 6845 2628 60  0000 L CNN
F 2 "footprints:282832-2" H 6950 2440 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 6550 2500 60  0001 C CNN
F 4 "282832-2" H 6550 2500 50  0001 C CNN "Part Name"
	1    6550 2500
	1    0    0    -1  
$EndComp
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
	2300 1650 3350 1650
Connection ~ 3350 1650
Wire Wire Line
	1100 2800 1700 2800
Wire Wire Line
	3350 1650 3350 2800
$Sheet
S 4000 3050 1400 800 
U 5FF30350
F0 "Voltage Regulator (3.3V)" 50
F1 "voltage_regulator_3.3V.sch" 50
F2 "Enable_Signal" I L 4000 3150 50 
F3 "Supply_Voltage" I L 4000 3250 50 
F4 "Sync_Signal" I L 4000 3600 50 
F5 "3.3V" O R 5400 3400 50 
F6 "PGood" O R 5400 3500 50 
F7 "Spread_Spectrum_Enable" I L 4000 3700 50 
$EndSheet
$Sheet
S 4000 1550 1400 800 
U 5F9EA8B0
F0 "Voltage Regulator (5V)" 50
F1 "voltage_regulator_5v.sch" 50
F2 "Enable_Signal" I L 4000 1650 50 
F3 "Supply_Voltage" I L 4000 1750 50 
F4 "Sync_Signal" I L 4000 2100 50 
F5 "Fixed_5V" O R 5400 1900 50 
F6 "PGood" O R 5400 2000 50 
F7 "Spread_Spectrum_Enable" I L 4000 2200 50 
$EndSheet
$Comp
L power:+3.3V #PWR0113
U 1 1 5F9FE7BA
P 5800 3150
F 0 "#PWR0113" H 5800 3000 50  0001 C CNN
F 1 "+3.3V" H 5815 3323 50  0000 C CNN
F 2 "" H 5800 3150 50  0001 C CNN
F 3 "" H 5800 3150 50  0001 C CNN
	1    5800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3400 5800 3400
Wire Wire Line
	5800 3400 5800 3150
Wire Wire Line
	5400 1900 5800 1900
Wire Wire Line
	5800 1900 5800 1650
Wire Wire Line
	5800 1900 6200 1900
Wire Wire Line
	6200 1900 6200 2500
Wire Wire Line
	6200 2500 6550 2500
Connection ~ 5800 1900
Wire Wire Line
	5800 3400 6200 3400
Wire Wire Line
	6200 3400 6200 2600
Wire Wire Line
	6200 2600 6550 2600
Connection ~ 5800 3400
Wire Wire Line
	3800 2800 3800 1750
Wire Wire Line
	3800 1650 4000 1650
Wire Wire Line
	4000 1750 3800 1750
Connection ~ 3800 1750
Wire Wire Line
	3800 1750 3800 1650
Wire Wire Line
	3800 2800 3800 3150
Wire Wire Line
	3800 3150 4000 3150
Connection ~ 3800 2800
Wire Wire Line
	4000 3150 4000 3250
Wire Wire Line
	3800 3150 3800 3250
Wire Wire Line
	3800 3250 4000 3250
Connection ~ 3800 3150
NoConn ~ 4000 3600
NoConn ~ 4000 3700
NoConn ~ 4000 2100
NoConn ~ 4000 2200
NoConn ~ 5400 2000
NoConn ~ 5400 3500
$Comp
L Device:C C_PS_3
U 1 1 5F96938D
P 5800 3700
F 0 "C_PS_3" H 5915 3746 50  0000 L CNN
F 1 "4.7uF" H 5915 3655 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 5838 3550 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 5800 3700 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 5800 3700 50  0001 C CNN "Part Name"
	1    5800 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_PS_2
U 1 1 5F96965A
P 5800 2200
F 0 "C_PS_2" H 5915 2246 50  0000 L CNN
F 1 "4.7uF" H 5915 2155 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 5838 2050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 5800 2200 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 5800 2200 50  0001 C CNN "Part Name"
	1    5800 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F9698CD
P 5800 2500
F 0 "#PWR0101" H 5800 2250 50  0001 C CNN
F 1 "GND" H 5805 2327 50  0000 C CNN
F 2 "" H 5800 2500 50  0001 C CNN
F 3 "" H 5800 2500 50  0001 C CNN
	1    5800 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F96A5B0
P 5800 4000
F 0 "#PWR0102" H 5800 3750 50  0001 C CNN
F 1 "GND" H 5805 3827 50  0000 C CNN
F 2 "" H 5800 4000 50  0001 C CNN
F 3 "" H 5800 4000 50  0001 C CNN
	1    5800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4000 5800 3850
Wire Wire Line
	5800 2500 5800 2350
Wire Wire Line
	5800 3550 5800 3400
Wire Wire Line
	5800 2050 5800 1900
Wire Wire Line
	3350 2800 3800 2800
Wire Wire Line
	3350 3500 3350 4350
$Sheet
S 1700 2450 1500 750 
U 5F9AE5F2
F0 "Overvoltage Protection" 50
F1 "overvoltage_protection.sch" 50
F2 "Raw_Voltage" I L 1700 2800 50 
F3 "Protected_Voltage" O R 3200 2800 50 
$EndSheet
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
	2300 1800 2300 1650
$Comp
L 2828322:282832-2 J_PS_1
U 1 1 5F928400
P 2300 1800
F 0 "J_PS_1" V 2489 1928 60  0000 L CNN
F 1 "282832-2" V 2595 1928 60  0000 L CNN
F 2 "footprints:282832-2" H 2700 1740 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 2300 1800 60  0001 C CNN
F 4 "282832-2" H 2300 1800 50  0001 C CNN "Part Name"
	1    2300 1800
	0    1    1    0   
$EndComp
$EndSCHEMATC
