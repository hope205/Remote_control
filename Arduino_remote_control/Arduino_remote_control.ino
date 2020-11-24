
#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

// Set these to run example.

#define FIREBASE_HOST "firebase host"
#define FIREBASE_AUTH "firebase auth"
#define WIFI_SSID "wifi ssid"
#define WIFI_PASSWORD "wifi password"


#define relayPin D3;

void setup() {
  Serial.begin(9600);

  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

int n = 0;

void loop() {
  n = Firebase.getString("Relay/State");
  if(n == 1){
    Serial.println("RELAY ON");
    digtalWrite(relayPin,HIGH);
    delay(1000);
    }
    else{
      Serial.println("RELAY OFF");
    digtalWrite(relayPin,LOW);

      }

  delay(1000);
  }
  
  
