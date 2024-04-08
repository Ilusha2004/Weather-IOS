import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_ios/System/icon_changer/icon_changer.dart';

class WeatherBottomHorisontalPlate extends StatefulWidget {
  final String date;
  final int temperature;
  final int maxTemperature;
  final int minTemperature;
  final int humidity;
  final dynamic id;

  const WeatherBottomHorisontalPlate ({
    super.key,
    required this.date,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    this.id,
  });

  @override
  State<WeatherBottomHorisontalPlate> createState() => _WeatherBottomHorisontalPlateState();
}

class _WeatherBottomHorisontalPlateState extends State<WeatherBottomHorisontalPlate> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          // день недели
          SizedBox.fromSize(
            size: Size(100, 20),
            child: Text(
              Jiffy(widget.date).EEEE,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(207, 231, 224, 2),
              ),
            ),
          ),
          // иконка влвжности с процентами
          SizedBox.fromSize(
            size: Size(60, 20),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/drop.fill.png",
                  height: 15,
                ),
                SizedBox(width: 10,),
                Text(
                  "${widget.humidity}%",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(207, 231, 224, 2),
                  ),
                ),
              ]
            ),
          ),
          SizedBox(width: 5,),
          // иконки погоды днем и ночью
          SizedBox.fromSize(
            size: Size(70, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconChanger.chooseIcon(widget.id),
                  height: 18,
                ),
                SizedBox(width: 10,),
                Image.asset(
                  IconChanger.chooseIcon(widget.id),
                  height: 18
                ),
              ],
            ),
          ),
          SizedBox(width: 5,),
          // max and min temperature status
          SizedBox.fromSize(
            size: Size(80, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${widget.maxTemperature}°",
                style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(207, 231, 224, 2),
                  ),
                ),
                SizedBox(width: 15,),
                Text(
                  "${widget.minTemperature}°",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(207, 231, 224, 2),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}