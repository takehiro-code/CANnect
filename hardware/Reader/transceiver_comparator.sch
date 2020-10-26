EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 8 19
Title "CANnect Reader | Comparative Transceiver"
Date "2020-10-25"
Rev "0.0.03"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: COMP"
$EndDescr
Text HLabel 5100 1850 2    50   Output ~ 0
~ISO_RX~
$Comp
L CANtech:+12V_SW #PWR?
U 1 1 5FB4E3FC
P 5250 3150
AR Path="/5F95F80B/5FA83833/5FB4E3FC" Ref="#PWR?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E3FC" Ref="#PWR0173"  Part="1" 
F 0 "#PWR0173" H 5250 3400 50  0001 C CNN
F 1 "+12V_SW" H 5308 3187 50  0000 L CNN
F 2 "" H 4500 3950 50  0001 C CNN
F 3 "" H 4500 3950 50  0001 C CNN
	1    5250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3150 5250 3250
NoConn ~ 7000 2500
NoConn ~ 7000 2600
Wire Wire Line
	4600 2200 4450 2200
Wire Wire Line
	5250 3450 5250 3500
Wire Wire Line
	3600 2700 4600 2700
Wire Wire Line
	4600 2800 4600 3500
Wire Wire Line
	4600 3500 5250 3500
Connection ~ 5250 3500
Wire Wire Line
	5250 3500 5250 3550
$Comp
L power:GND #PWR?
U 1 1 5FB4E42A
P 8400 3850
AR Path="/5F95F80B/5FA83833/5FB4E42A" Ref="#PWR?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E42A" Ref="#PWR0174"  Part="1" 
F 0 "#PWR0174" H 8400 3600 50  0001 C CNN
F 1 "GND" H 8405 3677 50  0000 C CNN
F 2 "" H 8400 3850 50  0001 C CNN
F 3 "" H 8400 3850 50  0001 C CNN
	1    8400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3750 5250 3850
$Comp
L power:GND #PWR?
U 1 1 5FB4E438
P 5250 3850
AR Path="/5F95F80B/5FA83833/5FB4E438" Ref="#PWR?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E438" Ref="#PWR0175"  Part="1" 
F 0 "#PWR0175" H 5250 3600 50  0001 C CNN
F 1 "GND" H 5255 3677 50  0000 C CNN
F 2 "" H 5250 3850 50  0001 C CNN
F 3 "" H 5250 3850 50  0001 C CNN
	1    5250 3850
	1    0    0    -1  
$EndComp
Text HLabel 2550 2700 0    50   BiDi ~ 0
K-Line
$Comp
L CANtech:+12V_SW #PWR?
U 1 1 5FB4E402
P 4100 1200
AR Path="/5F95F80B/5FA83833/5FB4E402" Ref="#PWR?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E402" Ref="#PWR0176"  Part="1" 
F 0 "#PWR0176" H 4100 1450 50  0001 C CNN
F 1 "+12V_SW" H 4158 1237 50  0000 L CNN
F 2 "" H 3350 2000 50  0001 C CNN
F 3 "" H 3350 2000 50  0001 C CNN
	1    4100 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FB4E408
P 5250 3350
AR Path="/5F95F80B/5FA83833/5FB4E408" Ref="R?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E408" Ref="R_COMP_6"  Part="1" 
F 0 "R_COMP_6" H 5309 3396 50  0000 L CNN
F 1 "10k" H 5309 3305 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 5250 3350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5250 3350 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 5250 3350 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 5250 3350 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 5250 3350 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 5250 3350 50  0001 C CNN "Manufacturer"
	1    5250 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FB4E431
P 5250 3650
AR Path="/5F95F80B/5FA83833/5FB4E431" Ref="R?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E431" Ref="R_COMP_7"  Part="1" 
F 0 "R_COMP_7" H 5309 3696 50  0000 L CNN
F 1 "10k" H 5309 3605 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 5250 3650 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5250 3650 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 5250 3650 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 5250 3650 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 5250 3650 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 5250 3650 50  0001 C CNN "Manufacturer"
	1    5250 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_COMP5
U 1 1 5FBAA6D5
P 5050 1650
F 0 "R_COMP5" V 4854 1650 50  0000 C CNN
F 1 "10k" V 4945 1650 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 5050 1650 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5050 1650 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 5050 1650 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 5050 1650 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 5050 1650 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 5050 1650 50  0001 C CNN "Manufacturer"
	1    5050 1650
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0177
U 1 1 5FBAAE93
P 5800 1650
F 0 "#PWR0177" H 5800 1500 50  0001 C CNN
F 1 "+3.3V" H 5815 1823 50  0000 C CNN
F 2 "" H 5800 1650 50  0001 C CNN
F 3 "" H 5800 1650 50  0001 C CNN
	1    5800 1650
	1    0    0    -1  
