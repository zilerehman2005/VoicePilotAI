import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../states/loading_indicator.dart';

/// Filled secondary action button for alternate calls to action.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final bool disabled = !isEnabled || isLoading || onPressed == null;

    return SizedBox(
      width: double.infinity,
      child: Opacity(
        opacity: disabled ? 0.4 : 1,
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            textStyle: AppTypography.button,
          ),
          child: isLoading
              ? const AppLoadingIndicator(size: 18)
              : Text(label, style: AppTypography.button),
        ),
      ),
    );
  }
}
