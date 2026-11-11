import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class OutfitImage extends StatelessWidget {
  final String value;
  final BoxFit fit;
  final double? width;
  final double? height;
  const OutfitImage({super.key, required this.value, this.fit = BoxFit.cover,
    this.width, this.height});

  @override
  Widget build(BuildContext context) {
    Widget fallback(BuildContext _, Object __, StackTrace? ___) =>
        const ColoredBox(color: AppColors.canvas,
          child: Icon(Icons.checkroom_outlined, color: AppColors.main));
    if (value.startsWith('data:image/')) {
      return Image.memory(base64Decode(value.split(',').last), width: width,
        height: height, fit: fit, errorBuilder: fallback);
    }
    if (value.startsWith('http') || value.startsWith('blob:')) {
      return Image.network(value, width: width, height: height, fit: fit,
        errorBuilder: fallback);
    }
    if (kIsWeb) return fallback(context, '', null);
    return Image.file(File(value), width: width, height: height, fit: fit,
      errorBuilder: fallback);
  }
}
