import '../../../blue_sky.dart';

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
