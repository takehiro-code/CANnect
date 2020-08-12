//This example code is in the Public Domain (or CC0 licensed, at your option.)
//By Evandro Copercini - 2018
//
//This example creates a bridge between Serial and Classical Bluetooth (SPP)
//and also demonstrate that SerialBT have the same functionalities of a normal Serial

#include "BluetoothSerial.h"

#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run `make menuconfig` to and enable it
#endif

#define KEEP_ALIVE_INTERVAL     5000 // 5 seconds
#define MESSAGE_DELAY           20 


BluetoothSerial SerialBT;
int timer = 0;

/**
 * Setup
 */
void setup() {
  Serial.begin(115200);
  SerialBT.begin("ESP32test"); //Bluetooth device name
  Serial.println("The device started, now you can pair it with bluetooth!");
}

/**
 * Loop
 */
void loop() {
//  timer++;
//
//  if (timer == KEEP_ALIVE_INTERVAL/MESSAGE_DELAY) {
//    timer = 0;
//    keepAlive();
//  }

  if (Serial.available()) {
    writeToBluetooth();
  }
    
  if (SerialBT.available()) {
    writeToArduino();
  }

  delay(MESSAGE_DELAY);
}

void keepAlive(void) {
  SerialBT.print("Bluetooth Keep Alive");
  Serial.write("Serial Keep Alive");
  SerialBT.println(" ");
}

void writeToBluetooth(void) {
//  SerialBT.print("Sending to Bluetooth from Serial");
  SerialBT.write(Serial.read());
  SerialBT.println(" ");
}

void writeToArduino(void) {
//  Serial.write("Sending to Serial from Bluetooth");
  Serial.write(SerialBT.read());
}

void playbackToBluetooth(void) {
  // Needs more work
  SerialBT.print("Playback to Bluetooth");
  SerialBT.print(convertUint8ToChar(SerialBT.read()));
  SerialBT.println(" ");
}

uint8_t convertCharToUint8(char* string) {
  return (uint8_t)atoi(string);
}

char convertUint8ToChar(int number) {
  return '0' + number;
}
