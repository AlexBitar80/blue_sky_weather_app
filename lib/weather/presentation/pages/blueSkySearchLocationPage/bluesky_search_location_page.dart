import 'package:blue_sky/weather/presentation/providers/weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlueSkySearchLocationPage extends StatefulWidget {
  const BlueSkySearchLocationPage({
    super.key,
  });

  @override
  State<BlueSkySearchLocationPage> createState() =>
      _BlueSkySearchLocationPageState();
}

class _BlueSkySearchLocationPageState extends State<BlueSkySearchLocationPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().loadFavoriteCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text(
          'Buscar localização',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Consumer<WeatherProvider>(builder: (
        context,
        provider,
        child,
      ) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SizedBox(
                height: 44.0,
                child: CupertinoTextField(
                  placeholder: 'Buscar por cidade',
                  controller: _searchController,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onSubmitted: (_) {
                    context
                        .read<WeatherProvider>()
                        .searchCity(_searchController.text);
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                  },
                  onEditingComplete: () {
                    context
                        .read<WeatherProvider>()
                        .searchCity(_searchController.text);
                    _searchController.clear();
                  },
                ),
              ),
            ),
            Expanded(
              child: Consumer<WeatherProvider>(
                builder: (context, provider, child) {
                  return provider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.favoriteCities.length,
                          itemBuilder: (context, index) {
                            final cityName = provider.favoriteCities[index];
                            final weather = provider.cityWeather[cityName];
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 20.0,
                              ),
                              child: Container(
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Dismissible(
                                  onDismissed: (_) {
                                    context
                                        .read<WeatherProvider>()
                                        .removeFavoriteCity(cityName);
                                  },
                                  key: Key(cityName),
                                  child: ListTile(
                                    title: Text(
                                      cityName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    trailing: Text(
                                      '${weather?.main.temp.toStringAsFixed(1)}°C',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
