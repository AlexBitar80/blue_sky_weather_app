// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'models.dart';

class WeatherResponseModel extends Equatable {
  final List<WeatherModel> weather;
  final MainInfoModel main;
  final WindModel wind;
  final int id;
  final String name;
  final int timezone;

  const WeatherResponseModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.id,
    required this.name,
    required this.timezone,
  });

  WeatherResponseModel copyWith({
    List<WeatherModel>? weather,
    MainInfoModel? main,
    WindModel? wind,
    int? id,
    String? name,
    int? timezone,
  }) {
    return WeatherResponseModel(
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      id: id ?? this.id,
      name: name ?? this.name,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weather': weather.toList(),
      'main': main.toMap(),
      'wind': wind.toMap(),
      'id': id,
      'name': name,
      'timezone': timezone,
    };
  }

  factory WeatherResponseModel.fromMap(Map<String, dynamic> map) {
    return WeatherResponseModel(
      weather: (map['weather'] as List<dynamic>)
          .map((item) => WeatherModel.fromMap(item as Map<String, dynamic>))
          .toList(),
      main: MainInfoModel.fromMap(map['main'] as Map<String, dynamic>),
      wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
      id: map['id'] as int,
      name: map['name'] as String,
      timezone: map['timezone'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherResponseModel.fromJson(String source) =>
      WeatherResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        weather,
        main,
        wind,
        id,
        name,
        timezone,
      ];
}
