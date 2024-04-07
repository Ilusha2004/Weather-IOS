import 'package:weather_ios/System/icon_changer/weather_mapper.dart';
import 'package:weather_ios/enum/weather_type_main.dart';

class IconChanger {

  static String chooseIcon(int id) {

    if (id >= 200 && id <= 232) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.thunderstorm);
    }

    else if (id >= 300 && id <= 321) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.showerRain);
    }

    else if (id >= 500 && id <= 521) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.rain);
    }

    else if (id >= 600 && id <= 622) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.snow);
    }

    else if (id >= 701 && id <= 781) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.mist);
    }

    else if (id >= 801 && id <= 804) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.fewClouds);
    }

    else if (id == 800) {
      return CurrentWetaherMapperDay.getIconPath(CurrentWeather.clearSky);
    }

    return CurrentWetaherMapperDay.getIconPath(CurrentWeather.unknown);
  }
}