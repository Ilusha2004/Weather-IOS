import 'package:http/http.dart' as http;
import 'package:weather_ios/System/container/shared_prefernces.dart';

class RemoteSource {
  final MySharedPreferences mySharedPreferences;

  RemoteSource(this.mySharedPreferences);

  // Function to fetch data from the API and cache it locally
  Future<String> fetchData() async {
    print('fetchData');
    try {
      final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=37.785834&lon=-122.406417&appid=ff896d19c1dc90c75346c6a5a828aa92&units=metric'));
      print(response.body);
      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else {
        final isSaved = await mySharedPreferences.saveDataWithExpiration(
            response.body, const Duration(minutes: 10));
        if (isSaved) {
          return response.body;
        } else {
          throw Exception('Failed to save data');
        }
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}