import 'package:flutter/material.dart';
import 'package:weather_app/config/themes/resources/app_color.dart';

// ignore: non_constant_identifier_names
void KShowSnackBar({
  required BuildContext context,
  required String text,
  Color? textColor,
  Color? bgColor,
}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: TextStyle(
        color: textColor ?? AppColor.whiteColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: bgColor ?? AppColor.primaryColor,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 20,
      left: 20,
      right: 20,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
