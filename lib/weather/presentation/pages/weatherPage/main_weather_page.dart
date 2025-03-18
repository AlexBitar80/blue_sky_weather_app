import 'package:blue_sky/weather/presentation/pages/blueSkySearchLocationPage/bluesky_search_location_page.dart';
import 'package:blue_sky/weather/presentation/pages/blueSkyWeatherPage/blue_sky_weather_page.dart';
import 'package:flutter/material.dart';

class MainWeatherPage extends StatefulWidget {
  const MainWeatherPage({
    super.key,
  });

  @override
  State<MainWeatherPage> createState() => _MainWeatherPageState();
}

class _MainWeatherPageState extends State<MainWeatherPage> {
  int currentPage = 0;

  List<Widget> pages = [
    const BlueSkyWeatherPage(),
    const BlueSkySearchLocationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue[300],
            ),
            icon: const Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.blue[300],
            ),
            icon: const Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}
