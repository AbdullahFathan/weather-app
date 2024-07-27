import 'package:flutter/material.dart';
import 'package:weather_app/config/themes/resources/app_color.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  const LoadingWidget({
    super.key,
    this.color = AppColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
