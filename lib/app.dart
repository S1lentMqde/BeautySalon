import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'theme/app_theme.dart';
import 'core/widgets/desktop_frame.dart';

/// Корневой виджет приложения.
class BeautySalonApp extends ConsumerWidget {
  const BeautySalonApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Мээрим Айтиева — Салон красоты',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
      builder: (context, child) {
        final media = MediaQuery.of(context);
        return MediaQuery(
          // Общий масштаб интерфейса: 0.88 = на 12% мельче.
          data: media.copyWith(textScaler: const TextScaler.linear(0.88)),
          child: DesktopFrame(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}
