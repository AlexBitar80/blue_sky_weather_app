import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../providers/weather_provider.dart';
import 'hourly_item_widget.dart';

class HourlyForecastWidget extends StatelessWidget {
  final WeatherProvider provider;

  const HourlyForecastWidget({
    required this.provider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: provider.fiveDayForecast?.length ?? 0,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final weather = provider.fiveDayForecast![index];

          return HourlyItemWidget(
            wind: '${weather.wind.speed} km/h',
            humidity: '${weather.main.humidity}%',
            hour: '',
            colorIcon: Colors.blue,
            icon: _getWeatherIcon(weather.weather.main),
          );
        },
      ),
    );
  }

  IconData _getWeatherIcon(String main) {
    switch (main.toLowerCase()) {
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
        return WeatherIcons.cloud; // Ícone genérico
    }
  }
}
