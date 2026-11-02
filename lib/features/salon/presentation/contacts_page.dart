import 'package:flutter/material.dart';

import '../../../core/config/salon_info.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../core/utils/launch_link.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/page_section.dart';
import '../../../core/widgets/responsive_grid.dart';
import '../../../core/widgets/site_scaffold.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  String? _link(String value, String Function(String) build) =>
      value.isEmpty ? null : build(value);

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      child: PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Контакты', style: AppTheme.display(40)),
            const SizedBox(height: 12),
            const Text(
              'Свяжитесь с нами удобным способом.',
              style: TextStyle(color: AppColors.inkSoft),
            ),
            const SizedBox(height: 32),
            ResponsiveGrid(
              mobileColumns: 1,
              tabletColumns: 2,
              desktopColumns: 4,
              children: [
                _ContactCard(
                  icon: Icons.phone_outlined,
                  title: 'Позвонить',
                  subtitle: SalonInfo.phone,
                  onTap: () => openLink(
                    context,
                    _link(SalonInfo.phoneDial, (v) => 'tel:$v'),
                  ),
                ),
                _ContactCard(
                  icon: Icons.chat_outlined,
                  title: 'WhatsApp',
                  subtitle: 'Написать сообщение',
                  onTap: () => openLink(
                    context,
                    _link(SalonInfo.whatsapp, (v) => 'https://wa.me/$v'),
                  ),
                ),
                _ContactCard(
                  icon: Icons.camera_alt_outlined,
                  title: 'Instagram',
                  subtitle: 'Наши работы',
                  onTap: () =>
                      openLink(context, _link(SalonInfo.instagram, (v) => v)),
                ),
                _ContactCard(
                  icon: Icons.directions_outlined,
                  title: 'Построить маршрут',
                  subtitle: SalonInfo.address,
                  onTap: () =>
                      openLink(context, _link(SalonInfo.mapUrl, (v) => v)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Адрес', style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text(SalonInfo.address),
                  SizedBox(height: 16),
                  Text(
                    'Часы работы',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(SalonInfo.hours),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.accent, size: 28),
          const SizedBox(height: 12),
          Text(title, style: AppTheme.display(22)),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: AppColors.inkSoft),
          ),
        ],
      ),
    );
  }
}
