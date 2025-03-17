import 'package:blue_sky/weather/domain/repositories/five_day_forecast_repository.dart';

import '../../../core/data/results/result.dart';
import '../entities/forecast_weather_response_entity.dart';

abstract class FiveDayForecastUseCase {
  Future<Result<List<ForecastWeatherResponseEntity>>> call(
    double lat,
    double long,
  );
}

class FiveDayForecastUseCaseImpl implements FiveDayForecastUseCase {
  final FiveDayForecastRepository fiveDayForecastRepository;

  FiveDayForecastUseCaseImpl({
    required this.fiveDayForecastRepository,
  });

  @override
  Future<Result<List<ForecastWeatherResponseEntity>>> call(
    double lat,
    double long,
  ) async {
    return await fiveDayForecastRepository.getFiveDayForecast(lat, long);
  }
}
