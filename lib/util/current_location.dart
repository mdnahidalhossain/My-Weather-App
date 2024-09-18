// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/util/colors.dart';

class CurrentLocationButton extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath;
  const CurrentLocationButton(
      {super.key,
      required this.onTap,
      required this.imagePath, 
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: dropShadow,
              blurRadius: 10,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              color: Colors.white,
            ),
            Center(
              child: Text(
                'Get My Location',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontSize: 12
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



