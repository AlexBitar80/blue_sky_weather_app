// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
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
    String? name,
  }) {
    return WeatherResponseModel(
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      name: name ?? this.name,
    );
  }

  factory WeatherResponseModel.fromMap(Map<String, dynamic> map) {
    return WeatherResponseModel(
      weather: List<WeatherModel>.from(
        map['weather']?.map((x) => WeatherModel.fromMap(x)),
      ),
      main: MainInfoModel.fromMap(map['main'] as Map<String, dynamic>),
      wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
      name: map['name'] as String,
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
      'name': name,
    };
  }

  factory WeatherResponseModel.fromJson(Map<String, dynamic> source) =>
      WeatherResponseModel.fromMap(source);

  String toJson() => json.encode(toMap());

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
