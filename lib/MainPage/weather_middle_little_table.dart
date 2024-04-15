import 'package:flutter/cupertino.dart';

class WeatherTitle extends StatefulWidget {
  final int? tempeture;
  final String? time;
  final int? humidity;
  final Image image;

  const WeatherTitle({
    super.key, this.tempeture, this.time, required this.image, this.humidity,
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(207, 231, 224, 2),
          ),
        ),

        Column(
          children: [
          SizedBox.fromSize(
            size: Size(47, 50),
            child: widget.image,
          ),
          Text(
            "${widget.tempeture}°",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(207, 231, 224, 2),
              ),
            ),
          SizedBox(height: 5,),
          Row(
            children: [
              Image.asset(
                "assets/icons/drop.fill.png",
                width: 8,
              ),
              SizedBox(width: 5,),
              Text(
                "${widget.humidity}%",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(207, 231, 224, 2),
                  ),
                ),
              ],
            )
          ],
        ),
        Spacer(),
      ],
    );
  }
}