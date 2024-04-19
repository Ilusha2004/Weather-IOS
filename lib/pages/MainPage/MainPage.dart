import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_ios/MainPage/weather_bottom_table.dart';
import 'package:weather_ios/MainPage/weather_center_table.dart';
import 'package:weather_ios/MainPage/weather_finder.dart';
import 'package:weather_ios/MainPage/weather_upper_table.dart';
import 'package:weather_ios/System/screensize.dart';

class MainPage extends StatefulWidget {
  final dynamic city;
  final List<dynamic> data;
  const MainPage({
    super.key,
    required this.city,
    required this.data
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isLoading = true;

  late dynamic city;
  late List<dynamic> data;

  @override
  void initState() {
    super.initState();
    setState(() {
      data = widget.data;
      city = widget.city;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
      ScreenSize().update(context); // Данная функция выполняет функцию обновления разрешения экрана
      return Stack(
        children: [
          // Дочерний виджет 1 (задний фон)
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background/rainy_day.png'), // Замените путь к изображению на свой
                  fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: ScreenSize().screenWidth - 40,
              child: ListView( // Верхний контейнер
                children: [
                  WeatherSearchBar(),
                  SizedBox(height: 20,),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 100,
                        sigmaY: 100,
                      ),
                      child: WeatherUpperTable(
                        city:                        city['name'],
                        date:                        data.map((value) => value.props[2]).toList(),
                        temperature:                 data.map((value) => value.props[0]).toList(),
                        weather:                     data.map((value) => value.props[1]).toList(),
                        feelsLike:                   data.map((value) => value.props[3]).toList(),
                        sunsetDateInHourAndMinute:   city['sunrise'],
                        id:                          data.map((value) => value.props[7]).toList(),
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 7,
                        sigmaY: 7,
                      ),
                      child: WeatherCenterTable(
                        date:         data.map((value) => value.props[2]).toList(),
                        temperature:  data.map((value) => value.props[0]).toList(),
                        humidity:     data.map((value) => value.props[4]).toList(),
                        id:           data.map((value) => value.props[7]).toList(),
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: WeatherBottomTable(
                        date:             data.map((value) => value.props[2]).toList(),
                        temperature:      data.map((value) => value.props[0]).toList(),
                        maxTemperature:   data.map((value) => value.props[6]).toList(),
                        minTemperature:   data.map((value) => value.props[5]).toList(),
                        humidity:         data.map((value) => value.props[4]).toList(),
                        id:               data.map((value) => value.props[7]).toList(),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      );
  }
}