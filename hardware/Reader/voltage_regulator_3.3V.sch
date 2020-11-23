EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 17 19
Title "CANnect Reader | Voltage Regulator (3.3V)"
Date "2020-11-19"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: VR2"
$EndDescr
Text HLabel 9750 2400 2    50   Output ~ 0
3.3V
Text HLabel 9750 4250 2    50   Output ~ 0
PGood
$Comp
L power:GND #PWR?
U 1 1 5FF31609
P 6250 3100
AR Path="/5F8ADA45/5F9EA8B0/5FF31609" Ref="#PWR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF31609" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 6250 2850 50  0001 C CNN
F 1 "GND" H 6255 2927 50  0000 C CNN
F 2 "" H 6250 3100 50  0001 C CNN
F 3 "" H 6250 3100 50  0001 C CNN
	1    6250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2800 6250 2800
Wire Wire Line
	6250 2800 6250 2900
Wire Wire Line
	6050 2900 6250 2900
Connection ~ 6250 2900
Wire Wire Line
	6250 2900 6250 3100
Wire Wire Line
	4450 1850 4450 2300
Wire Wire Line
	4450 2600 4450 2500
Wire Wire Line
	4450 3400 4450 4250
$Comp
L Device:L L_VR?
U 1 1 5FF3162D
P 9150 3050
AR Path="/5F8ADA45/5F9EA8B0/5FF3162D" Ref="L_VR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3162D" Ref="L_VR2"  Part="1" 
F 0 "L_VR2" H 9203 3096 50  0000 L CNN
F 1 "4.7uH" H 9203 3005 50  0000 L CNN
F 2 "footprints:CV201210-4R7K" H 9150 3050 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/CV201210.pdf" H 9150 3050 50  0001 C CNN
F 4 "CV201210-4R7K" H 9150 3050 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 9150 3050 50  0001 C CNN "Vendor"
F 6 "Bourns Inc." H 9150 3050 50  0001 C CNN "Manufacturer"
F 7 "CV201210-4R7KCT-ND" H 9150 3050 50  0001 C CNN "digikeypn"
	1    9150 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2900 9150 2400
$Comp
L Device:C C_VR2_BST?
U 1 1 5FF31636
P 3600 3450
AR Path="/5F8ADA45/5F9EA8B0/5FF31636" Ref="C_VR2_BST?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF31636" Ref="C_VR2_2"  Part="1" 
F 0 "C_VR2_2" H 3715 3496 50  0000 L CNN
F 1 "0.1uF" H 3715 3405 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 3638 3300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 3600 3450 50  0001 C CNN
F 4 "CC0603JRX7R8BB104" H 3600 3450 50  0001 C CNN "Part Name"
F 5 "Yageo" H 3600 3450 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3600 3450 50  0001 C CNN "Vendor"
F 7 "311-1777-1-ND" H 3600 3450 50  0001 C CNN "digikeypn"
	1    3600 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF3163C
P 4300 3550
AR Path="/5F8ADA45/5F9EA8B0/5FF3163C" Ref="#PWR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3163C" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 4300 3300 50  0001 C CNN
F 1 "GND" H 4305 3377 50  0000 C CNN
F 2 "" H 4300 3550 50  0001 C CNN
F 3 "" H 4300 3550 50  0001 C CNN
	1    4300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3550 4300 2900
Wire Wire Line
	4300 2900 4450 2900
Wire Wire Line
	4450 2800 3600 2800
Wire Wire Line
	3600 2800 3600 3300
Wire Wire Line
	3600 3600 3600 3800
Wire Wire Line
	3600 3800 3950 3800
Wire Wire Line
	9150 3800 9150 3200
Wire Wire Line
	4450 3000 3950 3000
Wire Wire Line
	3950 3000 3950 3800
Connection ~ 3950 3800
$Comp
L power:GND #PWR0106
U 1 1 5FF3A2BC
P 7450 4550
F 0 "#PWR0106" H 7450 4300 50  0001 C CNN
F 1 "GND" H 7455 4377 50  0000 C CNN
F 2 "" H 7450 4550 50  0001 C CNN
F 3 "" H 7450 4550 50  0001 C CNN
	1    7450 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_VR2_3
