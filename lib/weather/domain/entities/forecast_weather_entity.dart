import 'package:equatable/equatable.dart';

class ForecastWeatherEntity extends Equatable {
  final String main;
  final String description;

  const ForecastWeatherEntity({
    required this.main,
    required this.description,
  });

  @override
  List<Object> get props => [
        main,
        description,
      ];
}
