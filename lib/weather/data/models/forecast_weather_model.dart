import 'dart:convert';

import 'package:equatable/equatable.dart';

class ForecastWeatherModel extends Equatable {
  final String main;
  final String description;

  const ForecastWeatherModel({
    required this.main,
    required this.description,
  });

  ForecastWeatherModel copyWith({
    String? main,
    String? description,
  }) {
    return ForecastWeatherModel(
      main: main ?? this.main,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main,
      'description': description,
    };
  }

  factory ForecastWeatherModel.fromMap(Map<String, dynamic> map) {
    return ForecastWeatherModel(
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastWeatherModel.fromJson(String source) =>
      ForecastWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        main,
        description,
      ];
}
