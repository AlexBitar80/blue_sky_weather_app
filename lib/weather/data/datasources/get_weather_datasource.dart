import 'package:blue_sky/core/constants/url.dart';
import 'package:blue_sky/weather/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class GetWeatherDataSource {
  Future<WeatherResponseModel> getWeatherByLatLong(double lat, double long);
}

class GetWeatherDataSourceImpl implements GetWeatherDataSource {
  Dio dioClient = Dio();

  @override
  Future<WeatherResponseModel> getWeatherByLatLong(
    double lat,
    double long,
  ) async {
    final response = await dioClient.get(
      Endpoint.urls.getWeatherByLatLong,
      queryParameters: {
        'lat': lat,
        'lon': long,
        'appid': '97fbe6f5b0106150917b72eb50750204',
        'units': 'metric',
        'lang': 'pt_br',
      },
    );

    return WeatherResponseModel.fromJson(response.data);
  }
}
