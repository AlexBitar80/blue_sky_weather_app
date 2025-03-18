// ignore_for_file: use_build_context_synchronously

import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/widgets/temperature_section_widget.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../shared/geolocator_service.dart';
import 'widgets/hourly_forecast_widget.dart';

import 'widgets/weekly_forecast_widget.dart';

class BlueSkyWeatherPage extends StatefulWidget {
  const BlueSkyWeatherPage({
    super.key,
  });

  @override
  State<BlueSkyWeatherPage> createState() => _BlueSkyWeatherPageState();
}

class _BlueSkyWeatherPageState extends State<BlueSkyWeatherPage> {
  final _geolocatorService = GeolocatorService();
  @override
  void initState() {
    super.initState();

    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final position = await _geolocatorService.getCurrentLocation(context);
    if (position != null) {
      context
          .read<WeatherProvider>()
          .getWeather(position.latitude, position.longitude);
      context
          .read<WeatherProvider>()
          .getFiveDayForecast(position.latitude, position.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          TemperatureSection(
                            provider: provider,
                          ),
                          const SizedBox(height: 20),
                          HourlyForecastWidget(provider: provider),
                          const SizedBox(height: 20),
                          WeeklyForecastWidget(
                            provider: provider,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
