EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 7 19
Title "CANnect Reader | SAE J1850 VPW/PWM Transceiver"
Date "2020-11-19"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: J1850"
$EndDescr
$Comp
L LM317LDR2G:LM317LDR2G U_J1850_1
U 1 1 5FB525E1
P 4450 2100
F 0 "U_J1850_1" H 4450 2570 50  0000 C CNN
F 1 "LM317LDR2G" H 4450 2479 50  0000 C CNN
F 2 "footprints:SOIC127P600X175-8N" H 4450 2100 50  0001 L BNN
F 3 "https://www.onsemi.com/pub/Collateral/LM317L-D.PDF" H 4450 2100 50  0001 C CNN
F 4 "LM317LDR2G" H 4450 2100 50  0001 C CNN "Part Name"
F 5 "ON Semiconductor" H 4450 2100 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4450 2100 50  0001 C CNN "Vendor"
F 7 "LM317LDR2GOSCT-ND" H 4450 2100 50  0001 C CNN "digikeypn"
	1    4450 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_J1850_1
U 1 1 5FB54AC0
P 3500 3050
F 0 "C_J1850_1" H 3615 3096 50  0000 L CNN
F 1 "0.1uF" H 3615 3005 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 3538 2900 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 3500 3050 50  0001 C CNN
F 4 "CC0603JRX7R8BB104" H 3500 3050 50  0001 C CNN "Part Name"
F 5 "Yageo" H 3500 3050 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3500 3050 50  0001 C CNN "Vendor"
F 7 "311-1777-1-ND" H 3500 3050 50  0001 C CNN "digikeypn"
	1    3500 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5FB553C7
P 3500 3550
F 0 "#PWR032" H 3500 3300 50  0001 C CNN
F 1 "GND" H 3505 3377 50  0000 C CNN
F 2 "" H 3500 3550 50  0001 C CNN
F 3 "" H 3500 3550 50  0001 C CNN
	1    3500 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_J1850_6
U 1 1 5FB55A16
P 4450 1400
F 0 "R_J1850_6" V 4254 1400 50  0000 C CNN
F 1 "240" V 4345 1400 50  0000 C CNN
F 2 "footprints:RESC3216X70N" H 4450 1400 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 4450 1400 50  0001 C CNN
F 4 "ERJ-8ENF2400V" H 4450 1400 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4450 1400 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 4450 1400 50  0001 C CNN "Manufacturer"
F 7 "P240FCT-ND" H 4450 1400 50  0001 C CNN "digikeypn"
	1    4450 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R_J1850_3
U 1 1 5FB56090
P 2900 2300
F 0 "R_J1850_3" H 2841 2254 50  0000 R CNN
F 1 "866" H 2841 2345 50  0000 R CNN
F 2 "footprints:RESC3216X70N" H 2900 2300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2900 2300 50  0001 C CNN
F 4 "ERJ-8ENF8660V" H 2900 2300 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 2900 2300 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 2900 2300 50  0001 C CNN "Manufacturer"
F 7 "P866FCT-ND" H 2900 2300 50  0001 C CNN "digikeypn"
	1    2900 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 2200 2900 1900
Wire Wire Line
	2900 1900 3750 1900
Wire Wire Line
	4350 1400 2900 1400
Wire Wire Line
	2900 1400 2900 1900
Connection ~ 2900 1900
$Comp
L NX7002AK_215:NX7002AK,215 Q_J1850_1
U 1 1 5FB57E44
P 2000 3000
F 0 "Q_J1850_1" H 2198 2996 50  0000 L CNN
F 1 "NX7002AK,215" H 2198 2905 50  0000 L CNN
F 2 "footprints:SOT95P230X110-3N" H 2000 3000 50  0001 L BNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 2000 3000 50  0001 L BNN
F 4 "Nexperia" H 2000 3000 50  0001 L BNN "Field4"
F 5 "7" H 2000 3000 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 2000 3000 50  0001 L BNN "Field6"
F 7 "NX7002AK,215" H 2000 3000 50  0001 C CNN "Part Name"
F 8 "Nexperia USA Inc." H 2000 3000 50  0001 C CNN "Manufacturer"
F 9 "DigiKey Canada" H 2000 3000 50  0001 C CNN "Vendor"
F 10 "1727-1289-1-ND" H 2000 3000 50  0001 C CNN "digikeypn"
	1    2000 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_J1850_4
