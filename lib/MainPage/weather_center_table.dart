import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_ios/MainPage/weather_middle_little_table.dart';
import 'package:weather_ios/System/icon_changer/icon_changer.dart';
import 'package:weather_ios/System/screensize.dart';

class WeatherCenterTable extends StatefulWidget {
  final dynamic date;
  final dynamic temperature;
  final dynamic id;

  const WeatherCenterTable({
    super.key,
    required this.date,
    required this.temperature,
    this.id
  });

  @override
  State<WeatherCenterTable> createState() => _WeatherCenterTableState();
}

class _WeatherCenterTableState extends State<WeatherCenterTable> {
  dynamic temp;
  dynamic dateList;
  dynamic temperatureList;
  int counter = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {

      dateList = widget.date;
      temperatureList = widget.temperature;
      temp = dateList.asMap().entries.map((entry) {
        int index = entry.key;
        dynamic date = entry.value;
        dynamic temperature = temperatureList[index];
        return [date, temperature];
      });

      setState(() {
        isLoading = false;
      });

      print(temperatureList);
      print(dateList);
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
      color: Colors.black26,
      alignment: Alignment.center,
      width: ScreenSize().screenWidth - 70,
      height: (ScreenSize().screenWidth - 70) * 0.536,
      child: ListView(
        scrollDirection: Axis.horizontal,
        // children: temp != null ? temp.map<Widget>((dynamic widget) {
        //   dynamic date = DateTime.parse(widget[0].toString());
        //   dynamic temperature = widget[1];

        //   return Row(
        //     children: [
        //     SizedBox(width: 20,),
        //     WeatherTitle(
        //       tempeture: temperature.ceil(),
        //       time: "${date.hour}:${date.minute}0",
        //       image: Image.asset(
        //         IconChanger.chooseIcon(230),
        //         width: 40,
        //       ),
        //     ),
        //     ]
        //   );
        // }).toList()
        children: List.generate(14, (index) =>
          Row(
              children: [
              SizedBox(width: 20,),
              WeatherTitle(
                tempeture: widget.temperature[index].ceil(),
                time: "${DateTime.parse(widget.date[index]).hour}:00",
                image: Image.asset(
                  IconChanger.chooseIcon(widget.id[index]),
                  width: 40,
                ),
              ),
            ]
          )
        ),
      ),
      // : [Text("no")]),
    );
  }
}