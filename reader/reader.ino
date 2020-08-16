/**
   ESP32 - Responsible to transmit to Bluetooth devices

   References:
   https://github.com/espressif/arduino-esp32/tree/master/libraries/BluetoothSerial
   https://github.com/espressif/arduino-esp32/tree/master/libraries/SPI
*/

/**
   Metadata
*/
//#define ALPHA_VERSION // uncomment this if you're working on the alpha-phase reader
#define CURRENT_VERSION "0.0.1"

#ifdef ALPHA_VERSION
#define ESP32_BL_NAME "ESP32Alpha"
#else
#define ESP32_BL_NAME "CANnectReader"
#endif

/**
   Libraries
*/
#include "BluetoothSerial.h"
#include <SPI.h>
#include "mcp_can.h"

/**
   ESP32 Pins
*/
//#define VSPI_MISO    19
//#define VSPI_MOSI    23
//#define VSPI_SCLK    18
#define VSPI_SS      5
//#define VSPI_INT     21

/**
   Constants
*/
#define MESSAGE_INTERVAL      1000 // 1000 ms
#define MESSAGE_DELAY         20
#define BAUD_RATE             115200
#define SETUP_DELAY           100

/**
   Global Variables
*/
MCP_CAN CAN(VSPI_SS);
BluetoothSerial SerialBT;

/**
   Setup
*/
void setup() {
  Serial.begin(BAUD_RATE);

#ifndef ALPHA_VERSION
  setupCANBus();
#endif

  SerialBT.begin(ESP32_BL_NAME); //Bluetooth device name
  Serial.println("The device started, now you can pair it with bluetooth!");
}

/**
   Loop
*/
void loop() {
#ifdef ALPHA_VERSION
  if (SerialBT.available()) {
    while (SerialBT.available()) {
      Serial.write(SerialBT.read());
      delay(MESSAGE_DELAY);
    }
    Serial.println(" ");
  }

  if (Serial.available()) {
    while (Serial.available()) {

      SerialBT.write(Serial.read());
      delay(MESSAGE_DELAY);
    }
    SerialBT.println(" ");
  }

#else
  writeToBluetooth();
  receiveFromBluetooth();
#endif
}

void writeToBluetooth(void) {
  unsigned char len = 0;
  unsigned char buf[64];

  if (CAN_MSGAVAIL == CAN.checkReceive()) {
    CAN.readMsgBuf(&len, buf);

    unsigned long canId = CAN.getCanId();

    SerialBT.print("Data from ID 0x");
    SerialBT.println(canId, HEX);

    for (int i = 0; i < len; i++) {
      SerialBT.print(buf[i]);
      SerialBT.print("\t");
    }
    SerialBT.println(" ");
  }
}

/**
   CAN Bus Setup
*/
void setupCANBus(void) {
  while (CAN_OK != CAN.begin(CAN_500KBPS)) {
    Serial.println("CAN BUS Init Failed");
    delay(SETUP_DELAY);
  }
  Serial.println("CAN BUS  Init OK!");
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

uint8_t convertCharToUint8(char* string) {
  return (uint8_t)atoi(string);
}

char convertUint8ToChar(int number) {
  return (char)number;
}
