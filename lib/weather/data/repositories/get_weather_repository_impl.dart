import '../../../blue_sky.dart';

class GetWeatherRepositoryImpl implements GetWeatherRepository {
  final GetWeatherDataSource getWeatherDataSource;

  GetWeatherRepositoryImpl({
    required this.getWeatherDataSource,
  });

  @override
  Future<Result<WeatherResponseEntity>> getWeatherByLatLong(
    double lat,
    double long,
  ) async {
    try {
      final result = await getWeatherDataSource.getWeatherByLatLong(lat, long);
      return Result.success(GetWeatherMapper.toModel(result));
    } catch (e) {
      return const Result.failure(
        Failure(message: 'Error fetching data'),
      );
    }
  }
}
