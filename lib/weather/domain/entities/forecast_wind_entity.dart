import 'package:equatable/equatable.dart';

class ForecastWindEntity extends Equatable {
  final num speed;
  final num deg;
  final num gust;

  const ForecastWindEntity({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object> get props => [
        speed,
        deg,
        gust,
      ];
}
