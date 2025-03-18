import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';

abstract class GetWeatherByCityNameRepository {
  Future<Result<WeatherResponseEntity>> getWeatherByCityName(
    String cityName,
  );
}
