import 'package:equatable/equatable.dart';

class MainInfoEntity extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final num humidity;

  const MainInfoEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  @override
  List<Object> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        humidity,
      ];
}
