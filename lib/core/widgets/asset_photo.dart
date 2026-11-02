import 'package:flutter/material.dart';

import 'placeholder_image.dart';

class AssetPhoto extends StatelessWidget {
  const AssetPhoto({
    super.key,
    required this.path,
    required this.label,
    this.height = 260,
  });

  final String path;
  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        path,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            PlaceholderImage(label: label, height: height),
      ),
    );
  }
}
