import 'dart:convert';

import 'package:flutter/material.dart';

class AvatarMemoryImage extends StatelessWidget {
  final String imageData;
  final BoxFit fit;

  const AvatarMemoryImage({
    super.key,
    required this.imageData,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final base64String = imageData.split(',').last;

    return Center(
      child: Image.memory(
        base64Decode(base64String),
        fit: fit,
        gaplessPlayback: true,
      ),
    );
  }
}
