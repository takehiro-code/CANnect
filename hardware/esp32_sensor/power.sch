EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "ESP32 Sensor Module | Power Supply"
Date "2020-11-23"
Rev "v0.0.1"
Comp "Created by Choong Jin Ng | jin3838@gmail.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: PW"
$EndDescr
$Comp
L BAT20JFILM:BAT20JFILM D_PW_2
U 1 1 5FB6CB70
P 2150 3300
F 0 "D_PW_2" H 2150 3527 50  0000 C CNN
F 1 "BAT20JFILM" H 2150 3436 50  0000 C CNN
F 2 "footprints:BAT20JFILM" H 2150 3300 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group1/81/a4/1f/0e/ca/8c/47/ba/CD00012201/files/CD00012201.pdf/jcr:content/translations/en.CD00012201.pdf" H 2150 3300 50  0001 L BNN
F 4 "DIO-11623" H 2150 3300 50  0001 L BNN "PROD_ID"
F 5 "" H 2150 3300 50  0001 L BNN "VALUE"
F 6 "DigiKey Canada" H 2150 3300 50  0001 C CNN "Vendor"
F 7 "STMicroelectronics" H 2150 3300 50  0001 C CNN "Manufacturer"
F 8 "BAT20JFILM" H 2150 3300 50  0001 C CNN "Part Name"
F 9 "497-3381-1-ND" H 2150 3300 50  0001 C CNN "Vendor Part Name"
	1    2150 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0101
U 1 1 5FB6F3E3
P 1850 2200
F 0 "#PWR0101" H 1850 2050 50  0001 C CNN
F 1 "+BATT" H 1865 2373 50  0000 C CNN
F 2 "" H 1850 2200 50  0001 C CNN
F 3 "" H 1850 2200 50  0001 C CNN
	1    1850 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_PW_3
U 1 1 5FB999E8
P 3450 4000
F 0 "C_PW_3" H 3335 3954 50  0000 R CNN
F 1 "1uF" H 3335 4045 50  0000 R CNN
F 2 "footprints:0603" H 3488 3850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 3450 4000 50  0001 C CNN
F 4 "Kermet" H 3450 4000 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 3450 4000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 3450 4000 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 3450 4000 50  0001 C CNN "Vendor Part Name"
	1    3450 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:C C_PW_4
U 1 1 5FB9A925
P 3950 4000
F 0 "C_PW_4" H 3835 3954 50  0000 R CNN
F 1 "0.1uF" H 3835 4045 50  0000 R CNN
F 2 "footprints:CAPC1608X90" H 3988 3850 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 3950 4000 50  0001 C CNN
F 4 "Yageo" H 3950 4000 50  0001 C CNN "Manufacturer"
F 5 "CC0603JRX7R8BB104" H 3950 4000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 3950 4000 50  0001 C CNN "Vendor"
F 7 "311-1777-1-ND" H 3950 4000 50  0001 C CNN "Vendor Part Name"
	1    3950 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5FB9CCF4
P 3450 4950
F 0 "#PWR0102" H 3450 4700 50  0001 C CNN
F 1 "GND" H 3455 4777 50  0000 C CNN
F 2 "" H 3450 4950 50  0001 C CNN
F 3 "" H 3450 4950 50  0001 C CNN
	1    3450 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5FB9D2E5
P 2950 4950
F 0 "#PWR0103" H 2950 4700 50  0001 C CNN
F 1 "GND" H 2955 4777 50  0000 C CNN
F 2 "" H 2950 4950 50  0001 C CNN
F 3 "" H 2950 4950 50  0001 C CNN
	1    2950 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4950 3450 4150
