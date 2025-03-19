import 'package:blue_sky/core/data/feilures/feilure.dart';
import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/data/datasources/five_day_forecast_datasource.dart';
import 'package:blue_sky/weather/data/mappers/get_forecast_weather_mapper.dart';
import 'package:blue_sky/weather/data/models/forecast_weather_model.dart';
import 'package:blue_sky/weather/data/models/forecast_weather_response_model.dart';
import 'package:blue_sky/weather/data/models/forecast_wind_model.dart';
import 'package:blue_sky/weather/data/models/main_info_model.dart';
import 'package:blue_sky/weather/data/repositories/five_day_forecast_repository_impl.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_response_entity.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFiveDayForecastDataSource extends Mock
    implements FiveDayForecastDataSource {
  When mockGetFiveDayForecastByLatLongCall() => when(
        () => getFiveDayForecastByLatLong(any(), any()),
      );

  void mockGetFiveDayForecastByLatLong(
          List<ForecastWeatherResponseModel> data) =>
      mockGetFiveDayForecastByLatLongCall().thenAnswer(
        (_) async => data,
      );

  void mockGetFiveDayForecastByLatLongError(Object error) =>
      mockGetFiveDayForecastByLatLongCall().thenThrow(error);
}

void main() {
  late FiveDayForecastRepositoryImpl sut;
  late MockFiveDayForecastDataSource datasource;
  late double lat;
  late double long;
  late List<ForecastWeatherResponseModel> data;

  setUp(() {
    datasource = MockFiveDayForecastDataSource();
    sut = FiveDayForecastRepositoryImpl(fiveDayForecastDataSource: datasource);

    lat = faker.randomGenerator.decimal();
    long = faker.randomGenerator.decimal();

    data = List.generate(
      5,
      (_) => ForecastWeatherResponseModel(
        main: MainInfoModel(
          feelsLike: faker.randomGenerator.decimal(),
          humidity: faker.randomGenerator.decimal(),
          temp: faker.randomGenerator.decimal(),
          tempMax: faker.randomGenerator.decimal(),
          tempMin: faker.randomGenerator.decimal(),
        ),
        weather: [
          ForecastWeatherModel(
            description: faker.lorem.word(),
            main: faker.lorem.word(),
          ),
        ],
        wind: ForecastWindModel(
          speed: faker.randomGenerator.decimal(),
          deg: faker.randomGenerator.decimal(),
          gust: faker.randomGenerator.decimal(),
        ),
        date: faker.randomGenerator.string(20),
      ),
    );

    datasource.mockGetFiveDayForecastByLatLong(data);
  });

  group('FiveDayForecastRepositoryImpl', () {
    test('Should call fiveDayForecastDataSource with correct values', () async {
      await sut.getFiveDayForecast(lat, long);

      verify(() => datasource.getFiveDayForecastByLatLong(lat, long));
    });

    test('should return a Result.success when datasource is success', () async {
      final expected = Result.success(
        data.map((e) => GetForecastWeatherMapper.toModel(e)).toList(),
      );

      final result = await sut.getFiveDayForecast(lat, long);

      expect(result, expected);
    });

    test(
        'should return a default Result.failure when the datasource returns any Exception',
        () async {
      datasource.mockGetFiveDayForecastByLatLongError(Exception());

      const expected = Result<List<ForecastWeatherResponseEntity>>.failure(
        Failure(message: 'Error fetching data'),
      );

      final result = await sut.getFiveDayForecast(lat, long);

      expect(result, expected);
    });
  });
}
