// ignore_for_file: deprecated_member_use

import 'package:blue_sky/core/constants/constants.dart';
import 'package:blue_sky/weather/data/datasources/five_day_forecast_datasource.dart';
import 'package:blue_sky/weather/data/models/forecast_weather_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('FiveDayForecastDataSourceImpl', () {
    late FiveDayForecastDataSourceImpl dataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      dataSource = FiveDayForecastDataSourceImpl();
      dataSource.dioClient = mockDio;
    });

    const tLat = -23.0;
    const tLong = -47.0;

    final tForecastResponse = {
      'list': [
        {
          'dt': 1637580000,
          'main': {
            'temp': 25.0,
            'feels_like': 26.0,
            'temp_min': 24.0,
            'temp_max': 27.0,
            'humidity': 60,
          },
          'weather': [
            {
              'main': 'Clouds',
              'description': 'broken clouds',
            }
          ],
          'wind': {
            'speed': 5.0,
            'deg': 180.0,
            'gust': 7.0,
          },
          'dt_txt': '2021-11-22 18:00:00',
        },
        {
          'dt': 1637666400,
          'main': {
            'temp': 20.0,
            'feels_like': 19.0,
            'temp_min': 19.0,
            'temp_max': 22.0,
            'humidity': 80,
          },
          'weather': [
            {
              'main': 'Rain',
              'description': 'light rain',
            }
          ],
          'wind': {
            'speed': 3.0,
            'deg': 270.0,
            'gust': 4.0,
          },
          'dt_txt': '2021-11-23 18:00:00',
        },
      ],
    };

    final tForecastWeatherResponseModels = [
      ForecastWeatherResponseModel.fromMap(tForecastResponse['list']![0]),
      ForecastWeatherResponseModel.fromMap(tForecastResponse['list']![1]),
    ];

    test('should return a list of ForecastWeatherResponseModel when successful',
        () async {
      when(() => mockDio.get(
            Endpoint.urls.getWeaherForecastByLatLong,
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer(
        (_) async => Response(
          data: tForecastResponse,
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      final result = await dataSource.getFiveDayForecastByLatLong(tLat, tLong);

      expect(result, equals(tForecastWeatherResponseModels));
      verify(
        () => mockDio.get(
          Endpoint.urls.getWeaherForecastByLatLong,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
    });

    test('should throw DioError when request fails', () async {
      when(
        () => mockDio.get(
          Endpoint.urls.getWeaherForecastByLatLong,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(DioError(requestOptions: RequestOptions()));

      expect(
        () => dataSource.getFiveDayForecastByLatLong(tLat, tLong),
        throwsA(
          isA<DioError>(),
        ),
      );
      verify(
        () => mockDio.get(
          Endpoint.urls.getWeaherForecastByLatLong,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
    });
  });
}
