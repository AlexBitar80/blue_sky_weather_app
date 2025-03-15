import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/repositories/five_day_forecast_repository.dart';

import '../../../core/data/results/result.dart';

abstract class FiveDayForecastUseCase {
  Future<Result<List<WeatherResponseEntity>>> call(double lat, double long);
}

class FiveDayForecastUseCaseImpl implements FiveDayForecastUseCase {
  final FiveDayForecastRepository fiveDayForecastRepository;

  FiveDayForecastUseCaseImpl({
    required this.fiveDayForecastRepository,
  });

  @override
  Future<Result<List<WeatherResponseEntity>>> call(
    double lat,
    double long,
  ) async {
    return fiveDayForecastRepository.getFiveDayForecast(lat, long);
  }
}
