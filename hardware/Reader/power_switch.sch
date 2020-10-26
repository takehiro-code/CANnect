EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 19
Title "CANnect Reader | Power Switch"
Date "2020-10-25"
Rev "0.0.03"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: PSW"
$EndDescr
Text HLabel 1550 4050 0    50   Input ~ 0
~PWR_CTRL~
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA57921
P 5900 3500
AR Path="/5F8ADA45/5FA57921" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA57921" Ref="Q_PSW_3"  Part="1" 
F 0 "Q_PSW_3" V 6489 3500 60  0000 C CNN
F 1 "NX7002AK,215" V 6383 3500 60  0000 C CNN
F 2 "footprints:SOT95P230X110-3N" H 6350 3240 60  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 5900 3500 60  0000 C CNN
F 4 "NX7002AK,215" H 5900 3500 50  0001 C CNN "Part Name"
F 5 "Nexperia USA Inc." H 5900 3500 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 5900 3500 50  0001 C CNN "Vendor"
F 7 "1727-1289-1-ND" H 5900 3500 50  0001 C CNN "digikeypn"
	1    5900 3500
	0    1    -1   0   
$EndComp
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA57927
P 7250 3500
AR Path="/5F8ADA45/5FA57927" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA57927" Ref="Q_PSW_4"  Part="1" 
F 0 "Q_PSW_4" V 7839 3500 60  0000 C CNN
F 1 "NX7002AK,215" V 7733 3500 60  0000 C CNN
F 2 "footprints:SOT95P230X110-3N" H 7700 3240 60  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 7250 3500 60  0000 C CNN
F 4 "NX7002AK,215" H 7250 3500 50  0001 C CNN "Part Name"
F 5 "Nexperia USA Inc." H 7250 3500 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 7250 3500 50  0001 C CNN "Vendor"
F 7 "1727-1289-1-ND" H 7250 3500 50  0001 C CNN "digikeypn"
	1    7250 3500
	0    1    -1   0   
$EndComp
$Comp
L NX7002AK_215:NX7002AK,215 Q_PSW_1
U 1 1 5FA59B13
P 3350 3950
F 0 "Q_PSW_1" H 3548 3946 50  0000 L CNN
F 1 "NX7002AK,215" H 3548 3855 50  0000 L CNN
F 2 "footprints:SOT95P230X110-3N" H 3350 3950 50  0001 L BNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 3350 3950 50  0001 L BNN
F 4 "Nexperia" H 3350 3950 50  0001 L BNN "Field4"
F 5 "7" H 3350 3950 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 3350 3950 50  0001 L BNN "Field6"
F 7 "NX7002AK,215" H 3350 3950 50  0001 C CNN "Part Name"
F 8 "Nexperia USA Inc." H 3350 3950 50  0001 C CNN "Manufacturer"
F 9 "DigiKey Canada" H 3350 3950 50  0001 C CNN "Vendor"
F 10 "1727-1289-1-ND" H 3350 3950 50  0001 C CNN "digikeypn"
	1    3350 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PSW_2
U 1 1 5FA5B8B4
P 3450 3250
F 0 "R_PSW_2" H 3509 3296 50  0000 L CNN
F 1 "100k" H 3509 3205 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 3450 3250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 3450 3250 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 3450 3250 50  0001 C CNN "Part Name"
F 5 "Yageo" H 3450 3250 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 3450 3250 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 3450 3250 50  0001 C CNN "digikeypn"
	1    3450 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PSW_1
U 1 1 5FA5BF09
P 2350 3550
F 0 "R_PSW_1" H 2409 3596 50  0000 L CNN
F 1 "100k" H 2409 3505 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 2350 3550 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 2350 3550 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 2350 3550 50  0001 C CNN "Part Name"
F 5 "Yageo" H 2350 3550 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 2350 3550 50  0001 C CNN "Vendor"
F 7 "311-2395-1-ND" H 2350 3550 50  0001 C CNN "digikeypn"
	1    2350 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5FA5C2C6
P 2350 1850
F 0 "#PWR0134" H 2350 1700 50  0001 C CNN
F 1 "+3.3V" H 2365 2023 50  0000 C CNN
F 2 "" H 2350 1850 50  0001 C CNN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0135
U 1 1 5FA5C48B
P 6850 1850
F 0 "#PWR0135" H 6850 1700 50  0001 C CNN
F 1 "+3.3V" H 6865 2023 50  0000 C CNN
F 2 "" H 6850 1850 50  0001 C CNN
F 3 "" H 6850 1850 50  0001 C CNN
	1    6850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4050 2350 3650
