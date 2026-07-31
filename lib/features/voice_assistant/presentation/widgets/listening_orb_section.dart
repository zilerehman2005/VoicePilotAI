import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/ai/ai_orb.dart';
import '../../../../shared/widgets/ai/voice_waveform.dart';

/// Central section displaying the listening AiOrb, live transcript preview, and waveform.
class ListeningOrbSection extends StatelessWidget {
  const ListeningOrbSection({
    super.key,
    required this.transcript,
    this.orbSize = 220,
  });

  final String transcript;
  final double orbSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AiOrb(
          state: AiOrbState.listening,
          size: orbSize,
        ),
        const SizedBox(height: AppSpacing.xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            '"$transcript"',
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const VoiceWaveform(
          barCount: 9,
          height: 28,
        ),
      ],
    );
  }
}
