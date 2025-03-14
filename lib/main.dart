import 'package:blue_sky/routes/routes.dart';
import 'package:blue_sky/weather/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: BlueSkyOnboardingPage(),
      ),
      routes: {
        AppRoutes.watherOnboarding: (context) => const BlueSkyOnboardingPage(),
      },
    );
  }
}
