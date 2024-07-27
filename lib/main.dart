import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/config/themes/app_theme.dart';
import 'package:weather_app/features/home/views/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const HomePage(),
    );
  }
}
