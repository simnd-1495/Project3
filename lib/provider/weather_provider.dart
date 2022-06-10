import 'package:dio/dio.dart';
import 'package:project3/model/weather_model.dart';
import 'package:retrofit/retrofit.dart';
part 'weather_provider.g.dart';

const String apiKey = '9e4bce6873a647ae4c9042b7a716e17a';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class WeatherApiProvider {
  factory WeatherApiProvider(Dio dio) = _WeatherApiProvider;
  @GET('/weather')
  Future<WeatherPoint> getWeather({
    @Query("lat") required double lat,
    @Query("lon") required double lon,
    @Query("appid") String apiKey = apiKey,
  });
}
