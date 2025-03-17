import 'package:blue_sky/weather/domain/entities/entities.dart';
import 'package:blue_sky/weather/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/forecast_weather_response_entity.dart';
import '../../domain/usecases/five_day_forecast_usecase.dart';

class WeatherProvider extends ChangeNotifier {
  final GetWeatherUseCase getWeatherUseCase;
  final FiveDayForecastUseCase fiveDayForecastUseCase;
  WeatherResponseEntity? _weatherData;
  List<ForecastWeatherResponseEntity>? _fiveDayForecast;
  bool _isLoading = false;
  String? _errorMessage;

  WeatherResponseEntity? get weatherData => _weatherData;
  List<ForecastWeatherResponseEntity>? get fiveDayForecast => _fiveDayForecast;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  WeatherProvider({
    required this.getWeatherUseCase,
    required this.fiveDayForecastUseCase,
  });

  Future<void> getWeather(double lat, double long) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await getWeatherUseCase(lat, long);

    _isLoading = false;
    result.when(
      success: (data) {
        _weatherData = data;
      },
      failure: (error) {
        _errorMessage = "Erro ao buscar clima.";
      },
    );

    notifyListeners();
  }

  Future<void> getFiveDayForecast(double lat, double long) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await fiveDayForecastUseCase(lat, long);

    _isLoading = false;
    result.when(
      success: (data) {
        _fiveDayForecast = data;
      },
      failure: (error) {
        _errorMessage = "Erro ao buscar previsão do tempo.";
      },
    );

    notifyListeners();
  }
}
