import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/salon_info.dart';
import '../../theme/app_theme.dart';
import 'content_container.dart';

class NavItem {
  const NavItem(this.label, this.path);
  final String label;
  final String path;
}

const navItems = [
  NavItem('Услуги', '/services'),
  NavItem('Мастера', '/specialists'),
  NavItem('Обучающие курсы', '/courses'),
  NavItem('Контакты', '/contacts'),
  NavItem('Войти', '/login'),
];

/// Чёрная верхняя панель: название салона слева, три линии справа.
class SiteHeader extends StatelessWidget {
  const SiteHeader({
    super.key,
    required this.menuOpen,
    required this.onMenuTap,
  });

  final bool menuOpen;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        bottom: false,
        child: ContentContainer(
          child: Row(
            children: [
              InkWell(
                onTap: () => context.go('/'),
                child: Text(
                  SalonInfo.name,
                  style: AppTheme.display(22, color: Colors.white),
                ),
              ),
              const Spacer(),
              IconButton(
                tooltip: menuOpen ? 'Закрыть меню' : 'Меню',
                onPressed: onMenuTap,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    menuOpen ? Icons.close : Icons.menu,
                    key: ValueKey(menuOpen),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
