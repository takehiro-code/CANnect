/**
   ESP32 Bluetooth - Responsible to transmit to Bluetooth devices

   References:
   https://github.com/espressif/arduino-esp32/tree/master/libraries/BluetoothSerial
   https://github.com/espressif/arduino-esp32/tree/master/libraries/SPI
*/

/**
   Metadata
*/
#define CURRENT_VERSION "0.0.1"
#define ESP32_BL_NAME "BluetoothDebug"

/**
   Libraries
*/
#include "BluetoothSerial.h"

/**
 * PIDs
 */
#define ENGINE_COOLANT_TEMP   0x05
#define ENGINE_RPM            0x0C
#define VEHICLE_SPEED         0x0D
#define MAF_SENSOR            0x10
#define O2_VOLTAGE            0x14
#define THROTTLE              0x11
#define FUEL_PRESSURE         0x0A
#define FUEL_STATUS           0x03

#define PID_REQUEST           0x7DF
#define PID_REPLY             0x7E8

/**
 * CAN Protocol
 */
#define CAN_STANDARD_FRAME    0x00
#define CAN_EXTENDED_FRAME    0x01

/**
   Constants
*/
#define MESSAGE_INTERVAL          1000 // 1000 ms
#define MESSAGE_DELAY             20
#define BAUD_RATE                 115200
#define SETUP_DELAY               100
#define INITIALISATION_ATTEMPTS   5
#define MESSAGE_END               0xFF
#define SEND_INTERVAL             2000

/**
   Global Variables
*/
BluetoothSerial SerialBT;

/**
   Setup
*/
void setup() {
  Serial.begin(BAUD_RATE);

  SerialBT.begin(ESP32_BL_NAME); //Bluetooth device name
  Serial.println("The device started, now you can pair it with bluetooth!");
}

void loop() {
  simulateEngineRPM();
  simulateEngineCoolantTemperature();
  simulateUserDefinedData();
}

void receiveFromBluetooth(void) {
  if (SerialBT.available()) {
    Serial.print("Data from Bluetooth device: ");

    long unsigned int buf[64];
    int ii = 0;
    while (SerialBT.available()) {
      Serial.print(convertUint8ToChar(SerialBT.read()));
      delay(MESSAGE_DELAY);
    }

    Serial.println(" ");
  }
}

// Jin: I am fairly certain this is wrong but make do for now till
//      I find out more exactly how CAN messages are transmitted.
void sendToBluetooth(int len, unsigned long *buf) {
  for (int ii = 0; ii < len; ii++) {
    SerialBT.print(buf[ii]);
  }

  SerialBT.print(MESSAGE_END);
  SerialBT.println(MESSAGE_END);
  delay(SEND_INTERVAL);
}

uint8_t convertCharToUint8(char* string) {
  return (uint8_t)atoi(string);
}

char convertUint8ToChar(int number) {
  return (char)number;
}

void simulateEngineRPM(void) {
  unsigned long engineRpmData[9] = {PID_REPLY, 7, 0x84, 0x41, ENGINE_RPM, 0x15, 0, 0, 0};
  Serial.println("Sent EngineRpm PID");
  sendToBluetooth(9, engineRpmData);
}

void simulateEngineCoolantTemperature(void) {
  unsigned long engineCoolantTemperatureData[9] = {PID_REPLY, 7, 0x8F, 0x3F, ENGINE_COOLANT_TEMP, 0x15, 0x05, 0x0B, 0};
  Serial.println("Sent EngineCoolant PID");
  sendToBluetooth(9, engineCoolantTemperatureData);
}

void simulateUserDefinedData(void) {
  unsigned long randomData[10] = {PID_REPLY, 8, 0x41, 0x0D, VEHICLE_SPEED, 0x32, 0xAA, 0xAA, 0xAA, 0xAA};
  Serial.println("Sent User-Defined Data");
  sendToBluetooth(10, randomData);
}