$Comp
L BAT20JFILM:BAT20JFILM D_PW_1
U 1 1 5FBA2994
P 1350 3300
F 0 "D_PW_1" H 1350 3527 50  0000 C CNN
F 1 "BAT20JFILM" H 1350 3436 50  0000 C CNN
F 2 "footprints:BAT20JFILM" H 1350 3300 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group1/81/a4/1f/0e/ca/8c/47/ba/CD00012201/files/CD00012201.pdf/jcr:content/translations/en.CD00012201.pdf" H 1350 3300 50  0001 L BNN
F 4 "DIO-11623" H 1350 3300 50  0001 L BNN "PROD_ID"
F 5 "" H 1350 3300 50  0001 L BNN "VALUE"
F 6 "DigiKey Canada" H 1350 3300 50  0001 C CNN "Vendor"
F 7 "STMicroelectronics" H 1350 3300 50  0001 C CNN "Manufacturer"
F 8 "BAT20JFILM" H 1350 3300 50  0001 C CNN "Part Name"
F 9 "497-3381-1-ND" H 1350 3300 50  0001 C CNN "Vendor Part Name"
	1    1350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3800 3950 3850
Wire Wire Line
	3950 4150 3950 4850
$Comp
L 1546931-2:1546931-2 H_PW_1
U 1 1 5FC3A660
P 1400 1650
F 0 "H_PW_1" V 1339 1520 50  0000 R CNN
F 1 "1546931-2" V 1248 1520 50  0000 R CNN
F 2 "footprints:1546931-2" H 1400 1650 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 1400 1650 50  0001 L BNN
F 4 "1546931-2" H 1400 1650 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 1400 1650 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 1400 1650 50  0001 C CNN "Vendor"
F 7 "" H 1400 1650 50  0001 C CNN "digikeypn"
F 8 "" H 1400 1650 50  0001 C CNN "Vendor Part Number"
F 9 "A97965-ND" H 1400 1650 50  0001 C CNN "Vendor Part Name"
	1    1400 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1400 2300 1850 2300
Wire Wire Line
	1850 2300 1850 2200
Wire Wire Line
	1300 2300 900  2300
Wire Wire Line
	1300 2050 1300 2300
Wire Wire Line
	1400 2050 1400 2300
$Comp
L Device:C C_PW_1
U 1 1 5FC80FAE
P 2450 4000
F 0 "C_PW_1" H 2335 3954 50  0000 R CNN
F 1 "1uF" H 2335 4045 50  0000 R CNN
F 2 "footprints:0603" H 2488 3850 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 2450 4000 50  0001 C CNN
F 4 "Kermet" H 2450 4000 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 2450 4000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 2450 4000 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 2450 4000 50  0001 C CNN "Vendor Part Name"
	1    2450 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FC8EA7A
P 2450 4950
F 0 "#PWR0104" H 2450 4700 50  0001 C CNN
F 1 "GND" H 2455 4777 50  0000 C CNN
F 2 "" H 2450 4950 50  0001 C CNN
F 3 "" H 2450 4950 50  0001 C CNN
	1    2450 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 4150 2450 4950
$Comp
L power:VDD #PWR0105
U 1 1 5FC9DE63
P 3000 2200
F 0 "#PWR0105" H 3000 2050 50  0001 C CNN
F 1 "VDD" H 3015 2373 50  0000 C CNN
F 2 "" H 3000 2200 50  0001 C CNN
F 3 "" H 3000 2200 50  0001 C CNN
	1    3000 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PW_1
U 1 1 5FCA5D73
P 900 3850
F 0 "R_PW_1" H 959 3896 50  0000 L CNN
F 1 "10k" H 959 3805 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 900 3850 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 900 3850 50  0001 C CNN
F 4 "Yageo" H 900 3850 50  0001 C CNN "Manufacturer"
F 5 "RT0603FRE0710KL" H 900 3850 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 900 3850 50  0001 C CNN "Vendor"
F 7 "YAG2321CT-ND" H 900 3850 50  0001 C CNN "Vendor Part Name"
	1    900  3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FCA653B
