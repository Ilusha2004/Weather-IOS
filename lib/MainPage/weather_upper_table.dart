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
  late Timer _timer;
  dynamic city;
  dynamic date;
  dynamic temperature;
  dynamic weather;
  dynamic feelsLike;
  dynamic sunsetDateInHourAndMinute;
  late bool isLoading = true;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      isLoading = false;
      city = widget.city;
      date = widget.date;
      temperature = widget.temperature;
      weather = widget.weather;
      feelsLike = widget.feelsLike;
      sunsetDateInHourAndMinute = widget.sunsetDateInHourAndMinute;
      print(counter);
      counter += 1;
      if (counter == 2) {
        _timer.cancel();
      }
    });
    // startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {

    if(_timer != null && _timer.isActive && counter == 2) {
      _timer.cancel();
    }
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
                temperature.isNotEmpty ? temperature[0].ceil().toString() : "...",
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
            weather.isNotEmpty ? weather[0].toString() : '...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            city.isNotEmpty ? city['name'] : '...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            date.isNotEmpty ? date[0].toString() : '...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            feelsLike.isNotEmpty && sunsetDateInHourAndMinute.isNotEmpty ?
            "Feels like ${feelsLike[0].ceil().toString()} | Sunset $sunsetDateInHourAndMinute" : "Feels like .. | Sunset ..",
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