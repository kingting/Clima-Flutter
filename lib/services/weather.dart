import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String apiKey = 'bff470c32b2aab742fd4d5ca1f4c8fa6';
  String weatherUrl = 'api.openweathermap.org';

  Future<dynamic> getCityWeather(String cityName) async {
    String url =
        'https://$weatherUrl/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var cityWeather = await networkHelper.getWeatherData();
    return cityWeather;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    String apiKey = 'bff470c32b2aab742fd4d5ca1f4c8fa6';

    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var locationWeather = await networkHelper.getWeatherData();
    return locationWeather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
