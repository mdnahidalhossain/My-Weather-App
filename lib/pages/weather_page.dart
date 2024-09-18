// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/geo_location.dart';
import 'package:flutter_weather_app/pages/weather_search_page.dart';
import 'package:flutter_weather_app/util/colors.dart';
import 'package:flutter_weather_app/util/current_location.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  //final locationWeather;
  final Map<String, dynamic> locationWeather;
  const WeatherPage({super.key, required this.locationWeather});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherStatus = "";
  String weatherIcon = "";
  String temperature = "";
  String location = "";
  String country = "";

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(weatherData) {
    setState(() {
      weatherStatus = weatherData['weather'][0]['main'];
      weatherIcon =
          "${"https://openweathermap.org/img/wn/" + weatherData["weather"][0]["icon"]}@2x.png";

      temperature = weatherData['main']['temp'].toString();

      // temperature = weatherData['main']['temp'];
      //temperature = temp.toInt();

      location = weatherData['name'];
      country = weatherData['sys']['country'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Weather',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: bgColor,
        shadowColor: Colors.black.withOpacity(0.8),
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            // SystemNavigator.pop();
            exit(0);
          },
          icon: Icon(Icons.logout),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WeatherSearchPage(
                  cityName: '',
                ),
              ));
            },
            icon: Icon(Icons.search),
            iconSize: 30,
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CurrentLocationButton(
              
            //   onTap: () async {
            //     Location location = Location();
            //     updateUI(await Location());
            //     },
            //   imagePath: 'lib/icons/current-location.png',
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              //height: 290,
              width: 270,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: dropShadow, blurRadius: 10)]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    //'SUNNY',
                    '$weatherStatus'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: fontColor,
                        letterSpacing: 1),
                  ),
                  Image.network(
                    weatherIcon,
                    width: 120,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // temperature.toString() + '° c',
                    '$temperature° c',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: fontColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    //location.toString() + ', ' + country.toString(),
                    '$location, $country',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: fontColor,
                      //letterSpacing: 1
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${DateFormat('EEEE, d').format(DateTime.now())} | ${DateFormat('h:mm a').format(DateTime.now())}',
                    style: TextStyle(
                        fontSize: 16, color: fontColor, letterSpacing: 1),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
