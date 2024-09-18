import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/loading_screen.dart';
//import 'package:flutter_weather_app/pages/weather_page.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //textTheme: TextTheme(bodyLarge: GoogleFonts.roboto())
      ) ,
      // home: WeatherPage(),
      home: const LoadingScreen(),
    );
  }
}

