EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 17
Title "CANnect Reader | Overvoltage Protection"
Date "2020-10-20"
Rev "0.0.1"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: OVP"
$EndDescr
Text HLabel 2550 2400 0    50   Input ~ 0
Raw_Voltage
Text HLabel 9600 2400 2    50   Output ~ 0
Protected_Voltage
$Comp
L Device:C C_OVP_1
U 1 1 5F9D7679
P 3350 3600
F 0 "C_OVP_1" H 3465 3646 50  0000 L CNN
F 1 "10nF/100V" H 3465 3555 50  0000 L CNN
F 2 "footprints:CAPC1608X90N" H 3388 3450 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf?ref_disty=digikey" H 3350 3600 50  0001 C CNN
F 4 "C1608X7R2A103K080AA" H 3350 3600 50  0001 C CNN "Part Name"
	1    3350 3600
	1    0    0    -1  
$EndComp
$Comp
L Diode:US2AA D_OVP_1
U 1 1 5F9D8203
P 3750 2400
F 0 "D_OVP_1" H 3750 2617 50  0000 C CNN
F 1 "US2AA" H 3750 2526 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 3750 2225 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/S2M-D.PDF" H 3750 2400 50  0001 C CNN
	1    3750 2400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R_OVP_3
U 1 1 5F9D99AE
P 5350 3000
F 0 "R_OVP_3" V 5154 3000 50  0000 C CNN
F 1 "10k" V 5245 3000 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 5350 3000 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5350 3000 50  0001 C CNN
F 4 "RT0603FRE0710KL" H 5350 3000 50  0001 C CNN "Part Name"
	1    5350 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R_OVP_4
U 1 1 5F9D9C88
P 6500 3600
F 0 "R_OVP_4" H 6441 3554 50  0000 R CNN
F 1 "100k" H 6441 3645 50  0000 R CNN
F 2 "footprints:RESC1608X55N" H 6500 3600 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 6500 3600 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 6500 3600 50  0001 C CNN "Part Name"
	1    6500 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:C C_OVP_2
U 1 1 5F9DB543
P 8450 3600
F 0 "C_OVP_2" H 8565 3646 50  0000 L CNN
F 1 "1uF" H 8565 3555 50  0000 L CNN
F 2 "footprints:0603" H 8488 3450 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 8450 3600 50  0001 C CNN
	1    8450 3600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBT3906 Q_OVP_1
U 1 1 5F9DBBAC
P 6400 3000
F 0 "Q_OVP_1" H 6591 2954 50  0000 L CNN
F 1 "MMBT3906" H 6591 3045 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6600 2925 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3906-D.PDF" H 6400 3000 50  0001 L CNN
	1    6400 3000
	1    0    0    1   
$EndComp
$Comp
L BSS192:BSS192 Q_OVP_2
U 1 1 5F9DE5EE
P 8450 2700
F 0 "Q_OVP_2" V 9039 2700 60  0000 C CNN
F 1 "BSS192" V 8933 2700 60  0000 C CNN
F 2 "footprints:BSS192" H 8900 2440 60  0001 C CNN
F 3 "" H 8450 2700 60  0000 C CNN
	1    8450 2700
	0    1    -1   0   
$EndComp
Wire Wire Line
	3900 2400 4600 2400
Wire Wire Line
	8750 2400 8850 2400
Wire Wire Line
	7750 2500 7750 2400
Connection ~ 7750 2400
Wire Wire Line
	7750 2400 8150 2400
Wire Wire Line
	7750 2800 7750 3100
Wire Wire Line
	7750 3100 8450 3100
Wire Wire Line
	8450 3100 8450 2700
Wire Wire Line
	8450 3100 8450 3350
Connection ~ 8450 3100
$Comp
L power:GND #PWR0114
U 1 1 5F9E1DED
P 8450 4350
F 0 "#PWR0114" H 8450 4100 50  0001 C CNN
F 1 "GND" H 8455 4177 50  0000 C CNN
F 2 "" H 8450 4350 50  0001 C CNN
F 3 "" H 8450 4350 50  0001 C CNN
	1    8450 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F9E1FBB
P 6500 4350
F 0 "#PWR0115" H 6500 4100 50  0001 C CNN
F 1 "GND" H 6505 4177 50  0000 C CNN
F 2 "" H 6500 4350 50  0001 C CNN
F 3 "" H 6500 4350 50  0001 C CNN
	1    6500 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5F9E2378
