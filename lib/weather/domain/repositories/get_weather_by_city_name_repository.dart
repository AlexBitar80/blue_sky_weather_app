import '../../../blue_sky.dart';

abstract class GetWeatherByCityNameRepository {
  Future<Result<WeatherResponseEntity>> getWeatherByCityName(
    String cityName,
  );
}
