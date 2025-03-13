import 'package:blue_sky/weather/data/models/models.dart';

abstract class GetWeatherDataSource {
  Future<WeatherResponseModel> getWeatherByLatLong(double lat, double long);
}

class GetWeatherDataSourceImpl implements GetWeatherDataSource {
  @override
  Future<WeatherResponseModel> getWeatherByLatLong(double lat, double long) {
    // - TODO: Implementar chamada para a API de clima
    throw UnimplementedError();
  }
}
