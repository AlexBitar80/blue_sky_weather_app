// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class ForecastWindModel extends Equatable {
  final num speed;
  final num deg;
  final num gust;

  const ForecastWindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  ForecastWindModel copyWith({
    num? speed,
    num? deg,
    num? gust,
  }) {
    return ForecastWindModel(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  factory ForecastWindModel.fromMap(Map<String, dynamic> map) {
    return ForecastWindModel(
      speed: map['speed'] as num,
      deg: map['deg'] as num,
      gust: map['gust'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastWindModel.fromJson(String source) =>
      ForecastWindModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        speed,
        deg,
        gust,
      ];
}
