import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../core/widgets/content_container.dart';
import '../../../core/widgets/site_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _register = false;

  static final _phoneRegExp = RegExp(r'^\+?[0-9\s\-]{9,15}$');

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Данные заполнены верно. Настоящий вход будет подключён '
          'на этапе 6 (Supabase).',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      child: ContentContainer(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _register ? 'Регистрация' : 'Вход',
                    style: AppTheme.display(40),
                  ),
                  const SizedBox(height: 24),
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(value: false, label: Text('Вход')),
                      ButtonSegment(value: true, label: Text('Регистрация')),
                    ],
                    selected: {_register},
                    onSelectionChanged: (s) =>
                        setState(() => _register = s.first),
                  ),
                  const SizedBox(height: 24),
                  if (_register) ...[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Имя'),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Введите имя'
                          : null,
                    ),
                    const SizedBox(height: 16),
                  ],
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Номер телефона',
                    ),
                    validator: (v) => _phoneRegExp.hasMatch((v ?? '').trim())
                        ? null
                        : 'Введите корректный номер телефона',
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Пароль'),
                    validator: (v) => (v == null || v.length < 6)
                        ? 'Минимум 6 символов'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _submit,
                    child: Text(_register ? 'Зарегистрироваться' : 'Войти'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
