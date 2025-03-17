import 'package:blue_sky/routes/routes.dart';
import 'package:blue_sky/weather/presentation/pages/pages.dart';
import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'shared/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configureLocator();
  initializeDateFormatting('pt_Br', null).then((_) => runApp(const MyApp()));
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
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("pt", "BR")],
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
