import 'dart:ui';

import 'package:flutter/cupertino.dart';

class weather_little extends StatefulWidget {
  final int? tempeture;
  final String? time;
  final Image image;

  const weather_little({
    super.key, this.tempeture, this.time, required this.image,
  });

  @override
  State<weather_little> createState() => _weather_littleState();
}

class _weather_littleState extends State<weather_little> {

  int tempeture = 0;
  String time = "Now";
  Image image = Image.asset(
    "assets/images/background/rainy_day.png",
    height: 5,
  );

  @override
  void initState() {
    super.initState();
    tempeture = widget.tempeture!;
    time = widget.time!;
    image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(255, 255, 255, 0.965),
          ),
        ),

        Row(
          children: [
          image,
          Text(
            "$tempeture°",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(255, 255, 255, 0.965)
              ),
            ),
          ],
        )
      ],
    );
  }
}