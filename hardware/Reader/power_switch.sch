EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 8 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1550 3000 0    50   Input ~ 0
~PWR_CTRL~
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA57921
P 5900 2450
AR Path="/5F8ADA45/5FA57921" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA57921" Ref="Q14"  Part="1" 
F 0 "Q14" V 6489 2450 60  0000 C CNN
F 1 "IRLML5103TRPBF" V 6383 2450 60  0000 C CNN
F 2 "MICRO3_SOT23_INF" H 6350 2190 60  0001 C CNN
F 3 "" H 5900 2450 60  0000 C CNN
	1    5900 2450
	0    1    -1   0   
$EndComp
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA57927
P 7250 2450
AR Path="/5F8ADA45/5FA57927" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA57927" Ref="Q15"  Part="1" 
F 0 "Q15" V 7839 2450 60  0000 C CNN
F 1 "IRLML5103TRPBF" V 7733 2450 60  0000 C CNN
F 2 "MICRO3_SOT23_INF" H 7700 2190 60  0001 C CNN
F 3 "" H 7250 2450 60  0000 C CNN
	1    7250 2450
	0    1    -1   0   
$EndComp
Text HLabel 8750 2600 2    50   Input ~ 0
PWR_CTRL
$Comp
L NX7002AK_215:NX7002AK,215 Q16
U 1 1 5FA59B13
P 3350 2900
F 0 "Q16" H 3548 2896 50  0000 L CNN
F 1 "NX7002AK,215" H 3548 2805 50  0000 L CNN
F 2 "SOT95P230X110-3N" H 3350 2900 50  0001 L BNN
F 3 "1.1mm" H 3350 2900 50  0001 L BNN
F 4 "Nexperia" H 3350 2900 50  0001 L BNN "Field4"
F 5 "7" H 3350 2900 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 3350 2900 50  0001 L BNN "Field6"
	1    3350 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R63
U 1 1 5FA5B8B4
P 3450 2200
F 0 "R63" H 3509 2246 50  0000 L CNN
F 1 "100k" H 3509 2155 50  0000 L CNN
F 2 "" H 3450 2200 50  0001 C CNN
F 3 "~" H 3450 2200 50  0001 C CNN
	1    3450 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R64
U 1 1 5FA5BF09
P 2350 2500
F 0 "R64" H 2409 2546 50  0000 L CNN
F 1 "100k" H 2409 2455 50  0000 L CNN
F 2 "" H 2350 2500 50  0001 C CNN
F 3 "~" H 2350 2500 50  0001 C CNN
	1    2350 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FA5C2C6
P 2350 1850
F 0 "#PWR?" H 2350 1700 50  0001 C CNN
F 1 "+3.3V" H 2365 2023 50  0000 C CNN
F 2 "" H 2350 1850 50  0001 C CNN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FA5C48B
P 6850 1850
F 0 "#PWR?" H 6850 1700 50  0001 C CNN
F 1 "+3.3V" H 6865 2023 50  0000 C CNN
F 2 "" H 6850 1850 50  0001 C CNN
F 3 "" H 6850 1850 50  0001 C CNN
	1    6850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3000 2350 3000
Wire Wire Line
	2350 3000 2350 2600
Wire Wire Line
	2350 2400 2350 1850
$Comp
L power:+12V #PWR?
U 1 1 5FA5EBBC
P 3450 1850
F 0 "#PWR?" H 3450 1700 50  0001 C CNN
F 1 "+12V" H 3465 2023 50  0000 C CNN
F 2 "" H 3450 1850 50  0001 C CNN
F 3 "" H 3450 1850 50  0001 C CNN
	1    3450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2100 3450 1850
Wire Wire Line
	3450 2700 3450 2600
Wire Wire Line
	2350 3000 3150 3000
Connection ~ 2350 3000
$Comp
L power:GND #PWR?
U 1 1 5FA5FCA0
P 3450 3450
F 0 "#PWR?" H 3450 3200 50  0001 C CNN
F 1 "GND" H 3455 3277 50  0000 C CNN
F 2 "" H 3450 3450 50  0001 C CNN
F 3 "" H 3450 3450 50  0001 C CNN
	1    3450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3200 3450 3450
Connection ~ 3450 2600
Wire Wire Line
	3450 2600 3450 2300
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA5791B
P 4650 2450
AR Path="/5F8ADA45/5FA5791B" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA5791B" Ref="Q13"  Part="1" 
F 0 "Q13" V 5239 2450 60  0000 C CNN
F 1 "IRLML5103TRPBF" V 5133 2450 60  0000 C CNN
F 2 "MICRO3_SOT23_INF" H 5100 2190 60  0001 C CNN
F 3 "" H 4650 2450 60  0000 C CNN
	1    4650 2450
	0    1    -1   0   
$EndComp
Wire Wire Line
	3450 2600 4650 2600
Wire Wire Line
	4650 2600 4650 2450
Connection ~ 4650 2600
Wire Wire Line
	7250 2600 7250 2450
Connection ~ 7250 2600
Wire Wire Line
	7250 2600 8750 2600
$Comp
L power:+12V #PWR?
U 1 1 5FA63E83
P 5050 1850
F 0 "#PWR?" H 5050 1700 50  0001 C CNN
F 1 "+12V" H 5065 2023 50  0000 C CNN
F 2 "" H 5050 1850 50  0001 C CNN
F 3 "" H 5050 1850 50  0001 C CNN
	1    5050 1850
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+3.3V_SW PWR?
U 1 1 5FA68E31
P 7650 1850
F 0 "PWR?" H 7650 2100 50  0001 C CNN
F 1 "+3.3V_SW" H 7450 2000 50  0000 L CNN
F 2 "" H 6900 2650 50  0001 C CNN
F 3 "" H 6900 2650 50  0001 C CNN
	1    7650 1850
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+5V_SW PWR?
U 1 1 5FA69F1C
P 6300 1850
F 0 "PWR?" H 6300 2100 50  0001 C CNN
F 1 "+5V_SW" H 6150 2000 50  0000 L CNN
F 2 "" H 5550 2650 50  0001 C CNN
F 3 "" H 5550 2650 50  0001 C CNN
	1    6300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2150 7650 2150
Wire Wire Line
	7650 2150 7650 1850
Wire Wire Line
	7050 2150 6850 2150
Wire Wire Line
	6850 2150 6850 1850
$Comp
L power:+5V #PWR?
U 1 1 5FA6E79E
P 5500 1850
F 0 "#PWR?" H 5500 1700 50  0001 C CNN
F 1 "+5V" H 5515 2023 50  0000 C CNN
F 2 "" H 5500 1850 50  0001 C CNN
F 3 "" H 5500 1850 50  0001 C CNN
	1    5500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5FA6E93A
P 4250 1850
F 0 "#PWR?" H 4250 1700 50  0001 C CNN
F 1 "+12V" H 4265 2023 50  0000 C CNN
F 2 "" H 4250 1850 50  0001 C CNN
F 3 "" H 4250 1850 50  0001 C CNN
	1    4250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2150 4250 2150
Wire Wire Line
	4250 2150 4250 1850
Wire Wire Line
	4850 2150 5050 2150
Wire Wire Line
	5050 2150 5050 1850
Wire Wire Line
	5700 2150 5500 2150
Wire Wire Line
	6100 2150 6300 2150
Wire Wire Line
	6300 2150 6300 1850
Wire Wire Line
	4650 2600 5900 2600
Wire Wire Line
	5900 2450 5900 2600
Connection ~ 5900 2600
Wire Wire Line
	5900 2600 7250 2600
Wire Wire Line
	5500 2150 5500 1850
$EndSCHEMATC
