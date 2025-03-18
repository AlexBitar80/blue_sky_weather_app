import 'package:blue_sky/core/data/feilures/feilures.dart';
import 'package:blue_sky/core/data/results/results.dart';
import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_response_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_wind_entity.dart';
import 'package:blue_sky/weather/domain/usecases/five_day_forecast_usecase.dart';
import 'package:blue_sky/weather/domain/usecases/get_weather_by_city_name_usecase.dart';
import 'package:blue_sky/weather/domain/usecases/usecases.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {}

class MockFiveDayForecastUseCase extends Mock
    implements FiveDayForecastUseCase {}

class MockWeatherByCityNameUseCase extends Mock
    implements GetWeatherByCityNameUseCase {}

class TestFailure extends Failure {
  @override
  List<Object?> get props => [];
}

void main() {
  group('WeatherProvider', () {
    late WeatherProvider provider;
    late MockGetWeatherUseCase mockGetWeatherUseCase;
    late MockFiveDayForecastUseCase mockFiveDayForecastUseCase;
    late MockWeatherByCityNameUseCase mockWeatherByCityNameUseCase;
    const tLat = -23.0;
    const tLong = -47.0;

    setUp(() {
      mockGetWeatherUseCase = MockGetWeatherUseCase();
      mockFiveDayForecastUseCase = MockFiveDayForecastUseCase();
      mockWeatherByCityNameUseCase = MockWeatherByCityNameUseCase();
      provider = WeatherProvider(
        getWeatherUseCase: mockGetWeatherUseCase,
        fiveDayForecastUseCase: mockFiveDayForecastUseCase,
        getWeatherByCityNameUseCase: mockWeatherByCityNameUseCase,
      );
    });

    test('initial values are correct', () {
      expect(provider.weatherData, null);
      expect(provider.fiveDayForecast, null);
      expect(provider.isLoading, false);
      expect(provider.errorMessage, null);
    });

    group('getWeather', () {
      test('should set isLoading to true and errorMessage to null', () async {
        when(() => mockGetWeatherUseCase(any(), any()))
            .thenAnswer((_) async => const Result.success(WeatherResponseEntity(
                  weather:
                      WeatherEntity(main: 'Clear', description: 'clear sky'),
                  main: MainInfoEntity(
                      temp: 20.0,
                      feelsLike: 20.0,
                      tempMin: 20.0,
                      tempMax: 20.0,
                      humidity: 50),
                  name: 'Test',
                  wind: WindEntity(speed: 10, deg: 10),
                )));

        await provider.getWeather(tLat, tLong);

        expect(provider.isLoading, false);
        expect(provider.errorMessage, null);
      });

      test('should set weatherData on successful call', () async {
        const weatherData = WeatherResponseEntity(
          weather: WeatherEntity(main: 'Clear', description: 'clear sky'),
          main: MainInfoEntity(
              temp: 20.0,
              feelsLike: 20.0,
              tempMin: 20.0,
              tempMax: 20.0,
              humidity: 50),
          name: 'Test',
          wind: WindEntity(speed: 10, deg: 10),
        );
        when(() => mockGetWeatherUseCase(any(), any()))
            .thenAnswer((_) async => const Result.success(weatherData));

        await provider.getWeather(tLat, tLong);

        expect(provider.weatherData, weatherData);
      });

      test('should set errorMessage on failure call', () async {
        when(() => mockGetWeatherUseCase(any(), any()))
            .thenAnswer((_) async => Result.failure(TestFailure()));

        await provider.getWeather(tLat, tLong);

        expect(provider.errorMessage, 'Erro ao buscar clima.');
      });
    });

    group('getFiveDayForecast', () {
      test('should set isLoading to true and errorMessage to null', () async {
        when(() => mockFiveDayForecastUseCase(any(), any()))
            .thenAnswer((_) async => const Result.success([]));

        await provider.getFiveDayForecast(tLat, tLong);

        expect(provider.isLoading, false);
        expect(provider.errorMessage, null);
      });

      test('should set fiveDayForecast on successful call', () async {
        final forecastData = [
          ForecastWeatherResponseEntity(
            weather: const ForecastWeatherEntity(
              main: 'Rain',
              description: 'light rain',
            ),
            main: const MainInfoEntity(
                temp: 15.0,
                feelsLike: 15.0,
                tempMin: 15.0,
                tempMax: 15.0,
                humidity: 90),
            wind: const ForecastWindEntity(speed: 5, deg: 270, gust: 10),
            date: faker.date.toString(),
          ),
        ];

        when(() => mockFiveDayForecastUseCase(any(), any()))
            .thenAnswer((_) async => Result.success(forecastData));

        await provider.getFiveDayForecast(tLat, tLong);

        expect(provider.fiveDayForecast, forecastData);
      });

      test('should set errorMessage on failure call', () async {
        when(() => mockFiveDayForecastUseCase(any(), any()))
            .thenAnswer((_) async => Result.failure(TestFailure()));

        await provider.getFiveDayForecast(tLat, tLong);

        expect(provider.errorMessage, 'Erro ao buscar previsão do tempo.');
      });
    });
  });
}
