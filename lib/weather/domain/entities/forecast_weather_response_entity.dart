import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

import 'forecast_weather_entity.dart';
import 'forecast_wind_entity.dart';

class ForecastWeatherResponseEntity extends Equatable {
  final ForecastWeatherEntity weather;
  final MainInfoEntity main;
  final ForecastWindEntity wind;
  final String date;

  const ForecastWeatherResponseEntity({
    required this.weather,
    required this.main,
    required this.wind,
    required this.date,
  });

  @override
  List<Object> get props => [
        weather,
        main,
        wind,
        date,
      ];
}
