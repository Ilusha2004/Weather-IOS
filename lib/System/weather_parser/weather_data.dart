import 'dart:convert';

class WeatherData {
  final dynamic mainTemperature;
  final dynamic weather;
  final dynamic dateTxt;
  final dynamic feelsLike;
  final dynamic humidity;
  final dynamic minTemperature;
  final dynamic maxTemperature;
  final dynamic id;

  const WeatherData({
    required this.mainTemperature,
    required this.weather,
    required this.dateTxt,
    required this.feelsLike,
    required this.humidity,
    required this.minTemperature,
    required this.maxTemperature,
    required this.id
  });

  List<Object> get props => [mainTemperature, weather, dateTxt, feelsLike, humidity, minTemperature, maxTemperature, id];

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'mainTemperature' : mainTemperature,
      'weather' : weather,
      'dateTxt' : dateTxt,
      'feelsLike' : feelsLike,
      'humidity' : humidity,
      'minTemperature' : minTemperature,
      'maxTemperature' : maxTemperature,
      'id' : id
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> list) {
    return WeatherData(
      mainTemperature:    list['main']['temp'] as dynamic,
      weather:            list['weather'][0]['main'] as dynamic ,
      dateTxt:            list['dt_txt'] as dynamic ,
      feelsLike:          list['main']['feels_like'] as dynamic ,
      humidity:           list['main']['humidity'] as dynamic ,
      minTemperature:     list['main']['temp_min'] as dynamic ,
      maxTemperature:     list['main']['temp_max'] as dynamic ,
      id:                 list['weather'][0]['id'] as dynamic
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) {
    final decoded = json.decode(source) as Map<String, dynamic>;
    final list = decoded['list'] as List<dynamic>;
    final map = list[0] as Map<String, dynamic>;
    print(map);

    return WeatherData.fromMap(map);
  }

}