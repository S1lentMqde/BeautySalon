import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import 'page_section.dart';
import 'site_scaffold.dart';

/// Временная страница для разделов, которые появятся на следующих этапах.
class StubPage extends StatelessWidget {
  const StubPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      child: PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.display(40)),
            const SizedBox(height: 12),
            const Text(
              'Этот раздел появится на одном из следующих этапов.',
              style: TextStyle(color: AppColors.inkSoft),
            ),
          ],
        ),
      ),
    );
  }
}
