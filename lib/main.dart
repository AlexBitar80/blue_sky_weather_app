import 'package:blue_sky/routes/routes.dart';
import 'package:blue_sky/weather/presentation/pages/pages.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'shared/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configureLocator();
  runApp(const MyApp());

  // WeatherFactory weatherFactory = WeatherFactory(
  //   '97fbe6f5b0106150917b72eb50750204',
  // );

  // List<Weather> forecast =
  //     await weatherFactory.fiveDayForecastByLocation(-1.455, -48.503);
  // print(forecast);
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<WeatherProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: BlueSkyOnboardingPage(),
        ),
        routes: {
          AppRoutes.watherOnboarding: (context) =>
              const BlueSkyOnboardingPage(),
          AppRoutes.weatherHome: (context) => const BlueSkyWeatherPage(),
        },
      ),
    );
  }
}
