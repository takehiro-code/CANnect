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
Wire Wire Line
	1100 2800 1700 2800
Wire Wire Line
	4850 2800 4850 1750
Wire Wire Line
	4850 1650 5050 1650
Wire Wire Line
	5050 1750 4850 1750
Connection ~ 4850 1750
Wire Wire Line
	4850 1750 4850 1650
Wire Wire Line
	4850 2800 4850 3150
Wire Wire Line
	4850 3150 5050 3150
Connection ~ 4850 2800
Wire Wire Line
	5050 3150 5050 3250
Wire Wire Line
	4850 3150 4850 3250
Wire Wire Line
	4850 3250 5050 3250
Connection ~ 4850 3150
NoConn ~ 5050 3600
NoConn ~ 5050 3700
NoConn ~ 5050 2100
NoConn ~ 5050 2200
$Comp
L power:GND #PWR0102
U 1 1 5F96A5B0
P 6850 4000
F 0 "#PWR0102" H 6850 3750 50  0001 C CNN
F 1 "GND" H 6855 3827 50  0000 C CNN
F 2 "" H 6850 4000 50  0001 C CNN
F 3 "" H 6850 4000 50  0001 C CNN
	1    6850 4000
	1    0    0    -1  
$EndComp
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
F 5 "Kermet" H 3350 3350 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3350 3350 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 3350 3350 50  0001 C CNN "digikeypn"
	1    3350 3350
	1    0    0    -1  
$EndComp
$Comp
L 2828322:282832-2 J_PS_1
U 1 1 5F928400
P 5100 4700
F 0 "J_PS_1" V 5289 4828 60  0000 L CNN
F 1 "282832-2" V 5395 4828 60  0000 L CNN
F 2 "footprints:282832-2" H 5500 4640 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 5100 4700 60  0001 C CNN
F 4 "282832-2" H 5100 4700 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 5100 4700 50  0001 C CNN "Vendor"
F 6 "TE Connectivity AMP Connectors" H 5100 4700 50  0001 C CNN "Manufacturer"
F 7 "A113314-ND" H 5100 4700 50  0001 C CNN "digikeypn"
	1    5100 4700
	1    0    0    -1  
$EndComp
$Sheet
S 1750 4900 1550 450 
U 5FD5D295
F0 "Voltage Sense" 50
F1 "voltage_sense.sch" 50
F2 "Analog_Voltage" O R 3300 5150 50 
$EndSheet
Wire Wire Line
	3300 5150 4200 5150
Text HLabel 6000 5150 2    50   Output ~ 0
Analog_Voltage
Wire Wire Line
	1100 1400 1100 2800
Wire Wire Line
	3350 1400 3350 2800
Wire Wire Line
	6850 2050 6850 1900
Wire Wire Line
	6850 3550 6850 3400
Wire Wire Line
	6850 2500 6850 2350
Wire Wire Line
	6850 4000 6850 3850
$Comp
L power:GND #PWR0101
U 1 1 5F9698CD
P 6850 2500
F 0 "#PWR0101" H 6850 2250 50  0001 C CNN
F 1 "GND" H 6855 2327 50  0000 C CNN
F 2 "" H 6850 2500 50  0001 C CNN
F 3 "" H 6850 2500 50  0001 C CNN
	1    6850 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_PS_2
U 1 1 5F96965A
P 6850 2200
F 0 "C_PS_2" H 6965 2246 50  0000 L CNN
F 1 "4.7uF" H 6965 2155 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 6888 2050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 6850 2200 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 6850 2200 50  0001 C CNN "Part Name"
F 5 "Kermet" H 6850 2200 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 6850 2200 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 6850 2200 50  0001 C CNN "digikeypn"
	1    6850 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_PS_3
U 1 1 5F96938D
P 6850 3700
F 0 "C_PS_3" H 6965 3746 50  0000 L CNN
F 1 "4.7uF" H 6965 3655 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 6888 3550 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 6850 3700 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 6850 3700 50  0001 C CNN "Part Name"
F 5 "Kermet" H 6850 3700 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 6850 3700 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 6850 3700 50  0001 C CNN "digikeypn"
	1    6850 3700
	1    0    0    -1  
