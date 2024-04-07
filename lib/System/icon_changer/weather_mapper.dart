import 'package:weather_ios/enum/weather_type_main.dart';

class CurrentWetaherMapperDay {
  static const List<String> icons_path = [
    "assets/icons/current_weather/day/sun.max.fill.png",
    "assets/icons/current_weather/day/cloud.sun.fill.png",
    "assets/icons/current_weather/day/cloud.fill.png",
    "assets/icons/current_weather/day/smoke.fill.png",
    "assets/icons/current_weather/day/cloud.drizzle.fill.png",
    "assets/icons/current_weather/day/cloud.sun.rain.fill.png",
    "assets/icons/current_weather/day/cloud.sun.bolt.fill.png",
    "assets/icons/current_weather/day/snowflake.png",
    "assets/icons/current_weather/day/humidity.fill.png"
  ];

  static String getIconPath(CurrentWeather currentWeather) {
    return icons_path[currentWeather.index];
  }

}