EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 13 19
Title "CANnect Reader | Host"
Date "2020-10-28"
Rev "0.0.04"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: HST"
$EndDescr
$Comp
L power:GND #PWR086
U 1 1 5F91E2ED
P 9600 5750
F 0 "#PWR086" H 9600 5500 50  0001 C CNN
F 1 "GND" H 9605 5577 50  0000 C CNN
F 2 "" H 9600 5750 50  0001 C CNN
F 3 "" H 9600 5750 50  0001 C CNN
	1    9600 5750
	1    0    0    -1  
$EndComp
Text HLabel 1400 3550 0    50   Input ~ 0
HOST_RX
Text HLabel 9900 3450 2    50   BiDi ~ 0
I2C_SCL
Text HLabel 9900 3150 2    50   BiDi ~ 0
I2C_SDA
Text HLabel 9900 3950 2    50   Output ~ 0
MEMS_INT2
Text HLabel 1400 4150 0    50   BiDi ~ 0
~SLEEP_OBD~
Text HLabel 1400 4050 0    50   BiDi ~ 0
~RESET_OBD_SW~
Text HLabel 1400 3950 0    50   BiDi ~ 0
~RESET_OBD_HW~
$Comp
L power:GND #PWR084
U 1 1 5F91E8F3
P 1800 5750
F 0 "#PWR084" H 1800 5500 50  0001 C CNN
F 1 "GND" H 1805 5577 50  0000 C CNN
F 2 "" H 1800 5750 50  0001 C CNN
F 3 "" H 1800 5750 50  0001 C CNN
	1    1800 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR085
U 1 1 5F91DA5E
P 2550 5750
F 0 "#PWR085" H 2550 5600 50  0001 C CNN
F 1 "+5V" H 2565 5923 50  0000 C CNN
F 2 "" H 2550 5750 50  0001 C CNN
F 3 "" H 2550 5750 50  0001 C CNN
	1    2550 5750
	1    0    0    1   
$EndComp
Text HLabel 9900 4050 2    50   Output ~ 0
MEMS_CS
Text HLabel 9900 4150 2    50   Output ~ 0
MEMS_SA0
$Comp
L Device:C_Small C_HST_1
U 1 1 5FB5FEEA
P 2200 5500
F 0 "C_HST_1" V 1971 5500 50  0000 C CNN
F 1 "1uF" V 2062 5500 50  0000 C CNN
F 2 "footprints:0603" H 2200 5500 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 2200 5500 50  0001 C CNN
F 4 "Kermet" H 2200 5500 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 2200 5500 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 2200 5500 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 2200 5500 50  0001 C CNN "digikeypn"
	1    2200 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 4950 9600 4950
Connection ~ 9600 4950
Wire Wire Line
	3050 4950 1800 4950
Connection ~ 1800 4950
Wire Wire Line
	1800 4950 1800 5500
Wire Wire Line
	1800 5500 2100 5500
Connection ~ 1800 5500
Wire Wire Line
	1800 5500 1800 5750
Wire Wire Line
	2300 5500 2550 5500
Connection ~ 2550 5500
Wire Wire Line
	2550 5500 2550 5750
Wire Wire Line
	9900 3450 8700 3450
Wire Wire Line
	9900 3950 8700 3950
Wire Wire Line
	9900 4050 8700 4050
Wire Wire Line
	9900 4150 8700 4150
Wire Wire Line
	8700 3050 9600 3050
Wire Wire Line
	9600 3050 9600 4650
Wire Wire Line
	8700 3150 9900 3150
Wire Wire Line
	8700 4650 9600 4650
Connection ~ 9600 4650
Wire Wire Line
	9600 4650 9600 4950
Wire Wire Line
	3050 4650 1800 4650
Wire Wire Line
	1800 4650 1800 4950
Wire Wire Line
	3050 4850 2550 4850
Wire Wire Line
	2550 4850 2550 5500
