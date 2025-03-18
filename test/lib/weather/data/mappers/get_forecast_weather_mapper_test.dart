import 'package:blue_sky/weather/data/mappers/get_forecast_weather_mapper.dart';
import 'package:blue_sky/weather/data/models/forecast_weather_model.dart';
import 'package:blue_sky/weather/data/models/forecast_weather_response_model.dart';
import 'package:blue_sky/weather/data/models/forecast_wind_model.dart';
import 'package:blue_sky/weather/data/models/models.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_response_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_wind_entity.dart';
import 'package:blue_sky/weather/domain/entities/main_info_entity.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetForecastWeatherMapper', () {
    final tForecastWeatherResponseEntity = ForecastWeatherResponseEntity(
      weather: const ForecastWeatherEntity(
        main: 'Clouds',
        description: 'broken clouds',
      ),
      main: const MainInfoEntity(
        temp: 20.0,
        feelsLike: 19.0,
        tempMin: 18.0,
        tempMax: 22.0,
        humidity: 80,
      ),
      wind: const ForecastWindEntity(
        speed: 5.0,
        deg: 180.0,
        gust: 7.0,
      ),
      date: faker.date.toString(),
    );

    final tForecastWeatherResponseModel = ForecastWeatherResponseModel(
      weather: const [
        ForecastWeatherModel(
          main: 'Clouds',
          description: 'broken clouds',
        ),
      ],
      main: const MainInfoModel(
        temp: 20.0,
        feelsLike: 19.0,
        tempMin: 18.0,
        tempMax: 22.0,
        humidity: 80,
      ),
      wind: const ForecastWindModel(
        speed: 5.0,
        deg: 180.0,
        gust: 7.0,
      ),
      date: faker.date.toString(),
    );

    test(
        'should map ForecastWeatherResponseEntity to ForecastWeatherResponseModel',
        () {
      final result =
          GetForecastWeatherMapper.toEntity(tForecastWeatherResponseEntity);
      expect(result, equals(tForecastWeatherResponseModel));
    });

    test(
        'should map ForecastWeatherResponseModel to ForecastWeatherResponseEntity',
        () {
      final result =
          GetForecastWeatherMapper.toModel(tForecastWeatherResponseModel);
      expect(result, equals(tForecastWeatherResponseEntity));
    });
  });
}
