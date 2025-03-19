// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../../../blue_sky.dart';

class ForecastWeatherResponseModel extends Equatable {
  final List<ForecastWeatherModel> weather;
  final MainInfoModel main;
  final ForecastWindModel wind;
  final String date;

  const ForecastWeatherResponseModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.date,
  });

  ForecastWeatherResponseModel copyWith({
    List<ForecastWeatherModel>? weather,
    MainInfoModel? main,
    ForecastWindModel? wind,
    String? date,
  }) {
    return ForecastWeatherResponseModel(
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      date: date ?? this.date,
    );
  }

  factory ForecastWeatherResponseModel.fromMap(Map<String, dynamic> map) {
    return ForecastWeatherResponseModel(
      weather: List<ForecastWeatherModel>.from(
        map['weather']?.map((x) => ForecastWeatherModel.fromMap(x)),
      ),
      main: MainInfoModel.fromMap(map['main'] as Map<String, dynamic>),
      wind: ForecastWindModel.fromMap(map['wind'] as Map<String, dynamic>),
      date: map['dt_txt'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weather': weather
          .map(
            (x) => x.toMap(),
          )
          .toList(),
      'main': main.toMap(),
      'wind': wind.toMap(),
      'dt_txt': date,
    };
  }

  factory ForecastWeatherResponseModel.fromJson(Map<String, dynamic> source) =>
      ForecastWeatherResponseModel.fromMap(source);

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        weather,
        main,
        wind,
        date,
      ];
}
