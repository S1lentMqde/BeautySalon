import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import 'content_container.dart';
import 'site_footer.dart';
import 'site_header.dart';

/// Каркас страниц: закреплённая чёрная шапка, содержимое с прокруткой,
/// подвал и меню, плавно опускающееся на 70% высоты экрана.
class SiteScaffold extends StatefulWidget {
  const SiteScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<SiteScaffold> createState() => _SiteScaffoldState();
}

class _SiteScaffoldState extends State<SiteScaffold> {
  static const _barHeight = 56.0;
  static const _duration = Duration(milliseconds: 380);

  bool _open = false;

  void _toggle() => setState(() => _open = !_open);

  void _close() {
    if (_open) setState(() => _open = false);
  }

  @override
  Widget build(BuildContext context) {
    final headerHeight = _barHeight + MediaQuery.paddingOf(context).top;
    final panelHeight = MediaQuery.sizeOf(context).height * 0.7;

    return Scaffold(
      body: Stack(
        children: [
          // Содержимое страницы. Сверху отступ под шапку.
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: headerHeight),
              child: Column(children: [widget.child, const SiteFooter()]),
            ),
          ),
          // Затемнение под меню. Нажатие по нему закрывает меню.
          Positioned.fill(
            child: IgnorePointer(
              ignoring: !_open,
              child: GestureDetector(
                onTap: _close,
                child: AnimatedOpacity(
                  opacity: _open ? 1 : 0,
                  duration: _duration,
                  child: const ColoredBox(color: Color(0x66000000)),
                ),
              ),
            ),
          ),
          // Меню: плавно опускается сверху, 70% высоты экрана.
          AnimatedPositioned(
            duration: _duration,
            curve: Curves.easeOutCubic,
            top: _open ? 0 : -panelHeight,
            left: 0,
            right: 0,
            height: panelHeight,
            child: _MenuPanel(topInset: headerHeight, onClose: _close),
          ),
          // Шапка всегда поверх всего.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
            child: SiteHeader(menuOpen: _open, onMenuTap: _toggle),
          ),
        ],
      ),
    );
  }
}

class _MenuPanel extends StatelessWidget {
  const _MenuPanel({required this.topInset, required this.onClose});

  final double topInset;
  final VoidCallback onClose;

  void _go(BuildContext context, String path) {
    onClose();
    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.telegrey,
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: topInset + 12, bottom: 24),
        child: ContentContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final item in navItems)
                InkWell(
                  onTap: () => _go(context, item.path),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(item.label, style: AppTheme.display(17)),
                  ),
                ),
              const SizedBox(height: 16),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppColors.ink),
                onPressed: () => _go(context, '/services'),
                child: const Text('Записаться онлайн'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
