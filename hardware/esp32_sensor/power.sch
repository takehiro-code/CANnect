EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "ESP32 Sensor Module | Power Supply"
Date "2020-11-24"
Rev "v0.0.2"
Comp "Created by Choong Jin Ng | jin3838@gmail.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: PW"
$EndDescr
$Comp
L BAT20JFILM:BAT20JFILM D_PW_2
U 1 1 5FB6CB70
P 2600 3550
F 0 "D_PW_2" H 2600 3777 50  0000 C CNN
F 1 "BAT20JFILM" H 2600 3686 50  0000 C CNN
F 2 "footprints:BAT20JFILM" H 2600 3550 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group1/81/a4/1f/0e/ca/8c/47/ba/CD00012201/files/CD00012201.pdf/jcr:content/translations/en.CD00012201.pdf" H 2600 3550 50  0001 L BNN
F 4 "DIO-11623" H 2600 3550 50  0001 L BNN "PROD_ID"
F 5 "" H 2600 3550 50  0001 L BNN "VALUE"
F 6 "DigiKey Canada" H 2600 3550 50  0001 C CNN "Vendor"
F 7 "STMicroelectronics" H 2600 3550 50  0001 C CNN "Manufacturer"
F 8 "BAT20JFILM" H 2600 3550 50  0001 C CNN "Part Name"
F 9 "497-3381-1-ND" H 2600 3550 50  0001 C CNN "Vendor Part Name"
	1    2600 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0101
U 1 1 5FB6F3E3
P 2300 2450
F 0 "#PWR0101" H 2300 2300 50  0001 C CNN
F 1 "+BATT" H 2315 2623 50  0000 C CNN
F 2 "" H 2300 2450 50  0001 C CNN
F 3 "" H 2300 2450 50  0001 C CNN
	1    2300 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_PW_3
U 1 1 5FB999E8
P 3900 4250
F 0 "C_PW_3" H 3785 4204 50  0000 R CNN
F 1 "1uF" H 3785 4295 50  0000 R CNN
F 2 "footprints:0603" H 3938 4100 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 3900 4250 50  0001 C CNN
F 4 "Kermet" H 3900 4250 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 3900 4250 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 3900 4250 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 3900 4250 50  0001 C CNN "Vendor Part Name"
	1    3900 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C_PW_4
U 1 1 5FB9A925
P 4400 4250
F 0 "C_PW_4" H 4285 4204 50  0000 R CNN
F 1 "0.1uF" H 4285 4295 50  0000 R CNN
F 2 "footprints:CAPC1608X90" H 4438 4100 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 4400 4250 50  0001 C CNN
F 4 "Yageo" H 4400 4250 50  0001 C CNN "Manufacturer"
F 5 "CC0603JRX7R8BB104" H 4400 4250 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 4400 4250 50  0001 C CNN "Vendor"
F 7 "311-1777-1-ND" H 4400 4250 50  0001 C CNN "Vendor Part Name"
	1    4400 4250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5FB9CCF4
P 3900 5200
F 0 "#PWR0102" H 3900 4950 50  0001 C CNN
F 1 "GND" H 3905 5027 50  0000 C CNN
F 2 "" H 3900 5200 50  0001 C CNN
F 3 "" H 3900 5200 50  0001 C CNN
	1    3900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5FB9D2E5
P 3400 5200
F 0 "#PWR0103" H 3400 4950 50  0001 C CNN
F 1 "GND" H 3405 5027 50  0000 C CNN
F 2 "" H 3400 5200 50  0001 C CNN
F 3 "" H 3400 5200 50  0001 C CNN
	1    3400 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5200 3900 4400
$Comp
L BAT20JFILM:BAT20JFILM D_PW_1
U 1 1 5FBA2994
P 1800 3550
F 0 "D_PW_1" H 1800 3777 50  0000 C CNN
F 1 "BAT20JFILM" H 1800 3686 50  0000 C CNN
F 2 "footprints:BAT20JFILM" H 1800 3550 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group1/81/a4/1f/0e/ca/8c/47/ba/CD00012201/files/CD00012201.pdf/jcr:content/translations/en.CD00012201.pdf" H 1800 3550 50  0001 L BNN
F 4 "DIO-11623" H 1800 3550 50  0001 L BNN "PROD_ID"
F 5 "" H 1800 3550 50  0001 L BNN "VALUE"
F 6 "DigiKey Canada" H 1800 3550 50  0001 C CNN "Vendor"
F 7 "STMicroelectronics" H 1800 3550 50  0001 C CNN "Manufacturer"
F 8 "BAT20JFILM" H 1800 3550 50  0001 C CNN "Part Name"
F 9 "497-3381-1-ND" H 1800 3550 50  0001 C CNN "Vendor Part Name"
	1    1800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4050 4400 4100
