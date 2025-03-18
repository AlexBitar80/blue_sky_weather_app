import 'package:blue_sky/routes/routes.dart';
import 'package:blue_sky/weather/presentation/pages/pages.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:provider/provider.dart';
import 'shared/service_locator.dart';
import 'weather/presentation/pages/weatherPage/main_weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configureLocator();
  await initializeDateFormatting('pt_BR', null);

  runApp(const MyApp());
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
          body: MainWeatherPage(),
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
