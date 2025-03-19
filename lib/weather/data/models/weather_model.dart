import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String main;
  final String description;

  const WeatherModel({
    required this.main,
    required this.description,
  });

  WeatherModel copyWith({
    String? main,
    String? description,
  }) {
    return WeatherModel(
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

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        main,
        description,
      ];
}