Wire Wire Line
	4400 4400 4400 5100
$Comp
L Device:C C_PW_1
U 1 1 5FC80FAE
P 2900 4250
F 0 "C_PW_1" H 2785 4204 50  0000 R CNN
F 1 "1uF" H 2785 4295 50  0000 R CNN
F 2 "footprints:0603" H 2938 4100 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 2900 4250 50  0001 C CNN
F 4 "Kermet" H 2900 4250 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 2900 4250 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 2900 4250 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 2900 4250 50  0001 C CNN "Vendor Part Name"
	1    2900 4250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FC8EA7A
P 2900 5200
F 0 "#PWR0104" H 2900 4950 50  0001 C CNN
F 1 "GND" H 2905 5027 50  0000 C CNN
F 2 "" H 2900 5200 50  0001 C CNN
F 3 "" H 2900 5200 50  0001 C CNN
	1    2900 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4400 2900 5200
$Comp
L power:VDD #PWR0105
U 1 1 5FC9DE63
P 3450 2450
F 0 "#PWR0105" H 3450 2300 50  0001 C CNN
F 1 "VDD" H 3465 2623 50  0000 C CNN
F 2 "" H 3450 2450 50  0001 C CNN
F 3 "" H 3450 2450 50  0001 C CNN
	1    3450 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PW_1
U 1 1 5FCA5D73
P 1350 4100
F 0 "R_PW_1" H 1409 4146 50  0000 L CNN
F 1 "10k" H 1409 4055 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 1350 4100 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 1350 4100 50  0001 C CNN
F 4 "Yageo" H 1350 4100 50  0001 C CNN "Manufacturer"
F 5 "RT0603FRE0710KL" H 1350 4100 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 1350 4100 50  0001 C CNN "Vendor"
F 7 "YAG2321CT-ND" H 1350 4100 50  0001 C CNN "Vendor Part Name"
	1    1350 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FCA653B
P 1350 4550
F 0 "#PWR0106" H 1350 4300 50  0001 C CNN
F 1 "GND" H 1355 4377 50  0000 C CNN
F 2 "" H 1350 4550 50  0001 C CNN
F 3 "" H 1350 4550 50  0001 C CNN
	1    1350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4000 1350 3550
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF Q_PW_1
U 1 1 5FCCF77B
P 2000 2950
F 0 "Q_PW_1" H 2430 3003 60  0000 L CNN
F 1 "IRLML5103TRPBF" H 2430 2897 60  0000 L CNN
F 2 "footprints:IRLML5103TRPBF" H 2450 2690 60  0001 C CNN
F 3 "https://www.infineon.com/dgdl/irlml5103pbf.pdf?fileId=5546d462533600a401535668505d2617" H 2000 2950 60  0001 C CNN
F 4 "DigiKey Canada" H 2000 2950 50  0001 C CNN "Vendor"
F 5 "Infineon Technologies" H 2000 2950 50  0001 C CNN "Manufacturer"
F 6 "IRLML5103TRPBF" H 2000 2950 50  0001 C CNN "Part Name"
F 7 "IRLML5103PBFCT-ND" H 2000 2950 50  0001 C CNN "Vendor Part Name"
	1    2000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3150 2300 3550
Wire Wire Line
	2300 3550 2500 3550
Wire Wire Line
	2300 3550 1900 3550
Connection ~ 2300 3550
Wire Wire Line
	1700 3550 1350 3550
Connection ~ 1350 3550
Wire Wire Line
	1350 3550 1350 2950
Wire Wire Line
	2000 2950 1350 2950
Connection ~ 1350 2950
Connection ~ 3450 3550
Wire Wire Line
	9650 3400 9650 3650
