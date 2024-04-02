import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios/System/screensize.dart';

class WeatherUpperTable extends StatelessWidget {
  const WeatherUpperTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                "13",
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
            "Rainy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            "California, Los Angeles",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            "2 Apr 2024",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          Text(
            "Feels like 8 | Sunset 18:20",
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