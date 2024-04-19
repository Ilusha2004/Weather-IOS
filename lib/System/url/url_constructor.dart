class WeatherURL {
  final double? latitude;
  final double? longitude;
  final String units;
  final String apiKey;
  final String? cityName;

  WeatherURL({required this.latitude, required this.longitude, this.units = 'metric', this.cityName = 'minsk', required this.apiKey});


  String create() {
    if (latitude != null && longitude != null) {
      return "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=$units";
    }
    return "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=$units";
  }
}