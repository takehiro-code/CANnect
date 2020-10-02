/**
   ESP8266 Sensor Module - Transmits sensor information to Reader (i.e ESP32)

   References:
   https://github.com/esp8266/Arduino
   https://randomnerdtutorials.com/esp-now-esp8266-nodemcu-arduino-ide/
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
#include <ESP8266WiFi.h>
#include <espnow.h>

/**
   ESP8266 Pins
*/
#define I2C_SCL       5
#define I2C_SDA       4

/**
   Constants
*/
#define MPU_ADDRESS               0x68
#define MESSAGE_INTERVAL          1000 // 1000 ms
#define SERIAL_BAUD_RATE          115200
#define SENSOR_SAMPLING_PERIOD    100
#define ACCELEROMETER_MAX_VALUE   16384.0 // +-2G
#define GYROSCOPE_MAX_RANGE       131.0 // 250deg/s

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
   Global Variables
*/
float accX, accY, accZ;
float gyroX, gyroY, gyroZ;
float temperature;
uint8_t broadcastAddress[] = {0xF0, 0x08, 0xD1, 0xD4, 0x11, 0x70}; // reader's address - hard-coded for now
String success;
canTechMsg sendData;

void setup() {
  Serial.begin(SERIAL_BAUD_RATE);
  Serial.println();
  Serial.print("ESP8266 Board MAC Address:  ");
  Serial.println(WiFi.macAddress());

  setupESPNow();

}

void loop() {
  /**
   * Needs work. Doesn't work  for some reason
   */
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
  esp_now_send(broadcastAddress, (uint8_t *) &sendData, sizeof(sendData));

  // delay
  delay(SENSOR_SAMPLING_PERIOD);
}

void setupESPNow(void) {
  // Init ESP-NOW
  if (esp_now_init() != 0) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  // Once ESPNow is successfully Init, we will register for Send CB to
  // get the status of Trasnmitted packet
  esp_now_set_self_role(ESP_NOW_ROLE_CONTROLLER);
  esp_now_register_send_cb(OnDataSent);

  // Register peer
  esp_now_add_peer(broadcastAddress, ESP_NOW_ROLE_SLAVE, 1, NULL, 0);

}

// Callback when data is sent
void OnDataSent(uint8_t *mac_addr, uint8_t sendStatus) {
  Serial.print("Last Packet Send Status: ");
  if (sendStatus == 0) {
    Serial.println("Delivery success");
  }
  else {
    Serial.println("Delivery fail");
  }
}
