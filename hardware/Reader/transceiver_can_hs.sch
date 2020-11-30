EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 14 17
Title "CANnect Reader | High Speed CAN Transceiver"
Date "2020-11-29"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: HSCAN"
$EndDescr
Text HLabel 1400 2700 0    50   BiDi ~ 0
HS_CAN_High
Text HLabel 1400 2800 0    50   BiDi ~ 0
HS_CAN_Low
$Comp
L MCP2562HMF:MCP2562-H_MF U_HSCAN_1
U 1 1 5FAF8CE0
P 7000 2500
F 0 "U_HSCAN_1" H 8200 2993 60  0000 C CNN
F 1 "MCP2562-H_MF" H 8200 2887 60  0000 C CNN
F 2 "footprints:MCP2562-H&slash_MF" H 8200 2740 60  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/20005167C.pdf" H 8200 2781 60  0000 C CNN
F 4 "MCP2562-H_MF" H 7000 2500 50  0001 C CNN "Part Name"
F 5 "Microchip Technology" H 7000 2500 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7000 2500 50  0001 C CNN "Vendor"
F 7 "MCP2562-H/MF-ND" H 7000 2500 50  0001 C CNN "digikeypn"
	1    7000 2500
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R_HSCAN_2
U 1 1 5FAFC15F
P 2550 3650
F 0 "R_HSCAN_2" H 2609 3696 50  0000 L CNN
F 1 "100" H 2609 3605 50  0000 L CNN
F 2 "footprints:RESC3216X70N" H 2550 3650 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2550 3650 50  0001 C CNN
F 4 "ERJ-8ENF1000V" H 2550 3650 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 2550 3650 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 2550 3650 50  0001 C CNN "Manufacturer"
F 7 "P100FCT-ND" H 2550 3650 50  0001 C CNN "digikeypn"
	1    2550 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_HSCAN_3
U 1 1 5FAFC377
P 3250 3650
F 0 "R_HSCAN_3" H 3309 3696 50  0000 L CNN
F 1 "100" H 3309 3605 50  0000 L CNN
F 2 "footprints:RESC3216X70N" H 3250 3650 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 3250 3650 50  0001 C CNN
F 4 "ERJ-8ENF1000V" H 3250 3650 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 3250 3650 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 3250 3650 50  0001 C CNN "Manufacturer"
F 7 "P100FCT-ND" H 3250 3650 50  0001 C CNN "digikeypn"
	1    3250 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_HSCAN_1
U 1 1 5FAFC84F
P 2550 4200
F 0 "C_HSCAN_1" H 2665 4246 50  0000 L CNN
F 1 "560pF" H 2665 4155 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 2588 4050 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 2550 4200 50  0001 C CNN
F 4 "CC0603KRX7R9BB561" H 2550 4200 50  0001 C CNN "Part Name"
F 5 "Yageo" H 2550 4200 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 2550 4200 50  0001 C CNN "Vendor"
F 7 "311-1079-1-ND" H 2550 4200 50  0001 C CNN "digikeypn"
	1    2550 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_HSCAN_2
U 1 1 5FAFCB3A
P 3250 4200
F 0 "C_HSCAN_2" H 3365 4246 50  0000 L CNN
F 1 "560pF" H 3365 4155 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 3288 4050 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 3250 4200 50  0001 C CNN
F 4 "CC0603KRX7R9BB561" H 3250 4200 50  0001 C CNN "Part Name"
F 5 "Yageo" H 3250 4200 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3250 4200 50  0001 C CNN "Vendor"
F 7 "311-1079-1-ND" H 3250 4200 50  0001 C CNN "digikeypn"
	1    3250 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5FAFCEDA
P 2550 4600
F 0 "#PWR016" H 2550 4350 50  0001 C CNN
F 1 "GND" H 2555 4427 50  0000 C CNN
F 2 "" H 2550 4600 50  0001 C CNN
F 3 "" H 2550 4600 50  0001 C CNN
	1    2550 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5FAFD28A
P 3250 4600
F 0 "#PWR017" H 3250 4350 50  0001 C CNN
F 1 "GND" H 3255 4427 50  0000 C CNN
F 2 "" H 3250 4600 50  0001 C CNN
F 3 "" H 3250 4600 50  0001 C CNN
	1    3250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4600 2550 4350
Wire Wire Line
	3250 4600 3250 4350
Wire Wire Line
	2550 4050 2550 3750
Wire Wire Line
	3250 4050 3250 3750
Wire Wire Line
	2550 3550 2550 2800
Connection ~ 2550 2800
Wire Wire Line
	7000 2600 7250 2600
$Comp
L power:GND #PWR019
U 1 1 5FB09A41
P 5300 1900
F 0 "#PWR019" H 5300 1650 50  0001 C CNN
F 1 "GND" H 5305 1727 50  0000 C CNN
F 2 "" H 5300 1900 50  0001 C CNN
F 3 "" H 5300 1900 50  0001 C CNN
	1    5300 1900
	1    0    0    -1  
