// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class WindModel extends Equatable {
  final double speed;
  final int deg;

  const WindModel({
    required this.speed,
    required this.deg,
  });

  WindModel copyWith({
    double? speed,
    int? deg,
  }) {
    return WindModel(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
    };
  }

  factory WindModel.fromMap(Map<String, dynamic> map) {
    return WindModel(
      speed: map['speed'] as double,
      deg: map['deg'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        speed,
        deg,
      ];
}
