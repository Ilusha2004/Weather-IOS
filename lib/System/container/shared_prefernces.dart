import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static const String _keyData = "cacheData";
  static const String _keyExpiration = "expirationDate";
  static const String _keyFinderData = "finderData";

  Future<bool> saveDataForFinder(String finderData) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyFinderData, finderData);
      print("data saved");
      return true;
    } catch (error) {
      print("something was wrong in saveDataForFinder: $error");
      return false;
    }
  }

  Future<String?> getDataForFinder() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? history = prefs.getString(_keyFinderData);
      if (history == null) {
        print("No data in getDataWhenConnectionLost");
        return null;
      }
      return history;
    } catch (error) {
      print("something wrong in getDataWhenConnectionLost: $error");
      return null;
    }
  }

  Future<bool> saveDataWithExpiration(String data, Duration expirationDuration) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime expirationTime = DateTime.now().add(expirationDuration);
      await prefs.setString(_keyData, data);
      await prefs.setString(_keyExpiration, expirationTime.toIso8601String());
      print('Data saved to SharedPreferences.');
      return true;
    } catch (e) {
      print('Error saving data to SharedPreferences: $e');
      return false;
    }
  }

  Future<bool> saveDataIfConnectionLost(String data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime expirationTime = DateTime.now().add(Duration(hours: 128));
      await prefs.setString(_keyData, data);
      await prefs.setString(_keyExpiration, expirationTime.toIso8601String());
      print("data saved when connection was lost");
      return true;
    } catch (error) {
      print("something was wrong in saveDataIfConnectionLost: $error");
      return false;
    }
  }

  Future<String?> getDataIfNotExpired() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString(_keyData);
      String? expirationTimeStr = prefs.getString(_keyExpiration);
      if (data == null || expirationTimeStr == null) {
        print('No data or expiration time found in SharedPreferences.');
        return null;
      }

      DateTime expirationTime = DateTime.parse(expirationTimeStr);
      if (expirationTime.isAfter(DateTime.now())) {
        print('Data has not expired.');
        return data;
      } else {
        await prefs.remove(_keyData);
        await prefs.remove(_keyExpiration);
        print('Data has expired. Removed from SharedPreferences.');
        return null;
      }
    } catch (e) {
      print('Error retrieving data from SharedPreferences: $e');
      return null;
    }
  }

  Future<void> clearData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyData);
      await prefs.remove(_keyExpiration);
      print('Data cleared from SharedPreferences.');
    } catch (e) {
      print('Error clearing data from SharedPreferences: $e');
    }
  }
}