$EndComp
Text HLabel 2550 1550 0    50   Input ~ 0
J1850_BUS+
$Comp
L Device:R_Small R_COMP_3
U 1 1 5FBAC5B8
P 3650 1900
F 0 "R_COMP_3" H 3591 1854 50  0000 R CNN
F 1 "10k" H 3591 1945 50  0000 R CNN
F 2 "footprints:RESC1608X55N" H 3650 1900 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 3650 1900 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 3650 1900 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 3650 1900 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 3650 1900 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 3650 1900 50  0001 C CNN "Manufacturer"
	1    3650 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R_COMP_1
U 1 1 5FBACEC6
P 3150 1900
F 0 "R_COMP_1" H 3209 1946 50  0000 L CNN
F 1 "10k" H 3209 1855 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 3150 1900 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 3150 1900 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 3150 1900 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 3150 1900 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 3150 1900 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 3150 1900 50  0001 C CNN "Manufacturer"
	1    3150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2200 4450 1850
Text HLabel 7600 3750 0    50   Input ~ 0
J1850_BUS+
$Comp
L Device:R_Small R_COMP_10
U 1 1 5FBAD28A
P 7700 3250
F 0 "R_COMP_10" H 7759 3296 50  0000 L CNN
F 1 "10k" H 7759 3205 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 7700 3250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7700 3250 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 7700 3250 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 7700 3250 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 7700 3250 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 7700 3250 50  0001 C CNN "Manufacturer"
	1    7700 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3750 7700 3750
Wire Wire Line
	7700 3750 7700 3350
Wire Wire Line
	7700 2700 7700 3150
$Comp
L Device:R_Small R_COMP_8
U 1 1 5FBB49DF
P 6250 3350
F 0 "R_COMP_8" H 6309 3396 50  0000 L CNN
F 1 "2.7k" H 6309 3305 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 6250 3350 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28773/crcwce3.pdf" H 6250 3350 50  0001 C CNN
F 4 "CRCW06032K70FKEAC" H 6250 3350 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 6250 3350 50  0001 C CNN "Vendor"
F 6 "Vishay Dale" H 6250 3350 50  0001 C CNN "Manufacturer"
F 7 "541-5328-1-ND" H 6250 3350 50  0001 C CNN "digikeypn"
	1    6250 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_COMP_9
U 1 1 5FBB4DBB
P 6250 3650
F 0 "R_COMP_9" H 6309 3696 50  0000 L CNN
F 1 "10k" H 6309 3605 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 6250 3650 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 6250 3650 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 6250 3650 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 6250 3650 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 6250 3650 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 6250 3650 50  0001 C CNN "Manufacturer"
	1    6250 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBB53E3
P 6250 3850
AR Path="/5F95F80B/5FA83833/5FBB53E3" Ref="#PWR?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FBB53E3" Ref="#PWR0178"  Part="1" 
F 0 "#PWR0178" H 6250 3600 50  0001 C CNN
F 1 "GND" H 6255 3677 50  0000 C CNN
F 2 "" H 6250 3850 50  0001 C CNN
F 3 "" H 6250 3850 50  0001 C CNN
	1    6250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3850 6250 3750
$Comp
L CANtech:+5V_SW #PWR0179
U 1 1 5FBB5CB9
P 6250 3150
F 0 "#PWR0179" H 6250 3400 50  0001 C CNN
F 1 "+5V_SW" H 6308 3187 50  0000 L CNN
F 2 "" H 5500 3950 50  0001 C CNN
F 3 "" H 5500 3950 50  0001 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3150 6250 3250
Wire Wire Line
	6250 3450 6250 3500
Connection ~ 6250 3500
Wire Wire Line
	6250 3500 6250 3550
Wire Wire Line
	7300 2800 7300 3500
Wire Wire Line
	6250 3500 7300 3500
Wire Wire Line
	7000 2800 7300 2800
Wire Wire Line
	7000 2700 7700 2700
Wire Wire Line
	4450 1850 4850 1850
Wire Wire Line
	4850 1850 4850 1650
Wire Wire Line
	4850 1650 4950 1650
Connection ~ 4850 1850
Wire Wire Line
	4850 1850 5100 1850
Wire Wire Line
	4100 1200 4100 2400
Wire Wire Line
	4100 2400 4600 2400
