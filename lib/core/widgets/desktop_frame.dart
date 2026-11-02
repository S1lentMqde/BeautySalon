import 'dart:math' as math;

import 'package:flutter/material.dart';

/// На компьютере показывает сайт центрированной колонкой с гранями по бокам.
/// На узких экранах (телефон, планшет) ничего не меняет.
class DesktopFrame extends StatelessWidget {
  const DesktopFrame({super.key, required this.child});

  final Widget child;

  static const double _minWidth = 1000; // ниже этого грани не показываем
  static const double _maxFrameWidth = 1280;
  static const double _sideGap = 96; // минимум серого фона по бокам

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    if (width < _minWidth) return child;

    final frameWidth = math.min(_maxFrameWidth, width - _sideGap);

    return ColoredBox(
      color: const Color(0xFFEDEDF0), // фон за гранями
      child: Center(
        child: Container(
          width: frameWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(
              vertical: BorderSide(color: Color(0xFFD2D2D7)),
            ),
            boxShadow: [BoxShadow(color: Color(0x14000000), blurRadius: 24)],
          ),
          // Внутри колонки страницы считают размер по её ширине, а не окна.
          child: MediaQuery(
            data: media.copyWith(size: Size(frameWidth, media.size.height)),
            child: ClipRect(child: child),
          ),
        ),
      ),
    );
  }
}
