import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/widgets/temperature_section_widget.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/hourly_forecast_widget.dart';

import 'widgets/weekly_forecast_widget.dart';

class BlueSkyWeatherPage extends StatefulWidget {
  const BlueSkyWeatherPage({super.key});

  @override
  State<BlueSkyWeatherPage> createState() => _BlueSkyWeatherPageState();
}

class _BlueSkyWeatherPageState extends State<BlueSkyWeatherPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().getWeather(-1.455, -48.503);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().getFiveDayForecast(-1.455, -48.503);
    });
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
                          TemperatureSection(provider: provider),
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