$Comp
L LM339NNOPB:LM339N_NOPB U?
U 1 1 5FB4E413
P 4600 2200
AR Path="/5F95F80B/5FA83833/5FB4E413" Ref="U?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E413" Ref="U_COMP_1"  Part="1" 
F 0 "U_COMP_1" H 5800 2587 60  0000 C CNN
F 1 "LM339N_NOPB" H 5800 2481 60  0000 C CNN
F 2 "footprints:LM339N&slash_NOPB" H 5800 2440 60  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm339-n.pdf?ts=1603731355059" H 4600 2200 60  0000 C CNN
F 4 "LM339N_NOPB" H 4600 2200 50  0001 C CNN "Part Name"
F 5 "Texas Instruments" H 4600 2200 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4600 2200 50  0001 C CNN "Vendor"
F 7 "296-39010-5-ND" H 4600 2200 50  0001 C CNN "digikeypn"
	1    4600 2200
	1    0    0    -1  
$EndComp
Text HLabel 5100 1250 2    50   Output ~ 0
PWM_RX
Wire Wire Line
	4600 2300 4300 2300
Wire Wire Line
	4300 2300 4300 1250
Wire Wire Line
	4300 1250 4850 1250
$Comp
L Device:R_Small R_COMP_4
U 1 1 5FBBEB81
P 5050 1050
F 0 "R_COMP_4" V 4854 1050 50  0000 C CNN
F 1 "10k" V 4945 1050 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 5050 1050 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5050 1050 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 5050 1050 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 5050 1050 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 5050 1050 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 5050 1050 50  0001 C CNN "Manufacturer"
	1    5050 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 1250 4850 1050
Wire Wire Line
	4850 1050 4950 1050
Connection ~ 4850 1250
Wire Wire Line
	4850 1250 5100 1250
NoConn ~ 7000 2300
$Comp
L Device:R_Small R_COMP_11
U 1 1 5FBC1B65
P 8400 2000
F 0 "R_COMP_11" H 8459 2046 50  0000 L CNN
F 1 "10k" H 8459 1955 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 8400 2000 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 8400 2000 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 8400 2000 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 8400 2000 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 8400 2000 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 8400 2000 50  0001 C CNN "Manufacturer"
	1    8400 2000
	1    0    0    -1  
$EndComp
Text HLabel 8850 2200 2    50   Output ~ 0
VPW_RX
$Comp
L power:+3.3V #PWR0181
U 1 1 5FBC3E7A
P 8400 1600
F 0 "#PWR0181" H 8400 1450 50  0001 C CNN
F 1 "+3.3V" H 8415 1773 50  0000 C CNN
F 2 "" H 8400 1600 50  0001 C CNN
F 3 "" H 8400 1600 50  0001 C CNN
	1    8400 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1900 8400 1600
Wire Wire Line
	7000 2400 8400 2400
Wire Wire Line
	8400 2400 8400 3850
Wire Wire Line
	7000 2200 8400 2200
Wire Wire Line
	8400 2200 8400 2100
Connection ~ 8400 2200
Wire Wire Line
	8400 2200 8850 2200
$Comp
L Device:R_Small R?
U 1 1 5FB4E43F
P 3500 2700
AR Path="/5F95F80B/5FA83833/5FB4E43F" Ref="R?"  Part="1" 
AR Path="/5F95F80B/5FB4CA84/5FB4E43F" Ref="R_COMP_2"  Part="1" 
F 0 "R_COMP_2" V 3304 2700 50  0000 C CNN
F 1 "10k" V 3395 2700 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 3500 2700 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 3500 2700 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 3500 2700 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 3500 2700 50  0001 C CNN "Vendor"
F 6 "YAG2321CT-ND" H 3500 2700 50  0001 C CNN "digikeypn"
F 7 "Yageo" H 3500 2700 50  0001 C CNN "Manufacturer"
	1    3500 2700
	0    -1   -1   0   
$EndComp
Text HLabel 2550 1300 0    50   Input ~ 0
J1850_BUS-
Wire Wire Line
	2550 2700 3400 2700
Wire Wire Line
	3150 2000 3150 2600
Wire Wire Line
	3150 2600 4600 2600
Wire Wire Line
	3150 1800 3150 1550
Wire Wire Line
	3150 1550 2550 1550
Wire Wire Line
	4600 2500 3650 2500
Wire Wire Line
	3650 2500 3650 2000
Wire Wire Line
	2550 1300 3650 1300
Wire Wire Line
	3650 1300 3650 1800
Wire Wire Line
	5150 1650 5800 1650
$Comp
L power:+3.3V #PWR02
U 1 1 5FFDEA6D
P 5800 1050
F 0 "#PWR02" H 5800 900 50  0001 C CNN
F 1 "+3.3V" H 5815 1223 50  0000 C CNN
F 2 "" H 5800 1050 50  0001 C CNN
F 3 "" H 5800 1050 50  0001 C CNN
	1    5800 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1050 5800 1050
$EndSCHEMATC
