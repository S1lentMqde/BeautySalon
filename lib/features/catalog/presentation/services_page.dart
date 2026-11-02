import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../core/widgets/page_section.dart';
import '../../../core/widgets/responsive_grid.dart';
import '../../../core/widgets/site_scaffold.dart';
import '../../salon/data/demo_data.dart';
import 'service_card.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  String? _category;

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.accent,
      backgroundColor: AppColors.surface,
      showCheckmark: false,
      labelStyle: TextStyle(color: selected ? Colors.white : AppColors.ink),
      side: const BorderSide(color: AppColors.border),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = DemoData.services
        .where((s) => _category == null || s.category == _category)
        .toList();

    return SiteScaffold(
      child: PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Услуги', style: AppTheme.display(40)),
            const SizedBox(height: 12),
            const Text(
              'Стоимость уточняйте у администратора.',
              style: TextStyle(color: AppColors.inkSoft),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _chip(
                  'Все',
                  _category == null,
                  () => setState(() => _category = null),
                ),
                for (final c in DemoData.categories)
                  _chip(c, _category == c, () => setState(() => _category = c)),
              ],
            ),
            const SizedBox(height: 32),
            ResponsiveGrid(
              mobileColumns: 1,
              tabletColumns: 2,
              desktopColumns: 3,
              children: [for (final s in items) ServiceCard(service: s)],
            ),
          ],
        ),
      ),
    );
  }
}
