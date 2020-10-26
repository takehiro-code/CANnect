EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 17 19
Title "CANnect Reader | Voltage Regulator (3.3V)"
Date "2020-10-25"
Rev "0.0.03"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: VR2"
$EndDescr
$Comp
L MAX25276ATCAVY:MAX25276ATCA_VY+ VR?
U 1 1 5FF315FD
P 4450 2300
AR Path="/5F8ADA45/5F9EA8B0/5FF315FD" Ref="VR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF315FD" Ref="U_VR2"  Part="1" 
F 0 "U_VR2" H 5250 2687 60  0000 C CNN
F 1 "MAX25276ATCA_VY+" H 5250 2581 60  0000 C CNN
F 2 "footprints:MAX25276ATCA&slash_VY&plus_" H 5250 2540 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX20075-MAX25276.pdf" H 5250 2850 60  0000 C CNN
	1    4450 2300
	1    0    0    -1  
$EndComp
Text HLabel 2450 1850 0    50   Input ~ 0
Enable_Signal
Text HLabel 2500 2400 0    50   Input ~ 0
Supply_Voltage
Text HLabel 2500 2600 0    50   Input ~ 0
Sync_Signal
Text HLabel 8100 2400 2    50   Output ~ 0
3.3V
Text HLabel 8100 4250 2    50   Output ~ 0
PGood
Wire Wire Line
	6050 2400 6800 2400
$Comp
L power:GND #PWR?
U 1 1 5FF31609
P 6250 3100
AR Path="/5F8ADA45/5F9EA8B0/5FF31609" Ref="#PWR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF31609" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 6250 2850 50  0001 C CNN
F 1 "GND" H 6255 2927 50  0000 C CNN
F 2 "" H 6250 3100 50  0001 C CNN
F 3 "" H 6250 3100 50  0001 C CNN
	1    6250 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF3160F
P 3250 4700
AR Path="/5F8ADA45/5F9EA8B0/5FF3160F" Ref="#PWR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3160F" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 3250 4450 50  0001 C CNN
F 1 "GND" H 3255 4527 50  0000 C CNN
F 2 "" H 3250 4700 50  0001 C CNN
F 3 "" H 3250 4700 50  0001 C CNN
	1    3250 4700
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
$Comp
L Device:C Cin?
U 1 1 5FF3161F
P 3400 2400
AR Path="/5F8ADA45/5F9EA8B0/5FF3161F" Ref="Cin?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3161F" Ref="C_VR2_in1"  Part="1" 
F 0 "C_VR2_in1" V 3148 2400 50  0000 C CNN
F 1 "4.7uF" V 3239 2400 50  0000 C CNN
F 2 "footprints:C1206C475K3RACAUTO" H 3438 2250 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1206C475K3RACAUTO.pdf" H 3400 2400 50  0001 C CNN
F 4 "C1206C475K3RACAUTO" H 3400 2400 50  0001 C CNN "Part Name"
	1    3400 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 1850 4450 1850
Wire Wire Line
	4450 1850 4450 2300
Wire Wire Line
	2500 2400 3250 2400
Wire Wire Line
	3550 2400 4450 2400
Wire Wire Line
	2500 2600 4450 2600
Wire Wire Line
	4450 2600 4450 2500
Wire Wire Line
	4450 3400 4450 4250
$Comp
L Device:L L?
U 1 1 5FF3162D
P 7300 3050
AR Path="/5F8ADA45/5F9EA8B0/5FF3162D" Ref="L?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3162D" Ref="L_VR2"  Part="1" 
F 0 "L_VR2" H 7353 3096 50  0000 L CNN
F 1 "4.7uH" H 7353 3005 50  0000 L CNN
F 2 "footprints:CV201210-4R7K" H 7300 3050 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/CV201210.pdf" H 7300 3050 50  0001 C CNN
	1    7300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2900 7300 2400
Connection ~ 7300 2400
Wire Wire Line
	7300 2400 8100 2400
