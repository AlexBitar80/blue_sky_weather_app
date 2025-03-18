import 'package:blue_sky/shared/shared.dart';
import 'package:blue_sky/weather/data/datasources/five_day_forecast_datasource.dart';
import 'package:blue_sky/weather/data/datasources/get_weather_datasource.dart';
import 'package:blue_sky/weather/data/repositories/five_day_forecast_repository_impl.dart';
import 'package:blue_sky/weather/data/repositories/get_weather_repository_impl.dart';
import 'package:blue_sky/weather/domain/repositories/five_day_forecast_repository.dart';
import 'package:blue_sky/weather/domain/repositories/get_weather_repository.dart';
import 'package:blue_sky/weather/domain/usecases/five_day_forecast_usecase.dart';
import 'package:blue_sky/weather/domain/usecases/usecases.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWeatherDataSource extends Mock implements GetWeatherDataSource {}

class MockFiveDayForecastDataSource extends Mock
    implements FiveDayForecastDataSource {}

class MockGetWeatherRepository extends Mock implements GetWeatherRepository {}

class MockFiveDayForecastRepository extends Mock
    implements FiveDayForecastRepository {}

class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {}

class MockFiveDayForecastUseCase extends Mock
    implements FiveDayForecastUseCase {}

void main() {
  group('configureLocator', () {
    late GetIt getIt;

    setUp(() {
      getIt = GetIt.instance;

      getIt.reset();
    });

    test('should register all dependencies correctly', () {
      configureLocator();

      expect(getIt<GetWeatherDataSource>(), isA<GetWeatherDataSourceImpl>());
      expect(
        getIt<FiveDayForecastDataSource>(),
        isA<FiveDayForecastDataSourceImpl>(),
      );
      expect(getIt<GetWeatherRepository>(), isA<GetWeatherRepositoryImpl>());
      expect(getIt<FiveDayForecastRepository>(),
          isA<FiveDayForecastRepositoryImpl>());
      expect(getIt<GetWeatherUseCase>(), isA<GetWeatherByLatLongUseCaseImpl>());
      expect(
          getIt<FiveDayForecastUseCase>(), isA<FiveDayForecastUseCaseImpl>());
      expect(getIt<WeatherProvider>(), isA<WeatherProvider>());

      final getWeatherRepository = getIt<GetWeatherRepository>();
      expect(getWeatherRepository, isA<GetWeatherRepositoryImpl>());

      final fiveDayForecastRepository = getIt<FiveDayForecastRepository>();
      expect(fiveDayForecastRepository, isA<FiveDayForecastRepositoryImpl>());

      final getWeatherUseCase = getIt<GetWeatherUseCase>();
      expect(getWeatherUseCase, isA<GetWeatherByLatLongUseCaseImpl>());

      final fiveDayForecastUseCase = getIt<FiveDayForecastUseCase>();
      expect(fiveDayForecastUseCase, isA<FiveDayForecastUseCaseImpl>());

      final weatherProvider = getIt<WeatherProvider>();
      expect(weatherProvider, isA<WeatherProvider>());
    });
  });
}
