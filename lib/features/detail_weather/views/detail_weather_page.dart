import 'package:flutter/material.dart';

class DetailWeatherPage extends StatelessWidget {
  static const String route = '/DetailWeatherPage';
  const DetailWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Detail Weather Page"),
      ),
    );
  }
}
