import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/config/themes/app_theme.dart';
import 'package:weather_app/features/home/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/views/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  await Hive.openBox('weatherBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(GetWeatherData()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeClass.lightTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const HomePage(),
      ),
    );
  }
}
