
#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

// Set these to run example.
//"remote-control-c35b5.firebaseio.com"
#define FIREBASE_HOST "remote-control-c35b5.firebaseio.com"
#define FIREBASE_AUTH "90jnpNBthOM4NABx8rw674t1IUx7L42KjBc1fscK"
#define WIFI_SSID "Hope"
#define WIFI_PASSWORD "hopeabcdef"


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
  
  