$Comp
L power:+5V #PWR0109
U 1 1 5FA77CAC
P 8850 5750
F 0 "#PWR0109" H 8850 5600 50  0001 C CNN
F 1 "+5V" H 8865 5923 50  0000 C CNN
F 2 "" H 8850 5750 50  0001 C CNN
F 3 "" H 8850 5750 50  0001 C CNN
	1    8850 5750
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C_HST_2
U 1 1 5FA77CB6
P 9250 5500
F 0 "C_HST_2" V 9021 5500 50  0000 C CNN
F 1 "1uF" V 9112 5500 50  0000 C CNN
F 2 "footprints:0603" H 9250 5500 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 9250 5500 50  0001 C CNN
F 4 "Kermet" H 9250 5500 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 9250 5500 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 9250 5500 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 9250 5500 50  0001 C CNN "digikeypn"
	1    9250 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 5750 8850 5500
Wire Wire Line
	8850 4850 8700 4850
Wire Wire Line
	8850 5500 9150 5500
Connection ~ 8850 5500
Wire Wire Line
	8850 4850 8850 5500
Wire Wire Line
	9600 4950 9600 5500
Wire Wire Line
	9350 5500 9600 5500
Connection ~ 9600 5500
Wire Wire Line
	9600 5500 9600 5750
Wire Wire Line
	1400 3950 3050 3950
Wire Wire Line
	1400 4050 3050 4050
Wire Wire Line
	1400 4150 3050 4150
Wire Wire Line
	1400 3450 3050 3450
Wire Wire Line
	1400 3550 3050 3550
Text HLabel 1400 4250 0    50   Input ~ 0
~PWR_CTRL~
Wire Wire Line
	1400 4250 3050 4250
Text HLabel 1400 3050 0    50   Input ~ 0
Analog_Voltage
Text HLabel 1400 3450 0    50   Output ~ 0
HOST_TX
Wire Wire Line
	1400 3050 3050 3050
NoConn ~ 8700 3250
NoConn ~ 8700 3350
NoConn ~ 8700 4750
NoConn ~ 8700 4550
NoConn ~ 8700 4450
NoConn ~ 8700 4350
NoConn ~ 8700 4250
NoConn ~ 8700 3650
NoConn ~ 8700 3550
NoConn ~ 3050 4750
NoConn ~ 3050 4550
NoConn ~ 3050 4450
NoConn ~ 3050 4350
NoConn ~ 3050 3850
NoConn ~ 3050 3750
NoConn ~ 3050 3650
NoConn ~ 3050 3350
NoConn ~ 3050 3250
NoConn ~ 3050 3150
Text HLabel 9900 3850 2    50   Output ~ 0
MEMS_INT1
NoConn ~ 8700 3750
Wire Wire Line
	8700 3850 9900 3850
$Comp
L CANtech:ESP32_Holder U_HST_1
U 1 1 5FBBDB78
P 5750 2950
F 0 "U_HST_1" H 5750 3067 50  0000 C CNN
F 1 "ESP32_Holder" H 5750 2976 50  0000 C CNN
F 2 "footprints:ESP32_Holder" H 5750 2950 50  0001 C CNN
F 3 "" H 5750 2950 50  0001 C CNN
	1    5750 2950
	1    0    0    -1  
$EndComp
$Comp
L CANtech:4157 J_HST_1
U 1 1 5FBCBB48
P 3200 3450
F 0 "J_HST_1" H 3050 1800 50  0000 L CNN
F 1 "4157" H 3150 1700 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 3200 3450 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/4157_Web.pdf" H 3200 3450 50  0001 C CNN
F 4 "DigiKey Canada" H 3200 3450 50  0001 C CNN "Vendor"
F 5 "Adafruit Industries LLC" H 3200 3450 50  0001 C CNN "Manufacturer"
F 6 "1528-2929-ND" H 3200 3450 50  0001 C CNN "digikeypn"
	1    3200 3450
	1    0    0    -1  
$EndComp
$Comp
L CANtech:4157 J_HST_2
U 1 1 5FBCDB9A
P 3850 4550
F 0 "J_HST_2" H 3938 2833 50  0000 C CNN
F 1 "4157" H 3938 2924 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 3850 4550 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/4157_Web.pdf" H 3850 4550 50  0001 C CNN
F 4 "DigiKey Canada" H 3850 4550 50  0001 C CNN "Vendor"
F 5 "Adafruit Industries LLC" H 3850 4550 50  0001 C CNN "Manufacturer"
F 6 "1528-2929-ND" H 3850 4550 50  0001 C CNN "digikeypn"
	1    3850 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 3050 5300 3050
