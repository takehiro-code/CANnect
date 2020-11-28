EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 17
Title "CANnect Reader | IMU"
Date "2020-11-27"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: IMU"
$EndDescr
$Comp
L LSM6DSMTR:LSM6DSMTR U_MM_?
U 1 1 5FC2823C
P 6750 3550
AR Path="/5FC2823C" Ref="U_MM_?"  Part="1" 
AR Path="/5F988046/5FC2823C" Ref="U_MM_?"  Part="1" 
AR Path="/5FC2797A/5FC2823C" Ref="U_IMU_1"  Part="1" 
F 0 "U_IMU_1" H 6750 4317 50  0000 C CNN
F 1 "LSM6DSMTR" H 6750 4226 50  0000 C CNN
F 2 "footprints:PQFN50P300X250X86-14N" H 6750 3550 50  0001 L BNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/76/27/cf/88/c5/03/42/6b/DM00218116.pdf/files/DM00218116.pdf/jcr:content/translations/en.DM00218116.pdf" H 6750 3550 50  0001 L BNN
F 4 "0.86 mm" H 6750 3550 50  0001 L BNN "Field4"
F 5 "Rev 7" H 6750 3550 50  0001 L BNN "Field5"
F 6 "IPC 7351B" H 6750 3550 50  0001 L BNN "Field6"
F 7 "LSM6DSMTR" H 6750 3550 50  0001 C CNN "Part Name"
F 8 "STMicroelectronics" H 6750 3550 50  0001 C CNN "Manufacturer"
F 9 "DigiKey Canada" H 6750 3550 50  0001 C CNN "Vendor"
F 10 "497-16696-1-ND" H 6750 3550 50  0001 C CNN "digikeypn"
	1    6750 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_MM_?
U 1 1 5FC2824C
P 4450 4550
AR Path="/5FC2824C" Ref="C_MM_?"  Part="1" 
AR Path="/5F988046/5FC2824C" Ref="C_MM_?"  Part="1" 
AR Path="/5FC2797A/5FC2824C" Ref="C_IMU_1"  Part="1" 
F 0 "C_IMU_1" H 4565 4596 50  0000 L CNN
F 1 "100nF" H 4565 4505 50  0000 L CNN
F 2 "footprints:CAPC1608X90N" H 4488 4400 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 4450 4550 50  0001 C CNN
F 4 "C1608X7R2A103K080AA" H 4450 4550 50  0001 C CNN "Part Name"
F 5 "DigiKey Canada" H 4450 4550 50  0001 C CNN "Vendor"
F 6 "TDK Corporation" H 4450 4550 50  0001 C CNN "Manufacturer"
F 7 "445-1304-1-ND" H 4450 4550 50  0001 C CNN "digikeypn"
	1    4450 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC28252
P 8200 4900
AR Path="/5FC28252" Ref="#PWR?"  Part="1" 
AR Path="/5F988046/5FC28252" Ref="#PWR?"  Part="1" 
AR Path="/5FC2797A/5FC28252" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 8200 4650 50  0001 C CNN
F 1 "GND" H 8205 4727 50  0000 C CNN
F 2 "" H 8200 4900 50  0001 C CNN
F 3 "" H 8200 4900 50  0001 C CNN
	1    8200 4900
	1    0    0    -1  
$EndComp
NoConn ~ 7650 3550
NoConn ~ 7650 3650
Text HLabel 3300 3350 0    50   BiDi ~ 0
IMU_SCL
Text HLabel 3300 3450 0    50   BiDi ~ 0
IMU_SDA
Text HLabel 3300 3950 0    50   Output ~ 0
IMU_INT1
Text HLabel 3300 3550 0    50   Output ~ 0
IMU_SDO_SA0
Text HLabel 3300 4050 0    50   Output ~ 0
IMU_INT2
Wire Wire Line
	3300 3450 5550 3450
Wire Wire Line
	5850 3550 3300 3550
Wire Wire Line
	5850 3950 3300 3950
