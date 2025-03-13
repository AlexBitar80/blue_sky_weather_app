import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/data/datasources/get_weather_datasource.dart';
import 'package:blue_sky/weather/data/mappers/mappers.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';

import '../../../core/data/feilures/feilure.dart';
import '../../domain/repositories/get_weather_repository.dart';

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
      return const Result.failure(Failure());
    }
  }
}
