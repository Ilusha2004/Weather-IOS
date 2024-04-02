import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ios/System/screensize.dart';

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
                    Text(
                      "Random Text",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 0.996),
                      ),
                    ),
                  ]
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: ScreenSize().screenWidth - 70,
            height: (ScreenSize().screenWidth - 70) * 0.33,
            child: Row(
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: Text(
                    "Improve him believe opinion offered met and end cheered forbade. Friendly as stronger speedily by recurred. Son interest wandered sir addition end say. Manners beloved affixed picture men ask.",
                    softWrap: true,
                    style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(width: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}