import 'package:flutter/material.dart';

import '../config/salon_info.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import 'content_container.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: AppColors.sand, height: 1.6);
    return ColoredBox(
      color: AppColors.ink,
      child: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Wrap(
            spacing: 48,
            runSpacing: 24,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SalonInfo.name,
                    style: AppTheme.display(28, color: Colors.white),
                  ),
                  const Text(SalonInfo.address, style: style),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(SalonInfo.phone, style: style),
                  Text(SalonInfo.hours, style: style),
                ],
              ),
              const Text('WhatsApp · Instagram', style: style),
            ],
          ),
        ),
      ),
    );
  }
}
