import '../../../blue_sky.dart';

abstract class FiveDayForecastRepository {
  Future<Result<List<ForecastWeatherResponseEntity>>> getFiveDayForecast(
    double lat,
    double long,
  );
}
