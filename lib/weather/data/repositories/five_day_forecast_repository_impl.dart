import 'package:blue_sky/weather/domain/repositories/five_day_forecast_repository.dart';

import '../../../core/data/feilures/feilure.dart';
import '../../../core/data/results/result.dart';
import '../../domain/entities/forecast_weather_response_entity.dart';
import '../datasources/five_day_forecast_datasource.dart';
import '../mappers/get_forecast_weather_mapper.dart';

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
