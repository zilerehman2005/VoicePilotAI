import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../states/loading_indicator.dart';

/// Full-width primary action button with loading and disabled states.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.compact = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final bool disabled = !isEnabled || isLoading || onPressed == null;

    return SizedBox(
      width: compact ? null : double.infinity,
      child: Opacity(
        opacity: disabled ? 0.4 : 1,
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            padding: compact
                ? const EdgeInsets.all(AppSpacing.md)
                : const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.md,
                  ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                compact ? AppRadius.pill : AppRadius.md,
              ),
            ),
            textStyle: AppTypography.button,
            minimumSize: compact ? const Size(48, 48) : null,
          ),
          child: isLoading
              ? const AppLoadingIndicator(size: 18)
              : compact
                  ? Icon(icon ?? Icons.arrow_forward_rounded, size: 22)
                  : Text(label, style: AppTypography.button),
        ),
      ),
    );
  }
}
