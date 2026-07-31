import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0B0A1A);
  static const Color surface = Color(0xFF15132B);
  static const Color surfaceAlt = Color(0xFF1B1836);

  static const Color primary = Color(0xFF8B5CF6);
  static const Color primaryDark = Color(0xFF6D28D9);
  static const Color primaryLight = Color(0xFFA78BFA);

  static const Color gradientStart = Color(0xFF7C3AED);
  static const Color gradientEnd = Color(0xFFC026D3);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textTertiary = Color(0xFF6B7280);

  static const Color border = Color(0xFF2A2743);
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFFBBF24);
  static const Color googleButtonBg = Color(0xFFFFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );

  static const RadialGradient orbGlow = RadialGradient(
    colors: [gradientEnd, gradientStart, Colors.transparent],
    stops: [0.0, 0.5, 1.0],
  );
}
