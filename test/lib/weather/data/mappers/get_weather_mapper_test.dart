import 'package:blue_sky/weather/data/mappers/get_weather_mapper.dart';
import 'package:blue_sky/weather/data/models/models.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetWeatherMapper', () {
    test('should map WeatherResponseEntity to WeatherResponseModel', () {
      final tWeatherResponseEntity = WeatherResponseEntity(
        weather: WeatherEntity(
          main: faker.lorem.word(),
          description: faker.lorem.sentence(),
        ),
        main: MainInfoEntity(
          temp: faker.randomGenerator.decimal(),
          feelsLike: faker.randomGenerator.decimal(),
          tempMin: faker.randomGenerator.decimal(),
          tempMax: faker.randomGenerator.decimal(),
          humidity: faker.randomGenerator.integer(100),
        ),
        name: faker.address.city(),
        wind: WindEntity(
          speed: faker.randomGenerator.decimal(),
          deg: faker.randomGenerator.decimal(),
        ),
      );

      final result = GetWeatherMapper.toEntity(tWeatherResponseEntity);

      expect(
        result.weather.first.main,
        equals(tWeatherResponseEntity.weather.main),
      );
      expect(
        result.weather.first.description,
        equals(tWeatherResponseEntity.weather.description),
      );
      expect(
        result.main.temp,
        equals(tWeatherResponseEntity.main.temp),
      );
      expect(
        result.main.feelsLike,
        equals(tWeatherResponseEntity.main.feelsLike),
      );
      expect(
        result.main.tempMin,
        equals(tWeatherResponseEntity.main.tempMin),
      );
      expect(
        result.main.tempMax,
        equals(tWeatherResponseEntity.main.tempMax),
      );
      expect(
        result.main.humidity,
        equals(tWeatherResponseEntity.main.humidity),
      );
      expect(
        result.name,
        equals(tWeatherResponseEntity.name),
      );
      expect(
        result.wind.speed,
        equals(tWeatherResponseEntity.wind.speed),
      );
      expect(
        result.wind.deg,
        equals(tWeatherResponseEntity.wind.deg),
      );
    });

    test('should map WeatherResponseModel to WeatherResponseEntity', () {
      // Arrange
      final tWeatherResponseModel = WeatherResponseModel(
        weather: [
          WeatherModel(
            main: faker.lorem.word(),
            description: faker.lorem.sentence(),
          ),
        ],
        main: MainInfoModel(
          temp: faker.randomGenerator.decimal(),
          feelsLike: faker.randomGenerator.decimal(),
          tempMin: faker.randomGenerator.decimal(),
          tempMax: faker.randomGenerator.decimal(),
          humidity: faker.randomGenerator.integer(100),
        ),
        name: faker.address.city(),
        wind: WindModel(
          speed: faker.randomGenerator.decimal(),
          deg: faker.randomGenerator.decimal(),
        ),
      );

      final result = GetWeatherMapper.toModel(tWeatherResponseModel);

      expect(
        result.weather.main,
        equals(tWeatherResponseModel.weather.first.main),
      );
      expect(
        result.weather.description,
        equals(tWeatherResponseModel.weather.first.description),
      );
      expect(
        result.main.temp,
        equals(tWeatherResponseModel.main.temp),
      );
      expect(
        result.main.feelsLike,
        equals(tWeatherResponseModel.main.feelsLike),
      );
      expect(
        result.main.tempMin,
        equals(tWeatherResponseModel.main.tempMin),
      );
      expect(
        result.main.tempMax,
        equals(tWeatherResponseModel.main.tempMax),
      );
      expect(
        result.main.humidity,
        equals(tWeatherResponseModel.main.humidity),
      );
      expect(
        result.name,
        equals(tWeatherResponseModel.name),
      );
      expect(
        result.wind.speed,
        equals(tWeatherResponseModel.wind.speed),
      );
      expect(
        result.wind.deg,
        equals(tWeatherResponseModel.wind.deg),
      );
    });
  });
}
