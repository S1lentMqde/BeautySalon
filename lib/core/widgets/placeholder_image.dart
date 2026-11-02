import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Заглушка вместо фотографии, пока нет реальных изображений.
class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({super.key, required this.label, this.height = 260});

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, color: Color(0xFF6B5F52)),
      ),
    );
  }
}