P 900 4300
F 0 "#PWR0106" H 900 4050 50  0001 C CNN
F 1 "GND" H 905 4127 50  0000 C CNN
F 2 "" H 900 4300 50  0001 C CNN
F 3 "" H 900 4300 50  0001 C CNN
	1    900  4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4300 900  4050
Wire Wire Line
	900  3750 900  3300
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF Q_PW_1
U 1 1 5FCCF77B
P 1550 2700
F 0 "Q_PW_1" H 1980 2753 60  0000 L CNN
F 1 "IRLML5103TRPBF" H 1980 2647 60  0000 L CNN
F 2 "footprints:IRLML5103TRPBF" H 2000 2440 60  0001 C CNN
F 3 "https://www.infineon.com/dgdl/irlml5103pbf.pdf?fileId=5546d462533600a401535668505d2617" H 1550 2700 60  0001 C CNN
F 4 "DigiKey Canada" H 1550 2700 50  0001 C CNN "Vendor"
F 5 "Infineon Technologies" H 1550 2700 50  0001 C CNN "Manufacturer"
F 6 "IRLML5103TRPBF" H 1550 2700 50  0001 C CNN "Part Name"
F 7 "IRLML5103PBFCT-ND" H 1550 2700 50  0001 C CNN "Vendor Part Name"
	1    1550 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2500 1850 2300
Connection ~ 1850 2300
Wire Wire Line
	1850 2900 1850 3300
Wire Wire Line
	1850 3300 2050 3300
Wire Wire Line
	1850 3300 1450 3300
Connection ~ 1850 3300
Wire Wire Line
	1250 3300 900  3300
Connection ~ 900  3300
Wire Wire Line
	900  3300 900  2700
Wire Wire Line
	1550 2700 900  2700
Connection ~ 900  2700
Wire Wire Line
	900  2700 900  2300
Connection ~ 3000 3300
Wire Wire Line
	9200 4150 9200 3850
Connection ~ 9200 4150
Wire Wire Line
	9200 4150 10000 4150
Wire Wire Line
	9200 2850 9200 2800
Connection ~ 9200 2850
Wire Wire Line
	9200 2850 10000 2850
Wire Wire Line
	10000 3450 10000 4150
Wire Wire Line
	10000 2850 10000 3350
$Comp
L 1546931-2:1546931-2 H_PW_3
U 1 1 5FC32A45
P 10400 3450
F 0 "H_PW_3" H 10630 3546 50  0000 L CNN
F 1 "1546931-2" H 10630 3455 50  0000 L CNN
F 2 "footprints:1546931-2" H 10400 3450 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 10400 3450 50  0001 L BNN
F 4 "1546931-2" H 10400 3450 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 10400 3450 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 10400 3450 50  0001 C CNN "Vendor"
F 7 "" H 10400 3450 50  0001 C CNN "digikeypn"
F 8 "" H 10400 3450 50  0001 C CNN "Vendor Part Number"
F 9 "A97965-ND" H 10400 3450 50  0001 C CNN "Vendor Part Name"
	1    10400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3150 9200 3400
Wire Wire Line
	9200 2950 9200 2850
Connection ~ 9200 3400
$Comp
L BAT20JFILM:BAT20JFILM D_PW_3
U 1 1 5FBC7B36
P 9200 3050
F 0 "D_PW_3" V 9246 2960 50  0000 R CNN
F 1 "BAT20JFILM" V 9155 2960 50  0000 R CNN
F 2 "footprints:BAT20JFILM" H 9200 3050 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group1/81/a4/1f/0e/ca/8c/47/ba/CD00012201/files/CD00012201.pdf/jcr:content/translations/en.CD00012201.pdf" H 9200 3050 50  0001 L BNN
F 4 "DIO-11623" H 9200 3050 50  0001 L BNN "PROD_ID"
F 5 "" H 9200 3050 50  0001 L BNN "VALUE"
F 6 "DigiKey Canada" H 9200 3050 50  0001 C CNN "Vendor"
F 7 "STMicroelectronics" H 9200 3050 50  0001 C CNN "Manufacturer"
F 8 "BAT20JFILM" H 9200 3050 50  0001 C CNN "Part Name"
F 9 "497-3381-1-ND" H 9200 3050 50  0001 C CNN "Vendor Part Name"
	1    9200 3050
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 5FBC3E26
P 9200 2800
F 0 "#PWR0107" H 9200 2650 50  0001 C CNN
F 1 "+3.3V" H 9215 2973 50  0000 C CNN
F 2 "" H 9200 2800 50  0001 C CNN
F 3 "" H 9200 2800 50  0001 C CNN
	1    9200 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4950 9200 4150
