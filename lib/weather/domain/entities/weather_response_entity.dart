import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class WeatherResponseEntity extends Equatable {
  final String name;
  final WeatherEntity weather;
  final MainInfoEntity main;
  final WindEntity wind;
  final DateTime date;

  const WeatherResponseEntity({
    required this.weather,
    required this.main,
    required this.wind,
    required this.name,
    required this.date,
  });

  @override
  List<Object> get props => [
        weather,
        main,
        wind,
        name,
        date,
      ];
}