U 1 1 5FF3AFE5
P 7800 2750
F 0 "R_VR2_3" H 7859 2796 50  0000 L CNN
F 1 "115k" H 7859 2705 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 7800 2750 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7800 2750 50  0001 C CNN
F 4 "RT0402DRE07115KL" H 7800 2750 50  0001 C CNN "Part Name"
F 5 "Yageo" H 7800 2750 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7800 2750 50  0001 C CNN "Vendor"
F 7 "311-2218-1-ND" H 7800 2750 50  0001 C CNN "digikeypn"
	1    7800 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_VR2_?
U 1 1 5FA01DD3
P 7350 3350
AR Path="/5FA56A4E/5FA01DD3" Ref="R_VR2_?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FA01DD3" Ref="R_VR2_1"  Part="1" 
F 0 "R_VR2_1" H 7409 3396 50  0000 L CNN
F 1 "100k" H 7409 3305 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 7350 3350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7350 3350 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 7350 3350 50  0001 C CNN "Part Name"
F 5 "Yageo" H 7350 3350 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7350 3350 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 7350 3350 50  0001 C CNN "digikeypn"
	1    7350 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R_VR2_?
U 1 1 5FA0AF7C
P 7550 3350
AR Path="/5FA56A4E/5FA0AF7C" Ref="R_VR2_?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FA0AF7C" Ref="R_VR2_2"  Part="1" 
F 0 "R_VR2_2" H 7609 3396 50  0000 L CNN
F 1 "100k" H 7609 3305 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 7550 3350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 7550 3350 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 7550 3350 50  0001 C CNN "Part Name"
F 5 "Yageo" H 7550 3350 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7550 3350 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 7550 3350 50  0001 C CNN "digikeypn"
	1    7550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3800 9150 3800
Wire Wire Line
	7550 3550 7550 3450
Wire Wire Line
	7450 3550 7450 4550
Wire Wire Line
	7450 3550 7550 3550
Wire Wire Line
	7450 3550 7350 3550
Wire Wire Line
	7350 3550 7350 3450
Connection ~ 7450 3550
$Comp
L MAX25276ATCAVY:MAX25276ATCA_VY+ U_VR?
U 1 1 5FF315FD
P 4450 2300
AR Path="/5F8ADA45/5F9EA8B0/5FF315FD" Ref="U_VR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF315FD" Ref="U_VR2"  Part="1" 
F 0 "U_VR2" H 5250 2700 60  0000 C CNN
F 1 "MAX25276ATCA_VY+" H 5250 2581 60  0000 C CNN
F 2 "footprints:MAX25276ATCA&slash_VY&plus_" H 5250 2540 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX20075-MAX25276.pdf" H 5300 2950 60  0000 C CNN
F 4 "MAX25276ATCA/VY+" H 4450 2300 50  0001 C CNN "Part Name"
F 5 "Maxim Integrated" H 4450 2300 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4450 2300 50  0001 C CNN "Vendor"
F 7 "175-MAX25276ATCA/VY+-ND" H 4450 2300 50  0001 C CNN "digikeypn"
	1    4450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2400 4200 2400
Wire Wire Line
	4200 2400 4200 2250
Wire Wire Line
	4450 4250 9750 4250
Wire Wire Line
	6050 2300 7450 2300
Wire Wire Line
	7450 2300 7450 3000
Wire Wire Line
	6050 2400 7800 2400
Wire Wire Line
	7800 2650 7800 2400
Connection ~ 7800 2400
Wire Wire Line
	7800 2400 9150 2400
Wire Wire Line
	7800 2850 7800 3000
Wire Wire Line
	7800 3000 7450 3000
Wire Wire Line
	7350 3250 7350 3150
Wire Wire Line
	7350 3150 7450 3150
Wire Wire Line
	7550 3150 7550 3250
Wire Wire Line
	7450 3150 7450 3000
Connection ~ 7450 3150
Wire Wire Line
	7450 3150 7550 3150
Connection ~ 7450 3000
Wire Notes Line
	6750 2050 6750 3700
Wire Notes Line
	6750 3700 8400 3700
