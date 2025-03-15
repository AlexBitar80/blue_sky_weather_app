import 'package:blue_sky/weather/data/models/models.dart';
import 'package:weather/weather.dart';

abstract class GetWeatherDataSource {
  Future<WeatherResponseModel> getWeatherByLatLong(double lat, double long);
}

class GetWeatherDataSourceImpl implements GetWeatherDataSource {
  @override
  Future<WeatherResponseModel> getWeatherByLatLong(
    double lat,
    double long,
  ) async {
    WeatherFactory weatherFactory = WeatherFactory(
      '97fbe6f5b0106150917b72eb50750204',
    );

    try {
      Weather weather = await weatherFactory.currentWeatherByLocation(
        lat,
        long,
      );
      return WeatherResponseModel.fromWeather(weather);
    } catch (e) {
      throw Exception(e);
    }
  }
}
