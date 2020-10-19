EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 9
Title "CANnect Reader"
Date "2020-10-18"
Rev "0.0.1"
Comp "CANtech"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 2000 3650 0    50   Input ~ 0
Pin16_Raw_+12V_Battery
Text GLabel 2000 1850 0    50   Input ~ 0
Pin4_GnD_Chassis
Text GLabel 2000 2000 0    50   Input ~ 0
Pin5_Gnd_Signal
Text GLabel 2000 2450 0    50   Input ~ 0
Pin8
Text GLabel 2000 2600 0    50   Input ~ 0
Pin9
Text GLabel 2000 3050 0    50   Input ~ 0
Pin12
Text GLabel 2000 3200 0    50   Input ~ 0
Pin13
NoConn ~ 2000 3050
NoConn ~ 2000 3200
NoConn ~ 2000 2600
NoConn ~ 2000 2450
Wire Wire Line
	2000 1850 2100 1850
Wire Wire Line
	2000 2000 2100 2000
Wire Wire Line
	2100 2000 2100 1850
Connection ~ 2100 1850
Wire Wire Line
	2100 1850 2350 1850
$Comp
L power:GND #PWR0101
U 1 1 5F8F20F1
P 2350 1850
F 0 "#PWR0101" H 2350 1600 50  0001 C CNN
F 1 "GND" H 2355 1677 50  0000 C CNN
F 2 "" H 2350 1850 50  0001 C CNN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F9AA491
P 9300 2750
F 0 "#PWR0102" H 9300 2500 50  0001 C CNN
F 1 "GND" H 9305 2577 50  0000 C CNN
F 2 "" H 9300 2750 50  0001 C CNN
F 3 "" H 9300 2750 50  0001 C CNN
	1    9300 2750
	1    0    0    -1  
$EndComp
$Sheet
S 2450 3950 750  250 
U 5F8ADA45
F0 "Power Supply" 50
F1 "power_supply.sch" 50
F2 "Raw_+12V" I L 2450 4050 50 
$EndSheet
Wire Wire Line
	9300 1650 9300 2250
Connection ~ 9300 2250
Wire Wire Line
	9300 2250 9300 2750
Text GLabel 2000 2900 0    50   Input ~ 0
Pin11_MS_CAN_Low
Text GLabel 2000 1700 0    50   Input ~ 0
Pin3_MS_CAN_High
Text GLabel 2000 2750 0    50   Input ~ 0
Pin10_SAE_J1850_BUS-
Text GLabel 2000 1550 0    50   Input ~ 0
Pin2_SAE_J1850_BUS+
Text GLabel 2000 3350 0    50   Input ~ 0
Pin14_ISO15765-4_CAN_BUS_Low
Text GLabel 2000 2150 0    50   Input ~ 0
Pin6_ISO15765-4_CAN_BUS_High
Text GLabel 2000 3500 0    50   Input ~ 0
Pin15_ISO9141_L-Line
Text GLabel 2000 2300 0    50   Input ~ 0
Pin7_ISO9141_K-Line
Wire Wire Line
	2000 2900 2450 2900
Wire Wire Line
	2000 1700 2450 1700
Wire Wire Line
	2000 2750 2450 2750
Wire Wire Line
	2000 1550 2450 1550
Wire Wire Line
	2000 3350 2450 3350
Wire Wire Line
	2000 2150 2450 2150
Wire Wire Line
	2000 3500 2450 3500
Wire Wire Line
	2000 2300 2450 2300
Text GLabel 2000 1400 0    50   Input ~ 0
Pin1_SW_CAN
Wire Wire Line
	2000 1400 2450 1400
