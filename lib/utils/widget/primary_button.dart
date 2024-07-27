import 'package:flutter/material.dart';

import 'package:weather_app/config/themes/resources/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 48,
    this.witdh = double.infinity,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.buttonColor,
    this.elevation = 0,
    this.radiusValue = 8,
    this.borderWidth = 1.5,
  });

  final double borderWidth;
  final Color? buttonColor;
  final double? elevation;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double height;
  final void Function() onPressed;
  final double radiusValue;
  final String? text;
  final Color? textColor;
  final double witdh;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: witdh,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: buttonColor ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusValue),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