Wire Wire Line
	2350 3450 2350 1850
Wire Wire Line
	3450 3750 3450 3650
Wire Wire Line
	2350 4050 3150 4050
$Comp
L power:GND #PWR0137
U 1 1 5FA5FCA0
P 3450 4500
F 0 "#PWR0137" H 3450 4250 50  0001 C CNN
F 1 "GND" H 3455 4327 50  0000 C CNN
F 2 "" H 3450 4500 50  0001 C CNN
F 3 "" H 3450 4500 50  0001 C CNN
	1    3450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4250 3450 4500
Connection ~ 3450 3650
Wire Wire Line
	3450 3650 3450 3350
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA5791B
P 4650 3500
AR Path="/5F8ADA45/5FA5791B" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA5791B" Ref="Q_PSW_2"  Part="1" 
F 0 "Q_PSW_2" V 5239 3500 60  0000 C CNN
F 1 "NX7002AK,215" V 5133 3500 60  0000 C CNN
F 2 "footprints:SOT95P230X110-3N" H 5100 3240 60  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/NX7002AK.pdf" H 4650 3500 60  0000 C CNN
F 4 "NX7002AK,215" H 4650 3500 50  0001 C CNN "Part Name"
F 5 "Nexperia USA Inc." H 4650 3500 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4650 3500 50  0001 C CNN "Vendor"
F 7 "1727-1289-1-ND" H 4650 3500 50  0001 C CNN "digikeypn"
	1    4650 3500
	0    1    -1   0   
$EndComp
Wire Wire Line
	3450 3650 4650 3650
Wire Wire Line
	4650 3650 4650 3500
Connection ~ 4650 3650
Wire Wire Line
	7250 3650 7250 3500
$Comp
L CANtech:+5V_SW #PWR0140
U 1 1 5FA69F1C
P 6300 1850
F 0 "#PWR0140" H 6300 2100 50  0001 C CNN
F 1 "+5V_SW" H 6150 2000 50  0000 L CNN
F 2 "" H 5550 2650 50  0001 C CNN
F 3 "" H 5550 2650 50  0001 C CNN
	1    6300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3200 7650 3200
Wire Wire Line
	7050 3200 6850 3200
Wire Wire Line
	6850 3200 6850 1950
$Comp
L power:+5V #PWR0141
U 1 1 5FA6E79E
P 5500 1850
F 0 "#PWR0141" H 5500 1700 50  0001 C CNN
F 1 "+5V" H 5515 2023 50  0000 C CNN
F 2 "" H 5500 1850 50  0001 C CNN
F 3 "" H 5500 1850 50  0001 C CNN
	1    5500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0142
U 1 1 5FA6E93A
P 4250 1850
F 0 "#PWR0142" H 4250 1700 50  0001 C CNN
F 1 "+12V" H 4265 2023 50  0000 C CNN
F 2 "" H 4250 1850 50  0001 C CNN
F 3 "" H 4250 1850 50  0001 C CNN
	1    4250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3200 4250 3200
Wire Wire Line
	4250 3200 4250 1950
Wire Wire Line
	4850 3200 5050 3200
Wire Wire Line
	5050 3200 5050 1950
Wire Wire Line
	5700 3200 5500 3200
Wire Wire Line
	6100 3200 6300 3200
Wire Wire Line
	6300 3200 6300 1950
Wire Wire Line
	4650 3650 5900 3650
Wire Wire Line
	5900 3500 5900 3650
Connection ~ 5900 3650
Wire Wire Line
	5900 3650 7250 3650
Wire Wire Line
	5500 3200 5500 1950
$Comp
L CANtech:+12V_SW #PWR0145
U 1 1 5FB0601D
P 5050 1850
F 0 "#PWR0145" H 5050 2100 50  0001 C CNN
F 1 "+12V_SW" H 4850 2050 50  0000 L CNN
F 2 "" H 4300 2650 50  0001 C CNN
F 3 "" H 4300 2650 50  0001 C CNN
	1    5050 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4050 2350 4050
Connection ~ 2350 4050
Text HLabel 8200 3650 2    50   Output ~ 0
PWR_CTRL
Wire Wire Line
	7250 3650 8200 3650
