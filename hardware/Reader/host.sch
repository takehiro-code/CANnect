EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 13 19
Title "CANnect Reader | Host"
Date "2020-11-19"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 "Inspired by https://www.smart-prototyping.com/image/data/2_components/development_board/101839%20NodMCU-32S/1.png"
Comment4 "Component Identifier: HST"
$EndDescr
$Comp
L Device:C_Small C_HST_1
U 1 1 5FB5FEEA
P 6200 2000
F 0 "C_HST_1" V 5971 2000 50  0000 C CNN
F 1 "1uF" V 6062 2000 50  0000 C CNN
F 2 "footprints:0603" H 6200 2000 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_C1002_X7R_SMD.pdf" H 6200 2000 50  0001 C CNN
F 4 "Kermet" H 6200 2000 50  0001 C CNN "Manufacturer"
F 5 "C0603C105K4RACTU" H 6200 2000 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 6200 2000 50  0001 C CNN "Vendor"
F 7 "399-7847-1-ND" H 6200 2000 50  0001 C CNN "digikeypn"
	1    6200 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5FBAC756
P 6550 2000
F 0 "#PWR0109" H 6550 1750 50  0001 C CNN
F 1 "GND" H 6555 1827 50  0000 C CNN
F 2 "" H 6550 2000 50  0001 C CNN
F 3 "" H 6550 2000 50  0001 C CNN
	1    6550 2000
	1    0    0    -1  
$EndComp
Text HLabel 9650 3300 2    50   Input ~ 0
Analog_Voltage
Text HLabel 9650 2750 2    50   Input ~ 0
~PWR_CTRL~
Text HLabel 9650 3050 2    50   BiDi ~ 0
~RESET_OBD_HW~
Text HLabel 9650 2950 2    50   BiDi ~ 0
~RESET_OBD_SW~
Text HLabel 9650 2850 2    50   BiDi ~ 0
~SLEEP_OBD~
Text HLabel 8950 3650 2    50   Input ~ 0
HOST_RX
Text HLabel 8950 3750 2    50   Output ~ 0
HOST_TX
$Comp
L RF_Module:ESP32-WROOM-32D U_ESP32_?
U 1 1 5FBA986D
P 5600 3850
AR Path="/5F91C7D3/5FBA48CB/5FBA986D" Ref="U_ESP32_?"  Part="1" 
AR Path="/5F91C7D3/5FBA986D" Ref="U_HST_1"  Part="1" 
F 0 "U_HST_1" H 4900 4450 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 4650 4350 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 5600 2350 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 5300 3900 50  0001 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
Text HLabel 9700 4850 2    50   Output ~ 0
MEMS_INT1
Text HLabel 1500 4250 0    50   Output ~ 0
MEMS_SA0
Text HLabel 1500 4350 0    50   Output ~ 0
MEMS_CS
Text HLabel 9700 4950 2    50   Output ~ 0
MEMS_INT2
Text HLabel 1500 4100 0    50   BiDi ~ 0
I2C_SDA
Text HLabel 1500 3850 0    50   BiDi ~ 0
I2C_SCL
$Comp
L CANtech:4157 J_HST_2
U 1 1 5FBCD1BC
P 8650 5700
F 0 "J_HST_2" V 9063 5154 50  0000 C CNN
F 1 "4157" V 9154 5154 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 8650 5700 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/4157_Web.pdf" H 8650 5700 50  0001 C CNN
F 4 "DigiKey Canada" H 8650 5700 50  0001 C CNN "Vendor"
F 5 "Adafruit Industries LLC" H 8650 5700 50  0001 C CNN "Manufacturer"
F 6 "1528-2929-ND" H 8650 5700 50  0001 C CNN "digikeypn"
F 7 "4157" H 8650 5700 50  0001 C CNN "Part Name"
	1    8650 5700
	0    1    1    0   
