EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 17 18
Title "CANnect Reader | Host"
Date "2020-10-20"
Rev "0.0.01"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: HST"
$EndDescr
Wire Wire Line
	3200 4750 2800 4750
Wire Wire Line
	7800 3250 9600 3250
Wire Wire Line
	7800 3750 8450 3750
Wire Wire Line
	7800 3850 9600 3850
Wire Wire Line
	7800 3950 9250 3950
Wire Wire Line
	7800 3450 8350 3450
$Comp
L power:GND #PWR05
U 1 1 5F91E2ED
P 9600 5400
F 0 "#PWR05" H 9600 5150 50  0001 C CNN
F 1 "GND" H 9605 5227 50  0000 C CNN
F 2 "" H 9600 5400 50  0001 C CNN
F 3 "" H 9600 5400 50  0001 C CNN
	1    9600 5400
	1    0    0    -1  
$EndComp
Text HLabel 1400 4750 0    50   Input ~ 0
HOST_RX
Text HLabel 1400 4850 0    50   Output ~ 0
HOST_TX
Wire Wire Line
	1400 4850 2900 4850
Connection ~ 9600 3850
Wire Wire Line
	9600 3850 9600 3250
Text HLabel 9900 3450 2    50   BiDi ~ 0
I2C_SCL
Text HLabel 9900 3750 2    50   BiDi ~ 0
I2C_SDA
Text HLabel 9900 3950 2    50   Output ~ 0
MEMS_INT
Text HLabel 1400 4150 0    50   BiDi ~ 0
~SLEEP_OBD~
Text HLabel 1400 4050 0    50   BiDi ~ 0
~RESET_OBD_SW~
Text HLabel 1400 3950 0    50   BiDi ~ 0
~RESET_OBD_HW~
Wire Wire Line
	1400 3950 3200 3950
Wire Wire Line
	1400 4050 1950 4050
Wire Wire Line
	1400 4150 2050 4150
$Comp
L power:GND #PWR03
U 1 1 5F91E8F3
P 1800 5400
F 0 "#PWR03" H 1800 5150 50  0001 C CNN
F 1 "GND" H 1805 5227 50  0000 C CNN
F 2 "" H 1800 5400 50  0001 C CNN
F 3 "" H 1800 5400 50  0001 C CNN
	1    1800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5400 1800 5250
$Comp
L power:+5V #PWR04
U 1 1 5F91DA5E
P 2800 5400
F 0 "#PWR04" H 2800 5250 50  0001 C CNN
F 1 "+5V" H 2815 5573 50  0000 C CNN
F 2 "" H 2800 5400 50  0001 C CNN
F 3 "" H 2800 5400 50  0001 C CNN
	1    2800 5400
	1    0    0    1   
$EndComp
Wire Wire Line
	2800 5400 2800 5250
$Comp
L CANtech:NodeMCU_ESP32_DevKit IC?
U 1 1 5F91DA68
P 5550 6500
AR Path="/5F91DA68" Ref="IC?"  Part="1" 
AR Path="/5F91C7D3/5F91DA68" Ref="IC1"  Part="1" 
F 0 "IC1" H 5725 10105 50  0000 C CNN
F 1 "NodeMCU_ESP32_DevKit" H 5725 10014 50  0000 C CNN
F 2 "" H 5550 6500 50  0001 C CNN
F 3 "" H 5550 6500 50  0001 C CNN
F 4 "https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf" H 5725 9923 50  0000 C CNN "Website"
	1    5550 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5050 3200 5050
Wire Wire Line
	1800 4550 3200 4550
NoConn ~ 3200 3950
NoConn ~ 3200 4050
NoConn ~ 3200 4150
NoConn ~ 3200 4550
NoConn ~ 3200 4750
NoConn ~ 3200 4850
NoConn ~ 3200 5050
$Comp
L 2828322:282832-2 J_HST_1
U 1 1 5F9D89CA
P 1950 3350
F 0 "J_HST_1" V 2245 3122 60  0000 R CNN
F 1 "282832-2" V 2139 3122 60  0000 R CNN
F 2 "footprints:282832-2" H 2350 3290 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 1950 3350 60  0001 C CNN
F 4 "282832-2" H 1950 3350 50  0001 C CNN "Part Name"
	1    1950 3350
	0    -1   -1   0   
$EndComp
$Comp
L 2828322:282832-2 J_HST_2
U 1 1 5F9D9258
P 2800 3350
F 0 "J_HST_2" V 3095 3122 60  0000 R CNN
F 1 "282832-2" V 2989 3122 60  0000 R CNN
F 2 "footprints:282832-2" H 3200 3290 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 2800 3350 60  0001 C CNN
F 4 "282832-2" H 2800 3350 50  0001 C CNN "Part Name"
	1    2800 3350
	0    -1   -1   0   
