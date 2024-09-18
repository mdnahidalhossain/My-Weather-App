import 'package:flutter_weather_app/components/network.dart';
//import 'package:weather_today_completed/services/network.dart';


class GetWeatherByLocation {
  Future<dynamic> getByLocation(String location) async {
    final String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
    // NetworkHelper networkHelper = NetworkHelper('$weatherUrl');
    NetworkHelper networkHelper = NetworkHelper(weatherUrl);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}