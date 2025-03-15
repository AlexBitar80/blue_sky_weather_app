import 'package:blue_sky/weather/data/datasources/five_day_forecast_datasource.dart';
import 'package:blue_sky/weather/data/datasources/get_weather_datasource.dart';
import 'package:blue_sky/weather/data/repositories/get_weather_repository_impl.dart';
import 'package:blue_sky/weather/domain/repositories/repositories.dart';
import 'package:blue_sky/weather/domain/usecases/usecases.dart';
import 'package:blue_sky/weather/presentation/providers/providers.dart';
import 'package:get_it/get_it.dart';

import '../weather/data/repositories/five_day_forecast_repository_impl.dart';
import '../weather/domain/repositories/five_day_forecast_repository.dart';
import '../weather/domain/usecases/five_day_forecast_usecase.dart';

final getIt = GetIt.instance;

void configureLocator() {
  // Data sources

  getIt.registerLazySingleton<GetWeatherDataSource>(
    () => GetWeatherDataSourceImpl(),
  );

  getIt.registerLazySingleton<FiveDayForecastDataSource>(
    () => FiveDayForecastDataSourceImpl(),
  );

  // Repositories

  getIt.registerLazySingleton<GetWeatherRepository>(
    () => GetWeatherRepositoryImpl(
      getWeatherDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<FiveDayForecastRepository>(
    () => FiveDayForecastRepositoryImpl(
      fiveDayForecastDataSource: getIt(),
    ),
  );

  // Use cases

  getIt.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherByLatLongUseCaseImpl(
      getWeatherRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FiveDayForecastUseCase>(
    () => FiveDayForecastUseCaseImpl(
      fiveDayForecastRepository: getIt(),
    ),
  );

  // Providers

  getIt.registerFactory<WeatherProvider>(
    () => WeatherProvider(
      getWeatherUseCase: getIt(),
      fiveDayForecastUseCase: getIt(),
    ),
  );
}
