EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 5
Title "ESP32 Sensor Module"
Date "2020-11-23"
Rev "v0.0.1"
Comp "Created by Choong Jin Ng | jin3838@gmail.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Component Identifier: "
$EndDescr
$Sheet
S 3450 2450 550  1250
U 5FB6755E
F0 "Power" 50
F1 "power.sch" 50
$EndSheet
$Sheet
S 4950 2450 850  1250
U 5FB6782A
F0 "ESP32 Chip" 50
F1 "esp32_chip.sch" 50
F2 "IMU_SCL" O R 5800 2700 50 
F3 "IMU_SDA" B R 5800 2800 50 
F4 "IMU_SDO_SAO" O R 5800 2900 50 
F5 "IMU_INT1" I R 5800 3350 50 
F6 "IMU_INT2" I R 5800 3450 50 
$EndSheet
$Sheet
S 6500 2450 800  1250
U 5FBC6BA3
F0 "IMU" 50
F1 "imu.sch" 50
F2 "IMU_SCL" I L 6500 2700 50 
F3 "IMU_SDA" B L 6500 2800 50 
F4 "IMU_INT1" O L 6500 3350 50 
F5 "IMU_INT2" O L 6500 3450 50 
F6 "IMU_SDO_SAO" B L 6500 2900 50 
$EndSheet
Wire Wire Line
	5800 2700 6500 2700
Wire Wire Line
	6500 2800 5800 2800
Wire Wire Line
	5800 2900 6500 2900
Wire Wire Line
	5800 3350 6500 3350
Wire Wire Line
	6500 3450 5800 3450
$Sheet
S 2050 2500 700  1200
U 5FE142C5
F0 "Connector" 50
F1 "connnector.sch" 50
$EndSheet
$EndSCHEMATC
