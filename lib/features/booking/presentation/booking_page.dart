import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/content_container.dart';
import '../../../core/widgets/site_scaffold.dart';

/// Демо-экран выбора времени. Занятость пока условная, не из базы данных.
class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Рабочее время (можно менять): с 10:00 до 20:00, шаг 30 минут.
  static const _openHour = 10;
  static const _closeHour = 20;
  static const _daysCount = 7;

  late final List<String> _times = _buildTimes();
  late final List<DateTime> _days;
  int _dayIndex = 0;
  String? _time;

  static List<String> _buildTimes() {
    final result = <String>[];
    for (var h = _openHour; h <= _closeHour; h++) {
      final hh = h.toString().padLeft(2, '0');
      result.add('$hh:00');
      if (h < _closeHour) result.add('$hh:30');
    }
    return result;
  }

  /// Условная занятость для демонстрации.
  bool _isBusy(int dayIndex, int timeIndex) =>
      (timeIndex * 3 + dayIndex * 2) % 7 == 0;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _days = List.generate(
      _daysCount,
      (i) => DateTime(today.year, today.month, today.day + i),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      child: ContentContainer(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Выберите время', style: AppTheme.display(34)),
                const SizedBox(height: 20),
                AppCard(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Перманентный макияж бровей',
                              style: AppTheme.display(20),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Имя мастера',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.inkSoft,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Цена по запросу',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.inkSoft,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    for (var i = 0; i < _days.length; i++) ...[
                      if (i > 0) const SizedBox(width: 6),
                      Expanded(
                        child: _Choice(
                          height: 72,
                          selected: i == _dayIndex,
                          onTap: () => setState(() {
                            _dayIndex = i;
                            _time = null;
                          }),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('E', 'ru').format(_days[i]),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${_days[i].day}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.4,
                  children: [
                    for (var i = 0; i < _times.length; i++)
                      _Choice(
                        selected: _times[i] == _time,
                        disabled: _isBusy(_dayIndex, i),
                        onTap: () => setState(() => _time = _times[i]),
                        child: Text(_times[i]),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Демо: зачёркнутое время условно занято. Настоящие '
                  'свободные слоты будет считать сервер.',
                  style: TextStyle(fontSize: 13, color: AppColors.inkSoft),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.go('/services'),
                        child: const Text('Назад'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: FilledButton(
                        onPressed: _time == null ? null : () {},
                        child: const Text('Далее'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.selected,
    required this.onTap,
    required this.child,
    this.disabled = false,
    this.height,
  });

  final bool selected;
  final bool disabled;
  final VoidCallback onTap;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(14);
    final foreground = selected
        ? Colors.white
        : disabled
        ? const Color(0xFF8E8E93)
        : AppColors.ink;

    return Material(
      color: selected ? AppColors.accent : AppColors.sand,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: disabled ? null : onTap,
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: foreground,
              decoration: disabled ? TextDecoration.lineThrough : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
