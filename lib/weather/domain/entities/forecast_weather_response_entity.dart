import 'package:equatable/equatable.dart';
import '../../../blue_sky.dart';

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
