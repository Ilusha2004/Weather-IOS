import 'package:flutter/material.dart';

class WeatherBottomHorisontalPlate extends StatefulWidget {
  @override
  State<WeatherBottomHorisontalPlate> createState() => _WeatherBottomHorisontalPlateState();
}

class _WeatherBottomHorisontalPlateState extends State<WeatherBottomHorisontalPlate> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Text(
            "Today",
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
          Spacer(),
          Text(
            "34%",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          SizedBox(width: 20,),
          Image.asset(
            "assets/icons/rainy.png",
            height: 20,
          ),
          SizedBox(width: 20,),
          Image.asset(
            "assets/icons/rainy.png",
            height: 20
          ),
          SizedBox(width: 20,),
          Text("14°",
          style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(207, 231, 224, 2),
            ),
          ),
          SizedBox(width: 20,),
          Text(
            "12°",
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