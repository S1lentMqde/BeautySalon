import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Открывает ссылку (tel:, https:). Если контакт не указан, показывает сообщение.
Future<void> openLink(BuildContext context, String? url) async {
  final messenger = ScaffoldMessenger.of(context);
  if (url == null || url.isEmpty) {
    messenger.showSnackBar(
      const SnackBar(content: Text('Этот контакт пока не указан')),
    );
    return;
  }
  try {
    final ok = await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
    if (!ok) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Не удалось открыть ссылку')),
      );
    }
  } catch (_) {
    messenger.showSnackBar(
      const SnackBar(content: Text('Не удалось открыть ссылку')),
    );
  }
}
