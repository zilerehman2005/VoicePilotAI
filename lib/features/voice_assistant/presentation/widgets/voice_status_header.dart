import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Header widget displaying back action and status title for Voice Assistant.
class VoiceStatusHeader extends StatelessWidget {
  const VoiceStatusHeader({
    super.key,
    required this.statusText,
    this.onBackTap,
  });

  final String statusText;
  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap ?? () => Navigator.of(context).pop(),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ),
        ),
        Expanded(
          child: Text(
            statusText,
            style: AppTypography.h2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 40), // Spacer for center alignment balance
      ],
    );
  }
}
