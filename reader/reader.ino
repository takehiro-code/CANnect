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
 * Flags
 * Change this depending on hardware/version setup
 */
//#define STN_CHIP_CONNECTED // comment this out if you're not connected to the STN chip

/**
   Libraries
*/
#include "BluetoothSerial.h"
#include <SPI.h>
//#include "mcp_can.h"
#include <WiFi.h>
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
 * Structures
 */
typedef struct imuMsg {
  String msgID = "6DOF";
  //  char[10] sensorModuleMACAddress;

  float accX;
  float accY;
  float accZ;

  float gyroX;
  float gyroY;
  float gyroZ;

  float temperature;
};

/**
   Constants
*/
#define MESSAGE_INTERVAL          1000 // 1000 ms
#define MESSAGE_DELAY             20
#define BAUD_RATE                 115200
#define BAUD                      9600
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
//MCP_CAN CAN(VSPI_SS);
BluetoothSerial SerialBT;
uint8_t broadcastAddress[] = {0xF0, 0x08, 0xD1, 0xD3, 0x6D, 0xA0}; // sensor's address - hard-coded for now
String success;
canTechMsg incomingData;

float accX, accY, accZ;
float gyroX, gyroY, gyroZ;
float temperature;
boolean protocolFlag = false;
char c43[] = "43";
char error[] = "ERROR";
char noData[] = "NO DATA";
const byte numChars = 32;
char charArray[numChars];
char protocolArray[numChars];
int iso9141 = 100;
String str1 = "";
unsigned long programStarted = 0;
const long interval = 500;

/**
   Setup
*/
void setup() {
  Serial.begin(BAUD_RATE);
  setupReader();
  setupBluetooth();

  while (!Serial2) {
    ;
    Serial.println("Connect to the reader");
  }

  while (!SerialBT.available()) {
    ;
    digitalWrite(22, HIGH);
    delay(500);
    digitalWrite(22, LOW);
    delay(500);
    Serial.println("pair up the BT");
  }

  pinMode(22, OUTPUT);
  pinMode(23, OUTPUT);

  #ifndef STN_CHIP_CONNECTED
    // Do not search for protocol if not connected
    protocolFlag = true;
  #endif

  while (!protocolFlag) {
    digitalWrite(23, HIGH);

    findCorrectProtocol();
    flushBuffers();
    if (str1 == "22") {
      Serial2.println("01 0D");
      iso9141 = 500;
      delay(500);
    }
  }
  digitalWrite(22, HIGH);
  digitalWrite(23, HIGH);

#ifndef ALPHA_VERSION
  setupWiFi();
  setupESPNow();
#endif
}

/**
   Loop
*/
void loop() {

  unsigned long currentMillis = millis();

  if (currentMillis - programStarted >= interval) {
    programStarted = currentMillis;
    receivedFromApp();
  }
}


///***For old version of reader***///

//#ifdef ALPHA_VERSION
//  if (SerialBT.available()) {
//    while (SerialBT.available()) {
//      Serial.write(SerialBT.read());
//      delay(MESSAGE_DELAY);
//    }
//    SerialBT.print(MESSAGE_END);
//    SerialBT.print(MESSAGE_END);
//    Serial.println(" ");
//  }
//  #else
//  writeCANToBluetooth();
//  receiveFromBluetooth();
//#endif
//  writeSerialToBluetooth();
//#else
//writeCANToBluetooth();
//receiveFromBluetooth();
//#endif
//writeSerialToBluetooth();
//}

//void writeSerialToBluetooth(void) {
//  if (Serial.available()) {
//    while (Serial.available()) {
//
//      SerialBT.write(Serial.read());
//      delay(MESSAGE_DELAY);
//    }
//    SerialBT.print(MESSAGE_END);
//    //    SerialBT.print(MESSAGE_END);
//    //    SerialBT.println(" ");
//  }
//}

//void writeCANToBluetooth(void) {
//  unsigned char len = 0;
//  unsigned char buf[64];
//
//  if (CAN_MSGAVAIL == CAN.checkReceive()) {
//    CAN.readMsgBuf(&len, buf);
//
//    unsigned long canId = CAN.getCanId();
//    SerialBT.print(canId, HEX);
//
//    for (int i = 0; i < len; i++) {
//      SerialBT.print(buf[i]);
//      //      SerialBT.print("\t");
//    }
//    SerialBT.print(MESSAGE_END);
//    //    SerialBT.print(MESSAGE_END);
//    //    SerialBT.println(" ");
//  }
//}
///////////////////////////////////////////////////////////

