/**
   ESP32 - Responsible to transmit to Bluetooth devices

   References:
   https://github.com/espressif/arduino-esp32/tree/master/libraries/BluetoothSerial
   https://github.com/espressif/arduino-esp32/tree/master/libraries/SPI
*/

/**
   Metadata
*/
#define SW_VERSION "0.0.1"
#define HW_VERSION "0.0.5b"
#define ESP32_BL_NAME "CANnectReader"

/**
   Flags
   Change this depending on hardware/version setup
*/
//#define STN_CHIP_CONNECTED // comment this out if you're not connected to the STN chip

/**
   Libraries
*/
#include "BluetoothSerial.h"
#include <WiFi.h>
#include <esp_now.h>

/**
   ESP32 Pins
*/
#define ESP32_BLUETOOTH_LED_PIN     22
#define ESP32_OBD_ACT_LED_PIN       23

#define ESP32_RX_STN_PIN            17 // STN to ESP32
#define ESP32_TX_STN_PIN            16 // ESP32 to STN

#define ESP32_IMU_SCL               14 // Pin13               
#define ESP32_IMU_SDA               12 // Pin14 
#define ESP32_IMU_INT2              26 // Pin11 
#define ESP32_IMU_INT1              27 // Pin12 
//#define ESP32_IMU_SDO_SAO           13 // Pin16 - Unlikely to use

/**
   Structures
*/

// IMU Msg Data
typedef struct IMU_MSG {
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
#define STN_BAUD_RATE             9600
#define SETUP_DELAY               100
#define INITIALISATION_ATTEMPTS   5
#define MESSAGE_END               0xFF
#define ESP32_WIFI_MODE           WIFI_STA

/**
   Global Variables
*/
BluetoothSerial SerialBT;
uint8_t broadcastAddress[] = {0xF0, 0x08, 0xD1, 0xD3, 0x6D, 0xA0}; // sensor's address - hard-coded for now
String success;

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
int iso9141Delay = 100; // imperically defined
String str1 = "";
unsigned long programStarted = 0;
const long interval = 500;

/**
   Setup
*/
void setup() {
  pinMode(ESP32_BLUETOOTH_LED_PIN, OUTPUT); // Red LED - Bluetooth
  pinMode(ESP32_OBD_ACT_LED_PIN, OUTPUT); // Green LED - OBD-II activitiy

  digitalWrite(ESP32_BLUETOOTH_LED_PIN, LOW);
  digitalWrite(ESP32_OBD_ACT_LED_PIN, LOW);
  Serial.begin(BAUD_RATE);

  setupReader();
  setupBluetooth();

  while (!Serial2) {
    Serial.println("Connect to the reader");
  }

  waitForBluetoothConnection();
  initialiseReaderConnection();
}

/**
   Loop
*/
void loop() {
  unsigned long currentMillis = millis();

  if (currentMillis - programStarted >= interval) {
    programStarted = currentMillis;
    receivedFromApp();

    // Generate sample IMU messages that will arrive from sensor module
    // We may want to move this out and onto the the main loop ideally
    IMU_MSG sampleIMUMsg = generateSampleIMUMsg();
    sendSensorModuleData(sampleIMUMsg);
  }
}

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


/**
   ESP-NOW Setup
*/
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
  Serial2.begin(STN_BAUD_RATE, SERIAL_8N1, ESP32_RX_STN_PIN, ESP32_TX_STN_PIN);
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

void waitForBluetoothConnection(void) {
  digitalWrite(ESP32_BLUETOOTH_LED_PIN, LOW);

  while (!SerialBT.available()) {
    digitalWrite(ESP32_BLUETOOTH_LED_PIN, HIGH);
    delay(500);
    digitalWrite(ESP32_BLUETOOTH_LED_PIN, LOW);
    delay(500);
    Serial.println("pair up the BT");
  }

  digitalWrite(ESP32_BLUETOOTH_LED_PIN, HIGH);
  digitalWrite(ESP32_BLUETOOTH_LED_PIN, HIGH);
}

void initialiseReaderConnection(void) {
#ifndef STN_CHIP_CONNECTED
  // Do not search for protocol if not connected to STN chip
  protocolFlag = true;
#endif

  while (!protocolFlag) {
    digitalWrite(ESP32_OBD_ACT_LED_PIN, HIGH);

    findCorrectProtocol();
    flushBuffers();
    if (str1 == "22") {
      Serial2.println("01 0D");
      iso9141Delay = 500;
      delay(iso9141Delay);
    }
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
  IMU_MSG incomingIMUSensorData;

  memcpy(&incomingIMUSensorData, incomingD, sizeof(incomingIMUSensorData));
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

  accX = incomingIMUSensorData.accX;
  accY = incomingIMUSensorData.accY;
  accZ = incomingIMUSensorData.accZ;

  gyroX = incomingIMUSensorData.gyroX;
  gyroY = incomingIMUSensorData.gyroY;
  gyroZ = incomingIMUSensorData.gyroZ;

  temperature = incomingIMUSensorData.temperature;

  Serial.print(" | aX = "); Serial.print(accX);
  Serial.print(" | aY = "); Serial.print(accY);
  Serial.print(" | aZ = "); Serial.print(accZ);
  Serial.print(" | gX = "); Serial.print(gyroX);
  Serial.print(" | gY = "); Serial.print(gyroY);
  Serial.print(" | gZ = "); Serial.print(gyroZ);
  Serial.print(" | tmp = "); Serial.print(temperature);

  Serial.println();

  // sendSensorModuleData(incomingIMUSensorData); // Queue this?
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
    digitalWrite(ESP32_BLUETOOTH_LED_PIN, LOW);
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
  #ifndef STN_CHIP_CONNECTED
    return;
  #endif
  
  if (Serial2.available()) {
    digitalWrite(ESP32_OBD_ACT_LED_PIN, LOW);
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
  digitalWrite(ESP32_OBD_ACT_LED_PIN, HIGH);
  delay(iso9141Delay);
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


/**
 * Send IMU data to the app via Bluetooth
 */
void sendSensorModuleData(IMU_MSG msgData) {
  SerialBT.print(msgData.msgID);

  SerialBT.print(msgData.accX);
  SerialBT.print(msgData.accY);
  SerialBT.print(msgData.accZ);

  SerialBT.print(msgData.gyroX);
  SerialBT.print(msgData.gyroY);
  SerialBT.print(msgData.gyroZ);

  SerialBT.print(msgData.temperature);

  SerialBT.println("255255"); // end of Msg  
}

/**
 * Generate sample IMU Messages
 */
IMU_MSG generateSampleIMUMsg(void) {
  IMU_MSG sample;

  sample.msgID = "6DOF";

  // Acceleration range from -20 m/s^2 to +20 m/s^2
  sample.accX = random(-20,20) + random(10)*0.01; // m/s^2
  sample.accY = random(-20,20) + random(10)*0.01; // m/s^2
  sample.accZ = random(-20,20) + random(10)*0.01; // m/s^2

  // Gyroscope data range may change
  sample.gyroX = random(-125, 125)*0.1 + 0.01*random(10);
  sample.gyroY = random(-125, 125)*0.1 + 0.01*random(10);
  sample.gyroZ = random(-125, 125)*0.1 + 0.01*random(10);

  // range from -40C to +85C
  sample.temperature = random(-40, 85) + 0.01*random(10);

  return sample;
}
