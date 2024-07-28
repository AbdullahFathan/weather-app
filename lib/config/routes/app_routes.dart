import 'package:flutter/material.dart';
import 'package:weather_app/features/detail_weather/views/detail_weather_page.dart';
import 'package:weather_app/features/home/views/home_page.dart';
import 'package:weather_app/models/weather.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case DetailWeatherPage.route:
        return MaterialPageRoute(
            builder: (context) => DetailWeatherPage(
                  item: settings.arguments as Weather,
                ));

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('404 Page'),
                  ),
                ));
    }
  }
}
