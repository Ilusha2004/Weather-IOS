import 'package:http/http.dart' as http;
import 'package:weather_ios/System/container/shared_prefernces.dart';
import 'package:weather_ios/System/geolocation/data_locator.dart';
import 'package:weather_ios/System/url/url_constructor.dart';
import 'package:weather_ios/auth/keys.dart';

class RemoteSource {
  final MySharedPreferences mySharedPreferences;

  RemoteSource(this.mySharedPreferences);

  Future<String> fetchDataWithCity(String city) async {
    print("fetchDataWithCity");
    try {

      return "";
    } catch (error) {
      print("something went wrong fetchDataWithCity: $error");
      throw Exception(error);
    }
  }

  // Function to fetch data from the API and cache it locally
  Future<String> fetchData() async {
    print('fetchData');
    try {
      final coordinate = await Locator().determinePosition();
      final weatherUrl = WeatherURL(
        latitude: coordinate.latitude,
        longitude: coordinate.longitude,
        apiKey: (await SecretLoader(secretPath: "lib/auth/keys.json").load()).apikey,
      );

      final response = await http.get(Uri.parse(weatherUrl.create()));

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      } else if (response.statusCode == 404) {
        final dataWithLostConnection = await
          mySharedPreferences.saveDataIfConnectionLost(response.body);
        if (dataWithLostConnection) {
          return response.body;
        } else {
          throw Exception("Failed to load data");
        }
      } else {
        final isSaved = await mySharedPreferences.saveDataWithExpiration(
            response.body, const Duration(seconds: 4));
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