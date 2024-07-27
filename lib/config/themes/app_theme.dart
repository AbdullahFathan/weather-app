import 'package:flutter/material.dart';
import 'package:weather_app/config/themes/resources/app_color.dart';
import 'package:weather_app/config/themes/resources/app_input_style.dart';
import 'package:weather_app/config/themes/resources/app_text.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    textTheme: TextClass.textTheme,
    scaffoldBackgroundColor: AppColor.whiteColor,
    inputDecorationTheme: InputDecorationStyle.inputDecoration(),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColor.primaryColor,
          secondary: AppColor.secondaryColor,
        ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      color: Colors.white,
      elevation: 0,
    ),
  );
}