Connection ~ 9650 3650
$Comp
L BAT20JFILM:BAT20JFILM D_PW_3
U 1 1 5FBC7B36
P 9650 3300
F 0 "D_PW_3" V 9696 3210 50  0000 R CNN
F 1 "BAT20JFILM" V 9605 3210 50  0000 R CNN
F 2 "footprints:BAT20JFILM" H 9650 3300 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group1/81/a4/1f/0e/ca/8c/47/ba/CD00012201/files/CD00012201.pdf/jcr:content/translations/en.CD00012201.pdf" H 9650 3300 50  0001 L BNN
F 4 "DIO-11623" H 9650 3300 50  0001 L BNN "PROD_ID"
F 5 "" H 9650 3300 50  0001 L BNN "VALUE"
F 6 "DigiKey Canada" H 9650 3300 50  0001 C CNN "Vendor"
F 7 "STMicroelectronics" H 9650 3300 50  0001 C CNN "Manufacturer"
F 8 "BAT20JFILM" H 9650 3300 50  0001 C CNN "Part Name"
F 9 "497-3381-1-ND" H 9650 3300 50  0001 C CNN "Vendor Part Name"
	1    9650 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 5FBC3E26
P 9650 3050
F 0 "#PWR0107" H 9650 2900 50  0001 C CNN
F 1 "+3.3V" H 9665 3223 50  0000 C CNN
F 2 "" H 9650 3050 50  0001 C CNN
F 3 "" H 9650 3050 50  0001 C CNN
	1    9650 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5FBC26F8
P 9650 5200
F 0 "#PWR0108" H 9650 4950 50  0001 C CNN
F 1 "GND" H 9655 5027 50  0000 C CNN
F 2 "" H 9650 5200 50  0001 C CNN
F 3 "" H 9650 5200 50  0001 C CNN
	1    9650 5200
	1    0    0    -1  
$EndComp
Connection ~ 9100 3650
Wire Wire Line
	9650 3650 9650 3900
Wire Wire Line
	9100 3650 9650 3650
Wire Wire Line
	7700 4750 7950 4750
Connection ~ 7700 4750
Wire Wire Line
	7700 5200 7700 4750
$Comp
L power:GND #PWR0109
U 1 1 5FBBD9E3
P 7700 5200
F 0 "#PWR0109" H 7700 4950 50  0001 C CNN
F 1 "GND" H 7705 5027 50  0000 C CNN
F 2 "" H 7700 5200 50  0001 C CNN
F 3 "" H 7700 5200 50  0001 C CNN
	1    7700 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4750 7700 4750
Text Notes 7400 4900 0    50   ~ 0
Resistor divider to convert 5v to 3.3v
Wire Notes Line
	8950 3700 7350 3700
Wire Notes Line
	8950 4950 8950 3700
Wire Notes Line
	7350 4950 8950 4950
Wire Notes Line
	7350 3700 7350 4950
Connection ~ 8650 3650
Wire Wire Line
	9100 3650 9100 3850
Wire Wire Line
	8650 3650 9100 3650
Wire Wire Line
	4950 5100 9100 5100
Wire Wire Line
	9100 5100 9100 4150
Wire Wire Line
	7950 4750 7950 4600
Wire Wire Line
	7450 4600 7450 4750
Wire Wire Line
	7700 4100 7700 4250
Connection ~ 7700 4100
Wire Wire Line
	8000 4100 7700 4100
Wire Wire Line
	8650 4100 8200 4100
Wire Wire Line
	8650 3650 8650 4100
Wire Wire Line
	6700 3650 8650 3650
Wire Wire Line
	7700 4250 7950 4250
Wire Wire Line
	7950 4250 7950 4400
Connection ~ 7700 4250
Wire Wire Line
	7700 3550 7700 4100
Wire Wire Line
	7450 4250 7700 4250
Wire Wire Line
	7700 3550 6700 3550
Wire Wire Line
	7450 4400 7450 4250
$Comp
L Device:L L_PW_1
U 1 1 5FBB0C68
P 9100 4000
F 0 "L_PW_1" H 9153 4046 50  0000 L CNN
F 1 "4.7uH" H 9153 3955 50  0000 L CNN
F 2 "footprints:CV201210-4R7K" H 9100 4000 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/CV201210.pdf" H 9100 4000 50  0001 C CNN
F 4 "Bourns Inc." H 9100 4000 50  0001 C CNN "Manufacturer"
F 5 "CV201210-4R7K" H 9100 4000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 9100 4000 50  0001 C CNN "Vendor"
F 7 "CV201210-4R7KCT-ND" H 9100 4000 50  0001 C CNN "Vendor Part Name"
	1    9100 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PW_4
