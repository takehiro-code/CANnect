EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 19
Title "CANnect Reader | ISO 9141/ISO 14230 Transceiver"
Date "2020-10-28"
Rev "0.0.04"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: ISO"
$EndDescr
Wire Wire Line
	4900 4650 4900 4800
$Comp
L power:+12V #PWR011
U 1 1 5FA9FF9E
P 4900 4800
F 0 "#PWR011" H 4900 4650 50  0001 C CNN
F 1 "+12V" H 4915 4973 50  0000 C CNN
F 2 "" H 4900 4800 50  0001 C CNN
F 3 "" H 4900 4800 50  0001 C CNN
	1    4900 4800
	1    0    0    1   
$EndComp
$Comp
L power:+12V #PWR013
U 1 1 5FA9FB8D
P 4900 2800
F 0 "#PWR013" H 4900 2650 50  0001 C CNN
F 1 "+12V" H 4915 2973 50  0000 C CNN
F 2 "" H 4900 2800 50  0001 C CNN
F 3 "" H 4900 2800 50  0001 C CNN
	1    4900 2800
	1    0    0    1   
$EndComp
Wire Wire Line
	4900 4100 4900 4250
$Comp
L Device:R_Small R_ISO_3
U 1 1 5FA9DCCB
P 4900 4000
F 0 "R_ISO_3" H 4841 3954 50  0000 R CNN
F 1 "510k/0.5W" H 4841 4045 50  0000 R CNN
F 2 "footprints:RESC2012X70N" H 4900 4000 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDO0000/AOA0000C331.pdf" H 4900 4000 50  0001 C CNN
F 4 "ERJ-P06J514V" H 4900 4000 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4900 4000 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 4900 4000 50  0001 C CNN "Manufacturer"
F 7 "P510KADCT-ND" H 4900 4000 50  0001 C CNN "digikeypn"
	1    4900 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 3550 4200 3550
Wire Wire Line
	4500 3550 4600 3550
Wire Wire Line
	4900 2650 4900 2800
$Comp
L Device:R_Small R_ISO_1
U 1 1 5FA9A19B
P 4400 3550
F 0 "R_ISO_1" V 4204 3550 50  0000 C CNN
F 1 "1k" V 4295 3550 50  0000 C CNN
F 2 "footprints:RC1608F102CS" H 4400 3550 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/RC_Series_ds.pdf" H 4400 3550 50  0001 C CNN
F 4 "RC1608F102CS" H 4400 3550 50  0001 C CNN "Part Name"
F 5 "Samsung Electro-Mechanics" H 4400 3550 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4400 3550 50  0001 C CNN "Vendor"
F 7 "1276-3484-1-ND" H 4400 3550 50  0001 C CNN "digikeypn"
	1    4400 3550
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5FA99780
P 4900 1300
F 0 "#PWR014" H 4900 1050 50  0001 C CNN
F 1 "GND" H 4905 1127 50  0000 C CNN
F 2 "" H 4900 1300 50  0001 C CNN
F 3 "" H 4900 1300 50  0001 C CNN
	1    4900 1300
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5FA99363
P 4900 3350
F 0 "#PWR012" H 4900 3100 50  0001 C CNN
F 1 "GND" H 4905 3177 50  0000 C CNN
F 2 "" H 4900 3350 50  0001 C CNN
F 3 "" H 4900 3350 50  0001 C CNN
	1    4900 3350
	1    0    0    1   
$EndComp
Wire Wire Line
	4900 2150 4900 2250
$Comp
L Transistor_BJT:MMBT3904 Q_ISO_4
U 1 1 5FA953EB
P 4800 1500
F 0 "Q_ISO_4" H 4990 1546 50  0000 L CNN
F 1 "MMBT3904WT1G" H 4990 1455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5000 1425 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBT3904WT1-D.PDF" H 4800 1500 50  0001 L CNN
F 4 "MMBT3904WT1G" H 4800 1500 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4800 1500 50  0001 C CNN "Vendor"
F 6 "ON Semiconductor" H 4800 1500 50  0001 C CNN "Manufacturer"
F 7 "MMBT3904WT1GOSCT-ND" H 4800 1500 50  0001 C CNN "digikeypn"
	1    4800 1500
	1    0    0    1   
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q_ISO_3
U 1 1 5FA9434C
P 4800 3550
F 0 "Q_ISO_3" H 4990 3596 50  0000 L CNN
F 1 "MMBT3904WT1G" H 4990 3505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5000 3475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBT3904WT1-D.PDF" H 4800 3550 50  0001 L CNN
F 4 "MMBT3904WT1G" H 4800 3550 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4800 3550 50  0001 C CNN "Vendor"
F 6 "ON Semiconductor" H 4800 3550 50  0001 C CNN "Manufacturer"
F 7 "MMBT3904WT1GOSCT-ND" H 4800 3550 50  0001 C CNN "digikeypn"
	1    4800 3550
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R_ISO_4
U 1 1 5FA9021C
P 4900 2050
F 0 "R_ISO_4" H 4841 2004 50  0000 R CNN
F 1 "510k/0.5W" H 4841 2095 50  0000 R CNN
F 2 "footprints:RESC2012X70N" H 4900 2050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDO0000/AOA0000C331.pdf" H 4900 2050 50  0001 C CNN
F 4 "ERJ-P06J514V" H 4900 2050 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4900 2050 50  0001 C CNN "Vendor"
F 6 "Panasonic Electronic Components" H 4900 2050 50  0001 C CNN "Manufacturer"
F 7 "P510KADCT-ND" H 4900 2050 50  0001 C CNN "digikeypn"
	1    4900 2050
	-1   0    0    -1  
