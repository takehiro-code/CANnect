EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 16 19
Title "CANnect Reader | Voltage Sense"
Date "2020-10-25"
Rev "0.0.03"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: VS"
$EndDescr
$Comp
L Device:R_Small R_VS_2
U 1 1 5FD5DF8C
P 2850 2800
F 0 "R_VS_2" H 2909 2846 50  0000 L CNN
F 1 "10k 1%" H 2909 2755 50  0000 L CNN
F 2 "footprints:RESC3216X70N" H 2850 2800 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2850 2800 50  0001 C CNN
F 4 "ERJ-1GNF1002C" H 2850 2800 50  0001 C CNN "Part Name"
	1    2850 2800
	1    0    0    -1  
$EndComp
$Comp
L CANtech:VRaw #V0103
U 1 1 5FD5E303
P 2850 1700
F 0 "#V0103" H 2850 1700 50  0001 C CNN
F 1 "VRaw" H 2908 1687 50  0000 L CNN
F 2 "" H 2850 1700 50  0001 C CNN
F 3 "" H 2850 1700 50  0001 C CNN
	1    2850 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_VS_1
U 1 1 5FD5E63B
P 2250 2800
F 0 "C_VS_1" H 2365 2846 50  0000 L CNN
F 1 "0.1uF" H 2365 2755 50  0000 L CNN
F 2 "footprints:CAPC1608X90" H 2288 2650 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 2250 2800 50  0001 C CNN
	1    2250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2650 2250 2500
Wire Wire Line
	2250 2500 2850 2500
Connection ~ 2850 2500
Wire Wire Line
	2850 2500 2850 2700
Wire Wire Line
	2250 2950 2250 3300
Wire Wire Line
	2250 3300 2850 3300
Wire Wire Line
	2850 3300 2850 2900
$Comp
L power:GND #PWR0112
U 1 1 5FD5EC70
P 2850 3650
F 0 "#PWR0112" H 2850 3400 50  0001 C CNN
F 1 "GND" H 2855 3477 50  0000 C CNN
F 2 "" H 2850 3650 50  0001 C CNN
F 3 "" H 2850 3650 50  0001 C CNN
	1    2850 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3300 2850 3650
Connection ~ 2850 3300
Text HLabel 3950 2500 2    50   Output ~ 0
Analog_Voltage
$Comp
L Diode:BAT46 D_VS_2
U 1 1 5FD5FBA4
P 3400 2850
F 0 "D_VS_2" V 3354 2930 50  0000 L CNN
F 1 "BAT46" V 3445 2930 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3400 2675 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85662/bat46.pdf" H 3400 2850 50  0001 C CNN
	1    3400 2850
	0    1    1    0   
$EndComp
$Comp
L Diode:BAT46 D_VS_1
U 1 1 5FD600B9
P 3400 2150
F 0 "D_VS_1" V 3354 2230 50  0000 L CNN
F 1 "BAT46" V 3445 2230 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3400 1975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85662/bat46.pdf" H 3400 2150 50  0001 C CNN
	1    3400 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 2500 3400 2300
Connection ~ 3400 2500
Wire Wire Line
	3400 2500 3400 2700
$Comp
L power:GND #PWR0122
U 1 1 5FD60B0C
P 3400 3650
F 0 "#PWR0122" H 3400 3400 50  0001 C CNN
F 1 "GND" H 3405 3477 50  0000 C CNN
F 2 "" H 3400 3650 50  0001 C CNN
F 3 "" H 3400 3650 50  0001 C CNN
	1    3400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3650 3400 3000
$Comp
L power:+3.3V #PWR0123
U 1 1 5FD61353
P 3400 1750
F 0 "#PWR0123" H 3400 1600 50  0001 C CNN
F 1 "+3.3V" H 3415 1923 50  0000 C CNN
F 2 "" H 3400 1750 50  0001 C CNN
F 3 "" H 3400 1750 50  0001 C CNN
	1    3400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2000 3400 1750
Wire Wire Line
	2850 2500 3400 2500
Wire Wire Line
	3400 2500 3950 2500
Wire Notes Line
	1750 1350 1750 4150
Wire Notes Line
	1750 4150 4650 4150
Wire Notes Line
	4650 4150 4650 1350
Wire Notes Line
	4650 1350 1750 1350
Text Notes 2050 1500 2    50   ~ 0
Typical
$Comp
L Device:R_Small R_VS_1
U 1 1 6007733F
P 2850 2150
F 0 "R_VS_1" H 2909 2196 50  0000 L CNN
F 1 "62k 1%" H 2909 2105 50  0000 L CNN
F 2 "footprints:RESC3216X70N" H 2850 2150 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDA0000/AOA0000C304.pdf" H 2850 2150 50  0001 C CNN
F 4 "ERJ-1GNF6202C" H 2850 2150 50  0001 C CNN "Part Name"
	1    2850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2050 2850 1750
Wire Wire Line
	2850 2500 2850 2250
$EndSCHEMATC
