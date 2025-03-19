import '../../../blue_sky.dart';

abstract class GetWeatherRepository {
  Future<Result<WeatherResponseEntity>> getWeatherByLatLong(
    double lat,
    double long,
  );
}
