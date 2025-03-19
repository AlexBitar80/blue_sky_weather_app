import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../blue_sky.dart';

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
        'appid': dotenv.env['OPEN_WEATHER_API_KEY'],
        'units': 'metric',
        'lang': 'pt_br',
      },
    );

    return WeatherResponseModel.fromJson(response.data);
  }
}
