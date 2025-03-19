import 'package:get_it/get_it.dart';
import '../blue_sky.dart';

final getIt = GetIt.instance;

void configureLocator() {
  // Data sources

  getIt.registerLazySingleton<GetWeatherDataSource>(
    () => GetWeatherDataSourceImpl(),
  );

  getIt.registerLazySingleton<FiveDayForecastDataSource>(
    () => FiveDayForecastDataSourceImpl(),
  );

  getIt.registerLazySingleton<GetWeatherByCityNameDataSource>(
    () => GetWeatherByCityNameDataSourceImpl(),
  );

  // Repositories

  getIt.registerLazySingleton<GetWeatherRepository>(
    () => GetWeatherRepositoryImpl(
      getWeatherDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetWeatherByCityNameRepository>(
    () => GetWeatherByCityNameRepositoryImpl(
      getWeatherByCityNameDataSource: getIt(),
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

  getIt.registerLazySingleton<GetWeatherByCityNameUseCase>(
    () => GetWeatherByCityNameUseCaseImpl(
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
      getWeatherByCityNameUseCase: getIt(),
    ),
  );
}
