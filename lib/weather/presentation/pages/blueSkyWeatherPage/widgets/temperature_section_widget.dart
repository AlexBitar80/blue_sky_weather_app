import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class TemperatureSection extends StatelessWidget {
  final WeatherProvider provider;

  const TemperatureSection({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12.0,
        ),
        Text(
          '${provider.weatherData?.name}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  WeatherIcons.day_sunny,
                  color: Colors.yellow,
                  size: 32,
                ),
                const SizedBox(width: 10),
                Text(
                  '${provider.weatherData?.main.temp.toStringAsFixed(0)}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Max: ${provider.weatherData?.main.tempMax.toStringAsFixed(0)}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 100.0,
                  child: Divider(
                    thickness: 1.4,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Min: ${provider.weatherData?.main.tempMin.toStringAsFixed(0)}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
