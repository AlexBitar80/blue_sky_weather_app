import 'package:blue_sky/weather/data/models/models.dart';
import 'package:weather/weather.dart';

abstract class FiveDayForecastDataSource {
  Future<List<WeatherResponseModel>> getFiveDayForecastByLatLong(
      double lat, double long);
}

class FiveDayForecastDataSourceImpl implements FiveDayForecastDataSource {
  @override
  Future<List<WeatherResponseModel>> getFiveDayForecastByLatLong(
    double lat,
    double long,
  ) async {
    WeatherFactory weatherFactory = WeatherFactory(
      '97fbe6f5b0106150917b72eb50750204',
      language: Language.PORTUGUESE_BRAZIL,
    );

    try {
      List<Weather> weather = await weatherFactory.fiveDayForecastByLocation(
        lat,
        long,
      );
      return weather.map((e) => WeatherResponseModel.fromWeather(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