Connection ~ 7250 3650
$Comp
L 2828322:282832-2 J_PSW_1
U 1 1 5F9A0984
P 4700 2100
F 0 "J_PSW_1" V 4889 2228 60  0000 L CNN
F 1 "282832-2" V 4995 2228 60  0000 L CNN
F 2 "footprints:282832-2" H 5100 2040 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 4700 2100 60  0001 C CNN
F 4 "282832-2" H 4700 2100 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4700 2100 50  0001 C CNN "Vendor"
F 6 "TE Connectivity AMP Connectors" H 4700 2100 50  0001 C CNN "Manufacturer"
F 7 "A113314-ND" H 4700 2100 50  0001 C CNN "digikeypn"
	1    4700 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 3150 3450 1850
$Comp
L power:+12V #PWR0136
U 1 1 5FA5EBBC
P 3450 1850
F 0 "#PWR0136" H 3450 1700 50  0001 C CNN
F 1 "+12V" H 3465 2023 50  0000 C CNN
F 2 "" H 3450 1850 50  0001 C CNN
F 3 "" H 3450 1850 50  0001 C CNN
	1    3450 1850
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+3.3V_SW #PWR0139
U 1 1 5FA68E31
P 7650 1850
F 0 "#PWR0139" H 7650 2100 50  0001 C CNN
F 1 "+3.3V_SW" H 7450 2000 50  0000 L CNN
F 2 "" H 6900 2650 50  0001 C CNN
F 3 "" H 6900 2650 50  0001 C CNN
	1    7650 1850
	1    0    0    -1  
$EndComp
$Comp
L 2828322:282832-2 J_PSW_2
U 1 1 5F9A6466
P 5950 2100
F 0 "J_PSW_2" V 6139 2228 60  0000 L CNN
F 1 "282832-2" V 6245 2228 60  0000 L CNN
F 2 "footprints:282832-2" H 6350 2040 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 5950 2100 60  0001 C CNN
F 4 "282832-2" H 5950 2100 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 5950 2100 50  0001 C CNN "Vendor"
F 6 "TE Connectivity AMP Connectors" H 5950 2100 50  0001 C CNN "Manufacturer"
F 7 "A113314-ND" H 5950 2100 50  0001 C CNN "digikeypn"
	1    5950 2100
	0    1    1    0   
$EndComp
$Comp
L 2828322:282832-2 J_PSW_3
U 1 1 5F9A673F
P 7300 2100
F 0 "J_PSW_3" V 7489 2228 60  0000 L CNN
F 1 "282832-2" V 7595 2228 60  0000 L CNN
F 2 "footprints:282832-2" H 7700 2040 60  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=282832&DocType=Customer+Drawing&DocLang=English" H 7300 2100 60  0001 C CNN
F 4 "282832-2" H 7300 2100 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 7300 2100 50  0001 C CNN "Vendor"
F 6 "TE Connectivity AMP Connectors" H 7300 2100 50  0001 C CNN "Manufacturer"
F 7 "A113314-ND" H 7300 2100 50  0001 C CNN "digikeypn"
	1    7300 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 3200 7650 1950
Wire Wire Line
	4600 2100 4600 1950
Wire Wire Line
	4600 1950 4250 1950
Connection ~ 4250 1950
Wire Wire Line
	4250 1950 4250 1850
Wire Wire Line
	4700 2100 4700 1950
Wire Wire Line
	4700 1950 5050 1950
Connection ~ 5050 1950
Wire Wire Line
	5050 1950 5050 1850
Wire Wire Line
	5850 1950 5500 1950
Connection ~ 5500 1950
Wire Wire Line
	5500 1950 5500 1850
Wire Wire Line
	5850 1950 5850 2100
Wire Wire Line
	5950 2100 5950 1950
Wire Wire Line
	5950 1950 6300 1950
Connection ~ 6300 1950
Wire Wire Line
	6300 1950 6300 1850
Wire Wire Line
	7200 2100 7200 1950
Wire Wire Line
	7200 1950 6850 1950
Connection ~ 6850 1950
Wire Wire Line
	6850 1950 6850 1850
Wire Wire Line
	7300 2100 7300 1950
Wire Wire Line
	7300 1950 7650 1950
Connection ~ 7650 1950
Wire Wire Line
	7650 1950 7650 1850
$EndSCHEMATC
