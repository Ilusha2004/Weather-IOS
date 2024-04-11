import 'package:flutter/material.dart';
import 'package:weather_ios/System/weather_parser/remote_source.dart';
import 'package:weather_ios/System/weather_parser/repository.dart';
import 'package:weather_ios/System/weather_parser/weather_data.dart';
import 'package:weather_ios/pages/MainPage/MainPage.dart';

import 'System/container/shared_prefernces.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WeatherRepositoryForPrefWay _repoClass2 = WeatherRepositoryForPrefWay(
  remoteSource: RemoteSource(MySharedPreferences()),
  mySharedPreferences: MySharedPreferences());

  Future<dynamic> posts() async {
    var temp1 = await _repoClass2.getData().then((value) => value);
    var temp2 = await _repoClass2.getCity().then((value) => value);
    return [temp1, temp2];
  }

  @override
  void initState() {
    // _repoClass2.clearData();
    _repoClass2.refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: posts(),
          builder: (futureContest, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<dynamic>? data = snapshot.data;
              print(data?[1]);
              print(data?[0].map((value) => value.props[2]));

              return MainPage(
                city: data?[1],
                data: data?[0]
              );
            }
          }
        ),
      ),
    );
  }
}
