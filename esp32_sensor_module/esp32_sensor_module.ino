/**
   ESP32 Sensor Module

   ESP32 Datasheet: https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf
   IMU Library Reference: https://github.com/arduino-libraries/Arduino_LSM6DS3/blob/master/src/LSM6DS3.cpp
   IMU Datasheet: https://www.st.com/content/ccc/resource/technical/document/datasheet/76/27/cf/88/c5/03/42/6b/DM00218116.pdf/files/DM00218116.pdf/jcr:content/translations/en.DM00218116.pdf
   ESP-NOW and WiFi:
    https://randomnerdtutorials.com/esp-now-two-way-communication-esp32/
    https://randomnerdtutorials.com/esp-now-esp32-arduino-ide/
    https://gist.github.com/futechiot/ee0223dd269cbe7d8605ce97d120d7d2

*/


/**
   Metadata
*/
#define SW_VERSION "0.0.1"
#define HW_VERSION "0.0.3b"

/**
   Libraries
*/
#include "WiFi.h"
#include "Wire.h" // ESP32 Wire.h
#include <esp_now.h>

/**
   ESP32 Pins
*/
#define IMU_INT2      26 // Pin 11
#define IMU_INT1      27 // Pin 12  
#define IMU_SCL       14 // Pin 13
#define IMU_SDA       12 // Pin 14
//#define IMU_SD0       // Not implemented


/**
   LSM Registers
*/
#define LSM6DSM_ADDRESS             0x6B // SD0 should not be connected

#define LSM6DSM_WHO_AM_I_REG        0X0F
#define WHO_AM_I_REG_VALUE          0x6A

#define LSM6DSM_CTRL1_XL            0X10
#define LSM6DSM_CTRL2_G             0X11
#define LSM5DSM_CTRL3_C             0X12

#define LSM6DSM_STATUS_REG          0X1E

#define LSM6DSM_CTRL6_C             0X15
#define LSM6DSM_CTRL7_G             0X16
#define LSM6DSM_CTRL8_XL            0X17

#define LSM6DSM_OUTX_L_G            0X22
#define LSM6DSM_OUTX_H_G            0X23
#define LSM6DSM_OUTY_L_G            0X24
#define LSM6DSM_OUTY_H_G            0X25
#define LSM6DSM_OUTZ_L_G            0X26
#define LSM6DSM_OUTZ_H_G            0X27

#define LSM6DSM_OUTX_L_XL           0X28
#define LSM6DSM_OUTX_H_XL           0X29
#define LSM6DSM_OUTY_L_XL           0X2A
#define LSM6DSM_OUTY_H_XL           0X2B
#define LSM6DSM_OUTZ_L_XL           0X2C
#define LSM6DSM_OUTZ_H_XL           0X2D

/**
   Structures
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
#define SERIAL_BAUD_RATE            115200
#define ESP32_WIFI_MODE             WIFI_STA

//const char* READER_WIFI_SSD         "CANnect_Reader_WiFi_0.1"   // SSID of reader WiFi
//const char* READER_WIFI_PASSWORD    "redboats"                  // Password of reader WiFi

/**
   Variables
*/
//uint8_t selfMACAddress[];
//uint8_t readerMACAddress[];
//esp_now_peer_info_t readerInfo;

void setup() {
  Serial.begin(SERIAL_BAUD_RATE);
  Serial.println("Wait for user to be ready");
  while (true) {

    if (Serial.available() > 0) {
      if (Serial.read() == 'G') {
        break;
      }
    }
  }

  imuSetup();
  wifiSetup();
  espNOWSetup();
}

void imuSetup(void) {
  Wire.begin(IMU_SDA, IMU_SCL);

  while (readRegister(LSM6DSM_WHO_AM_I_REG) != WHO_AM_I_REG_VALUE) {
    Serial.println("Unable to talk to IMU! Trying again!");
    delay(1000);
  }

  /**
     Taken from LSM library
  */
  //set the gyroscope control register to work at 104 Hz, 2000 dps and in bypass mode
  writeRegister(LSM6DSM_CTRL2_G, 0x4C);

  // Set the Accelerometer control register to work at 104 Hz, 4G,and in bypass mode and enable ODR/4
  // low pass filter(check figure 9 on LSM6DSM's datasheet)
  writeRegister(LSM6DSM_CTRL1_XL, 0x4A); // I think this is correct??

  // set gyroscope power mode to high performance and bandwidth to 16 MHz
  writeRegister(LSM6DSM_CTRL7_G, 0x00);

  // Set the ODR config register to ODR/4
  writeRegister(LSM6DSM_CTRL8_XL, 0xA4); // I think this is correct??

  Serial.println("IMU ready");
}

