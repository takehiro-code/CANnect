#include <esp_now.h>
#include <WiFi.h>

typedef struct struct_message {
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
} struct_message;

// Create a struct_message called myData
struct_message myData;

// callback function that will be executed when data is received
void OnDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {
  Serial.println("Message received.");
  memcpy(&myData, incomingData, sizeof(myData));
  Serial.print("Bytes received: ");
  Serial.println(len);
  Serial.print("AcX: ");
  Serial.println(myData.AcX);
  Serial.print("AcY: ");
  Serial.println(myData.AcY);
  Serial.print("AcZ: ");
  Serial.println(myData.AcZ);
  Serial.print("Tmp: ");
  Serial.println(myData.Tmp);
  Serial.print("GyX: ");
  Serial.println(myData.GyX);
  Serial.print("GyY: ");
  Serial.println(myData.GyY);
  Serial.print("GyZ: ");
  Serial.println(myData.GyZ);
  Serial.println();
}
 
void setup() {
  // Initialize Serial Monitor
  Serial.begin(115200);
  
  // Set device as a Wi-Fi Station
  WiFi.mode(WIFI_STA);

  // Get Mac Add
  Serial.print("Mac Address: ");
  Serial.print(WiFi.macAddress());
  Serial.println("ESP32 ESP-Now Broadcast");
 
  // Init ESP-NOW
  if (esp_now_init() != 0) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }
  
  // Once ESPNow is successfully Init, we will register for recv CB to
  // get recv packer info
  esp_now_register_recv_cb(OnDataRecv);
}
 
void loop() {

}
