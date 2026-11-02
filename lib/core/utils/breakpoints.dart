import 'package:flutter/widgets.dart';

enum ScreenSize { mobile, tablet, desktop }

abstract final class Breakpoints {
  static const double tablet = 700;
  static const double desktop = 1100;
  static const double maxContent = 1200;

  /// Меню-«бургер» вместо ряда кнопок на узких окнах.
  static bool isCompactNav(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1000;

  static ScreenSize of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= desktop) return ScreenSize.desktop;
    if (width >= tablet) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }
}