$Comp
L power:GND #PWR0108
U 1 1 5FBC26F8
P 9200 4950
F 0 "#PWR0108" H 9200 4700 50  0001 C CNN
F 1 "GND" H 9205 4777 50  0000 C CNN
F 2 "" H 9200 4950 50  0001 C CNN
F 3 "" H 9200 4950 50  0001 C CNN
	1    9200 4950
	1    0    0    -1  
$EndComp
Connection ~ 8650 3400
Wire Wire Line
	9200 3400 9200 3650
Wire Wire Line
	8650 3400 9200 3400
Wire Wire Line
	7250 4500 7500 4500
Connection ~ 7250 4500
Wire Wire Line
	7250 4950 7250 4500
$Comp
L power:GND #PWR0109
U 1 1 5FBBD9E3
P 7250 4950
F 0 "#PWR0109" H 7250 4700 50  0001 C CNN
F 1 "GND" H 7255 4777 50  0000 C CNN
F 2 "" H 7250 4950 50  0001 C CNN
F 3 "" H 7250 4950 50  0001 C CNN
	1    7250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4500 7250 4500
Text Notes 6950 4650 0    50   ~ 0
Resistor divider to convert 5v to 3.3v
Wire Notes Line
	8500 3450 6900 3450
Wire Notes Line
	8500 4700 8500 3450
Wire Notes Line
	6900 4700 8500 4700
Wire Notes Line
	6900 3450 6900 4700
Connection ~ 8200 3400
Wire Wire Line
	8650 3400 8650 3600
Wire Wire Line
	8200 3400 8650 3400
Wire Wire Line
	4500 4850 8650 4850
Wire Wire Line
	8650 4850 8650 3900
Wire Wire Line
	7500 4500 7500 4350
Wire Wire Line
	7000 4350 7000 4500
Wire Wire Line
	7250 3850 7250 4000
Connection ~ 7250 3850
Wire Wire Line
	7550 3850 7250 3850
Wire Wire Line
	8200 3850 7750 3850
Wire Wire Line
	8200 3400 8200 3850
Wire Wire Line
	6250 3400 8200 3400
Wire Wire Line
	7250 4000 7500 4000
Wire Wire Line
	7500 4000 7500 4150
Connection ~ 7250 4000
Wire Wire Line
	7250 3300 7250 3850
Wire Wire Line
	7000 4000 7250 4000
Wire Wire Line
	7250 3300 6250 3300
Wire Wire Line
	7000 4150 7000 4000
$Comp
L Device:L L_PW_1
U 1 1 5FBB0C68
P 8650 3750
F 0 "L_PW_1" H 8703 3796 50  0000 L CNN
F 1 "4.7uH" H 8703 3705 50  0000 L CNN
F 2 "footprints:CV201210-4R7K" H 8650 3750 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/CV201210.pdf" H 8650 3750 50  0001 C CNN
F 4 "Bourns Inc." H 8650 3750 50  0001 C CNN "Manufacturer"
F 5 "CV201210-4R7K" H 8650 3750 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 8650 3750 50  0001 C CNN "Vendor"
F 7 "CV201210-4R7KCT-ND" H 8650 3750 50  0001 C CNN "Vendor Part Name"
	1    8650 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PW_4
