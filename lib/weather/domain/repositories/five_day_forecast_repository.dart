import '../../../core/data/results/result.dart';
import '../entities/forecast_weather_response_entity.dart';

abstract class FiveDayForecastRepository {
  Future<Result<List<ForecastWeatherResponseEntity>>> getFiveDayForecast(
    double lat,
    double long,
  );
}
