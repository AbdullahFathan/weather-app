import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  const PrimaryAppBar({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        text,
        style: textStyle ??
            const TextStyle(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
