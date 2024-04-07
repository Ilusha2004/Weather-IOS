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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          widget.time ?? "Now",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(255, 255, 255, 0.965),
          ),
        ),

        Column(
          children: [
          widget.image,
          Text(
            "${widget.tempeture}°",
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