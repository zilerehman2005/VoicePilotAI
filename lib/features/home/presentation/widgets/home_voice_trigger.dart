import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/ai/ai_orb.dart';

/// Central voice trigger section featuring the animated idle AI Orb.
class HomeVoiceTrigger extends StatelessWidget {
  const HomeVoiceTrigger({
    super.key,
    this.onTap,
    this.caption = 'Tap to Speak',
    this.orbSize = 180,
  });

  final VoidCallback? onTap;
  final String caption;
  final double orbSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // TODO: Navigate to Voice Assistant screen
          },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: orbSize,
            height: orbSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AiOrb(
                  state: AiOrbState.idle,
                  size: orbSize,
                ),
                Container(
                  width: orbSize * 0.44,
                  height: orbSize * 0.44,
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.mic_rounded,
                      color: AppColors.textPrimary,
                      size: orbSize * 0.22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            caption,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
