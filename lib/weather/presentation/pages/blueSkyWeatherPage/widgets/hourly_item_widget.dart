import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class HourlyItemWidget extends StatelessWidget {
  final String hour;
  final IconData icon;
  final Color colorIcon;
  final String humidity;
  final String wind;

  const HourlyItemWidget({
    super.key,
    required this.hour,
    required this.icon,
    required this.colorIcon,
    required this.humidity,
    required this.wind,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Column(
        children: [
          Text(hour, style: const TextStyle(color: Colors.black)),
          const Spacer(),
          Icon(
            icon,
            color: colorIcon,
            size: 18.0,
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                WeatherIcons.humidity,
                color: Colors.lightBlue,
                size: 15.0,
              ),
              const SizedBox(height: 5),
              Text(
                humidity,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Icon(
                WeatherIcons.strong_wind,
                color: Colors.lightBlue,
                size: 15.0,
              ),
              const SizedBox(height: 5),
              Text(
                wind,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