U 1 1 5FBACEEE
P 7650 3850
F 0 "R_PW_4" V 7454 3850 50  0000 C CNN
F 1 "115k" V 7545 3850 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 7650 3850 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7650 3850 50  0001 C CNN
F 4 "Yageo" H 7650 3850 50  0001 C CNN "Manufacturer"
F 5 "RT0402DRE07115KL" H 7650 3850 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 7650 3850 50  0001 C CNN "Vendor"
F 7 "311-2218-1-ND" H 7650 3850 50  0001 C CNN "Vendor Part Name"
	1    7650 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R_PW_3
U 1 1 5FBAC365
P 7500 4250
F 0 "R_PW_3" H 7441 4204 50  0000 R CNN
F 1 "100k" H 7441 4295 50  0000 R CNN
F 2 "footprints:RESC1608X55N" H 7500 4250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7500 4250 50  0001 C CNN
F 4 "Yageo" H 7500 4250 50  0001 C CNN "Manufacturer"
F 5 "RT0603DRE07100KL" H 7500 4250 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 7500 4250 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 7500 4250 50  0001 C CNN "Vendor Part Name"
	1    7500 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R_PW_2
U 1 1 5FBAB9C1
P 7000 4250
F 0 "R_PW_2" H 6941 4204 50  0000 R CNN
F 1 "100k" H 6941 4295 50  0000 R CNN
F 2 "footprints:RESC1608X55N" H 7000 4250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7000 4250 50  0001 C CNN
F 4 "Yageo" H 7000 4250 50  0001 C CNN "Manufacturer"
F 5 "RT0603DRE07100KL" H 7000 4250 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 7000 4250 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 7000 4250 50  0001 C CNN "Vendor Part Name"
	1    7000 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4500 4850 3950 4850
Wire Wire Line
	4500 4000 4500 4850
Wire Wire Line
	4650 4000 4500 4000
NoConn ~ 4650 4400
Wire Wire Line
	4650 3800 3950 3800
NoConn ~ 4650 4100
NoConn ~ 4650 3500
Wire Wire Line
	4400 3900 4400 4950
Wire Wire Line
	4650 3900 4400 3900
$Comp
L power:GND #PWR0110
U 1 1 5FB9D73C
P 4400 4950
F 0 "#PWR0110" H 4400 4700 50  0001 C CNN
F 1 "GND" H 4405 4777 50  0000 C CNN
F 2 "" H 4400 4950 50  0001 C CNN
F 3 "" H 4400 4950 50  0001 C CNN
	1    4400 4950
	1    0    0    -1  
$EndComp
Connection ~ 6500 3900
Wire Wire Line
	6500 3800 6500 3900
Wire Wire Line
	6250 3800 6500 3800
Wire Wire Line
	6500 3900 6500 4000
Wire Wire Line
	6250 3900 6500 3900
$Comp
L power:GND #PWR0111
U 1 1 5FB7470B
P 6500 4000
F 0 "#PWR0111" H 6500 3750 50  0001 C CNN
F 1 "GND" H 6505 3827 50  0000 C CNN
F 2 "" H 6500 4000 50  0001 C CNN
F 3 "" H 6500 4000 50  0001 C CNN
	1    6500 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C_PW_5
U 1 1 5FB71E3B
P 9200 3750
F 0 "C_PW_5" H 9292 3796 50  0000 L CNN
F 1 "4.7uF" H 9292 3705 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 9200 3750 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 9200 3750 50  0001 C CNN
F 4 "Kermet" H 9200 3750 50  0001 C CNN "Manufacturer"
F 5 "C1206C475K3RACAUTO" H 9200 3750 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 9200 3750 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 9200 3750 50  0001 C CNN "Vendor Part Name"
	1    9200 3750
	1    0    0    -1  
