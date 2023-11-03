package weather;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.text.DecimalFormat;

public class wApp {
    public static void main(String[] args) {
        String apiKey = "573dad537aef3771ddcd67db86fdb583";
        String city = "";

        Scanner scanner = new Scanner(System.in);
        System.out.print("City name:");
        city = scanner.nextLine();
        scanner.close();

        try {
            String weatherData = fetchWeatherData(apiKey, city);
            displayWeatherData(weatherData);
        } catch (IOException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }
    }

    public static String fetchWeatherData(String apiKey, String city) throws IOException {

        String URLbase = "http://api.openweathermap.org/data/2.5/weather?";
        String URLcompletely = URLbase + "appid=" + apiKey + "&q=" + city;
        URL url = new URL(URLcompletely);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        InputStream inputStream = connection.getInputStream();
        Scanner scanner = new Scanner(inputStream);

        StringBuilder responseData = new StringBuilder();
        while (scanner.hasNext()) {
            responseData.append(scanner.next());
        }

        scanner.close();
        connection.disconnect();

        return responseData.toString();
    }

    public static void displayWeatherData(String weatherData) {
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = jsonParser.parse(weatherData).getAsJsonObject();

        double temperature = jsonObject.getAsJsonObject("main").get("temp").getAsDouble() - 273.15;
        int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
        double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
        String weatherDescription = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("description").getAsString();

        DecimalFormat df = new DecimalFormat("#.##");
        String formattedTemperature = df.format(temperature);

        System.out.println("Temperature: " + formattedTemperature + "°C");
        System.out.println("Humidity: " + humidity + "%");
        System.out.println("Wind Speed: " + windSpeed + " km/h");
        System.out.println("Weather description: " + weatherDescription);
    }
}
