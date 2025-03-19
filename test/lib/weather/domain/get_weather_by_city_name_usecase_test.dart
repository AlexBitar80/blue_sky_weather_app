import 'package:blue_sky/core/data/feilures/feilure.dart';
import 'package:blue_sky/core/data/results/result.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/repositories/get_weather_by_city_name_repository.dart';
import 'package:blue_sky/weather/domain/usecases/get_weather_by_city_name_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWeatherByCityNameRepository extends Mock
    implements GetWeatherByCityNameRepository {
  When mockGetFiveDayForecastCall() => when(
        () => getWeatherByCityName(any()),
      );

  void mockGetFiveDayForecast(Result<WeatherResponseEntity> data) =>
      mockGetFiveDayForecastCall().thenAnswer((_) async => data);

  void mockGetFiveDayForecastError(Result<WeatherResponseEntity> error) =>
      mockGetFiveDayForecastCall().thenAnswer((_) async => error);
}

void main() {
  late GetWeatherByCityNameUseCaseImpl sut;
  late MockGetWeatherByCityNameRepository repository;

  setUp(() {
    repository = MockGetWeatherByCityNameRepository();
    sut = GetWeatherByCityNameUseCaseImpl(
      getWeatherRepository: repository,
    );
  });

  group('GetWeatherByCityNameUseCase', () {
    const cityName = 'London';
    const weatherResponse = WeatherResponseEntity(
      name: 'London',
      main: MainInfoEntity(
        temp: 10.0,
        feelsLike: 8.0,
        tempMin: 5.0,
        tempMax: 12.0,
        humidity: 70,
      ),
      weather: WeatherEntity(
        main: 'Clouds',
        description: 'broken clouds',
      ),
      wind: WindEntity(
        speed: 5.0,
        deg: 180.0,
      ),
    );

    test('should get weather by city name from the repository', () async {
      when(() => repository.getWeatherByCityName(cityName))
          .thenAnswer((_) async => const Result.success(weatherResponse));

      final result = await sut.call(cityName);

      expect(result, const Result.success(weatherResponse));
      verify(() => repository.getWeatherByCityName(cityName)).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return a failure if the repository returns a failure',
        () async {
      repository.mockGetFiveDayForecastError(
        const Result.failure(
          Failure(message: 'Test Failure'),
        ),
      );

      const expected = Result<WeatherResponseEntity>.failure(
        Failure(message: 'Test Failure'),
      );

      final result = await sut.call(cityName);

      expect(result, expected);
    });
  });
}
