import 'package:flutter/foundation.dart';
import 'package:project3/model/weather_model.dart';

import '../repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherPoint? currentWeather;
  ApiConfig apiConfig = ApiConfig();
  bool loading = true;

  void getWeather({required double lon, required double lat}) async {
    loading = true;
    notifyListeners();
    currentWeather = await apiConfig.getWeather(lon: lon, lat: lat);
    loading = false;
    notifyListeners();
  }

  String convertTemp(double tempF) {
    final tempC = (tempF - 32) / 1.8;
    return tempC.round().toString();
  }
}
