import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../shared/widgets/misc/section_header.dart';

/// Slider with a label above and min/mid/max captions below.
class LabeledSlider extends StatelessWidget {
  const LabeledSlider({
    super.key,
    required this.label,
    required this.value,
    required this.minLabel,
    required this.midLabel,
    required this.maxLabel,
    required this.onChanged,
    this.min = 0.5,
    this.max = 1.5,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final String minLabel;
  final String midLabel;
  final String maxLabel;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
          child: SectionHeader(title: label),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withValues(alpha: 0.2),
          ),
          child: Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Row(
            children: [
              Expanded(
                child: Text(minLabel, style: AppTypography.caption),
              ),
              Expanded(
                child: Text(
                  midLabel,
                  style: AppTypography.caption,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  maxLabel,
                  style: AppTypography.caption,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
      ],
    );
  }
}