U 1 1 5FB59A27
P 2900 3050
F 0 "R_J1850_4" H 2959 3096 50  0000 L CNN
F 1 "374" H 2959 3005 50  0000 L CNN
F 2 "footprints:RESC3216X70N" H 2900 3050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2900 3050 50  0001 C CNN
F 4 "ERJ-8ENF3740V" H 2900 3050 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 2900 3050 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 2900 3050 50  0001 C CNN "Manufacturer"
F 7 "P374FCT-ND" H 2900 3050 50  0001 C CNN "digikeypn"
	1    2900 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2800 2100 2600
Wire Wire Line
	2100 2600 2900 2600
Wire Wire Line
	2900 2600 2900 2400
Wire Wire Line
	2900 2600 2900 2950
Connection ~ 2900 2600
Wire Wire Line
	2100 3300 2100 3600
Wire Wire Line
	2100 3600 2900 3600
Wire Wire Line
	2900 3600 2900 3150
$Comp
L power:GND #PWR029
U 1 1 5FB5A98F
P 2100 3900
F 0 "#PWR029" H 2100 3650 50  0001 C CNN
F 1 "GND" H 2105 3727 50  0000 C CNN
F 2 "" H 2100 3900 50  0001 C CNN
F 3 "" H 2100 3900 50  0001 C CNN
	1    2100 3900
	1    0    0    -1  
$EndComp
Text HLabel 1400 3100 0    50   Input ~ 0
~J1850_BUS+_VH~
Wire Wire Line
	1400 3100 1800 3100
Wire Wire Line
	2100 3600 2100 3900
Connection ~ 2100 3600
$Comp
L CANtech:+V_J1850 #PWR034
U 1 1 5FB539A6
P 5400 1050
F 0 "#PWR034" H 5400 900 50  0001 C CNN
F 1 "+V_J1850" H 5415 1223 50  0000 C CNN
F 2 "" H 5400 1050 50  0001 C CNN
F 3 "" H 5400 1050 50  0001 C CNN
	1    5400 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1050 5400 1400
Wire Wire Line
	4550 1400 5400 1400
Wire Notes Line
	650  4200 5700 4200
Wire Notes Line
	5700 4200 5700 700 
Wire Notes Line
	5700 700  650  700 
Wire Notes Line
	650  700  650  4200
Text Notes 2700 850  2    50   ~ 0
SAE J1850 Power Supply for WM (5V) and VPW (7V)
$Comp
L NX7002AK_215:NX7002AK,215 Q_J1850_2
U 1 1 5FB62A81
P 2050 5900
F 0 "Q_J1850_2" H 2248 5896 50  0000 L CNN
F 1 "NX7002AK,215" H 2248 5805 50  0000 L CNN
F 2 "footprints:SOT95P230X110-3N" H 2050 5900 50  0001 L BNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 2050 5900 50  0001 L BNN
F 4 "Nexperia" H 2050 5900 50  0001 L BNN "Field4"
F 5 "7" H 2050 5900 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 2050 5900 50  0001 L BNN "Field6"
F 7 "NX7002AK,215" H 2050 5900 50  0001 C CNN "Part Name"
F 8 "Nexperia USA Inc." H 2050 5900 50  0001 C CNN "Manufacturer"
F 9 "DigiKey Canada" H 2050 5900 50  0001 C CNN "Vendor"
F 10 "1727-1289-1-ND" H 2050 5900 50  0001 C CNN "digikeypn"
	1    2050 5900
	1    0    0    -1  
