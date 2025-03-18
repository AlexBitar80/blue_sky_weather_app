import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/data/datasources/get_weather_by_city_name_datasource.dart';
import 'package:blue_sky/weather/data/mappers/mappers.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';

import '../../../core/data/feilures/feilure.dart';
import '../../domain/repositories/get_weather_by_city_name_repository.dart';

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
