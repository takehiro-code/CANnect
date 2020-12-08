#include <HardwareSerial.h>
#include <string.h>
#include <iostream>
#include <regex>
HardwareSerial lteSerial(1);

#define TX 16
#define RX 17
#define RST 5
// program = 0 - serial passthrough, 1 - standalone program
#define program 1

// APN Setting
#define APN "hologram"

// Firebase configs
#define FIREBASE_HOST "https://cannect-cfe24.firebaseio.com/"
#define FIREBASE_AUTH "5ZmlfW8UPazEO9D91Cifeky6AHd9lcx0gAGga9vU"

#define STD_RETRY 5
#define STD_TIMEOUT 2500
#define ONE_SEC_TIMEOUT 1000
#define LONG_TIMEOUT 15000

#define GPS_UPDATE_RATE 5000 

// Send AT Command and get response until timeout expires or end of input is received using carriage return.
// Return String from result. Returns -1 if nothing is received.
// port = Serial port
// cmd = AT command ending with \r
// retry num = not in use.
// timeout = timeout to wait for response in milliseconds.
String at_send_receive(Stream& port, String cmd, int retry_num, int timeout)
{
  String output;
  char* p;
  char buf[1024];
  int buf_pos = 0;
  const char *char_cmd = cmd.c_str();
  unsigned long start_time = millis();
  int det = 0;
  bool good_result;
  lteSerial.write(char_cmd);
  //port.write(cmd.c_str());
  while (millis() - start_time < timeout)
  {
    lteSerial.setTimeout(timeout);

    while (lteSerial.available())
    {
      // read character by character
      char c = lteSerial.read();
      if (c == '\r' && det == 0)
      {
        //port.write("CR1");
        det++;
      }
      else if (c == '\r' && det > 0)
      {
        //port.write("CR2");
        //port.write("DONE");
        good_result = true;
        break;
      }
      port.write(c);
      buf[buf_pos] = c;
      buf_pos++;

      // break if result continues beyond timeout
      if (millis() - start_time < timeout)
      {
        break;
      }
    }
  }

  if (!good_result)
  {
    //throw std::runtime_error("No Response");
    return "-1";
  }

  char strbuf[buf_pos];
  memcpy(strbuf, buf, buf_pos + 1);
  //std::cout << "str\n" << buf_pos << "str\n";
  //String str;
  /*h
  for (int i = 0; i < buf_pos + 1; i++)
  {
    str += strbuf[i];
    std::cout << strbuf[i] << "\t" << str << "\n";
  }*/
  return String(strbuf);
}

// Send AT Command and get response. Repeats the command if nothing is received.
// Return output of command. -1 if nothing received.
// port = Serial port
// cmd = AT command ending with \r
// retry num = Number of times to retry.
// timeout = timeout to wait for response in milliseconds.
String at_send_receive_wrapper(Stream &port, String cmd, int retry_num, int timeout)
{
  int num_run = 1;
  String result;
run_trial:
  try
  {
    //std::cout << "RUN COMMAND";
    Serial.print(cmd);
    result = at_send_receive(port, cmd, retry_num, timeout);
  }
  catch (const std::exception& e)
  {
    std::cerr << e.what() << " on Run " << num_run << '\n';
    if (num_run <= retry_num)
    {
      num_run++;
      goto run_trial;
    }
    else
    {
      port.write((char*) "Command failed to get response.");
      return "-1";
    }

  }
  return result;
}

// Send AT Command and get response. Checks if the comparision String is in output.
// Return output of command if matching. Else returns -1.
// port = Serial port
// cmd = AT command ending with \r
// retry num = passthrough.
// retry match = number of times to repeat if match occurs.
// timeout = timeout to wait for response in milliseconds.
String at_match(Stream &port, String cmd, String comp, int retry_num, int retry_match, int timeout)
{
  String result;
  int num_run = 1;
run_match:
  try
  {
    result = at_send_receive_wrapper(port, cmd, retry_num, timeout);
    //result.indexOf(comp);
    //Serial.write(result.charAt(4));
    //Serial.write(result.charAt(5));
    //std::cout << "\n" << result.indexOf(comp);
    if (result.indexOf(comp) != -1)//(std::regex_match(result.c_str(), comp))
    {
      std::cout << "MATCH\n";
    }
    else
    {
      throw std::runtime_error("Match failed");
    }
  }
  catch (const std::exception& e)
  {
    std::cerr << e.what() << " on Run " << num_run << '\n';
    if (retry_match >= num_run)
    {
      num_run++;
      goto run_match;
    }
    else
    {
      //throw std::runtime_error("Command failed to get match");
      port.write((char*) "Command failed to get match");
      return "-1";
    }

  }

  return result;
}

