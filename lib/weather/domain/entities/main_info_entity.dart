import 'package:equatable/equatable.dart';

class MainInfoEntity extends Equatable {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
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
