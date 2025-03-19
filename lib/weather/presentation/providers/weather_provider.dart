// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import '../../../blue_sky.dart';

class WeatherProvider extends ChangeNotifier {
  final GetWeatherUseCase getWeatherUseCase;
  final FiveDayForecastUseCase fiveDayForecastUseCase;
  final GetWeatherByCityNameUseCase getWeatherByCityNameUseCase;

  WeatherResponseEntity? _weatherData;
  List<ForecastWeatherResponseEntity>? _fiveDayForecast;
  bool _isLoading = false;
  String? _errorMessage;

  WeatherResponseEntity? get weatherData => _weatherData;
  List<ForecastWeatherResponseEntity>? get fiveDayForecast => _fiveDayForecast;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final List<String> _favoriteCities = [];
  final Map<String, WeatherResponseModel> _cityWeather = {};

  List<String> get favoriteCities => _favoriteCities;
  Map<String, WeatherResponseModel> get cityWeather => _cityWeather;

  WeatherProvider({
    required this.getWeatherUseCase,
    required this.fiveDayForecastUseCase,
    required this.getWeatherByCityNameUseCase,
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

  Future<void> removeFavoriteCity(String cityName) async {
    _favoriteCities.remove(cityName);
    _cityWeather.remove(cityName);
    await DbUtil.removeCity(cityName);
    updateCityWeather();
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

  Future<void> loadFavoriteCities() async {
    _favoriteCities.clear();
    final cities = await DbUtil.getCities();
    for (var city in cities) {
      if (!_favoriteCities.contains(city)) {
        _favoriteCities.add(city);
      }
    }
    updateCityWeather();
  }

  Future<void> updateCityWeather() async {
    for (var city in _favoriteCities) {
      if (!_cityWeather.containsKey(city)) {
        try {
          final result = await getWeatherByCityNameUseCase(city);

          result.when(
            success: (weather) {
              _cityWeather[city] = GetWeatherMapper.toEntity(weather);
              notifyListeners();
            },
            failure: (error) {
              print('Error fetching weather for $city: $error');
            },
          );
        } catch (e) {
          print('Error fetching weather for $city: $e');
        }
      }
    }
  }

  Future<void> searchCity(String cityName) async {
    try {
      final result = await getWeatherByCityNameUseCase(cityName);

      result.when(
        success: (weather) {
          _cityWeather[cityName] = GetWeatherMapper.toEntity(weather);
          if (!_favoriteCities.contains(cityName)) {
            _favoriteCities.add(cityName);
            DbUtil.insertCity(cityName);
            updateCityWeather();
          }
          notifyListeners();
        },
        failure: (error) {
          print('Error searching for $cityName: $error');
        },
      );
    } catch (e) {
      print('Error searching for $cityName: $e');
    }
  }
}