// Get GPS coordinate from SIM7000A. Not in use due to bug where function does not run.
// Return latitude and longitude separated by comma.
// port = Serial port
String get_GPS_coord(Stream &port)
{
  bool got_coord = false;
  String result, gps_result, gps_coord;
  int start_pos, mid_pos, end_pos, slider_pos;
  while(got_coord)
  {
    result = at_send_receive_wrapper(port, "AT+CGNSPWR=1\r", STD_RETRY, STD_TIMEOUT);
    if (result == "-1" || result.indexOf("ERROR") == -1)
    {
      at_send_receive_wrapper(port, "AT+CGNSPWR=0\r", STD_RETRY, STD_TIMEOUT);
      delay(STD_TIMEOUT);
      at_send_receive_wrapper(port, "AT+CGNSPWR=1\r", STD_RETRY, STD_TIMEOUT);
    }
    delay(STD_TIMEOUT);
    gps_result = at_send_receive_wrapper(port, "AT+CGNSINF\r", STD_RETRY, STD_TIMEOUT);
    if (gps_result.indexOf("+CGNSINF: 1,1") != -1)
    {
      slider_pos = 0;
      for (int i = 0; i < 5; i++)
      {
        slider_pos = gps_result.indexOf(",", slider_pos + 1);
        if (i == 2)
        {
          start_pos = slider_pos + 1;
        }
        else if (i == 3)
        {
          mid_pos = slider_pos;
        }
        else if (i == 4)
        {
          end_pos = slider_pos;
        }
      }
      
      got_coord = true;
    }
  }

  gps_coord = gps_result.substring(start_pos, end_pos - start_pos);
  std::cout << "GPS:" << gps_coord;
  return gps_coord;
}

// Reset the SIM7000A.
// NO return.
// port = Serial port
void reboot(Stream &port)
{
  port.print("RESETTING SIM7000A.");
  digitalWrite(RST, HIGH);
  delay(1000);
  digitalWrite(RST, LOW);
  delay(3000);
  port.print("DONE RESETTING SIM7000A.");
}

