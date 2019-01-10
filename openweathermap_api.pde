/*
 API call example for http://api.openweathermap.org
 
 cc teddavis.org 2019
 RIP yahoo yql weatherservice
 */

XML xml;
String apikey = ""; // your openweathermap api key here!
String defaultCity = "basel";

String returnedCity;
String returnedCountry;
float lon, lat;

int tempHigh;
int tempLow;
int temperature;
int humidity;
int pressure;
int weatherValue;
String weatherName;
int visibility;
int cloudsValue;
String cloudsName;
int windSpeed;
String windName;
int windDirection;

void setup() {
  size(500, 500);
  background(0);
  getWeather("earth");
}

void draw() {
  background(map(temperature, 0, 40, 0, 255));
}

void getWeather(String cityName) {
  xml = loadXML("https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid="+apikey+"&mode=xml&units=metric");
  if (xml != null) {
    returnedCity = xml.getChild("city").getString("name");
    returnedCountry = xml.getChild("city").getChild("country").getContent();
    lon = xml.getChild("city").getChild("coord").getFloat("lon");
    lat = xml.getChild("city").getChild("coord").getFloat("lat");

    tempHigh = round(xml.getChild("temperature").getFloat("max"));
    tempLow = round(xml.getChild("temperature").getFloat("min"));
    temperature = round(xml.getChild("temperature").getFloat("value"));

    humidity = round(xml.getChild("humidity").getFloat("value"));
    pressure = round(xml.getChild("pressure").getFloat("value"));

    weatherValue = xml.getChild("weather").getInt("number");
    weatherName = xml.getChild("weather").getString("value");
    visibility = round(xml.getChild("visibility").getFloat("value"));

    cloudsValue = round(xml.getChild("clouds").getFloat("value"));
    cloudsName = xml.getChild("clouds").getString("name");

    windSpeed = round(xml.getChild("wind").getChild("speed").getFloat("value"));
    windName = xml.getChild("wind").getChild("speed").getString("name");
    windDirection = round(xml.getChild("wind").getChild("direction").getFloat("value"));

    // print values!
    println(
      "returnedCity: "+returnedCity 
      +"\nreturnedCountry: "+ returnedCountry 
      +"\nlon: "+ lon 
      +"\nlat: "+ lat 
      +"\ntemperature: "+ temperature 
      +"\ntempHigh: "+ tempHigh 
      +"\ntempLow: "+ tempLow 
      +"\nhumidity: "+ humidity 
      +"\npressure: "+ pressure 
      +"\nweatherValue: "+ weatherValue 
      +"\nweatherName: "+ weatherName 
      +"\nvisibility: " + visibility
      +"\ncloudsValue: " + cloudsValue
      +"\ncloudsName: " + cloudsName
      +"\nwindSpeed: " + windSpeed
      +"\nwindName: " + windName
      +"\nwindDirection: " + windDirection
      );
  } else {
    // NO CITY FOUND, default to pref above, or run other function:
    println("no city found for "+cityName+", searching default, " + defaultCity+"\n");
    getWeather(defaultCity);
  }
}
