# weather
This is a Java application that retrieves and displays weather data for a given city using the OpenWeatherMap API. It prompts the user to input a city name and then fetches and displays information such as temperature, humidity, wind speed, and weather description.

Before running the code, make sure you have the following prerequisites:
 
1. Java Development Kit (JDK) installed on your computer.  
2. An OpenWeatherMap API key. You can sign up for a free API key at [OpenWeatherMap](https://openweathermap.org/).
To make this application work, you need to replace the apiKey variable in the wApp.java file with your own OpenWeatherMap API key. 

Code Explanation:
1. The application prompts the user to input a city name.
2. It constructs a URL to make a request to the OpenWeatherMap API with the specified city and API key.
3. The code fetches weather data in JSON format using an HTTP connection and processes the response.
4. It extracts temperature, humidity, wind speed, and weather description from the JSON data.
5. The information is then displayed on the console.
(The temperature is converted from Kelvin to Celsius. The wind speed is in meters per second and is converted to kilometers per hour.)
