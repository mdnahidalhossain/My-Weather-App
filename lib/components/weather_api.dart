import 'package:flutter_weather_app/components/network.dart';
//import 'package:weather_today_completed/services/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetWeatherByLocation {
  String apiKey = dotenv.env['API_KEY']!;
  Future<dynamic> getByLocation(String location) async {
    final String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=${apiKey}&units=metric";
    // NetworkHelper networkHelper = NetworkHelper('$weatherUrl');
    NetworkHelper networkHelper = NetworkHelper(weatherUrl);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