Wire Wire Line
	3300 4050 5850 4050
$Comp
L Device:R_Small R_IMU_1
U 1 1 5FC2E281
P 5000 2800
F 0 "R_IMU_1" H 5059 2846 50  0000 L CNN
F 1 "4.7k" H 5059 2755 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 5000 2800 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5000 2800 50  0001 C CNN
F 4 "Yageo" H 5000 2800 50  0001 C CNN "Manufacturer"
F 5 "RT0603DRD074K7L" H 5000 2800 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 5000 2800 50  0001 C CNN "Vendor"
F 7 "311-4.7KDCT-ND" H 5000 2800 50  0001 C CNN "digikeypn"
	1    5000 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_IMU_2
U 1 1 5FC2E5A5
P 5550 2800
F 0 "R_IMU_2" H 5609 2846 50  0000 L CNN
F 1 "4.7k" H 5609 2755 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 5550 2800 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 5550 2800 50  0001 C CNN
F 4 "Yageo" H 5550 2800 50  0001 C CNN "Manufacturer"
F 5 "RT0603DRD074K7L" H 5550 2800 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 5550 2800 50  0001 C CNN "Vendor"
F 7 "311-4.7KDCT-ND" H 5550 2800 50  0001 C CNN "digikeypn"
	1    5550 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2900 5000 3350
Connection ~ 5000 3350
Wire Wire Line
	5000 3350 3300 3350
Wire Wire Line
	5000 3350 5850 3350
Wire Wire Line
	5550 2900 5550 3450
Connection ~ 5550 3450
Wire Wire Line
	5550 3450 5850 3450
Wire Wire Line
	5000 2450 5000 2700
Connection ~ 5000 2450
Wire Wire Line
	5550 2700 5550 2450
Connection ~ 5550 2450
Wire Wire Line
	5550 2450 5000 2450
Wire Wire Line
	8200 3150 8200 2450
Wire Wire Line
	7650 3150 8200 3150
Wire Wire Line
	5550 2450 8200 2450
Wire Wire Line
	8200 4400 8200 3150
Connection ~ 8200 3150
$Comp
L power:GND #PWR?
U 1 1 5FC30CA4
P 4450 4900
AR Path="/5FC30CA4" Ref="#PWR?"  Part="1" 
AR Path="/5F988046/5FC30CA4" Ref="#PWR?"  Part="1" 
AR Path="/5FC2797A/5FC30CA4" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 4450 4650 50  0001 C CNN
F 1 "GND" H 4455 4727 50  0000 C CNN
F 2 "" H 4450 4900 50  0001 C CNN
F 3 "" H 4450 4900 50  0001 C CNN
	1    4450 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC30E64
P 8800 4900
AR Path="/5FC30E64" Ref="#PWR?"  Part="1" 
AR Path="/5F988046/5FC30E64" Ref="#PWR?"  Part="1" 
AR Path="/5FC2797A/5FC30E64" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 8800 4650 50  0001 C CNN
F 1 "GND" H 8805 4727 50  0000 C CNN
F 2 "" H 8800 4900 50  0001 C CNN
F 3 "" H 8800 4900 50  0001 C CNN
	1    8800 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_IMU_2
U 1 1 5FC32770
P 8200 4550
F 0 "C_IMU_2" H 8315 4596 50  0000 L CNN
F 1 "100nF" H 8315 4505 50  0000 L CNN
F 2 "footprints:CAPC1608X90N" H 8238 4400 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 8200 4550 50  0001 C CNN
F 4 "TDK Corporation" H 8200 4550 50  0001 C CNN "Manufacturer"
F 5 "C1608X7R2A103K080AA" H 8200 4550 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 8200 4550 50  0001 C CNN "Vendor"
F 7 "445-1304-1-ND" H 8200 4550 50  0001 C CNN "digikeypn"
	1    8200 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_IMU_3