$EndComp
NoConn ~ 6450 3500
NoConn ~ 6450 2000
Connection ~ 6850 3400
Wire Wire Line
	7250 2600 7600 2600
Wire Wire Line
	7250 3400 7250 2600
Wire Wire Line
	6850 3400 7250 3400
Connection ~ 6850 1900
Wire Wire Line
	7250 2500 7600 2500
Wire Wire Line
	7250 1900 7250 2500
Wire Wire Line
	6850 1900 7250 1900
Wire Wire Line
	6850 1900 6850 1650
Wire Wire Line
	6450 1900 6850 1900
Wire Wire Line
	6850 3400 6850 3150
Wire Wire Line
	6450 3400 6850 3400
$Comp
L power:+3.3V #PWR0113
U 1 1 5F9FE7BA
P 6850 3150
F 0 "#PWR0113" H 6850 3000 50  0001 C CNN
F 1 "+3.3V" H 6865 3323 50  0000 C CNN
F 2 "" H 6850 3150 50  0001 C CNN
F 3 "" H 6850 3150 50  0001 C CNN
	1    6850 3150
	1    0    0    -1  
$EndComp
$Sheet
S 5050 1550 1400 800 
U 5F9EA8B0
F0 "Voltage Regulator (5V)" 50
F1 "voltage_regulator_5v.sch" 50
F2 "Enable_Signal" I L 5050 1650 50 
F3 "Supply_Voltage" I L 5050 1750 50 
F4 "Sync_Signal" I L 5050 2100 50 
F5 "Fixed_5V" O R 6450 1900 50 
F6 "PGood" O R 6450 2000 50 
F7 "Spread_Spectrum_Enable" I L 5050 2200 50 
$EndSheet
$Sheet
S 5050 3050 1400 800 
U 5FF30350
F0 "Voltage Regulator (3.3V)" 50
F1 "voltage_regulator_3.3V.sch" 50
F2 "Enable_Signal" I L 5050 3150 50 
F3 "Supply_Voltage" I L 5050 3250 50 
F4 "Sync_Signal" I L 5050 3600 50 
F5 "3.3V" O R 6450 3400 50 
F6 "PGood" O R 6450 3500 50 
F7 "Spread_Spectrum_Enable" I L 5050 3700 50 
$EndSheet
$Comp
L 2828322:282832-2 J_PS_2
U 1 1 5F9327D0
P 7600 2500
F 0 "J_PS_2" V 7789 2628 60  0000 L CNN
F 1 "282832-2" V 7895 2628 60  0000 L CNN
F 2 "footprints:282832-2" H 8000 2440 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 7600 2500 60  0001 C CNN
F 4 "282832-2" H 7600 2500 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 7600 2500 50  0001 C CNN "Vendor"
F 6 "TE Connectivity AMP Connectors" H 7600 2500 50  0001 C CNN "Manufacturer"
F 7 "A113314-ND" H 7600 2500 50  0001 C CNN "digikeypn"
	1    7600 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5F9FC0C0
P 6850 1650
F 0 "#PWR0111" H 6850 1500 50  0001 C CNN
F 1 "+5V" H 6865 1823 50  0000 C CNN
F 2 "" H 6850 1650 50  0001 C CNN
F 3 "" H 6850 1650 50  0001 C CNN
	1    6850 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2800 4200 2800
Wire Wire Line
	4200 2800 4200 4700
Wire Wire Line
	4200 4700 5100 4700
Connection ~ 4200 2800
Wire Wire Line
	4200 2800 4850 2800
Wire Wire Line
	5100 4800 4200 4800
Wire Wire Line
	4200 4800 4200 5150
Connection ~ 4200 5150
Wire Wire Line
	4200 5150 6000 5150
$EndSCHEMATC