$Comp
L Device:C CBST?
U 1 1 5FF31636
P 3600 3450
AR Path="/5F8ADA45/5F9EA8B0/5FF31636" Ref="CBST?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF31636" Ref="C_VR2_BST1"  Part="1" 
F 0 "C_VR2_BST1" H 3715 3496 50  0000 L CNN
F 1 "0.1uF" H 3715 3405 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 3638 3300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 3600 3450 50  0001 C CNN
	1    3600 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF3163C
P 4300 3550
AR Path="/5F8ADA45/5F9EA8B0/5FF3163C" Ref="#PWR?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF3163C" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 4300 3300 50  0001 C CNN
F 1 "GND" H 4305 3377 50  0000 C CNN
F 2 "" H 4300 3550 50  0001 C CNN
F 3 "" H 4300 3550 50  0001 C CNN
	1    4300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2700 4450 2700
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
	7300 3800 7300 3200
Wire Wire Line
	4450 3000 3950 3000
Wire Wire Line
	3950 3000 3950 3800
Connection ~ 3950 3800
Wire Wire Line
	3950 3800 7300 3800
Text HLabel 2450 3100 0    50   Input ~ 0
Spread_Spectrum_Enable
Wire Wire Line
	2450 3100 4450 3100
Wire Wire Line
	4450 4250 8100 4250
$Comp
L Device:C C?
U 1 1 5FF31652
P 3250 4300
AR Path="/5F8ADA45/5F9EA8B0/5FF31652" Ref="C?"  Part="1" 
AR Path="/5F8ADA45/5FF30350/5FF31652" Ref="C_VR2_BIAS1"  Part="1" 
F 0 "C_VR2_BIAS1" H 3365 4346 50  0000 L CNN
F 1 "1uF" H 3365 4255 50  0000 L CNN
F 2 "footprints:0603" H 3288 4150 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 3250 4300 50  0001 C CNN
	1    3250 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4450 3250 4700
Wire Wire Line
	3250 2700 3250 4150
$Comp
L power:GND #PWR0144
U 1 1 5FF3A2BC
P 6600 4650
F 0 "#PWR0144" H 6600 4400 50  0001 C CNN
F 1 "GND" H 6605 4477 50  0000 C CNN
F 2 "" H 6600 4650 50  0001 C CNN
F 3 "" H 6600 4650 50  0001 C CNN
	1    6600 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_VR2_2
U 1 1 5FF3AFE5
P 6800 3100
F 0 "R_VR2_2" H 6859 3146 50  0000 L CNN
F 1 "115k" H 6859 3055 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 6800 3100 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 6800 3100 50  0001 C CNN
F 4 "RT0402DRE07115KL" H 6800 3100 50  0001 C CNN "Part Name"
	1    6800 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_VR2_1
U 1 1 5FF3B60E
P 6350 2300
F 0 "R_VR2_1" V 6154 2300 50  0000 C CNN
F 1 "50k" V 6245 2300 50  0000 C CNN
F 2 "footprints:RESC1608X55N" H 6350 2300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 6350 2300 50  0001 C CNN
F 4 "RT1206BRD0750KL" H 6350 2300 50  0001 C CNN "Part Name"
	1    6350 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 2300 6250 2300
Wire Wire Line
	6450 2300 6600 2300
Wire Wire Line
	6600 2300 6600 3500
Wire Wire Line
	6800 2400 6800 3000
Connection ~ 6800 2400
Wire Wire Line
	6800 2400 7300 2400
Wire Wire Line
	6800 3200 6800 3500
Wire Wire Line
	6800 3500 6600 3500
Connection ~ 6600 3500
Wire Wire Line
	6600 3500 6600 4650
Wire Notes Line
	6150 2050 6150 2550
Wire Notes Line
	6150 2550 6450 2550
Wire Notes Line
	6450 2550 6450 3650
Wire Notes Line
	6450 3650 7200 3650
Wire Notes Line
	6100 1900 6100 2050
Wire Notes Line
	6100 2050 6150 2050
Text Notes 7450 2000 2    50   ~ 0
Resistor Divider to turn 5V to 3.3V
Wire Notes Line
	7700 1900 7700 2150
Wire Notes Line
	7700 2150 7200 2150
Wire Notes Line
	7200 2150 7200 3650
Wire Notes Line
	6100 1900 7700 1900
$EndSCHEMATC
