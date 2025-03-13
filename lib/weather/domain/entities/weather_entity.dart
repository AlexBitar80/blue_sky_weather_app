import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String main;
  final String description;

  const WeatherEntity({
    required this.main,
    required this.description,
  });

  @override
  List<Object> get props => [main, description];
}
