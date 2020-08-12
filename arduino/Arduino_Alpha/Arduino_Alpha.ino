// Arduino Uno

#include <SoftwareSerial.h>
#include <string.h>
#include <Canbus.h>
#include <defaults.h>
#include <global.h>
#include <mcp2515.h>
#include <mcp2515_defs.h>

/**
   Constants
*/
#define FILTER_FLAG           1 // set this to zero if you want to see everything
#define MESSAGE_INTERVAL      1000 // 1000 ms
#define MESSAGE_DELAY           20 

/**
   Arduino Pin-outs
*/
#define rx 2
#define tx 3

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

SoftwareSerial sw(rx, tx); // RX, TX

unsigned long loopTime = 0;

/**
   Setup
*/
void setup() {
  Serial.begin(115200);
  Serial.println("Interfacing with the Arduinos");
  sw.begin(115200);

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
  unsigned char pids[] = {ENGINE_COOLANT_TEMP, ENGINE_RPM};
  int pidsLength = sizeof(pids)/sizeof(unsigned char);

  // Send requests every MESSAGE_INTERVAL
  if (elapsedTime - loopTime >= MESSAGE_INTERVAL) {
    sw.println("Sending a request");
    requestPIDs(pids, pidsLength);
    loopTime = millis();
  }

  if (sw.available()) {
    Serial.println("New message");
    Serial.write(sw.read());
    Serial.println(" ");
    delay(MESSAGE_DELAY);
  }

  checkPIDMessageFilter(pids, pidsLength);
}

void checkPIDMessageFilter(unsigned char* pids, int length) {
  tCAN message;
  if (mcp2515_check_message()) {
    if (mcp2515_get_message(&message)) {
      for (int ii=0; ii < length; ii++) {
        if (message.id == pids[ii]) {
          printMessage(message);
          return;
        }
      }
    }
  }
}

void checkPIDMessage(void) {
  tCAN message;
  if (mcp2515_check_message()) {
    if (mcp2515_get_message(&message)) {
      printMessage(message);
    }
  }
}

void printMessage(tCAN message) {
  sw.print("ID: ");
  sw.print(message.id, HEX);
  sw.print(", ");
  sw.print("Data: ");
  sw.print(message.header.length, DEC);
  for (int i = 0; i < message.header.length; i++) {
    sw.print(message.data[i], HEX);
    sw.print(" ");
  }
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
