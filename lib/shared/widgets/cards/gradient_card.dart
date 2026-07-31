import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_spacing.dart';

/// Rounded glowing card used for highlighted content blocks.
class GradientCard extends StatelessWidget {
  const GradientCard({
    super.key,
    required this.child,
    this.useRadialGlow = false,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
  });

  final Widget child;
  final bool useRadialGlow;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        gradient: useRadialGlow
            ? const RadialGradient(
                colors: [
                  AppColors.gradientEnd,
                  AppColors.gradientStart,
                  AppColors.surface,
                ],
                stops: [0, 0.45, 1],
              )
            : AppColors.primaryGradient,
        boxShadow: AppShadows.glow,
      ),
      child: child,
    );
  }
}