$EndComp
Text HLabel 1400 1900 0    50   Input ~ 0
~PWR_CTRL~
$Comp
L NX7002AK_215:NX7002AK,215 Q_HSCAN_1
U 1 1 5FB0A373
P 2350 1800
F 0 "Q_HSCAN_1" H 2548 1796 50  0000 L CNN
F 1 "NX7002AK,215" H 2548 1705 50  0000 L CNN
F 2 "footprints:SOT95P230X110-3N" H 2350 1800 50  0001 L BNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 2350 1800 50  0001 L BNN
F 4 "Nexperia" H 2350 1800 50  0001 L BNN "Field4"
F 5 "7" H 2350 1800 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 2350 1800 50  0001 L BNN "Field6"
F 7 "NX7002AK,215" H 2350 1800 50  0001 C CNN "Part Name"
F 8 "Nexperia USA Inc." H 2350 1800 50  0001 C CNN "Manufacturer"
F 9 "DigiKey Canada" H 2350 1800 50  0001 C CNN "Vendor"
F 10 "1727-1289-1-ND" H 2350 1800 50  0001 C CNN "digikeypn"
	1    2350 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5FB0D00A
P 2450 2400
F 0 "#PWR015" H 2450 2150 50  0001 C CNN
F 1 "GND" H 2455 2227 50  0000 C CNN
F 2 "" H 2450 2400 50  0001 C CNN
F 3 "" H 2450 2400 50  0001 C CNN
	1    2450 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR018
U 1 1 5FB0E48E
P 3400 900
F 0 "#PWR018" H 3400 750 50  0001 C CNN
F 1 "+3.3V" H 3415 1073 50  0000 C CNN
F 2 "" H 3400 900 50  0001 C CNN
F 3 "" H 3400 900 50  0001 C CNN
	1    3400 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_HSCAN_1
U 1 1 5FB0EC46
P 2450 1350
F 0 "R_HSCAN_1" H 2509 1396 50  0000 L CNN
F 1 "100k" H 2509 1305 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 2450 1350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 2450 1350 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 2450 1350 50  0001 C CNN "Part Name"
F 5 "Yageo" H 2450 1350 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 2450 1350 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 2450 1350 50  0001 C CNN "digikeypn"
	1    2450 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_HSCAN_3
U 1 1 5FB1262F
P 8100 2150
F 0 "C_HSCAN_3" V 7848 2150 50  0000 C CNN
F 1 "1uF" V 7939 2150 50  0000 C CNN
F 2 "footprints:0603" H 8138 2000 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8100 2150 50  0001 C CNN
F 4 "C0603C105K4RACTU" H 8100 2150 50  0001 C CNN "Part Name"
F 5 "Kermet" H 8100 2150 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 8100 2150 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 8100 2150 50  0001 C CNN "digikeypn"
	1    8100 2150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5FB14219
P 8600 2250
F 0 "#PWR021" H 8600 2000 50  0001 C CNN
F 1 "GND" H 8605 2077 50  0000 C CNN
F 2 "" H 8600 2250 50  0001 C CNN
F 3 "" H 8600 2250 50  0001 C CNN
	1    8600 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2500 9050 2500
Wire Wire Line
	7000 2800 9050 2800
Wire Wire Line
	8250 2150 8600 2150
Wire Wire Line
	8600 2150 8600 2250
Wire Wire Line
	7000 2700 7700 2700
Wire Wire Line
	7700 2700 7700 2150
Wire Wire Line
	7700 2150 7950 2150
Wire Wire Line
	7700 1900 7700 2150
Connection ~ 7700 2150
$Comp
L power:+5V #PWR020
U 1 1 5FB19FDC
P 7700 1900
F 0 "#PWR020" H 7700 1750 50  0001 C CNN
F 1 "+5V" H 7715 2073 50  0000 C CNN
F 2 "" H 7700 1900 50  0001 C CNN
F 3 "" H 7700 1900 50  0001 C CNN
	1    7700 1900
	1    0    0    -1  
$EndComp
Text HLabel 9050 2500 2    50   Input ~ 0
HS_CAN_TX
Text HLabel 9050 2800 2    50   Output ~ 0
HS_CAN_RX
Wire Wire Line
	2550 2800 4600 2800
Wire Wire Line
	2450 2100 2450 2400
Wire Wire Line
	1400 1900 2150 1900
Wire Wire Line
	2450 1600 2450 1550
Wire Wire Line
	2450 1250 2450 1150
Wire Wire Line
	2450 1150 3400 1150
Wire Wire Line
	3400 1150 3400 900 
Wire Wire Line
	3400 1150 3400 2900
Wire Wire Line
	3400 2900 4600 2900
Connection ~ 3400 1150
Wire Wire Line
	2450 1550 3250 1550
Wire Wire Line
	3250 1550 3250 2600
Wire Wire Line
	3250 2600 4600 2600
Connection ~ 2450 1550
Wire Wire Line
	2450 1550 2450 1450
Wire Wire Line
	4600 2500 4250 2500
Wire Wire Line
	4250 2500 4250 1700
Wire Wire Line
	7250 1700 5300 1700
Wire Wire Line
	7250 1700 7250 2600
Wire Wire Line
	5300 1900 5300 1700
Connection ~ 5300 1700
Wire Wire Line
	5300 1700 4250 1700
Wire Wire Line
	3250 3550 3250 2700
Connection ~ 3250 2700
Wire Wire Line
	3250 2700 4600 2700
Wire Wire Line
	1400 2800 2550 2800
Wire Wire Line
	1400 2700 3250 2700
$EndSCHEMATC
