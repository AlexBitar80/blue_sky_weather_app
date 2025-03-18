import 'package:blue_sky/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_icons/weather_icons.dart';

void main() {
  group('GetWeatherIcon', () {
    test('should return day_sunny for clear weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('clear');
      expect(icon, WeatherIcons.day_sunny);
    });

    test('should return cloudy for clouds weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('clouds');
      expect(icon, WeatherIcons.cloudy);
    });

    test('should return rain for rain weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('rain');
      expect(icon, WeatherIcons.rain);
    });

    test('should return thunderstorm for thunderstorm weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('thunderstorm');
      expect(icon, WeatherIcons.thunderstorm);
    });

    test('should return snow for snow weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('snow');
      expect(icon, WeatherIcons.snow);
    });

    test('should return fog for mist weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('mist');
      expect(icon, WeatherIcons.fog);
    });

    test('should return fog for fog weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('fog');
      expect(icon, WeatherIcons.fog);
    });

    test('should return cloud for unknown weather', () {
      final icon = GetWeatherIcon.getWeatherIcon('unknown');
      expect(icon, WeatherIcons.cloud);
    });

    test('should be case-insensitive', () {
      final icon = GetWeatherIcon.getWeatherIcon('CLOUDS');
      expect(icon, WeatherIcons.cloudy);
    });
  });
}
