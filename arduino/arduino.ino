/**
   Arduino Uno & SparkFun CAN Bus shield - Controls the CAN Bus controller

   References:
   https://github.com/sparkfun/SparkFun_CAN-Bus_Arduino_Library
*/

/**
   Libraries
*/
#include <SoftwareSerial.h>
#include <string.h>
#include <Canbus.h>
#include <defaults.h>
#include <global.h>
#include <mcp2515.h>
#include <mcp2515_defs.h>

/**
   Arduino Hardware Pin-outs
*/
#define SERIAL_RX             2
#define SERIAL_TX             3

/**
   PIDs
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
   Constants
*/
#define FILTER_FLAG           1 // set this to zero if you want to see everything
#define MESSAGE_INTERVAL      1000 // 1000 ms
#define MESSAGE_DELAY         20
#define BAUD_RATE             115200

/**
   Global Variables
*/
SoftwareSerial sw(SERIAL_RX, SERIAL_TX);
unsigned long loopTime = 0;

/**
   Setup
*/
void setup() {
  Serial.begin(BAUD_RATE);
  Serial.println("Interfacing with the Arduinos");
  sw.begin(BAUD_RATE);

  if (Canbus.init(CANSPEED_500)) { //Initialise MCP2515 CAN controller at the specified speed
    Serial.println("CAN Init ok");
  }

  else {
    Serial.println("Can't init CAN");
  }
}

/**
   Loop
*/
void loop() {
  unsigned long elapsedTime = millis();
  unsigned char pids[] = {ENGINE_COOLANT_TEMP, ENGINE_RPM, VEHICLE_SPEED};
  int pidsLength = sizeof(pids) / sizeof(unsigned char);

  // Send requests every MESSAGE_INTERVAL
  if (elapsedTime - loopTime >= MESSAGE_INTERVAL) {
    sw.println("Sending a request");
    requestPIDs(pids, pidsLength);
    loopTime = millis();
  }

  if (sw.available()) {
    Serial.print(sw.read());
    delay(MESSAGE_DELAY);
  }

  checkPIDMessageFilter(pids, pidsLength, false);
}

void checkPIDMessageFilter(unsigned char* pids, int length, bool filterOn) {
  tCAN message;
  if (mcp2515_check_message()) {
    if (mcp2515_get_message(&message)) {
      if (filterOn) {
        for (int ii = 0; ii < length; ii++) {
          if (message.id == PID_REPLY && message.data[2] == pids[ii]) {
            printMessage(message);
            return;
          }
        }
      }
      else {
        printMessage(message);
      }
    }
  }
}

void printMessage(tCAN message) {
  Serial.print("ID: ");
  Serial.print(message.id, HEX);
  Serial.println(" ");

  sw.print("ID: ");
  sw.print(message.id, HEX);
  sw.print(", ");
  sw.print("Data: ");
  sw.print(message.header.length, DEC);
  for (int i = 0; i < message.header.length; i++) {
    sw.print(message.data[i], HEX);
    sw.print(" ");
  }
  sw.println(" ");
}

void requestPID(unsigned char pid) {
  // Inspired by SparkFun's ECU Demo

  tCAN message;
  float data;
  int timeout = 0;
  char messageACK = 0;

  // Preparing the message
  message.id = PID_REQUEST;
  message.header.rtr = 0;
  message.header.length = 8;
  message.data[0] = 0x02;
  message.data[1] = 0x01;
  message.data[2] = pid;
  message.data[3] = 0x00;
  message.data[4] = 0x00;
  message.data[5] = 0x00;
  message.data[6] = 0x00;
  message.data[7] = 0x00;

  mcp2515_bit_modify(CANCTRL, (1 << REQOP2) | (1 << REQOP1) | (1 << REQOP0), 0);
  mcp2515_send_message(&message);
}

void requestPIDs(unsigned char* pids, int length) {
  for (int ii = 0; ii < length; ii++) {
    requestPID(pids[ii]);
  }
}
