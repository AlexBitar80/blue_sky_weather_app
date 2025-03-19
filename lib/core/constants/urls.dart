import '../../blue_sky.dart';

class Urls extends Endpoints {
  @override
  String get getWeaherForecastByCityName => '';

  @override
  String get getWeaherForecastByLatLong =>
      'https://api.openweathermap.org/data/2.5/forecast';

  @override
  String get getWeatherByCityName =>
      'https://api.openweathermap.org/data/2.5/weather';

  @override
  String get getWeatherByLatLong =>
      'https://api.openweathermap.org/data/2.5/weather';
}
