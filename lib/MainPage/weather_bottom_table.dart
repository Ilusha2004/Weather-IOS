import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_ios/MainPage/weather_bottom_horisontal_plate.dart';
import 'package:weather_ios/System/screensize.dart';

class WeatherBottomTable extends StatefulWidget {
  final List<dynamic> date;
  final List<dynamic> temperature;
  final List<dynamic> maxTemperature;
  final List<dynamic> minTemperature;
  final List<dynamic> humidity;

  const WeatherBottomTable({
    super.key,
    required this.date,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
  });

  @override
  State<WeatherBottomTable> createState() => _WeatherBottomTableState();
}

class _WeatherBottomTableState extends State<WeatherBottomTable> {
  List<String> date = [];
  List<dynamic> temperature = [];
  List<dynamic> maxTemperature = [];
  List<dynamic> minTemperature = [];
  List<dynamic> humidity = [];
  List<dynamic> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      var now = DateTime.parse(widget.date[0]).hour;
      print(widget.temperature.length);
      for (int i = 0; i < widget.temperature.length; i++) {
        if (now == DateTime.parse(widget.date[i]).hour) {
          date.add(widget.date[i].toString());
          temperature.add(widget.temperature[i]);
          maxTemperature.add(widget.maxTemperature[i]);
          minTemperature.add(widget.minTemperature[i]);
          humidity.add(widget.humidity[i]);
          print(widget.date[i]);

          // TODO: нужно добавить проверку, когда у нас час не совпадает с последним элементом, а то выкинет исключение
          // TODO: добавить мин и макс температуру за день
        }
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      color: Colors.black12,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: ScreenSize().screenWidth - 70,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children:[
                    SizedBox(width: 20,),
                  ]
                ),
              ],
            ),
          ),
          // Spacer(),
          Container(
            alignment: Alignment.centerLeft,
            width: ScreenSize().screenWidth - 70,
            child:
              Wrap(
                children: List.generate(date.length, (index) => WeatherBottomHorisontalPlate(
                  date: DateTime.parse(date[index]).weekday.toString(),
                  temperature: temperature[index].ceil(),
                  maxTemperature: maxTemperature[index].ceil(),
                  minTemperature: minTemperature[index].ceil(),
                  humidity: humidity[index].ceil(),
                )),
            ),
          ),
        ],
      ),
    );
  }
}