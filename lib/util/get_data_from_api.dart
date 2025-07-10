import 'package:flutter/material.dart';

class GetDataFromApi extends ChangeNotifier {
  String weatherStatus = "";
  String weatherIcon = "";
  String temperature = "";
  String location = "";
  String country = "";

  void updateUI(weatherData) {
    weatherStatus = weatherData['weather'][0]['main'];
    weatherIcon =
        "${"https://openweathermap.org/img/wn/" + weatherData["weather"][0]["icon"]}@2x.png";

    temperature = weatherData['main']['temp'].toString();

    // temperature = weatherData['main']['temp'];
    //temperature = temp.toInt();

    location = weatherData['name'];
    country = weatherData['sys']['country'];

    notifyListeners();
  }
}
