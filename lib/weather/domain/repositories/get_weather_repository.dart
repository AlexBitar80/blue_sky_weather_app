import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';

abstract class GetWeatherRepository {
  Future<Result<WeatherResponseEntity>> getWeatherByLatLong(
    double lat,
    double long,
  );
}
