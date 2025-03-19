// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../blue_sky.dart';

abstract class GetWeatherByCityNameDataSource {
  Future<WeatherResponseModel> getWeatherByCityName(String cityName);
}

class GetWeatherByCityNameDataSourceImpl
    implements GetWeatherByCityNameDataSource {
  Dio dioClient = Dio();

  @override
  Future<WeatherResponseModel> getWeatherByCityName(String cityName) async {
    try {
      final response = await dioClient.get(
        Endpoint.urls.getWeatherByCityName,
        queryParameters: {
          'q': cityName,
          'appid': dotenv.env['OPEN_WEATHER_API_KEY'],
          'units': 'metric',
          'lang': 'pt_br',
        },
      );

      return WeatherResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('API Response: ${e.response?.data}');
        print('Status Code: ${e.response?.statusCode}');
      } else {
        print('Dio Error: ${e.message}');
      }
      rethrow;
    } catch (e) {
      print('Unexpected Error: $e');
      rethrow;
    }
  }
}
