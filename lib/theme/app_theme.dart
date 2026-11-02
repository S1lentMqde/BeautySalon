import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  /// Заголовочный шрифт с засечками.
  /// Заголовки: строгий и плотный стиль в духе Apple.
  static TextStyle display(double size, {Color color = AppColors.ink}) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w600,
      letterSpacing: -size * 0.02,
      color: color,
      height: 1.15,
    );
  }

  static ThemeData light() {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.accent,
          onPrimary: Colors.white,
          surface: AppColors.background,
          onSurface: AppColors.ink,
          outline: AppColors.border,
        );
    final base = ThemeData(useMaterial3: true, colorScheme: scheme);
    // Build text theme manually using GoogleFonts.inter to avoid type conflicts
    // between google_fonts' TextTheme and Flutter's TextTheme
    final textTheme = base.textTheme.copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: base.textTheme.displayLarge?.fontSize ?? 57,
        fontWeight: base.textTheme.displayLarge?.fontWeight,
        color: AppColors.ink,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: base.textTheme.displayMedium?.fontSize ?? 45,
        fontWeight: base.textTheme.displayMedium?.fontWeight,
        color: AppColors.ink,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: base.textTheme.displaySmall?.fontSize ?? 36,
        fontWeight: base.textTheme.displaySmall?.fontWeight,
        color: AppColors.ink,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: base.textTheme.headlineLarge?.fontSize ?? 32,
        fontWeight: base.textTheme.headlineLarge?.fontWeight,
        color: AppColors.ink,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: base.textTheme.headlineMedium?.fontSize ?? 28,
        fontWeight: base.textTheme.headlineMedium?.fontWeight,
        color: AppColors.ink,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: base.textTheme.headlineSmall?.fontSize ?? 24,
        fontWeight: base.textTheme.headlineSmall?.fontWeight,
        color: AppColors.ink,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: base.textTheme.titleLarge?.fontSize ?? 22,
        fontWeight: base.textTheme.titleLarge?.fontWeight,
        color: AppColors.ink,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: base.textTheme.titleMedium?.fontSize ?? 16,
        fontWeight: base.textTheme.titleMedium?.fontWeight,
        color: AppColors.ink,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: base.textTheme.titleSmall?.fontSize ?? 14,
        fontWeight: base.textTheme.titleSmall?.fontWeight,
        color: AppColors.ink,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: base.textTheme.bodyLarge?.fontSize ?? 16,
        fontWeight: base.textTheme.bodyLarge?.fontWeight,
        color: AppColors.ink,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: base.textTheme.bodyMedium?.fontSize ?? 14,
        fontWeight: base.textTheme.bodyMedium?.fontWeight,
        color: AppColors.ink,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: base.textTheme.bodySmall?.fontSize ?? 12,
        fontWeight: base.textTheme.bodySmall?.fontWeight,
        color: AppColors.ink,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: base.textTheme.labelLarge?.fontSize ?? 14,
        fontWeight: base.textTheme.labelLarge?.fontWeight,
        color: AppColors.ink,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: base.textTheme.labelMedium?.fontSize ?? 12,
        fontWeight: base.textTheme.labelMedium?.fontWeight,
        color: AppColors.ink,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: base.textTheme.labelSmall?.fontSize ?? 11,
        fontWeight: base.textTheme.labelSmall?.fontWeight,
        color: AppColors.ink,
      ),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          minimumSize: const Size(48, 52),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          minimumSize: const Size(48, 52),
          shape: const StadiumBorder(),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.ink),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
      ),
    );
  }
}