$Sheet
S 2450 1350 750  2250
U 5F95F80B
F0 "OBDII Interpreter" 50
F1 "obdii.sch" 50
F2 "K-Line" B L 2450 2300 50 
F3 "L-Line" B L 2450 3500 50 
F4 "SW_CAN" I L 2450 1400 50 
F5 "J1850_BUS+" B L 2450 1550 50 
F6 "J1850_BUS-" B L 2450 2750 50 
F7 "MS_CAN_High" B L 2450 1700 50 
F8 "MS_CAN_Low" B L 2450 2900 50 
F9 "STN2110_TX" O R 3200 3150 50 
F10 "PWR_CTRL" O R 3200 1850 50 
F11 "HS_CAN_High" B L 2450 2150 50 
F12 "HS_CAN_Low" B L 2450 3350 50 
F13 "STN2110_RX" I R 3200 3250 50 
$EndSheet
$Sheet
S 3950 900  1000 250 
U 5FA56A4E
F0 "Power Switch" 50
F1 "power_switch.sch" 50
F2 "~PWR_CTRL~" I R 4950 1050 50 
F3 "PWR_CTRL" I L 3950 1050 50 
$EndSheet
$Sheet
S 9600 1700 550  900 
U 5F988046
F0 "Reader MEMs" 50
F1 "reader_mems.sch" 50
F2 "MEMS_SCL" B L 9600 1850 50 
F3 "MEMS_SDA" B L 9600 2150 50 
F4 "MEMS_INT" I L 9600 2350 50 
$EndSheet
Wire Wire Line
	8150 2350 9600 2350
Wire Wire Line
	8150 2150 9600 2150
Wire Wire Line
	8150 1650 9300 1650
Wire Wire Line
	8150 2250 9300 2250
Wire Wire Line
	8150 1850 9600 1850
$Comp
L power:GND #PWR0104
U 1 1 5FA13F0A
P 4850 3650
F 0 "#PWR0104" H 4850 3400 50  0001 C CNN
F 1 "GND" H 4855 3477 50  0000 C CNN
F 2 "" H 4850 3650 50  0001 C CNN
F 3 "" H 4850 3650 50  0001 C CNN
	1    4850 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5FA10F8A
P 5850 3650
F 0 "#PWR0103" H 5850 3500 50  0001 C CNN
F 1 "+5V" H 5865 3823 50  0000 C CNN
F 2 "" H 5850 3650 50  0001 C CNN
F 3 "" H 5850 3650 50  0001 C CNN
	1    5850 3650
	1    0    0    1   
$EndComp
$Comp
L CANtech:NodeMCU_ESP32_DevKit ESP32
U 1 1 5F91A3F3
P 6900 4900
F 0 "ESP32" H 7075 8505 50  0000 C CNN
F 1 "NodeMCU_ESP32_DevKit" H 7075 8414 50  0000 C CNN
F 2 "" H 6900 4900 50  0001 C CNN
F 3 "" H 6900 4900 50  0001 C CNN
F 4 "https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf" H 7075 8323 50  0000 C CNN "Website"
	1    6900 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3650 5850 3450
Wire Wire Line
	5850 3450 6250 3450
Wire Wire Line
	4850 3650 4850 2950
Wire Wire Line
	4850 2950 6250 2950
$Comp
L power:GND #PWR?
U 1 1 5FA7F77A
P 5800 1050
F 0 "#PWR?" H 5800 800 50  0001 C CNN
F 1 "GND" H 5805 877 50  0000 C CNN
F 2 "" H 5800 1050 50  0001 C CNN
F 3 "" H 5800 1050 50  0001 C CNN
	1    5800 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 1850 5300 1850
Wire Wire Line
	5300 1850 5300 1050
Wire Wire Line
	4950 1050 5300 1050
$Comp
L Device:R_Small Rdown
U 1 1 5FA811AB
P 5550 1050
F 0 "Rdown" V 5354 1050 50  0000 C CNN
F 1 "R???" V 5445 1050 50  0000 C CNN
F 2 "" H 5550 1050 50  0001 C CNN
F 3 "~" H 5550 1050 50  0001 C CNN
	1    5550 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1050 5450 1050
Connection ~ 5300 1050
Wire Wire Line
	5650 1050 5800 1050
Wire Wire Line
	5300 1850 3650 1850
Connection ~ 5300 1850
Wire Wire Line
	3950 1050 3650 1050
Wire Wire Line
	3650 1050 3650 1850
Connection ~ 3650 1850
Wire Wire Line
	3650 1850 3200 1850
Wire Wire Line
	3200 3150 6250 3150
Wire Wire Line
	6250 3250 3200 3250
Wire Wire Line
	2000 3650 2250 3650
Wire Wire Line
	2250 3650 2250 4050
Wire Wire Line
	2250 4050 2450 4050
Wire Notes Line
	2150 1200 2150 3850
Wire Notes Line
	2150 3850 600  3850
Wire Notes Line
	600  3850 600  1200
Wire Notes Line
	600  1200 2150 1200
Text Notes 600  1300 0    50   ~ 0
OBD-II Connector/Data Link Connector
$EndSCHEMATC
