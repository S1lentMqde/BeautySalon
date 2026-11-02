import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFFFFFFFF);
  static const sand = Color(0xFFF5F5F7); // светло-серый фон карточек и секций
  static const beige = Color(0xFFE8E8ED); // заглушки фото
  static const border = Color(0xFFE8E8ED);
  static const ink = Color(0xFF1D1D1F);
  static const inkSoft = Color(0xFF6E6E73);
  static const accent = Color.fromRGBO(
    110,
    110,
    110,
    0.612,
  ); // фирменный приглушённый розовый
  static const accentDark = Color.fromARGB(255, 100, 100, 100);
  static const telegrey = Color.fromARGB(
    255,
    225,
    225,
    225,
  ); // RAL 7045 Telegrey 1 (приблизительно)
  static const surface = Colors.white;
}
