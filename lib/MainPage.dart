import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_ios/MainPage/weather_bottom_table.dart';
import 'package:weather_ios/MainPage/weather_center_table.dart';
import 'package:weather_ios/MainPage/weather_upper_table.dart';
import 'package:weather_ios/System/screensize.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            child: Column( // Верхний контейнер
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: ScreenSize().screenHeight / 11,),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 100,
                      sigmaY: 100,
                    ),
                    child: WeatherUpperTable(),
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
                    child: WeatherCenterTable(),
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
                    child: WeatherBottomTable(),
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      );
  }
}