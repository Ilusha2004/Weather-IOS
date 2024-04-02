
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios/MainPage/weather_middle_little_table.dart';
import 'package:weather_ios/System/screensize.dart';

class WeatherCenterTable extends StatelessWidget {
  const WeatherCenterTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      alignment: Alignment.center,
      width: ScreenSize().screenWidth - 70,
      height: (ScreenSize().screenWidth - 70) * 0.536,
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Spacer(),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Spacer(),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),
              SizedBox(width: 20,),
              weather_little(
                tempeture: 10,
                time: "Now",
                image: Image.asset(
                  "assets/icons/rainy.png",
                  width: 15,
                ),
              ),

              Spacer()
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}