import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_ios/System/icon_changer/icon_changer.dart';
import 'package:weather_ios/System/screensize.dart';

class WeatherUpperTable extends StatefulWidget {
  final dynamic city;
  final dynamic date;
  final dynamic temperature;
  final dynamic weather;
  final dynamic feelsLike;
  final dynamic sunsetDateInHourAndMinute;
  final dynamic id;

  const WeatherUpperTable({
    super.key,
    required this.city,
    required this.date,
    required this.temperature,
    required this.weather,
    required this.feelsLike,
    required this.sunsetDateInHourAndMinute,
    this.id
  });

  @override
  State<WeatherUpperTable> createState() => _WeatherUpperTableState();
}

class _WeatherUpperTableState extends State<WeatherUpperTable> {
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print(widget.temperature.runtimeType);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
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
                IconChanger.chooseIcon(widget.id.isNotEmpty ? widget.id[0] : 0),
                height: 85,
              ),
              SizedBox(width: 20,),
              Text(
                widget.temperature.isNotEmpty ? "${widget.temperature[0].ceil()}°" : "...",
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
            widget.city.isNotEmpty ? widget.city : '...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            widget.date.isNotEmpty ? "${DateTime.parse(widget.date[0]).day} ${DateFormat.MMMM().format(DateTime.parse(widget.date[0]))}" : '...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            widget.feelsLike.isNotEmpty && widget.sunsetDateInHourAndMinute != null ?
            "Feels like ${widget.feelsLike[0].ceil()}° | "
            "Sunset ${DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(widget.sunsetDateInHourAndMinute * (1000)))}" : "Feels like .. | Sunset ..",
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