U 1 1 5FBACEEE
P 8100 4100
F 0 "R_PW_4" V 7904 4100 50  0000 C CNN
F 1 "115k" V 7995 4100 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 8100 4100 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 8100 4100 50  0001 C CNN
F 4 "Yageo" H 8100 4100 50  0001 C CNN "Manufacturer"
F 5 "RT0402DRE07115KL" H 8100 4100 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 8100 4100 50  0001 C CNN "Vendor"
F 7 "311-2218-1-ND" H 8100 4100 50  0001 C CNN "Vendor Part Name"
	1    8100 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R_PW_3
U 1 1 5FBAC365
P 7950 4500
F 0 "R_PW_3" H 7891 4454 50  0000 R CNN
F 1 "100k" H 7891 4545 50  0000 R CNN
F 2 "footprints:RESC1608X55N" H 7950 4500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7950 4500 50  0001 C CNN
F 4 "Yageo" H 7950 4500 50  0001 C CNN "Manufacturer"
F 5 "RT0603DRE07100KL" H 7950 4500 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 7950 4500 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 7950 4500 50  0001 C CNN "Vendor Part Name"
	1    7950 4500
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R_PW_2
U 1 1 5FBAB9C1
P 7450 4500
F 0 "R_PW_2" H 7391 4454 50  0000 R CNN
F 1 "100k" H 7391 4545 50  0000 R CNN
F 2 "footprints:RESC1608X55N" H 7450 4500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7450 4500 50  0001 C CNN
F 4 "Yageo" H 7450 4500 50  0001 C CNN "Manufacturer"
F 5 "RT0603DRE07100KL" H 7450 4500 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 7450 4500 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 7450 4500 50  0001 C CNN "Vendor Part Name"
	1    7450 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 5100 4400 5100
Wire Wire Line
	4950 4250 4950 5100
Wire Wire Line
	5100 4250 4950 4250
NoConn ~ 5100 4650
Wire Wire Line
	5100 4050 4400 4050
NoConn ~ 5100 4350
NoConn ~ 5100 3750
Wire Wire Line
	4850 4150 4850 5200
Wire Wire Line
	5100 4150 4850 4150
$Comp
L power:GND #PWR0110
U 1 1 5FB9D73C
P 4850 5200
F 0 "#PWR0110" H 4850 4950 50  0001 C CNN
F 1 "GND" H 4855 5027 50  0000 C CNN
F 2 "" H 4850 5200 50  0001 C CNN
F 3 "" H 4850 5200 50  0001 C CNN
	1    4850 5200
	1    0    0    -1  
$EndComp
Connection ~ 6950 4150
Wire Wire Line
	6950 4050 6950 4150
Wire Wire Line
	6700 4050 6950 4050
Wire Wire Line
	6950 4150 6950 4250
Wire Wire Line
	6700 4150 6950 4150
$Comp
L power:GND #PWR0111
U 1 1 5FB7470B
P 6950 4250
F 0 "#PWR0111" H 6950 4000 50  0001 C CNN
F 1 "GND" H 6955 4077 50  0000 C CNN
F 2 "" H 6950 4250 50  0001 C CNN
F 3 "" H 6950 4250 50  0001 C CNN
	1    6950 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C_PW_5
U 1 1 5FB71E3B
P 9650 4000
F 0 "C_PW_5" H 9742 4046 50  0000 L CNN
F 1 "4.7uF" H 9742 3955 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 9650 4000 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 9650 4000 50  0001 C CNN
F 4 "Kermet" H 9650 4000 50  0001 C CNN "Manufacturer"
F 5 "C1206C475K3RACAUTO" H 9650 4000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 9650 4000 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 9650 4000 50  0001 C CNN "Vendor Part Name"
	1    9650 4000
	1    0    0    -1  
