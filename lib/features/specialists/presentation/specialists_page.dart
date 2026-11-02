import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../core/widgets/asset_photo.dart';
import '../../../core/widgets/page_section.dart';
import '../../../core/widgets/responsive_grid.dart';
import '../../../core/widgets/site_scaffold.dart';
import '../../salon/data/demo_data.dart';

class SpecialistsPage extends StatelessWidget {
  const SpecialistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      child: PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Наши мастера', style: AppTheme.display(40)),
            const SizedBox(height: 32),
            ResponsiveGrid(
              mobileColumns: 2,
              tabletColumns: 3,
              desktopColumns: 4,
              children: [
                for (final s in DemoData.specialists)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AssetPhoto(
                        path: s.photo,
                        label: 'Фото мастера',
                        height: 300,
                      ),
                      const SizedBox(height: 12),
                      Text(s.name, style: AppTheme.display(24)),
                      const SizedBox(height: 4),
                      Text(
                        s.specialization,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.inkSoft,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
