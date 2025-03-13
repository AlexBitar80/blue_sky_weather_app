import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/repositories/get_weather_repository.dart';

abstract class GetWeatherUseCase {
  Future<Result<WeatherResponseEntity>> call(
    double lat,
    double long,
  );
}

class GetWeatherByLatLongUseCaseImpl implements GetWeatherUseCase {
  final GetWeatherRepository getWeatherRepository;

  GetWeatherByLatLongUseCaseImpl({
    required this.getWeatherRepository,
  });

  @override
  Future<Result<WeatherResponseEntity>> call(
    double lat,
    double long,
  ) async {
    return getWeatherRepository.getWeatherByLatLong(lat, long);
  }
}
