import '../../../blue_sky.dart';

class GetWeatherByCityNameRepositoryImpl
    implements GetWeatherByCityNameRepository {
  final GetWeatherByCityNameDataSource getWeatherByCityNameDataSource;

  GetWeatherByCityNameRepositoryImpl({
    required this.getWeatherByCityNameDataSource,
  });

  @override
  Future<Result<WeatherResponseEntity>> getWeatherByCityName(
    String cityName,
  ) async {
    try {
      final result = await getWeatherByCityNameDataSource.getWeatherByCityName(
        cityName,
      );
      return Result.success(GetWeatherMapper.toModel(result));
    } catch (e) {
      return const Result.failure(
        Failure(message: 'Error fetching data'),
      );
    }
  }
}
