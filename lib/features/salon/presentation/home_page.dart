import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/salon_info.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../core/utils/breakpoints.dart';
import '../../../core/widgets/asset_photo.dart';
import '../../../core/widgets/page_section.dart';
import '../../../core/widgets/responsive_grid.dart';
import '../../../core/widgets/site_scaffold.dart';
import '../../catalog/presentation/service_card.dart';
import '../data/demo_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteScaffold(
      child: Column(
        children: [_Banner(), _ServicesSection(), _SpecialistsSection()],
      ),
    );
  }
}

/// Баннер: фото на фоне, слева название салона и слоган.
/// Фото кладётся в assets/banner/banner.jpg
/// Баннер на весь первый экран под шапкой.
/// Фото: assets/banner/banner.jpg, размер 1024x1535 (вертикальное, 2:3).
///
/// Телефон: фото на весь баннер, текст внизу слева.
/// Компьютер: фото целиком справа, без обрезки, текст слева на тёмном фоне.
class _Banner extends StatelessWidget {
  const _Banner();

  static const _headerBar = 56.0; // высота шапки, как в site_scaffold.dart
  static const _photoRatio = 1024 / 1535;
  static const _dark = Color(0xFF1D1D1F);

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.of(context) == ScreenSize.mobile;
    final headerHeight = _headerBar + MediaQuery.paddingOf(context).top;
    final height = (MediaQuery.sizeOf(context).height - headerHeight)
        .clamp(480.0, 1100.0)
        .toDouble();

    final photo = Image.asset(
      'assets/banner/banner.jpg',
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
    );

    if (mobile) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ColoredBox(color: _dark),
            photo,
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xCC000000), Color(0x00000000)],
                  stops: [0, 0.6],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 40),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: _BannerText(mobile: true),
              ),
            ),
          ],
        ),
      );
    }

    final photoWidth = height * _photoRatio;
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: _dark)),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: photoWidth,
            child: Stack(
              fit: StackFit.expand,
              children: [
                photo,
                // Плавный переход фото в тёмный фон слева.
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [_dark, Color(0x001D1D1F)],
                      stops: [0, 0.3],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 64),
              child: Align(
                alignment: Alignment.centerLeft,
                child: _BannerText(mobile: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerText extends StatelessWidget {
  const _BannerText({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SalonInfo.name.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: mobile ? 26 : 46,
              fontWeight: FontWeight.w700,
              letterSpacing: mobile ? 2 : 4,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Красота без спешки, запись за минуту',
            style: TextStyle(
              color: Color(0xE6FFFFFF),
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 28),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.ink,
            ),
            onPressed: () => context.go('/services'),
            child: const Text('Записаться онлайн'),
          ),
        ],
      ),
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection();

  @override
  Widget build(BuildContext context) {
    return PageSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text('Популярные услуги', style: AppTheme.display(40)),
              ),
              TextButton(
                onPressed: () => context.go('/services'),
                child: const Text('Все услуги'),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            mobileColumns: 1,
            tabletColumns: 2,
            desktopColumns: 2,
            children: [
              for (final s in DemoData.popularServices) ServiceCard(service: s),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpecialistsSection extends StatelessWidget {
  const _SpecialistsSection();

  @override
  Widget build(BuildContext context) {
    return PageSection(
      color: AppColors.sand,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Наши мастера', style: AppTheme.display(40)),
          const SizedBox(height: 32),
          ResponsiveGrid(
            mobileColumns: 2,
            children: [
              for (final s in DemoData.specialists.take(4))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AssetPhoto(path: s.photo, label: 'Фото мастера'),
                    const SizedBox(height: 12),
                    Text(s.name, style: AppTheme.display(22)),
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
    );
  }
}
