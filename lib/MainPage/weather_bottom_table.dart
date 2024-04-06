import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios/MainPage/weather_bottom_horisontal_plate.dart';
import 'package:weather_ios/System/geolocation/data_locator.dart';
import 'package:weather_ios/System/screensize.dart';
import 'package:weather_ios/System/weather_parser/weather_scrapper_data.dart';

class WeatherBottomTable extends StatelessWidget {
  const WeatherBottomTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

          Container(
            alignment: Alignment.centerLeft,
            width: ScreenSize().screenWidth - 70,
            child:
              Wrap(
                children: List.generate(7, (index) => WeatherBottomHorisontalPlate()),
            ),
          ),
        ],
      ),
    );
  }
}