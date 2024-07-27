import 'package:flutter/material.dart';
import 'package:weather_app/features/home/views/widget/weather_card.dart';
import 'package:weather_app/utils/widget/appbar.dart';

class HomePage extends StatelessWidget {
  static const String route = '/homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(text: "Weather App"),
      body: ListView.separated(
        itemCount: 8,
        itemBuilder: (context, index) {
          return const WeatherCard();
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2.5,
          );
        },
      ),
    );
  }
}
