import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/repositories/five_day_forecast_repository.dart';

import '../../../core/data/results/result.dart';
import '../datasources/five_day_forecast_datasource.dart';
import '../mappers/get_weather_mapper.dart';

class FiveDayForecastRepositoryImpl implements FiveDayForecastRepository {
  final FiveDayForecastDataSource fiveDayForecastDataSource;

  FiveDayForecastRepositoryImpl({
    required this.fiveDayForecastDataSource,
  });

  @override
  Future<Result<List<WeatherResponseEntity>>> getFiveDayForecast(
    double lat,
    double long,
  ) async {
    try {
      final result = await fiveDayForecastDataSource
          .getFiveDayForecastByLatLong(lat, long);
      return Result.success(
        result.map((e) => GetWeatherMapper.toModel(e)).toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