$EndComp
$Comp
L RSC002P03T316:RSC002P03T316 Q_J1850_3
U 1 1 5FB63A72
P 3000 5450
F 0 "Q_J1850_3" V 3600 5700 60  0000 C CNN
F 1 "RSC002P03T316" V 3500 5700 60  0000 C CNN
F 2 "footprints:RSC002P03T316" H 3800 5690 60  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/transistor/mosfet/rsc002p03-e.pdf" H 3800 5731 60  0001 C CNN
F 4 "RSC002P03T316" H 3000 5450 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 3000 5450 50  0001 C CNN "Vendor"
F 6 "Rohm Semiconductor" H 3000 5450 50  0001 C CNN "Manufacturer"
F 7 "RSC002P03T316CT-ND" H 3000 5450 50  0001 C CNN "digikeypn"
	1    3000 5450
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R_J1850_2
U 1 1 5FB64FDA
P 2150 5300
F 0 "R_J1850_2" H 2209 5346 50  0000 L CNN
F 1 "1.5k" H 2209 5255 50  0000 L CNN
F 2 "footprints:RESC1607X60N" H 2150 5300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_11.pdf" H 2150 5300 50  0001 C CNN
F 4 "RC0603FR-071K5L" H 2150 5300 50  0001 C CNN "Part Name"
F 5 "Yageo" H 2150 5300 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 2150 5300 50  0001 C CNN "Vendor"
F 7 "311-1.50KHRCT-ND" H 2150 5300 50  0001 C CNN "digikeypn"
	1    2150 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5550 3150 5550
Wire Wire Line
	3150 5550 3150 5400
Wire Wire Line
	2150 5550 2150 5700
Wire Wire Line
	2150 5550 2150 5400
Connection ~ 2150 5550
Wire Wire Line
	2150 5100 2950 5100
Wire Wire Line
	2150 5200 2150 5100
$Comp
L CANtech:+V_J1850 #PWR030
U 1 1 5FB735C3
P 2150 4950
F 0 "#PWR030" H 2150 4800 50  0001 C CNN
F 1 "+V_J1850" H 2165 5123 50  0000 C CNN
F 2 "" H 2150 4950 50  0001 C CNN
F 3 "" H 2150 4950 50  0001 C CNN
	1    2150 4950
	1    0    0    -1  
$EndComp
Text HLabel 1450 6000 0    50   Output ~ 0
J1850_BUS+_TX
$Comp
L Device:R_Small R_J1850_1
U 1 1 5FB73FCF
P 1600 6400
F 0 "R_J1850_1" H 1659 6446 50  0000 L CNN
F 1 "10k" H 1659 6355 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 1600 6400 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 1600 6400 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 1600 6400 50  0001 C CNN "Part Name"
F 5 "Yageo" H 1600 6400 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 1600 6400 50  0001 C CNN "Vendor"
F 7 "YAG2321CT-ND" H 1600 6400 50  0001 C CNN "digikeypn"
	1    1600 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 5FB743BE
P 2150 6800
F 0 "#PWR031" H 2150 6550 50  0001 C CNN
F 1 "GND" H 2155 6627 50  0000 C CNN
F 2 "" H 2150 6800 50  0001 C CNN
F 3 "" H 2150 6800 50  0001 C CNN
	1    2150 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6600 2150 6200
Wire Wire Line
	2150 6600 2150 6800
Connection ~ 2150 6600
Wire Wire Line
	2150 5100 2150 4950
Connection ~ 2150 5100
$Comp
L Diode:BAT46 D_J1850_1
U 1 1 5FB795A0
P 4050 5100
F 0 "D_J1850_1" H 4050 4883 50  0000 C CNN
F 1 "BAT46JFILM" H 4050 4974 50  0000 C CNN
F 2 "footprints:BAT46JFILM" H 4050 4925 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c6/32/d4/4a/28/d3/4b/11/CD00004930.pdf/files/CD00004930.pdf/jcr:content/translations/en.CD00004930.pdf" H 4050 5100 50  0001 C CNN
F 4 "BAT46JFILM" H 4050 5100 50  0001 C CNN "Part Name"
F 5 "STMicroelectronics" H 4050 5100 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4050 5100 50  0001 C CNN "Vendor"
F 7 "497-6653-1-ND" H 4050 5100 50  0001 C CNN "digikeypn"
	1    4050 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 5100 3900 5100
