// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/geo_location.dart';
import 'package:flutter_weather_app/components/network.dart';
import 'package:flutter_weather_app/pages/weather_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Map<String, dynamic> weatherData;
  
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    try {
      String weatherUrl =
          "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";

      NetworkHelper networkHelper = NetworkHelper(weatherUrl);
      weatherData = await networkHelper.getData();
      // Navigate after getting the weather data
      navigateToWeatherPage();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigateToWeatherPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherPage(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Color.fromARGB(255, 136, 231, 255),
          size: 100.0,
        ),
      ),
    );
  }
}