$EndComp
$Comp
L CANtech:4157 J_HST_1
U 1 1 5FBD26B8
P 3500 5700
F 0 "J_HST_1" V 3913 5154 50  0000 C CNN
F 1 "4157" V 4004 5154 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 3500 5700 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/4157_Web.pdf" H 3500 5700 50  0001 C CNN
F 4 "DigiKey Canada" H 3500 5700 50  0001 C CNN "Vendor"
F 5 "Adafruit Industries LLC" H 3500 5700 50  0001 C CNN "Manufacturer"
F 6 "1528-2929-ND" H 3500 5700 50  0001 C CNN "digikeypn"
F 7 "4157" H 3500 5700 50  0001 C CNN "Part Name"
	1    3500 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 3650 8950 3650
Wire Wire Line
	6200 3750 8950 3750
$Comp
L power:+3.3V #PWR0110
U 1 1 5FBD4973
P 2000 1100
F 0 "#PWR0110" H 2000 950 50  0001 C CNN
F 1 "+3.3V" H 2015 1273 50  0000 C CNN
F 2 "" H 2000 1100 50  0001 C CNN
F 3 "" H 2000 1100 50  0001 C CNN
	1    2000 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5FBD4DBB
P 3900 1100
F 0 "#PWR0111" H 3900 850 50  0001 C CNN
F 1 "GND" H 3905 927 50  0000 C CNN
F 2 "" H 3900 1100 50  0001 C CNN
F 3 "" H 3900 1100 50  0001 C CNN
	1    3900 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 2000 6550 2000
Wire Wire Line
	5600 2450 5600 2000
Wire Wire Line
	5600 2000 6100 2000
Wire Notes Line
	1800 1150 1800 1900
Wire Notes Line
	4300 1900 4300 1150
Wire Notes Line
	4300 1150 1800 1150
Wire Notes Line
	1800 1900 4300 1900
Text Notes 2250 1750 0    50   ~ 0
Head Jumpers
Connection ~ 2000 2650
Wire Wire Line
	2000 2650 2000 5550
Wire Wire Line
	2000 1100 2000 2000
Wire Wire Line
	3900 1100 3900 5400
Wire Wire Line
	5600 2000 2000 2000
Connection ~ 5600 2000
Connection ~ 2000 2000
Wire Wire Line
	2000 2000 2000 2650
Wire Wire Line
	5000 2850 2100 2850
Wire Wire Line
	2100 2850 2100 5550
Wire Wire Line
	2200 5550 2200 2950
Wire Wire Line
	2200 2950 5000 2950
Wire Wire Line
	5600 5250 5600 5400
Wire Wire Line
	5600 5400 3900 5400
Connection ~ 3900 5400
Wire Wire Line
	3900 5400 3900 5550
$Comp
L power:GND #PWR0112
U 1 1 5FD0C84B
P 1150 3250
F 0 "#PWR0112" H 1150 3000 50  0001 C CNN
F 1 "GND" H 1155 3077 50  0000 C CNN
F 2 "" H 1150 3250 50  0001 C CNN
F 3 "" H 1150 3250 50  0001 C CNN
	1    1150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2650 2000 2650
$Comp
L Device:CP CP_HST_1
U 1 1 5FD11692
P 1150 2950
F 0 "CP_HST_1" H 1268 2996 50  0000 L CNN
F 1 "100uF" H 1268 2905 50  0000 L CNN
F 2 "footprints:UCB0J101MCL1GS" H 1188 2800 50  0001 C CNN
F 3 "https://www.nichicon.co.jp/english/products/pdfs/e-ucb.pdf" H 1150 2950 50  0001 C CNN
F 4 "Nichicon" H 1150 2950 50  0001 C CNN "Manufacturer"
F 5 "UCB0J101MCL1GS" H 1150 2950 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 1150 2950 50  0001 C CNN "Vendor"
F 7 "493-9357-1-ND" H 1150 2950 50  0001 C CNN "digikeypn"
	1    1150 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3100 1150 3250
Wire Wire Line
	1150 2800 1150 2650
Wire Wire Line
	2000 2650 5000 2650
$EndSCHEMATC
