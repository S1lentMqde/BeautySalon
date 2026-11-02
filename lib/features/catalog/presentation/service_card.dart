import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../core/widgets/app_card.dart';
import '../../salon/data/demo_data.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});

  final DemoService service;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => context.go('/booking'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            service.category,
            style: const TextStyle(fontSize: 13, color: AppColors.accent),
          ),
          const SizedBox(height: 8),
          Text(service.name, style: AppTheme.display(22)),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Цена по запросу',
                  style: TextStyle(color: AppColors.inkSoft),
                ),
              ),
              Icon(Icons.arrow_forward, size: 20, color: AppColors.ink),
            ],
          ),
        ],
      ),
    );
  }
}
