import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_ios/System/screensize.dart';

class WeatherUpperTable extends StatefulWidget {
  final dynamic city;
  final dynamic date;
  final dynamic temperature;
  final dynamic weather;
  final dynamic feelsLike;
  final dynamic sunsetDateInHourAndMinute;

  const WeatherUpperTable({
    super.key,
    required this.city,
    required this.date,
    required this.temperature,
    required this.weather,
    required this.feelsLike,
    required this.sunsetDateInHourAndMinute,
  });

  @override
  State<WeatherUpperTable> createState() => _WeatherUpperTableState();
}

class _WeatherUpperTableState extends State<WeatherUpperTable> {
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      // dispose();
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      color: Colors.black38,
      alignment: Alignment.center,
      width: ScreenSize().screenWidth - 70,
      height: (ScreenSize().screenWidth - 70) * 1.075,
      child: Column(
        children: [
          Spacer(),
          Text(
            "Today",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Image.asset(
                "assets/icons/rainy.png",
                height: 85,
              ),
              SizedBox(width: 20,),
              Text(
                widget.temperature.isNotEmpty ? widget.temperature[0].ceil().toString() : "...",
                style: TextStyle(
                  fontSize: 85,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(207, 231, 224, 2),
                ),
              ),
              Spacer(),
            ],
          ),
          Text(
            widget.weather.isNotEmpty ? widget.weather[0].toString() : '...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            widget.city.isNotEmpty ? widget.city['name'] : '...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            widget.date.isNotEmpty ? widget.date[0].toString() : '...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            widget.feelsLike.isNotEmpty && widget.sunsetDateInHourAndMinute.isNotEmpty ?
            "Feels like ${widget.feelsLike[0].ceil().toString()} | Sunset ${widget.sunsetDateInHourAndMinute}" : "Feels like .. | Sunset ..",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}