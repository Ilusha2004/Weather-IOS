class WeatherURL {
  final double _latitude;
  final double _longitude;
  final String _units;
  final String _apiKey;

  WeatherURL(this._latitude, this._longitude, this._units, this._apiKey);

  double get latitude => _latitude;
  double get longitude => _longitude;
  String get units => _units;
  String get apiKey => _apiKey;

  String create() {
    return "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=$units";
  }
}