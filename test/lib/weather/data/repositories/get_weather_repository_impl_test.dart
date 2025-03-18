import 'package:blue_sky/core/data/feilures/feilure.dart';
import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/data/datasources/datasources.dart';
import 'package:blue_sky/weather/data/mappers/mappers.dart';
import 'package:blue_sky/weather/data/models/models.dart';
import 'package:blue_sky/weather/data/repositories/get_weather_repository_impl.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWeatherDataSource extends Mock
    implements GetWeatherDataSourceImpl {
  When mockGetFiveDayForecastByLatLongCall() => when(
        () => getWeatherByLatLong(any(), any()),
      );

  void mockGetFiveDayForecastByLatLong(WeatherResponseModel data) =>
      mockGetFiveDayForecastByLatLongCall().thenAnswer(
        (_) async => data,
      );

  void mockGetFiveDayForecastByLatLongError(Object error) =>
      mockGetFiveDayForecastByLatLongCall().thenThrow(error);
}

void main() {
  late GetWeatherRepositoryImpl sut;
  late MockGetWeatherDataSource datasource;
  late double lat;
  late double long;
  late WeatherResponseModel data;

  setUp(() {
    datasource = MockGetWeatherDataSource();
    sut = GetWeatherRepositoryImpl(getWeatherDataSource: datasource);

    lat = faker.randomGenerator.decimal();
    long = faker.randomGenerator.decimal();

    data = WeatherResponseModel(
      main: MainInfoModel(
        feelsLike: faker.randomGenerator.decimal(),
        humidity: faker.randomGenerator.decimal(),
        temp: faker.randomGenerator.decimal(),
        tempMax: faker.randomGenerator.decimal(),
        tempMin: faker.randomGenerator.decimal(),
      ),
      name: faker.lorem.word(),
      weather: [
        WeatherModel(
          description: faker.lorem.word(),
          main: faker.lorem.word(),
        ),
      ],
      wind: WindModel(
        speed: faker.randomGenerator.decimal(),
        deg: faker.randomGenerator.decimal(),
      ),
    );

    datasource.mockGetFiveDayForecastByLatLong(data);
  });

  group('GetWeatherRepositoryImpl', () {
    test('Should call getWeatherDataSource with correct values', () async {
      await sut.getWeatherByLatLong(lat, long);

      verify(() => datasource.getWeatherByLatLong(lat, long));
    });

    test('should return a Result.success when datasource is success', () async {
      final expected = Result.success(GetWeatherMapper.toModel(data));

      final result = await sut.getWeatherByLatLong(lat, long);

      expect(result, expected);
    });

    test(
        'should return a default Result.failure when the datasource returns any Exception',
        () async {
      datasource.mockGetFiveDayForecastByLatLongError(Exception());

      const expected = Result<WeatherResponseEntity>.failure(
        Failure(message: 'Error fetching data'),
      );

      final result = await sut.getWeatherByLatLong(lat, long);

      expect(result, expected);
    });
  });
}