P 4600 4350
F 0 "#PWR0116" H 4600 4100 50  0001 C CNN
F 1 "GND" H 4605 4177 50  0000 C CNN
F 2 "" H 4600 4350 50  0001 C CNN
F 3 "" H 4600 4350 50  0001 C CNN
	1    4600 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5F9E2748
P 3350 4350
F 0 "#PWR0117" H 3350 4100 50  0001 C CNN
F 1 "GND" H 3355 4177 50  0000 C CNN
F 2 "" H 3350 4350 50  0001 C CNN
F 3 "" H 3350 4350 50  0001 C CNN
	1    3350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4350 3350 3750
Wire Wire Line
	3350 3450 3350 2400
Wire Wire Line
	3350 2400 3600 2400
Wire Wire Line
	4600 4350 4600 3750
Wire Wire Line
	4600 2600 4600 2400
Connection ~ 4600 2400
Wire Wire Line
	4600 2400 6500 2400
Wire Wire Line
	4600 2800 4600 3000
Wire Wire Line
	5450 3000 6200 3000
Wire Wire Line
	5250 3000 4600 3000
Connection ~ 4600 3000
Wire Wire Line
	4600 3000 4600 3450
Wire Wire Line
	6500 3200 6500 3350
Wire Wire Line
	6500 4350 6500 3700
Wire Wire Line
	6500 2800 6500 2400
Connection ~ 6500 2400
Wire Wire Line
	6500 2400 7750 2400
Wire Wire Line
	8450 3750 8450 4350
Wire Wire Line
	6500 3350 8450 3350
Connection ~ 6500 3350
Wire Wire Line
	6500 3350 6500 3500
Connection ~ 8450 3350
Wire Wire Line
	8450 3350 8450 3450
$Comp
L Device:D_Zener D_OVP_3
U 1 1 5F9DAAB5
P 7750 2650
F 0 "D_OVP_3" V 7704 2730 50  0000 L CNN
F 1 "BZX84B16VLFH" V 7795 2730 50  0000 L CNN
F 2 "footprints:BZX84B16VLFHT116" H 7750 2650 50  0001 C CNN
F 3 "~" H 7750 2650 50  0001 C CNN
F 4 "ERJ-8ENF3740V" H 7750 2650 50  0001 C CNN "Part Name"
	1    7750 2650
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D_OVP_2
U 1 1 5F9DA35E
P 4600 3600
F 0 "D_OVP_2" V 4554 3680 50  0000 L CNN
F 1 "BZX84B16VLFH" V 4645 3680 50  0000 L CNN
F 2 "footprints:BZX84B16VLFHT116" H 4600 3600 50  0001 C CNN
F 3 "https://d1d2qsbl8m0m72.cloudfront.net/en/products/databook/datasheet/discrete/diode/zener/bzx84b16vlfht116-e.pdf" V 4691 3680 50  0001 L CNN
F 4 "ERJ-8ENF3740V" H 4600 3600 50  0001 C CNN "Part Name"
	1    4600 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R_OVP_1
U 1 1 5F9D955B
P 4600 2700
F 0 "R_OVP_1" H 4659 2746 50  0000 L CNN
F 1 "R_Small" H 4659 2655 50  0000 L CNN
F 2 "" H 4600 2700 50  0001 C CNN
F 3 "~" H 4600 2700 50  0001 C CNN
	1    4600 2700
	1    0    0    -1  
$EndComp
Text Notes 7850 2000 2    50   ~ 0
Need to redesign this as this gives Imax=200mA, which is probably not sufficient for the entire circuit
Wire Wire Line
	2550 2400 2850 2400
Wire Wire Line
	2850 2400 2850 1400
Wire Wire Line
	9300 1400 9300 2400
Wire Wire Line
	9300 2400 9600 2400
Wire Wire Line
	2850 1400 9300 1400
Wire Wire Line
	3350 2400 3100 2400
Connection ~ 3350 2400
NoConn ~ 3100 2400
NoConn ~ 8850 2400
Wire Notes Line
	3000 1850 3000 4700
Wire Notes Line
	3000 4700 9000 4700
Wire Notes Line
	9000 4700 9000 1850
Wire Notes Line
	9000 1850 3000 1850
$EndSCHEMATC