void wifiSetup(void) {
  WiFi.mode(ESP32_WIFI_MODE);
  Serial.println(WiFi.macAddress());
}

void espNOWSetup(void) {
  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }
}

int writeRegister(uint8_t address, uint8_t value)
{
  Wire.beginTransmission(LSM6DSM_ADDRESS);
  Wire.write(address);
  Wire.write(value);
  if (Wire.endTransmission() != 0) {
    return 0;
  }

  return 1;
}

int readRegister(uint8_t address) {
  uint8_t value;

  if (readRegisters(address, &value, sizeof(value)) != 1) {
    return -1;
  }

  return value;
}

int readRegisters(uint8_t address, uint8_t* data, size_t length) {
  Wire.beginTransmission(LSM6DSM_ADDRESS);
  Wire.write(address);

  if (Wire.endTransmission(false) != 0) {
    return -1;
  }

  if (Wire.requestFrom(LSM6DSM_ADDRESS, length) != length) {
    return 0;
  }

  for (size_t i = 0; i < length; i++) {
    *data++ = Wire.read();
  }

  return 1;
}

int gyroscopeAvailable() {
  if (readRegister(LSM6DSM_STATUS_REG) & 0x02) {
    return 1;
  }

  return 0;
}

int accelerationAvailable() {
  if (readRegister(LSM6DSM_STATUS_REG) & 0x01) {
    return 1;
  }

  return 0;
}

int readGyroscope(float& x, float& y, float& z) {
  int16_t data[3];

  if (!readRegisters(LSM6DSM_OUTX_L_G, (uint8_t*)data, sizeof(data))) {
    x = NAN;
    y = NAN;
    z = NAN;

    return 0;
  }

  x = data[0] * 2000.0 / 32768.0;
  y = data[1] * 2000.0 / 32768.0;
  z = data[2] * 2000.0 / 32768.0;

  return 1;
}

int readAcceleration(float& x, float& y, float& z) {

  int16_t data[3];

  if (!readRegisters(LSM6DSM_OUTX_L_XL, (uint8_t*)data, sizeof(data))) {
    x = NAN;
    y = NAN;
    z = NAN;

    return 0;
  }

  x = data[0] * 4.0 / 32768.0;
  y = data[1] * 4.0 / 32768.0;
  z = data[2] * 4.0 / 32768.0;

  return 1;
}

char* convert_int16_to_str(int i) { // converts int16 to string. Moreover, resulting strings will have the same length in the debug monitor.
  char tmp_str[7];
  sprintf(tmp_str, "%6d", i);
  return tmp_str;
}

//// Callback when data is sent
//void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
//  Serial.print("\r\nLast Packet Send Status:\t");
//  Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
//  if (status == 0) {
//    success = "Delivery Success :)";
//  }
//  else {
//    success = "Delivery Fail :(";
//  }
//}

//void connectToReader() {
//  WiFi.begin(READER_WIFI_SSD, READER_WIFI_PASSWORD);
//
//  while (WiFi.status() != WL_CONNECTED) {
//    delay(500);
//    Serial.println("Attempting to connect to WiFi");
//  }
//}

/**
   Register and add reader
*/
//void espNOWAddReader(uint8_t broadcastAddress) {
//  if (esp_now_is_peer_exist(broadcastAddress)) {
//    memcpy(readerInfo.peer_addr, broadcastAddress, 6);
//    readerInfo.channel = 0;
//    readerInfo.encrypt = false;
//
//    // Add peer
//    if (esp_now_add_peer(&readerInfo) != ESP_OK) {
//      Serial.println("Failed to add peer");
//      return;
//    }
//  }
//
//  else {
//    Serial.println("Unexpected behaviour!");
//    return;
//  }
//}

/**
   Remove reader
*/
//void espNOWRemoveReader(void) {
//  if (esp_now_del_peer(&readerInfo) != ESP_OK) {
//    Serial.println("Failed to delete peer gracefully");
//    return;
//  }
//}

void loop() {
  float x, y, z;

  if (gyroscopeAvailable()) {
    readGyroscope(x, y, z);

    Serial.print("Gyroscope: ");
    Serial.print(x);
    Serial.print('\t');
    Serial.print(y);
    Serial.print('\t');
    Serial.println(z);
  }

  if (accelerationAvailable()) {
    readAcceleration(x, y, z);

    Serial.print("Acceleration: ");
    Serial.print(x);
    Serial.print('\t');
    Serial.print(y);
    Serial.print('\t');
    Serial.println(z);
  }

  delay(100);
}
