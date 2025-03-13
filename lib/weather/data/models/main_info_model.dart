// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class MainInfoModel extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;

  const MainInfoModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  MainInfoModel copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
  }) {
    return MainInfoModel(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      humidity: humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'humidity': humidity,
    };
  }

  factory MainInfoModel.fromMap(Map<String, dynamic> map) {
    return MainInfoModel(
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      humidity: map['humidity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainInfoModel.fromJson(String source) =>
      MainInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        humidity,
      ];
}
