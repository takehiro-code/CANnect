EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 18 19
Title "CANnect Reader | Voltage Regulator (5V)"
Date "2020-10-27"
Rev "0.0.03"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: VR1"
$EndDescr
$Comp
L MAX25276ATCAVY:MAX25276ATCA_VY+ U_VR1
U 1 1 5F9ECE66
P 3800 2200
F 0 "U_VR1" H 4600 2587 60  0000 C CNN
F 1 "MAX25276ATCA_VY+" H 4600 2481 60  0000 C CNN
F 2 "footprints:MAX25276ATCA&slash_VY&plus_" H 4600 2440 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX20075-MAX25276.pdf" H 3800 2200 60  0000 C CNN
F 4 "MAX25276ATCA/VY+" H 3800 2200 50  0001 C CNN "Part Name"
F 5 "Maxim Integrated" H 3800 2200 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3800 2200 50  0001 C CNN "Vendor"
F 7 "175-MAX25276ATCA/VY+-ND" H 3800 2200 50  0001 C CNN "digikeypn"
	1    3800 2200
	1    0    0    -1  
$EndComp
Text HLabel 1800 1750 0    50   Input ~ 0
Enable_Signal
Text HLabel 1850 2300 0    50   Input ~ 0
Supply_Voltage
Text HLabel 1850 2500 0    50   Input ~ 0
Sync_Signal
Text HLabel 7450 2300 2    50   Output ~ 0
Fixed_5V
Text HLabel 7450 4150 2    50   Output ~ 0
PGood
Wire Wire Line
	5400 2300 6650 2300
$Comp
L power:GND #PWR0101
U 1 1 5F9EE541
P 5600 3000
F 0 "#PWR0101" H 5600 2750 50  0001 C CNN
F 1 "GND" H 5605 2827 50  0000 C CNN
F 2 "" H 5600 3000 50  0001 C CNN
F 3 "" H 5600 3000 50  0001 C CNN
	1    5600 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F9EE8B3
P 5950 4900
F 0 "#PWR0102" H 5950 4650 50  0001 C CNN
F 1 "GND" H 5955 4727 50  0000 C CNN
F 2 "" H 5950 4900 50  0001 C CNN
F 3 "" H 5950 4900 50  0001 C CNN
	1    5950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2700 5600 2700
Wire Wire Line
	5600 2700 5600 2800
Wire Wire Line
	5400 2800 5600 2800
Connection ~ 5600 2800
Wire Wire Line
	5600 2800 5600 3000
Wire Wire Line
	5400 2200 5950 2200
Wire Wire Line
	5950 4650 5950 4900
$Comp
L Device:C C_VR1_in1
U 1 1 5F9F0C9F
P 2750 2300
F 0 "C_VR1_in1" V 2498 2300 50  0000 C CNN
F 1 "4.7uF" V 2589 2300 50  0000 C CNN
F 2 "footprints:C1206C475K3RACAUTO" H 2788 2150 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 2750 2300 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 2750 2300 50  0001 C CNN "Part Name"
F 5 "Kermet" H 2750 2300 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 2750 2300 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 2750 2300 50  0001 C CNN "digikeypn"
	1    2750 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1750 3800 1750
Wire Wire Line
	3800 1750 3800 2200
Wire Wire Line
	1850 2300 2600 2300
Wire Wire Line
	2900 2300 3800 2300
Wire Wire Line
	1850 2500 3800 2500
Wire Wire Line
	3800 2500 3800 2400
Wire Wire Line
	3800 3300 3800 4150
Wire Wire Line
	3800 4150 7450 4150
$Comp
L Device:L L_VR1
U 1 1 5F9F2ADC
P 6650 2950
F 0 "L_VR1" H 6703 2996 50  0000 L CNN
F 1 "4.7uH" H 6703 2905 50  0000 L CNN
F 2 "footprints:CV201210-4R7K" H 6650 2950 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/CV201210.pdf" H 6650 2950 50  0001 C CNN
F 4 "CV201210-4R7K" H 6650 2950 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 6650 2950 50  0001 C CNN "Vendor"
F 6 "Bourns Inc." H 6650 2950 50  0001 C CNN "Manufacturer"
F 7 "CV201210-4R7KCT-ND" H 6650 2950 50  0001 C CNN "digikeypn"
	1    6650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2800 6650 2300
Connection ~ 6650 2300
Wire Wire Line
	6650 2300 7450 2300
$Comp
L Device:C C_VR1_BST1
U 1 1 5F9F38FF
P 2750 3350
F 0 "C_VR1_BST1" H 2865 3396 50  0000 L CNN
F 1 "0.1uF" H 2865 3305 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 2788 3200 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 2750 3350 50  0001 C CNN
F 4 "CC0603JRX7R8BB104" H 2750 3350 50  0001 C CNN "Part Name"
F 5 "Yageo" H 2750 3350 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 2750 3350 50  0001 C CNN "Vendor"
F 7 "311-1777-1-ND" H 2750 3350 50  0001 C CNN "digikeypn"
	1    2750 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0100
U 1 1 5F9F3DB1
P 3650 3450
F 0 "#PWR0100" H 3650 3200 50  0001 C CNN
F 1 "GND" H 3655 3277 50  0000 C CNN
F 2 "" H 3650 3450 50  0001 C CNN
F 3 "" H 3650 3450 50  0001 C CNN
	1    3650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2600 3800 2600
Wire Wire Line
	3650 3450 3650 2800
Wire Wire Line
	3650 2800 3800 2800
Wire Wire Line
	3800 2700 2750 2700
Wire Wire Line
	2750 2700 2750 3200
Wire Wire Line
	2750 3500 2750 3700
Wire Wire Line
	2750 3700 3300 3700
Wire Wire Line
	6650 3700 6650 3100
Wire Wire Line
	3800 2900 3300 2900
Wire Wire Line
	3300 2900 3300 3700
Connection ~ 3300 3700
Wire Wire Line
	3300 3700 6650 3700
Text HLabel 1800 3000 0    50   Input ~ 0
Spread_Spectrum_Enable
Wire Wire Line
	1800 3000 3800 3000
$Comp
L Device:C C_VR1_BIAS1
U 1 1 5F9EFBD6
P 5950 4500
F 0 "C_VR1_BIAS1" H 6065 4546 50  0000 L CNN
F 1 "1uF" H 6065 4455 50  0000 L CNN
F 2 "footprints:0603" H 5988 4350 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 5950 4500 50  0001 C CNN
F 4 "C0603C105K4RACTU" H 5950 4500 50  0001 C CNN "Part Name"
F 5 "Kermet" H 5950 4500 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 5950 4500 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 5950 4500 50  0001 C CNN "digikeypn"
	1    5950 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2200 5950 4000
Wire Wire Line
	2450 4000 5950 4000
Wire Wire Line
	2450 2600 2450 4000
Connection ~ 5950 4000
Wire Wire Line
	5950 4000 5950 4350
$EndSCHEMATC
