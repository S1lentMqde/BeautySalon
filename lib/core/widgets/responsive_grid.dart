import 'package:flutter/material.dart';

import '../utils/breakpoints.dart';

/// Сетка с разным числом колонок для телефона, планшета и компьютера.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 4,
    this.spacing = 24,
  });

  final List<Widget> children;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final columns = switch (Breakpoints.of(context)) {
      ScreenSize.mobile => mobileColumns,
      ScreenSize.tablet => tabletColumns,
      ScreenSize.desktop => desktopColumns,
    };
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final child in children)
              SizedBox(width: itemWidth, child: child),
          ],
        );
      },
    );
  }
}
