import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/widget/shimer_loading.dart';

enum ShapeImage { oval, react, circle }

class ImageLoad extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final VoidCallback? onTapImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool enablePreview;
  final bool isAsset;
  final Color? color;
  final String? previewTitle;
  final TextStyle? previewTitleStyle;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final ShapeImage shapeImage;
  final Alignment alignment;

  const ImageLoad({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.onTapImage,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.enablePreview = false,
    this.isAsset = false,
    this.color,
    this.previewTitle,
    this.previewTitleStyle,
    this.errorWidget,
    this.loadingWidget,
    this.shapeImage = ShapeImage.react,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    if (shapeImage == ShapeImage.circle) {
      assert(
        height != null && width != null,
        "Height and Width cannot be null if shapeImage is ShapeImage.circle, ",
      );
    }

    return _determineShapeImage();
  }

  Widget _determineShapeImage() {
    switch (shapeImage) {
      case ShapeImage.circle:
        return ClipRRect(
          borderRadius: BorderRadius.circular(height! / 2),
          child: _determineImageWidget(),
        );
      case ShapeImage.oval:
        return ClipOval(child: _determineImageWidget());
      case ShapeImage.react:
        return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: _determineImageWidget(),
        );
      default:
        return _determineImageWidget();
    }
  }

  Widget _determineImageWidget() {
    final isFromRemote = src.startsWith('http');
    final isSvg = src.endsWith('svg');
    final isAssets = isAsset ||
        src.startsWith('lib/resources/') ||
        src.startsWith('assets/');

    if (isSvg) {
      return SvgPicture.asset(
        src,
        width: width,
        height: height,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit,
        alignment: alignment,
      );
    } else if (isFromRemote) {
      return CachedNetworkImage(
        imageUrl: src,
        color: color,
        fit: fit,
        width: width,
        height: height,
        alignment: alignment,
        placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: loadingWidget ??
              ShimmerLoading(
                child: ShimmerItem(
                  height: height ?? 48,
                  width: width ?? 68,
                ),
              ),
        ),
        errorWidget: (context, url, error) {
          debugPrint('Error load network image $url $error');
          return SizedBox(
            height: height,
            width: width,
            child: errorWidget ?? const Icon(Icons.error),
          );
        },
      );
    } else if (isAssets) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error load asset image $error');
          return SizedBox(
            height: height,
            width: width,
            child: errorWidget ?? const Icon(Icons.error),
          );
        },
      );
    } else {
      return Image.file(
        File(src),
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error load file image $error');
          return SizedBox(
            height: height,
            width: width,
            child: errorWidget ?? const Icon(Icons.error),
          );
        },
      );
    }
  }
}
