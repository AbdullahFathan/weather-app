import 'package:flutter/material.dart';

import 'package:weather_app/config/gen/image_resources.dart';
import 'package:weather_app/utils/widget/image_load.dart';

class ErorStateWidget extends StatelessWidget {
  final String? image;
  final String? textEror;
  final TextStyle? textStyle;
  const ErorStateWidget({
    super.key,
    this.image,
    this.textEror,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageLoad(
            src: image ?? appImages.imgEmpty.path,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              textEror ?? "SomeThing Went Wrong",
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
