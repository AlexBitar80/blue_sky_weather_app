// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'models.dart';

class WeatherResponseModel extends Equatable {
  final List<WeatherModel> weather;
  final MainInfoModel main;
  final WindModel wind;

  final String name;

  const WeatherResponseModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.name,
  });

  WeatherResponseModel copyWith({
    List<WeatherModel>? weather,
    MainInfoModel? main,
    WindModel? wind,
    int? id,
    String? name,
  }) {
    return WeatherResponseModel(
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      name: name ?? this.name,
    );
  }

  factory WeatherResponseModel.fromWeather(Weather weather) {
    return WeatherResponseModel(
      name: weather.areaName ?? '',
      weather: [
        WeatherModel(
          description: weather.weatherDescription ?? '',
          main: weather.weatherMain ?? '',
        )
      ],
      main: MainInfoModel(
        feelsLike: weather.tempFeelsLike?.celsius ?? 0.0,
        humidity: weather.humidity ?? 0,
        temp: weather.temperature?.celsius ?? 0.0,
        tempMax: weather.tempMax?.celsius ?? 0.0,
        tempMin: weather.tempMin?.celsius ?? 0.0,
      ),
      wind: WindModel(
        speed: weather.windSpeed ?? 0.0,
        deg: weather.windDegree ?? 0.0,
        gust: weather.windGust ?? 0.0,
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        weather,
        main,
        wind,
        name,
      ];
}
