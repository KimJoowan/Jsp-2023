#include <LiquidCrystal_I2C.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

const char *ssid = "iptime506";
const char *password = "55136572";

String content;

//기상청 RSSURL 주소
String url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=x5NlMcXTQiP1jtAjuXMQtx3odJXAuJKYloUQ5D9mvGyGqmd7lltVObDXEMKDlkMRczqUS5UbEZDJ3ikaPqPBQw%3D%3D&returnType=xml&numOfRows=1&pageNo=1&sidoName=%EC%84%9C%EC%9A%B8&ver=1.0";

//lcd 변수
LiquidCrystal_I2C lcd(0x27,16,2);

void setup() {
  
    //통신속도
    Serial.begin(115200);
    
    //와이파이 초기화 및 접속
    WiFi.begin(ssid,password);

    //와이파이 연결 기다리기
    while(WiFi.status()!= WL_CONNECTED){
      delay(500);
      Serial.print(".");
      Serial.print(WiFi.status());
      
    }
    //lcd 초기화
    lcd.init();
    // LCD 백라이트 켜짐
    lcd.backlight();       
}

void loop() {
  if(WiFi.status() == WL_CONNECTED){
    WiFiClient client;
    HTTPClient http;
    http.begin(client, url);

    //http 에서 정보를 받다온다.
    int httpCode = http.GET();
    Serial.println(http.getString());

    if(httpCode>0){
      String result = http.getString();
      Serial.println(result);

      // 시작 문자인덱스 알아내기
      int pm10Value1 = result.indexOf("<pm10Value>");
      int pm10Value2 = result.indexOf("</pm10Value>");
      String pm10 = "<pm10Value>";

      //원하는 문자열만 추출해서 출력
      if(pm10Value1 > 0){
        content = result.substring(pm10Value1 + pm10.length(), pm10Value2);
        Serial.print(content);
      }
      
      //lcd 출력
      lcd.setCursor(0,0);
      lcd.print("PM10 : ");
      lcd.setCursor(7,0);
      lcd.print(content);
      
    }

    
    http.end();
  }
  delay(10000);
}
