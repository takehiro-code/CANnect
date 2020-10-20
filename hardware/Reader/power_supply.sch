EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 17
Title "CANnect Reader | Power Supply"
Date "2020-10-20"
Rev "0.0.1"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: PS"
$EndDescr
$Comp
L power:GND #PWR0109
U 1 1 5F9CD91F
P 3350 3200
F 0 "#PWR0109" H 3350 2950 50  0001 C CNN
F 1 "GND" H 3355 3027 50  0000 C CNN
F 2 "" H 3350 3200 50  0001 C CNN
F 3 "" H 3350 3200 50  0001 C CNN
	1    3350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1850 3350 1850
$Comp
L Device:C C_PS_1
U 1 1 5F9D0FD9
P 3350 2550
F 0 "C_PS_1" H 3465 2596 50  0000 L CNN
F 1 "4.7uF" H 3465 2505 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 3388 2400 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 3350 2550 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 3350 2550 50  0001 C CNN "Part Name"
	1    3350 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2400 3350 1850
Wire Wire Line
	3350 2700 3350 3200
$Sheet
S 4000 1500 1400 950 
U 5F9EA8B0
F0 "Voltage Regulator (5V)" 50
F1 "voltage_regulator_5v.sch" 50
F2 "Enable_Signal" I L 4000 1600 50 
F3 "Supply_Voltage" I L 4000 1700 50 
F4 "Sync_Signal" I L 4000 2050 50 
F5 "Fixed_5V" O R 5400 1850 50 
F6 "PGood" O R 5400 1950 50 
F7 "Spread_Spectrum_Enable" I L 4000 2150 50 
$EndSheet
Connection ~ 3350 1850
NoConn ~ 4000 2050
NoConn ~ 4000 2150
NoConn ~ 5400 1950
$Comp
L power:GND #PWR0110
U 1 1 5F9FBA67
P 5800 3200
F 0 "#PWR0110" H 5800 2950 50  0001 C CNN
F 1 "GND" H 5805 3027 50  0000 C CNN
F 2 "" H 5800 3200 50  0001 C CNN
F 3 "" H 5800 3200 50  0001 C CNN
	1    5800 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5F9FC0C0
P 5800 1400
F 0 "#PWR0111" H 5800 1250 50  0001 C CNN
F 1 "+5V" H 5815 1573 50  0000 C CNN
F 2 "" H 5800 1400 50  0001 C CNN
F 3 "" H 5800 1400 50  0001 C CNN
	1    5800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1850 5800 1850
Wire Wire Line
	5800 1850 5800 1400
Wire Wire Line
	5800 3200 5800 1850
Connection ~ 5800 1850
$Comp
L power:+3.3V #PWR0113
U 1 1 5F9FE7BA
P 8950 1450
F 0 "#PWR0113" H 8950 1300 50  0001 C CNN
F 1 "+3.3V" H 8965 1623 50  0000 C CNN
F 2 "" H 8950 1450 50  0001 C CNN
F 3 "" H 8950 1450 50  0001 C CNN
	1    8950 1450
	1    0    0    -1  
$EndComp
$Sheet
S 1700 1500 1500 750 
U 5F9AE5F2
F0 "Overvoltage Protection" 50
F1 "overvoltage_protection.sch" 50
F2 "Raw_Voltage" I L 1700 1850 50 
F3 "Protected_Voltage" O R 3200 1850 50 
$EndSheet
Wire Wire Line
	3350 1600 3350 1700
Wire Wire Line
	3350 1600 4000 1600
Wire Wire Line
	4000 1700 3350 1700
Connection ~ 3350 1700
Wire Wire Line
	3350 1700 3350 1850
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
Wire Wire Line
	3350 1600 3350 1400
Connection ~ 3350 1600
$Comp
L CANtech:VRaw #V0102
U 1 1 5FD5C101
P 1100 1500
F 0 "#V0102" H 1100 1500 50  0001 C CNN
F 1 "VRaw" H 1158 1487 50  0000 L CNN
F 2 "" H 1100 1500 50  0001 C CNN
F 3 "" H 1100 1500 50  0001 C CNN
	1    1100 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1550 1100 1850
Wire Wire Line
	1100 1850 1700 1850
Text HLabel 8250 3950 2    50   Output ~ 0
Analog_Voltage
$Sheet
S 4000 3700 1550 450 
U 5FD5D295
F0 "Voltage Sense" 50
F1 "voltage_sense.sch" 50
F2 "Analog_Voltage" O R 5550 3950 50 
$EndSheet
$Sheet
S 6500 1500 1650 950 
U 5FF30350
F0 "Voltage Regulator (3.3V)" 50
F1 "voltage_regulator_3.3V.sch" 50
F2 "Enable_Signal" I L 6500 1600 50 
F3 "Supply_Voltage" I L 6500 1700 50 
F4 "Sync_Signal" I L 6500 2050 50 
F5 "3.3V" O R 8150 1850 50 
F6 "PGood" O R 8150 1950 50 
F7 "Spread_Spectrum_Enable" I L 6500 2150 50 
$EndSheet
Wire Wire Line
	5800 1850 5950 1850
Wire Wire Line
	5950 1850 5950 1700
Wire Wire Line
	5950 1600 6500 1600
Wire Wire Line
	6500 1700 5950 1700
Connection ~ 5950 1700
Wire Wire Line
	5950 1700 5950 1600
Wire Wire Line
	8150 1850 8950 1850
Wire Wire Line
	8950 1850 8950 1450
$Comp
L power:GND #PWR0106
U 1 1 5FF439F1
P 8950 3150
F 0 "#PWR0106" H 8950 2900 50  0001 C CNN
F 1 "GND" H 8955 2977 50  0000 C CNN
F 2 "" H 8950 3150 50  0001 C CNN
F 3 "" H 8950 3150 50  0001 C CNN
	1    8950 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 3150 8950 1850
Connection ~ 8950 1850
Wire Wire Line
	5550 3950 8250 3950
$EndSCHEMATC