Text HLabel 5150 5100 2    50   BiDi ~ 0
J1850_BUS+
Wire Wire Line
	4200 5100 4400 5100
$Comp
L Device:R_Small R_J1850_5
U 1 1 5FB7CD86
P 4400 5300
F 0 "R_J1850_5" H 4459 5346 50  0000 L CNN
F 1 "10k" H 4459 5255 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 4400 5300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 4400 5300 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 4400 5300 50  0001 C CNN "Part Name"
F 5 "Yageo" H 4400 5300 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4400 5300 50  0001 C CNN "Vendor"
F 7 "YAG2321CT-ND" H 4400 5300 50  0001 C CNN "digikeypn"
	1    4400 5300
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT46 D_J1850_2
U 1 1 5FB7D020
P 4400 5900
F 0 "D_J1850_2" V 4446 5820 50  0000 R CNN
F 1 "BAT46JFILM" V 4355 5820 50  0000 R CNN
F 2 "footprints:BAT46JFILM" H 4400 5725 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c6/32/d4/4a/28/d3/4b/11/CD00004930.pdf/files/CD00004930.pdf/jcr:content/translations/en.CD00004930.pdf" H 4400 5900 50  0001 C CNN
F 4 "BAT46JFILM" H 4400 5900 50  0001 C CNN "Part Name"
F 5 "STMicroelectronics" H 4400 5900 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4400 5900 50  0001 C CNN "Vendor"
F 7 "497-6653-1-ND" H 4400 5900 50  0001 C CNN "digikeypn"
	1    4400 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 5200 4400 5100
Connection ~ 4400 5100
Wire Wire Line
	4400 5400 4400 5750
$Comp
L power:GND #PWR033
U 1 1 5FB7EDB5
P 4400 6800
F 0 "#PWR033" H 4400 6550 50  0001 C CNN
F 1 "GND" H 4405 6627 50  0000 C CNN
F 2 "" H 4400 6800 50  0001 C CNN
F 3 "" H 4400 6800 50  0001 C CNN
	1    4400 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 6800 4400 6050
Wire Notes Line
	650  4650 650  7200
Wire Notes Line
	650  7200 5700 7200
Wire Notes Line
	5700 7200 5700 4650
Wire Notes Line
	5700 4650 650  4650
Text Notes 1650 4800 2    50   ~ 0
J1850 BUS+ Transmitter
Text HLabel 6850 3000 0    50   Input ~ 0
J1850_BUS-_TX
$Comp
L NX7002AK_215:NX7002AK,215 Q_J1850_4
U 1 1 5FB836A9
P 7700 2900
F 0 "Q_J1850_4" H 7898 2896 50  0000 L CNN
F 1 "NX7002AK,215" H 7898 2805 50  0000 L CNN
F 2 "footprints:SOT95P230X110-3N" H 7700 2900 50  0001 L BNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 7700 2900 50  0001 L BNN
F 4 "Nexperia" H 7700 2900 50  0001 L BNN "Field4"
F 5 "7" H 7700 2900 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 7700 2900 50  0001 L BNN "Field6"
F 7 "NX7002AK,215" H 7700 2900 50  0001 C CNN "Part Name"
F 8 "Nexperia USA Inc." H 7700 2900 50  0001 C CNN "Manufacturer"
F 9 "DigiKey Canada" H 7700 2900 50  0001 C CNN "Vendor"
F 10 "1727-1289-1-ND" H 7700 2900 50  0001 C CNN "digikeypn"
	1    7700 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_J1850_7
U 1 1 5FB84DD1
P 7200 3450
F 0 "R_J1850_7" H 7259 3496 50  0000 L CNN
F 1 "10k" H 7259 3405 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 7200 3450 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7200 3450 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 7200 3450 50  0001 C CNN "Part Name"
F 5 "Yageo" H 7200 3450 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7200 3450 50  0001 C CNN "Vendor"
F 7 "YAG2321CT-ND" H 7200 3450 50  0001 C CNN "digikeypn"
	1    7200 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_J1850_8
