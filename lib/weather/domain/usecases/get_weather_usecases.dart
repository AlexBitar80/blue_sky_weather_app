import '../../../blue_sky.dart';

abstract class GetWeatherUseCase {
  Future<Result<WeatherResponseEntity>> call(
    double lat,
    double long,
  );
}

class GetWeatherByLatLongUseCaseImpl implements GetWeatherUseCase {
  final GetWeatherRepository getWeatherRepository;

  GetWeatherByLatLongUseCaseImpl({
    required this.getWeatherRepository,
  });

  @override
  Future<Result<WeatherResponseEntity>> call(
    double lat,
    double long,
  ) async {
    return await getWeatherRepository.getWeatherByLatLong(lat, long);
  }
}
