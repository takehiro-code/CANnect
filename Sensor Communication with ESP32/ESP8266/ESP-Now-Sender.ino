#include <Arduino.h>
#include <espnow.h>
#include <ESP8266WiFi.h>
#include <Wire.h>

//I2C address of MPU-0650
const int MPU_addr = 0x68;

// MAC Address of the receiver module (ESP32)
uint8_t peer1[] = {0xF0, 0x08, 0xD1, 0xD3, 0x6D, 0xA0};

// Accelerometer and Gyroscope values
//int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
float temp; 

String success;
// Structure example to send data
// Must match the receiver structure
typedef struct struct_message {
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
} struct_message;

// Create a struct_message called myData
struct_message myData;

// callback when data is sent
void OnDataSent(uint8_t *mac_addr, uint8_t sendStatus) {
 Serial.println("Status:");
 Serial.println(sendStatus);
}

void setup() {
  // Init Serial Monitor
  Serial.begin(115200);

  //Set the wire library, Webserver, and data transmission through power management register
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);
  Wire.write(0);
  Wire.endTransmission(true);  
  Serial.println("Wrote to IMU");
  
  // Set device as a Wi-Fi Station
  WiFi.mode(WIFI_STA);

   // Get Mac Add
  Serial.print("Mac Address: ");
  Serial.print(WiFi.macAddress());
  Serial.println("ESP-Now Sender");

  // Init ESP-NOW
  if (esp_now_init() != 0) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }
 esp_now_set_self_role(ESP_NOW_ROLE_CONTROLLER);
 // Register the peer
 Serial.println("Registering a peer");
 esp_now_add_peer(peer1, ESP_NOW_ROLE_SLAVE, 1, NULL, 0);
 Serial.println("Registering send callback function");
 esp_now_register_send_cb(OnDataSent);

}

void loop() {
  // Set values to send
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x3B);
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_addr,14,true);  // request a total of 14 registers
  myData.AcX=Wire.read()<<8|Wire.read();  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  myData.AcY=Wire.read()<<8|Wire.read();  // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  myData.AcZ=Wire.read()<<8|Wire.read();  // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  myData.Tmp=Wire.read()<<8|Wire.read();  // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  temp = (myData.Tmp/340.)+36.53;
  myData.Tmp = temp;
  myData.GyX=Wire.read()<<8|Wire.read();  // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  myData.GyY=Wire.read()<<8|Wire.read();  // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  myData.GyZ=Wire.read()<<8|Wire.read();  // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  
  // Send message via ESP-NOW
  esp_now_send(NULL, (uint8_t *) &myData, sizeof(myData));

  delay(60000);
}
