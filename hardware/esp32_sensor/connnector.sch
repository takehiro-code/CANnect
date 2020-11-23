EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 5 5
Title "ESP32 Sensor Module | Connector"
Date "2020-11-23"
Rev "v0.0.1"
Comp "Created by Choong Jin Ng | jin3838@gmail.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: CN"
$EndDescr
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
$Comp
L power:GND #PWR0135
U 1 1 5FBBEB42
P 6350 3650
F 0 "#PWR0135" H 6350 3400 50  0001 C CNN
F 1 "GND" H 6355 3477 50  0000 C CNN
F 2 "" H 6350 3650 50  0001 C CNN
F 3 "" H 6350 3650 50  0001 C CNN
	1    6350 3650
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
	6200 2950 6200 2600
$Comp
L 1546931-2:1546931-2 H_CN_3
U 1 1 5FBBC0D8
P 7350 2700
F 0 "H_CN_3" H 7580 2796 50  0000 L CNN
F 1 "1546931-2" H 7580 2705 50  0000 L CNN
F 2 "footprints:1546931-2" H 7350 2700 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 7350 2700 50  0001 L BNN
F 4 "1546931-2" H 7350 2700 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 7350 2700 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 7350 2700 50  0001 C CNN "Vendor"
F 7 "" H 7350 2700 50  0001 C CNN "digikeypn"
F 8 "A97965-ND" H 7350 2700 50  0001 C CNN "Vendor Part Name"
	1    7350 2700
	1    0    0    -1  
$EndComp
$Comp
L 1546931-2:1546931-2 H_CN_4
U 1 1 5FBBC878
P 7350 3150
F 0 "H_CN_4" H 7580 3246 50  0000 L CNN
F 1 "1546931-2" H 7580 3155 50  0000 L CNN
F 2 "footprints:1546931-2" H 7350 3150 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 7350 3150 50  0001 L BNN
F 4 "1546931-2" H 7350 3150 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 7350 3150 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 7350 3150 50  0001 C CNN "Vendor"
F 7 "" H 7350 3150 50  0001 C CNN "digikeypn"
F 8 "A97965-ND" H 7350 3150 50  0001 C CNN "Vendor Part Name"
	1    7350 3150
	1    0    0    -1  
$EndComp
$Comp
L 1546931-2:1546931-2 H_CN_5
U 1 1 5FBBEB75
P 7350 3600
F 0 "H_CN_5" H 7580 3696 50  0000 L CNN
F 1 "1546931-2" H 7580 3605 50  0000 L CNN
F 2 "footprints:1546931-2" H 7350 3600 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 7350 3600 50  0001 L BNN
F 4 "1546931-2" H 7350 3600 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 7350 3600 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 7350 3600 50  0001 C CNN "Vendor"
F 7 "" H 7350 3600 50  0001 C CNN "digikeypn"
F 8 "A97965-ND" H 7350 3600 50  0001 C CNN "Vendor Part Name"
	1    7350 3600
	1    0    0    -1  
$EndComp
$Comp
L 1546931-2:1546931-2 H_CN_2
U 1 1 5FBBEFA2
P 4050 4050
F 0 "H_CN_2" V 3897 4280 50  0000 L CNN
F 1 "1546931-2" V 3988 4280 50  0000 L CNN
F 2 "footprints:1546931-2" H 4050 4050 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 4050 4050 50  0001 L BNN
F 4 "1546931-2" H 4050 4050 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 4050 4050 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 4050 4050 50  0001 C CNN "Vendor"
F 7 "" H 4050 4050 50  0001 C CNN "digikeypn"
F 8 "A97965-ND" H 4050 4050 50  0001 C CNN "Vendor Part Name"
	1    4050 4050
	0    1    1    0   
$EndComp
$Comp
L 1546931-2:1546931-2 H_CN_1
U 1 1 5FBC057F
P 3750 2650
F 0 "H_CN_1" V 3689 2520 50  0000 R CNN
F 1 "1546931-2" V 3598 2520 50  0000 R CNN
F 2 "footprints:1546931-2" H 3750 2650 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 3750 2650 50  0001 L BNN
F 4 "1546931-2" H 3750 2650 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 3750 2650 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 3750 2650 50  0001 C CNN "Vendor"
F 7 "" H 3750 2650 50  0001 C CNN "digikeypn"
F 8 "A97965-ND" H 3750 2650 50  0001 C CNN "Vendor Part Name"
	1    3750 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 3050 3650 3250
Wire Wire Line
	3650 3250 4550 3250
Wire Wire Line
	3750 3050 3750 3150
Wire Wire Line
	3750 3150 4550 3150
Wire Wire Line
	4050 3650 4050 3350
Wire Wire Line
	4050 3350 4550 3350
Wire Wire Line
	4150 3650 4150 3450
Wire Wire Line
	4150 3450 4550 3450
Wire Wire Line
	5950 3650 6350 3650
Wire Wire Line
	6950 2600 6200 2600
Connection ~ 6200 2600
Wire Wire Line
	6950 2700 6350 2700
Wire Wire Line
	6350 2700 6350 3650
Connection ~ 6350 3650
Wire Wire Line
	5950 3150 6950 3150
Wire Wire Line
	5950 3250 6550 3250
Wire Wire Line
	6550 3250 6550 3050
Wire Wire Line
	6550 3050 6950 3050
Wire Wire Line
	6700 3350 6700 3500
Wire Wire Line
	6700 3500 6950 3500
Wire Wire Line
	5950 3350 6700 3350
Wire Wire Line
	5950 3450 6600 3450
Wire Wire Line
	6600 3450 6600 3600
Wire Wire Line
	6600 3600 6950 3600
Wire Wire Line
	6200 2400 6200 2600
$EndSCHEMATC
