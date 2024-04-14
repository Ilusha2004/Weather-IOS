import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_ios/System/weather_parser/remote_source.dart';
import 'package:weather_ios/System/weather_parser/repository.dart';
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

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  Future<dynamic> posts() async {
    var temp1 = await _repoClass2.getData().then((value) => value);
    var temp2 = await _repoClass2.getCity().then((value) => value);
    return [temp1, temp2];
  }

  @override
  void initState() {
    // _repoClass2.clearData();
    super.initState();
    _repoClass2.refreshData();
    Timer.periodic(Duration(minutes: 10), (timer) {
      initConnectivity();
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
      _repoClass2.refreshData();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }



  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      _repoClass2.refreshData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: FutureBuilder(
            future: posts(),
            builder: (futureContest, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }
              // else if (snapshot.hasError) {
              //   return Center(child: Text('Error: ${snapshot.error}'));
              // }
              else {
                List<dynamic>? data = snapshot.data;
                if (data == null) {
                 Future.delayed(Duration(seconds: 0), () {
                    _repoClass2.refreshData().then((_) {
                      setState(() {}); // Обновить состояние виджета
                    });
                  });
                  return Center(child: CircularProgressIndicator());
                }
                return MainPage(
                  city: data[1],
                  data: data[0]
                );
              }
            }
          ),
        ),
      ),
    );
  }
}
