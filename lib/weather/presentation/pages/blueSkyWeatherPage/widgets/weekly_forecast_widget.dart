import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/widgets/Weekly_Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeeklyForecastWidget extends StatelessWidget {
  const WeeklyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          WeeklyItemWidget(
            day: "Today",
            icon: WeatherIcons.day_sunny,
            tempHigh: "29°",
            tempLow: "16°",
            humidity: "50%",
            humidityIcon: WeatherIcons.humidity,
            windSpeed: "5 km/h",
            windSpeedIcon: WeatherIcons.strong_wind,
          ),
          SizedBox(height: 8),
          WeeklyItemWidget(
            day: "Thu",
            icon: WeatherIcons.cloudy,
            tempHigh: "31°",
            tempLow: "19°",
            humidity: "60%",
            humidityIcon: WeatherIcons.humidity,
            windSpeed: "10 km/h",
            windSpeedIcon: WeatherIcons.strong_wind,
          ),
          SizedBox(height: 8),
          WeeklyItemWidget(
            day: "Fri",
            icon: WeatherIcons.rain,
            tempHigh: "28°",
            tempLow: "15°",
            humidity: "70%",
            humidityIcon: WeatherIcons.humidity,
            windSpeed: "15 km/h",
            windSpeedIcon: WeatherIcons.strong_wind,
          ),
          SizedBox(height: 8),
          WeeklyItemWidget(
            day: "Sat",
            icon: WeatherIcons.storm_showers,
            tempHigh: "26°",
            tempLow: "15°",
            humidity: "80%",
            humidityIcon: WeatherIcons.humidity,
            windSpeed: "15 km/h",
            windSpeedIcon: WeatherIcons.strong_wind,
          ),
          SizedBox(height: 8),
          WeeklyItemWidget(
            day: "Sun",
            icon: WeatherIcons.snow,
            tempHigh: "23°",
            tempLow: "14°",
            humidity: "90%",
            humidityIcon: WeatherIcons.humidity,
            windSpeed: "15 km/h",
            windSpeedIcon: WeatherIcons.strong_wind,
          ),
          SizedBox(height: 8),
          WeeklyItemWidget(
            day: "Mon",
            icon: WeatherIcons.fog,
            tempHigh: "22°",
            tempLow: "13°",
            humidity: "95%",
            humidityIcon: WeatherIcons.humidity,
            windSpeed: "15 km/h",
            windSpeedIcon: WeatherIcons.strong_wind,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