$EndComp
$Comp
L MAX25276ATCAVY:MAX25276ATCA_VY+ U_PW_1
U 1 1 5FB76385
P 5100 3550
F 0 "U_PW_1" H 5900 4043 60  0000 C CNN
F 1 "MAX25276ATCA_VY+" H 5900 3937 60  0000 C CNN
F 2 "footprints:MAX25276ATCAVY" H 5900 3790 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX20075-MAX25276.pdf" H 5900 3831 60  0001 C CNN
F 4 "Maxim Integrated" H 5100 3550 50  0001 C CNN "Manufacturer"
F 5 "DigiKey Canada" H 5100 3550 50  0001 C CNN "Vendor"
F 6 "" H 5100 3550 50  0001 C CNN "Vendor Part Number"
F 7 "MAX25276ATCA_VY+" H 5100 3550 50  0001 C CNN "Part Name"
F 8 "175-MAX25276ATCA/VY+-ND" H 5100 3550 50  0001 C CNN "Vendor Part Name"
	1    5100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3550 5100 3550
Connection ~ 4950 5100
Wire Wire Line
	5100 3950 3900 3950
Wire Wire Line
	3900 3950 3900 4100
$Comp
L Device:C_Small C_PW_2
U 1 1 5FDD78CA
P 3400 4250
F 0 "C_PW_2" H 3492 4296 50  0000 L CNN
F 1 "4.7uF" H 3492 4205 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 3400 4250 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 3400 4250 50  0001 C CNN
F 4 "Kermet" H 3400 4250 50  0001 C CNN "Manufacturer"
F 5 "C1206C475K3RACAUTO" H 3400 4250 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 3400 4250 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 3400 4250 50  0001 C CNN "Vendor Part Name"
	1    3400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5200 3400 4350
Wire Wire Line
	3400 4150 3400 3650
Wire Wire Line
	3400 3650 5100 3650
Wire Wire Line
	2700 3550 2900 3550
Connection ~ 2900 3550
Wire Wire Line
	2900 3550 3450 3550
$Comp
L power:VS #PWR0112
U 1 1 5FDE6D6A
P 1350 2450
F 0 "#PWR0112" H 1150 2300 50  0001 C CNN
F 1 "VS" H 1365 2623 50  0000 C CNN
F 2 "" H 1350 2450 50  0001 C CNN
F 3 "" H 1350 2450 50  0001 C CNN
	1    1350 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2450 3450 3550
Wire Wire Line
	2300 2450 2300 2600
Wire Wire Line
	1350 2450 1350 2600
Wire Wire Line
	1350 2600 1750 2600
Wire Wire Line
	1750 2600 1750 2200
Connection ~ 1350 2600
Wire Wire Line
	1350 2600 1350 2950
Wire Wire Line
	1850 2200 1850 2600
Wire Wire Line
	1850 2600 2300 2600
Connection ~ 2300 2600
Wire Wire Line
	2300 2600 2300 2750
$Comp
L CANtech:Header_Pin_2 J_PW_1
U 1 1 5FE20C72
P 1800 2150
F 0 "J_PW_1" H 1662 2050 50  0000 R CNN
F 1 "Header_Pin_2" H 1800 2150 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1800 2150 50  0001 C CNN
F 3 "" H 1800 2150 50  0001 C CNN
	1    1800 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 4200 1350 4300
Wire Wire Line
	2900 3550 2900 3900
$Comp
L CANtech:Header_Pin_2 J_PW_2
U 1 1 5FE32C19
P 2300 4550
F 0 "J_PW_2" H 2428 4458 50  0000 L CNN
F 1 "Header_Pin_2" H 2300 4550 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2300 4550 50  0001 C CNN
F 3 "" H 2300 4550 50  0001 C CNN
	1    2300 4550
	1    0    0    -1  
$EndComp
Connection ~ 2900 3900
Wire Wire Line
	2900 3900 2900 4100
Wire Wire Line
	2250 4300 1350 4300
Connection ~ 1350 4300
Wire Wire Line
	1350 4300 1350 4550
Wire Wire Line
	2250 4300 2250 4500
Wire Wire Line
	2350 4500 2350 3900
Wire Wire Line
	2350 3900 2900 3900
Wire Wire Line
	9650 4100 9650 5200
Wire Wire Line
	9650 3050 9650 3150
$Comp
L CANtech:Header_Pin_1 J_PW_3
U 1 1 5FE474CD
P 9200 3150
F 0 "J_PW_3" V 9027 3058 50  0000 C CNN
F 1 "Header_Pin_1" H 9200 3150 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 9200 3150 50  0001 C CNN
F 3 "" H 9200 3150 50  0001 C CNN
	1    9200 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 3150 9650 3150
Connection ~ 9650 3150
Wire Wire Line
	9650 3150 9650 3200
$EndSCHEMATC
