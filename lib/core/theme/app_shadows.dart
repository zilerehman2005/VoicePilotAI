import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  AppShadows._();

  static final List<BoxShadow> glow = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.35),
      blurRadius: 24,
      spreadRadius: 2,
    ),
  ];

  static final List<BoxShadow> card = [
    const BoxShadow(
      color: Colors.black45,
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];
}