U 1 1 5FC32983
P 8800 4550
F 0 "C_IMU_3" H 8915 4596 50  0000 L CNN
F 1 "100nF" H 8915 4505 50  0000 L CNN
F 2 "footprints:CAPC1608X90N" H 8838 4400 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_midvoltage_en.pdf" H 8800 4550 50  0001 C CNN
F 4 "TDK Corporation" H 8800 4550 50  0001 C CNN "Manufacturer"
F 5 "C1608X7R2A103K080AA" H 8800 4550 50  0001 C CNN "Part Name"
F 6 "DigiKey Canada" H 8800 4550 50  0001 C CNN "Vendor"
F 7 "445-1304-1-ND" H 8800 4550 50  0001 C CNN "digikeypn"
	1    8800 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4700 8200 4900
Wire Wire Line
	8800 4900 8800 4700
$Comp
L power:GND #PWR?
U 1 1 5FC34A44
P 7650 4900
AR Path="/5FC34A44" Ref="#PWR?"  Part="1" 
AR Path="/5F988046/5FC34A44" Ref="#PWR?"  Part="1" 
AR Path="/5FC2797A/5FC34A44" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 7650 4650 50  0001 C CNN
F 1 "GND" H 7655 4727 50  0000 C CNN
F 2 "" H 7650 4900 50  0001 C CNN
F 3 "" H 7650 4900 50  0001 C CNN
	1    7650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4150 7650 4900
Wire Wire Line
	7650 3050 8800 3050
Wire Wire Line
	8800 3050 8800 4400
Wire Wire Line
	8800 2150 8800 3050
Connection ~ 8800 3050
Wire Wire Line
	4450 3250 5850 3250
Wire Wire Line
	4450 3250 4450 4400
Connection ~ 4450 3250
Wire Wire Line
	4450 4700 4450 4900
Wire Notes Line
	6000 2950 6000 2250
Wire Notes Line
	6000 2250 4850 2250
Wire Notes Line
	4850 2250 4850 2950
Wire Notes Line
	4850 2950 6000 2950
Text Notes 5150 2350 0    50   ~ 0
I2C Pull-up resistor
$Comp
L power:GND #PWR?
U 1 1 5FC3AA30
P 5550 4900
AR Path="/5FC3AA30" Ref="#PWR?"  Part="1" 
AR Path="/5F988046/5FC3AA30" Ref="#PWR?"  Part="1" 
AR Path="/5FC2797A/5FC3AA30" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 5550 4650 50  0001 C CNN
F 1 "GND" H 5555 4727 50  0000 C CNN
F 2 "" H 5550 4900 50  0001 C CNN
F 3 "" H 5550 4900 50  0001 C CNN
	1    5550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3650 5550 3650
Wire Wire Line
	5550 3650 5550 3750
Wire Wire Line
	5850 3750 5550 3750
Connection ~ 5550 3750
Wire Wire Line
	5550 3750 5550 4900
Wire Wire Line
	4450 2150 4450 3250
Wire Wire Line
	5000 2150 5000 2450
$Comp
L power:+3.3V #PWR0148
U 1 1 5FE5F93E
P 4450 2150
F 0 "#PWR0148" H 4450 2000 50  0001 C CNN
F 1 "+3.3V" H 4465 2323 50  0000 C CNN
F 2 "" H 4450 2150 50  0001 C CNN
F 3 "" H 4450 2150 50  0001 C CNN
	1    4450 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0149
U 1 1 5FE5FC30
P 5000 2150
F 0 "#PWR0149" H 5000 2000 50  0001 C CNN
F 1 "+3.3V" H 5015 2323 50  0000 C CNN
F 2 "" H 5000 2150 50  0001 C CNN
F 3 "" H 5000 2150 50  0001 C CNN
	1    5000 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0150
U 1 1 5FE5FDC5
P 8800 2150
F 0 "#PWR0150" H 8800 2000 50  0001 C CNN
F 1 "+3.3V" H 8815 2323 50  0000 C CNN
F 2 "" H 8800 2150 50  0001 C CNN
F 3 "" H 8800 2150 50  0001 C CNN
	1    8800 2150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
