/**
   ESP32 Sensor Module - Transmits sensor information to Reader (i.e ESP32)

   References:
   https://howtomechatronics.com/tutorials/arduino/arduino-and-mpu6050-accelerometer-and-gyroscope-tutorial/
*/

/**
   Metadata
*/
#define CURRENT_VERSION "0.0.1"

/**
   Libraries
*/
#include "Wire.h"
#include "WiFi.h"
#include <esp_now.h>

/**
   ESP32 Pins
*/
#define I2C_SCL       22
#define I2C_SDA       21

/**
   Constants
*/
#define ESP32_WIFI_MODE           WIFI_STA
#define MPU_ADDRESS               0x68
#define SERIAL_BAUD_RATE          115200
#define ACCELEROMETER_MAX_VALUE   16384.0 // +-2G
#define GYROSCOPE_MAX_RANGE       131.0 // 250deg/s
#define SENSOR_SAMPLING_PERIOD    100

/**
   Structures
*/
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
   Global variables
*/
float accX, accY, accZ;
float gyroX, gyroY, gyroZ;
float temperature;
uint8_t broadcastAddress[] = {0xF0, 0x08, 0xD1, 0xD4, 0x11, 0x70}; // reader's address - hard-coded for now
String success;
canTechMsg sendData;

void setup() {
  Serial.begin(SERIAL_BAUD_RATE);
  Wire.begin();
  Wire.beginTransmission(MPU_ADDRESS); // Begins a transmission to the I2C slave (GY-521 board)
  Wire.write(0x6B); // PWR_MGMT_1 register
  Wire.write(0); // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);

  setupWiFi();
  setupESPNow();
}

void loop() {
  Wire.beginTransmission(MPU_ADDRESS);
  Wire.write(0x3B); // starting with register 0x3B (ACCEL_XOUT_H) [MPU-6000 and MPU-6050 Register Map and Descriptions Revision 4.2, p.40]
  Wire.endTransmission(false); // the parameter indicates that the Arduino will send a restart. As a result, the connection is kept active.
  Wire.requestFrom(MPU_ADDRESS, 7 * 2, true); // request a total of 7*2=14 registers

  // "Wire.read()<<8 | Wire.read();" means two registers are read and stored in the same variable
  accX = (Wire.read() << 8 | Wire.read()) / ACCELEROMETER_MAX_VALUE; // reading registers: 0x3B (ACCEL_XOUT_H) and 0x3C (ACCEL_XOUT_L)
  accY = (Wire.read() << 8 | Wire.read()) / ACCELEROMETER_MAX_VALUE; // reading registers: 0x3D (ACCEL_YOUT_H) and 0x3E (ACCEL_YOUT_L)
  accZ = (Wire.read() << 8 | Wire.read()) / ACCELEROMETER_MAX_VALUE; // reading registers: 0x3F (ACCEL_ZOUT_H) and 0x40 (ACCEL_ZOUT_L)
  temperature = Wire.read() << 8 | Wire.read(); // reading registers: 0x41 (TEMP_OUT_H) and 0x42 (TEMP_OUT_L)
  temperature = temperature / 340.00 + 36.53; // the equation was taken from the documentation [MPU-6000/MPU-6050 Register Map and Description, p.30]
  gyroX = (Wire.read() << 8 | Wire.read()) / GYROSCOPE_MAX_RANGE; // reading registers: 0x43 (GYRO_XOUT_H) and 0x44 (GYRO_XOUT_L)
  gyroY = (Wire.read() << 8 | Wire.read()) / GYROSCOPE_MAX_RANGE; // reading registers: 0x45 (GYRO_YOUT_H) and 0x46 (GYRO_YOUT_L)
  gyroZ = (Wire.read() << 8 | Wire.read()) / GYROSCOPE_MAX_RANGE; // reading registers: 0x47 (GYRO_ZOUT_H) and 0x48 (GYRO_ZOUT_L)

  // print out data
  Serial.print("aX = "); Serial.print(accX);
  Serial.print(" | aY = "); Serial.print(accY);
  Serial.print(" | aZ = "); Serial.print(accZ);

  Serial.print(" | tmp = "); Serial.print(temperature);
  Serial.print(" | gX = "); Serial.print(gyroX);
  Serial.print(" | gY = "); Serial.print(gyroY);
  Serial.print(" | gZ = "); Serial.print(gyroZ);
  Serial.println();

  sendData.accX = accX;
  sendData.accY = accY;
  sendData.accZ = accZ;

  sendData.temperature = temperature;

  sendData.gyroX = gyroX;
  sendData.gyroY = gyroY;
  sendData.gyroZ = gyroZ;

  // Send message via ESP-NOW
  esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *) &sendData, sizeof(sendData));

  // delay
  delay(SENSOR_SAMPLING_PERIOD);
}

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
}

char* convert_int16_to_str(int i) { // converts int16 to string. Moreover, resulting strings will have the same length in the debug monitor.
  char tmp_str[7];
  sprintf(tmp_str, "%6d", i);
  return tmp_str;
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
