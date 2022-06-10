import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherPoint {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main main;
  int? visibility;
  Wind wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  @JsonKey(name: 'name', defaultValue: '')
  String name;
  int? cod;

  WeatherPoint({this.coord, this.weather, this.base, required this.main, this.visibility, required this.wind, this.clouds, this.dt, this.sys, this.timezone, this.id, required this.name, this.cod});
  factory WeatherPoint.fromJson(Map<String, dynamic> json) => _$WeatherPointFromJson(json);
}

@JsonSerializable()
class Coord {
  int? lon;
  int? lat;

  Coord({this.lon, this.lat});
  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@JsonSerializable()
class Main {
  double temp;
  @JsonKey(name: "feel_like")
  double? feelsLike;
  @JsonKey(name: "temp_min")
  double? tempMin;
  @JsonKey(name: "temp_max")
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({required this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class Wind {
  double speed;
  int? deg;
  double? gust;

  Wind({required this.speed, this.deg, this.gust});
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@JsonSerializable()
class Clouds {
  int? all;

  Clouds({this.all});
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
