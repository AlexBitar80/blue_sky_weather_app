import 'package:blue_sky/core/data/feilures/feilure.dart';
import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/repositories/get_weather_repository.dart';
import 'package:blue_sky/weather/domain/usecases/get_weather_usecases.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWeatherRepository extends Mock implements GetWeatherRepository {
  When mockGetFiveDayForecastCall() => when(
        () => getWeatherByLatLong(any(), any()),
      );

  void mockGetFiveDayForecast(Result<WeatherResponseEntity> data) =>
      mockGetFiveDayForecastCall().thenAnswer((_) async => data);

  void mockGetFiveDayForecastError(Result<WeatherResponseEntity> error) =>
      mockGetFiveDayForecastCall().thenAnswer((_) async => error);
}

void main() {
  late GetWeatherByLatLongUseCaseImpl sut;
  late MockGetWeatherRepository repository;
  late Result<WeatherResponseEntity> data;

  late double lat;
  late double long;

  setUp(() {
    repository = MockGetWeatherRepository();
    sut = GetWeatherByLatLongUseCaseImpl(getWeatherRepository: repository);

    lat = faker.randomGenerator.decimal();
    long = faker.randomGenerator.decimal();

    data = Result.success(
      WeatherResponseEntity(
        main: MainInfoEntity(
          feelsLike: faker.randomGenerator.decimal(),
          humidity: faker.randomGenerator.decimal(),
          temp: faker.randomGenerator.decimal(),
          tempMax: faker.randomGenerator.decimal(),
          tempMin: faker.randomGenerator.decimal(),
        ),
        name: faker.lorem.word(),
        weather: WeatherEntity(
          description: faker.lorem.word(),
          main: faker.lorem.word(),
        ),
        wind: WindEntity(
          speed: faker.randomGenerator.decimal(),
          deg: faker.randomGenerator.integer(100),
        ),
      ),
    );

    repository.mockGetFiveDayForecast(data);
  });

  group('GetWeatherByLatLongUseCaseImpl', () {
    test('Should call getWeatherByLatLong with correct values', () async {
      await sut.call(lat, long);

      verify(() => repository.getWeatherByLatLong(lat, long));
    });

    test('should return a Result.success when repository is success', () async {
      final result = await sut.call(lat, long);

      expect(result.isSuccess, isTrue);
      expect(result.data, isA<WeatherResponseEntity>());
    });

    test('should return a Result.failure when the repository returns an error',
        () async {
      repository.mockGetFiveDayForecastError(
        const Result.failure(
          Failure(message: 'Test Failure'),
        ),
      );

      const expected = Result<WeatherResponseEntity>.failure(
        Failure(message: 'Test Failure'),
      );

      final result = await sut.call(lat, long);

      expect(result, expected);
    });
  });
}
