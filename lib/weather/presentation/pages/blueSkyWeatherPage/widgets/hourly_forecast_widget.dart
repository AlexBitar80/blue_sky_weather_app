import 'package:blue_sky/shared/get_weather_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/week_day_to_string.dart';
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
      height: 180.0,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
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
            hour: StringFormatter.hourFormatter(weather.date),
            colorIcon: Colors.blue,
            icon: GetWeatherIcon.getWeatherIcon(weather.weather.main),
          );
        },
      ),
    );
  }
}
