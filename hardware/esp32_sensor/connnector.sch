EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 5
Title "ESP32 Sensor Module | Connector"
Date "2020-11-24"
Rev "v0.0.2"
Comp "Created by Choong Jin Ng | jin3838@gmail.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: CN"
$EndDescr
$Comp
L power:GND #PWR0135
U 1 1 5FBBEB42
P 6200 4350
F 0 "#PWR0135" H 6200 4100 50  0001 C CNN
F 1 "GND" H 6205 4177 50  0000 C CNN
F 2 "" H 6200 4350 50  0001 C CNN
F 3 "" H 6200 4350 50  0001 C CNN
	1    6200 4350
	1    0    0    -1  
$EndComp
$Comp
L power:VS #PWR0136
U 1 1 5FBBFB0D
P 6200 2400
F 0 "#PWR0136" H 6000 2250 50  0001 C CNN
F 1 "VS" H 6215 2573 50  0000 C CNN
F 2 "" H 6200 2400 50  0001 C CNN
F 3 "" H 6200 2400 50  0001 C CNN
	1    6200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2950 6200 2950
Wire Wire Line
	5950 3650 6200 3650
Wire Wire Line
	6200 3650 6200 4250
$Comp
L USB4110-GF-A:USB4110-GF-A U_CN_1
U 1 1 5FBBD3FA
P 5250 3250
F 0 "U_CN_1" H 5250 3817 50  0000 C CNN
F 1 "USB4110-GF-A" H 5250 3726 50  0000 C CNN
F 2 "footprints:USB4110-GF-A" H 5250 3250 50  0001 L BNN
F 3 "https://gct.co/files/drawings/usb4110.pdf" H 5250 3250 50  0001 L BNN
F 4 "A" H 5250 3250 50  0001 L BNN "PARTREV"
F 5 "Manufacturer Recommendations" H 5250 3250 50  0001 L BNN "STANDARD"
F 6 "" H 5250 3250 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 7 "" H 5250 3250 50  0001 L BNN "MANUFACTURER"
F 8 "PTS647SK38SMTR2LFS" H 5250 3250 50  0001 C CNN "Part Name"
F 9 "DigiKey Canada" H 5250 3250 50  0001 C CNN "Vendor"
F 10 "GCT" H 5250 3250 50  0001 C CNN "Manufacturer"
F 11 "2073-USB4110-GF-A-1-ND" H 5250 3250 50  0001 C CNN "Vendor Part Name"
	1    5250 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2400 6200 2500
$Comp
L CANtech:Header_Pin_1 J_CN_3
U 1 1 5FE4B70C
P 5950 2500
F 0 "J_CN_3" V 5777 2408 50  0000 C CNN
F 1 "Header_Pin_1" H 5950 2500 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5950 2500 50  0001 C CNN
F 3 "" H 5950 2500 50  0001 C CNN
	1    5950 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 2500 6200 2500
Connection ~ 6200 2500
Wire Wire Line
	6200 2500 6200 2950
Wire Wire Line
	6000 4250 6200 4250
Connection ~ 6200 4250
Wire Wire Line
	6200 4250 6200 4350
$Comp
L CANtech:Header_Pin_4 J_CN_1
U 1 1 5FE4E27B
P 3200 4050
F 0 "J_CN_1" H 3478 3883 50  0000 L CNN
F 1 "Header_Pin_4" H 3200 4050 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3200 4050 50  0001 C CNN
F 3 "" H 3200 4050 50  0001 C CNN
	1    3200 4050
	1    0    0    -1  
$EndComp
$Comp
L CANtech:Header_Pin_4 J_CN_2
U 1 1 5FE4E824
P 4050 4050
F 0 "J_CN_2" H 4328 3883 50  0000 L CNN
F 1 "Header_Pin_4" H 4050 4050 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4050 4050 50  0001 C CNN
F 3 "" H 4050 4050 50  0001 C CNN
	1    4050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2950 3000 2950
Wire Wire Line
	3000 2950 3000 4100
Wire Wire Line
	3100 4100 3100 3050
Wire Wire Line
	3100 3050 4550 3050
Wire Wire Line
	4550 3150 3300 3150
Wire Wire Line
	3300 3150 3300 4100
Wire Wire Line
	3400 4100 3400 3250
Wire Wire Line
	3400 3250 4550 3250
Wire Wire Line
	4550 3350 3850 3350
Wire Wire Line
	3850 3350 3850 4100
Wire Wire Line
	4550 3450 3950 3450
Wire Wire Line
	3950 3450 3950 4100
Wire Wire Line
	4150 4100 4150 3550
Wire Wire Line
	4150 3550 4550 3550
Wire Wire Line
	4550 3650 4250 3650
Wire Wire Line
	4250 3650 4250 4100
$Comp
L CANtech:Header_Pin_1 J_CN_4
U 1 1 5FE4BFA8
P 5950 4250
F 0 "J_CN_4" V 5777 4158 50  0000 C CNN
F 1 "Header_Pin_1" H 5950 4250 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5950 4250 50  0001 C CNN
F 3 "" H 5950 4250 50  0001 C CNN
	1    5950 4250
	0    1    1    0   
$EndComp
$EndSCHEMATC
