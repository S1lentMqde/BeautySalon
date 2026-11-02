import 'package:flutter/material.dart';

import '../utils/breakpoints.dart';
import 'content_container.dart';

/// Секция страницы на всю ширину с необязательным фоном.
class PageSection extends StatelessWidget {
  const PageSection({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.of(context) == ScreenSize.mobile;
    return ColoredBox(
      color: color ?? Colors.transparent,
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mobile ? 40 : 72),
          child: child,
        ),
      ),
    );
  }
}
