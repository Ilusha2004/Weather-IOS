import 'package:weather_ios/System/weather_parser/data_parser.dart';

class WeatherScrapperManager {
  static WeatherScrapper? _weatherScrapperInstance;

  static WeatherScrapper get weatherScrapperInstance {
    if (_weatherScrapperInstance == null) {
      // Инициализация экземпляра класса WeatherScrapper с вашим API-ключом
      String apiKey = "ff896d19c1dc90c75346c6a5a828aa92";
      _weatherScrapperInstance = WeatherScrapper.getInstance(apiKey);
    }
    return _weatherScrapperInstance!;
  }

  static void updateWeatherData(double latitude, double longitude) async {
    // Обновление данных погоды
    await weatherScrapperInstance.scrapperWeather(latitude, longitude);
  }
}