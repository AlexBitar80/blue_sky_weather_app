import 'package:blue_sky/weather/domain/entities/entities.dart';

import '../../../core/data/results/result.dart';

abstract class FiveDayForecastRepository {
  Future<Result<List<WeatherResponseEntity>>> getFiveDayForecast(
      double lat, double long);
}
