import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class GetWeatherIcon {
  static IconData getWeatherIcon(String weather) {
    switch (weather.toLowerCase()) {
      case 'clear':
        return WeatherIcons.day_sunny;
      case 'clouds':
        return WeatherIcons.cloudy;
      case 'rain':
        return WeatherIcons.rain;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'snow':
        return WeatherIcons.snow;
      case 'mist':
      case 'fog':
        return WeatherIcons.fog;
      default:
        return WeatherIcons.cloud;
    }
  }
}