import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class WeatherScrapper {
  // Ключ доступа к API
  final String _apiKey;

  final String units = "metric";

  // Город, который мы хотим найти
  dynamic city;

  // Температура
  List<dynamic> mainTemperature = [];

  // Тип погоды (типо: дождь или пасмурно)
  List<dynamic> weather = [];

  // Дата
  List<dynamic> dateTxt = [];

  List<dynamic> feelsLike = [];

  List<dynamic> foreasts = [];

  List<dynamic> humidity = [];

  List<dynamic> minTemperature = [];

  List<dynamic> maxTemperature = [];

  // Приватный статический экземпляр класса WeatherScrapper
  static WeatherScrapper? _instance;

  WeatherScrapper._(this._apiKey);

  // Публичный статический метод для получения экземпляра класса WeatherScrapper
  static WeatherScrapper getInstance(String apiKey) {
    _instance ??= WeatherScrapper._(apiKey);
    return _instance!;
  }

  Future<void> clearData() async {
    mainTemperature = [];
    weather = [];
    dateTxt = [];
    feelsLike = [];
    foreasts = [];
    humidity = [];
    minTemperature = [];
    maxTemperature = [];
  }

  Future<void> scrapperWeather(latitude, longitude) async {

    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$longitude&lon=$latitude&appid=$_apiKey&units=metric')
    );

    dom.Document html = dom.Document.html(response.body);

    if (response.statusCode == 200) {
      final test = html.querySelectorAll("body")
        .map((element) => element.innerHtml.trim())
        .toList();

      final jsonString = test.toString();
      final jsonData = jsonDecode(jsonString);

      // основные данные о погоде, которые содержат от температуры до типа погоды
      final forecasts = jsonData[0]['list'];

      final city = jsonData[0]['city'];

      this.city = city;

      for (var forecast in forecasts) {
        final mainTemperature = forecast['main']['temp'];
        final weather = forecast['weather'][0]['main'];
        final dateTxt = forecast['dt_txt'];
        final feelsLike = forecast['main']['feels_like'];
        final humidity = forecast['main']['humidity'];
        final minTemperature = forecast['main']['temp_min'];
        final maxTemperature = forecast['main']['temp_max'];

        this.mainTemperature.add(mainTemperature);
        this.weather.add(weather);
        this.dateTxt.add(dateTxt);
        this.feelsLike.add(feelsLike);
        this.humidity.add(humidity);
        this.minTemperature.add(minTemperature);
        this.maxTemperature.add(maxTemperature);

        foreasts.add({
          'mainTemperature': mainTemperature,
          'weather': weather,
          'dateTxt': dateTxt,
          'feelsLike' : feelsLike,
          'min_temperature' : minTemperature,
          'max_temperature' : maxTemperature,
          'humidity' : humidity
        });
      }
    }
  }
}