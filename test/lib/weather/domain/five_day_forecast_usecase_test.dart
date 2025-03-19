import 'package:blue_sky/core/data/feilures/feilure.dart';
import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_response_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_wind_entity.dart';
import 'package:blue_sky/weather/domain/repositories/five_day_forecast_repository.dart';
import 'package:blue_sky/weather/domain/usecases/five_day_forecast_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFiveDayForecastRepository extends Mock
    implements FiveDayForecastRepository {
  When mockGetFiveDayForecastCall() => when(
        () => getFiveDayForecast(any(), any()),
      );

  void mockGetFiveDayForecast(
          Result<List<ForecastWeatherResponseEntity>> data) =>
      mockGetFiveDayForecastCall().thenAnswer((_) async => data);

  void mockGetFiveDayForecastError(
          Result<List<ForecastWeatherResponseEntity>> error) =>
      mockGetFiveDayForecastCall().thenAnswer((_) async => error);
}

void main() {
  late FiveDayForecastUseCaseImpl sut;
  late MockFiveDayForecastRepository repository;
  late Result<List<ForecastWeatherResponseEntity>> data;
  late double lat;
  late double long;

  setUp(() {
    repository = MockFiveDayForecastRepository();
    sut = FiveDayForecastUseCaseImpl(fiveDayForecastRepository: repository);

    lat = faker.randomGenerator.decimal();
    long = faker.randomGenerator.decimal();

    data = Result.success(
      List.generate(
        5,
        (_) => ForecastWeatherResponseEntity(
          main: MainInfoEntity(
            feelsLike: faker.randomGenerator.decimal(),
            humidity: faker.randomGenerator.decimal(),
            temp: faker.randomGenerator.decimal(),
            tempMax: faker.randomGenerator.decimal(),
            tempMin: faker.randomGenerator.decimal(),
          ),
          weather: ForecastWeatherEntity(
            description: faker.lorem.word(),
            main: faker.lorem.word(),
          ),
          wind: ForecastWindEntity(
            speed: faker.randomGenerator.decimal(),
            deg: faker.randomGenerator.decimal(),
            gust: faker.randomGenerator.decimal(),
          ),
          date: faker.randomGenerator.string(20),
        ),
      ),
    );

    repository.mockGetFiveDayForecast(data);
  });

  group('FiveDayForecastUseCaseImpl', () {
    test('Should call getFiveDayForecast with correct values', () async {
      await sut.call(lat, long);

      verify(() => repository.getFiveDayForecast(lat, long));
    });

    test('should return a Result.success when repository is success', () async {
      final result = await sut.call(lat, long);

      expect(result.isSuccess, isTrue);
      expect(result.data, isA<List<ForecastWeatherResponseEntity>>());
      expect(result.data.isNotEmpty, isTrue);
    });

    test('should return a Result.failure when the repository returns an error',
        () async {
      repository.mockGetFiveDayForecastError(
        const Result.failure(
          Failure(message: 'Test Failure'),
        ),
      );

      const expected = Result<List<ForecastWeatherResponseEntity>>.failure(
        Failure(message: 'Test Failure'),
      );

      final result = await sut.call(lat, long);

      expect(result, expected);
    });
  });
}