$EndComp
$Comp
L 2828322:282832-2 J_HST_5
U 1 1 5F9D9519
P 2450 5500
F 0 "J_HST_5" V 2639 5628 60  0000 L CNN
F 1 "282832-2" V 2745 5628 60  0000 L CNN
F 2 "footprints:282832-2" H 2850 5440 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 2450 5500 60  0001 C CNN
F 4 "282832-2" H 2450 5500 50  0001 C CNN "Part Name"
	1    2450 5500
	0    1    1    0   
$EndComp
$Comp
L 2828322:282832-2 J_HST_3
U 1 1 5F9DA91B
P 8350 2900
F 0 "J_HST_3" V 8645 2672 60  0000 R CNN
F 1 "282832-2" V 8539 2672 60  0000 R CNN
F 2 "footprints:282832-2" H 8750 2840 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 8350 2900 60  0001 C CNN
F 4 "282832-2" H 8350 2900 50  0001 C CNN "Part Name"
	1    8350 2900
	0    -1   -1   0   
$EndComp
$Comp
L 2828322:282832-2 J_HST_4
U 1 1 5F9DB09C
P 9250 2900
F 0 "J_HST_4" V 9545 2672 60  0000 R CNN
F 1 "282832-2" V 9439 2672 60  0000 R CNN
F 2 "footprints:282832-2" H 9650 2840 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 9250 2900 60  0001 C CNN
F 4 "282832-2" H 9250 2900 50  0001 C CNN "Part Name"
	1    9250 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 3350 1950 4050
Connection ~ 1950 4050
Wire Wire Line
	1950 4050 3200 4050
Wire Wire Line
	2050 3350 2050 4150
Connection ~ 2050 4150
Wire Wire Line
	2050 4150 3200 4150
Wire Wire Line
	2800 3350 2800 4750
Connection ~ 2800 4750
Wire Wire Line
	2800 4750 1400 4750
Wire Wire Line
	2900 3350 2900 4850
Connection ~ 2900 4850
Wire Wire Line
	2900 4850 3200 4850
Wire Wire Line
	8350 2900 8350 3450
Connection ~ 8350 3450
Wire Wire Line
	8350 3450 9900 3450
Wire Wire Line
	8450 2900 8450 3750
Connection ~ 8450 3750
Wire Wire Line
	8450 3750 9900 3750
Wire Wire Line
	9250 2900 9250 3950
Connection ~ 9250 3950
Wire Wire Line
	9250 3950 9900 3950
NoConn ~ 7800 3250
NoConn ~ 7800 3450
NoConn ~ 7800 3750
NoConn ~ 7800 3850
NoConn ~ 7800 3950
Wire Wire Line
	2450 5500 2450 5250
Wire Wire Line
	2450 5250 2800 5250
Connection ~ 2800 5250
Wire Wire Line
	2800 5250 2800 5050
Wire Wire Line
	2350 5500 2350 5250
Wire Wire Line
	2350 5250 1800 5250
Connection ~ 1800 5250
Wire Wire Line
	1800 5250 1800 4550
Wire Notes Line
	3600 2150 3600 5550
Wire Notes Line
	3600 5550 7450 5550
Wire Notes Line
	7450 5550 7450 2150
Wire Notes Line
	3600 2150 7450 2150
Text Notes 3750 2300 0    50   ~ 0
ESP32 Dev kit for visualisation purposes only
Text HLabel 9900 4050 2    50   Output ~ 0
MEMS_CS
Wire Wire Line
	9900 4050 9350 4050
NoConn ~ 7800 4050
Wire Wire Line
	9600 3850 9600 4350
Wire Wire Line
	9350 2900 9350 4050
Connection ~ 9350 4050
Wire Wire Line
	9350 4050 8750 4050
Text HLabel 9900 4150 2    50   Output ~ 0
MEMS_SA0
NoConn ~ 7800 4150
Wire Wire Line
	7800 4150 9900 4150
$Comp
L 2828322:282832-2 J_HST_6
U 1 1 5F9F4BEC
P 8850 4550
F 0 "J_HST_6" V 9039 4678 60  0000 L CNN
F 1 "282832-2" V 9145 4678 60  0000 L CNN
F 2 "footprints:282832-2" H 9250 4490 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 8850 4550 60  0001 C CNN
F 4 "282832-2" H 8850 4550 50  0001 C CNN "Part Name"
	1    8850 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 4550 8750 4050
Connection ~ 8750 4050
Wire Wire Line
	8750 4050 7800 4050
Wire Wire Line
	8850 4550 8850 4350
Wire Wire Line
	8850 4350 9600 4350
Connection ~ 9600 4350
Wire Wire Line
	9600 4350 9600 5400
$EndSCHEMATC