Wire Notes Line
	8400 3700 8400 2050
Wire Notes Line
	8400 2050 6750 2050
Text Notes 6800 2150 0    50   ~ 0
Resistor Divider to convert 5V to 3.3V
Wire Wire Line
	3250 2700 4450 2700
Wire Wire Line
	3250 2700 3250 4150
Wire Wire Line
	3250 4450 3250 4700
$Comp
L Device:C C_VR2_BIAS?
U 1 1 5FF31652
P 3250 4300
AR Path="/5F8ADA45/5F9EA8B0/5FF31652" Ref="C_VR2_BIAS?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF31652" Ref="C_VR2_3"  Part="1" 
F 0 "C_VR2_3" H 3365 4346 50  0000 L CNN
F 1 "1uF" H 3365 4255 50  0000 L CNN
F 2 "footprints:0603" H 3288 4150 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 3250 4300 50  0001 C CNN
F 4 "C0603C105K4RACTU" H 3250 4300 50  0001 C CNN "Part Name"
F 5 "Kermet" H 3250 4300 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3250 4300 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 3250 4300 50  0001 C CNN "digikeypn"
	1    3250 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF3160F
P 3250 4700
AR Path="/5F8ADA45/5F9EA8B0/5FF3160F" Ref="#PWR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3160F" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 3250 4450 50  0001 C CNN
F 1 "GND" H 3255 4527 50  0000 C CNN
F 2 "" H 3250 4700 50  0001 C CNN
F 3 "" H 3250 4700 50  0001 C CNN
	1    3250 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2250 4050 2250
$Comp
L Device:C C_VR2_in?
U 1 1 5FF3161F
P 3900 2250
AR Path="/5F8ADA45/5F9EA8B0/5FF3161F" Ref="C_VR2_in?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3161F" Ref="C_VR2_1"  Part="1" 
F 0 "C_VR2_1" V 3648 2250 50  0000 C CNN
F 1 "4.7uF" V 3739 2250 50  0000 C CNN
F 2 "footprints:C1206C475K3RACAUTO" H 3938 2100 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 3900 2250 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 3900 2250 50  0001 C CNN "Part Name"
F 5 "Kermet" H 3900 2250 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3900 2250 50  0001 C CNN "Vendor"
F 7 "399-7029-1-ND" H 3900 2250 50  0001 C CNN "digikeypn"
	1    3900 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 2250 3750 2250
$Comp
L power:GND #PWR0108
U 1 1 5F99A55F
P 3350 2250
F 0 "#PWR0108" H 3350 2000 50  0001 C CNN
F 1 "GND" H 3355 2077 50  0000 C CNN
F 2 "" H 3350 2250 50  0001 C CNN
F 3 "" H 3350 2250 50  0001 C CNN
	1    3350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3100 4450 3100
Text HLabel 2450 3100 0    50   Input ~ 0
Spread_Spectrum_Enable
Wire Wire Line
	2450 2600 4450 2600
Text HLabel 2450 2600 0    50   Input ~ 0
Sync_Signal
Wire Wire Line
	2450 1850 4450 1850
Text HLabel 2450 1850 0    50   Input ~ 0
Enable_Signal
$Comp
L BAT46:BAT46 D_VR2_1
U 1 1 5FB95099
P 9250 2400
F 0 "D_VR2_1" H 9450 2663 60  0000 C CNN
F 1 "BAT46JFILM" H 9450 2557 60  0000 C CNN
F 2 "footprints:BAT46JFILM" H 9450 2040 60  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c6/32/d4/4a/28/d3/4b/11/CD00004930.pdf/files/CD00004930.pdf/jcr:content/translations/en.CD00004930.pdf" H 9450 2557 60  0001 C CNN
F 4 "STMicroelectronics" H 9250 2400 50  0001 C CNN "Manufacturer"
F 5 "BAT46JFILM" H 9250 2400 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 9250 2400 50  0001 C CNN "Vendor"
F 7 "497-6653-1-ND" H 9250 2400 50  0001 C CNN "digikeypn"
	1    9250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2400 9250 2400
Connection ~ 9150 2400
Wire Wire Line
	9650 2400 9750 2400
$EndSCHEMATC
