import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

/// Settings row with leading icon, title, optional trailing value and chevron.
class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    this.icon,
    this.value,
    this.trailing,
    this.showChevron = true,
    this.onTap,
  });

  final String title;
  final IconData? icon;
  final String? value;
  final Widget? trailing;
  final bool showChevron;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: AppColors.border),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
            ],
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailing != null) ...[
              trailing!,
            ] else ...[
              if (value != null) ...[
                Text(value!, style: AppTypography.bodyMedium),
                const SizedBox(width: AppSpacing.xs),
              ],
              if (showChevron)
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppColors.textTertiary,
                ),
            ],
          ],
        ),
      ),
    );
  }
}
