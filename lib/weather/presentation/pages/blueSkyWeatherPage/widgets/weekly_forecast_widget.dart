import 'package:blue_sky/shared/get_weather_icon.dart';
import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/widgets/Weekly_Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../../../shared/week_day_to_string.dart';
import '../../../providers/weather_provider.dart';

class WeeklyForecastWidget extends StatelessWidget {
  final WeatherProvider provider;

  const WeeklyForecastWidget({
    required this.provider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: provider.fiveDayForecast?.length ?? 0,
        itemBuilder: (context, index) {
          final weather = provider.fiveDayForecast![index];

          return Column(
            children: [
              WeeklyItemWidget(
                day: WeekDayConverter.weekDayToString(weather.date.weekday),
                icon: GetWeatherIcon.getWeatherIcon(weather.weather.main),
                tempHigh: '${weather.main.tempMax.toStringAsFixed(0)}°',
                tempLow: '${weather.main.tempMin.toStringAsFixed(0)}°',
                humidity: '${weather.main.humidity}%',
                humidityIcon: WeatherIcons.humidity,
                windSpeed: '${weather.wind.speed} km/h',
                windSpeedIcon: WeatherIcons.strong_wind,
              ),
            ],
          );
        },
      ),
    );
  }
}