/**
   CAN Bus Setup
*/
//void setupCANBus(void) {
//  int attempt = 0;
//  while (CAN_OK != CAN.begin(CAN_500KBPS) && attempt < INITIALISATION_ATTEMPTS) {
//    Serial.println("CAN BUS init attempt Failed");
//    delay(SETUP_DELAY);
//    attempt++;
//  }
//
//  Serial.println("CAN BUS Init OK!");
//}


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
  if (esp_now_add_peer(&peerInfo) != ESP_OK) {
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

void setupReader(void) {
  Serial2.begin(BAUD, SERIAL_8N1, 17, 16);
}

//void receiveFromBluetooth(void) {
//  if (SerialBT.available()) {
//    Serial.print("Data from Bluetooth device: ");
//
//    long unsigned int buf[64];
//    int ii = 0;
//    while (SerialBT.available()) {
//      Serial.print(convertUint8ToChar(SerialBT.read()));
//      delay(MESSAGE_DELAY);
//    }
//
//    Serial.println(" ");
//  }
//}

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
  memcpy(&sensorMacAddress, mac, sizeof(sensorMacAddress));

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

  gyroX = incomingData.gyroX;
  gyroY = incomingData.gyroY;
  gyroZ = incomingData.gyroZ;

  temperature = incomingData.temperature;

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



void findCorrectProtocol() {
  while (SerialBT.available()) {
    char c = SerialBT.read();
    if (c != '>') {
      str1 = str1 + c;
    } else {
      Serial2.println(str1);

      Serial2.println("01 00"); //to check whether it's correct protocol by checking the return message.
      delay(50);
      if (Serial2.available()) {
        String fromSerial2 = Serial2.readString();
        fromSerial2.toCharArray(protocolArray, numChars);
        if (!(StrContains(protocolArray, error) || StrContains(protocolArray, noData))) {
          protocolFlag = true;
          Serial.print("found protocol:");
          Serial.println(str1);
          break;
        }
      }
      str1 = "";
    }
    digitalWrite(22, LOW);
  }
}

void flushBuffers() {
  while (SerialBT.available()) {
    SerialBT.read();
  }
  while (Serial2.available()) {
    Serial2.read();
  }
}

/**
   this function is called when the data is received from app.
*/
void receivedFromApp(void) {
  String str = "";

  if (SerialBT.available()) {
    while (SerialBT.available()) {
      char c = SerialBT.read();
      if (c != '>') {
        str = str + c;
      } else {
        Serial2.println(str);
        FromOBD();
        str = "";
      }
    }
  }
}

void FromOBD() {
  if (Serial2.available()) {
    digitalWrite(23, LOW);
    String str = "";
    String subString = "";

    while (Serial2.available() > 0) {
      char c = Serial2.read();
      str = str + c;
    }

    str.toCharArray(charArray, numChars);
    Serial.print("charArray");
    Serial.println(charArray);

    if (StrContains(charArray, c43)) {
      str = str.substring(6, str.length() - 1);
      getDTC(str);
    } else {
      str = str.substring(6, str.length() - 1); //"01 0D 41 0D D9 >"  getting rid of "01 0D " and ">"
      str = "7E8 03 " + str + "255255";
      SerialBT.println(str);
    }
  }
  digitalWrite(23, HIGH);
  delay(iso9141);
}


/**
   function for decoding DTC message from obd
*/
String decodeDTC(String string) {
  String str = "";
  char c = string[0];
  switch (c) {
    case '0':
      str = "P0";
      break;
    case '1':
      str = "P1";
      break;
    case '2':
      str = "P2";
      break;
    case '3':
      str = "P3";
      break;
    case '4':
      str = "C0";
      break;
    case '5':
      str = "C1";
      break;
    case '6':
      str = "C2";
      break;
    case '7':
      str = "C3";
      break;
    case '8':
      str = "B0";
      break;
    case '9':
      str = "B1";
      break;
    case 'A':
      str = "B2";
      break;
    case 'B':
      str = "B3";
      break;
    case 'C':
      str = "U0";
      break;
    case 'D':
      str = "U1";
      break;
    case 'E':
      str = "U2";
      break;
    case 'F':
      str = "U3";
      break;
    default:
      break;
  }
  str = str + string.substring(1) + "255255";
  return str;
}


void getDTC(String str) {
  String string;
  str.replace(" ", "");
  Serial.println(str);
  for (int i = 0; i < str.length();) {
    SerialBT.println(decodeDTC(str.substring(i, i + 4)));
    i = i + 4;
  }
}

//Reference: https://forum.arduino.cc/index.php?topic=290459.0
// searches for the string sfind in the string str
// returns 1 if string found
// returns 0 if string not found
char StrContains(char *str, char *sfind)
{
  // Better way to search
  // Commented out previous code for legacy reasons
  if (strstr(str, sfind) != NULL) {
    return 1;
  }
  return 0;
  
//  char found = 0;
//  char index = 0;
//  char len;
//
//  len = strlen(str);
//
//  if (strlen(sfind) > len) {
//    return -1;
//  }
//  while (index < len) {
//    if (str[index] == sfind[found]) {
//      found++;
//      if (strlen(sfind) == found) {
//        return index;
//      }
//    }
//    else {
//      found = 0;
//    }
//    index++;
//  }
//  return 0;
}
