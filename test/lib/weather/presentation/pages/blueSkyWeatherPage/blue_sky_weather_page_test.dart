import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_weather_response_entity.dart';
import 'package:blue_sky/weather/domain/entities/forecast_wind_entity.dart';
import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/blue_sky_weather_page.dart';
import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/widgets/hourly_forecast_widget.dart';
import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/widgets/weekly_forecast_widget.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockWeatherProvider extends Mock implements WeatherProvider {}

void main() {
  group('BlueSkyWeatherPage UI Tests', () {
    late MockWeatherProvider mockProvider;

    setUp(() {
      mockProvider = MockWeatherProvider();
    });

    Widget createWidgetUnderTest() {
      return ChangeNotifierProvider<WeatherProvider>(
        create: (_) => mockProvider,
        child: const MaterialApp(
          home: BlueSkyWeatherPage(),
        ),
      );
    }

    testWidgets('Should display CircularProgressIndicator when loading',
        (WidgetTester tester) async {
      when(() => mockProvider.isLoading).thenReturn(true);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'Should display TemperatureSection, HourlyForecast, and WeeklyForecast when not loading',
        (WidgetTester tester) async {
      when(() => mockProvider.isLoading).thenReturn(false);
      when(() => mockProvider.weatherData).thenReturn(
        const WeatherResponseEntity(
          weather: WeatherEntity(main: 'Clouds', description: 'broken clouds'),
          main: MainInfoEntity(
            temp: 25.0,
            feelsLike: 26.0,
            tempMin: 24.0,
            tempMax: 27.0,
            humidity: 60,
          ),
          wind: WindEntity(speed: 5.0, deg: 180.0),
          name: 'Test City',
        ),
      );
      when(() => mockProvider.fiveDayForecast).thenReturn([
        ForecastWeatherResponseEntity(
          weather: const ForecastWeatherEntity(
              main: 'Rain', description: 'light rain'),
          main: const MainInfoEntity(
              temp: 20.0,
              feelsLike: 19.0,
              tempMin: 19.0,
              tempMax: 22.0,
              humidity: 80),
          wind: const ForecastWindEntity(speed: 3.0, deg: 270.0, gust: 5.0),
          date: DateTime.now().toString(),
        ),
      ]);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('temperature_section')), findsOneWidget);
      expect(find.byType(HourlyForecastWidget), findsOneWidget);
      expect(find.byType(WeeklyForecastWidget), findsOneWidget);
    });

    testWidgets('Should call getWeather and getFiveDayForecast on initState',
        (WidgetTester tester) async {
      when(() => mockProvider.isLoading).thenReturn(false);
      when(() => mockProvider.weatherData).thenReturn(
        const WeatherResponseEntity(
          weather: WeatherEntity(main: 'Clouds', description: 'broken clouds'),
          main: MainInfoEntity(
              temp: 25.0,
              feelsLike: 26.0,
              tempMin: 24.0,
              tempMax: 27.0,
              humidity: 60),
          wind: WindEntity(speed: 5.0, deg: 180.0),
          name: 'Test City',
        ),
      );
      when(() => mockProvider.fiveDayForecast).thenReturn([
        ForecastWeatherResponseEntity(
          weather: const ForecastWeatherEntity(
              main: 'Rain', description: 'light rain'),
          main: const MainInfoEntity(
              temp: 20.0,
              feelsLike: 19.0,
              tempMin: 19.0,
              tempMax: 22.0,
              humidity: 80),
          wind: const ForecastWindEntity(speed: 3.0, deg: 270.0, gust: 5.0),
          date: DateTime.now().toString(),
        ),
      ]);
      when(() => mockProvider.getWeather(any(), any()))
          .thenAnswer((_) async {});
      when(() => mockProvider.getFiveDayForecast(any(), any()))
          .thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      verify(() => mockProvider.getWeather(-1.455, -48.503)).called(1);
      verify(() => mockProvider.getFiveDayForecast(-1.455, -48.503)).called(1);
    });
  });
}
