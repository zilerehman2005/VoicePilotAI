import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/ai/ai_orb.dart';

/// App logo mark built from the reusable idle AI orb.
class AppLogoMark extends StatelessWidget {
  const AppLogoMark({super.key, this.size = 220});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AiOrb(state: AiOrbState.idle, size: size),
          Container(
            width: size * 0.28,
            height: size * 0.28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface.withOpacity(0.35),
              border: Border.all(color: AppColors.primaryLight.withOpacity(0.15)),
            ),
            child: const _WaveformGlyph(),
          ),
        ],
      ),
    );
  }
}

class _WaveformGlyph extends StatelessWidget {
  const _WaveformGlyph();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(7, (index) {
            final double height = [10.0, 18.0, 26.0, 34.0, 26.0, 18.0, 10.0][index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs / 2),
              child: Container(
                width: 4,
                height: height,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.35),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
