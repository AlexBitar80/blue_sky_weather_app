import 'package:blue_sky/core/constants/url.dart';
import 'package:dio/dio.dart';

import '../models/forecast_weather_response_model.dart';

abstract class FiveDayForecastDataSource {
  Future<List<ForecastWeatherResponseModel>> getFiveDayForecastByLatLong(
    double lat,
    double long,
  );
}

class FiveDayForecastDataSourceImpl implements FiveDayForecastDataSource {
  Dio dioClient = Dio();

  @override
  Future<List<ForecastWeatherResponseModel>> getFiveDayForecastByLatLong(
    double lat,
    double long,
  ) async {
    final url = Endpoint.urls.getWeaherForecastByLatLong;

    final response = await dioClient.get(
      url,
      queryParameters: {
        'lat': lat,
        'lon': long,
        'appid': '97fbe6f5b0106150917b72eb50750204',
        'units': 'metric',
        'lang': 'pt_br',
      },
    );

    final list = response.data['list'] as List;

    return list.map((e) => ForecastWeatherResponseModel.fromMap(e)).toList();
  }
}
