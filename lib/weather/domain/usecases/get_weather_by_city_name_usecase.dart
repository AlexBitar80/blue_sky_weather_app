import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/repositories/get_weather_by_city_name_repository.dart';

abstract class GetWeatherByCityNameUseCase {
  Future<Result<WeatherResponseEntity>> call(
    String cityName,
  );
}

class GetWeatherByCityNameUseCaseImpl implements GetWeatherByCityNameUseCase {
  final GetWeatherByCityNameRepository getWeatherRepository;

  GetWeatherByCityNameUseCaseImpl({
    required this.getWeatherRepository,
  });

  @override
  Future<Result<WeatherResponseEntity>> call(String cityName) async {
    return await getWeatherRepository.getWeatherByCityName(cityName);
  }
}