U 1 1 5FB8513E
P 7800 2250
F 0 "R_J1850_8" H 7859 2296 50  0000 L CNN
F 1 "10k" H 7859 2205 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 7800 2250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7800 2250 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 7800 2250 50  0001 C CNN "Part Name"
F 5 "Yageo" H 7800 2250 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7800 2250 50  0001 C CNN "Vendor"
F 7 "YAG2321CT-ND" H 7800 2250 50  0001 C CNN "digikeypn"
	1    7800 2250
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT46 D_J1850_3
U 1 1 5FB86936
P 7800 1950
F 0 "D_J1850_3" V 7846 1870 50  0000 R CNN
F 1 "BAT46JFILM" V 7755 1870 50  0000 R CNN
F 2 "footprints:BAT46JFILM" H 7800 1775 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c6/32/d4/4a/28/d3/4b/11/CD00004930.pdf/files/CD00004930.pdf/jcr:content/translations/en.CD00004930.pdf" H 7800 1950 50  0001 C CNN
F 4 "BAT46JFILM" H 7800 1950 50  0001 C CNN "Part Name"
F 5 "STMicroelectronics" H 7800 1950 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7800 1950 50  0001 C CNN "Vendor"
F 7 "497-6653-1-ND" H 7800 1950 50  0001 C CNN "digikeypn"
	1    7800 1950
	0    -1   -1   0   
$EndComp
Text HLabel 8750 2500 2    50   BiDi ~ 0
J1850_BUS-
Wire Wire Line
	6850 3000 7200 3000
Wire Wire Line
	7200 3000 7200 3350
Connection ~ 7200 3000
Wire Wire Line
	7200 3000 7500 3000
$Comp
L power:GND #PWR036
U 1 1 5FB89303
P 7800 3750
F 0 "#PWR036" H 7800 3500 50  0001 C CNN
F 1 "GND" H 7805 3577 50  0000 C CNN
F 2 "" H 7800 3750 50  0001 C CNN
F 3 "" H 7800 3750 50  0001 C CNN
	1    7800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3550 7200 3650
Wire Wire Line
	7200 3650 7800 3650
Wire Wire Line
	7800 3650 7800 3750
Wire Wire Line
	7800 3650 7800 3200
Connection ~ 7800 3650
Wire Wire Line
	7800 2700 7800 2500
Wire Wire Line
	7800 2150 7800 2100
Connection ~ 7800 2500
Wire Wire Line
	7800 2500 7800 2350
$Comp
L CANtech:+5V_SW #PWR035
U 1 1 5FB8FBF4
P 7800 1600
F 0 "#PWR035" H 7800 1850 50  0001 C CNN
F 1 "+5V_SW" H 7858 1637 50  0000 L CNN
F 2 "" H 7050 2400 50  0001 C CNN
F 3 "" H 7050 2400 50  0001 C CNN
	1    7800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1800 7800 1600
Wire Notes Line
	6100 1400 6100 4000
Wire Notes Line
	6100 4000 9350 4000
Wire Notes Line
	9350 4000 9350 1400
Wire Notes Line
	9350 1400 6100 1400
Text Notes 7100 1550 2    50   ~ 0
J1850 BUS- Transmitter
Wire Wire Line
	3500 2000 3750 2000
Wire Wire Line
	3500 2000 3500 2900
Wire Wire Line
	3500 3200 3500 3550
Wire Wire Line
	1450 6000 1600 6000
Wire Wire Line
	1600 6500 1600 6600
Wire Wire Line
	1600 6600 2150 6600
Wire Wire Line
	1600 6300 1600 6000
Connection ~ 1600 6000
Wire Wire Line
	1600 6000 1850 6000
Wire Wire Line
	7800 2500 8750 2500
Wire Wire Line
	4400 5100 5150 5100
NoConn ~ 3750 2200
NoConn ~ 3750 2300
NoConn ~ 5150 2000
NoConn ~ 5150 2200
NoConn ~ 5150 2300
Wire Wire Line
	5400 1400 5400 1850
Wire Wire Line
	5400 1850 5150 1850
Connection ~ 5400 1400
$EndSCHEMATC
