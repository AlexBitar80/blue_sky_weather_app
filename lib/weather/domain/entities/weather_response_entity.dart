import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class WeatherResponseEntity extends Equatable {
  final int id;
  final String name;
  final WeatherEntity weather;
  final MainInfoEntity main;
  final WindEntity wind;
  final int timezone;

  const WeatherResponseEntity({
    required this.weather,
    required this.main,
    required this.wind,
    required this.id,
    required this.name,
    required this.timezone,
  });

  @override
  List<Object> get props => [
        weather,
        main,
        wind,
        id,
        name,
        timezone,
      ];
}
