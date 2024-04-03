import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class WeatherScrapper {
  // Ключ доступа к API
  final String apiKey;

  final String units = "metric";

  // Город, который мы хотим найти
  dynamic city;

  // Температура
  List<dynamic> mainTemperature = [];

  // Тип погоды (типо: дождь или пасмурно)
  List<dynamic> weather = [];

  // Дата
  List<dynamic> dateTxt = [];

  List<dynamic> foreasts = [];

  WeatherScrapper({required this.apiKey});

  Future<void> scrapperWeather(latitude, longitude) async {

    // final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$longitude&lon=$latitude&appid=$apiKey&units=$units'));
    // dom.Document html = dom.Document.html(response.body);
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=37.785834&lon=-122.406417&appid=ff896d19c1dc90c75346c6a5a828aa92&units=metric'));
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

        this.mainTemperature.add(mainTemperature);
        this.weather.add(weather);
        this.dateTxt.add(dateTxt);

        foreasts.add({
          'mainTemperature': mainTemperature,
          'weather': weather,
          'dateTxt': dateTxt,
        });
      }
    }
  }
}