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
#include "WiFi.h"
#include <esp_now.h>

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
#define MESSAGE_INTERVAL          1000 // 1000 ms
#define MESSAGE_DELAY             20
#define BAUD_RATE                 115200
#define SETUP_DELAY               100
#define INITIALISATION_ATTEMPTS   5
#define MESSAGE_END               0xFF
#define ESP32_WIFI_MODE           WIFI_STA

typedef struct canTechMsg {
  float accX;
  float accY;
  float accZ;

  float temperature;

  float gyroX;
  float gyroY;
  float gyroZ;
};

/**
   Global Variables
*/
MCP_CAN CAN(VSPI_SS);
BluetoothSerial SerialBT;
uint8_t broadcastAddress[] = {0xF0, 0x08, 0xD1, 0xD3, 0x6D, 0xA0}; // sensor's address - hard-coded for now
String success;
canTechMsg incomingData;

float accX, accY, accZ;
float gyroX, gyroY, gyroZ;
float temperature;

/**
   Setup
*/
void setup() {
  Serial.begin(BAUD_RATE);
  setupBluetooth();

#ifndef ALPHA_VERSION
  setupCANBus();
  setupWiFi();
  setupESPNow();
#endif
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
    SerialBT.print(MESSAGE_END);
    SerialBT.print(MESSAGE_END);
    Serial.println(" ");
  }

#else
  writeCANToBluetooth();
  receiveFromBluetooth();
#endif
  writeSerialToBluetooth();
}

void writeSerialToBluetooth(void) {
  if (Serial.available()) {
    while (Serial.available()) {

      SerialBT.write(Serial.read());
      delay(MESSAGE_DELAY);
    }
    SerialBT.print(MESSAGE_END);
    //    SerialBT.print(MESSAGE_END);
    //    SerialBT.println(" ");
  }
}

void writeCANToBluetooth(void) {
  unsigned char len = 0;
  unsigned char buf[64];

  if (CAN_MSGAVAIL == CAN.checkReceive()) {
    CAN.readMsgBuf(&len, buf);

    unsigned long canId = CAN.getCanId();
    SerialBT.print(canId, HEX);

    for (int i = 0; i < len; i++) {
      SerialBT.print(buf[i]);
      //      SerialBT.print("\t");
    }
    SerialBT.print(MESSAGE_END);
    //    SerialBT.print(MESSAGE_END);
    //    SerialBT.println(" ");
  }
}

/**
   CAN Bus Setup
*/
void setupCANBus(void) {
  int attempt = 0;
  while (CAN_OK != CAN.begin(CAN_500KBPS) && attempt < INITIALISATION_ATTEMPTS) {
    Serial.println("CAN BUS init attempt Failed");
    delay(SETUP_DELAY);
    attempt++;
  }

  Serial.println("CAN BUS Init OK!");
}

/**
   WiFi Setup
*/
void setupWiFi(void) {
  WiFi.mode(ESP32_WIFI_MODE);
  Serial.println(WiFi.macAddress());
}

void setupESPNow(void) {
    // Init ESP-NOW
  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  // Once ESPNow is successfully Init, we will register for Send CB to
  // get the status of Trasnmitted packet
  esp_now_register_send_cb(OnDataSent);
  
  // Register peer
  esp_now_peer_info_t peerInfo;
  memcpy(peerInfo.peer_addr, broadcastAddress, 6);
  peerInfo.channel = 0;  
  peerInfo.encrypt = false;
  
  // Add peer        
  if (esp_now_add_peer(&peerInfo) != ESP_OK){
    Serial.println("Failed to add peer");
    return;
  }
  // Register for a callback function that will be called when data is received
  esp_now_register_recv_cb(OnDataRecv);  
}

/**
   Bluetooth Setup
*/
void setupBluetooth(void) {
  SerialBT.begin(ESP32_BL_NAME); //Bluetooth device name
  Serial.println("The device started, now you can pair it with bluetooth!");
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

// Callback when data is sent
void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
  Serial.print("\r\nLast Packet Send Status:\t");
  Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
  if (status == 0) {
    success = "Delivery Success :)";
  }
  else {
    success = "Delivery Fail :(";
  }
}

// Callback when data is received
void OnDataRecv(const uint8_t * mac, const uint8_t *incomingD, int len) {
  memcpy(&incomingData, incomingD, sizeof(incomingData));
  uint8_t sensorMacAddress[6];
  memcpy(&sensorMacAddress, mac, sizeof(mac));
  
  Serial.print("Mac Address: ");
  Serial.print(sensorMacAddress[0], HEX);
  Serial.print(sensorMacAddress[1], HEX);
  Serial.print(sensorMacAddress[2], HEX);
  Serial.print(sensorMacAddress[3], HEX);
  Serial.print(sensorMacAddress[4], HEX);
  Serial.print(sensorMacAddress[5], HEX);
  Serial.print(" | Bytes received: ");
  Serial.print(len);

  accX = incomingData.accX;
  accY = incomingData.accY;
  accZ = incomingData.accZ;

  temperature = incomingData.temperature;

  gyroX = incomingData.gyroX;
  gyroY = incomingData.gyroY;
  gyroZ = incomingData.gyroZ;

  Serial.print(" | aX = "); Serial.print(accX);
  Serial.print(" | aY = "); Serial.print(accY);
  Serial.print(" | aZ = "); Serial.print(accZ);

  Serial.print(" | tmp = "); Serial.print(temperature);
  Serial.print(" | gX = "); Serial.print(gyroX);
  Serial.print(" | gY = "); Serial.print(gyroY);
  Serial.print(" | gZ = "); Serial.print(gyroZ);
  Serial.println();
  
//
//  // print out data to Bluetooth
//  SerialBT.print("aX = "); SerialBT.print(accX);
//  SerialBT.print(" | aY = "); SerialBT.print(accY);
//  SerialBT.print(" | aZ = "); SerialBT.print(accZ);
//  SerialBT.print(" | tmp = "); SerialBT.print(temperature);
//  SerialBT.print(" | gX = "); SerialBT.print(gyroX);
//  SerialBT.print(" | gY = "); SerialBT.print(gyroY);
//  SerialBT.print(" | gZ = "); SerialBT.print(gyroZ);
//  SerialBT.println();
}
