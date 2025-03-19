import '../../../blue_sky.dart';

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