Wire Wire Line
	4000 3150 5300 3150
Wire Wire Line
	4000 3250 5300 3250
Wire Wire Line
	4000 3350 5300 3350
Wire Wire Line
	4000 3450 5300 3450
Wire Wire Line
	4000 3550 5300 3550
Wire Wire Line
	4000 3650 5300 3650
Wire Wire Line
	4000 3750 5300 3750
Wire Wire Line
	4000 3850 5300 3850
Wire Wire Line
	4000 3950 5300 3950
Wire Wire Line
	4000 4050 5300 4050
Wire Wire Line
	4000 4150 5300 4150
Wire Wire Line
	4000 4250 5300 4250
Wire Wire Line
	4000 4350 5300 4350
Wire Wire Line
	4000 4450 5300 4450
Wire Wire Line
	4000 4550 5300 4550
Wire Wire Line
	4000 4650 5300 4650
Wire Wire Line
	4000 4750 5300 4750
Wire Wire Line
	4000 4850 5300 4850
Wire Wire Line
	4000 4950 5300 4950
$Comp
L CANtech:4157 J_HST_4
U 1 1 5FC055A1
P 8550 4550
F 0 "J_HST_4" H 8638 2833 50  0000 C CNN
F 1 "4157" H 8638 2924 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 8550 4550 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/4157_Web.pdf" H 8550 4550 50  0001 C CNN
F 4 "DigiKey Canada" H 8550 4550 50  0001 C CNN "Vendor"
F 5 "Adafruit Industries LLC" H 8550 4550 50  0001 C CNN "Manufacturer"
F 6 "1528-2929-ND" H 8550 4550 50  0001 C CNN "digikeypn"
	1    8550 4550
	-1   0    0    1   
$EndComp
$Comp
L CANtech:4157 J_HST_3
U 1 1 5FC06287
P 7900 3450
F 0 "J_HST_3" H 7750 1800 50  0000 L CNN
F 1 "4157" H 7850 1700 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 7900 3450 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/4157_Web.pdf" H 7900 3450 50  0001 C CNN
F 4 "DigiKey Canada" H 7900 3450 50  0001 C CNN "Vendor"
F 5 "Adafruit Industries LLC" H 7900 3450 50  0001 C CNN "Manufacturer"
F 6 "1528-2929-ND" H 7900 3450 50  0001 C CNN "digikeypn"
	1    7900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3050 7750 3050
Wire Wire Line
	6200 3150 7750 3150
Wire Wire Line
	6200 3250 7750 3250
Wire Wire Line
	7750 3350 6200 3350
Wire Wire Line
	6200 3450 7750 3450
Wire Wire Line
	7750 3550 6200 3550
Wire Wire Line
	6200 3650 7750 3650
Wire Wire Line
	7750 3750 6200 3750
Wire Wire Line
	6200 3850 7750 3850
Wire Wire Line
	7750 3950 6200 3950
Wire Wire Line
	6200 4050 7750 4050
Wire Wire Line
	7750 4150 6200 4150
Wire Wire Line
	6200 4250 7750 4250
Wire Wire Line
	7750 4350 6200 4350
Wire Wire Line
	6200 4450 7750 4450
Wire Wire Line
	7750 4550 6200 4550
Wire Wire Line
	6200 4650 7750 4650
Wire Wire Line
	7750 4750 6200 4750
Wire Wire Line
	6200 4850 7750 4850
Wire Wire Line
	7750 4950 6200 4950
Wire Notes Line
	2900 2700 2900 5350
Wire Notes Line
	2900 5350 9000 5350
Wire Notes Line
	9000 5350 9000 2700
Wire Notes Line
	9000 2700 2900 2700
Text Notes 3550 5250 0    50   ~ 0
Place a ESP32 dev kit here and use male-to-male wires to wire according to the ESP32's pinout diagram
$EndSCHEMATC
