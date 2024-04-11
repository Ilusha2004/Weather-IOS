import 'dart:convert';

import 'package:weather_ios/System/container/shared_prefernces.dart';
import 'package:weather_ios/System/weather_parser/remote_source.dart';
import 'package:weather_ios/System/weather_parser/weather_data.dart';

class WeatherRepositoryForPrefWay {
  final RemoteSource remoteSource;
  final MySharedPreferences mySharedPreferences;

  WeatherRepositoryForPrefWay({
    required this.remoteSource,
    required this.mySharedPreferences
  });

  Future<List<WeatherData>> getData() async {
    try {
      final String? jsonData = await mySharedPreferences.getDataIfNotExpired();
      final List<dynamic> jsonList = jsonDecode(jsonData!)['list'] as List<dynamic>;
      return jsonList
          .map((data) => WeatherData.fromMap(data))
          .toList();
        } catch (error) {
        throw Exception(error);
    }
  }

  Future<dynamic> getCity() async {
    try {
      final String? jsonData = await mySharedPreferences.getDataIfNotExpired();
      return jsonDecode(jsonData!)['city'] as dynamic;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<WeatherData>> refreshData() async {
    await remoteSource.fetchData();
    return getData();
  }

}