$EndComp
$Comp
L MAX25276ATCAVY:MAX25276ATCA_VY+ U_PW_1
U 1 1 5FB76385
P 4650 3300
F 0 "U_PW_1" H 5450 3793 60  0000 C CNN
F 1 "MAX25276ATCA_VY+" H 5450 3687 60  0000 C CNN
F 2 "footprints:MAX25276ATCAVY" H 5450 3540 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX20075-MAX25276.pdf" H 5450 3581 60  0001 C CNN
F 4 "Maxim Integrated" H 4650 3300 50  0001 C CNN "Manufacturer"
F 5 "DigiKey Canada" H 4650 3300 50  0001 C CNN "Vendor"
F 6 "" H 4650 3300 50  0001 C CNN "Vendor Part Number"
F 7 "MAX25276ATCA_VY+" H 4650 3300 50  0001 C CNN "Part Name"
F 8 "175-MAX25276ATCA/VY+-ND" H 4650 3300 50  0001 C CNN "Vendor Part Name"
	1    4650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3300 4650 3300
Connection ~ 4500 4850
Wire Wire Line
	4650 3700 3450 3700
Wire Wire Line
	3450 3700 3450 3850
$Comp
L Device:C_Small C_PW_2
U 1 1 5FDD78CA
P 2950 4000
F 0 "C_PW_2" H 3042 4046 50  0000 L CNN
F 1 "4.7uF" H 3042 3955 50  0000 L CNN
F 2 "footprints:C1206C475K3RACAUTO" H 2950 4000 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 2950 4000 50  0001 C CNN
F 4 "Kermet" H 2950 4000 50  0001 C CNN "Manufacturer"
F 5 "C1206C475K3RACAUTO" H 2950 4000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 2950 4000 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 2950 4000 50  0001 C CNN "Vendor Part Name"
	1    2950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4950 2950 4100
Wire Wire Line
	2950 3900 2950 3400
Wire Wire Line
	2950 3400 4650 3400
Wire Wire Line
	2250 3300 2450 3300
Wire Wire Line
	2450 3850 2450 3700
Connection ~ 2450 3300
Wire Wire Line
	2450 3300 3000 3300
$Comp
L power:VS #PWR0112
U 1 1 5FDE6D6A
P 900 2200
F 0 "#PWR0112" H 700 2050 50  0001 C CNN
F 1 "VS" H 915 2373 50  0000 C CNN
F 2 "" H 900 2200 50  0001 C CNN
F 3 "" H 900 2200 50  0001 C CNN
	1    900  2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  2300 900  2200
Connection ~ 900  2300
$Comp
L 1546931-2:1546931-2 H_PW_2
U 1 1 5FDE97E8
P 1650 4550
F 0 "H_PW_2" V 1589 4420 50  0000 R CNN
F 1 "1546931-2" V 1498 4420 50  0000 R CNN
F 2 "footprints:1546931-2" H 1650 4550 50  0001 L BNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1-1773458-1_EURO_STYLE_QRG&DocType=DS&DocLang=English" H 1650 4550 50  0001 L BNN
F 4 "1546931-2" H 1650 4550 50  0001 C CNN "Part Name"
F 5 "TE Connectivity AMP Connectors" H 1650 4550 50  0001 C CNN "Manufacturer"
F 6 "Digikey Canada" H 1650 4550 50  0001 C CNN "Vendor"
F 7 "" H 1650 4550 50  0001 C CNN "digikeypn"
F 8 "" H 1650 4550 50  0001 C CNN "Vendor Part Number"
F 9 "A97965-ND" H 1650 4550 50  0001 C CNN "Vendor Part Name"
	1    1650 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 2200 3000 3300
Wire Wire Line
	1650 4150 1650 4050
Wire Wire Line
	1650 4050 900  4050
Connection ~ 900  4050
Wire Wire Line
	900  4050 900  3950
Wire Wire Line
	1750 4150 1750 3700
Wire Wire Line
	1750 3700 2450 3700
Connection ~ 2450 3700
Wire Wire Line
	2450 3700 2450 3300
$EndSCHEMATC
