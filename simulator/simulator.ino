/**
   Arduino Uno & MCP2515 - Simulates a car

   References:
   https://github.com/Seeed-Studio/CAN_BUS_Shield
*/

#include <SPI.h>
#include <mcp_can.h>

/**
 * Arduino Hardware Pin-outs
 */
#define SERIAL_RX             2
#define SERIAL_TX             3
#define SPI_CS_PIN            10

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
 * Constants
 */
#define FILTER_FLAG           1 // set this to zero if you want to see everything
#define SEND_INTERVAL         1000 // 1000 ms
#define MESSAGE_DELAY         200
#define BAUD_RATE             115200

int ledHIGH    = 1;
int ledLOW     = 0;

MCP_CAN CAN(SPI_CS_PIN);

void setup()
{
  Serial.begin(BAUD_RATE);

  while (CAN_OK != CAN.begin(CAN_500KBPS)) {
    Serial.println("Simulator init Failed");
    delay(100);
  }
  Serial.println("Simulator Init OK!");
}

unsigned char stmp[8] = {ledHIGH, 1, 2, 3, ledLOW, 5, 6, 7};

void loop() {
  Serial.println("In loop");
  CAN.sendMsgBuf(0x43, 0, 8, stmp);
  delay(SEND_INTERVAL);

  simulateEngineRPM();
  simulateEngineCoolantTemperature();
}

void simulateEngineRPM(void) {
  unsigned char engineRpmData[8] = {0x84, 0x41, ENGINE_RPM, 0x15, 0, 0, 0};
  CAN.sendMsgBuf(PID_REPLY, 0, 8, engineRpmData);
  Serial.println("Sent EngineRpm PID");
  delay(SEND_INTERVAL);
}

void simulateEngineCoolantTemperature(void) {
  unsigned char engineCoolantTemperatureData[8] = {0x84, 0x41, ENGINE_COOLANT_TEMP, 0x15, 0, 0, 0};
  CAN.sendMsgBuf(PID_REPLY, 0, 8, engineCoolantTemperatureData);
  Serial.println("Sent EngineCoolant PID");
  delay(SEND_INTERVAL);
}