$EndComp
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF Q_ISO_2
U 1 1 5FA86CC3
P 4600 2450
F 0 "Q_ISO_2" H 5030 2397 60  0000 L CNN
F 1 "IRLML5103TRPBF" H 5030 2503 60  0000 L CNN
F 2 "footprints:IRLML5103TRPBF" H 5050 2190 60  0001 C CNN
F 3 "https://www.infineon.com/dgdl/irlml5103pbf.pdf?fileId=5546d462533600a401535668505d2617" H 4600 2450 60  0001 C CNN
F 4 "IRLML5103TRPBF" H 4600 2450 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4600 2450 50  0001 C CNN "Vendor"
F 6 "Infineon Technologies" H 4600 2450 50  0001 C CNN "Manufacturer"
F 7 "IRLML5103PBFCT-ND" H 4600 2450 50  0001 C CNN "digikeypn"
	1    4600 2450
	1    0    0    -1  
$EndComp
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF Q_ISO_1
U 1 1 5FA8641A
P 4600 4450
F 0 "Q_ISO_1" H 5030 4397 60  0000 L CNN
F 1 "IRLML5103TRPBF" H 5030 4503 60  0000 L CNN
F 2 "footprints:IRLML5103TRPBF" H 5050 4190 60  0001 C CNN
F 3 "https://www.infineon.com/dgdl/irlml5103pbf.pdf?fileId=5546d462533600a401535668505d2617" H 4600 4450 60  0001 C CNN
F 4 "IRLML5103TRPBF" H 4600 4450 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4600 4450 50  0001 C CNN "Vendor"
F 6 "Infineon Technologies" H 4600 4450 50  0001 C CNN "Manufacturer"
F 7 "IRLML5103PBFCT-ND" H 4600 4450 50  0001 C CNN "digikeypn"
	1    4600 4450
	1    0    0    -1  
$EndComp
Text HLabel 4200 3550 0    50   Input ~ 0
~ISO_K_TX~
Text HLabel 4200 1500 0    50   Input ~ 0
~ISO_L_TX~
$Comp
L Device:R_Small R_ISO_2
U 1 1 5FAABEED
P 4400 1500
F 0 "R_ISO_2" V 4204 1500 50  0000 C CNN
F 1 "1k" V 4295 1500 50  0000 C CNN
F 2 "footprints:RC1608F102CS" H 4400 1500 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/RC_Series_ds.pdf" H 4400 1500 50  0001 C CNN
F 4 "RC1608F102CS" H 4400 1500 50  0001 C CNN "Part Name"
F 5 "Samsung Electro-Mechanics" H 4400 1500 50  0001 C CNN "Manufacturer"
F 6 "DigiKey Canada" H 4400 1500 50  0001 C CNN "Vendor"
F 7 "1276-3484-1-ND" H 4400 1500 50  0001 C CNN "digikeypn"
	1    4400 1500
	0    1    -1   0   
$EndComp
Wire Wire Line
	4200 1500 4300 1500
Wire Wire Line
	4500 1500 4600 1500
Text HLabel 6000 3800 2    50   BiDi ~ 0
K-Line
Text HLabel 6000 1850 2    50   BiDi ~ 0
L-Line
Wire Wire Line
	4900 3900 4900 3800
Wire Wire Line
	4900 1950 4900 1850
Wire Wire Line
	4900 3800 6000 3800
Connection ~ 4900 3800
Wire Wire Line
	4900 3800 4900 3750
Wire Wire Line
	4900 1850 6000 1850
Connection ~ 4900 1850
Wire Wire Line
	4900 1850 4900 1700
Wire Wire Line
	3750 2450 4600 2450
Wire Wire Line
	3750 4450 4600 4450
Wire Wire Line
	3750 3300 3750 4450
Wire Wire Line
	3700 3300 3750 3300
Text HLabel 3700 3300 0    50   Input ~ 0
PWR_CTRL
Wire Wire Line
	3750 3300 3750 2450
Connection ~ 3750 3300
$EndSCHEMATC
