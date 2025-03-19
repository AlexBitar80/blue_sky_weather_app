import 'package:blue_sky/routes/routes.dart';
import 'package:blue_sky/weather/presentation/pages/pages.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    Future<bool> isFirstTime() async {
      final prefs = await SharedPreferences.getInstance();
      final isFirst = prefs.getBool('first_time') ?? true;

      if (isFirst) {
        await prefs.setBool('first_time', false);
      }

      return isFirst;
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<WeatherProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: FutureBuilder<bool>(
          future: isFirstTime(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              final firstTime = snapshot.data ?? true;
              return firstTime
                  ? const BlueSkyOnboardingPage()
                  : const MainWeatherPage();
            }
          },
        ),
        routes: {
          AppRoutes.watherOnboarding: (context) =>
              const BlueSkyOnboardingPage(),
          AppRoutes.weatherHome: (context) => const BlueSkyWeatherPage(),
          AppRoutes.weatherMainPage: (context) => const MainWeatherPage(),
        },
      ),
    );
  }
}
