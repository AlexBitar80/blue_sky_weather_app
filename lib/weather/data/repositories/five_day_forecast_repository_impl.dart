import '../../../blue_sky.dart';

class FiveDayForecastRepositoryImpl implements FiveDayForecastRepository {
  final FiveDayForecastDataSource fiveDayForecastDataSource;

  FiveDayForecastRepositoryImpl({
    required this.fiveDayForecastDataSource,
  });

  @override
  Future<Result<List<ForecastWeatherResponseEntity>>> getFiveDayForecast(
    double lat,
    double long,
  ) async {
    try {
      final result = await fiveDayForecastDataSource
          .getFiveDayForecastByLatLong(lat, long);
      return Result.success(
        result.map((e) => GetForecastWeatherMapper.toModel(e)).toList(),
      );
    } catch (e) {
      return const Result.failure(Failure(message: 'Error fetching data'));
    }
  }
}
