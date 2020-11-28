EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 13 17
Title "CANnect Reader | Overvoltage Protection"
Date "2020-11-27"
Rev "0.0.05"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: OVP"
$EndDescr
Text HLabel 2550 2400 0    50   Input ~ 0
Raw_Voltage
Text HLabel 9600 2400 2    50   Output ~ 0
Protected_Voltage
Wire Wire Line
	2550 2400 2850 2400
Wire Wire Line
	2850 2400 2850 1400
Wire Wire Line
	9300 1400 9300 2400
Wire Wire Line
	9300 2400 9600 2400
Wire Wire Line
	2850 1400 9300 1400
Text Notes 4250 2200 0    50   ~ 0
Need to redesign this for new current specs
$EndSCHEMATC