// Configures APN and checks network connection.
// No return.
// port = Serial port
void network_check(Stream &port)
{
  int sz = 6;
  String result[sz];
  String cgdcont_cmd = "AT+CGDCONT=1,\"ip\",\"" + String(APN) + "\"\r";
  bool connect_code = false;
  network_set:
  try
  {
    result[0] = at_match(port, cgdcont_cmd.c_str(), "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    result[1] = at_match(port, "AT+CFUN=0\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    delay(5000);
    result[2] = at_match(port, "AT+CFUN=1\r", "+CPIN: READY", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    do
    {
      result[3] = at_send_receive_wrapper(port, "AT+CEREG?\r", STD_RETRY, STD_TIMEOUT);
      // connection successful
      if (result[3].indexOf("+CEREG: 0,1") != -1 || result[3].indexOf("+CEREG: 0,5") != -1)
      {
        connect_code = 1;
      }
      // connection denied or UE not on.
      else if (result[3].indexOf("+CEREG: 0,3") != -1 || result[3].indexOf("+CEREG: 0,0") != -1)
      {
        throw std::runtime_error("Network connect denied or not UE not operating");
      }
      // still searching.
      else if (result[3].indexOf("+CEREG: 0,2") != -1)
      {
        // do nothing.
      }
      // device not working as expected.
      else
      {
        reboot(Serial);
        throw std::runtime_error("Network connect failed - device not working");
      }
    }
    while (connect_code == false);
    result[4] = at_match(port, "AT+COPS?\r", "Hologram", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    result[5] = at_match(port, "AT+CGATT?\r", "+CGATT: 1", STD_RETRY, STD_RETRY, STD_TIMEOUT);

    for (int i = 0; i < sz; i++)
    {
      if (result[i] == "-1")
      {
        throw std::runtime_error("Network Setup Failed");
      }
    }
  }
  catch (const std::exception& e)
  {
    std::cerr << e.what() << '\n';
    goto network_set;
  }
}

// Send information for latitiude and longitude to Firebase. Need to run network_check first.
// Function sends info to Hologram Routing to Firebase.
// Return output of the send command over the network.
// port = Serial port
// gps lat = latitude
// gps long = longitude.
String send_to_firebase(Stream &port, String gps_lat, String gps_long)
{
  int sz = 4;
  String result[sz];
  String message = "{\"k\":\"Z+c2=5_v\",\"d\":\"\\\"latitude/val\\\":" + gps_lat +",\\\"longitude/val\\\":" + gps_long + "\",\"t\":\"_FIREBASE_\"}\r\n\r\n";
  
  int msg_size = 38 + 19 + 19 + gps_lat.length() + gps_long.length();
  String cipsend_cmd = "AT+CIPSEND=" + String(msg_size);
  String cstt_cmd = "AT+CSTT=\"" + String(APN) + "\"\r";
  cipsend_cmd = cipsend_cmd + "\r";

  char buf[512];
  int buf_pos = 0;
  int det = 0;

  send_firebase:
  try
  {
    // check active connection status
    result[0] = at_match(port, "AT+CIPSTATUS\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    if (result[0].indexOf("IP INITIAL") == -1)
    {
      result[0] = at_match(port, "AT+CIPSHUT\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
      result[0] = at_match(port, "AT+CIPSTATUS\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    }

    // create connection task 
    result[1] = at_match(port, cstt_cmd, "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    // link connection task to radio service
    result[2] = at_match(port, "AT+CIICR\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    // check IP to see if connection is created
    result[3] = at_send_receive_wrapper(port, "AT+CIFSR\r", STD_RETRY, STD_TIMEOUT);
    if (result[3].indexOf("0.0.0.0") != -1)
    {
      throw std::runtime_error("Network Connection to Hologram Failed");
    }

    for (int i = 0; i < sz; i++)
    {
      if (result[i] == "-1")
      {
        throw std::runtime_error("Network Send Failed");
      }
    }
    delay(STD_TIMEOUT);
    // open TCP connection to Hologram Routing
    lteSerial.print("AT+CIPSTART=\"TCP\",\"cloudsocket.hologram.io\",9999\r");

    delay(2000);
    // Allocate buffer size to send message
    lteSerial.print(cipsend_cmd);

    delay(1500);
    // send message
    lteSerial.print(message);

    while (lteSerial.available())
    {
      char c = lteSerial.read();
      if (c == '\r' && det == 0)
      {
        //port.write("CR1");
        det++;
      }
      else if (c == '\r' && det > 0)
      {
        //port.write("CR2");
        //port.write("DONE");
        break;
      }
      port.write(c);
      buf[buf_pos] = c;
      buf_pos++;
    }
    delay(STD_TIMEOUT);
  }
  catch (const std::exception& e)
  {
    std::cerr << e.what() << '\n';
    network_check(Serial);
    goto send_firebase;
  }

  return String(buf);
}


void setup() {
  // put your setup code here, to run once:
  // create serial connection
  Serial.begin(9600);
  lteSerial.begin(9600, SERIAL_8N1, TX, RX);

  Serial.print("WAIT FOR SIM7000A TO BOOT.");
  delay(5000);
  Serial.print("DONE WAIT FOR SIM7000A TO BOOT.");

  // configure rst pin
  pinMode(RST, OUTPUT);
  digitalWrite(RST, LOW);

  // test at command and check network.
  at_match(Serial, "AT\r", "OK", 5, 5, 5000);
  network_check(Serial);
}

void loop() {
  // put your main code here, to run repeatedly:
  bool got_coord = false;
  // serial passthrough
  if (program == 0)
  {
    if (Serial.available())
    {
      lteSerial.write((char) Serial.read());
    }
    if (lteSerial.available())
    {
      //Serial.write("BEEP\n");
      Serial.write((char) lteSerial.read());
    }
  }
  // regular program
  else
  {
    //Serial.write("Run Program\n");
    got_coord = false;
    String result, gps_result, gps_lat, gps_long;
    int start_pos, mid_pos, end_pos, slider_pos;
    delay(STD_TIMEOUT);

    // Turn on GPS
    result = at_match(Serial, "AT+CGNSPWR=1\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    if (result == "-1" || result.indexOf("ERROR") != -1)
    {
      result = at_match(Serial, "AT+CGNSPWR=0\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
      delay(STD_TIMEOUT);
      result = at_match(Serial, "AT+CGNSPWR=1\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
    }

    // Get the GPS coordinate.
    while (!got_coord)
    {
      delay(STD_TIMEOUT);
      gps_result = at_send_receive_wrapper(Serial, "AT+CGNSINF\r", STD_RETRY, STD_TIMEOUT);
      // if GPS lock is found.
      if (gps_result.indexOf("+CGNSINF: 1,1") != -1)
      {
        // grab comma positions to separate lat and long.
        slider_pos = 0;
        for (int i = 0; i < 5; i++)
        {
          slider_pos = gps_result.indexOf(",", slider_pos + 1);
          if (i == 2)
          {
            start_pos = slider_pos + 1;
          }
          else if (i == 3)
          { 
            mid_pos = slider_pos;
          }
          else if (i == 4)
          {
            end_pos = slider_pos;
          }
        }
        got_coord = true;
        //std::cout << "\nstart " << start_pos << " mid " << mid_pos << " end " << end_pos << "\n";
        gps_lat = gps_result.substring(start_pos, mid_pos);
        gps_long = gps_result.substring(mid_pos + 1, end_pos);
        Serial.print(gps_lat);
        Serial.print(gps_long);
      }
      // catch if the GPS is turned off.
      else if (gps_result.indexOf("+CGNSINF: 0") != -1)
      {
        at_match(Serial, "AT+CGNSPWR=1\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
      }
      else if (gps_result.indexOf("+CGNSINF: 1,0") != -1)
      {
        // do nothing
      }
      // device not functioning correctly
      else
      {
        reboot(Serial);
        result = at_match(Serial, "AT+CGNSPWR=1\r", "OK", STD_RETRY, STD_RETRY, STD_TIMEOUT);
      }
    }
    delay(STD_TIMEOUT);
    bool response_sent = false;

    String result_1 = send_to_firebase(Serial, gps_lat, gps_long);

    response_sent = true;

    
    
    delay(1000);
  }
}
