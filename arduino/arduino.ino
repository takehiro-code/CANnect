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

#define UNKNOWN_PID           0X45A // Unknown PID

#define PID_REQUEST           0x7DF
#define PID_REPLY             0x7E8

/**
   Constants
*/
#define FILTER_FLAG           1 // set this to zero if you want to see everything
#define MESSAGE_INTERVAL      1000 // 1000 ms
#define MESSAGE_DELAY         20
#define BAUD_RATE             115200
#define BUFFER_DELAY          100
#define TIMEOUT_MESSAGE_WAIT  100

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
  unsigned char pids[] = {ENGINE_RPM, VEHICLE_SPEED};
  //  unsigned char pids[] = {FUEL_PRESSURE, O2_VOLTAGE, ENGINE_COOLANT_TEMP, ENGINE_RPM, VEHICLE_SPEED, MAF_SENSOR, THROTTLE};
  int pidsLength = sizeof(pids) / sizeof(unsigned char);

  // Send requests for PIDs list every MESSAGE_INTERVAL
  if (elapsedTime - loopTime >= MESSAGE_INTERVAL) {
    //    sw.println("Sending a request");
    requestPIDs(pids, pidsLength);
    loopTime = millis();
  }
  requestPIDs(pids, pidsLength);

  //  requestPID(ENGINE_RPM);
  //  delay(BUFFER_DELAY);

  if (sw.available()) {
    while (sw.available()) {
      Serial.print(sw.read());
      delay(MESSAGE_DELAY);
    }
    Serial.println(" ");
  }

}

void checkMessageFilter(unsigned char pid, int timeoutSeconds) {
  tCAN message;
  unsigned long timeoutTimer = millis();

  while (millis() - timeoutTimer <= timeoutSeconds) {
    if (mcp2515_check_message()) {
      if (mcp2515_get_message(&message)) {
        if (message.id == PID_REPLY && message.data[2] == pid) {
          interpretMessage(message);
        }
      }
    }
  }
}

void checkMessage(void) {
  tCAN message;
  if (mcp2515_check_message()) {
    if (mcp2515_get_message(&message)) {
      interpretMessage(message);
    }
  }
}

void printMessage(tCAN message) {
  sw.print("ID: ");
  sw.print(message.id, HEX);
  sw.print(", ");
  sw.print("Data: ");
  sw.print(message.header.length, DEC);
  sw.print(" ");
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
  checkMessageFilter(pid, TIMEOUT_MESSAGE_WAIT);
}

void requestPIDs(unsigned char* pids, int length) {
  for (int ii = 0; ii < length; ii++) {
    requestPID(pids[ii]);
    delay(BUFFER_DELAY);
  }
}

void interpretMessage(tCAN message) {
  float engine_data = 0.0;

  switch (message.data[2]) { /* Details from http://en.wikipedia.org/wiki/OBD-II_PIDs */
    case ENGINE_RPM:        //   ((A*256)+B)/4    [RPM]
      engine_data =  ((message.data[3] * 256) + message.data[4]) / 4;
      sw.print("Engine RPM: ");
      sw.print(engine_data);
      sw.println(" rpm");
      Serial.print("Engine RPM: ");
      Serial.print(engine_data);
      Serial.println(" rpm");
      break;

    case ENGINE_COOLANT_TEMP:   //  A-40        [degree C]
      engine_data =  message.data[3] - 40;
      sw.print("Coolant Temp: ");
      sw.print(engine_data);
      sw.println(" degree C");
      break;

    case VEHICLE_SPEED:     // A          [km]
      engine_data =  message.data[3];
      sw.print("Vehicle Speed: ");
      sw.print(engine_data);
      sw.println("km/hr");
      Serial.print("Vehicle Speed: ");
      Serial.print(engine_data);
      Serial.println("km/hr");
      break;

    case MAF_SENSOR:        // ((256*A)+B) / 100  [g/s]
      engine_data =  ((message.data[3] * 256) + message.data[4]) / 100;
      sw.print("Mass Air Flow: ");
      sw.print(engine_data);
      sw.println("g/s");
      break;

    case O2_VOLTAGE:        // A * 0.005   (B-128) * 100/128 (if B==0xFF, sensor is not used in trim calc)
      engine_data = message.data[3] * 0.005;
      sw.print("Oxygen Sensor Voltage: ");
      sw.print(engine_data);
      sw.println("V");
      break;

    case THROTTLE:        // Throttle Position
      engine_data = (message.data[3] * 100) / 255;
      sw.print("Throttle Position: ");
      sw.print(engine_data);
      sw.println("%");
      break;

    default:
      printMessage(message);
      break;

  }
}
