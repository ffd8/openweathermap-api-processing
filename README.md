## openweathermap api for processing

*RIP* Yahoo's YQL weather services. 😭 It was a great and easy to use API for student projects. It's replacement, YDN with OAUTH requirements (lacking documentation), isn't exactly friendly. In need of emergency fix, thankfully found [openweathermap.org](https://openweathermap.org) via twitter thread on issue. Let's hope it's free service lasts.

Here's a basic Processing (3.4) example for querying the API by city name and parsing a handful of the XML results back. Could request JSON, but existing project was in XML, so yeah.

### Get API Key
[Sign up](https://openweathermap.org/appid) for a free API key (limited to 60 calls per min)


### Parsed Values
- returnedCity
- returnedCountry
- lon, lat
- tempHigh
- tempLow
- temperature
- humidity
- pressure
- weatherValue
- weatherName
- visibility
- cloudsValue
- cloudsName
- windSpeed
- windName
- windDirection

There's plenty of additional fields to consider:
[Sample call for London](
https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22&mode=xml)
So just add any missing ones as needed, ie. sun rise/set.

Hope it helps your future creative coding project using the weather.