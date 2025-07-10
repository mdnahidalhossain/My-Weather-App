// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/geo_location.dart';
import 'package:flutter_weather_app/components/weather_api.dart';
import 'package:flutter_weather_app/pages/weather_page.dart';
import 'package:flutter_weather_app/util/colors.dart';
import 'package:flutter_weather_app/util/current_location.dart';
import 'package:flutter_weather_app/util/my_search_button.dart';
import 'package:flutter_weather_app/util/my_text_field.dart';

class WeatherSearchPage extends StatelessWidget {
  late String cityName;
  var response;
  // late Map<String, dynamic> response;

  WeatherSearchPage({super.key, required this.cityName
      //required this.cityName,
      });

  void navigateFromSearchPage(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
      builder: (BuildContext context) => WeatherPage(
        locationWeather: response,
      ),

    ),);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        shadowColor: Colors.black.withOpacity(0.8),
        elevation: 4,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('lib/icons/weather-search.png'),
          MyTextField(
              onChanged: (dynamic value) {
                cityName = value.toUpperCase();
                // cityName = double.parse(value).toString();
              },
              ),
          MySearchButton(
            onTap: () async {
              response =
                await GetWeatherByLocation().getByLocation(cityName);
                  //debugPrint(resp.toString());
                if (response['name'].toString().toUpperCase() != cityName) {
                  return;
                }
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder:(context) => WeatherPage(locationWeather: response,)
              //   ),
              // );
              navigateFromSearchPage(context);
              
            },
            //onTap: () {},
          ),

        ],
      ),
    );
  }
}

