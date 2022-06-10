import 'package:dio/dio.dart';
import 'package:project3/model/weather_model.dart';
import '../provider/weather_provider.dart';

class ApiConfig {
  WeatherApiProvider weatherApiProvider = WeatherApiProvider(
    Dio(
      BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5'),
    ),
  );

  Future<WeatherPoint> getWeather({required double lon, required double lat}) {
    try {
      final response = weatherApiProvider.getWeather(lat: lat, lon: lon);

      return response;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }
}
