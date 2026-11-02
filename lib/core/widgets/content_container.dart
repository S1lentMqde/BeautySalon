import 'package:flutter/material.dart';

import '../utils/breakpoints.dart';

/// Центрирует содержимое и ограничивает ширину на больших экранах.
class ContentContainer extends StatelessWidget {
  const ContentContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.of(context) == ScreenSize.mobile;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Breakpoints.maxContent),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 32),
          child: child,
        ),
      ),
    );
  }
}
