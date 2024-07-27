import 'package:flutter/material.dart';
import 'package:weather_app/config/themes/resources/app_color.dart';

class TextClass {
  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.blackColor,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColor.blackColor,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColor.blackColor,
      fontSize: 12,
    ),
  );
}
