// ignore_for_file: deprecated_member_use

import 'package:blue_sky/core/constants/url.dart';
import 'package:blue_sky/weather/data/datasources/get_weather_by_city_name_datasource.dart';
import 'package:blue_sky/weather/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('GetWeatherByCityNameDataSourceImpl', () {
    late GetWeatherByCityNameDataSourceImpl dataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      dataSource = GetWeatherByCityNameDataSourceImpl();
      dataSource.dioClient = mockDio;
    });

    const cityName = 'Test City';

    final weatherResponse = {
      'weather': [
        {
          'main': 'Clouds',
          'description': 'broken clouds',
        }
      ],
      'main': {
        'temp': 20.0,
        'feels_like': 19.0,
        'temp_min': 18.0,
        'temp_max': 22.0,
        'humidity': 80,
      },
      'wind': {'speed': 5.0, 'deg': 180.0},
      'name': 'Test City',
    };

    final tWeatherResponseModel =
        WeatherResponseModel.fromJson(weatherResponse);

    test('should return WeatherResponseModel when successful', () async {
      when(
        () => mockDio.get(
          Endpoint.urls.getWeatherByCityName,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: weatherResponse,
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      final result = await dataSource.getWeatherByCityName(cityName);

      expect(result, equals(tWeatherResponseModel));
      verify(
        () => mockDio.get(
          Endpoint.urls.getWeatherByCityName,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
    });

    test('should throw DioError when request fails', () async {
      when(
        () => mockDio.get(
          Endpoint.urls.getWeatherByCityName,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioError(
          requestOptions: RequestOptions(),
        ),
      );

      expect(
        () => dataSource.getWeatherByCityName(cityName),
        throwsA(
          isA<DioError>(),
        ),
      );
      verify(
        () => mockDio.get(
          Endpoint.urls.getWeatherByCityName,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
    });
  });
}
