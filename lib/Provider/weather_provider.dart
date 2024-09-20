import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/weather_helper.dart';
import '../Modal/weather_modal.dart';


var date = DateTime.now();
bool islike =false;

class WeatherProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  WeatherModal? weatherModal;
  String search = 'surat';
  List<String> favouriteList = [];
  bool isDay = true;
  String month = '';

  Future<WeatherModal?> fetchDataFromApi() async {
    final json = await apiHelper.fetchApi(search);
    weatherModal = WeatherModal.fromJson(json);
    return weatherModal;
  }

  void searchWeather(String value) {
    value.toLowerCase();
    search = value;
    notifyListeners();
  }

  Future<void> favouriteCity(
      String name, double temp, String condition, String icon) async {
    favouriteList.add('$name-$temp-$condition-$icon');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('weather', favouriteList);
    notifyListeners();
  }

  Future<void> getFavouriteCity() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    favouriteList = sharedPreferences.getStringList('weather') ?? <String>[];
    print(favouriteList);
    notifyListeners();
  }

  void changeTheme() {
    if (weatherModal!.currentModal.is_day == 1) {
      isDay = true;
      notifyListeners();
    } else {
      isDay = false;
      notifyListeners();
    }
  }

  void time() {
    switch (date.month) {
      case 1:
        month = 'January';
        notifyListeners();
        break;
      case 2:
        month = 'February';
        notifyListeners();
        notifyListeners();
        break;
      case 3:
        month = 'March';
        notifyListeners();
        break;
      case 4:
        month = 'April';
        notifyListeners();
        break;
      case 5:
        month = 'May';
        notifyListeners();
        break;
      case 6:
        month = 'June';
        notifyListeners();
        break;
      case 7:
        month = 'July';
        notifyListeners();
        break;
      case 8:
        month = 'August';
        notifyListeners();
        break;
      case 9:
        month = 'September';
        notifyListeners();
        break;
      case 10:
        month = 'October';
        notifyListeners();
        break;
      case 11:
        month = 'November';
        notifyListeners();
        break;
      case 12:
        month = 'December';
        notifyListeners();
        break;
    }
  }

  WeatherProvider() {
    getFavouriteCity();
    Timer(
      const Duration(seconds: 3),
          () {
        changeTheme();
      },
    );
  }
}