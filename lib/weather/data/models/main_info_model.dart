// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class MainInfoModel extends Equatable {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num humidity;

  const MainInfoModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  MainInfoModel copyWith({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
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
      temp: map['temp'] as num,
      feelsLike: map['feels_like'] as num,
      tempMin: map['temp_min'] as num,
      tempMax: map['temp_max'] as num,
      humidity: map['humidity'] as num,
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
