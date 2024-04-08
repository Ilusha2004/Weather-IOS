import 'package:flutter/material.dart';
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
          Text(
            widget.date,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          SizedBox(width: 20,),
          Image.asset(
            "assets/icons/rainy.png",
            height: 20,
          ),
          // Spacer(),
          Text(
            "${widget.humidity}%",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          SizedBox(width: 20,),
          Image.asset(
            IconChanger.chooseIcon(widget.id),
            height: 20,
          ),
          SizedBox(width: 20,),
          Image.asset(
            IconChanger.chooseIcon(widget.id),
            height: 20
          ),
          SizedBox(width: 20,),
          Text("${widget.maxTemperature}°",
          style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          SizedBox(width: 20,),
          Text(
            "${widget.minTemperature}°",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
        ],
      ),
    );
  }
}