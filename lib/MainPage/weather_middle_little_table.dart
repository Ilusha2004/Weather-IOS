import 'dart:ui';

import 'package:flutter/cupertino.dart';

class WeatherTitle extends StatefulWidget {
  final int? tempeture;
  final String? time;
  final Image image;

  const WeatherTitle({
    super.key, this.tempeture, this.time, required this.image,
  });

  @override
  State<WeatherTitle> createState() => _WeatherTitleState();
}

class _WeatherTitleState extends State<WeatherTitle> {

  int tempeture = 0;
  String time = "Now";
  Image image = Image.asset(
    "assets/images/background/rainy_day.png",
    height: 10,
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
        Spacer(),
        Text(
          time,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(255, 255, 255, 0.965),
          ),
        ),

        Column(
          children: [
          image,
          Text(
            "$tempeture°",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(255, 255, 255, 0.965)
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}